function Set-EnvironmentVariable($Name = "Development") {
    [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", $Name, "User")
    [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", $Name, "Machine")
}