local player = game.Players.LocalPlayer


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


function CreateToggle(params)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = params.Name
    toggleButton.Parent = params.ParentTab
    toggleButton.Position = params.Position or UDim2.new(0, 0, 0, 0)
    toggleButton.Size = UDim2.new(0, 200, 0, 30)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Text = params.Name
    toggleButton.TextSize = 24
    toggleButton.Font = Enum.Font.DenkOne
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.TextStrokeTransparency = 1
    toggleButton.MouseButton1Click:Connect(function()
        params.Callback(not toggleButton:IsA("TextButton") or not toggleButton:IsA(toggleButton, "Pressed"))
        toggleButton.TextColor3 = toggleButton:IsA(toggleButton, "Pressed") and Color3.new(0.5, 0, 0.8) or Color3.new(1, 1, 1)
    end)

    return toggleButton
end


function CreateTabToggle(params)
    local button = Instance.new("TextButton")
    button.Name = "ToggleTabsButton"
    button.Parent = screenGui  -- Make sure to have screenGui defined
    button.Position = params.Position or UDim2.new(0.95, 0, 0.4, 0)
    button.Size = params.Size or UDim2.new(0, 80, 0, 40)
    button.BackgroundTransparency = 0.5
    button.BackgroundColor3 = Color3.new(0, 0, 0)
    button.Text = "VC"
    button.TextSize = 18
    button.Font = Enum.Font.DenkOne
    button.TextColor3 = Color3.new(1, 1, 1)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 1
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = button

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = button

    local tabEnabled = false

    button.MouseButton1Click:Connect(function()
        tabEnabled = not tabEnabled
        params.Callback(tabEnabled)
    end)

    return button
end


