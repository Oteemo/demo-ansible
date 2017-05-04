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
-DomainName "tscrm.local" `
-DomainNetBIOSName "TSCRM" `
-ForestMode "Win2012R2" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force)
