local player = game.Players.LocalPlayer
--Tab

function CreateTab(params)
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local tabFrame = Instance.new("Frame")
    tabFrame.Name = params.TABNAME
    tabFrame.Position = params.POSITION
    tabFrame.Size = params.SIZE or UDim2.new(0, 200, 0, 50)
    tabFrame.BackgroundTransparency = 0.5

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 70))
    }
    gradient.Parent = tabFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = tabFrame

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = tabFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = tabFrame
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.Position = UDim2.new(0, 0, 0, 5)
    titleLabel.Text = params.NAME
    titleLabel.TextSize = 32
    titleLabel.Font = Enum.Font.DenkOne
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextStrokeTransparency = 0
    titleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    titleLabel.BackgroundTransparency = 1

    tabFrame.Parent = screenGui

    return tabFrame
end


-- Function to create a toggle
function CreateToggle(params)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = params.Name
    toggleButton.Parent = params.ParentTab
    toggleButton.Position = params.Position or UDim2.new(0, 0, 0, 0)
    toggleButton.Size = UDim2.new(0, 200, 0, 30)
    toggleButton.BackgroundTransparency = 1

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 70))
    }
    gradient.Parent = toggleButton

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = toggleButton

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = toggleButton

    toggleButton.Text = params.Name
    toggleButton.TextSize = 24
    toggleButton.Font = Enum.Font.DenkOne
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.TextStrokeTransparency = 1

    local filePath = "VortexClientSV.json"
    local toggleStates = {}

    local fileExists = pcall(readfile, filePath)

    if fileExists then
        local fileContent = readfile(filePath)
        if fileContent then
            local success, decodedContent = pcall(game.HttpService.JSONDecode, game.HttpService, fileContent)
            if success and decodedContent then
                toggleStates = decodedContent
            end
        end
    end

    local isToggled = toggleStates[params.Name] or params.DefaultValue or false

    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        params.Callback(isToggled)

        toggleButton.TextColor3 = isToggled and Color3.new(1, 0, 1) or Color3.new(1, 1, 1)
        toggleButton.BackgroundColor3 = isToggled and Color3.new(0.5, 0, 0.8) or Color3.new(0, 0, 0)

        toggleStates[params.Name] = isToggled
        writefile(filePath, game.HttpService:JSONEncode(toggleStates))
    end)

    -- Set initial colors based on the initial state
    toggleButton.TextColor3 = isToggled and Color3.new(1, 0, 1) or Color3.new(1, 1, 1)
    toggleButton.BackgroundColor3 = isToggled and Color3.new(0.5, 0, 0.8) or Color3.new(0, 0, 0)

    return toggleButton
end


-- TabToggle
function CreateTabToggle(params)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "TabToggle"
    toggleButton.Parent = screenGui
    toggleButton.AnchorPoint = Vector2.new(1, 0.5)
    toggleButton.Position = params.Position or UDim2.new(0.95, 0, 0.4, 0)
    toggleButton.Size = params.Size or UDim2.new(0, 80, 0, 40)
    toggleButton.BackgroundTransparency = 1

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 70))
    }
    gradient.Parent = toggleButton

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 1
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = toggleButton

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = toggleButton

    local tabsEnabled = true  -- Initial state, tabs are enabled

    toggleButton.MouseButton1Click:Connect(function()
        tabsEnabled = not tabsEnabled
        params.Callback(tabsEnabled)

        toggleButton.TextColor3 = tabsEnabled and Color3.new(1, 1, 1) or Color3.new(0.5, 0, 0.8)
    end)

    toggleButton.Visible = true  -- Ensure the toggle is initially visible

    return toggleButton
end
