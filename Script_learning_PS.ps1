#learning arrays = A collection of value

$Collection = 'Cafe1','cafe2','cafe3'
$collection

$Weekend_1 = @(
    'Echoes'
    'Coffee Browney'
    'Burger'
)

$Weekend_1[0]

$Weekend_1[0] = 'Echoes Living Tomorrow'

$Weekend_1


#Learning Hash Tables. These are keyv/values stores. 

$ServerNames=@{
    Networking="Server1"
    Storage='Server2'
    VirtualMachine='Server3'
}

$ServerNames['Networking']
$ServerNames.Storage

#Adding to hash tables

$ServerNames.Add('QA','Server4')

$ServerNames
