## WifiDiagnosticsView

WifiDiagnosticsView is a Wifi diagnostics tool for Windows 11/10/8/7/Vista that monitors the wireless network service of Windows operating system and displays any event that occurs while WifiDiagnosticsView is running, including wireless networks scan, connect to access point, disconnect from access point, failed connection attempt, and so on.. When a failure is detected, the error code and error description is displayed.

![WifiDiagnosticsView Screenshot](https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-wifidiagnosticsview@ccb25ee5752ef92b55e79309a59db71067938260//Screenshot.png)

## Package Parameters

* `/NoShim` - Opt out of creating a GUI shim.
* `/NoDesktopShortcut` - Opt out of creating a Desktop shortcut.
* `/NoProgramsShortcut` - Opt out of creating a Programs shortcut in your Start Menu.
* `/Start` - Automatically start WifiDiagnosticsView after installation completes.

## Package Notes

For future upgrade operations, consider opting into Chocolatey's `useRememberedArgumentsForUpgrades` feature to avoid having to pass the same arguments with each upgrade:

```shell
choco feature enable --name="'useRememberedArgumentsForUpgrades'"
```
