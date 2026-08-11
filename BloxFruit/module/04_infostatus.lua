Status:InfoNguyenNhat({
    Developer = { Name = "Tôi không giỏi mọi thứ, tôi giỏi đúng thứ khiến người khác nể.", Role = "Nguyễn Minh Nhật", Avatar = 84788566655539 }
})

Status:Discord({
    ServerName = "APPLE HUB",
    ServerDescription = "Join My Sever To Get New Update Apple Hub.",
    ServerIcon = 15901195437,
    InviteURL = "https://discord.gg/6mnF7haEjd"
})

Status:Section("Information Client")

local Time = Status:Paragraph({
    Title = 'Time Zone',
    Desc = 'Loading...',
    Image = 0,
})

local Players = game:GetService('Players')
local LocalizationService = game:GetService('LocalizationService')
local player = Players.LocalPlayer
local countryCode = "N/A"
pcall(function()
    countryCode = LocalizationService:GetCountryRegionForPlayerAsync(player)
end)

task.spawn(function()
    while task.wait(1) do
        local date = os.date('*t')
        local hour = date.hour % 24
        local ampm = hour < 12 and 'AM' or 'PM'
        local timezone = string.format('%02i:%02i:%02i %s', ((hour - 1) % 12) + 1, date.min, date.sec, ampm)
        local datetime = string.format('%02d/%02d/%04d', date.day, date.month, date.year)
        
        Time.Desc = string.format('%s - %s [ %s ]', datetime, timezone, countryCode)
    end
end)

local Timmessss = Status:Paragraph({
    Title = 'Game Time',
    Desc = 'Loading...',
    Image = 0,
})

task.spawn(function()
    while task.wait(1) do
        local success = pcall(function()
            local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
            local Hour = math.floor(GameTime / (36E2)) % 24
            local Minute = math.floor(GameTime / 60) % 60
            local Second = GameTime % 60
            Timmessss.Desc = (Hour .. ' Hour (h) ' .. Minute .. ' Minute (m) ' .. Second .. ' Second (s)')
        end)
        if not success then Timmessss.Desc = "N/A" end
    end
end)

Status:Section("Information Sever")

local Miragecheck = Status:Paragraph({ Title = 'Mirage Island', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                Miragecheck.Desc = 'Status: ✅'
            else
                Miragecheck.Desc = 'Status: ❌'
            end
        end)
        if not s then Miragecheck.Desc = 'Status: N/A' end
    end
end)

local Kitsunecheck = Status:Paragraph({ Title = 'Kitsune Island', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game:GetService('Workspace').Map:FindFirstChild('KitsuneIsland') then
                Kitsunecheck.Desc = 'Status: ✅'
            else
                Kitsunecheck.Desc = 'Status: ❌'
            end
        end)
        if not s then Kitsunecheck.Desc = 'Status: N/A' end
    end
end)

local CPrehistoriccheck = Status:Paragraph({ Title = 'Prehistoric Island', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') then
                CPrehistoriccheck.Desc = 'Status: ✅'
            else
                CPrehistoriccheck.Desc = 'Status: ❌'
            end
        end)
        if not s then CPrehistoriccheck.Desc = 'Status: N/A' end
    end
end)

local FrozenIsland = Status:Paragraph({ Title = 'Frozen Dimension', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland.Desc = 'Status: ✅'
            else
                FrozenIsland.Desc = 'Status: ❌'
            end
        end)
        if not s then FrozenIsland.Desc = 'Status: N/A' end
    end
end)

local MobCakePrince = Status:Paragraph({ Title = 'Dimension Killed', Desc = 'Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            local response = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CakePrinceSpawner')
            local len = string.len(response)

            if len == 88 then
                MobCakePrince.Desc = 'Kill: ' .. string.sub(response, 39, 41)
            elseif len == 87 then
                MobCakePrince.Desc = 'Kill: ' .. string.sub(response, 39, 40)
            elseif len == 86 then
                MobCakePrince.Desc = 'Kill: ' .. string.sub(response, 39, 39)
            else
                MobCakePrince.Desc = 'Cake Prince: ✅'
            end
        end)
        if not s then MobCakePrince.Desc = 'Kill: N/A' end
    end
end)

local TyrantStatus = Status:Paragraph({ Title = 'Tyrant of the Skies', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game:GetService('Workspace').Enemies:FindFirstChild('Tyrant of the Skies') then
                TyrantStatus.Desc = 'Status: ✅'
            else
                TyrantStatus.Desc = 'Status: ❌'
            end
        end)
        if not s then TyrantStatus.Desc = 'Status: N/A' end
    end
end)

local CheckRip = Status:Paragraph({ Title = 'Rip Indra', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game:GetService('ReplicatedStorage'):FindFirstChild('rip_indra True Form') or game:GetService('Workspace').Enemies:FindFirstChild('rip_indra') then
                CheckRip.Desc = 'Status: ✅'
            else
                CheckRip.Desc = 'Status: ❌'
            end
        end)
        if not s then CheckRip.Desc = 'Status: N/A' end
    end
end)

local CheckDoughKing = Status:Paragraph({ Title = 'Dough King', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game:GetService('ReplicatedStorage'):FindFirstChild('Dough King') or game:GetService('Workspace').Enemies:FindFirstChild('Dough King') then
                CheckDoughKing.Desc = 'Status: ✅'
            else
                CheckDoughKing.Desc = 'Status: ❌'
            end
        end)
        if not s then CheckDoughKing.Desc = 'Status: N/A' end
    end
end)

local EliteHunter = Status:Paragraph({ Title = 'Elite Hunter', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            local rs = game:GetService('ReplicatedStorage')
            local ws = game:GetService('Workspace').Enemies
            local progress = rs.Remotes.CommF_:InvokeServer('EliteHunter', 'Progress')

            if rs:FindFirstChild('Diablo') or rs:FindFirstChild('Deandre') or rs:FindFirstChild('Urban') or ws:FindFirstChild('Diablo') or ws:FindFirstChild('Deandre') or ws:FindFirstChild('Urban') then
                EliteHunter.Desc = 'Status: ✅ | Killed: ' .. tostring(progress)
            else
                EliteHunter.Desc = 'Status: ❌ | Killed: ' .. tostring(progress)
            end
        end)
        if not s then EliteHunter.Desc = 'Status: N/A' end
    end
end)

local Pullever = Status:Paragraph({ Title = 'Pull Lever', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer('CheckTempleDoor') then
                Pullever.Desc = 'Status: ✅'
            else
                Pullever.Desc = 'Status: ❌'
            end
        end)
        if not s then Pullever.Desc = 'Status: N/A' end
    end
end)

local FM = Status:Paragraph({ Title = 'Full Moon', Desc = 'Loading...', Image = 0 })
task.spawn(function()
    while task.wait(1) do
        local s = pcall(function()
            local moonId = game:GetService('Lighting').Sky.MoonTextureId
            if moonId == 'http://www.roblox.com/asset/?id=9709149431' then
                FM.Desc = 'Moon: Full Moon ✅ (5/5)'
            elseif moonId == 'http://www.roblox.com/asset/?id=9709149052' then
                FM.Desc = 'Moon: 4/5'
            elseif moonId == 'http://www.roblox.com/asset/?id=9709143733' then
                FM.Desc = 'Moon: 3/5'
            elseif moonId == 'http://www.roblox.com/asset/?id=9709150401' then
                FM.Desc = 'Moon: 2/5'
            elseif moonId == 'http://www.roblox.com/asset/?id=9709149680' then
                FM.Desc = 'Moon: 1/5'
            else
                FM.Desc = 'Moon: 0/5'
            end
        end)
        if not s then FM.Desc = 'Moon: N/A' end
    end
end)

local LegendarySword = Status:Paragraph({ Title = 'Legendary Sword', Desc = 'Status: Loading...', Image = 0 })
task.spawn(function()
    while task.wait(2) do -- Delay cao hơn một chút cho Remote Event để đỡ lag server
        local s = pcall(function()
            local rs = game:GetService('ReplicatedStorage').Remotes.CommF_
            if rs:InvokeServer('LegendarySwordDealer', '1') then
                LegendarySword.Desc = 'Status: Shisui ✅'
            elseif rs:InvokeServer('LegendarySwordDealer', '2') then
                LegendarySword.Desc = 'Status: Wando ✅'
            elseif rs:InvokeServer('LegendarySwordDealer', '3') then
                LegendarySword.Desc = 'Status: Saddi ✅'
            else
                LegendarySword.Desc = 'Status: Not Found ❌'
            end
        end)
        if not s then LegendarySword.Desc = 'Status: N/A' end
    end
end)

local Bone = Status:Paragraph({ Title = 'Bone', Desc = 'Loading...', Image = 0 })
task.spawn(function()
    while task.wait(2) do
        local s = pcall(function()
            local bones = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Bones', 'Check')
            Bone.Desc = 'You Have: ' .. tostring(bones) .. ' Bones'
        end)
        if not s then Bone.Desc = 'You Have: N/A Bones' end
    end
end)

-- SEVER FUNCTIONS
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId
local JobId = game.JobId

_G.AutoRejoin30m = false
local RejoinRunning = false

function GetNewServer()
    local Servers = {}
    local req = game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
    local data = HttpService:JSONDecode(req)

    for _, server in pairs(data.data) do
        if server.playing < server.maxPlayers and server.id ~= JobId then
            table.insert(Servers, server.id)
        end
    end

    if #Servers > 0 then
        return Servers[math.random(1, #Servers)]
    end
end

Status:Input({
    Title = T('status.input_job_id'),
    Placeholder = T('status.job_id'),
    ClearOnFocus = true,
    Callback = function(Value)
        getgenv().Job = Value
    end,
})

Status:Button({
    Title = T('status.join_server'),
    Callback = function()
        if getgenv().Job then
            TeleportService:TeleportToPlaceInstance(PlaceId, getgenv().Job, player)
        end
    end,
})

local SpamJoinRunning = false

Status:Toggle({
    Title = T('status.spam_join_server'),
    Desc = T('status.spam_join_server_desc'),
    Value = false,
    Callback = function(Value)
        _G.SpamJoin = Value

        if Value and not SpamJoinRunning then
            SpamJoinRunning = true

            task.spawn(function()
                while _G.SpamJoin do
                    if getgenv().Job and getgenv().Job ~= "" then
                        pcall(function()
                            TeleportService:TeleportToPlaceInstance(PlaceId, getgenv().Job, player)
                        end)
                    else
                        _G.SpamJoin = false
                        Library:Toast({
                            Message = T('status.enter_jobid_first')
                        })
                    end

                    task.wait(2.5)
                end

                SpamJoinRunning = false
            end)
        end
    end
})

Status:Button({
    Title = T('status.copy_job_id'),
    Callback = function()
        setclipboard(tostring(JobId))
    end,
})

Status:Toggle({
    Title = T('status.anti_reset'),
    Desc = T('status.anti_reset_desc'),
    Value = false,
    Callback = function(Value)
        _G.AutoRejoin30m = Value
        if Value and not RejoinRunning then
            RejoinRunning = true
            task.spawn(function()
                while _G.AutoRejoin30m do
                    task.wait(1800)
                    if not _G.AutoRejoin30m then break end

                    local NewServer = GetNewServer()

                    if NewServer then
                        TeleportService:TeleportToPlaceInstance(PlaceId, NewServer, player)
                    else
                        TeleportService:Teleport(PlaceId, player)
                    end
                end

                RejoinRunning = false
            end)
        end
    end
})

Status:Button({
    Title = T('status.rejoin_server'),
    Callback = function()
         TeleportService:Teleport(PlaceId, player)
    end,
})

Status:Button({
    Title = T('status.hop_server'),
    Callback = function()
        local ServerBrowser = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser")
        local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

        local success, data = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if not success or not data or not data.data then
            return warn("Failed to fetch servers")
        end

        local target = nil

        for _, server in pairs(data.data) do
            if server.playing and server.maxPlayers and server.playing < server.maxPlayers then
                target = server
                break
            end
        end

        if target then
            ServerBrowser:InvokeServer("teleport", target.id)
        end
    end,
})

Status:Button({
    Title = T('status.hop_server_less_people'),
    Callback = function()
        local ServerBrowser = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser")
        local baseUrl = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"

        local lowestServer = nil
        local cursor = ""

        local function ListServers(cur)
            local success, result = pcall(function()
                local raw = game:HttpGet(baseUrl .. (cur ~= "" and "&cursor=" .. cur or ""))
                return HttpService:JSONDecode(raw)
            end)

            return (success and result and result.data) and result or nil
        end

        for i = 1, 5 do
            local data = ListServers(cursor)

            if not data then
                task.wait(1)
                continue
            end

            for _, server in pairs(data.data) do
                if server.playing and server.maxPlayers and server.playing < server.maxPlayers then
                    if not lowestServer or server.playing < lowestServer.playing then
                        lowestServer = server
                    end
                end
            end

            cursor = data.nextPageCursor or ""

            if cursor == "" then
                break
            end
        end

        if lowestServer then
            ServerBrowser:InvokeServer("teleport", lowestServer.id)
        end
    end,
})