If (Get-Module -ListAvailable -Name "posh-git") {
    Write-Host "posh-git already installed" -ForegroundColor Cyan 
}
else {
    Write-Host "installing posh-git" -ForegroundColor Cyan 
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
    # PowerShellGet\Install-Module oh-my-posh -Scope CurrentUser -Force
    PowerShellGet\Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}

if (!(Test-Path $PROFILE)) {
    # file with path $path doesn't exist
    New-Item -ItemType file $Profile
}
function hasContent($text) {
    $file = Get-Content $PROFILE
    $containsWord = $file | ForEach-Object { $_ -match $text }
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
    Add-Content $PROFILE "ssh-agent -s"
    
    # Add-Content $PROFILE "Import-Module oh-my-posh"
    # Add-Content $PROFILE "Set-Theme Paradox"
    # Write-host "Dont forget to add font https://github.com/adam7/delugia-code/releases";
    # explorer.exe .\fonts      
}
'
'
'
'
'
'
'