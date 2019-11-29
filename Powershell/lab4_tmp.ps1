#lab4

ForEach-Object {

#Get-WmiObject -class win32_operatingsystem | Select-Object CSname,version |fl
#Get-WmiObject -class win32_computersystem | Select-Object description |fl
#Get-WmiObject -class win32_processor |  Select-Object name,MaxClockSpeed,NumberOfCores,L1CacheSize,L2CacheSize,L3CacheSize |ft

  #Get-WmiObject -class win32_diskdrive | Select-Object Manufacturer,model 
  #Get-WmiObject -class win32_diskdrive, win32_logicaldisk | fl
  #Get-WmiObject -class | fl

} 




$drives=Get-WmiObject -class win32_diskdrive
$logicaldisk=Get-WmiObject -class  win32_logicaldisk
#$disk+=Get-WmiObject -class  win32_diskpartition

$diskconfigs=foreach ( $disk in $logicaldisk ) {
 
 $part= $disk.GetRelated('win32_diskpartition')

 new-object -TypeName psobject -Property @{
     "Vendor" = $drives.manufacturer
     "model" = $drives.model
     "Filesystem Drive"=$part.name
     "Size(GB)"=$part.size/1gb |  where-object {$part.size -ne 0}
     "Free space(GB)"=$part.freespace/1gb |  where-object {$part.freespace -ne $null}
     #"% Free"=100*$part.freespace/$_.size |  where-object {$part.size -ne 0}
 }
} 

$diskconfigs |Format-Table -AutoSize "Vendor","model","Filesystem Drive","Size(GB)","Free space(GB)","% Free"



#get-wmiobject -class win32_processor  | Where-Object MaxClockSpeed -ne $null |
#format-table -autosize  @{Label="Speed"; Expression={$_.MaxClockSpeed}},
# @{Label="Number of Core"; Expression={$_.NumberOfCores}},
# @{Label="L2 CacheSize(MB)"; Expression={$_.L2CacheSize/1mb}},
#@{Label="L3 CacheSize(MB)"; Expression={$_.L3CacheSize/1mb}}