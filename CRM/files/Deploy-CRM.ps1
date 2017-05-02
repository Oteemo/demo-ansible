#
# Windows PowerShell script for CRM 
#

# Download the CRM binary
$url = "https://download.microsoft.com/download/6/A/B/6AB1209C-8091-4BFA-B7B5-D4FFA454CA48/CRM2013-Server-ENU-amd64.exe"
$output = "C:\Windows\CRM2013-Server-ENU-amd64.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

# Extract the install
c:\Windows\Temp\CRM2013-Server-ENU-amd64.exe /extract:c:\Windows\Temp\crm2013

# Run installer with config file
C:\Windows\Temp\crm2013\SetupServer.exe /config c:\Windows\Temp\crm2012.xml
