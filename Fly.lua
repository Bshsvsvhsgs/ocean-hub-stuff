local speed = 50
local flying = false

local controlModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
local bv
local bg
local Signal1
local Signal2



local function enableFly()
    bv = Instance.new("BodyVelocity")
    bv.Name = "VelocityHandler"
    bv.Parent = humanoidRootPart
    bv.MaxForce = Vector3.new(0, 0, 0)
    bv.Velocity = Vector3.new(0, 0, 0)

    bg = Instance.new("BodyGyro")
    bg.Name = "GyroHandler"
    bg.Parent = humanoidRootPart

    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.P = 1000
    bg.D = 50

    Signal1 = player.CharacterAdded:Connect(function(NewChar)
        bv:Destroy()
        bg:Destroy()
        enableFly()
    end)

    Signal2 = game:GetService("RunService").RenderStepped:Connect(function()
        if character and humanoid and humanoidRootPart and humanoidRootPart:FindFirstChild("VelocityHandler") and humanoidRootPart:FindFirstChild("GyroHandler") then
            humanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            humanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            humanoid.PlatformStand = true

            humanoidRootPart.GyroHandler.CFrame = game.Workspace.CurrentCamera.CoordinateFrame
            local direction = controlModule:GetMoveVector()
            humanoidRootPart.VelocityHandler.Velocity = Vector3.new()
            if direction.X > 0 then
                humanoidRootPart.VelocityHandler.Velocity = humanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (direction.X * speed)
            end
            if direction.X < 0 then
                humanoidRootPart.VelocityHandler.Velocity = humanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (direction.X * speed)
            end
            if direction.Z > 0 then
                humanoidRootPart.VelocityHandler.Velocity = humanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (direction.Z * speed)
            end
            if direction.Z < 0 then
                humanoidRootPart.VelocityHandler.Velocity = humanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (direction.Z * speed)
            end
        end
    end)
end

local function disableFly()
    if bv and bg then
        bv:Destroy()
        bg:Destroy()
        humanoid.PlatformStand = false
        if Signal1 then
            Signal1:Disconnect()
        end
        if Signal2 then
            Signal2:Disconnect()
        end
    end
end
