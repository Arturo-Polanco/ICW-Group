# Validate Active Directory commands exist or import if needed
if (Get-Command Get-ADUser -erroraction 'silentlycontinue'){}
else {
    Import-Module ActiveDirectory
}

$List = @()

$Users = Import-Csv "C:\users\apolanco\desktop\PDList.csv"

Foreach ($User in $Users) {
  try{
    $List1 = Get-AdUser $User.User -Properties DisplayName, Title |
    Select SamAccountName, DisplayName, Title, Enabled
    
  }catch{
    $List1 = Get-AdUser -Filter * -Properties DisplayName, Title |
    Where { $_.DisplayName -eq $User.Name } |
    Select SamAccountName, DisplayName, Title, Enabled
  }finally{
    $List += $List1
  }
}

$List | Export-Csv -notype "C:\users\apolanco\desktop\out.csv"