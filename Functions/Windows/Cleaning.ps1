function Remove-Bin-Obj-Folders() {
    Get-ChildItem .\ -include bin, obj -Recurse | Where-Object {$_.PSIsContainer} | Remove-Item -Force -Recurse
}

function Remove-DLL-References() {
    Get-ChildItem .\ -include bin, obj -Recurse | ForEach-Object ($_) { remove-item $_.fullname -Force -Recurse }
    Remove-Item .\packages\ -Force -Recurse
}
function Rename-Replace-Item($filter, $replaceOldValue, $replaceNewValue, $recurse = $false) {
    if ($recurse) {
        Get-ChildItem $filter -Recurse | Rename-Item -NewName {$_.name -replace $replaceOldValue, $replaceNewValue} 
    }
    else {
        Get-ChildItem $filter | Rename-Item -NewName {$_.name -replace $replaceOldValue, $replaceNewValue} 
    }
}