Function Button
{
    param(
        [int]$EmplXButton,
        [int]$EmplYButton,
        [innt]$LongButton,
        [int]$LargButton,
        [string]$ButtonName,
        [string]$clickV,
        [int]$ButtonV
    )
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Size($EmplXButton,$EmplYButton)
    $Button.Size = New-Object System.Drawing.Size($LongButton,$LargButton)
    $Button.Text = $ButtonName
    $event=Register-ObjectEvent $Button click -SourceIdentifier $clickV -action {
        write-host $buttonV ; Unregister-Event $clickV
    }
    $Button.Add_Click({$objForm.Close()})
    $objForm.Controls.Add($Button)
}

Button 20 60 90 23 zero clickV0 0
Button 115 60 90 23 one clickV1 1
Button 210 60 90 23 two clickV2 2
Button 305 60 90 23 three clickV3 3
#>

$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()

