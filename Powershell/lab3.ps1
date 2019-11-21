#Powershell disk usage report
#Create a script which produces a report showing the space usage for the filesystems in the computer.

#Use the get-wmiobject command as shown below to get a collection of disk filesystem objects.
#Only include filesystems which have a non-zero size. Use a pipeline with a where-object filter.
#Your report must be a table showing only the filesystem drive letter, size of filesystem, free space, and providername.
#Use format-table to format your output and your numbers must be human-friendly

gwmi -class win32_logicaldisk | where-object size -gt 0 | format-table -autosize DeviceID,
 @{n="Size(GB)"; e={$_.size/1gb -as [int]}},
 @{n="Free(GB)"; e={$_.freespace/1gb -as [int]}},
 @{n="% Free"; e={100*$_.freespace/$_.size -as [int]}},
 ProviderName

#Powershell software report
#Create a script which shows the non-Microsoft software installed on the system.

#Use the get-wmiobject command as shown below to get a collection of software product objects.
#Your output must be sorted by the install date of each software product.
#Your report must be a table with columns for software name, vendor, version, and install date only. Use format-table to format your output.


gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | Sort-Object InstallDate | Select-Object name,vendor,version,InstallDate |format-table -autosize 