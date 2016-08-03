$masterSvc = "neu0scusmasterneust1"
$partitionSvc = "neu0scus0001neust1"

$masterRole = Get-AzureService neu0scusmasterneust1
$partitionRole = Get-AzureService neu0scus0001neust1


$masterRole.OperationDescription

function stopIoTSvcs()
{
    stop-AzureService neu0scus0001neust1
    stop-AzureService neu0scusmasterneust1
}

function startIoTSvcs()
{
    Start-AzureService neu0scusmasterneust1
    Start-AzureService neu0scus0001neust1
}

function getNonReadyRoles()
{
    $foundInstances = (Get-AzureDeployment $masterSvc -Slot Production).RoleInstanceList | Where-Object { $_.InstanceStatus -eq "ReadyRole" } | ft -Property RoleName, InstanceName, InstanceStatus    
    $foundInstances.Count
    $foundIntances

    $foundInstances = (Get-AzureDeployment $partitionSvc -Slot Production).RoleInstanceList | Where-Object { $_.InstanceStatus -eq "ReadyRole" } | ft -Property RoleName, InstanceName, InstanceStatus    
    $foundInstances.Count
    $foundInstances


}