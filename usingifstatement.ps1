

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
# create file share

$AccountName = "rdstorageaccount007"
$RG = "RG-CI-PS-2"

$StorageAccount = Get-AzStorageAccount -Name $AccountName -ResourceGroupName $RG

#Creating File share but first we create hash table properties to denote the properties

$FileShareConfig = @{
    Context = $StorageAccount.Context
    Name = "mydata"
}

# splatting

New-AzStorageShare @FileShareConfig

$Directorydetails = @{
    Context = $StorageAccount.Context
    ShareName = 'mydata'
    Path = 'C:\Users\ratna\Documents\samplesecond.txt'
}

New-AzstorageDirectory @$Directorydetails

C:\Users\ratna\Documents\samplesecond.txt

$FileDetails = @{
    Context = $StorageAccount.Context
    ShareName = 'mydata'
    Source = 'samplesecond.txt'
    Path = 'C:\Users\ratna\Documents\samplesecond.txt'
}