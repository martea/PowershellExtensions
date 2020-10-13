Param(
  [Parameter(Mandatory = $true)]
  [string]$name
)
docker rm --force $name