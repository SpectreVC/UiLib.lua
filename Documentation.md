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


# Creating a Tab #


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








