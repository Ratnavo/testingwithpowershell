$AppId = 'db1dee28-a63b-477d-bb74-2109732ae6cd'
$AppSecret = 'VtR8Q~afObwSHiXveYSZh5hlsRMcPMdoKeCYjag5'

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
    -ArgumentList $AppId, $SecureSecret
$TenantID = '5bb19d03-7f41-4ea0-bce6-d62f8e15f1e6'
Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantID

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
#======================= Check for the existence of a storage account =========================
#If the storage account exist, then don't go and add the storage account.

if (Get-AzStorageAccount -Name $ExistingStorageAccount -ResourceGroupName $ResourceGroupName)
{
    'Storage Account Already exist'
    $StorageAccount = Get-AzStorageAccount -Name $ExistingStorageAccount -ResourceGroupName $ResourceGroupName
}
else {
    'No storage account configured, creating a new one'
    $StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $CreateStorageAcc `
        -Location $Location -Kind $AccountType -SkuName $SKU
}
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

    
#=============== checking for existing storage account ======================
#use -Error SilentlyContinue