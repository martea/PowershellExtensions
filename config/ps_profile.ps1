
$MY_PSE_DIR = "D:\dev\PowershellExtensions\"
#configure git to use same ssh as the terminal
$Env:GIT_SSH = $((Get-Command -Name ssh).Source)
#eval ssh-agen
ssh-agent -s

Push-Location $MY_PSE_DIR
. ./autoload.ps1
Pop-Location

#configuration
oh-my-posh init pwsh --config "$($MY_PSE_DIR).oh-my-posh.omp.json" | Invoke-Expression