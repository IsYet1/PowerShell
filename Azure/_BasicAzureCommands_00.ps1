<#
Credentials: Automation@donmckenzielive.onmicrosoft.com
#>

function setup(){
    Import-Module "C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Azure.psd1"
}

#Subscriptons
function setSubIds(){
    $azSubIds = @{};
    $azSubIds.Add("VM", "3d5fb527-35da-4762-97d9-556e3a47907b");
    $azSubIds.Add("DB", "34912774-37f8-465d-bba5-b173c44e1186");
    $azSubIds.Add("Dev", "d9ffabb1-9fbd-4cd2-b100-ea7686faf467");
}

<#
$azSubIds.Dev;
$azSubIds.DB
$azSubIds.VM
$azSubIds.Keys
$azSubIds.ContainsKey("VM")
$azSubIds.Values
#>
Get-AzureRmSubscription
#Select the VM sub
Select-AzureRmSubscription -SubscriptionId $azSubIds.VM
#Select the DB sub
Select-AzureRmSubscription -SubscriptionId $azSubIds.DB
#Select the 25gb Dev sub 
Select-AzureRmSubscription -SubscriptionId $azSubIds.Dev

#login
Login-AzureRmAccount


#login with Tenant
$tenantId = "0fd0787e-b2c5-4563-9e9a-0439cf45142e"
Login-AzureRmAccount -TenantId $tenantId


#List subscriptions
Get-AzureRmSubscription

#Select the VM subscription
Select-AzureRmSubscription -SubscriptionId 3d5fb527-35da-4762-97d9-556e3a47907b
#or
Get-AzureRmSubscription -SubscriptionId "3d5fb527-35da-4762-97d9-556e3a47907b" | Select-AzureRmSubscription

$vm = Get-AzureRmVM -ResourceGroupName "VM1" -Name "VS2015win10"


function listVMs(){
    Select-AzureRmSubscription -SubscriptionId $azSubIds.VM
    $RGs = Get-AzureRMResourceGroup
        foreach($RG in $RGs)
        {
            Write-Output $RG.name;
            $VMs = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName
            foreach($VM in $VMs)
            {
                $VMDetail = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName -Name $VM.Name -Status
                foreach ($VMStatus in $VMDetail.Statuses)
                { 
                    if($VMStatus.Code.CompareTo("PowerState/deallocated") -eq 0)
                    {
                        $VMStatusDetail = $VMStatus.DisplayStatus
                    }
                }
                write-output $VM.Name $VMStatusDetail
            }
        }
}
listVMs

function startVm(){
    setSubIds;
    Select-AzureRmSubscription -SubscriptionId $azSubIds.VM
    Get-AzureRmVM -ResourceGroupName VM1 -Name VS2015win10
    <#
    Alternative:
    $vm = Get-AzureRmVM -ResourceGroupName VM1 -Name VS2015win10
    $vm | Start-AzureRmVM
    $vm | Stop-AzureRmVM
    #>
#    Start-AzureRmVM -ResourceGroupName VM1 -Name VS2015win10
}