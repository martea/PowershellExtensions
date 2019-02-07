function Start-Ngrok($port) {
    ngrok.exe http $port --host-header=rewrite -region eu
}
