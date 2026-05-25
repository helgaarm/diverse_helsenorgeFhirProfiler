param(
    [string]$Path = "input/fsh",
    [int]$DebounceMilliseconds = 800
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$watchPath = Join-Path $root $Path
if (-not (Test-Path $watchPath)) {
    throw "Watch path '$Path' does not exist."
}

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $watchPath
$watcher.Filter = "*.fsh"
$watcher.IncludeSubdirectories = $true
$watcher.NotifyFilter = [System.IO.NotifyFilters]'FileName, LastWrite, Size'
$watcher.EnableRaisingEvents = $true

$script:lastRun = Get-Date "2000-01-01"
$script:isRunning = $false
$script:pending = $false

function Invoke-SushiBuild {
    if ($script:isRunning) {
        $script:pending = $true
        return
    }

    $now = Get-Date
    if (($now - $script:lastRun).TotalMilliseconds -lt $DebounceMilliseconds) {
        $script:pending = $true
        return
    }

    $script:isRunning = $true
    $script:lastRun = $now

    try {
        Write-Host ""
        Write-Host "FSH change detected. Running SUSHI..."
        & "$PSScriptRoot\build-sushi.ps1"
        if ($LASTEXITCODE -ne 0) {
            Write-Host "SUSHI build failed with exit code $LASTEXITCODE." -ForegroundColor Red
        }
    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
    finally {
        $script:isRunning = $false
    }

    if ($script:pending) {
        $script:pending = $false
        Start-Sleep -Milliseconds $DebounceMilliseconds
        Invoke-SushiBuild
    }
}

$subscriptions = @(
    Register-ObjectEvent -InputObject $watcher -EventName Changed -SourceIdentifier "FshChanged"
    Register-ObjectEvent -InputObject $watcher -EventName Created -SourceIdentifier "FshCreated"
    Register-ObjectEvent -InputObject $watcher -EventName Renamed -SourceIdentifier "FshRenamed"
    Register-ObjectEvent -InputObject $watcher -EventName Deleted -SourceIdentifier "FshDeleted"
)

Write-Host "Watching $Path/**/*.fsh for changes. Press Ctrl+C to stop."
Invoke-SushiBuild

try {
    while ($true) {
        $event = Wait-Event -Timeout 1
        if ($event) {
            $changedPath = $event.SourceEventArgs.FullPath
            Remove-Event -EventIdentifier $event.EventIdentifier

            if ($changedPath -like "*.fsh") {
                Invoke-SushiBuild
            }
        }
    }
}
finally {
    foreach ($subscription in $subscriptions) {
        Unregister-Event -SubscriptionId $subscription.Id -ErrorAction SilentlyContinue
    }
    $watcher.Dispose()
}
