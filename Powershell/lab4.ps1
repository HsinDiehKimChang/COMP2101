
Write-Output "System report (human-friendly)"

get-wmiobject -class win32_computersystem | 
Format-list  @{Label="System Hardware Description"; Expression={$_.description}}

get-wmiobject -class win32_operatingsystem |
Format-list   @{Label="Operating System Name "; Expression={$_.name}},
@{Label="Version"; Expression={$_.version}}


get-wmiobject -class win32_processor |Where-Object MaxClockSpeed -ne $null |
foreach {
 new-object -TypeName psobject -Property @{
 "Speed(GHz)" = $_.MaxClockSpeed
 "Number of Core" = $_.NumberOfCores
 "L2 CacheSize(MB)" = $_.L2CacheSize/1mb
 "L3 CacheSize(MB)" = $_.L3CacheSize/1mb
 }
} |
Format-list  "Speed(GHz)","Number of Core","L2 CacheSize(MB)","L3 CacheSize(MB)"


$totalmemory = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 "Vendor" = $_.manufacturer
 "Description" = $_.Description
 "Speed(MHz)" = $_.ConfiguredClockSpeed
 "Size(MB)" = $_.capacity/1mb
 "Bank" = $_.banklabel
 "Slot" = $_.devicelocator
 }
 $totalmemory += $_.capacity/1mb
} |
Format-Table -AutoSize "Vendor","Description", "Size(MB)", "Speed(MHz)", "Bank", "Slot"
"Total RAM: ${totalmemory}MB "

$disk=@()

$disk+=Get-WmiObject -class win32_diskdrive
$disk+=Get-WmiObject -class  win32_logicaldisk
$disk+=Get-WmiObject -class  win32_diskpartition


$totalmemory = 0

$disk| where-object size -gt 0 | 
foreach {
 new-object -TypeName psobject -Property @{
 "Vendor" = $_.manufacturer
 "model" = $_.model
 "Filesystem Drive"=$_.name
 "Size(GB)"=$_.size/1gb 
 "Free space(GB)"=$_.freespace/1gb
 "% Free"=100*$_.freespace/$_.size
 }
} |
Format-Table -AutoSize "Vendor","model","Filesystem Drive","Size(GB)","Free space(GB)","% Free"

get-wmiobject -class win32_videocontroller |
Format-list   @{Label="Vendor"; Expression={$_.AdapterCompatibility}},
@{Label="Description"; Expression={$_.Description}},
@{Label="Current Screen Resolution(Pixels)"; Expression={$_.CurrentHorizontalResolution*$_.CurrentVerticalResolution}}