$date = (Get-Date).AddDays(-1); Get-EventLog -LogName Security -InstanceId 4625 -After $date | 
Select-Object TimeGenerated, index, InstanceId, @{n='Username';e={$_.ReplacementStrings[5]}}, 
    @{n='IpAddress';e={$_.ReplacementStrings[-2]}}, @{n='NetworkAuth';e={$_.ReplacementStrings[13]}} | 
    out-gridview