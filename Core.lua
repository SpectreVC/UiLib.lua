local player = game.Players.LocalPlayer

function CreateTab(name, position, title, size)
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local tabFrame = Instance.new("Frame")
    tabFrame.Name = name
    tabFrame.Position = position
    tabFrame.Size = size or UDim2.new(0, 200, 0, 50)
    tabFrame.BackgroundTransparency = 0.5
    tabFrame.BackgroundColor3 = Color3.new(0, 0, 0)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.new(1, 1, 1)
    uiStroke.Parent = tabFrame

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = tabFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = tabFrame
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.Position = UDim2.new(0, 0, 0, 5)
    titleLabel.Text = title
    titleLabel.TextSize = 32
    titleLabel.Font = Enum.Font.DenkOne
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextStrokeTransparency = 0
    titleLabel.TextStrokeColor3 = Color3.new(0, 0, 1)
    titleLabel.BackgroundTransparency = 1

    tabFrame.Parent = screenGui

    return tabFrame
end

function CreateToggle(name, callback, parentTab, position, defaultValue)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = name
    toggleButton.Parent = parentTab
    toggleButton.Position = position or UDim2.new(0, 0, 0, 0)
    toggleButton.Size = UDim2.new(0, 200, 0, 30)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Text = name
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

    local isToggled = toggleStates[name] or defaultValue or false

    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        callback(isToggled)

        toggleButton.TextColor3 = isToggled and Color3.new(0.5, 0, 0.8) or Color3.new(1, 1, 1)
        toggleButton.BackgroundColor3 = isToggled and Color3.new(0.2, 0.2, 0.2) or Color3.new(0, 0, 0)

        toggleStates[name] = isToggled
        writefile(filePath, game.HttpService:JSONEncode(toggleStates))
    end)

    return toggleButton
end
