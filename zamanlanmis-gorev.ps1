$uygulama    = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'rm -Recurse -Force $env:APPDATA\Microsoft\Windows\Recent\*'
$saat  = New-ScheduledTaskTrigger -Daily -At 23:00pm
$ayar = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType "S4U" -RunLevel Highest
Register-ScheduledTask -TaskName "Gorev" -Action $uygulama -Trigger $saat -Principal $ayar -Force