param(
    [string]$SourceDir = (Join-Path $PSScriptRoot 'source'),
    [string]$BuildDir = (Join-Path $PSScriptRoot '_build\html'),
    [switch]$Clean
)

$ErrorActionPreference = 'Stop'

$buildScript = Join-Path $PSScriptRoot 'build.ps1'
if (-not (Test-Path $buildScript)) {
    throw "Build script not found: $buildScript"
}

& $buildScript -SourceDir $SourceDir -BuildDir $BuildDir -Clean:$Clean

$indexFile = Join-Path $BuildDir 'index.html'
if (-not (Test-Path $indexFile)) {
    throw "Rendered docs not found: $indexFile"
}

Start-Process $indexFile