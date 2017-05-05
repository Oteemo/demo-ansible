## This script configures a Native mode report server without HTTPS
$ErrorActionPreference = "Stop"

$server = $env:COMPUTERNAME
$HTTPport = 80 # change the value if you used a different port for the private HTTP endpoint when the VM was created.

## Set PowerShell execution policy to be able to run scripts
Set-ExecutionPolicy RemoteSigned -Force

## Utility method for verifying an operation's result
function CheckResult
{
  param($wmi_result, $actionname)
  if ($wmi_result.HRESULT -ne 0) {
    write-error "$actionname failed. Error from WMI: $($wmi_result.Error)"
  }
}


## ReportServer Database name - this can be changed if needed
$dbName='ReportServer'

## Register for MSReportServer_ConfigurationSetting
## Change the version portion of the path to "v11" to use the script for SQL Server 2012
$RSObject = Get-WmiObject -class "MSReportServer_ConfigurationSetting" -namespace "root\Microsoft\SqlServer\ReportServer\RS_MSSQLSERVER\v11\Admin"

## Report Server Configuration Steps

## Setting the web service URL ##

## SetVirtualDirectory for ReportServer site
$r = $RSObject.SetVirtualDirectory('ReportServerWebService','ReportServer',1033)
CheckResult $r "SetVirtualDirectory for ReportServer"

## ReserveURL for ReportServerWebService - port $HTTPport (for local usage)
$r = $RSObject.ReserveURL('ReportServerWebService',"http://+:$HTTPport",1033)
CheckResult $r "ReserveURL for ReportServer port $HTTPport" 

## Setting the Database ##

## GenerateDatabaseScript - for creating the database
$r = $RSObject.GenerateDatabaseCreationScript($dbName,1033,$false)
CheckResult $r "GenerateDatabaseCreationScript"
$script = $r.Script

## Execute sql script to create the database
$savedcvd = Get-Location
Import-Module SQLPS              ## this automatically changes to sqlserver provider
Invoke-SqlCmd -Query $script
Set-Location $savedcvd

## GenerateGrantRightsScript 
$DBUser = "NT Service\ReportServer"
$r = $RSObject.GenerateDatabaseRightsScript($DBUser,$dbName,$false,$true)
CheckResult $r "GenerateDatabaseRightsScript"
$script = $r.Script

## Execute grant rights script
$savedcvd = Get-Location
cd sqlserver:\
Invoke-SqlCmd -Query $script
Set-Location $savedcvd

## SetDBConnection - uses Windows Service (type 2), username is ignored
$r = $RSObject.SetDatabaseConnection($server,$dbName,2,'','')
CheckResult $r "SetDatabaseConnection"  

## Setting the Report Manager URL ##

## SetVirtualDirectory for Reports (Report Manager) site
$r = $RSObject.SetVirtualDirectory('ReportManager','Reports',1033)
CheckResult $r "SetVirtualDirectory"

## ReserveURL for ReportManager  - port $HTTPport
$r = $RSObject.ReserveURL('ReportManager',"http://+:$HTTPport",1033)
CheckResult $r "ReserveURL for ReportManager port $HTTPport"

## Open Firewall port for $HTTPport
New-NetFirewallRule -DisplayName “Report Server (TCP on port $HTTPport)” -Direction Inbound –Protocol TCP –LocalPort $HTTPport
