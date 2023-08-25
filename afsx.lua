if game.PlaceId == 11545598432 then 

repeat
	wait();
until game:IsLoaded();
local clickevent = {
	"MouseButton1Click",
	"MouseButton1Down",
	"Activated"
};
function clickUI(path)
	for i, v in pairs(clickevent) do
		for i, v in pairs(getconnections(path[v])) do
			v:Function();
		end;
	end;
end;
repeat
	wait();
	pcall(function()
		if (game:GetService("Players")).LocalPlayer.PlayerGui:FindFirstChild("TitleScreen") and (game:GetService("Players")).LocalPlayer.PlayerGui.TitleScreen.frame.main.holder.play.Visible == true then
			clickUI((game:GetService("Players")).LocalPlayer.PlayerGui.TitleScreen.frame.main.holder.play);
		end;
	end);
until not (game:GetService("Players")).LocalPlayer.PlayerGui:FindFirstChild("TitleScreen") or (not (game:GetService("Players")).LocalPlayer.PlayerGui.TitleScreen.frame.main.holder:FindFirstChild("play"));
local VirtualUser = game:service("VirtualUser");
(game:service("Players")).LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController();
	VirtualUser:ClickButton2(Vector2.new());
end);
local OrionLib = (loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/skidcongaimetuimay.lua")))();
local FolderName = "Luminary Space";
local ConfigFile = game.Players.LocalPlayer.Name .. "-AFSX.json";
local function LoadPreset()
	return (game:GetService("HttpService")):JSONDecode(readfile(FolderName .. "/" .. ConfigFile));
end;
local Config = {};
local function SavePreset()
	writefile(FolderName .. "/" .. ConfigFile, (game:GetService("HttpService")):JSONEncode(Config));
end;
if isfile(FolderName .. "/" .. ConfigFile) then
	local Decode = LoadPreset();
	for i, v in pairs(Decode) do
		Config[i] = v;
	end;
elseif not isfile((FolderName .. "/" .. ConfigFile)) then
	writefile(FolderName .. "/" .. ConfigFile, (game:GetService("HttpService")):JSONEncode(Config));
end;
local Window = OrionLib:MakeWindow({
	Name = "Luminary Space",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = FolderName,
	IntroEnabled = false,
	IntroText = "Luminary Space",
	IntroIcon = "rbxassetid://5245791567",
	Icon = "rbxassetid://5245791567"
});
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
});
local farming = Window:MakeTab({
	Name = "Framing Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
});
local autotraining = Window:MakeTab({
	Name = "Training Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
});
MainTab:AddToggle({
	Name = "Auto Farm Chest",
	Default = Config.chest,
	Callback = function(a)
		Config.chest = a;
		SavePreset();
	end
});
MainTab:AddToggle({
	Name = "Auto Claim Daily",
	Default = Config.daily,
	Callback = function(v)
		Config.daily = v;
		SavePreset();
	end
});
spawn(function()
	while wait() do
		pcall(function()
			if Config.daily then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Rewards/RemoteEvent")):FireServer("ClaimDaily");
			end;
		end);
	end;
end);
function GetNPC()
	local npc = {};
	for i, v in pairs(workspace.Scriptable.NPC.Quests:GetChildren()) do
		if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart:FindFirstChild("NameAttachment") then
			if not table.find(npc, v.HumanoidRootPart.NameAttachment.NPCName.TextLabel.ContentText) then
				table.insert(npc, v.HumanoidRootPart.NameAttachment.NPCName.TextLabel.ContentText);
			end;
		end;
	end;
	return npc;
end;
function Getmaptraining()
	local maptraining = {};
	for i, v in pairs(workspace.Scriptable.TrainingsAreas:GetChildren()) do
		if not table.find(maptraining, v.Name) then
			table.insert(maptraining, v.Name .. "  " .. v.BillboardHandler.TrainingBillboard.Frame.Requierement.ContentText .. "  ");
		end;
	end;
	return maptraining;
end;
local hihi = MainTab:AddDropdown({
	Name = "Select Npc",
	Options = GetNPC(),
	Callback = function(a)
		Config.concac = a;
		for i, v in pairs(workspace.Scriptable.NPC.Quests:GetChildren()) do
			if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart:FindFirstChild("NameAttachment") then
				if v.HumanoidRootPart.NameAttachment.NPCName.TextLabel.ContentText == Config.concac then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame;
				end;
			end;
		end;
	end
});
local tachmap;
local hihi = MainTab:AddDropdown({
	Name = "Select Map Training",
	Options = Getmaptraining(),
	Callback = function(a)
		Config.TraningMap = a;
		tachmap = string.split(Config.TraningMap, "  ");
		for i, v in pairs(workspace.Scriptable.TrainingsAreas:GetChildren()) do
			if v.Name == tachmap[1] then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
			end;
		end;
	end
});
function getmob()
	local mob = {};
	for i, v in pairs(workspace.Scriptable.Mobs:GetChildren()) do
		if not table.find(mob, v.Name) and v:IsA("Model") then
			table.insert(mob, v.Name);
		end;
	end;
	return mob;
end;
local hihi2 = farming:AddDropdown({
	Name = "Select Mob Farm ",
	Default = Config.mob,
	Options = getmob(),
	Callback = function(a)
		Config.mob = a;
	end
});
farming:AddDropdown({
	Name = "Select Method Farm ",
	Default = Config.method,
	Options = {
		"Strength",
		"Sword"
	},
	Callback = function(a)
		Config.method = a;
		SavePreset();
	end
});
farming:AddToggle({
	Name = "Auto Farm Mob",
	Default = Config.autofarmmob,
	Callback = function(a)
		Config.autofarmmob = a;
		SavePreset();
	end
});
function getskill()
	local skill = {};
	for i, v in pairs((game:GetService("Players")).LocalPlayer.PlayerGui.AbilityList.AbilityList["1"]:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "1" and (not table.find(skill, (v.Name .. " , " .. v.activate.keybind.ContentText))) then
			table.insert(skill, v.Name .. " , " .. v.activate.keybind.ContentText);
		end;
	end;
	return skill;
end;
local skills = {};
local textskill = "";
local seletectskill = farming:AddDropdown({
	Name = "Select Skills",
	Options = getskill(),
	Callback = function(v)
		local a = string.split(v, ", ");
		print(a[1], a[2]);
		if not table.find(skills, a[2]) then
			table.insert(skills, a[2]);
			textskill = textskill .. a[1] .. " , ";
		end;
	end
});
farming:AddButton({
	Name = "Refresh Skills",
	Callback = function()
		seletectskill:Refresh(getskill(), true);
	end
});
local dasd = farming:AddLabel(textskill);
spawn(function()
	pcall(function()
		while wait() do
			dasd:Set(textskill);
		end;
	end);
end);
function Notify(T2, T3)
	if T2 == nil or T2 == "" then
		T2 = "No Any Descriptions";
	end;
	if type(T3) ~= "number" then
		T3 = 10;
	end;
	OrionLib:MakeNotification({
		Name = "Luminary Space Notification",
		Content = T2,
		Image = "rbxassetid://4483345998",
		Time = T3
	});
end;
local vim = game:service("VirtualInputManager");
autotraining:AddToggle({
	Name = "Auto Training Sword",
	Default = Config.sword,
	Callback = function(a)
		Config.sword = a;
		SavePreset();
	end
});
autotraining:AddToggle({
	Name = "Auto Training Strength",
	Default = Config.Strength,
	Callback = function(a)
		Config.Strength = a;
		SavePreset();
	end
});
autotraining:AddToggle({
	Name = "Auto Training Durability",
	Default = Config.Durability,
	Callback = function(a)
		Config.Durability = a;
		SavePreset();
	end
});
autotraining:AddToggle({
	Name = "Auto Training Chakra",
	Default = Config.Chakra,
	Callback = function(a)
		Config.Chakra = a;
		SavePreset();
	end
});
autotraining:AddToggle({
	Name = "Auto Training Speed",
	Default = Config.Speed,
	Callback = function(a)
		Config.Speed = a;
		SavePreset();
	end
});
spawn(function()
	while wait() do
		pcall(function()
			if Config.sword then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer("TrainStat", "Sword");
			end;
			if Config.Strength then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer("TrainStat", "Strength");
			end;
			if Config.Durability then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer("TrainStat", "Durability");
			end;
			if Config.Chakra then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer("TrainStat", "Chakra");
			end;
			if Config.Speed then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer("TrainStat", "Speed");
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		if Config.autofarmmob then
			pcall(function()
				for i, v in pairs(workspace.Scriptable.Mobs:GetChildren()) do
					if string.find(v.Name, Config.mob) and v:FindFirstChild("Humanoid") then
						local cframehihi = v.WorldPivot;
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframehihi;
						repeat
							wait();
							spawn(function()
								local args = {
									[1] = "TrainStat",
									[2] = tostring(Config.method)
								};
								(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer(unpack(args));
							end);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2);
							spawn(function()
								for i, v in pairs(skills) do
									vim:SendKeyEvent(true, tostring(v), false, game);
									task.wait();
									vim:SendKeyEvent(false, tostring(v), false, game);
								end;
							end);
						until v.UpperTorso:FindFirstChild("dotted") or (not v) or (not v.Parent) or (not v:FindFirstChild("Humanoid")) or (not v:FindFirstChild("HumanoidRootPart")) or (not Config.autofarmmob);
					end;
				end;
			end);
		end;
	end;
end);
farming:AddButton({
	Name = "Refresh Mob",
	Callback = function()
		hihi2:Refresh(getmob(), true);
	end
});
function getboss()
	local boss = {};
	for i, v in pairs((game:GetService("ReplicatedStorage")).Assets.Bosses:GetChildren()) do
		if v:IsA("Model") then
			local a = string.split(v.Name, "_");
			if not table.find(boss, a[2]) then
				table.insert(boss, a[2]);
			end;
		end;
	end;
	return boss;
end;
local bossselect = "";
local boss = {};
farming:AddDropdown({
	Name = "Select Boss",
	Default = Config.boss,
	Options = getboss(),
	Callback = function(v)
		Config.boss = v;
		if not table.find(boss, v) then
			table.insert(boss, v);
			bossselect = bossselect .. v .. " , ";
		end;
		SavePreset();
	end
});
farming:AddToggle({
	Name = "Auto Farm Boss",
	Default = Config.autofarmboss,
	Callback = function(v)
		Config.autofarmboss = v;
		SavePreset();
	end
});
local boss = farming:AddLabel(bossselect);
spawn(function()
	pcall(function()
		while wait() do
			boss:Set(bossselect);
		end;
	end);
end);
local tatfarm = false;
local CFrame223;
local cframepos;
spawn(function()
	pcall(function()
		while wait() do
			if Config.autofarmboss then
				for i, v in pairs(workspace.Scriptable.Bosses:GetChildren()) do
					if string.find(v.Name, Config.boss) then
						cframepos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position;
						if Config.autofarmmob == true then
							Config.autofarmmob = false;
							tatfarm = true;
						end;
						if not v:FindFirstChild("HumanoidRootPart") then
							CFrame223 = v.WorldPivot;
						else
							CFrame223 = v.HumanoidRootPart.CFrame;
						end;
						repeat
							wait();
							spawn(function()
								local args = {
									[1] = "TrainStat",
									[2] = tostring(Config.method)
								};
								(((game:GetService("ReplicatedStorage")):WaitForChild("Events")):WaitForChild("Stats/RemoteFunction")):InvokeServer(unpack(args));
							end);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame223 * CFrame.new(0, 0, 2);
							spawn(function()
								for i, v in pairs(skills) do
									vim:SendKeyEvent(true, tostring(v), false, game);
									task.wait();
									vim:SendKeyEvent(false, tostring(v), false, game);
								end;
							end);
						until not v or (not v.Parent) or (not v:FindFirstChild("Humanoid")) or (not Config.autofarmboss);
						function click(a)
							(game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2, a.AbsolutePosition.Y + 50, 0, true, a, 1);
							(game:GetService("VirtualInputManager")):SendMouseButtonEvent(a.AbsolutePosition.X + a.AbsoluteSize.X / 2, a.AbsolutePosition.Y + 50, 0, false, a, 1);
						end;
						click((game:GetService("Players")).LocalPlayer.PlayerGui.Menu.PagesContainer.BossResults.close);
						if tatfarm then
							Config.autofarmmob = true;
							tatfarm = false;
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframepos;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		pcall(function()
			if Config.chest then
				for i, v in pairs(workspace.Scriptable.Crates:GetChildren()) do
					if v:IsA("Model") then
						local CFrame = v.WorldPivot;
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame;
						repeat
							wait();
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position - v.Base.Position).Magnitude <= 20 then
								vim:SendKeyEvent(true, "E", false, game);
								task.wait();
								vim:SendKeyEvent(false, "E", false, game);
							elseif v:FindFirstChild("Base") then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame;
							end;
						until not v.Parent or (not v) or (not Config.chest);
					end;
				end;
			end;
		end);
	end;
end);
end