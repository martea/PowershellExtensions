Param(
  [Parameter(Mandatory = $true)]
  [string]$tag,
  [Parameter(Mandatory = $true)]
  [string]$hostPort = "8080",
  [Parameter(Mandatory = $true)]
  [string]$containerPort = "80",
  [Parameter(Mandatory = $true)]
  [string]$ip = "127.0.0.1",
  [string]$version = "1.0"
  
)
docker run --publish "$($ip):$($hostPort):$($containerPort)" --detach --name $tag "$($tag):$($version)"