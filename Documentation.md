# VortexLib Documentation. #


# Booting The Library #

To Boot The VoetexUi Library, Put The Loadstring In Ur VS Code Or Executor.

```loadstring(game:HttpGet('https://raw.githubusercontent.com/SpectreVC/UiLib.lua/Core/Core.lua'))()```

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
