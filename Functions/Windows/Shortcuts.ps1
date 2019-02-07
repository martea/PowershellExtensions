Set-Alias editor code
function Edit-Powershell-Profile() {
    editor "$($env:USERPROFILE)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
function Edit-IISExpress-Application-Host() {
    editor "$($env:USERPROFILE)\Documents\IISExpress\config\applicationhost.config"
}
function Edit-IIS-Application-Host() {
    editor "$($env:SystemRoot)\System32\inetsrv\config\applicationhost.config"
}
function Edit-Host-Config() {
    editor "$($env:SystemRoot)\System32\drivers\etc\hosts"
}