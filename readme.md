## Installation
Add this to your `Microsoft.PowerShell_profile.ps1`

```
PS> Notepad $Profile
PS> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
and add the following

```
Push-Location C:\dev\PowershellExtensions\
. .\autoload.ps1
Pop-Location 
```

reload using 
```
PS>. $Profile
```