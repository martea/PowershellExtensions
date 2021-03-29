$word = New-Object -ComObject Word.Application
Get-ChildItem *.docx | select -First 1 |  ForEach-Object {
    $document = $word.Documents.Open($_.FullName)
    # $export = [DateTime]::UtcNow.Date.ToShortDateString()
    # if (!(Test-Path $export)) {
    #     mkdir $export
    # }
    # $pdf_filename = "$($_.DirectoryName)\$( $export )\$($_.BaseName).pdf"
    $document.DocumentTheme.ThemeColorScheme.Colors()  | Get-Member
    # $document.Comments | ForEach { $_.Delete() }
    # $document.SaveAs([ref] $pdf_filename, [ref] 17)

    $document.Close()
}
$word.Quit()