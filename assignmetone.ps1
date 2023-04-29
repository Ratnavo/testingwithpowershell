#creating multiple containers for an existing storage account
# multiple containers such as container-a, container-b, container-c
# have one commandlet and run it in a loop

$StorageAccount = Get-AzStorageAccount -Name $ExistingStorageAccount -ResourceGroupName $ResourceGroupName

$AccountName = "rdstorageaccount007"
$RG = "RG-CI-PS-2"

$StorageAccount = Get-AzStorageAccount -Name $AccountName -ResourceGroupName $RG

$ExistingStorageAccount = "rdstorageaccount007"
$ResourceGroupName = "RG-CI-PS-2"
$customcontainerfunction=@{
       Name = 'container-a'
   }
   {
       Name = 'container-b'    
   }
   {
           Name = 'container-c'
   }


$StorageAccount = Get-AzStorageAccount -Name $ExistingStorageAccount -ResourceGroupName $ResourceGroupName
$ContainerOutput = New-AzStorageContainer  $customcontainerfunction -Context $StorageAccount.Context `
    -Permission Blob