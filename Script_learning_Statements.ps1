#learning statement flow, which executes when a condition is met..

# if statement
$Numberofvideos = 20

if($Numberofvideos -ge 10)
{
    "Greater than or equal to 10"
}
else {
    "less than 10"
}


#while statement

$i=1
while($i -le 10)
{   
    $i
    ++ $i
}

$j=2
while ($j -le 20) {
    $j
    ++ $j
}

# for statement

#for ($i = 1; $i -lt $array.Count; $i++) {
    <# Action that will repeat until the condition is met #>
}

for($i=1;$i -le 10;++$i)
{
    $i
}

#foreach statement

$Collection = 'Cafe1', 'cafe2', 'cafe3'
foreach ($cafecollection in $Collection)
{
    $cafecollection
}

$Courselist = @(
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

foreach($course in $Courselist)
{
    $course.ID
    $course.Name
    $course.Rating
}