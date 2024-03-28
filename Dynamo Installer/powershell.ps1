Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Dynamo Installer'
$form.Size = New-Object System.Drawing.Size(300,220)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,150)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,150)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Specify revit version:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.Listbox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)

$listBox.SelectionMode = 'One'

[void] $listBox.Items.Add('2019')
[void] $listBox.Items.Add('2020')
[void] $listBox.Items.Add('2021')
[void] $listBox.Items.Add('2022')
[void] $listBox.Items.Add('2023')
[void] $listBox.Items.Add('2024')

$listBox.Height = 100
$form.Controls.Add($listBox)
$form.Topmost = $true

$result = $form.ShowDialog()


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $version = $listBox.SelectedItem.ToString()
    if($version -eq "2019") {$path = "C:\ProgramData\Dynamo\Dynamo Revit\1.3\samples\en-US\Revit\DynamoPlayer-2"
    $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\1.3\packages")}
        ElseIf($version -eq "2020") {$path = "C:\ProgramData\Autodesk\RVT 2020\Dynamo\samples\en-US\Revit\DynamoPlayer-3"
        $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.3\packages")}
        ElseIf($version -eq "2021") {$path = "C:\ProgramData\Autodesk\RVT 2022\Dynamo\samples\en-US\Revit\DynamoPlayer-4"
        $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.6\packages")}
        ElseIf($version -eq "2022") {$path = "C:\ProgramData\Autodesk\RVT 2022\Dynamo\samples\en-US\Revit\DynamoPlayer-4"
        $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.12\packages")
        $nodes = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.12\definitions")}
		ElseIf($version -eq "2023") {$path = "C:\ProgramData\Autodesk\RVT 2023\Dynamo\samples\en-US\Revit\DynamoPlayer-5"
        $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.13\packages")
        $nodes = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.13\definitions")}
		Else {$path = "C:\ProgramData\Autodesk\RVT 2024\Dynamo\samples\en-US\Revit\DynamoPlayer-6"
        $pack = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.19\packages")
        $nodes = -join("C:\Users\",$Env:UserName,"\AppData\Roaming\Dynamo\Dynamo Revit\2.19\definitions")}



if (!(Test-Path -Path $path))
{
	$form = New-Object System.Windows.Forms.Form
	$form.Text = "Installation failed"
	$form.Size = New-Object System.Drawing.Size(280,100)
	$form.StartPosition = 'CenterScreen'

	$label = New-Object System.Windows.Forms.Label
	$label.Text = "dir_error Installation needs to be performed manually"
	$label.Location = New-Object System.Drawing.Point(10,10)
	$label.AutoSize = $true

	$button = New-Object System.Windows.Forms.Button
	$button.Text = "Close"
	$button.Location = New-Object System.Drawing.Point(140,30)
	$button.Add_Click({ $form.Close() })

	$form.Controls.Add($label)
	$form.Controls.Add($button)

	$form.ShowDialog()

} else{ $currentDirectory = Get-Item -LiteralPath $PWD.Path
$path1 = $currentDirectory.ToString()
$path2 = $path
Robocopy $path1 $path2 *.dyn
Robocopy $path1 $nodes *.dyf


$path1 = -join($path1,"\packageFiles")
Robocopy $path1 $pack /e


	$form = New-Object System.Windows.Forms.Form
	$form.Text = "Dynamo Installer"
	$form.Size = New-Object System.Drawing.Size(280,100)
	$form.StartPosition = 'CenterScreen'

	$label = New-Object System.Windows.Forms.Label
	$label.Text = "Success! :)"
	$label.Location = New-Object System.Drawing.Point(10,10)
	$label.AutoSize = $true

	$button = New-Object System.Windows.Forms.Button
	$button.Text = "Close"
	$button.Location = New-Object System.Drawing.Point(140,30)
	$button.Add_Click({ $form.Close() })

	$form.Controls.Add($label)
	$form.Controls.Add($button)

	$form.ShowDialog()



}

}