#
# Windows PowerShell script for AD DS Deployment
#

# Install the module
Install-windowsfeature AD-domain-services

# Install/config AD
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "Win2012R2" `
-DomainName "TS.local" `
-DomainNetbiosName "TS" `
-ForestMode "Win2012R2" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword "SpaceGhost!!1"
