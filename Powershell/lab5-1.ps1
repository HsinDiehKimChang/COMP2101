
Param ([Parameter(Mandatory=$true,position=0,ValueFromPipeline=$true,
 ValueFromPipelineByPropertyName=$true)][string]$ObjectName)

"Object name was '$ObjectName'"
$objTypeName = $ObjectName.gettype().name
"$ObjectName type is $Objtypename object"
