param(
    [string]$SourceDir = (Join-Path $PSScriptRoot 'source'),
    [string]$BuildDir = (Join-Path $PSScriptRoot '_build\html'),
    [switch]$Clean
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $SourceDir)) {
    throw "Source directory not found: $SourceDir"
}

if ($Clean -and (Test-Path $BuildDir)) {
    Remove-Item $BuildDir -Recurse -Force
}

if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir -Force | Out-Null
}

$sphinxArgs = @('-m', 'sphinx', '-b', 'html')
if ($Clean) {
    $sphinxArgs += @('-E', '-a')
}

& python @sphinxArgs $SourceDir $BuildDir