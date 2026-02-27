# One-time setup: download game libraries so standalone.html works when opened locally (double-click).
$ErrorActionPreference = 'Stop'
$libDir = Join-Path $PSScriptRoot 'lib'
$matterUrl = 'https://cdnjs.cloudflare.com/ajax/libs/matter-js/0.20.0/matter.min.js'
$pixiUrl   = 'https://cdn.jsdelivr.net/npm/pixi.js@6.5.8/dist/browser/pixi.min.js'

if (-not (Test-Path $libDir)) { New-Item -ItemType Directory -Path $libDir | Out-Null }

Write-Host 'Downloading Matter.js...'
Invoke-WebRequest -Uri $matterUrl -OutFile (Join-Path $libDir 'matter.min.js') -UseBasicParsing
Write-Host 'Downloading Pixi.js...'
Invoke-WebRequest -Uri $pixiUrl   -OutFile (Join-Path $libDir 'pixi.min.js')   -UseBasicParsing
Write-Host 'Done. You can now double-click standalone.html to play.'
Write-Host 'Press any key to exit.'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
