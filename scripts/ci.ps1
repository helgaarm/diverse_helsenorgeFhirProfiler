$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

& "$PSScriptRoot\build-sushi.ps1"
& "$PSScriptRoot\validate-firely.ps1"

Write-Host "CI checks completed."

