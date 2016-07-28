#Generated Form Function
function GenerateForm {

    #region Import the Assemblies
        [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
        [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    #endregion

    #region Generated Form Objects
        $MainForum = New-Object System.Windows.Forms.Form
        $GetServices = New-Object System.Windows.Forms.Button

        $clipBoardClips = @()
        $clipBoardClips += "AutoShutdownSchedule"
        $clipBoardClips += "4pm -> 7am"

        $ClipBoard01 = New-Object System.Windows.Forms.Button
        $ClipBoard02 = New-Object System.Windows.Forms.Button

        $richTextBox1 = New-Object System.Windows.Forms.RichTextBox
        $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    #endregion Generated Form Objects

    #----------------------------------------------
    #Generated Event Script Blocks
    #----------------------------------------------
    #Provide Custom Code for events specified in PrimalForms.


    $OnLoadForm_StateCorrection=
        {#Correct the initial state of the form to prevent the .Net maximized form issue
            $MainForum.WindowState = $InitialFormWindowState
        }

    #----------------------------------------------
    #region Generated Form Code
        $System_Drawing_Size = New-Object System.Drawing.Size
        $System_Drawing_Size.Height = 262
        $System_Drawing_Size.Width = 461
        $MainForum.ClientSize = $System_Drawing_Size
        $MainForum.DataBindings.DefaultDataSourceUpdateMode = 0
        $MainForum.Name = "MainForum"
        $MainForum.Text = "Demo GUI"


    $GetServices.DataBindings.DefaultDataSourceUpdateMode = 0

        $System_Drawing_Point = New-Object System.Drawing.Point
        $System_Drawing_Point.X = 13
        $System_Drawing_Point.Y = 26

    $GetServices.Location = $System_Drawing_Point
    $GetServices.Name = "GetServices"

    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 105

    #Clipboard button 1
        $System_Drawing_Point.X = 13
        $System_Drawing_Point.Y = 60

        $ClipBoard01.Location = $System_Drawing_Point
        $ClipBoard01.Name = "TagName"
        $ClipBoard01.Text = "Tag Name"
        $ClipBoard01.Size = $System_Drawing_Size
        $ClipBoard01.add_Click({clipper $clipBoardClips[0] "Tag Name Clipped"})

        $System_Drawing_Point.X = 120
        $System_Drawing_Point.Y = 60

        $ClipBoard02.Location = $System_Drawing_Point
        $ClipBoard02.Name = "TagValue"
        $ClipBoard02.Text = "Tag Value"
        $ClipBoard02.Size = $System_Drawing_Size
        $ClipBoard02.add_Click({clipper "4pm -> 7am" "Tag Value Clipped"})

    $GetServices.Size = $System_Drawing_Size
    $GetServices.TabIndex = 1
    $GetServices.Text = "Get Services"
    $GetServices.UseVisualStyleBackColor = $True

    $GetServices.add_Click({ GetServices($GetServices) })

    $richTextBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 132
    $richTextBox1.Location = $System_Drawing_Point
    $richTextBox1.Name = "richTextBox1"

    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 118
    $System_Drawing_Size.Width = 437
    $richTextBox1.Size = $System_Drawing_Size
    $richTextBox1.TabIndex = 0
    $richTextBox1.Text = "Results Out Put To This Box"

    $MainForum.Controls.Add($richTextBox1)
    $MainForum.Controls.Add($GetServices)
    $MainForum.Controls.Add($ClipBoard01)
    $MainForum.Controls.Add($ClipBoard02)

    #endregion

    function GetServices($object)
    {
        OutputText
    }

    function clipper($stringToClip, $stringToSHow)
    {
        Set-Clipboard $stringToClip
        $richTextBox1.Text = $stringToShow
    }


    function OutputText($object)
    {
        $service = (Get-Service s*) 
        foreach ($_ in $service)
        {
            $name = $_.Name
            $status = $_.Status
            $richTextBox1.Text = $richTextBox1.Text + $name + "  "  +$status  + "`r"
        }
    }

    #Save the initial state of the form
    $InitialFormWindowState = $MainForum.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $MainForum.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $MainForum.ShowDialog()| Out-Null

} #End Function
#Call the Function
GenerateForm