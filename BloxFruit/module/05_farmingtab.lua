Farm:Section('Local Main')
Farm:Dropdown({
    Title = 'Select Weapon',
    Desc = 'select weapon',
    List = {
        'Melee',
        'Sword',
        'Blox Fruit',
        'Gun',
    },
    Value = 'Melee',
    Multi = false,
    Callback = function(I)
        _G.ChooseWP = I
    end,
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            for _, e in pairs(plr.Backpack:GetChildren())do
                if e.ToolTip == _G.ChooseWP then
                    if plr.Backpack:FindFirstChild(e.Name) then
                        _G.SelectWeapon = e.Name
                    end
                end
            end
        end)
    end
end)

_G.SelectedFarmMode = 'Level'
_G.StartFarm = false
_G.Level = false
_G.AutoFarm_Bone = false
_G.AutoFarm_Cake = false
_G.AutoTyrant = false
_G.AcceptQuest = false
_G.DungeonWeaponMode = _G.DungeonWeaponMode or 'Melee'
_G.FarmDistance = _G.FarmDistance or 35
_G.SpinRadius = _G.SpinRadius or 20
_G.PlayerTweenSpeed = _G.PlayerTweenSpeed or 300
_G.AutoReturnToHub = _G.AutoReturnToHub or false
local DungeonAttackOffset = CFrame.new(0, _G.FarmDistance, 0)

local CurrentMobLevel = nil
local CurrentMobLevelSystem = nil
local TELEPORT_DISTANCE_THRESHOLD = 15

function TeleportConditional(hrp, targetCFrame, threshold)
    if not hrp or not targetCFrame then
        return
    end

    local dist = (targetCFrame.Position - hrp.Position).Magnitude

    if dist > threshold then
        _tp(targetCFrame)
    end
end

Farm:Toggle({
    Title = 'Super Attack',
    Desc = 'Hit Super Attack Mob',
    Value = GetSetting('AutoAttack_Save', true),
    Callback = function(I)
        _G.Seriality = I
        _G.SaveData.AutoAttack_Save = I

        SaveSettings()
    end,
})

Farm:Toggle({
    Title = "Bring Mob",
    Value = GetSetting('BringMobs_Save', true),
    Callback = function(v)
        _B = v
        _G.SaveData.BringMobs_Save = _B
        SaveSettings()
    end,
})

Farm:Button({
    Title = 'FPS Fix Lag',
    Desc = 'Improve FPS for low end device',
    Callback = function()
        LowCpu()
    end,
})

local V5 = game.Players.LocalPlayer

function y5(I)
    if not I then
        return false
    end

    local e = I:FindFirstChild('Humanoid')

    return e and e.Health > 0
end

Farm:Section('Auto Farm')

Farm:Paragraph({
    Title = 'Note:',
    Desc = 'Select what you want to farm Level, Bones, Cake Prince, Tyrant of the skies farm',
    Image = 15707987574,
})

Farm:Dropdown({
    Title = 'Select Farm Mode',
    Desc = 'Select farm you want',
    List = {
        'Level',
        'Bone',
        'Cake Prince',
        'Tyrant Of The Skies',
    },
    Value = GetSetting('SelectedFarmMode_Save', 'Level'),
    Callback = function(v)
        _G.SelectedFarmMode = v
        _G.SaveData.SelectedFarmMode_Save = v

        SaveSettings()
    end,
})
Farm:Toggle({
    Title = 'Start Farm',
    Desc = 'Start farming to selected mode',
    Value = GetSetting('StartFarm_Save', false),
    Callback = function(v)
        _G.StartFarm = v
        _G.Level = false
        _G.AutoFarm_Bone = false
        _G.AutoFarm_Cake = false
        _G.AutoTyrant = false

        if v then
            if _G.SelectedFarmMode == 'Level' then
                _G.Level = true
            elseif _G.SelectedFarmMode == 'Bone' then
                _G.AutoFarm_Bone = true
            elseif _G.SelectedFarmMode == 'Cake Prince' then
                _G.AutoFarm_Cake = true
            elseif _G.SelectedFarmMode == 'Tyrant Of The Skies' then
                _G.AutoTyrant = true
            end
        end

        _G.SaveData.StartFarm_Save = v

        SaveSettings()
    end,
})
Farm:Toggle({
    Title = 'Accept Quests',
    Desc = 'Auto accept quest to selected mode',
    Value = GetSetting('AcceptQuest_Save', false),
    Callback = function(v)
        _G.AcceptQuest = v
        _G.SaveData.AcceptQuest_Save = v

        SaveSettings()
    end,
})

local FarmHeight = 30

spawn(function()
    game:GetService('RunService').Stepped:Connect(LPH_NO_VIRTUALIZE(function()
        if _G.AutoTyrant and _G.StartFarm then
            local char = game.Players.LocalPlayer.Character

            if char then
                for _, part in pairs(char:GetDescendants())do
                    if part:IsA('BasePart') and part.CanCollide then
                        part.CanCollide = false
                    end
                end

                if char:FindFirstChild('Humanoid') then
                    char.Humanoid.AutoRotate = true

                    char.Humanoid:ChangeState(11)
                end
            end
        end
    end))
end)

function GetTargetByLevel()
    local myLevel = game.Players.LocalPlayer.Data.Level.Value

    if myLevel >= 2575 then
        return {
            Name = 'Skull Slayer',
            QuestArgs = {
                'StartQuest',
                'TikiQuest3',
                2,
            },
            QuestPos = CFrame.new(-16665.0879, 105.27478, 1577.61743, -0.999621451, 3.5280582000000003e-8, 0.0275127869, 3.5990368e-8, 1, 2.53032191e-8, -2.75127869E-2, 2.62838356e-8, -0.999621451),
            FarmPos = CFrame.new(-16709.49, 419.68, 1751.09),
        }
    elseif myLevel > 2550 then
        return {
            Name = 'Serpent Hunter',
            QuestArgs = {
                'StartQuest',
                'TikiQuest3',
                1,
            },
            QuestPos = CFrame.new(-16665.0879, 105.27478, 1577.61743, -0.999621451, 3.5280582000000003e-8, 0.0275127869, 3.5990368e-8, 1, 2.53032191e-8, -2.75127869E-2, 2.62838356e-8, -0.999621451),
            FarmPos = CFrame.new(-16645.64, 163.09, 1352.87),
        }
    elseif myLevel >= 2525 then
        return {
            Name = 'Isle Champion',
            QuestArgs = {
                'StartQuest',
                'TikiQuest2',
                2,
            },
            QuestPos = CFrame.new(-16546.748, 55.7216759, -172.865311, -5.95058464E-2, 2.45485676e-8, 0.998227954, -5.3272025E-8, 1, -2.77677703E-8, -0.998227954, -5.48299717E-8, -5.95058464E-2),
            FarmPos = CFrame.new(-16602.1015625, 130.38734436035, 1087.2456054688),
        }
    elseif myLevel >= 2500 then
        return {
            Name = 'Sun-kissed Warrior',
            QuestArgs = {
                'StartQuest',
                'TikiQuest2',
                1,
            },
            QuestPos = CFrame.new(-16546.748, 55.7216759, -172.865311, -5.95058464E-2, 2.45485676e-8, 0.998227954, -5.3272025E-8, 1, -2.77677703E-8, -0.998227954, -5.48299717E-8, -5.95058464E-2),
            FarmPos = CFrame.new(-16347, 64, 984),
        }
    elseif myLevel >= 2475 then
        return {
            Name = 'Island Boy',
            QuestArgs = {
                'StartQuest',
                'TikiQuest1',
                2,
            },
            QuestPos = CFrame.new(-16546.748, 55.7216759, -172.865311, -5.95058464E-2, 2.45485676e-8, 0.998227954, -5.3272025E-8, 1, -2.77677703E-8, -0.998227954, -5.48299717E-8, -5.95058464E-2),
            FarmPos = CFrame.new(-16670, 43, -270),
        }
    else
        return {
            Name = 'Isle Outlaw',
            QuestArgs = {
                'StartQuest',
                'TikiQuest1',
                1,
            },
            QuestPos = CFrame.new(-16546.748, 55.7216759, -172.865311, -5.95058464E-2, 2.45485676e-8, 0.998227954, -5.3272025E-8, 1, -2.77677703E-8, -0.998227954, -5.48299717E-8, -5.95058464E-2),
            FarmPos = CFrame.new(-16350, 45, -180),
        }
    end
end
function GetEyesCount()
    local model = workspace:FindFirstChild('Map') and workspace.Map:FindFirstChild('TikiOutpost') and workspace.Map.TikiOutpost:FindFirstChild('IslandModel')
    local count = 0

    if model then
        local eye1 = model:FindFirstChild('Eye1')
        local eye2 = model:FindFirstChild('Eye2')
        local chunks = model:FindFirstChild('IslandChunks')
        local eye3 = chunks and chunks:FindFirstChild('E') and chunks.E:FindFirstChild('Eye3')
        local eye4 = chunks and chunks:FindFirstChild('E') and chunks.E:FindFirstChild('Eye4')

        if eye1 and eye1.Transparency == 0 then
            count = count + 1
        end
        if eye2 and eye2.Transparency == 0 then
            count = count + 1
        end
        if eye3 and eye3.Transparency == 0 then
            count = count + 1
        end
        if eye4 and eye4.Transparency == 0 then
            count = count + 1
        end
    end

    return count
end
function UseAllCategorySkills()
    local VirtualInputManager = game:GetService('VirtualInputManager')
    local VirtualUser = game:GetService('VirtualUser')
    local categories = {
        'Melee',
        'Blox Fruit',
        'Sword',
        'Gun',
    }
    local skills = {
        'Z',
        'X',
        'C',
    }

    pcall(function()
        game:GetService('VirtualInputManager'):SendKeyEvent(true, 'RightControl', false, game)
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + Vector3.new(0, -1, 0))
    end)

    for _, toolType in ipairs(categories)do
        local tool = nil

        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
            if v:IsA('Tool') and v.ToolTip == toolType then
                tool = v

                break
            end
        end

        if not tool then
            local charTool = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool')

            if charTool and charTool.ToolTip == toolType then
                tool = charTool
            end
        end
        if tool then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
            task.wait(0.1)

            for i = 1, 3 do
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(851, 158))

                local skillKey = skills[i]

                if skillKey then
                    VirtualInputManager:SendKeyEvent(true, skillKey, false, game)
                    task.wait(0.05)
                    VirtualInputManager:SendKeyEvent(false, skillKey, false, game)
                end

                task.wait(0.1)
            end
        end
    end
end

spawn(function()
    local VaseIndex = 1
    while task.wait() do
        if _G.AutoTyrant and _G.StartFarm then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local boss = workspace.Enemies:FindFirstChild('Tyrant of the Skies')
                local eyes = GetEyesCount()

                if boss and boss.Humanoid.Health > 0 then
                    _tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, FarmHeight, 0))

                    repeat
                        task.wait()

                        if boss and boss:FindFirstChild('HumanoidRootPart') then
                            _tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, FarmHeight, 0))
                            EquipWeapon(_G.SelectWeapon)
                            G.Kill(boss, true)
                        else
                            break
                        end
                    until not boss.Parent or boss.Humanoid.Health <= 0 or not _G.StartFarm or not _G.AutoTyrant
                elseif eyes == 4 then
                    local targetsty = {
                        CFrame.new(-16335.1, 158.1, 1465.6),
                        CFrame.new(-16288.6, 158.1, 1470.3),
                        CFrame.new(-16258, 156.7, 1461.4),
                        CFrame.new(-16212.4, 158.1, 1466.3),
                        CFrame.new(-16335, 159.3, 1324.8),
                        CFrame.new(-16286, 155.9, 1323.8),
                        CFrame.new(-16250.3, 159.3, 1316.3),
                    }
                    local pos = targetsty[VaseIndex]

                    if pos then
                        _tp(pos)

                        local char = plr.Character

                        if char and char:FindFirstChild('HumanoidRootPart') then
                            if (char.HumanoidRootPart.Position - pos.Position).Magnitude < 15 then
                                char.HumanoidRootPart.Anchored = true

                                UseAllCategorySkills()
                                task.wait(0.1)

                                char.HumanoidRootPart.Anchored = false
                                VaseIndex = VaseIndex + 1

                                if VaseIndex > #targetsty then
                                    VaseIndex = 1
                                end
                            end
                        end
                    end
                else
                    local TargetData = GetTargetByLevel()
                    local QuestUI = plr.PlayerGui.Main.Quest
                    local hasQuest = QuestUI.Visible

                    if _G.AcceptQuest and not hasQuest then
                        local char = plr.Character

                        if char and char:FindFirstChild('HumanoidRootPart') then
                            local distToNPC = (char.HumanoidRootPart.Position - TargetData.QuestPos.Position).Magnitude

                            if distToNPC <= 3 then
                                char.HumanoidRootPart.CFrame = TargetData.QuestPos

                                task.wait(0.1)
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(TargetData.QuestArgs))
                                task.wait(0.5)
                            else
                                _tp(TargetData.QuestPos)
                            end
                        end
                    else
                        local char = plr.Character or plr.CharacterAdded:Wait()
                        local hrp = char:WaitForChild('HumanoidRootPart', 1)

                        if hrp then
                            local closestEnemy = nil
                            local shortestDistance = math.huge
                            local AllMobs = {
                                'Skull Slayer',
                                'Serpent Hunter',
                                'Isle Champion',
                                'Sun-kissed Warrior',
                                'Island Boy',
                                'Isle Outlaw',
                            }

                            for _, v in pairs(workspace.Enemies:GetChildren())do
                                if table.find(AllMobs, v.Name) and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
                                    local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude

                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        closestEnemy = v
                                    end
                                end
                            end

                            if closestEnemy then
                                local enemyPos = closestEnemy.HumanoidRootPart.CFrame

                                _tp(enemyPos * CFrame.new(0, FarmHeight, 0))
                                EquipWeapon(_G.SelectWeapon)
                                G.Kill(closestEnemy, true)
                            else
                                _tp(TargetData.FarmPos)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.AutoFarm_Bone and _G.StartFarm then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local hrp = plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')

                if not hrp then
                    return
                end

                local QuestUI = plr.PlayerGui.Main.Quest
                local MOBS = {
                    'Reborn Skeleton',
                    'Living Zombie',
                    'Demonic Soul',
                    'Posessed Mummy',
                }
                local npcPos = CFrame.new(-9516.99, 172.01, 6078.46)

                if _G.AcceptQuest and not QuestUI.Visible then
                    local distToNPC = (npcPos.Position - hrp.Position).Magnitude

                    if distToNPC > 10 then
                        _tp(npcPos)
                    else
                        task.wait(0.1)

                        local quests = {
                            {
                                'StartQuest',
                                'HauntedQuest1',
                                1,
                            },
                            {
                                'StartQuest',
                                'HauntedQuest1',
                                2,
                            },
                            {
                                'StartQuest',
                                'HauntedQuest2',
                                1,
                            },
                            {
                                'StartQuest',
                                'HauntedQuest2',
                                2,
                            },
                        }

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(quests[math.random(1, #quests)]))
                        task.wait(1)
                    end
                else
                    function GetClosestMob()
                        local closest, shortest = nil, math.huge

                        for _, mobName in pairs(MOBS)do
                            for _, mob in pairs(workspace.Enemies:GetChildren())do
                                if mob.Name == mobName and mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0 then
                                    local dist = (mob.PrimaryPart.Position - hrp.Position).Magnitude

                                    if dist < shortest then
                                        shortest = dist
                                        closest = mob
                                    end
                                end
                            end
                        end

                        return closest
                    end

                    local mob = GetClosestMob()

                    if mob then
                        _tp(mob.PrimaryPart.CFrame)
                        EquipWeapon(_G.SelectWeapon)
                        G.Kill(mob, true)
                    else
                        _tp(CFrame.new(-9495.68, 453.58, 5977.34))
                    end
                end
            end)
        end
    end
end)

local CurrentMob = nil

function GetNearestMob(TargetName)
    local plr = game.Players.LocalPlayer
    local Root = plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')

    if not Root then
        return nil
    end

    local Closest, Dist = nil, math.huge

    for _, Mob in pairs(workspace.Enemies:GetChildren())do
        if G.Alive(Mob) and Mob.Name == TargetName and Mob:FindFirstChild('HumanoidRootPart') then
            local d = (Mob.HumanoidRootPart.Position - Root.Position).Magnitude

            if d < Dist then
                Dist = d
                Closest = Mob
            end
        end
    end

    return Closest
end

spawn(function()
    while task.wait() do
        if _G.Level and _G.StartFarm then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local Root = plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')

                if not Root then
                    return
                end

                local QuestTitle = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                local Q = QuestNeta()

                if not string.find(QuestTitle, Q[5]) then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                end
                if not plr.PlayerGui.Main.Quest.Visible then
                    TeleportConditional(Root, Q[6], TELEPORT_DISTANCE_THRESHOLD)

                    if (Root.Position - Q[6].Position).Magnitude <= 50 then
                        task.wait(1.9)
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StartQuest', Q[3], Q[2])
                    end

                    return
                end

                local Nearest = GetNearestMob(Q[1])

                if CurrentMob and G.Alive(CurrentMob) and CurrentMob.Parent then
                    G.Kill(CurrentMob, true)

                    return
                else
                    CurrentMob = nil
                end
                if not Nearest then
                    TeleportConditional(Root, Q[4], TELEPORT_DISTANCE_THRESHOLD)

                    return
                end

                CurrentMob = Nearest

                if CurrentMob and CurrentMob:FindFirstChild('HumanoidRootPart') then
                    _tp(CurrentMob.HumanoidRootPart.CFrame)
                end

                repeat
                    task.wait()
                    G.Kill(CurrentMob, true)
                until not _G.StartFarm or not _G.Level or not CurrentMob.Parent or CurrentMob.Humanoid.Health <= 0

                CurrentMob = nil
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.AutoFarm_Cake and _G.StartFarm then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local hrp = plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')

                if not hrp then
                    return
                end

                local enemies = workspace:FindFirstChild('Enemies')

                if not enemies then
                    return
                end

                local CakePos = CFrame.new(-2091.91, 70, -12142.83)
                local PortalEntrance = CFrame.new(-2151.82, 149.32, -12404.91)
                local mirror = workspace.Map:FindFirstChild('CakeLoaf')

                mirror = mirror and mirror:FindFirstChild('BigMirror')

                local other = mirror and mirror:FindFirstChild('Other')
                local portalOpen = other and other.Transparency == 0
                local boss = enemies:FindFirstChild('Cake Prince') or enemies:FindFirstChild('Dough King')

                if not boss and not portalOpen and (hrp.Position - CakePos.Position).Magnitude > 300000 then
                    _tp(CakePos)

                    return
                end
                if boss or portalOpen then
                    if boss and boss:FindFirstChild('Humanoid') and boss.Humanoid.Health > 0 and boss.PrimaryPart then
                        local bossTarget = boss.PrimaryPart.CFrame * CFrame.new(0, 5, 0)

                        _tp(bossTarget)

                        local bossPos = boss.PrimaryPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(-90), 0, 0)

                        _tp(bossPos)
                        G.Kill(boss, true)

                        return
                    end
                    if (hrp.Position - PortalEntrance.Position).Magnitude < 500000 then
                        TeleportConditional(hrp, PortalEntrance, TELEPORT_DISTANCE_THRESHOLD)
                    end

                    return
                end

                local CAKE_MOBS = {
                    'Cookie Crafter',
                    'Cake Guard',
                    'Baking Staff',
                    'Head Baker',
                }

                if _G.AcceptQuest and not plr.PlayerGui.Main.Quest.Visible then
                    local questPos = CFrame.new(-1927.92, 37.8, -12842.54)

                    TeleportConditional(hrp, questPos, TELEPORT_DISTANCE_THRESHOLD)

                    if (hrp.Position - questPos.Position).Magnitude <= 40 then
                        local q = {
                            {
                                'StartQuest',
                                'CakeQuest2',
                                2,
                            },
                            {
                                'StartQuest',
                                'CakeQuest2',
                                1,
                            },
                            {
                                'StartQuest',
                                'CakeQuest1',
                                1,
                            },
                            {
                                'StartQuest',
                                'CakeQuest1',
                                2,
                            },
                        }

                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(q[math.random(1, 4)]))
                    end

                    return
                end

                local bestMob, bestDist = nil, math.huge

                for _, mob in ipairs(enemies:GetChildren())do
                    if table.find(CAKE_MOBS, mob.Name) and mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0 then
                        local dist = (mob.HumanoidRootPart.Position - hrp.Position).Magnitude

                        if dist < bestDist then
                            bestDist = dist
                            bestMob = mob
                        end
                    end
                end

                if bestMob then
                    repeat
                        task.wait()

                        if (workspace.Map.CakeLoaf.BigMirror.Other.Transparency == 0) or enemies:FindFirstChild('Cake Prince') then
                            break
                        end
                        if bestMob.Parent and bestMob.Humanoid.Health > 0 then
                            _tp(bestMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                            G.Kill(bestMob, true)
                        else
                            break
                        end
                    until not _G.StartFarm or not _G.AutoFarm_Cake or not bestMob.Parent or bestMob.Humanoid.Health <= 0
                else
                    TeleportConditional(hrp, CFrame.new(-1927.92, 37.8, -12842.54), TELEPORT_DISTANCE_THRESHOLD)
                end
            end)
        end
    end
end)
Farm:Section('Aura/Near Farm')

Farm:Slider({
    Title = 'Distance Radius',
    Desc = 'Distance Radius',
    Min = 50,
    Max = 500,
    Rounding = 0,
    Value = _G.MaxFarmDistance or 250,
    Callback = function(Value)
        _G.MaxFarmDistance = Value
    end,
})

local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

Farm:Toggle({
    Title = 'Kill Mobs Nearest',
    Desc = 'Start killing to nearest mob',
    Value = GetSetting('AutoFarmNear_Save', false),
    Callback = function(I)
        _G.AutoFarmNear = I
        _G.SaveData.AutoFarmNear_Save = I
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmNear then

            local Plr = Players.LocalPlayer
            local Char = Plr.Character or Plr.CharacterAdded:Wait()
            local Root = Char:FindFirstChild('HumanoidRootPart')

            if Root then

                local ClosestEnemy = nil
                local ShortestDistance = _G.MaxFarmDistance or 250

                local EnemiesFolder = workspace:FindFirstChild('Enemies')
                if EnemiesFolder then
                    for _, e in pairs(EnemiesFolder:GetChildren()) do
                        local Hum = e:FindFirstChild('Humanoid')
                        local HRP = e:FindFirstChild('HumanoidRootPart')

                        if Hum and HRP and Hum.Health > 0 then
                            local dist = (Root.Position - HRP.Position).Magnitude

                            if dist <= ShortestDistance then
                                ShortestDistance = dist
                                ClosestEnemy = e
                            end
                        end
                    end
                end

                if ClosestEnemy then
                    repeat
                        task.wait()

                        if not _G.AutoFarmNear then break end
                        if not ClosestEnemy.Parent then break end

                        local Hum = ClosestEnemy:FindFirstChild('Humanoid')
                        if not Hum or Hum.Health <= 0 then break end

                        if G and G.Kill then
                            G.Kill(ClosestEnemy, true)
                        end

                    until false
                end

            end
        end
    end
end)

Farm:Section('Other')

local Sec = 0.5

if World2 then
    Farm:Toggle({
        Title = 'Auto Factory Raid',
        Desc = 'Auto attack factory',
        Value = GetSetting('AutoFactory_Save', false),
        Callback = function(Value)
            _G.AutoFactory = Value
            _G.SaveData.AutoFactory_Save = Value

            SaveSettings()
        end,
    })
    spawn(function()
        local FactoryPos = CFrame.new(448.46756, 199.356781, -441.389252)

        while task.wait(Sec) do
            pcall(function()
                if not _G.AutoFactory then
                    return
                end

                local Core = GetConnectionEnemies('Core')

                if Core and Core:FindFirstChild('Humanoid') and Core.Humanoid.Health > 0 then
                    repeat
                        task.wait()

                        if not _G.AutoFactory then
                            break
                        end
                        if not Core or not Core.Parent then
                            break
                        end
                        if Core.Humanoid.Health <= 0 then
                            break
                        end
                        if _G.SelectWeapon then
                            EquipWeapon(_G.SelectWeapon)
                        end

                        _tp(FactoryPos)
                    until Core.Humanoid.Health <= 0 or _G.AutoFactory == false
                else
                    _tp(FactoryPos)
                end
            end)
        end
    end)
end
if World3 then
    Farm:Toggle({
        Title = 'Auto Pirate Raid',
        Desc = 'Auto attack mob on castle of the sea',
        Value = GetSetting('AutoRaidCastle_Save', false),
        Callback = function(I)
            _G.AutoRaidCastle = I
            _G.SaveData.AutoRaidCastle_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.AutoRaidCastle then
                pcall(function()
                    local TargetCFrame = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-9, 0.380223751, 3.5881019e-8, 1, -1.06665446E-7, -0.380223751, 1.12297109e-7, 0.924894512)
                    local CheckCFrame = CFrame.new(-5539.3115234375, 313.80053710938, -2972.3723144531)

                    if (CheckCFrame.Position - Root.Position).Magnitude <= 500 then
                        for _, e in pairs(workspace.Enemies:GetChildren())do
                            if e:FindFirstChild('HumanoidRootPart') and e:FindFirstChild('Humanoid') and e.Humanoid.Health > 0 then
                                if (e.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
                                    repeat
                                        wait()
                                        G.Kill(e, _G.AutoRaidCastle)
                                    until not _G.AutoRaidCastle or not e.Parent or e.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(e.Name)
                                end
                            end
                        end
                    else
                        local EnemyList = {
                            'Galley Pirate',
                            'Galley Captain',
                            'Raider',
                            'Mercenary',
                            'Vampire',
                            'Zombie',
                            'Snow Trooper',
                            'Winter Warrior',
                            'Lab Subordinate',
                            'Horned Warrior',
                            'Magma Ninja',
                            'Lava Pirate',
                            'Ship Deckhand',
                            'Ship Engineer',
                            'Ship Steward',
                            'Ship Officer',
                            'Arctic Warrior',
                            'Snow Lurker',
                            'Sea Soldier',
                            'Water Fighter',
                        }

                        for _, enemyName in pairs(EnemyList)do
                            if replicated:FindFirstChild(enemyName) then
                                for _, n in pairs(replicated:GetChildren())do
                                    if table.find(EnemyList, n.Name) then
                                        _tp(TargetCFrame)
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

Farm:Section('Collect')
Farm:Toggle({
    Title = 'Auto Collect Chest',
    Desc = 'Auto collect cheast [Tween]',
    Value = GetSetting('AutoFarmChest_Save', false),
    Callback = function(I)
        _G.AutoFarmChest = I
        _G.SaveData.AutoFarmChest_Save = I

        SaveSettings()
    end,
})
Farm:Toggle({
    Title = 'Auto Collect Berry',
    Desc = 'Auto collect berry',
    Value = GetSetting('AutoBerry_Save', false),
    Callback = function(I)
        _G.AutoBerry = I
        _G.SaveData.AutoBerry_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.AutoBerry then
            local I = game:GetService('CollectionService')
            local e = game:GetService('Players')
            local K = e.LocalPlayer
            local n = I:GetTagged('BerryBush')
            local d, z = math.huge

            for I = 1, #n, 1 do
                local e = n[I]

                for I, K in pairs(e:GetAttributes())do
                    if not BerryArray or table.find(BerryArray, K) then
                        _tp(e.Parent:GetPivot())

                        for I = 1, #n, 1 do
                            local e = n[I]

                            for I, e in pairs(e:GetChildren())do
                                if not BerryArray or table.find(BerryArray, e) then
                                    _tp(e.WorldPivot)
                                    fireproximityprompt(e.ProximityPrompt, math.huge)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait(Sec) do
        if _G.AutoFarmChest then
            pcall(function()
                local CollectionService = game:GetService('CollectionService')
                local Players = game:GetService('Players')
                local plrChar = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
                local d = plrChar:GetPivot().Position
                local Chests = CollectionService:GetTagged('_ChestTagged')
                local minDist, nearestChest = math.huge, nil

                for _, chest in pairs(Chests)do
                    local dist = (chest:GetPivot().Position - d).Magnitude

                    if not SelectedIsland or chest:IsDescendantOf(SelectedIsland) then
                        if not chest:GetAttribute('IsDisabled') and dist < minDist then
                            minDist = dist
                            nearestChest = chest
                        end
                    end
                end

                if nearestChest then
                    _tp(nearestChest:GetPivot())
                end
            end)
        end
    end
end)

if World3 then
    Farm:Section('Bone')
    Farm:Toggle({
        Title = 'Auto Random Bone',
        Desc = 'Auto buy random bone',
        Value = false,
        Callback = function(v)
            _G.Auto_Random_Bone = v
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.Auto_Random_Bone then
                replicated.Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
            end
        end
    end)
    Farm:Toggle({
        Title = 'Auto Soul Reaper',
        Desc = 'Auto spawn/kill soul reaper boss if have Hallow Essence',
        Value = false,
        Callback = function(v)
            _G.AutoHytHallow = v
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.AutoHytHallow then
                pcall(function()
                    local mob = GetConnectionEnemies('Soul Reaper')

                    if mob then
                        repeat
                            task.wait()
                            G.Kill(mob, _G.AutoHytHallow)
                        until mob.Humanoid.Health <= 0 or not _G.AutoHytHallow
                    else
                        if not GetBP('Hallow Essence') then
                            repeat
                                task.wait(0.1)
                                replicated.Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                            until not _G.AutoHytHallow or GetBP('Hallow Essence')
                        else
                            local pos = CFrame.new(-8932.32, 146.83, 6062.55)

                            repeat
                                wait(0.1)
                                _tp(pos)
                            until not _G.AutoHytHallow or plr.Character.HumanoidRootPart.CFrame == pos

                            EquipWeapon('Hallow Essence')
                        end
                    end
                end)
            end
        end
    end)
end

Farm:Section('Material')
Farm:Dropdown({
    Title = 'Select Material',
    Desc = 'Select material to farm',
    List = MaterialList,
    Value = GetSetting('SelectMaterial_Save', nil),
    Multi = false,
    Callback = function(I)
        (getgenv()).SelectMaterial = I
        _G.SaveData.SelectMaterial_Save = I

        SaveSettings()
    end,
})
Farm:Toggle({
    Title = 'Auto Farm',
    Desc = 'Start farming material you selected',
    Value = GetSetting('AutoMaterial_Save', false),
    Callback = function(I)
        (getgenv()).AutoMaterial = I
        _G.SaveData.AutoMaterial_Save = I

        SaveSettings()
    end,
})
spawn(function()
    function I(I, e)
        if I:FindFirstChild('Humanoid') and (I:FindFirstChild('HumanoidRootPart') and I.Humanoid.Health > 0) then
            if I.Name == e then
                repeat
                    wait()
                    G.Kill(I, (getgenv()).AutoMaterial)
                until not (getgenv()).AutoMaterial or not I.Parent or I.Humanoid.Health <= 0
            end
        end
    end
    function e()
        for I, e in pairs((game:GetService('Workspace'))._WorldOrigin.EnemySpawns:GetChildren())do
            for I, K in ipairs(MMon)do
                if string.find(e.Name, K) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - e.Position).Magnitude >= 10 then
                        _tp(e.CFrame * Pos)
                    end
                end
            end
        end
    end

    while wait() do
        if (getgenv()).AutoMaterial then
            pcall(function()
                if (getgenv()).SelectMaterial then
                    MaterialMon((getgenv()).SelectMaterial)
                    _tp(MPos)
                end

                for e, K in ipairs(MMon)do
                    for e, n in pairs(workspace.Enemies:GetChildren())do
                        I(n, K)
                    end
                end

                e()
            end)
        end
    end
end)

if World3 then
    Farm:Section('Dark Dragger + Valkyrie')
    Farm:Toggle({
        Title = 'Auto Kill Rip Indra',
        Desc = 'Auto attack rip indra',
        Value = GetSetting('AutoRipIndra_Save', false),
        Callback = function(I)
            _G.AutoRipIngay = I
            _G.SaveData.AutoRipIndra_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.AutoRipIngay then
                    local I = GetConnectionEnemies('rip_indra')

                    if not GetWP('Dark Dagger') or not GetIn('Valkyrie') and I then
                        repeat
                            wait()
                            G.Kill(I, _G.AutoRipIngay)
                        until not _G.AutoRipIngay or not I.Parent or I.Humanoid.Health <= 0
                    else
                        replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743E-8, 0.914313197, -1.9094333199999998E-8, 1, 3.8755778999999997e-8, -0.914313197, -1.76180437E-9, -0.405007899))
                        wait(0.1)
                        _tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                    end
                end
            end)
        end
    end)
    Farm:Toggle({
        Title = 'Auto Active Cores',
        Desc = 'Auto activate color',
        Value = GetSetting('AutoActiveCores_Save', false),
        Callback = function(I)
            _G.AutoUnHaki = I
            _G.SaveData.AutoActiveCores_Save = I

            SaveSettings()
        end,
    })

    AuraSkin = function(I)
        local e = {
            [1] = {
                StorageName = I,
                Type = 'AuraSkin',
                Context = 'Equip',
            },
        }

        (((replicated:WaitForChild('Modules')):WaitForChild('Net')):WaitForChild('RF/FruitCustomizerRF')):InvokeServer(unpack(e))
    end
    VaildColor = function(I)
        if I and I.BrickColor then
            return tostring(I.BrickColor) == 'Lime green'
        end
    end
    HakiCalculate = function(I)
        local e = {
            ['Really red'] = 'Pure Red',
            Oyster = 'Snow White',
            ['Hot pink'] = 'Winter Sky',
        }

        if I and I.BrickColor then
            return e[tostring(I.BrickColor)]
        end
    end

    spawn(function()
        while wait(Sec) do
            if _G.AutoUnHaki then
                pcall(function()
                    local I = workspace.Map['Boat Castle']:FindFirstChild('Summoner')

                    if I and I:FindFirstChild('Circle') then
                        for I, e in pairs((I:FindFirstChild('Circle')):GetChildren())do
                            if e.Name == 'Part' then
                                local I = e:FindFirstChild('Part')

                                if VaildColor(I) == false then
                                    AuraSkin(HakiCalculate(e))

                                    repeat
                                        wait()
                                        _tp(e.CFrame)
                                    until VaildColor(I) == true or not _G.AutoUnHaki
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end
