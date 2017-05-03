#
# Windows PowerShell script for CRM 
#

# Download the CRM binary
$url = "http://shells.pryzby.org/CRM2013-Server-ENU-amd64.exe"
$output = "C:\Windows\Temp\CRM2013-Server-ENU-amd64.exe"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
