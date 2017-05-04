#
# Windows PowerShell script for AD DS Deployment
#

# Add domain controller and promote
Install-ADDSDomainController -InstallDns -DomainName "TSCRM.local" -Force:$true

