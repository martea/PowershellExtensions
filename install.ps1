Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
If (Get-Module -ListAvailable -Name "posh-git") {
    Write-Host "posh-git already installed" -ForegroundColor Cyan 
}
else {
    Write-Host "installing posh-git" -ForegroundColor Cyan 
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
}

if (!(Test-Path $PROFILE)) {
    # file with path $path doesn't exist
    New-Item -ItemType file $Profile
}
function hasContent($text) {
    $file = Get-Content $PROFILE
    $containsWord = $file | ForEach-Object {$_ -match $text}
    if ($containsWord -contains $true) {
        return $true;
    }
    else {
        return $false;
    }
}
$installHeader = "Posh-git module loader"

if (!(hasContent($installHeader))) {
    Write-Host "adding $installHeader" -ForegroundColor Cyan 
    Add-Content $PROFILE "# $installHeader"
    Add-Content $PROFILE "Import-Module posh-git"
}



$installHeader = "Autoload Script"
$autoLoadPath = Get-Item .\autoload.ps1 | Select-Object Directory  | % {$_.Directory.FullName}
$psScript = 'Push-Location ' + $autoLoadPath + '
. .\autoload.ps1
Pop-Location'
if (!(hasContent($installHeader))) {
    Write-Host "adding $installHeader" -ForegroundColor Cyan 
    Add-Content $PROFILE "# $installHeader"
    Add-Content $PROFILE $psScript
}
