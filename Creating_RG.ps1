# Creating RG (logical container)
# URL: 
# New-AzResourceGroup
#    [-Name] <String>
#    [-Location] <String>
#    [-Tag <Hashtable>]
#    [-Force]
#    [-ApiVersion <String>]
#    [-Pre]
#    [-DefaultProfile <IAzureContextContainer>]
#    [-WhatIf]
#    [-Confirm]
#    [<CommonParameters>]
#==============================================================================
#Disable-AzContextAutosave

$RGGroupName = "PS_RG_IC"
$ResourceLocation = "Central India"
New-AzResourceGroup -Name $RGGroupName -Location $ResourceLocation