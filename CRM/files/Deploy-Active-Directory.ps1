#
# Windows PowerShell script for AD DS Deployment
#

# Install the module
Install-windowsfeature AD-domain-services -IncludeManagementTools

# Install/config AD
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Win2012R2" `
-DomainName "TSCRM.local" `
-DomainNetbiosName "TSCRM" `
-ForestMode "Win2012R2" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force)

# Add domain controller and promote
Install-ADDSDomainController -InstallDns -DomainName "TSCRM.local" -Force:$true

# Add user
New-ADUser -Name "CRM Admin" -GivenName "CRM" -Surname "Admin" `
-SamAccountName "crm.admin" -UserPrincipalName "crm.admin@TSCRM.local" `
-AccountPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force) `
-PasswordNeverExpires:$true `
-PassThru | Enable-ADAccount

# Add to Performance Log User Group
Add-ADGroupMember -Identity "Performance Log Users" -Member "crm.admin"

# Add OU
NEW-ADOrganizationalUnit "CRM"
