#
# Windows PowerShell script for IIS 
#

# Install the IIS and the parts
Install-WindowsFeature Application-Server,AS-Web-Support,AS-HTTP-Activation,AS-NET-Framework,Web-Server,Web-Mgmt-Tools,Web-Mgmt-Service

