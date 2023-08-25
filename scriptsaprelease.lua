repeat wait() 
    if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading") then 
        loaded = true 
    end
    until loaded == true 
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/skidcongaimetuimay.lua")))()

local workspace = workspace
local huge = math.huge
local task = task
local Player = game.Players.LocalPlayer
local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")

local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")
local Services = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services")
RemoteEvent:FireServer({{"!", "EnemyRender", 10000}})
RemoteEvent:FireServer({{"#","SendAllWarriors",true}})
local Config = {
    click = false,
    autofarm = false,
}
local tatfunction = false
local tatfunction2 = false
--[[
         if Config.autofarm == true and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 1000 and not tatfunction then 
            Config.autofarm = false
            tatfunction  = true 
            end 
            if Config.autofarm == false and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() <= 500 and tatfunction then 
                Config.autofarm = true 
                tatfunction = false 
            end
            if Config.click == true and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 1000 and not tatfunction2 then 
                Config.click = false
                tatfunction2 = true
            end
            if Config.click == false and game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() <= 500 and tatfunction2 then 
                Config.click = true 
                tatfunction = false 
            end
]]
spawn(function()
    while wait() do 
        if Config.autorejoinhp then 
       if game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 1000 then 
        wait(30)
        if game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 5000 then 

        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
       end
    end
    end
end
end)

local FolderName = "Banana Hub"
local ConfigFile = game.Players.LocalPlayer.Name.."-AWS2.json"
local function LoadPreset()
    return game:GetService("HttpService"):JSONDecode(readfile(FolderName .. "/"  .. ConfigFile))
end

local function SavePreset()
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
if isfile(FolderName .. "/"  .. ConfigFile) then
local Decode = LoadPreset()
for i,v in pairs(Decode) do
    Config[i] = v
end
elseif  not isfile(FolderName .. "/"  .. ConfigFile) then
    writefile(FolderName .. "/"  .. ConfigFile, game:GetService("HttpService"):JSONEncode(Config))
end
local function EnemyTable()
    local Enemies = {"Closest Farm"}
    for i,v in pairs(workspace.Enemies:GetChildren()) do  
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2000 then 
            --print(i,v:GetAttribute("Enemy"))
            if not table.find(Enemies,v:GetAttribute("Enemy")) then 
            table.insert(Enemies,v:GetAttribute("Enemy"))
        end
    end
end
  return Enemies
end

local function map()
    map = {}
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        table.insert(map,v.Name)
    end
    return map
end
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
--[[
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
]]
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            -- delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
end

--[[
        function huhu()
                for i,v in pairs(workspace.ClientEnemies:GetChildren()) do
                    if v and v:FindFirstChild("HumanoidRootPart") then
                       return v 
                    end
            end
            end
			local Number = huge
			local Enemy
             if Config.concac == "Closest Farm" then
				for i,v in pairs(workspace.ClientEnemies:GetChildren()) do

					if v and v:FindFirstChild("HumanoidRootPart") and  v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") then
						local Magnitude = (Player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Enemy = v
						end
				end
            end
			end
            if Config.concac == "Closest Enemy" then 
               if Enemy ~= huhu() then 
                    Enemy = huhu()
                    print(Enemy,huhu())
               end
        end
           if Config.concac == "Closest Enemy" then 
                workspace.ClientEnemies.ChildAdded:Connect(function(child)
                    if  child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") then 
                        Enemy = child
                        print(Enemy)
                end
                 end)
            end
]]
function getremoteattackmob()
    for i,v in pairs(game:GetService("ReplicatedStorage").AutoSerde:GetChildren()) do 
        if v.Name == "AttackEnemy" then 
            return v.Value
        end
    end
end
function getremotemap()
    for i,v in pairs(game:GetService("ReplicatedStorage").AutoSerde:GetChildren()) do 
        if v.Name == "TeleportToWorld" then 
            return v.Value
        end
    end
end

local send = false
task.spawn(function()
	while task.wait() do
        pcall(function()

            local Enemy
            local Number = huge
            if Config.concac == "Closest Farm" then
                for i,v in pairs(workspace.Enemies:GetChildren()) do  
                    local Magnitude = (Player.Character.HumanoidRootPart.Position - v.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Enemy = v
						end
                end
            end
            if Config.concac == "Closest Enemy" then 
                workspace.Enemies.ChildAdded:Connect(function(child)
                    if  child:IsA("Part") then 
                        Enemy = child
                end
                 end)
            end
        --[[    if Config.concac == "Closest Enemy" then 
                workspace.ClientEnemies.ChildAdded:Connect(function(child)
                    if  child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") then 
                        Enemy = child
                    end
                 end)
            end]]
            if Config.concac ~= "Closest Enemy" then
                for i,v in pairs(workspace.Enemies:GetChildren()) do  
                       if v:GetAttribute("Enemy") == Config.concac then 
                            Enemy = v
                       end
                end
			end
            --[[
                    if Config.autofarm  then 
                local args = {
                    [1] = {
                        [1] = {
                            [1] = tostring(getremoteattackmob()),
                            [2] = tostring(Enemy)
                        }
                    }
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                repeat task.wait() until not Enemy or not Enemy.Parent or not Config.autofarm

            end
            ]]
            if Config.concac then
				if Config.Teleport and Config.autofarm then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Enemy.Position).Magnitude <= 5000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.CFrame
                    end
				end
                if Config.autofarm  then 
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Enemy.Position).Magnitude <= 500 and Config.concac ~= "Closest Enemy" then
                        wait(1)
                        local args = {
                            [1] = {
                                [1] = {
                                    [1] = tostring(getremoteattackmob()),
                                    [2] = tostring(Enemy)
                                }
                            }
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                        for i,v in next,game:GetService("Workspace").Warriors[game.Players.LocalPlayer.Name]:GetChildren() do 
                            if v:IsA("Model") then 
                                v.HumanoidRootPart.CFrame = Enemy.CFrame
                            end
                        end
                        repeat task.wait() until not Enemy or not Enemy.Parent or not Config.autofarm
            end
        end
            if Config.autofarm and Config.concac == "Closest Farm" then 
                wait(1)
                local args = {
                    [1] = {
                        [1] = {
                            [1] = tostring(getremoteattackmob()),
                            [2] = tostring(Enemy)
                        }
                    }
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                for i,v in next,game:GetService("Workspace").Warriors[game.Players.LocalPlayer.Name]:GetChildren() do 
                    if v:IsA("Model") then 
                        v.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
                    end
                end
                repeat task.wait() until not Enemy or not Enemy.Parent or not Config.autofarm
		end
    end
    end)
	end
end)

function getremoteclick()
    for i,v in pairs(game:GetService("ReplicatedStorage").AutoSerde:GetChildren()) do 
        if v.Name == "RegisterClick" then 
            return v.Value
        end
    end
end
spawn(function()
while wait() do 
    if Config.click then
        local args = {
            [1] = {
                [1] = {
                    [1] = tostring(getremoteclick())
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    end
    end)
task.spawn(function()
while task.wait() do
    pcall(function()
    if Config.autocollect then
        for i,v in pairs(workspace.Drops:GetChildren()) do

            v.CFrame = HumanoidRootPart.CFrame * CFrame.new(5,0,0)
            
        end
    end
end)
end
end)
local Window =
    OrionLib:MakeWindow(
    {
        Name = "Banana Hub",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = FolderName,
        IntroEnabled = false,
        IntroText = "Your Mom Fat",
        IntroIcon = "rbxassetid://5245791567",
        Icon = "rbxassetid://5245791567"
    }
)

local MainTab =
    Window:MakeTab(
    {
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Teleport =
    Window:MakeTab(
    {
        Name = "Teleport",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)
local Status =
    Window:MakeTab(
    {
        Name = "Status",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)
local Webhook =
    Window:MakeTab(
    {
        Name = "Webhook",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

MainTab:AddToggle({
    Name = "Auto Farm",
    Default = Config.autofarm,
    Callback = function(a)
        Config.autofarm = a
        SavePreset()
    end
})

local hihi = MainTab:AddDropdown({
    Name = "Enemies Select",
    Default = Config.concac,
    Options = EnemyTable(),
    Callback = function(a)
        Config.concac = a
        SavePreset()

    end
})
MainTab:AddButton({
    Name = "Refresh Mob",
    Callback = function()
       hihi:Refresh(EnemyTable(),true)
    end
})

Teleport:AddDropdown({
    Name = "Teleport Map",
    Options = map(),
    Callback = function(v)
        local args = {
            [1] = {
                [1] = {
                    [1] = tostring(getremotemap()),
                    [2] = tostring(v)
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
})

Teleport:AddButton({
    Name = "Teleport to Dungeon",
    Callback = function()
        local args = {
            [1] = {
                [1] = {
                    [1] = tostring(getremotemap()),
                    [2] = "Dungeon"
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
         
    end
})
MainTab:AddToggle({
    Name = "Auto Click",
    Default = Config.click,
    Callback = function(a)
        Config.click = a
        SavePreset()
    end
})

MainTab:AddToggle({
    Name = "Auto Collect",
    Default = Config.autocollect,
    Callback = function(a)
        Config.autocollect = a
        SavePreset()
    end
})

MainTab:AddToggle({
    Name = "Auto Teleport Enemies",
    Default = Config.Teleport,
    Callback = function(a)
        Config.Teleport = a
        SavePreset()
    end
})
MainTab:AddToggle({
    Name = "Auto Quest Farm",
    Default = Config.quest,
    Callback = function(v)
        Config.quest = v
        SavePreset()

    end
})
function getremotequest()
    for i,v in pairs(game:GetService("ReplicatedStorage").AutoSerde:GetChildren()) do 
        if v.Name == "AcceptQuest" then 
            return v.Value
            end
    end
    end
    local checkautofarm = false
function checkquest()
    concac = {}
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container:GetChildren()) do 
            if v:IsA("Frame") then 
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name]:FindFirstChild("List") then 
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].List.Complete.Visible == false then 
    
                    local inputString = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].Title.Text
                    local pattern = "(.-)%s*%((.-)%)"
                    local match1, match2 = inputString:gsub(pattern, "%1")
                    local strain = inputString:gsub(pattern, "%2")
                        table.insert(concac,match1)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Quest.Container[v.Name].List.Complete.Visible == true and table.find(concac,match1) then
                        table.remove(concac,match1)
                    end
                end
            end
        end
        return concac
    end
    local concac2 
    local Enemy2
    local function EnemyTable2()
        local Enemies = {"Closest Farm"}
        for i,v in next, workspace.ClientEnemies:GetChildren() do 
            if v.HumanoidRootPart:FindFirstChild("EnemyHealthBar") then 
            if not table.find(Enemies,v.HumanoidRootPart.EnemyHealthBar.Title.Text) then 
                table.insert(Enemies,v.HumanoidRootPart.EnemyHealthBar.Title.Text)
            end
        end
      end
      return Enemies
    end
    spawn(function()
    while wait() do 
        pcall(function()
        if Config.quest then 
            for i,v in pairs(checkquest()) do
                for i1,v1 in pairs(EnemyTable2()) do 
                concac2 = v    
            end
            if concac2 then 
                for i2,v2 in pairs(workspace.ClientEnemies:GetChildren()) do
                    if v2 and v2:FindFirstChild("HumanoidRootPart") and v2.HumanoidRootPart:FindFirstChild("EnemyHealthBar") and v2.HumanoidRootPart.EnemyHealthBar.Title.Text == concac2 then
                        local Magnitude = (HumanoidRootPart.Position - v2.HumanoidRootPart.Position).Magnitude
                        if Magnitude <= 3000 then
                            Enemy2 = v2
                        end
                    end
                end
            end
            if concac2 and Config.quest and Enemy2:FindFirstChild("HumanoidRootPart") then 
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Enemy2.HumanoidRootPart.Position).Magnitude <= 5000 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy2.HumanoidRootPart.CFrame
                end
                for i,v in next,game:GetService("Workspace").Warriors[game.Players.LocalPlayer.Name]:GetChildren() do 
                    if v:IsA("Model") then 
                        v.HumanoidRootPart.CFrame = Enemy2.HumanoidRootPart.CFrame
                    end
                end
            end
            if Config.autofarm and not checktatautofarm then 
                Config.autofarm = false 
                checktatautofarm = true 
            end
            if Config.quest then 
            task.wait(0.5) 
            local args = {
                [1] = {
                    [1] = {
                        [1] = tostring(getremoteattackmob()),
                        [2] = tostring(Enemy2)
                    }
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            repeat task.wait() until not Enemy2 or not Enemy2.Parent or not Config.quest 
        end
 for i, v in pairs(workspace.Maps:GetChildren()) do
       RemoteEvent:FireServer({{tostring(getremotequest()), v.Components:FindFirstChild("NPC", true).Parent.Name}})
        end
     end
    elseif checkautofarm == true and  not Config.quest then
        checkautofarm = false   
    end
end)
    end
 end)
MainTab:AddToggle({
    Name = "Auto Open Egg",
    Default = Config.open,
    Callback = function(test)
        Config.open = test
        SavePreset()

    end
})
local danhboss=  true 
local dungeon = true
teleporttoegg = false
task.spawn(function()
	while task.wait() do
		if Config.open then
            local Number = huge
			local Egg

			for i,v in pairs(workspace.Maps:GetChildren()) do
				for i,v in pairs(v.Eggs:GetChildren()) do
					if v.PrimaryPart and v.Egg:FindFirstChild("PriceBillboard") and v.Egg.PriceBillboard.Yen.Icon.Image ~= "rbxassetid://9126788621" then
						local Magnitude = (HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
						if Magnitude < Number then
							Number = Magnitude
							Egg = v
						end
					end
				end
			end

			if Egg then
		local EggCFrame = Egg.PrimaryPart.CFrame
				if (HumanoidRootPart.Position - EggCFrame.Position).Magnitude > 5 and (HumanoidRootPart.Position - EggCFrame.Position).Magnitude <= 500 then
					HumanoidRootPart.CFrame = EggCFrame + EggCFrame.LookVector * 3 
				end
				Services.EggService.RF.Open:InvokeServer(Egg.Name, (Egg:FindFirstChild("Bottom") and 2 or false))

            end
        end
	end
end)
MainTab:AddToggle({
    Name = "Auto Rejoin When Disconnect",
    Default = Config.autorejoin,
    Callback = function(bool)
        Config.autorejoin = bool
        SavePreset()
    end
})
MainTab:AddToggle({
    Name = "Auto Rejoin When High Ping",
    Default = Config.autorejoin,
    Callback = function(bool)
        Config.autorejoinhp = bool
        SavePreset()
    end
})

MainTab:AddToggle({
    Name = "Auto Farm boss ???",
    Default = Config.farmboss,
    Callback = function(a)
        Config.farmboss = a 
        SavePreset()
    end
})
MainTab:AddToggle({
    Name = "Auto Dungeon Easy",
    Default = Config.dungeonez,
    Callback = function(a)
        Config.dungeonez = a 
        SavePreset()
    end
})
MainTab:AddToggle({
    Name = "Auto Dungeon Insane",
    Default = Config.dungeonhard,
    Callback = function(a)
        Config.dungeonhard = a 
        SavePreset()
    end
})
MainTab:AddSlider({
	Name = "Room Leave",
	Min = 1,
	Max = 100,
	Default = Config.Roomleave,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Room",
	Callback = function(Value)
		Config.Roomleave = Value
	end    
})
local localTeleported = false
local cFrameChar
local nameWorld
local saved = false
local foundSecretBoss = false
local bossSpawned = false
local tatopenegg = false
local function teleportBack(cFrame)
    local args = {
        [1] = {
            [1] = {
                [1] = tostring(getremotemap()),
                [2] = tostring(nameWorld)
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    wait(2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cFrame
end

local function saveData()
    for i, v in pairs(workspace.Maps:GetChildren()) do
        for i, v1 in pairs(v.Eggs:GetChildren()) do
            if v1.PrimaryPart and v1.Egg:FindFirstChild("PriceBillboard") and v1.Egg.PriceBillboard.Yen.Icon.Image ~= "rbxassetid://9126788621" then
                nameWorld = v.Name
                cFrameChar = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)
                OrionLib:MakeNotification(
                    {
                        Name = "Banana Hub Data Before Teleport",
                        Content = "Map: " .. nameWorld .. "\nCFrame Char: " .. tostring(cFrameChar),
                        Image = "rbxassetid://5245791567",
                        Time = 10
                    }
                )
            end
        end
    end
end
function saveCFrame()
    local cframhuhu
    cframhuhu = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)
    OrionLib:MakeNotification(
        {
            Name = "Banana Hub Data Before Teleport",
            Content = "\nCFrame Char: " .. tostring(cframhuhu),
            Image = "rbxassetid://5245791567",
            Time = 10
        }
    )
    return cframhuhu
end
local function teleportBackCFrame()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saveCFrame()
end
local plr = game.Players.LocalPlayer
game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(v)
    if v:IsA("Frame") and string.find(v.TextLabel.Text,"Insane") and Config.dungeonhard then 
        if not saved then 
            saveData()
            saved = true 
        end
        dungeon = true
        print("Start dungeon Insane")
        local args = {
            [1] = {
                [1] = {
                    [1] = "Z",
                    [2] = "Insane"
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        
    end
end)   
game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(v)
    if v:IsA("Frame") and string.find(v.TextLabel.Text,"Beginner") and Config.dungeonez then
        if not saved then 
            saveData()
            saved = true 
        end
        dungeon = true
        print("Start dungeon Beginner")
        local args = {
            [1] = {
                [1] = {
                    [1] = "Z",
                    [2] = "Easy"
                }
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        
    end
end)   
spawn(function()
    while wait() do 
        if Config.dungeonez or Config.dungeonhard then 
            function DetectBoss()
                local dist = 0
                local dist1 = math.huge
                local name 
                local a = {}
                for i,v in next,game:GetService("Workspace").ClientEnemies:GetChildren() do 
                    local hight = v:GetAttribute("SizeFactor") 
                    if v:IsA("Model") and hight and hight > dist then 
                        dist = hight
                        table.insert(a,v) 
                    end
                end
                for i,v in next,a do 
                    local mag = (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist1 > mag then 
                        dist1 = mag 
                        name = v  
                    end
                end
                return name
            end
            local HightBoss
            local HightBossPosition 
            function DetectMob()
                if not HightBossPosition then 
                    return true 
                end
                local MagBoss = HightBossPosition
                for i,v in next,game:GetService("Workspace").ClientEnemies:GetChildren() do 
                    if v:IsA("Model")  and game:GetService("Workspace").Enemies:FindFirstChild(v.Name)  and game:GetService("Workspace").Enemies[v.Name]:GetAttribute("Health") > 0 then 
                        if (v.HumanoidRootPart.Position-MagBoss).Magnitude <= 150  then 
                            return v 
                        end
                    end
                end
            end
            function DetectLever()
                for i,v in next, game:GetService("Workspace").Dungeons[game.Players.LocalPlayer:GetAttribute("InDungeon")]:GetDescendants() do 
                    if v.Name == "ProximityPrompt" and v.Parent.Parent.Parent.Name == "Lever" and v.Parent.Parent.Parent.Parent.Name == string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text," ","") then 
                        return v 
                    end
                end
            end
            
            _G.on = not _G.on 
            spawn(function()
                while _G.on  and wait() do 
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Enabled then 
                            local old = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text
                            HightBossPosition = DetectBoss().HumanoidRootPart.Position
                            repeat wait() until old ~= game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text 
                            or not game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Enabled or not _G.on 
                        end
                    end)
                end
            end)
            function AttackMob(a)
                wait()
                local args = {
                    [1] = {
                        [1] = {
                            [1] = tostring(getremoteattackmob()),
                            [2] = a.Name
                        }
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                for i,v in next,game:GetService("Workspace").Warriors[game.Players.LocalPlayer.Name]:GetChildren() do 
                    if v:IsA("Model") then 
                        v.HumanoidRootPart.CFrame = a.HumanoidRootPart.CFrame
                    end
                end
            end
            local Enemy
            local Number = math.huge
            spawn(function ()
                while wait() do 
                    if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text == "Room 1" then 
                        local Mob = DetectMob()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Mob.HumanoidRootPart.Position).Magnitude < 8 then
                            wait(0.1)
                            AttackMob(Mob)
                            repeat wait() until not Mob or game:GetService("Workspace").Enemies[Mob.Name]:GetAttribute("Health") <= 0 or not _G.on
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text == "Room 2" then
                        break;
                    end
                end
            end)
            while _G.on and task.wait() do 
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text == "Room 0" 
                    then 
                        return 
                    end
                    local a  = tonumber(string.split(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text," ")[2])-1
                    if game:GetService("Workspace").Dungeons[game.Players.LocalPlayer:GetAttribute("InDungeon")]["Room"..tostring(a)].Door.Position.Y <= 300 then
                        return 
                    end
                    if DetectMob() then 
                        local Mob = DetectMob()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Mob.HumanoidRootPart.Position).Magnitude < 4 then
                            wait(0.1)
                            AttackMob(Mob)
                            repeat wait() until not Mob or game:GetService("Workspace").Enemies[Mob.Name]:GetAttribute("Health") <= 0 or not _G.on
                        end
                    else
                        if DetectLever() then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = DetectLever().Parent.CFrame
                            wait(2)
                            fireproximityprompt(DetectLever(),1)
                            local b  = tonumber(string.split(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text," ")[2])-1
                            repeat wait() 
                                b  = tonumber(string.split(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text," ")[2])-1
                            until game:GetService("Workspace").Dungeons[game.Players.LocalPlayer:GetAttribute("InDungeon")]["Room"..tostring(b)].Door.Position.Y == 466.4834899902344 or not _G.on
                        end
                    end
                end)
                if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Frame.CurrentRoom.Text == Config.Roomleave then 
                    teleportBack(cFrameChar)
                end
            end  
        end
    end
end)
function getegg()
    local hihi = {} -- Khai báo biến hihi
    for i, v in pairs(workspace.Maps:GetChildren()) do
        for i1, v1 in pairs(v.Eggs:GetChildren()) do
            if v1.PrimaryPart and v1.Egg:FindFirstChild("PriceBillboard") and v1.Egg.PriceBillboard.Yen.Icon.Image ~= "rbxassetid://9126788621" then
                table.insert(hihi, v1.PrimaryPart.Position)
            end
        end
    end
    
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position -- Vị trí của người chơi
    local smax = nil -- Đặt giá trị ban đầu cho smax
    
    for i, v in ipairs(hihi) do
        local distance = (v - playerPosition).Magnitude -- Tính khoảng cách Euclidean giữa v và playerPosition
        if smax == nil or distance > ((smax - playerPosition).Magnitude) then
            smax = v
        end
    end
    return smax
end
maprauden = ""
function checkbossrauden()
    a = false 
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container:GetChildren()) do 
        if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name]:FindFirstChild("Inner") then 
               if  game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name].Inner:FindFirstChild("Machines") then 
            if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name].Inner.Machines:FindFirstChild("SecretBoss") then
                maprauden = v 
                a = true 
                return a 
            end
        end
    end
end
end
function checkbossrauden2()
    if checkbossrauden() then 
        return "Boss Black Beard Status: 🟢 "
    else return "Boss Black Beard Status: 🔴" 
    end
end


local function teleportToSecretBoss()
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container:GetChildren()) do
        if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name]:FindFirstChild("Inner") then
            if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name].Inner:FindFirstChild("Machines") then
                if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Teleport.Frame.Container[v.Name].Inner.Machines:FindFirstChild("SecretBoss") then
                    foundSecretBoss = true
                    if not saved then
                        saveData()
                        saved = true
                    end
                    local args = {
                        [1] = {
                            [1] = {
                                [1] = tostring(getremotemap()),
                                [2] = tostring(v)
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    wait(2)
                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:GetAttribute("Enemy") == "SecretBoss" then
                            bossSpawned = true
                            danhboss = true
                            local magnitude = (HumanoidRootPart.Position - v.Position).Magnitude
                            if magnitude <= 3000 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            else
                                local args = {
                                    [1] = {
                                        [1] = {
                                            [1] = tostring(getremotemap()),
                                            [2] = tostring(v)
                                        }
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            end
                            task.wait(0.5)
                            local args = {
                                [1] = {
                                    [1] = {
                                        [1] = tostring(getremoteattackmob()),
                                        [2] = tostring(v)
                                    }
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                            repeat
                                task.wait()
                            until not v or not v.Parent or not Config.farmboss
                         saved = false -- Reset saved state after boss despawns
                        teleportBack(cFrameChar) -- Teleport back when boss despawns
                            localTeleported = true
                            break
                        end
                    end
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if Config.farmboss then

            teleportToSecretBoss()
            if not bossSpawned and localTeleported and danhboss then
                localTeleported = false
                danhboss = false
                saved = false 
                teleportBack(cFrameChar)
            end
        end
    end
end)
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") and  Config.autorejoin  then
		local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
	end
end)
--[[MainTab:AddDropdown({
    Name = "Select Type Dungeon",
    Default = Config.selectdung,
    Options = {"Easy1","Insane1"},
    Callback = function(v)
        Config.selectdung = v 
    end
})]]
local AllRequest = http_request or request or HttpPost or syn.request
function checkplayer()
if game.Players.NumPlayers >= 14 then 
    return game.Players.NumPlayers.."/14 🔴"
else return game.Players.NumPlayers.."/14 🟢"
end
end
function ping()
    if Config.pingeveryone then 
        return "@everyone "
    else return ""
    end
end
function CorruptMerchantWebhook()
    Message = {
    ['username'] = "Banana Notification",
    ["content"] =  ping().."**CorruptMerchant Detected**",
    ["avatar_url"] = "https://images-ext-2.discordapp.net/external/9abhJvZ_jZz_qLSMxdzkMDzTN2tK6QoeWKkDZKDumDQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1110842794102243338/c6ad875079eeec2b48660c334f1eb930.png?width=473&height=473",
    ["embeds"]= {
        {            
            ["title"]= "Anime Warriors ";
            ["fields"] = {
                {
                ["name"] = "Informations",
                ["value"] = "```\nPlayers Count: "..checkplayer().. "```\n".."**Script To Join: **```lua\n"..'game:GetService("TeleportService"):TeleportToPlaceInstance(8425128940,'..'"'..game.JobId..'"'..',game.Players.LocalPlayer)'.."\n```Code By: Hlamm";
                ["inline"] = false
            },
            ["color"]= tonumber(0xe962e2);
        }
    }
    }
    }
    local DataCallBack = AllRequest({
    Url = Config.linkwebhook,
    Method = 'POST',
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode(Message)
    })
    end
    function BlackBeardBoss()
        Message = {
        ['username'] = "Banana Notification",
        ["content"] =   ping().."**Boss BlackBeard Detected**",
        ["avatar_url"] = "https://images-ext-2.discordapp.net/external/9abhJvZ_jZz_qLSMxdzkMDzTN2tK6QoeWKkDZKDumDQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1110842794102243338/c6ad875079eeec2b48660c334f1eb930.png?width=473&height=473",
        ["embeds"]= {
            {            
                ["title"]= "Anime Warriors ";
                ["fields"] = {
                    {
                    ["name"] = "Informations",
                    ["value"] = "```\nPlayers Count: "..checkplayer().. "```\n".."**Script To Join: **```lua\n"..'game:GetService("TeleportService"):TeleportToPlaceInstance(8425128940,'..'"'..game.JobId..'"'..',game.Players.LocalPlayer)'.."\n```Code By: Hlamm";
                    ["inline"] = false
                },
                ["color"]= tonumber(0xe962e2);
            }
        }
        }
        }
        local DataCallBack = AllRequest({
        Url = Config.linkwebhook,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
        })
        end
        function Merchant()
            Message = {
            ['username'] = "Banana Notification",
            ["content"] =  ping().."**Merchant Detected**",
            ["avatar_url"] = "https://images-ext-2.discordapp.net/external/9abhJvZ_jZz_qLSMxdzkMDzTN2tK6QoeWKkDZKDumDQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1110842794102243338/c6ad875079eeec2b48660c334f1eb930.png?width=473&height=473",
            ["embeds"]= {
                {            
                    ["title"]= "Anime Warriors ";
                    ["fields"] = {
                        {
                        ["name"] = "Informations",
                        ["value"] = "```\nPlayers Count: "..checkplayer().. "```\n".."**Script To Join: **```lua\n"..'game:GetService("TeleportService"):TeleportToPlaceInstance(8425128940,'..'"'..game.JobId..'"'..',game.Players.LocalPlayer)'.."\n```Code By: Hlamm";
                        ["inline"] = false
                    },
                    ["color"]= tonumber(0xe962e2);
                }
            }
            }
            }
            local DataCallBack = AllRequest({
            Url = Config.linkwebhook,
            Method = 'POST',
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(Message)
            })
            end

function checkcorrup()
    local cc = false
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        if  v.Components:FindFirstChild("CorruptMerchant") then
            cc = true
        end
end
return cc
end
function checkcorrup2()
        if checkcorrup() then 
            return "CorruptMerchant Status: Spawned"
        else return "CorruptMerchant Status: Dont Spawn"
        end
end

--
function merchat()
    local cc = false
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        if  v.Components:FindFirstChild("Merchant") then
            cc = true
        end
end
return cc
end
function merchat2()
if merchat() then 
    return "Merchant Status: Spawned"
        else return "Merchant Status: Dont Spawn"
end
end
function checkbattle()
  a = false 
    for i,v in pairs(workspace.Maps:GetChildren()) do 
        if v:FindFirstChild("Battle") and v:FindFirstChild("BattleInteract") then
            a = true 

        end
        end
        return a
end
function getmapbattle()
    if checkbattle() then 
      for i,v in pairs(workspace.Maps:GetChildren()) do 
        if v:FindFirstChild("Battle") and v:FindFirstChild("BattleInteract") then
            map2 = v.Name
  
          end
          end
        end
          return map2
  end
function checkbattle2()
    if checkbattle() then 
                return getmapbattle()
            else  return "Dont Spawn"
    end
end
print(checkbattle2())
 --[[   MainTab:AddToggle({
    Name = "Auto Dungeon ( Comming Soon )",
    Default = Config.dungeon,
    Callback = function(v)
       Config.dungeon = v
    end
})]]
function itemshop()
    local item = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Frames.DungeonShop.Frame.Container:GetChildren()) do 
        if v.Name ~= "UIListLayout" then 
            table.insert(item,v.Name)
        end
end
return item
end

local corrup = Status:AddLabel(checkcorrup2())
local merchant = Status:AddLabel(merchat2())
local rauden = Status:AddLabel(checkbossrauden2())
local hihi = Status:AddLabel("Battle Status: "..checkbattle2())
local Cry = Status:AddLabel("Crystals: "..game:GetService("Players").LocalPlayer.PlayerGui.Frames.DungeonShop.Frame.Top.Crystals.Value.Text)
spawn(function()
    while wait() do 
        pcall(function()
        corrup:Set(checkcorrup2())
        merchant:Set(merchat2())
        rauden:Set(checkbossrauden2())
        hihi:Set("Battle Status: "..checkbattle2())
       -- checkbattle:Set(checkbattle2())
        Cry:Set("Crystals: "..game:GetService("Players").LocalPlayer.PlayerGui.Frames.DungeonShop.Frame.Top.Crystals.Value.Text)
    end)

    end
end)
Webhook:AddTextbox({
    Name = "Webhook Link",
	Default = Config.linkwebhook,
	TextDisappear = true,
	Callback = function(Value)
		Config.linkwebhook = Value
        SavePreset()
	end	  
})
Webhook:AddToggle({
    Name = "Auto Webhook CorruptMerchant",
    Default = Config.autowhcorrup,
    Callback = function(Value)
        Config.autowhcorrup = Value
        SavePreset()

    end
})
Webhook:AddToggle({
    Name = "Ping Everyone",
    Default = Config.pingeveryone,
    Callback = function(a)
        Config.pingeveryone = a
        SavePreset()
    end
})
local send = false 
spawn(function ()
    while wait() do 
    if Config.autowhcorrup then 
        if checkcorrup() and not send then 
            CorruptMerchantWebhook()
            send = true 
        elseif not checkcorrup() and send then 
            send = false 
        end
        end 
    end
end)
Webhook:AddToggle({
    Name = "Auto Webhook BlackBread",
    Default = Config.autowhbb,
    Callback = function(Value)
        Config.autowhbb = Value
        SavePreset()

    end
})
Webhook:AddToggle({
    Name = "Auto Webhook Merchant",
    Default = Config.autowhMerchant,
    Callback = function(Value)
        Config.autowhMerchant = Value
        SavePreset()

    end
})
Webhook:AddToggle({
    Name = "Auto Webhook Warriors Secret or Mythical",
    Default = Config.WHMW,
    Callback = function(bool) 
        Config.WHMW = bool
        SavePreset()
    end
})
Webhook:AddToggle({
    Name = "Auto Webhook Dungeon",
    Default = Config.webhookdung,
    Callback = function(bool) 
        Config.webhookdung = bool
        SavePreset()
    end
})

function webhookdung(room1,time1,dame1,kill1,yen1,drop1)
    Message = {
    ['username'] = "Banana Notification",
    ["content"] =  "**Webhook Dungeon** Account Name: ||"..game.Players.LocalPlayer.Name.."||",
    ["avatar_url"] = "https://images-ext-2.discordapp.net/external/9abhJvZ_jZz_qLSMxdzkMDzTN2tK6QoeWKkDZKDumDQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1110842794102243338/c6ad875079eeec2b48660c334f1eb930.png?width=473&height=473",
    ["embeds"]= {
        {            
            ["title"]= "Anime Warriors ";
            ["fields"] = {
                {
                ["name"] = "Informations",
                ["value"] = "Room: "..room1.."\nTime: "..time1.."\nTotal Damage: "..dame1.."\nTotal Kills: "..kill1.."\nTotal Yen: "..yen1.."\nItem Drop: "..drop1;
                ["type"] = "rich",
                ["color"] = tonumber(0xff8200),
            },
           
        }
    }
    }
    }
    local DataCallBack = AllRequest({
    Url = Config.linkwebhook,
    Method = 'POST',
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode(Message)
    })
    end
local sendwebhookdung = false 
local a = ""

spawn(function()
    while wait() do 
        local dame
local yen
local kills
local room
local drop 
local time 
        if Config.webhookdung then 
            if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container:FindFirstChild(game.Players.LocalPlayer.Name) then 
            if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name]:FindFirstChild("Damage") then 
                    dame = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name].Damage.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name]:FindFirstChild("Yen") then 
                        yen = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name].Yen.Text
                    end
                if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container:FindFirstChild("Room") then 
                    room = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container.Room.Value.Text 
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container:FindFirstChild("TotalKills") then 
                    kills = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container.TotalKills.Value.Text 
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container:FindFirstChild("Time") then 
                    time = game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container.Time.Value.Text 
                end
                local a = ""
                if game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name]:FindFirstChild("Drops") then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name].Drops:GetChildren()) do 
                                      if v:IsA("Frame") then 
                                    a = a..v.Name..": "..v.Value.Text.."\n"
                                      end
                   end
                   end
                   print(a)
            end
                if not sendwebhookdung and game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container:FindFirstChild("Room")  and game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name]:FindFirstChild("Damage") then 
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name].Drops:GetChildren()) do 
                        if v:IsA("Frame") then 
                        a = a..v.Name..": "..v.Value.Text.."\n"
                        print(v.Name..": "..v.Value.Text.."\n")
                    end
                    end
                    webhookdung(room,time,dame,kills,yen,a)
                    wait(1)
                    sendwebhookdung = true
                    local click = getconnections(game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Return.Inner.Button.MouseButton1Click)
                click[1]:Fire()
                dungeon = false
                teleportBackCFrame()
                elseif sendwebhookdung and not  game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Stats.Container:FindFirstChild("Room")  and not game:GetService("Players").LocalPlayer.PlayerGui.HUDs.Dungeon.Result.Players.Container[game.Players.LocalPlayer.Name]:FindFirstChild("Damage") then
                sendwebhookdung = false
            end
          --[[  ]]
            end
        end
        end
end)
local sendhuhu = false 

            local plr = game.Players.LocalPlayer
            game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(v)
                if v:IsA("Frame") and (string.find(v.TextLabel.Text, "Mythical") or string.find(v.TextLabel.Text, "???")) and string.find(v.TextLabel.Text, plr.Name) and Config.WHMW then                
                    local url = Config.linkwebhook
                    a = string.split(v.TextLabel.Text,"just hatched")
                    local data = {
                        ['username'] = "Banana Notification",
                        ["avatar_url"] = "https://images-ext-2.discordapp.net/external/9abhJvZ_jZz_qLSMxdzkMDzTN2tK6QoeWKkDZKDumDQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1110842794102243338/c6ad875079eeec2b48660c334f1eb930.png?width=473&height=473",
                    ["content"] = "@everyone",
                        ["embeds"] = {
                            {
                                ["title"] = "Congratulation",
                                ["description"] = "Game: Anime Fighters Simulator".."\nPet:" .. " "..a[2] .. "\nBanana Hub",
                                ["type"] = "rich",
                                ["color"] = tonumber(0xff8200),
                            }
                        }
                    }
                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                        
                    local headers = {
                        ["content-type"] = "application/json"
                    }
                    request = http_request or request or HttpPost or syn.request
                    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                    request(abcdef)
                end
            end)
local send3 = false 
spawn(function()
    while wait() do 
        if Config.autowhMerchant then 
            if merchat() and not send3 then 
                Merchant()
                send3 = true
            elseif not merchat() and send3 then 
                send3 = false 
            end
        end
    end
end)
local send2 = false 
spawn(function()
    while wait() do 
    if Config.autowhbb then 
        if checkbossrauden() and not send2 then 
            BlackBeardBoss()
            send2 = true 
        elseif not checkbossrauden() and send2 then 
            send2 = false 
        end
        end 
    end
end)

local VirtualUser=game:service'VirtualUser'
game:service('Players').LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
