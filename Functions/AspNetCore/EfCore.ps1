function Add-EFC-Migration {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$name
  )
  dotnet ef migrations add $name --verbose
}
function Add-EFC-Migration {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$name,
    [Parameter(Mandatory = $true)]
    [string]$dbcontext,
    [Parameter(Mandatory = $true)]
    [string]$project,
    [Parameter(Mandatory = $true)]
    [string]$startupProject
  )
  # -c | --context <DBCONTEXT>               The DbContext to use.
  # -p | --project <PROJECT>                 The project to use.
  # -s | --startup-project <PROJECT>  
  dotnet ef migrations add $name --verbose -c $dbcontext -p $project -s $startupProject
}
function Update-EFC-Migration {
  dotnet ef database update --verbose
}

function Install-EFC {
  dotnet tool install --global dotnet-ef
}