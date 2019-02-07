function ExportOctopusProject($host, $name,$key) {
    octo export --server=http://$($host)/api --apiKey="$key" --type=project --name="$($name)" --filePath=OD.json
}