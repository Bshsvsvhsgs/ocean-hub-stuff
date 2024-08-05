local function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end

local function resetCharacterProperties(char)
    for _, child in pairs(char:GetDescendants()) do
        if child:IsA("BasePart") then
            child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
        end
    end
end

local function enableSpi()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local rootPart = getRoot(char)
    if not rootPart then return end
    
    local bambam = Instance.new("BodyAngularVelocity")
    bambam.Name = "0"
    bambam.Parent = rootPart
    bambam.AngularVelocity = Vector3.new(0, 99999, 0)
    bambam.MaxTorque = Vector3.new(0, math.huge, 0)
    bambam.P = math.huge
    
    for _, child in pairs(char:GetDescendants()) do
        if child:IsA("BasePart") then
            child.Massless = true
            child.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

local function disableSpi()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local rootPart = getRoot(char)
    if not rootPart then return end
    
    for i, v in pairs(rootPart:GetChildren()) do
        if v.ClassName == 'BodyAngularVelocity' then
            v:Destroy()
        end
    end
    
    resetCharacterProperties(char)
end
