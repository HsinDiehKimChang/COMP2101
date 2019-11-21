
Write-Output "Powershell disk usage report (human-friendly)"
#Create a script which produces a report showing the space usage for the filesystems in the computer.

#Use the get-wmiobject command as shown below to get a collection of disk filesystem objects.
#Only include filesystems which have a non-zero size. Use a pipeline with a where-object filter.
#Your report must be a table showing only the filesystem drive letter, size of filesystem, free space, and providername.
#Use format-table to format your output and your numbers must be human-friendly

gwmi -class win32_logicaldisk | where-object size -gt 0 | 
format-table -autosize  @{Label="Filesystem Drive"; Expression={$_.deviceid[0]}},
 @{Label="Size(GB)"; Expression={$_.size/1gb -as [int]}},
 @{Label="Free space(GB)"; Expression={$_.freespace/1gb -as [int]}},
 ProviderName

Write-Output "Powershell non-Microsoft software report"
#Create a script which shows the non-Microsoft software installed on the system.

#Use the get-wmiobject command as shown below to get a collection of software product objects.
#Your output must be sorted by the install date of each software product.
#Your report must be a table with columns for software name, vendor, version, and install date only. Use format-table to format your output.


gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | Sort-Object InstallDate | Select-Object name,vendor,version,InstallDate |format-table -autosize 