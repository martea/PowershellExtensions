function get-all-datasource($workspaceeId){
    Get-PowerBIDataset -WorkspaceId $workspaceeId | select Id, Name, @{Name="WorkspaceId";Expression = {$workspaceeId}} | %{
        Write-Verbose "$_.Name"
        Get-PowerBIDatasource -DatasetId $_.Id -WorkspaceId $_.WorkspaceId 
    }
}