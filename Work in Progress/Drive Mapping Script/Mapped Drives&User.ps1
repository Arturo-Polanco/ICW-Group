[System.Reflection.Assembly]::LoadWithPartialName('microsoft.visualbasic')| Out-Null
$ComputerName = [Microsoft.VisualBasic.Interaction]::InputBox("Enter Computer Name", "Mapped Drives")
$Drives = Get-WmiObject -ComputerName $ComputerName Win32_MappedLogicalDisk | select Name, ProviderName | Out-String
$User = gwmi win32_computersystem -comp $computername | select Username | Out-String
[System.Windows.Forms.MessageBox]::Show("$User", "Current User")
[System.Windows.Forms.MessageBox]::Show("$Drives", "Mapped Drives on $ComputerName")



#gwmi win32_computersystem -comp $computername | select Model | Out-String