loadstring(game:HttpGet('https://raw.githubusercontent.com/GodoSop/StatisticsViewerTRD/refs/heads/main/Notify.lua'))()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local statistic = nil
local statisticname = ""

local Window = Rayfield:CreateWindow({
	Name = "Statistics Viewer -- Total Roblox Drama",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Statistics Viewer -- Total Roblox Drama",
	LoadingSubtitle = "by GodoSop",
	Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = true,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	Discord = {
		Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},

	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

local Tab = Window:CreateTab("Main Tab", 4483362458) -- Title, Image

local Coins = Tab:CreateButton({
	Name = "Set statistic to Coins",
	Callback = function()
		statistic = "Coins"
	end,
})

local CampWins = Tab:CreateButton({
	Name = "Set statistic to Camp Wins",
	Callback = function()
		statistic = "CampWins"
	end,
})

local MoviesWins = Tab:CreateButton({
	Name = "Set statistic to Movies Wins",
	Callback = function()
		statistic = "MoviesWins"
	end,
})

local ExpeditionWins = Tab:CreateButton({
	Name = "Set statistic to Expedition Wins",
	Callback = function()
		statistic = "ExpeditionWins"
	end,
})

local GamesPlayed = Tab:CreateButton({
	Name = "Set statistic to Games Played",
	Callback = function()
		statistic = "GamesPlayed"
	end,
})

local IdolsFound = Tab:CreateButton({
	Name = "Set statistic to Idols Found",
	Callback = function()
		statistic = "IdolsFound"
	end,
})

local ComebackWins = Tab:CreateButton({
	Name = "Set statistic to Comeback Wins",
	Callback = function()
		statistic = "ComebackWins"
	end,
})

local ChallengeWins = Tab:CreateButton({
	Name = "Set statistic to Challenge Wins",
	Callback = function()
		statistic = "ChallengeWins"
	end,
})

local NameToStatistic = Tab:CreateInput({
	Name = "Enter target name",
	CurrentValue = "",
	PlaceholderText = "E.g Kacy",
	RemoveTextAfterFocusLost = true,
	Flag = "Input1",
	Callback = function(Text)
		local RS = game:GetService("ReplicatedStorage")
		local Players = game:GetService("Players")
		local Characters = RS.Season.Players:GetChildren()
		local target = nil

		for _, plr in ipairs(Characters) do
			if string.lower(plr.Value) == string.lower(Text) then
				target = plr.Name
				break
			end
		end
		if target == nil then
			Rayfield:Notify({
				Title = "Error",
				Content = "Please enter a valid name",
				Duration = 4,
				Image = 4483362458,
			})
		else
			Rayfield:Notify({
				Title = "Statistics Notification",
				Content = tostring(Players:FindFirstChild(target).DataStore[statistic].Value),
				Duration = 4,
				Image = 4483362458,
			})
		end
	end,
})
