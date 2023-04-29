#============ Create a Azure Data Lake Gen 2 Storage account
# Create an Azure Gen2 Storage Account. Create a container. Create a directory in the container. And then upload a file to the directory.

# You can start with the following variables. Just remember to change the Storage account name to reflect a unique name.

# 1. Use the same commands to create a storage account and the container as with normal storage accounts.

# 2. To create the directory in the container and to upload the file , make use of the cmdlet - New-AzDataLakeGen2Item

# Questions for this assignment
# Create a script that can be used to meet the requirement as per the earlier

# Vertify if the Powershell Module is installed 5.1 higher or not.

#echo $PSVersionTable.PSVersion.ToString()

# Install PS module:

#Install-Module Az.Storage -Repository PSGallery -Force

#Connect to Azure Account:


# use RG
ResourceGroupName : PS_RG_IC
#Location          : centralindia
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/bec0324e-4ff3-4e18-8d7b-2741bb57234f/resourceGroups/PS_RG_IC


$AccountName = "datalake57677ratnavo"
$AccountKind = "StorageV2"
$AccountSKU = "Standard_LRS"
$ResourceGroupName = "PS_RG_IC"
$Location = "centralindia"

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
    -Location $Location -Kind $AccountKind -SkuName $AccountSKU

$Location = "Central India"
$ContainerNameNew = "data"

$StorageAccount = Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName
$ContainerOutput = New-AzStorageContainer -Name $ContainerNameNew -Context $StorageAccount.Context `
    -Permission Blob
    
$Path = "C:\Users\ratna\Documents\Test_file.txt"
$Blobobject = @{
    Filelocation = "C:\Users\ratna\Documents\Test_file.txt" #Creating Hash Table
    ObjectName   = "Test_file.txt"
}

Set-AzStorageBlobContent -Context $StorageAccount.Context -Container $ContainerNameNew `
    -File $Blobobject.Filelocation -Blob $Blobobject.ObjectName

#=============== Creating the file from via Udemy help

$AccountName = "datalake57677"
$AccountKind = "StorageV2"
$AccountSKU = "Standard_LRS"
$ResourceGroupName = "powershell-grp"
$Location = "North Europe"

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
    -Location $Location -Kind $AccountKind -SkuName $AccountSKU -EnableHierarchicalNamespace $true

# Create a container in the storage account
$ContainerName = "data"
New-AzStorageContainer -Context $StorageAccount.Context -Name $ContainerName

# Creating a directory to the storage account

$DirectoryName = "files"

New-AzDataLakeGen2Item -Context $StorageAccount.Context `
    -FileSystem $ContainerName -Path $DirectoryName -Directory

# Uploading a file to the directory

$FileName = "init.sql"
$CompleteStoragePath = "files\init.sql"

New-AzDataLakeGen2Item -Context $StorageAccount.Context `
    -FileSystem $ContainerName -Path $CompleteStoragePath `
    -Source $FileName -Force
#===================== Completed