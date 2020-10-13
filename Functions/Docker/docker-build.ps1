Param(
  [string]$tag,
  [Parameter(Mandatory = $true)]
  [string]$accessToken,
  [string]$version = "1.0"
)
docker build --tag "$($tag):$($version)" --build-arg PAT=$accessToken .
