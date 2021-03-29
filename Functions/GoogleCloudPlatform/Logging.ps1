
function Get-Gcp-Logs {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true)]
    $name
    
  )
  $query = "logName=projects/egain-cave/logs/$($name) ";
  Write-Host $query
  gcloud beta logging read """$query""" --limit=10 --format json | ConvertFrom-Json | Select-Object severity, receiveTimestamp, jsonPayload | Format-List
}
