Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

. ./install-posh-git.ps1


$installHeader = "Autoload Script"
$autoLoadPath = Get-Item .\autoload.ps1 | Select-Object Directory | % { $_.Directory.FullName }
$psScript = 'Push-Location ' + $autoLoadPath + '
. .\autoload.ps1
Pop-Location'
if (!(hasContent($installHeader))) {
    Write-Host "adding $installHeader" -ForegroundColor Cyan 
    Add-Content $PROFILE "# $installHeader"
    Add-Content $PROFILE $psScript
}

. ./update-windows.ps1;