$buttonDataFile = "c:\git\powershell\utilities\AzureDemoClipboard.json"
#region Import the Assemblies
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion


function ReadJsonBuildButtonRowDataObjs($file)
{
    $jsonFile = $file
    $buttonRows1 = ConvertFrom-Json -InputObject (Get-Content $jsonFile -Raw)
    #Write-Output $buttonRows1
    return $buttonRows1
}

function CreateMainForm()
{

}

function AddTextBox()
{
}

function AddBUttons()
{
}


$buttonRows = ReadJsonBuildButtonRowDataObjs  $buttonDataFile
Write-Output $buttonRows

CreateMainForm

AddTextBox

AddButtons