#Stops windows update when you your irritated
function Stop-Windows-Update-Service {
    Stop-Service wuauserv
}
