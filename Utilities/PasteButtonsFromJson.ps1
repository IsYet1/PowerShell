$jsonFile = "AzureDemoClipboard.json"

$buttonRows = ConvertFrom-Json -InputObject (Get-Content $jsonFile -Raw)



function readFile ()
{
    #return $buttonRows
}

#readFile
