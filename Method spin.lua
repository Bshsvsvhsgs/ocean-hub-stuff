local function enablespi()
	 function getRoot(char)
		 local rootPart = game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') or game.Players.LocalPlayer.Character:FindFirstChild('Torso') or game.Players.LocalPlayer.Character:FindFirstChild('UpperTorso')
		 return rootPart
		 end
		 
		 local Noclipping = nil
		 Clip = false
		 wait(0.1)
		 local function NoclipLoop()
		 if Clip == false and game.Players.LocalPlayer.Character ~= nil then
		 for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		 if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
		 child.CanCollide = false
		 end
		 end
		 end
		 end
		 Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)
		 
		 flinging = false
		 for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		 if child:IsA("BasePart") then
		 child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		 end
		 end
		 wait(.1)
		 wait(.1)
		 local bambam = Instance.new("BodyAngularVelocity")
		 bambam.Name = "0"
		 bambam.Parent = getRoot(game.Players.LocalPlayer.Character)
		 bambam.AngularVelocity = Vector3.new(0,99999,0)
		 bambam.MaxTorque = Vector3.new(0,math.huge,0)
		 bambam.P = math.huge
		 local Char = game.Players.LocalPlayer.Character:GetChildren()
		 for i, v in next, Char do
		 if v:IsA("BasePart") then
		 v.CanCollide = false
		 v.Massless = true
		 v.Velocity = Vector3.new(0, 0, 0)
		 end
		 end
		 flinging = true
		 local function flingDiedF()
		 if flingDied then
		 flingDied:Disconnect()
		 end
		 flinging = false
		 wait(.1)
		 local speakerChar = game.Players.LocalPlayer.Character
		 if not speakerChar or not getRoot(speakerChar) then return end
		 for i,v in pairs(getRoot(speakerChar):GetChildren()) do
		 if v.ClassName == 'BodyAngularVelocity' then
		 v:Destroy()
		 end
		 end
		 for _, child in pairs(speakerChar:GetDescendants()) do
		 if child.ClassName == "Part" or child.ClassName == "MeshPart" then
		 child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		 end
		 end
		 end
		 flingDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
		 repeat
		 bambam.AngularVelocity = Vector3.new(0,99999,0)
		 wait(.2)
		 bambam.AngularVelocity = Vector3.new(0,0,0)
		 wait(.1)
		 until flinging == false
   end

   local function disablespi()
  	 if flingDied then
		 flingDied:Disconnect()
		 end
		 flinging = false
		 wait(.1)
		 local speakerChar = game.Players.LocalPlayer.Character
		 if not speakerChar or not getRoot(speakerChar) then return end
		 for i,v in pairs(getRoot(speakerChar):GetChildren()) do
		 if v.ClassName == 'BodyAngularVelocity' then
		 v:Destroy()
		 end
		 end
		 for _, child in pairs(speakerChar:GetDescendants()) do
		 if child.ClassName == "Part" or child.ClassName == "MeshPart" then
		 child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		 end
  end
   
