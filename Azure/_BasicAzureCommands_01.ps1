#Fields
    $_azSubIds = @{};
    $_azSubs = @{};

function setup(){
    cls
}

function login(){
    $tenantId = "0fd0787e-b2c5-4563-9e9a-0439cf45142e"

    $MyAzureName = "Automation@donmckenzielive.onmicrosoft.com";
    $MyAzurePassword = ConvertTo-SecureString '@Pa55word' -AsPlainText -Force;

    $AzureRMCredential = new-object   -typename System.Management.Automation.PSCredential -argumentlist $MyAzureName, $MyAzurePassword;

    Login-AzureRmAccount -TenantId $tenantId -Credential $AzureRMCredential
}

function getSubscriptions(){
    Get-AzureRmSubscription

    #Select the VM sub
    $sub = Select-AzureRmSubscription -SubscriptionId $_azSubIds.VM
    $_azSubs.Add("VM", $sub)

    <# Automation doesn't have access to these subs
    #Select the DB sub
    Select-AzureRmSubscription -SubscriptionId $_azSubIds.DB
    #Select the 25gb Dev sub 
    Select-AzureRmSubscription -SubscriptionId $_azSubIds.Dev
    #>

}

function setSubIds(){
    $_azSubIds.Add("VM", "3d5fb527-35da-4762-97d9-556e3a47907b");
    $_azSubIds.Add("DB", "34912774-37f8-465d-bba5-b173c44e1186");
    $_azSubIds.Add("Dev", "d9ffabb1-9fbd-4cd2-b100-ea7686faf467");
}
function getVMs(){

}


setup
login
setSubIds
getSubscriptions
