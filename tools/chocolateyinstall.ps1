$ErrorActionPreference = 'Stop'

$toolsDirectory = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$archiveFilePath = Join-Path -Path $toolsDirectory -ChildPath 'wifidiagnosticsview.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDirectory
  file          = $archiveFilePath
}
Get-ChocolateyUnzip @packageArgs

#Clean up ZIP archive post-extraction to prevent unnecessary disk bloat
Remove-Item -Path $archiveFilePath -Force -ErrorAction SilentlyContinue

$softwareName = 'WifiDiagnosticsView'
$binaryFileName = "$softwareName.exe"
$linkName = "$softwareName.lnk"
$targetPath = Join-Path -Path $toolsDirectory -ChildPath $binaryFileName

$pp = Get-PackageParameters
if (!$pp.NoProgramsShortcut)
{
    $programsDirectory = [Environment]::GetFolderPath([Environment+SpecialFolder]::Programs)
    $shortcutFilePath = Join-Path -Path $programsDirectory -ChildPath $linkName
    Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath -ErrorAction SilentlyContinue
}

#Create GUI shim
Set-Content -Path "$targetPath.gui" -Value $null -ErrorAction SilentlyContinue

if ($pp.Start)
{
  try
  {
    Start-Process -FilePath $targetPath -ErrorAction Continue
  }
  catch
  {
    Write-Warning "$softwareName failed to start, please try to manually start it instead."
  }
}
