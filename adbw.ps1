adb disconnect 
$null = adb connect 192.168.1.100:$(nmap 192.168.1.100 -p 30000-50000 -open | Where-Object{$_ -match "tcp open"} | ForEach-Object {$_.split("/")[0]})
$null
# Check if the device is connected through wireless adb
$adbDevices = adb devices | Select-Object -Skip 1 -First 1
if ($adbDevices -match 'device') {
    Write-Output "Device is connected through wireless adb"
} else {
    Write-Output "Device is not connected through wireless adb"
}

