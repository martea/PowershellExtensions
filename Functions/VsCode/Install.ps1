Function New-VsCode-Setup{
    Import-Csv .\Install-extensions.csv | ForEach-Object {code --install-extension $_.Name --verbose }
}