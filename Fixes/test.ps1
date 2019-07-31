function Backup-Desktop {
  param (
    [parameter(mandatory=$true)][string]$Computer
  )

  $username = (get-wmiobject Win32_ComputerSystem -comp $Computer).UserName.Split('\')[1]
  $sourceDir = "\\$Computer\C$\Users\$username\Desktop"
  $targetDir = "\\sancfs001.icwgrp.com\icwusers$\$username\Win10-Backup\Desktop"

  $dir = split-path $targetDir
  if(!(test-path $dir))
  {
    mkdir $dir
  }

  if(!(test-path $targetDir))
  {
    mkdir $targetDir
  }


  $items = Get-ChildItem $sourceDir

  foreach ($item in $items)
  {
    $ItemBaseName = $Item.BaseName
  
    $ItemName = $Item.Name
  
    
    if (!($item.PsIsContainer))
    {
      try
      {
        $destination = join-path $targetDir -childpath $itemName
        Copy-Item $item.FullName -Exclude "*.lnk" -destination "$destination" -ErrorAction Stop
      
        Remove-Item -Recurse $item.FullName
      }
      catch { return $true}
    } # End if
    else
    { 
      try
      {
        $destination = join-path $targetDir -childpath $itemBaseName
        Copy-Item -Recurse $item.FullName -destination "$destination" -ErrorAction Stop -Container
      
        Remove-Item -Recurse $item.FullName
      }
      catch { return $true}
    } #End Else
  
    $wshshell = New-Object -ComObject WScript.Shell
    $lnk = $wshshell.CreateShortcut($sourceDir + "\$itemBaseName.lnk")
    $lnk.TargetPath = "$destination"
    $lnk.Save()
     
  } # End of foreach
  
  return $false
  
} #End of function