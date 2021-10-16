getgenv().autoClean = false
getgenv().autoCash = false
getgenv().autoATM = false

local lp = game.Players.LocalPlayer
local ATM = game.workspace.ArabianDeli.ATM
local desk = game.Workspace.StaplersBusiness.Desk
local abdul = game.Workspace.ArabianDeli.MohammedArabDeli.Torso
local jobs = game.Workspace.Job
local goal = 1000


spawn (function()
	while true do
		wait()
		chara = lp.Character
		hump = chara.HumanoidRootPart
		hunger = chara.HungryStatus.Value
		val = lp.Money.Value
		job = lp.Job.JobMoney.Value
	end
end)

function AutoClean()
	hump.CFrame = desk.CFrame
	wait(3)
	local args = {
    [1] = "JobItems",
    [2] = 0,
    [3] = "Broom",
    [4] = game:GetService("Players").LocalPlayer.PlayerGui.StaplersBusinessDialogue.Shop,
    [5] = game:GetService("Players").LocalPlayer.PlayerGui.StaplersBusinessDialogue.Shop.Validate
	}
	workspace.Events.Shop:FireServer(unpack(args))
	local hum = game.Players.LocalPlayer.Character.Humanoid
	local br = lp.Backpack:WaitForChild("Broom")
	hum:EquipTool(br)
	spawn(function()
		while getgenv().autoClean do
			wait()
			if hunger < 4 then
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

				local human = chara.Humanoid
				local chop = lp.Backpack:WaitForChild("Chips")
				human:EquipTool(chop)
				chop:Activate()
				wait(1)
				local broom = lp.Backpack:WaitForChild("Broom")
				human:EquipTool(broom)
			end
				if job >= goal then
					wait(8)
				end
			
			for i, v in pairs(jobs:GetChildren()) do
				wait()
				if v:IsA("Part") then
				hump.CFrame = v.CFrame
			end
		end
		end
	end)
end

function AutoCash()
	spawn(function()
		while getgenv().autoCash do
			wait()
			if (job >= goal) then
				hump.CFrame = desk.CFrame
			end
		end
	end)
end

function AutoATM()
	hump.CFrame = ATM.CFrame
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("RRP2 Autofarm") -- Creates the window

local b = w:CreateFolder("Options") -- Creates the folder(U will put here your buttons,etc)

b:Toggle("Auto Clean",function(bool)
    getgenv().autoClean = bool
	if bool then
		AutoClean()
	end
end)

b:Toggle("Auto Cash Out", function(bool)
	getgenv().autoCash = bool
	if bool then
		AutoCash()
	end
end)

b:Button("Atm Tp",function()
    AutoATM()
end)

b:Box("Money Goal","number",function(value)
	goal = tonumber(value)
end)

b:Label("Made by Big Boss#3605",{
    TextSize = 20; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

b:DestroyGui()