if (Get-Command Get-ADUser -erroraction 'silentlycontinue'){}
else {
    Import-Module ActiveDirectory
}

#$NetOps_User = @{accountExpires='0';CannotChangePassword='$FALSE';City="San Diego";Company="ICW Group";Country="US";countryCode="840";Department="IT";Description="Created $DATE";Enabled="$TRUE";HomeDrive="U:";Office="";Organization="ICW Group";PostalCode="92128";State="CA";Title="Network Ops Specialist"}


sAMAccountName
c
l
postalCode
st
streetAddress
description
displayName
givenName
mail
physicalDeliveryOfficeName
sn
telephoneNumber
whenChanged
whenCreated
department
directReports
manager
title
mobile
employeeID



$user.givenName.substring(0,[1]) + $User.surname