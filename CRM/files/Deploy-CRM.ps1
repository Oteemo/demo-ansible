#
# Windows PowerShell script for CRM 
#

# Download the CRM binary
$url = "https://otxstorage.file.core.windows.net/crm/CRM2013-Server-ENU-amd64.exe"
$output = "C:\Windows\Temp\CRM2013-Server-ENU-amd64.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
