param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if ($Clean -and (Test-Path "fsh-generated")) {
    Remove-Item -LiteralPath "fsh-generated" -Recurse -Force
}

Write-Host "Generating FHIR JSON resources with SUSHI..."
npx sushi .

if (-not (Test-Path "fsh-generated/resources")) {
    throw "SUSHI did not create fsh-generated/resources."
}

Write-Host "Generated resources are in fsh-generated/resources."

