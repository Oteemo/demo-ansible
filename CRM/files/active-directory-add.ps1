# Add a user
New-ADUser -Name "CRM Admin" -GivenName "CRM" -Surname "Admin" -SamAccountName "crm.admin" `
-UserPrincipalName "crm.admin@TSCRM.local" `
-AccountPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force) `
-PasswordNeverExpires:$true -PassThru | Enable-ADAccount

# Put user in group
Add-ADGroupMember -Identity "Performance Log Users" -Member "crm.admin"

# Add OU
NEW-ADOrganizationalUnit "CRM"
