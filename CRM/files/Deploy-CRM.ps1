#
# Windows PowerShell script for CRM 
#

# Download the CRM binary
$url = "https://download.microsoft.com/download/6/A/B/6AB1209C-8091-4BFA-B7B5-D4FFA454CA48/CRM2013-Server-ENU-amd64.exe"
$output = "C:\Windows\CRM2013-Server-ENU-amd64.exe"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

cd c:\Windows
CRM2013-Server-ENU-amd64.exe extract:./crm2012
cd gjp
./SetupServer.exe /config c:\windows\gjp\crm2012.xml
