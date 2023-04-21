#Functions

function Get-Appversion {
    $PSVersionTable
}

Get-Appversion

function Add-Integer ([int]$x,[int]$y)
{
    "The sum of the integers is " +($x+$y)
}

Add-Integer 10 20