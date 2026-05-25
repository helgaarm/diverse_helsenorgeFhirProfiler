param(
    [switch]$SkipSushi
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not $SkipSushi) {
    & "$PSScriptRoot\build-sushi.ps1"
}

if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    throw "Java was not found on PATH. Install Java 17 or newer."
}

if (-not (Get-Command jekyll -ErrorAction SilentlyContinue)) {
    throw "Jekyll was not found on PATH. Install Ruby for Windows, then run 'gem install jekyll bundler', restart PowerShell, and rerun this script."
}

$publisher = Join-Path $root "input-cache\publisher.jar"
if (-not (Test-Path $publisher)) {
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $publisher) | Out-Null
    Write-Host "Downloading HL7 IG Publisher..."
    Invoke-WebRequest -Uri "https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar" -OutFile $publisher
}

$workRoot = Join-Path $root "input-cache\ig-publisher-work"
$resolvedRoot = (Resolve-Path $root).Path
$resolvedWorkParent = (Resolve-Path (Split-Path -Parent $workRoot)).Path
if (-not $resolvedWorkParent.StartsWith($resolvedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to prepare IG Publisher work directory outside the project root."
}

if (Test-Path $workRoot) {
    Remove-Item -LiteralPath $workRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $workRoot | Out-Null
Copy-Item -LiteralPath (Join-Path $root "ig.ini") -Destination $workRoot
Copy-Item -LiteralPath (Join-Path $root "sushi-config.yaml") -Destination $workRoot
Copy-Item -LiteralPath (Join-Path $root "package-list.json") -Destination $workRoot -ErrorAction SilentlyContinue
Copy-Item -LiteralPath (Join-Path $root "input") -Destination $workRoot -Recurse
Copy-Item -LiteralPath (Join-Path $root "fsh-generated") -Destination $workRoot -Recurse

$workFsh = Join-Path $workRoot "input\fsh"
if (Test-Path $workFsh) {
    Remove-Item -LiteralPath $workFsh -Recurse -Force
}

$implementationGuideFileName = "ImplementationGuide-no.nhn.fhir.helsenorge.profiles.json"
$generatedImplementationGuide = Join-Path $workRoot "fsh-generated\resources\$implementationGuideFileName"
if (-not (Test-Path $generatedImplementationGuide)) {
    throw "Generated ImplementationGuide was not found at fsh-generated/resources/$implementationGuideFileName."
}

Copy-Item -LiteralPath $generatedImplementationGuide -Destination (Join-Path $workRoot "input\$implementationGuideFileName") -Force
$workIgIni = @"
[IG]
ig = input/$implementationGuideFileName
template = fhir.base.template
"@
[System.IO.File]::WriteAllText(
    (Join-Path $workRoot "ig.ini"),
    $workIgIni,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host "Generating IG website with HL7 IG Publisher..."
Push-Location $workRoot
try {
    java -jar $publisher -ig ig.ini
}
finally {
    Pop-Location
}

if ($LASTEXITCODE -ne 0) {
    throw "IG Publisher failed with exit code $LASTEXITCODE."
}

if (Test-Path (Join-Path $root "output")) {
    Remove-Item -LiteralPath (Join-Path $root "output") -Recurse -Force
}

if (-not (Test-Path (Join-Path $workRoot "output"))) {
    throw "IG Publisher completed but did not create an output directory."
}

Copy-Item -LiteralPath (Join-Path $workRoot "output") -Destination $root -Recurse
Write-Host "Generated IG website is in output."
