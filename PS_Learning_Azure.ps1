<#
Command Reference
1. Disable-AzContextAutosave
https://docs.microsoft.com/en-us/powershell/module/az.accounts/disable-azcontextautosave?view=azps-7.3.0

2. Connect-AzAccount
https://docs.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount?view=azps-7.3.0

3. New-AzResourceGroup
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-7.3.0

#>

# Here we don't want to save the Login information
 
Disable-AzContextAutosave

# Here we are connecting to our Azure Account using Application Object


# Here we are creating a resource group

$ResourceGroupName = "powershell-grp"
$Location = "North Europe"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# Here we are removing resource group
$ResourceGroupName = "powershell-grp"
Remove-AzResourceGroup -Name $ResourceGroupName

#==============creating RG one more time=====================

$ResourceGroupName = "RG-CI-PS-2"
$Location = "Central India"
$CreateRG = New-AzResourceGroup -Name $ResourceGroupName -Location $Location
'Provisioning State ' + $CreateRG.ProvisioningState

$CreateRG

$ResourceGroupExisting = Get-AzResourceGroup -Name $ResourceGroupName
$ResourceGroupExisting

$FetchRG = Get-AzResourceGroup
$FetchRG
#=====================Removing all Resource Group =======================

#foreach($Group in $FetchRG)
#{
 #   'Removing Resource Group ' + $Group.ResourceGroupName
  #  Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force
#}

#===================== Create Storage Account =======================
Get-AzLocation
$CreateStorageAcc = "rdstorageaccount007"
$AccountType = 'StorageV2'
$SKU = 'Standard_LRS'
$Location = "Central India"
$ResourceGroupName = "RG-CI-PS-2"

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $CreateStorageAcc `
-Location $Location -Kind $AccountType -SkuName $SKU

#===================== Create container and upload Blob in Storage Account =======================

$ExistingStorageAccount = "rdstorageaccount007"
$ResourceGroupName = "RG-CI-PS-2"
$Location = "Central India"
$ContainerNameNew = "data"

$StorageAccount = Get-AzStorageAccount -Name $ExistingStorageAccount -ResourceGroupName $ResourceGroupName
$ContainerOutput = New-AzStorageContainer -Name $ContainerNameNew -Context $StorageAccount.Context `
-Permission Blob

#=============== Uploading a file ======================

$Path = "C:\Users\ratna\Documents\Test_file.txt"
$Blobobject = @{
  Filelocation = "C:\Users\ratna\Documents\Test_file.txt" #Creating Hash Table
  ObjectName   = "Test_file.txt"
}

Set-AzStorageBlobContent -Context $StorageAccount.Context -Container $ContainerNameNew `
-File $Blobobject.Filelocation -Blob $Blobobject.ObjectName