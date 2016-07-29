$buttonRows = @()
$json = ""
function readFile
{
    $json = Get-Content "AzureDemoClipboard.json" -Raw
    write $json

    $buttonRows = ConvertFrom-Json -InputObject $json
    
}

readFile
