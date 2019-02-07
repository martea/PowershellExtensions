

function Get-Lastest {
    [cmdletbinding()]
    param(
        [Parameter(Position = 0, Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Int32]$noOfLogs
    )
    if (!$noOfLogs) {$noOfLogs = 1};
    Get-EventLog -LogName Application  | Select-Object -Property Source, EntryType, Message -First $noOfLogs | Format-List
}
