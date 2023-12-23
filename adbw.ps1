adb connect "device_static_ip":$(nmap "device_static_ip" -p 30000-60000 | Where-Object{$_ -match "tcp open"} | ForEach-Object {$_.split("/")[0]})
