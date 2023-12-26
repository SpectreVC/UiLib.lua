# VortexLib Documentation. #


# Booting The Library #

To Boot The VoetexUi Library, Put The Loadstring In Ur VS Code Or Executor.

```

loadstring(game:HttpGet('https://raw.githubusercontent.com/SpectreVC/UiLib.lua/Core/Core.lua'))()

```

This Is Necessary, If You Do Not Have The Loadstring, It Won't Work. 


# Creating a Tab #

```
local myTab = CreateTab({
    TABNAME = "CombatTab",
    POSITION = UDim2.new(0, 10, 0, 10),
    NAME = "Combat",
    SIZE = UDim2.new(0, 230, 0.8, 50)
})

--[[
TABNAME ( Name Ur Existing Tab )
POSITION ( where you want ur tab to be )
NAME ( name of the tittle )
SIZE ( the size of the tab )
]]
```


# Creating a Toggle #


```
local toggle = CreateToggle({
    Name = "Toggle1",
    ParentTab = myTab,
    Position = UDim2.new(0, 10, 0, 60),
    Callback = function(isToggled)
        print("Toggle1 is now:", isToggled)
    end
})

--[[
Name ( the Name Of the Toggle )
ParentTab ( To What Tab the Toggle Is Parented  )
Position ( The Position where The Toggle Will Be On The Tab )
Callback ( you know what a callback is Sherlock )
]]

```

# Creating a Tab Toggle #


```


CreateTabToggle({
    Position = UDim2.new(0.95, 0, 0.4, 0),
    Size = UDim2.new(0, 80, 0, 40),
    Callback = function(tabsEnabled)
        print("Tabs are now:", tabsEnabled and "enabled" or "disabled")
    end
})

--[[
Position ( Where The Tab Lock Is Going To Be )
Size ( The Size Of The TabToggle )
Callback ( you know what a callback is Sherlock)
note: I will have to add more stuff to this, because not every dev necessarily wants the toggle to have "VC" as a text
]]

```

**Note: The UiLib Is In Early Beta, I Will Add Alot More To It, My Plan on The Future Is To add Dropdowns, Themeses, Sliders, more customization to tab Toggle
Made By Spectre On Discord**





