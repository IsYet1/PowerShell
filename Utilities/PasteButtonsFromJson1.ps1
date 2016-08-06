#region Init
$buttonDataFile = "c:\git\powershell\utilities\AzureDemoClipboard.json"
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion


function ReadJsonBuildButtonRowDataObjs($file)
{
    $jsonFile = $file
    $jsonContent = Get-Content $jsonFile -Raw
    $buttonRows = ConvertFrom-Json -InputObject ($jsonContent)
    return $buttonRows
}

function CreateMainForm()
{
    $MainForm = New-Object System.Windows.Forms.Form
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 800
    $System_Drawing_Size.Width = 800
    $MainForm.ClientSize = $System_Drawing_Size
    $MainForm.DataBindings.DefaultDataSourceUpdateMode = 0
    $MainForm.Name = "MainForm"
    $MainForm.Text = "Clipboarder"

    #Save the initial state of the form
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    $InitialFormWindowState = $MainForm.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $MainForm.add_Load($OnLoadForm_StateCorrection)

    #Show the Form
    $MainForm.ShowDialog()| Out-Null

    #return $MainForm
}

function BuildTextBox()
{
    $font = New-Object System.Windows.Forms.FontDialog
    $richTextBox1 = New-Object System.Windows.Forms.RichTextBox
    $richTextBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 400
    $richTextBox1.Location = $System_Drawing_Point
    
    $richTextBox1.Font = "Arial, 14"
    write $richTextBox1.Font

    $richTextBox1.Name = "richTextBox1"

    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 70
    $System_Drawing_Size.Width = 200
    $richTextBox1.Size = $System_Drawing_Size
    $richTextBox1.TabStop = $false #  TabIndex = 0

    return $richTextBox1
}

function AddTextBox($MainForum)
{
    $font = New-Object System.Windows.Forms.FontDialog
    $richTextBox1 = New-Object System.Windows.Forms.RichTextBox
    $richTextBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 400
    $richTextBox1.Location = $System_Drawing_Point
    
    $richTextBox1.Font = "Arial, 14"
    write $richTextBox1.Font

    $richTextBox1.Name = "richTextBox1"

    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 70
    $System_Drawing_Size.Width = 200
    $richTextBox1.Size = $System_Drawing_Size
    $richTextBox1.TabStop = $false #  TabIndex = 0

    $MainForum.Controls.Add($richTextBox1)
}

function AddBUttons()
{
}


$buttonRows = ReadJsonBuildButtonRowDataObjs  $buttonDataFile
Write-Output $buttonRows

$textBox = BuildTextBox
CreateMainForm

#AddTextBox $mainForm

AddButtons


