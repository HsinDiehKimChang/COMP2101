#lab4



$a=Get-WmiObject -class win32_operatingsystem | Select-Object CSname,version

$b=Get-WmiObject -class win32_computersystem | Select-Object description

$c=Get-WmiObject -class win32_processor |  Select-Object name,MaxClockSpeed,NumberOfCores,L1CacheSize,L2CacheSize,L3CacheSize 

