# Objects - Custom Object (Hash and Array tables are types of object but we will learn how to create custom object)

#Class are properties that defines what object that it is and we have Methods that will perform certain action for those objects

$Course=[PSCustomObject]@{
    ID = 1
    Name = 'Az104'
    Rating = 4.7
}

$Course

'The course ID is ' + $Course.ID

#Normally we will have array of object. So we will create an array and within the array we will define the objects.

$Courselist=@(
    [PSCustomObject]@{
        ID     = 1
        Name   = 'Az104'
        Rating = 4.7
    },
    [PSCustomObject]@{
        ID     = 2
        Name   = 'Az305'
        Rating = 4.8
    },
    [PSCustomObject]@{
        ID     = 3
        Name   = 'Az500'
        Rating = 4.7
    }
)

$Courselist

$Courselist[1].Name