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

$publisher = Join-Path $root "input-cache\publisher.jar"
if (-not (Test-Path $publisher)) {
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $publisher) | Out-Null
    Write-Host "Downloading HL7 IG Publisher..."
    Invoke-WebRequest -Uri "https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar" -OutFile $publisher
}

Write-Host "Generating IG website with HL7 IG Publisher..."
java -jar $publisher -ig ig.ini
if ($LASTEXITCODE -ne 0) {
    throw "IG Publisher failed with exit code $LASTEXITCODE."
}

Write-Host "Generated IG website is in output."
