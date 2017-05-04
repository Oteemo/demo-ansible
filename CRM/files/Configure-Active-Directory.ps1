#
# Windows PowerShell script for AD DS Deployment
#

# Add domain controller and promote
Install-ADDSDomainController `
-NoGlobalCatalog:$false `
-InstallDns:$true `
-DomainName "tscrm.local" `
-Force:$true `
-Confirm:$false `
-SafeModeAdministratorPassword (convertto-securestring "SpaceGhost!!1" -asplaintext -force)
