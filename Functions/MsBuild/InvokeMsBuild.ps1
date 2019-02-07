function RunOctopack() {
    Get-Process *iisexpress* | Stop-Process
    Write-Host "Stopped iis express instance"
    Write-Host "Invoking msbuild..."
    Invoke-MsBuild ((Get-ChildItem *sln | Select-Object -Property Name).Name) -ShowBuildOutputInNewWindow -PromptForInputBeforeClosing -Verbose -MsBuildParameters "/target:rebuild /property:RunOctoPack=true"
}
function Rebuild() {
    Invoke-MsBuild ((Get-ChildItem *sln | Select-Object -Property Name).Name) -ShowBuildOutputInCurrentWindow -Verbose -MsBuildParameters "/target:rebuild"
}

function HostExpress() {
    Invoke-MsBuild ((Get-ChildItem *sln | Select-Object -Property Name).Name) -ShowBuildOutputInCurrentWindow -Verbose -MsBuildParameters "/target:rebuild"
    iisexpress /config:.vs\config\applicationhost.config
}