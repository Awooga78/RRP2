getgenv().feeding = false
local lp = game.Players.LocalPlayer
local abdul = game.Workspace.ArabianDeli.MohammedArabDeli.Torso

function feeding()
		lastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		spawn(function()
			while getgenv().feeding do
			wait()
			local char = lp.Character
			local hunger = char.HungryStatus.Value
			if hunger < 4 then
				local hump = char.HumanoidRootPart
				hump.CFrame = abdul.CFrame
				wait(2)
				local args = {
					[1] = "Food",
					[2] = 4,
					[3] = "Chips",
					[4] = game:GetService("Players").LocalPlayer.PlayerGui.ArabianDeliNPCGUI.Shop,
					[5] = game:GetService("Players").LocalPlayer.PlayerGui.ArabianDeliNPCGUI.Shop.Validate
					}
				workspace.Events.Shop:FireServer(unpack(args))
				local human = char.Humanoid
				local chop = lp.Backpack:WaitForChild("Chips")
				human:EquipTool(chop)
				chop:Activate()
				wait(1)
				hump.CFrame = lastPos
			end
		end
	end)
end

function Cash1TP()
	local lp = game.Players.LocalPlayer
	local char = lp.Character
	local humano = char.HumanoidRootPart
	local cashOneCoords = CFrame.new(-183.71759, 3.99800396, 237.411575, -0.99940449, 6.83332146e-08, -0.0345054455, 6.67811619e-08, 1, 4.6132385e-08, 0.0345054455, 4.38006005e-08, -0.99940449)
	humano.CFrame = cashOneCoords
end

function Cash2TP()
	local lp = game.Players.LocalPlayer
	local char = lp.Character
	local humano = char.HumanoidRootPart
	local cashTwoCoords = CFrame.new(-183.829163, 3.99800396, 226.995499, -0.999944508, 3.84738144e-08, -0.0105082998, 3.81604579e-08, 1, 3.00232124e-08, 0.0105082998, 2.96205389e-08, -0.999944508)
	humano.CFrame = cashTwoCoords
end

function Cash3TP()
	local lp = game.Players.LocalPlayer
	local char = lp.Character
	local humano = char.HumanoidRootPart
	local cashThreeCoords = CFrame.new(-183.809784, 3.99800396, 215.822205, -0.999601483, -2.34269208e-08, 0.028232906, -2.01769996e-08, 1, 1.15396013e-07, -0.028232906, 1.14780384e-07, -0.999601483)
	humano.CFrame = cashThreeCoords
end

function StoveTP()
	local lp = game.Players.LocalPlayer
	local char = lp.Character
	local humano = char.HumanoidRootPart
	local stoveCoords = CFrame.new(259.784729, 3.9980185, 153.871796, -0.00797259528, -4.64499017e-08, 0.999968231, 3.23822213e-08, 1, 4.6709534e-08, -0.999968231, 3.27535865e-08, -0.00797259528)
	humano.CFrame = stoveCoords
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("RRP2 Auto Feed")

local b = w:CreateFolder("Options")

local c = w:CreateFolder("Destroy")

b:Toggle("Auto Feed",function(bool)
    getgenv().feeding = bool
	feeding()
end)

b:Button("Cash 1 tp",function()
	Cash1TP()
end)

b:Button("Cash 2 tp",function()
	Cash2TP()
end)

b:Button("Cash 3 tp",function()
	Cash3TP()
end)

b:Button("Stove tp",function()
	StoveTP()
end)

b:Label("Made by Big Boss#3605",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
    
})

c:DestroyGui()