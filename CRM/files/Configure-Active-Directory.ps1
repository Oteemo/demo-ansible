#
# Windows PowerShell script for AD DS Deployment
#

# Add domain controller and promote
Install-ADDSDomainController `
-InstallDns `
-DomainName "tscrm.local" `
-Force:$true `
-Confirm:$false `
-SafeModeAdministratorPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force)
