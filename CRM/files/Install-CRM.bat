#
# Windows script for CRM 
#

# Extract the install
C:\Windows\Temp\CRM2013-Server-ENU-amd64.exe /extract:c:\Windows\Temp\crm2013

# Run installer with config file
C:\Windows\Temp\crm2013\SetupServer.exe  /config C:\Windows\Temp\crm2012.xml
