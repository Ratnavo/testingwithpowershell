#============================= creating VNet =============================
$ResourceGroupName = 'PS_RG_IC'
$Location = "Central India"

$VirtualNetworkName ="PSVNet"
$VirtualNetworkAddressSpace = "192.168.20.0/24"
$Subnet = "default"
$SubnetAddressSpace = "192.168.20.0/25"

#Create the subnet resource by using the following:

$Subnetvariable = New-AzVirtualNetworkSubnetConfig -Name $Subnet -AddressPrefix $SubnetAddressSpace

#Create VNet 
$VNetVariable = New-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName `
-Location $Location -AddressPrefix $VirtualNetworkAddressSpace -Subnet $Subnetvariable

# Verifying the VNet Details:
$VNetVariable 

#============================= Creating Network Interface ===================================

#Fetching the details before configuration:
$VNetVariableGet = Get-AzVirtualNetwork -Name "PSVNet" -ResourceGroupName "PS_RG_IC"
$VNetVariableGet

$SubnetConfig = Get-AzVirtualNetworkSubnetConfig -Name "default" -VirtualNetwork $VNetVariableGet
$NICname = "NIC-1"

$CreatenewNIC = New-AzNetworkInterface -Name $NICname -ResourceGroupName 'PS_RG_IC' -Location "centralindia" -Subnet $SubnetConfig
$CreatenewNIC


#============================= Creating Public IP Address ===================================
$ip = @{
    Name              = 'PS-PublicIP'
    ResourceGroupName = 'PS_RG_IC'
    Location          = 'centralindia'
    Sku               = 'Standard'
    AllocationMethod  = 'Static'
    IpAddressVersion  = 'IPv4'
  #  Zone              = 1, 2, 3
}
New-AzPublicIpAddress @ip

# Attach the Public IP to a NIC

$PubIPName = Get-AzPublicIpAddress -Name PS-PublicIP
$NICname = "NIC-1"
$ResourceGroupName = 'PS_RG_IC'

$FetchNIC = Get-AzNetworkInterface -Name $NICname -ResourceGroupName $ResourceGroupName

$IPconfig = Get-AzNetworkInterfaceIpConfig -NetworkInterface $FetchNIC

Set-AzNetworkInterfaceIpConfig -PublicIpAddress $PubIPName -NetworkInterface $FetchNIC

$FetchNIC | Set-AzNetworkInterface
#============================= Creating NSG ===================================


#============================= Creating VM using PowerShell ===================================
ResourceGroupName = 'PS_RG_IC' 
Name = 'PSVM'
Location = 'central india' 
VirtualNetworkName = 'VM-Win-11-vnet'
SubnetName = 'default'
SecurityGroupName = 'myNetworkSecurityGroup'
PublicIpAddressName = 'PSVM-PubIP'
OpenPorts = 80, 3389

New-AzVM -Name "PSVM"
#============================= Use the below command to remove RG =============================
Remove-AzResourceGroup -Name 'myResourceGroup'
#==============================================================================================