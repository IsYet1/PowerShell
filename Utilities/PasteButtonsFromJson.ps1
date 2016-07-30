    #region Read Json file
        $jsonFile = "c:\git\powershell\utilities\AzureDemoClipboard.json"

        $buttonRows = ConvertFrom-Json -InputObject (Get-Content $jsonFile -Raw)
    #endregion

    #region Import the Assemblies
        [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
        [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    #endregion

    #region Rich Text Box
        $richTextBox1 = New-Object System.Windows.Forms.RichTextBox
        $richTextBox1.DataBindings.DefaultDataSourceUpdateMode = 0
        $System_Drawing_Point = New-Object System.Drawing.Point
        $System_Drawing_Point.X = 12
        $System_Drawing_Point.Y = 400
        $richTextBox1.Location = $System_Drawing_Point
        $richTextBox1.Name = "richTextBox1"

        $System_Drawing_Size = New-Object System.Drawing.Size
        $System_Drawing_Size.Height = 50
        $System_Drawing_Size.Width = 437
        $richTextBox1.Size = $System_Drawing_Size
        $richTextBox1.TabStop = $false #  TabIndex = 0


    #endregion

    #region Main form
        $MainForum = New-Object System.Windows.Forms.Form
        $System_Drawing_Size = New-Object System.Drawing.Size
        $System_Drawing_Size.Height = 800
        $System_Drawing_Size.Width = 800
        $MainForum.ClientSize = $System_Drawing_Size
        $MainForum.DataBindings.DefaultDataSourceUpdateMode = 0
        $MainForum.Name = "MainForum"
        $MainForum.Text = "Clipboarder"

        #Save the initial state of the form
        $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
        $InitialFormWindowState = $MainForum.WindowState
        #Init the OnLoad event to correct the initial state of the form
        $MainForum.add_Load($OnLoadForm_StateCorrection)
        #Show the Form
    #endregion

    #region Add buttons to the form
        $row = 0
        $col = 0
        $top = $buttonRows.top
        foreach($btnRow in $buttonRows.buttonRows)
        {
            $left = $buttonRows.left

            $width = $buttonRows.defaultWidth
            write $width
            if ($btnRow.width -gt 0)
                {$width = $btnRow.width}

            foreach($btn in $btnRow.buttons){
                write $btn.display

                Add-Member -InputObject $btn -MemberType NoteProperty  -Name ButtonObject  -Value (New-Object System.Windows.Forms.Button)
                $btn.ButtonObject.Text = $btn.display
                $btn.ButtonObject.Top = $top ##$btnRow.top
                $btn.ButtonObject.Left= $left
                $btn.ButtonObject.Width = $width
                $btn.ButtonObject.Height = $buttonRows.defaultHeight
                $btn.ButtonObject.Name = "btn" + $row + $col
                $MainForum.Controls.Add($btn.ButtonObject)

                $col++
                $left+=($width + $buttonRows.margin)
            }
            $top+=($buttonRows.defaultHeight + $buttonRows.margin)
            $row++
        }

    #endregion

    #region Add elements to the Form
        $MainForum.Controls.Add($richTextBox1)

    #endregion

    #region Main form display
        $MainForum.ShowDialog()| Out-Null

    #endregion



