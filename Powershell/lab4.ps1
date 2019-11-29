

#get-wmiobject -class win32_operatingsystem | Select-Object name,version |ft

#get-wmiobject -class win32_computersystem | Select-Object description |ft




get-wmiobject -class win32_processor  | Where-Object MaxClockSpeed -ne $null |
format-table -autosize  @{Label="Speed"; Expression={$_.MaxClockSpeed}},
 @{Label="Number of Core"; Expression={$_.NumberOfCores}},
 @{Label="L2 CacheSize(MB)"; Expression={$_.L2CacheSize/1mb}},
@{Label="L3 CacheSize(MB)"; Expression={$_.L3CacheSize/1mb}}




#get-wmiobject -class win32_physicalmemory