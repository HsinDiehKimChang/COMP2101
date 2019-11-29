#lab4

ForEach-Object {

#Get-WmiObject -class win32_operatingsystem | Select-Object CSname,version |fl
#Get-WmiObject -class win32_computersystem | Select-Object description |fl
#Get-WmiObject -class win32_processor |  Select-Object name,MaxClockSpeed,NumberOfCores,L1CacheSize,L2CacheSize,L3CacheSize |ft

  #Get-WmiObject -class win32_diskdrive | Select-Object Manufacturer,model 
  #Get-WmiObject -class win32_diskdrive, win32_logicaldisk | fl
  #Get-WmiObject -class | fl

} 


$disk=@()

$disk+=Get-WmiObject -class win32_diskdrive
$disk+=Get-WmiObject -class  win32_logicaldisk

$disk | ft -Property model

#get-wmiobject -class win32_processor  | Where-Object MaxClockSpeed -ne $null |
#format-table -autosize  @{Label="Speed"; Expression={$_.MaxClockSpeed}},
# @{Label="Number of Core"; Expression={$_.NumberOfCores}},
# @{Label="L2 CacheSize(MB)"; Expression={$_.L2CacheSize/1mb}},
#@{Label="L3 CacheSize(MB)"; Expression={$_.L3CacheSize/1mb}}