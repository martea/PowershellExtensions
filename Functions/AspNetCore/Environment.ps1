function Set-AspnetCore-EnvironmentVariable($Name = "Development") {
    [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", $Name, "User")
    [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", $Name, "Machine")
}
function Set-EnvironmentVariable($Name = "Development", $value) {
    [Environment]::SetEnvironmentVariable($Name, $value, "User")
    [Environment]::SetEnvironmentVariable($Name, $value, "Machine")
}