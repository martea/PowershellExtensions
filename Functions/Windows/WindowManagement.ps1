
function Close-Open-Windows() {
    #Closes all open applications those ignore are because of application restructions.
    (Get-Process | Where-Object { $_.mainwindowtitle -ne "" -and $_.processname -ne "console" -and $_.processname -ne "powershell" -and $_.processname -ne "devenv" } ) | Stop-Process -ErrorAction Ignore
    #Close open shell windows
    (New-Object -ComObject Shell.Application).Windows() | Where-Object {$_.Fullname -ne $null -and $_.Fullname.ToLower().Endswith('\explorer.exe') -eq $true} | ForEach-Object {$_.Quit()}
}
