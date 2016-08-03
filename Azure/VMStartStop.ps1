param(
    [parameter(Mandatory=$false)]
	[String] $AzureCredentialName = "Use *Default Automation Credential* Asset",
    [parameter(Mandatory=$false)]
	[String] $AzureSubscriptionName = "Use *Default Azure Subscription* Variable Value",
    [parameter(Mandatory=$false)]
    [bool]$Simulate = $false,
	[parameter(Mandatory=$false)] [int]$TZOffset = 5
)


function getParms(){
    $parameters = New-Object system.object
	Add-Member -InputObject $parameters -MemberType NoteProperty -Name AzureCredentialAssetName -Value $AzureCredentialName
	Add-Member -InputObject $parameters -MemberType NoteProperty -Name AzureSubscriptionAssetName -Value $AzureSubscriptionName
	Add-Member -InputObject $parameters -MemberType NoteProperty -Name Simulate -Value $Simulate
	Add-Member -InputObject $parameters -MemberType NoteProperty -Name TZOffset -Value $TZOffset

    return $parameters
}

$parms = getParms

Write-Output $parms