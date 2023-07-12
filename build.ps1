$ErrorActionPreference = 'Stop'

$currentPath = (Split-Path $MyInvocation.MyCommand.Definition)
$nuspecFileRelativePath = Join-Path -Path $currentPath -ChildPath 'wifidiagnosticsview.nuspec'
[xml] $nuspec = Get-Content -Path $nuspecFileRelativePath
$version = [Version] $nuspec.package.metadata.version

$global:Latest = @{
    Url32   = 'https://web.archive.org/web/20230206172016if_/https://www.nirsoft.net/utils/wifidiagnosticsview.zip'
    Version = $version
}

Write-Host "Downloading..."
Get-RemoteFiles -Purge -NoSuffix

Write-Host "Creating package..."
choco pack $nuspecFileRelativePath
