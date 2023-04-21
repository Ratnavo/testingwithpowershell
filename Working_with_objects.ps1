# Using collection of mobiles

$Mobiles = @(
    [PSCustomObject]@{
        Brand = "Samsung"
        Model = "Galaxy S22 Ultra"
        Storage = @(
            "128GB","256GB"
        )
        Colors = @(
            "Burgundy","Black","White"
        )
        DefaultApps = @(
            #Using hastables here
            @{
                Name ="Assist App"
                Status = "Installed"
                Version = 1.0
            }
            @{
                Name    = "Play Store"
                Status  = "Installed"
                Version = 1.2
            }
        )
    }
    [PSCustomObject]@{
        Brand       = "OnePlus"
        Model       = "8 Pro"
        Storage     = @(
            "128GB", "256GB"
        )
        Colors      = @(
            "Black", "White"
        )
        DefaultApps = @(
            #Using hastables here
            @{
                Name    = "Assist App"
                Status  = "Installed"
                Version = 1.0
            }
            @{
                Name    = "Play Store"
                Status  = "Installed"
                Version = 1.2
            }
        )
    }
)