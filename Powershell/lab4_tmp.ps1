#lab4

<#
ForEach-Object {

Get-WmiObject -class win32_operatingsystem | Select-Object CSname,version |fl
Get-WmiObject -class win32_computersystem | Select-Object description |fl
Get-WmiObject -class win32_processor |  Select-Object name,MaxClockSpeed,NumberOfCores,L1CacheSize,L2CacheSize,L3CacheSize |ft

  Get-WmiObject -class win32_diskdrive | Select-Object Manufacturer,model 
  Get-WmiObject -class win32_diskdrive, win32_logicaldisk | fl
  Get-WmiObject -class | fl} 

#>

$disks=Get-WmiObject -class  win32_logicaldisk |  where-object size -gt 0 


$diskConfig=foreach ($disk in $disks) {
$part = $disk.GetRelated('win32_diskpartition')
$drive = $part.GetRelated('win32_diskdrive')
    
     new-object -TypeName psobject -Property @{
     "Vendor" = $drive.manufacturer
     "model" = $drive.model
     #"Filesystem Drive"=$part.name
     "Size(GB)"=$drive.size/1gb -as [int]
     "Free space(GB)"=$disk.freespace/1gb -as [int] 
     "% Free"=100*$disk.freespace/$drive.size  -as [int]

}
} 
$diskConfig|Format-Table -AutoSize "Vendor","model","Size(GB)","Free space(GB)","% Free"


#$drives=Get-WmiObject -class win32_diskdrive
#$logicaldisk=Get-WmiObject -class  win32_logicaldisk
#$disk+=Get-WmiObject -class  win32_diskpartition

#$diskconfigs=foreach ( $disk in $drives ) {
 
 #$part = $disk.GetRelated('win32_logicaldisk') 

 #new-object -TypeName psobject -Property @{
#     "Vendor" = $part.manufacturer
#     "model" = $part.model
#     "Filesystem Drive"=$part.devicei
#     "Size(GB)"=$part.size/1gb 
#     "Free space(GB)"=$part.freespace/1gb 
#     "% Free"=100*$part.freespace/$_.size
# }
#} 

#$diskconfigs |Format-Table -AutoSize "Vendor","model","Filesystem Drive","Size(GB)","Free space(GB)"



#get-wmiobject -class win32_processor  | Where-Object MaxClockSpeed -ne $null |
#format-table -autosize  @{Label="Speed"; Expression={$_.MaxClockSpeed}},
# @{Label="Number of Core"; Expression={$_.NumberOfCores}},
# @{Label="L2 CacheSize(MB)"; Expression={$_.L2CacheSize/1mb}},
#@{Label="L3 CacheSize(MB)"; Expression={$_.L3CacheSize/1mb}}