param(
    [string]$ResourcesPath = "fsh-generated/resources",
    [string]$PackageId = "no.nhn.fhir.helsenorge.profiles",
    [string]$PackageVersion = "0.1.0",
    [switch]$IncludeImplementationGuide
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$fhirCommand = Get-Command fhir -ErrorAction SilentlyContinue
if (-not $fhirCommand) {
    $dotnetToolCommand = Join-Path $env:USERPROFILE ".dotnet\tools\fhir.exe"
    if (Test-Path $dotnetToolCommand) {
        $fhirCommand = $dotnetToolCommand
    }
}

if (-not $fhirCommand) {
    throw "Firely Terminal command 'fhir' was not found on PATH or in %USERPROFILE%\.dotnet\tools. Install Firely Terminal and restart the shell."
}

if (-not (Test-Path $ResourcesPath)) {
    throw "Resources path '$ResourcesPath' does not exist. Run scripts/build-sushi.ps1 first."
}

$jsonFiles = Get-ChildItem -Path $ResourcesPath -Filter "*.json" -File
if ($jsonFiles.Count -eq 0) {
    throw "No JSON resources found in '$ResourcesPath'. Run scripts/build-sushi.ps1 first."
}

Write-Host "Validating generated JSON resources with Firely Terminal..."
Write-Host "Resources: $ResourcesPath"

$validationRoot = Join-Path $root ".firely-validation"
$validationResources = Join-Path $validationRoot "resources"

if (Test-Path $validationRoot) {
    Remove-Item -LiteralPath $validationRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $validationResources | Out-Null
foreach ($file in $jsonFiles) {
    $json = Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json
    if (-not $IncludeImplementationGuide -and $json.resourceType -eq "ImplementationGuide") {
        Write-Host "Skipping generated ImplementationGuide metadata. Use -IncludeImplementationGuide to validate it."
        continue
    }

    Copy-Item -LiteralPath $file.FullName -Destination $validationResources -Force
}

Push-Location $validationRoot
try {
    & $fhirCommand spec R4 --project | Out-Host
    & $fhirCommand init $PackageId $PackageVersion | Out-Host

    $sushiConfig = Join-Path $root "sushi-config.yaml"
    if (Test-Path $sushiConfig) {
        $packageJsonPath = Join-Path $validationRoot "package.json"
        $packageJson = Get-Content -Raw -LiteralPath $packageJsonPath | ConvertFrom-Json

        $dependencies = [ordered]@{}
        foreach ($property in $packageJson.dependencies.PSObject.Properties) {
            $dependencies[$property.Name] = $property.Value
        }

        $inDependencies = $false
        foreach ($line in Get-Content -LiteralPath $sushiConfig) {
            if ($line -match '^dependencies:\s*$') {
                $inDependencies = $true
                continue
            }

            if ($inDependencies -and $line -match '^\S') {
                break
            }

            if ($inDependencies -and $line -match '^\s{2}([^:#]+):\s*([^\s#]+)') {
                $dependencies[$Matches[1].Trim()] = $Matches[2].Trim()
            }
        }

        $packageJson.dependencies = $dependencies
        $packageJson | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $packageJsonPath -Encoding utf8
    }

    & $fhirCommand restore | Out-Host

    $validationFailed = $false

    foreach ($file in Get-ChildItem -Path $validationResources -Filter "*.json" -File) {
        $relativeFile = Join-Path "resources" $file.Name
        Write-Host "Validating $relativeFile"
        $output = & $fhirCommand validate $relativeFile 2>&1
        $exitCode = $LASTEXITCODE
        $output | Out-Host

        if ($exitCode -ne 0 -or ($output -match "Result:\s*INVALID") -or ($output -match "No resource was found")) {
            $validationFailed = $true
        }
    }

    if ($validationFailed) {
        throw "Firely validation failed."
    }
}
finally {
    Pop-Location
}

Write-Host "Firely validation completed."
