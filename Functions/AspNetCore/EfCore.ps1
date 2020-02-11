function Add-EFC-Migration {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$name
  )
  dotnet ef migrations add $name --verbose
}
function Update-EFC-Migration {
  dotnet ef database update --verbose
}

function Install-EFC {
  dotnet tool install --global dotnet-ef
}