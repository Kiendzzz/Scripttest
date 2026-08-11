Others:Section('Fishing')

local RS = game:GetService('ReplicatedStorage')
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local Workspace = game:GetService('Workspace')
local TweenService = game:GetService('TweenService')
local CoreGui = game:GetService('CoreGui')
local FishReplicated = RS:WaitForChild('FishReplicated')
local FishingRequest = FishReplicated:WaitForChild('FishingRequest')
local FishingClientConfig = require(FishReplicated:WaitForChild('FishingClient'):WaitForChild('Config'))
local GetWaterHeight = require(RS:WaitForChild('Util'):WaitForChild('GetWaterHeightAtLocation'))
local Net = RS:WaitForChild('Modules'):WaitForChild('Net')
local CraftRemote = Net:WaitForChild('RF/Craft')
local JobsRemote = Net:WaitForChild('RF/JobsRemoteFunction')
local ToolAbilities = Net:WaitForChild('RF/JobToolAbilities')
local LogoID = 'rbxassetid://15707987574'

function NotifyNightMystic(texto)
    task.spawn(function()
        local guiName = 'NightMysticNotify'
        local existingGui = CoreGui:FindFirstChild(guiName)

        if existingGui then
            existingGui:Destroy()
        end

        local sg = Instance.new('ScreenGui')

        sg.Name = guiName
        sg.Parent = CoreGui
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local frame = Instance.new('Frame')

        frame.Parent = sg
        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        frame.Size = UDim2.new(0, 260, 0, 60)
        frame.Position = UDim2.new(1, 10, 0.85, 0)
        frame.BorderSizePixel = 0

        local stroke = Instance.new('UIStroke')

        stroke.Parent = frame
        stroke.Color = Color3.fromRGB(50, 50, 50)
        stroke.Thickness = 1

        local corner = Instance.new('UICorner')

        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = frame

        local icon = Instance.new('ImageLabel')

        icon.Parent = frame
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0, 10, 0, 10)
        icon.Size = UDim2.new(0, 40, 0, 40)
        icon.Image = LogoID

        local title = Instance.new('TextLabel')

        title.Parent = frame
        title.BackgroundTransparency = 1
        title.Position = UDim2.new(0, 60, 0, 8)
        title.Size = UDim2.new(0, 190, 0, 20)
        title.Font = Enum.Font.GothamBold
        title.Text = 'Auto Fish'
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 14
        title.TextXAlignment = Enum.TextXAlignment.Left

        local msg = Instance.new('TextLabel')

        msg.Parent = frame
        msg.BackgroundTransparency = 1
        msg.Position = UDim2.new(0, 60, 0, 28)
        msg.Size = UDim2.new(0, 190, 0, 20)
        msg.Font = Enum.Font.Gotham
        msg.Text = texto
        msg.TextColor3 = Color3.fromRGB(180, 180, 180)
        msg.TextSize = 12
        msg.TextXAlignment = Enum.TextXAlignment.Left

        local targetPos = UDim2.new(1, -270, 0.85, 0)

        TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Position = targetPos}):Play()
        task.wait(3)
        TweenService:Create(frame, TweenInfo.new(0.5), {
            BackgroundTransparency = 1,
            Position = targetPos + UDim2.new(0, 0, -0.1, 0),
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        TweenService:Create(icon, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(msg, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        task.wait(0.5)
        sg:Destroy()
    end)
end

_G.SelectedRod = 'Fishing Rod'
_G.SelectedBait = 'Basic Bait'
_G.AutoBuyBait = false
_G.AutoFishing = false
_G.AutoFishingQuest = false
_G.AutoQuestComplete = false
_G.AutoSellFish = false
_G.AutoSkillZ = false

Others:Dropdown({
    Title = 'Select Fishing Rod',
    Desc = 'Select fishing rod',
    List = {
        'Fishing Rod',
        'Gold Rod',
        'Shark Rod',
        'Shell Rod',
        'Treasure Rod',
    },
    Value = GetSetting('Fish_SelectedRod', 'Fishing Rod'),
    Callback = function(Value)
        _G.SelectedRod = Value
        _G.SaveData.Fish_SelectedRod = Value

        SaveSettings()
    end,
})
Others:Dropdown({
    Title = 'Select Bait',
    Desc = 'Select bait',
    List = {
        'Basic Bait',
        'Kelp Bait',
        'Good Bait',
        'Abyssal Bait',
        'Frozen Bait',
        'Epic Bait',
        'Carnivore Bait',
    },
    Value = GetSetting('Fish_SelectedBait', 'Basic Bait'),
    Callback = function(Value)
        _G.SelectedBait = Value
        _G.SaveData.Fish_SelectedBait = Value

        SaveSettings()

        if _G.AutoBuyBait then
            pcall(function()
                CraftRemote:InvokeServer('Craft', _G.SelectedBait, {})
            end)
        end
    end,
})
Others:Toggle({
    Title = 'Auto Buy Bait',
    Desc = 'Auto buy bait',
    Value = GetSetting('Fish_AutoBuyBait', false),
    Callback = function(Value)
        _G.AutoBuyBait = Value
        _G.SaveData.Fish_AutoBuyBait = Value

        SaveSettings()

        if Value then
            pcall(function()
                CraftRemote:InvokeServer('Craft', _G.SelectedBait, {})
            end)
        end
    end,
})
task.spawn(function()
    while task.wait(2) do
        if _G.AutoBuyBait and _G.SelectedBait then
            pcall(function()
                CraftRemote:InvokeServer('Craft', _G.SelectedBait, {})
            end)
        end
    end
end)
Others:Toggle({
    Title = 'Auto Fishing',
    Desc = 'Auto fishing',
    Value = GetSetting('Fish_AutoFishing', false),
    Callback = function(Value)
        _G.AutoFishing = Value
        _G.SaveData.Fish_AutoFishing = Value

        SaveSettings()
    end,
})
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoFishing then
            pcall(function()
                local plr = Players.LocalPlayer
                local char = plr.Character or plr.CharacterAdded:Wait()
                local hrp = char:FindFirstChild('HumanoidRootPart')

                if not hrp then
                    return
                end

                local equippedTool = char:FindFirstChildOfClass('Tool')

                if _G.SelectedRod and (not equippedTool or equippedTool.Name ~= _G.SelectedRod) then
                    local rodInBag = plr.Backpack:FindFirstChild(_G.SelectedRod)

                    if rodInBag then
                        char.Humanoid:EquipTool(rodInBag)

                        equippedTool = rodInBag
                    else
                        NotifyNightMystic('please equip:' .. tostring(_G.SelectedRod))

                        return
                    end
                end
                if equippedTool then
                    local maxLaunch = FishingClientConfig.Rod.MaxLaunchDistance
                    local waterHeight = GetWaterHeight(hrp.Position)
                    local rayOrigin = char.Head.Position
                    local rayDirection = hrp.CFrame.LookVector * maxLaunch
                    local ignoreList = {
                        char,
                        Workspace.Characters,
                        Workspace.Enemies,
                    }
                    local _, hitPos = Workspace:FindPartOnRayWithIgnoreList(Ray.new(rayOrigin, rayDirection), ignoreList)
                    local targetPos = hitPos and Vector3.new(hitPos.X, math.max(hitPos.Y, waterHeight), hitPos.Z)
                    local state = equippedTool:GetAttribute('State')
                    local serverState = equippedTool:GetAttribute('ServerState')

                    if targetPos and (state == 'ReeledIn' or serverState == 'ReeledIn') then
                        FishingRequest:InvokeServer('StartCasting')
                        task.wait()
                        FishingRequest:InvokeServer('CastLineAtLocation', targetPos, 100, true)
                    elseif serverState == 'Biting' then
                        FishingRequest:InvokeServer('Catching', true)
                        task.wait(0.1)
                        FishingRequest:InvokeServer('Catch', 1)
                        NotifyNightMystic('New item caught')
                    end
                end
            end)
        end
    end
end)
Others:Toggle({
    Title = 'Auto Quest Fishing',
    Desc = 'Auto fishing quest',
    Value = GetSetting('Fish_AutoQuest', false),
    Callback = function(Value)
        _G.AutoFishingQuest = Value
        _G.SaveData.Fish_AutoQuest = Value

        SaveSettings()
    end,
})

function HasQuest()
    local playerGui = Players.LocalPlayer:FindFirstChild('PlayerGui')

    if playerGui then
        local questGui = playerGui:FindFirstChild('Quest') or playerGui:FindFirstChild('QuestGui')

        if questGui and questGui:FindFirstChild('Container') and questGui.Container:FindFirstChild('QuestTitle') then
            return true
        end
    end

    return false
end

task.spawn(function()
    while task.wait(1) do
        if _G.AutoFishingQuest then
            pcall(function()
                if not HasQuest() then
                    JobsRemote:InvokeServer('FishingNPC', 'Angler', 'AskQuest')
                end
            end)
        end
    end
end)
Others:Toggle({
    Title = 'Auto Complete Quest',
    Desc = 'Auto complete quest',
    Value = GetSetting('Fish_AutoComplete', false),
    Callback = function(Value)
        _G.AutoQuestComplete = Value
        _G.SaveData.Fish_AutoComplete = Value

        SaveSettings()

        if Value then
            pcall(function()
                JobsRemote:InvokeServer('FishingNPC', 'FinishQuest')
            end)
        end
    end,
})
task.spawn(function()
    while task.wait(5) do
        if _G.AutoQuestComplete then
            pcall(function()
                JobsRemote:InvokeServer('FishingNPC', 'FinishQuest')
            end)
        end
    end
end)
Others:Toggle({
    Title = 'Auto Sell Fish',
    Desc = 'Auto sell fish',
    Value = GetSetting('Fish_AutoSell', false),
    Callback = function(Value)
        _G.AutoSellFish = Value
        _G.SaveData.Fish_AutoSell = Value

        SaveSettings()

        if Value then
            pcall(function()
                JobsRemote:InvokeServer('FishingNPC', 'SellFish')
            end)
        end
    end,
})
task.spawn(function()
    while task.wait(5) do
        if _G.AutoSellFish then
            pcall(function()
                JobsRemote:InvokeServer('FishingNPC', 'SellFish')
            end)
        end
    end
end)
Others:Toggle({
    Title = 'Auto use skill of the rod',
    Desc = 'Auto use rod skill',
    Value = GetSetting('Fish_AutoSkillZ', false),
    Callback = function(Value)
        _G.AutoSkillZ = Value
        _G.SaveData.Fish_AutoSkillZ = Value

        SaveSettings()
    end,
})
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoSkillZ then
            pcall(function()
                ToolAbilities:InvokeServer('Z', true)
            end)
        end
    end
end)

local plr = game.Players.LocalPlayer
local RS = game:GetService('ReplicatedStorage')
local WS = game:GetService('Workspace')

_G.AutoBoss = false
_G.FarmAllBoss = false
_G.AutoAcceptQuest = false
_G.CurrentTargetBoss = nil
_G.FindBoss = _G.FindBoss or (Boss and Boss[1])

function EquipWeapon()
    local char = plr.Character

    if not char then
        return
    end

    local hum = char:FindFirstChildOfClass('Humanoid')

    if not hum then
        return
    end
    if _G.SelectWeapon then
        local tool = plr.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)

        if tool and tool.Parent ~= char then
            hum:EquipTool(tool)
        end
    end
end
function GoToBoss(targetBoss)
    local char = plr.Character
    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local hum = char and char:FindFirstChildOfClass('Humanoid')

    if not targetBoss or not hrp or not hum then
        return
    end

    local bossHRP = targetBoss:FindFirstChild('HumanoidRootPart') or targetBoss:FindFirstChild('Torso')

    if not bossHRP then
        return
    end

    local safeHeight = 22
    local targetPos = bossHRP.Position + Vector3.new(0, safeHeight, 0)
    local targetCFrame = CFrame.new(targetPos)
    local distToSafeSpot = (hrp.Position - targetPos).Magnitude

    EquipWeapon()

    if distToSafeSpot <= 5 then
        hrp.CFrame = targetCFrame
        hrp.Velocity = Vector3.zero
        hrp.AssemblyLinearVelocity = Vector3.zero
        hum.AutoRotate = false

        game:GetService('VirtualUser'):CaptureController()
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
    else
        if _tp then
            _tp(targetCFrame)
        else
            hrp.CFrame = targetCFrame
        end
    end
end

List = {
    ""
}

Others:Section('Boss Farm')

local BossDropdown = Others:Dropdown({
    Title = 'Select Boss',
    Desc = 'Select boss',
    List = Boss,
    Value = Boss[1],
    Callback = function(v)
        _G.FindBoss = v
    end,
})

Others:Button({
    Title = 'Refresh Boss List',
    Desc = 'Refresh boss list',
    Callback = function()
        local LiveBosses = {}
        local FoundAny = false

        for _, obj in pairs(WS:GetDescendants())do
            if obj:IsA('Model') and obj:GetAttribute('IsBoss') == true then
                if not table.find(LiveBosses, obj.Name) then
                    table.insert(LiveBosses, obj.Name)

                    FoundAny = true
                end
            end
        end
        for _, obj in pairs(RS:GetDescendants())do
            if obj:IsA('Model') and obj:GetAttribute('IsBoss') == true then
                if not table.find(LiveBosses, obj.Name) then
                    table.insert(LiveBosses, obj.Name)

                    FoundAny = true
                end
            end
        end

        if FoundAny then
            table.sort(LiveBosses)
            BossDropdown:Refresh(LiveBosses, true)
        else
            BossDropdown:Refresh({
                'Nenhum Boss Encontrado',
            }, true)
        end
    end,
})
Others:Toggle({
    Title = 'Auto Farm Boss Select',
    Desc = 'Auto farm selected boss',
    Value = false,
    Callback = function(v)
        _G.AutoBoss = v

        if v then
            _G.FarmAllBoss = false
        end
    end,
})
Others:Toggle({
    Title = 'Accept Quest Boss',
    Desc = 'Accept boss quest',
    Value = false,
    Callback = function(v)
        _G.AutoAcceptQuest = v
    end,
})
Others:Toggle({
    Title = 'Farm All Bosses',
    Desc = 'Farm all active bosses',
    Value = false,
    Callback = function(v)
        _G.FarmAllBoss = v

        if v then
            _G.AutoBoss = false
        end

        _G.CurrentTargetBoss = nil
    end,
})
spawn(function()
    while task.wait() do

        if _G.FarmAllBoss then

            if not (_G.CurrentTargetBoss 
                and _G.CurrentTargetBoss.Parent 
                and _G.CurrentTargetBoss:FindFirstChild('Humanoid') 
                and _G.CurrentTargetBoss.Humanoid.Health > 0) then

                local char = plr.Character
                local myHrp = char and char:FindFirstChild('HumanoidRootPart')

                if myHrp then

                    local potentialBosses = {}
                    local foundInWorkspace = false

                    function FastScan(container, isRS)
                        for _, v in pairs(container:GetDescendants()) do
                            if v:IsA('Model') and v:GetAttribute('IsBoss') == true then
                                if v.Name ~= 'Cursed Skeleton Boss' then
                                    local h = v:FindFirstChild('Humanoid')
                                    local hrp = v:FindFirstChild('HumanoidRootPart') or v:FindFirstChild('Torso')

                                    if h and h.Health > 0 and hrp then
                                        local dist = (myHrp.Position - hrp.Position).Magnitude

                                        if isRS then
                                            table.insert(potentialBosses, {
                                                Model = v,
                                                Distance = dist + 10000,
                                            })
                                        else
                                            table.insert(potentialBosses, {
                                                Model = v,
                                                Distance = dist,
                                            })
                                            foundInWorkspace = true
                                        end
                                    end
                                end
                            end
                        end
                    end

                    FastScan(WS, false)

                    if not foundInWorkspace then
                        FastScan(RS, true)
                    end

                    if #potentialBosses > 0 then
                        table.sort(potentialBosses, function(a, b)
                            return a.Distance < b.Distance
                        end)

                        _G.CurrentTargetBoss = potentialBosses[1].Model
                    else
                        _G.CurrentTargetBoss = nil
                    end

                else
                    task.wait(0.5)
                end

            else
                task.wait(0.2)
            end

        else
            task.wait(0.5)
        end

        task.wait(0.2)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBoss and _G.FindBoss then
                if QuestB then
                    QuestB()
                end

                local NeedQuest = false
                local char = plr.Character

                if not char or not char:FindFirstChild('HumanoidRootPart') then
                    return
                end
                if _G.AutoAcceptQuest and Qname and Qdata and PosQBoss then
                    local playerGui = plr.PlayerGui:FindFirstChild('Main') and plr.PlayerGui.Main:FindFirstChild('Quest')
                    local hasQuest = playerGui and playerGui.Visible

                    if not hasQuest then
                        NeedQuest = true
                    end
                end
                if NeedQuest then
                    if (PosQBoss.Position - char.HumanoidRootPart.Position).Magnitude <= 5 then
                        RS.Remotes.CommF_:InvokeServer('StartQuest', Qname, Qdata)
                    else
                        if _tp then
                            _tp(PosQBoss)
                        else
                            char.HumanoidRootPart.CFrame = PosQBoss
                        end
                    end

                    return
                end

                local specificBoss = WS:FindFirstChild('Enemies') and WS.Enemies:FindFirstChild(_G.FindBoss) or WS:FindFirstChild(_G.FindBoss)

                if specificBoss and specificBoss:FindFirstChild('Humanoid') and specificBoss.Humanoid.Health > 0 then
                    GoToBoss(specificBoss)
                elseif PosB then
                    if _tp then
                        _tp(PosB)
                    else
                        char.HumanoidRootPart.CFrame = PosB
                    end
                end
            elseif _G.FarmAllBoss then
                if _G.CurrentTargetBoss then
                    GoToBoss(_G.CurrentTargetBoss)
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait(0.5) do
        if plr.Backpack and _G.ChooseWP then
            for _, e in pairs(plr.Backpack:GetChildren())do
                if e.ToolTip == _G.ChooseWP then
                    _G.SelectWeapon = e.Name
                end
            end
        end
    end
end)
Others:Section('Quests')
Others:Toggle({
    Title = 'Auto Farm Observation',
    Desc = 'Auto farm observation haki',
    Value = GetSetting('AutoObsFarm_Save', false),
    Callback = function(I)
        _G.obsFarm = I
        _G.SaveData.AutoObsFarm_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.obsFarm then
                replicated.Remotes.CommE:FireServer('Ken', true)

                if plr:GetAttribute('KenDodgesLeft') == 0 then
                    KenTest = false
                elseif plr:GetAttribute('KenDodgesLeft') > 0 then
                    replicated.Remotes.CommE:FireServer('Ken', true)

                    KenTest = true
                end
            end
        end)
    end
end)
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.obsFarm then
                if World1 then
                    if workspace.Enemies:FindFirstChild('Galley Captain') then
                        if KenTest then
                            repeat
                                wait()

                                plr.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild('Galley Captain')).HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()

                                plr.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild('Galley Captain')).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif World2 then
                    if workspace.Enemies:FindFirstChild('Lava Pirate') then
                        if KenTest then
                            repeat
                                wait()

                                plr.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild('Lava Pirate')).HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()

                                plr.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild('Lava Pirate')).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif World3 then
                    if workspace.Enemies:FindFirstChild('Venomous Assailant') then
                        if KenTest then
                            repeat
                                wait()
                                _tp((workspace.Enemies:FindFirstChild('Venomous Assailant')).HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat
                                wait()
                                _tp((workspace.Enemies:FindFirstChild('Venomous Assailant')).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end
            end
        end)
    end
end)

if World3 then
    Others:Toggle({
        Title = 'Auto Observation V2',
        Desc = 'Auto get observation v2',
        Value = GetSetting('AutoKenV2_Save', false),
        Callback = function(I)
            _G.AutoKenVTWO = I
            _G.SaveData.AutoKenV2_Save = I

            SaveSettings()
        end,
    })
spawn(function()
    while wait(Sec) do
        if _G.AutoKenVTWO then
            pcall(function()
                local I = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
                local K = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
                local n = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
                local d = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)

                function HasAllFruits()
                    function has(x)
                        return plr.Backpack:FindFirstChild(x) or plr.Character:FindFirstChild(x)
                    end
                    return has("Apple") and has("Banana") and has("Pineapple")
                end

                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Defeat 50 Forest Pirates') then
                    local I2 = GetConnectionEnemies('Forest Pirate')
                    if I2 then
                        repeat
                            wait()
                            G.Kill(I2, _G.AutoKenVTWO)
                        until not _G.AutoKenVTWO or I2.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(n)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true then
                    local I2 = GetConnectionEnemies('Captain Elephant')
                    if I2 then
                        repeat
                            wait()
                            G.Kill(I2, _G.AutoKenVTWO)
                        until not _G.AutoKenVTWO or I2.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(d)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == false then
                    replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen')
                    wait(0.1)
                    replicated.Remotes.CommF_:InvokeServer('StartQuest', 'CitizenQuest', 1)
                end

                if replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen') == 2 then
                    _tp(CFrame.new(-12513.51953125, 340.11373901367, -9873.048828125))
                end

                if not GetBP('Fruit Bowl') then
                    if not HasAllFruits() then
                        if not GetBP('Apple') then
                            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-12471,374,-7551))
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v.Name == 'Apple' and v:FindFirstChild("Handle") then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 1)
                                end
                            end
                        elseif not GetBP('Banana') then
                            _tp(CFrame.new(2286,73,-7159))
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v.Name == 'Banana' and v:FindFirstChild("Handle") then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 1)
                                end
                            end
                        elseif not GetBP('Pineapple') then
                            _tp(CFrame.new(-712,98,5711))
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v.Name == 'Pineapple' and v:FindFirstChild("Handle") then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0)
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 1)
                                end
                            end
                        end
                    else
                        repeat
                            task.wait()
                            _tp(I)
                        until (plr.Character.HumanoidRootPart.Position - I.Position).Magnitude < 10
                        replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen')
                        task.wait(0.2)
                        replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen')
                    end
                end

                if GetBP('Fruit Bowl') then
                    repeat
                        task.wait()
                        _tp(K)
                    until (plr.Character.HumanoidRootPart.Position - K.Position).Magnitude < 10

                    replicated.Remotes.CommF_:InvokeServer('KenTalk2', 'Start')
                    task.wait(0.2)
                    replicated.Remotes.CommF_:InvokeServer('KenTalk2', 'Buy')
                end
            end)
        end
    end
end)
    Others:Toggle({
        Title = 'Auto Citizen Quest',
        Desc = 'Citizen quest',
        Value = false,
        Callback = function(I)
            _G.CitizenQuest = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.CitizenQuest then
                    if Lv >= 1800 and (replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress')).KilledBandits == false then
                        if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Forest Pirate') and (string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, '50') and plr.PlayerGui.Main.Quest.Visible == true) then
                            local I = GetConnectionEnemies('Forest Pirate')

                            if I then
                                repeat
                                    task.wait()
                                    G.Kill(I, _G.CitizenQuest)
                                until _G.CitizenQuest == false or not I.Parent or I.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                            else
                                _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        else
                            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

                            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                replicated.Remotes.CommF_:InvokeServer('StartQuest', 'CitizenQuest', 1)
                            end
                        end
                    elseif Lv >= 1800 and (replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress')).KilledBoss == false then
                        local I = GetConnectionEnemies('Captain Elephant')

                        if plr.PlayerGui.Main.Quest.Visible and (string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Captain Elephant') and plr.PlayerGui.Main.Quest.Visible == true) then
                            if I then
                                repeat
                                    task.wait()
                                    G.Kill(I, _G.CitizenQuest)
                                until _G.CitizenQuest == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                            else
                                _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                            end
                        else
                            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))

                            if ((CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.5)
                                replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen')
                            end
                        end
                    elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer('CitizenQuestProgress', 'Citizen') == 2 then
                        _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                    end
                end
            end)
        end
    end)
    Others:Section('Cursed Swords')

    local r = Others:Paragraph({
        Title = 'Elites Progress ',
        Desc = '',
        Image = 0,
    })

    spawn(function()
        while wait(Sec) do
            pcall(function()
                r.Desc = 'Elite Progress:  ' .. replicated.Remotes.CommF_:InvokeServer('EliteHunter', 'Progress')
            end)
        end
    end)
    Others:Toggle({
        Title = 'Auto Elite Quest',
        Desc = 'Auto elite hunt quest',
        Value = GetSetting('AutoEliteQuest_Save', false),
        Callback = function(I)
            _G.FarmEliteHunt = I
            _G.SaveData.AutoEliteQuest_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.FarmEliteHunt then
                    if plr.PlayerGui.Main.Quest.Visible == true then
                        if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Diablo') or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Urban') or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Deandre') then
                            for I, e in pairs(replicated:GetChildren())do
                                if string.find(e.Name, 'Diablo') or string.find(e.Name, 'Urban') or string.find(e.Name, 'Deandre') then
                                    _tp(e.HumanoidRootPart.CFrame)
                                end
                            end
                            for I, e in pairs(Enemies:GetChildren())do
                                if (string.find(e.Name, 'Diablo') or string.find(e.Name, 'Urban') or string.find(e.Name, 'Deandre')) and G.Alive(e) then
                                    repeat
                                        wait()
                                        G.Kill(e, _G.FarmEliteHunt)
                                    until not _G.FarmEliteHunt or plr.PlayerGui.Main.Quest.Visible == false or not e.Parent or e.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer('EliteHunter')
                    end
                end
            end)
        end
    end)
    Others:Toggle({
        Title = "Stop when got God's Chalice",
        Desc = 'Stop when chalice obtained',
        Value = GetSetting('StopChalice_Save', true),
        Callback = function(I)
            _G.StopWhenChalice = I
            _G.SaveData.StopChalice_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(0.2) do
            if _G.StopWhenChalice and _G.FarmEliteHunt then
                pcall(function()
                    if GetBP("God's Chalice") or GetBP('Sweet Chalice') or GetBP('Fist of Darkness') then
                        _G.FarmEliteHunt = false
                    end
                end)
            end
        end
    end)
    Others:Toggle({
        Title = 'Auto Tushita Sword',
        Desc = 'Auto get tushita sword',
        Value = false,
        Callback = function(I)
            _G.Auto_Tushita = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Auto_Tushita then
                    if workspace.Map.Turtle:FindFirstChild('TushitaGate') then
                        if not GetBP('Holy Torch') then
                            _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                            wait(0.7)
                        else
                            EquipWeapon('Holy Torch')
                            task.wait(1)

                            repeat
                                task.wait()
                                _tp(CFrame.new(-10752, 417, -9366))
                            until not _G.Auto_Tushita or ((CFrame.new(-10752, 417, -9366)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                            wait(0.7)

                            repeat
                                task.wait()
                                _tp(CFrame.new(-11672, 334, -9474))
                            until not _G.Auto_Tushita or ((CFrame.new(-11672, 334, -9474)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                            wait(0.7)

                            repeat
                                task.wait()
                                _tp(CFrame.new(-12132, 521, -10655))
                            until not _G.Auto_Tushita or ((CFrame.new(-12132, 521, -10655)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                            wait(0.7)

                            repeat
                                task.wait()
                                _tp(CFrame.new(-13336, 486, -6985))
                            until not _G.Auto_Tushita or ((CFrame.new(-13336, 486, -6985)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10

                            wait(0.7)

                            repeat
                                task.wait()
                                _tp(CFrame.new(-13489, 332, -7925))
                            until not _G.Auto_Tushita or ((CFrame.new(-13489, 332, -7925)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        end
                    else
                        local I = GetConnectionEnemies('Longma')

                        if I then
                            repeat
                                task.wait()
                                G.Kill(I, _G.Auto_Tushita)
                            until I.Humanoid.Health <= 0 or not _G.Auto_Tushita or not I.Parent
                        else
                            if replicated:FindFirstChild('Longma') then
                                _tp((replicated:FindFirstChild('Longma')).HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                            end
                        end
                    end
                end
            end)
        end
    end)
    Others:Toggle({
        Title = 'Auto Yama Sword',
        Desc = 'Auto get yama sword',
        Value = GetSetting('AutoYama_Save', false),
        Callback = function(I)
            _G.Auto_Yama = I
            _G.SaveData.AutoYama_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Auto_Yama then
                    if replicated.Remotes.CommF_:InvokeServer('EliteHunter', 'Progress') < 30 then
                        _G.FarmEliteHunt = true
                    elseif replicated.Remotes.CommF_:InvokeServer('EliteHunter', 'Progress') > 30 then
                        _G.FarmEliteHunt = false

                        if (workspace.Map.Waterfall.SealedKatana.Handle.Position - plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
                            _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)

                            local I = GetConnectionEnemies('Ghost')

                            if I then
                                repeat
                                    wait()
                                    G.Kill(I, _G.Auto_Yama)
                                until I.Humanoid.Health <= 0 or not I.Parent or not _G.Auto_Yama

                                fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)
end
if World2 or World3 then
    Others:Section('Buso/Aura Colours')
    Others:Toggle({
        Title = 'Teleport Barista Haki',
        Desc = 'Teleport to haki npc',
        Value = GetSetting('TpBarista_Save', false),
        Callback = function(I)
            _G.Tp_MasterA = I
            _G.SaveData.TpBarista_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait() do
            if _G.Tp_MasterA then
                pcall(function()
                    for _, e in pairs(replicated.NPCs:GetChildren())do
                        if e.Name == 'Barista Cousin' then
                            _tp(e.HumanoidRootPart.CFrame)
                        end
                    end
                end)
            end
        end
    end)
    Others:Button({
        Title = 'Buy Buso Colors',
        Desc = 'Buy buso colors',
        Callback = function()
            replicated.Remotes.CommF_:InvokeServer('ColorsDealer', '2')
        end,
    })
end
if World3 then
    Others:Toggle({
        Title = 'Auto Rainbow Haki',
        Desc = 'Auto get rainbow haki',
        Value = GetSetting('AutoRainbowHaki_Save', false),
        Callback = function(I)
            _G.Auto_Rainbow_Haki = I
            _G.SaveData.AutoRainbowHaki_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        pcall(function()
            while wait(Sec) do
                if _G.Auto_Rainbow_Haki then
                    if plr.PlayerGui.Main.Quest.Visible == false then
                        if _G.GetQFast then
                            if plr.PlayerGui.Main.Quest.Visible == false then
                                replicated.Remotes.CommF_:InvokeServer('HornedMan', 'Bet')
                            end
                        else
                            Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)

                            if plr.Character.HumanoidRootPart.CFrame ~= Rainbow1 then
                                _tp(Rainbow1)
                            elseif plr.Character.HumanoidRootPart.CFrame == Rainbow1 then
                                wait(1)
                                replicated.Remotes.CommF_:InvokeServer('HornedMan', 'Bet')
                            end
                        end
                    elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Stone') then
                        local I = GetConnectionEnemies('Stone')

                        if I then
                            repeat
                                wait()
                                G.Kill(I, _G.Auto_Rainbow_Haki)
                            until _G.Auto_Rainbow_Haki == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-5, 0.805323839, 0.592835128, -0.999732077, -1.3705551599999999E-2, 0.0186523199))
                        end
                    elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Hydra Leader') then
                        local I = GetConnectionEnemies('Hydra Leader')

                        if I then
                            repeat
                                task.wait()
                                G.Kill(I, _G.Auto_Rainbow_Haki)
                            until _G.Auto_Rainbow_Haki == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625))

                            local I = Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625)
                            local e = CFrame.new(5821.8979492188, 1019.0950927734, -73.719230651855)

                            if plr.Character.HumanoidRootPart.CFrame.Position == I then
                                _tp(e)
                            end
                        end
                    elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Kilo Admiral') then
                        local I = GetConnectionEnemies('Kilo Admiral')

                        if I then
                            repeat
                                task.wait()
                                G.Kill(I, _G.Auto_Rainbow_Haki)
                            until _G.Auto_Rainbow_Haki == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, 0, -0.143904909, 0, 1.00000012, 0, 0.143904924, 0, -0.989591479))
                        end
                    elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Captain Elephant') then
                        local I = GetConnectionEnemies('Captain Elephant')

                        if I then
                            repeat
                                task.wait()
                                G.Kill(I, _G.Auto_Rainbow_Haki)
                            until _G.Auto_Rainbow_Haki == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            local I = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
                            local e = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)

                            if plr.Character.HumanoidRootPart.CFrame.Position ~= I then
                                replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                            elseif plr.Character.HumanoidRootPart.CFrame.Position == I then
                                _tp(e)
                            end
                        end
                    elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Beautiful Pirate') then
                        local I = GetConnectionEnemies('Captain Elephant')

                        if I then
                            repeat
                                task.wait()
                                G.Kill(I, _G.Auto_Rainbow_Haki)
                            until _G.Auto_Rainbow_Haki == false or I.Humanoid.Health <= 0 or not I.Parent or plr.PlayerGui.Main.Quest.Visible == false
                        else
                            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(5314.5463867188, 22.562219619751, -127.06755065918))
                        end
                    end
                end
            end
        end)
    end)
end

Others:Toggle({
    Title = 'Accept Quest Bypass [Risk]',
    Desc = 'Accept quest bypass [risk]',
    Value = GetSetting('BypassQuest_Save', false),
    Callback = function(I)
        _G.GetQFast = I
        _G.SaveData.BypassQuest_Save = I

        SaveSettings()
    end,
})
