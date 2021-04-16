
function docker-build {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$tag ,
    [Parameter(Mandatory = $true)]
    [string]$accessToken ,
    [string]$version = "latest"
  )
  

  docker build --tag "$($tag):$($version)" --build-arg PAT=$accessToken .
}
function docker-build-lazy {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$accessToken 
  )
  $tag = (Get-Item .).name,
  $version = "latest"
    
  docker-build($tag, $accessToken, $version)
  

}


function docker-remove {
  Param(
    [Parameter(Mandatory = $true)]
    [string]$name
  )
  docker rm --force $name
}

function docker-run {
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
}