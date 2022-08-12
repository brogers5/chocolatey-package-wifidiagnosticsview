$ErrorActionPreference = 'Stop'

$programsDirectory = [Environment]::GetFolderPath([Environment+SpecialFolder]::Programs)
$shortcutFilePath = Join-Path -Path $programsDirectory -ChildPath 'WifiDiagnosticsView.lnk'

if (Test-Path -Path $shortcutFilePath)
{
    Remove-Item -Path $shortcutFilePath -Force
}
