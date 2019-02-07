function Get-Acl-Url() {
    netsh http show urlacl
}
function Add-Acl-Url($serviceUrl) {
    netsh http add urlacl url=$serviceUrl user=everyone delegate=yes
}
function Add-Acl($arg) {
    netsh http add urlacl "url=https://$($arg):443/" user=everyone
    netsh http add urlacl "url=http://$($arg):80/" user=everyone
}