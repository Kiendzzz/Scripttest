Event:Section('Sea Event / Setting Sail')

local z5 = {
    'Guardian',
    'PirateGrandBrigade',
    'MarineGrandBrigade',
    'PirateBrigade',
    'MarineBrigade',
    'PirateSloop',
    'MarineSloop',
    'Beast Hunter',
}

Event:Dropdown({
    Title = 'Select Boats',
    Desc = 'Select boat type',
    List = z5,
    Value = 'Guardian',
    Multi = false,
    Callback = function(I)
        _G.SelectedBoat = I
    end,
})

if World3 then
    local H5 = {
        'Lv 1',
        'Lv 2',
        'Lv 3',
        'Lv 4',
        'Lv 5',
        'Lv 6',
        'Lv Infinite',
    }

    Event:Dropdown({
        Title = 'Select Level Sea',
        Desc = 'Select sea danger level',
        List = H5,
        Value = 'Lv 1',
        Multi = false,
        Callback = function(I)
            _G.DangerSc = I
        end,
    })
end

Event:Toggle({
    Title = 'Auto Sail Rough Sea',
    Desc = 'Buy boat and go to sea',
    Value = false,
    Callback = function(I)
        _G.SailBoats = I
    end,
})
spawn(function()
    while wait() do
        if _G.SailBoats then
            pcall(function()
                local I = CheckBoat()

                if not I then
                    local BoatDealerPos = CFrame.new(-16927.451, 9.086, 433.864)

                    TeleportToTarget(BoatDealerPos)

                    if (BoatDealerPos.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        replicated.Remotes.CommF_:InvokeServer('BuyBoat', _G.SelectedBoat)
                    end
                elseif I and (not (CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha) and (not (CheckEnemiesBoat() and _G.FishBoat) and (not (CheckSeaBeast() and _G.SeaBeast1) and (not (_G.PGB and CheckPirateGrandBrigade()) and (not (_G.HCM and CheckHauntedCrew()) and not (_G.Leviathan1 and CheckLeviathan())))))) then
                    if plr.Character.Humanoid.Sit == false then
                        local e = I.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

                        _tp(e)
                    else
                        if _G.DangerSc == 'Lv 1' then
                            CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
                        elseif _G.DangerSc == 'Lv 2' then
                            CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
                        elseif _G.DangerSc == 'Lv 3' then
                            CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
                        elseif _G.DangerSc == 'Lv 4' then
                            CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
                        elseif _G.DangerSc == 'Lv 5' then
                            CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
                        elseif _G.DangerSc == 'Lv 6' then
                            CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
                        elseif _G.DangerSc == 'Lv Infinite' then
                            CFrameSelectedZone = CFrame.new(-1E7, 31, 37016.25)
                        end

                        repeat
                            wait()

                            if not _G.FishBoat and CheckEnemiesBoat() or not _G.PGB and CheckPirateGrandBrigade() or not _G.TerrorShark and CheckTerrorShark() then
                                _tp(CFrameSelectedZone * CFrame.new(0, 150, 0))
                            else
                                _tp(CFrameSelectedZone)
                            end
                        until _G.SailBoats == false or CheckShark() and _G.Shark or CheckTerrorShark() and _G.TerrorShark or CheckFishCrew() and _G.MobCrew or CheckPiranha() and _G.Piranha or CheckSeaBeast() and _G.SeaBeast1 or CheckEnemiesBoat() and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or (plr.Character:WaitForChild('Humanoid')).Sit == false

                        plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            for I, e in pairs(workspace.Boats:GetChildren())do
                for I, e in pairs(workspace.Boats[e.Name]:GetDescendants())do
                    if e:IsA('BasePart') then
                        if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then
                            e.CanCollide = false
                        else
                            e.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)

_G.SetSpeedBoat = 300

Event:Toggle({
    Title = 'Activate Boat Speed',
    Desc = 'Adjust speed boat',
    Value = false,
    Callback = function(Value)
        _G.SpeedBoat = Value
    end,
})
Event:Slider({
    Title = 'Boat Speed Value',
    Desc = 'Default Speed 300',
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Value = _G.SetSpeedBoat or 300,
    Callback = function(Value)
        _G.SetSpeedBoat = Value
    end,
})
task.spawn(function()
    game:GetService('RunService').RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
        if _G.SpeedBoat then
            pcall(function()
                local plr = game.Players.LocalPlayer

                if plr.Character and plr.Character:FindFirstChild('Humanoid') and plr.Character.Humanoid.Sit then
                    for _, boat in pairs(workspace.Boats:GetChildren())do
                        local seat = boat:FindFirstChildWhichIsA('VehicleSeat')

                        if seat then
                            seat.MaxSpeed = _G.SetSpeedBoat
                            seat.Torque = 0.2
                            seat.TurnSpeed = 5
                        end
                    end
                end
            end)
        end
    end))
end)
Event:Section('Select what you will farm.')
Event:Toggle({
    Title = 'Auto Attack Sea Beast',
    Desc = 'Auto attack sea beast',
    Value = false,
    Callback = function(I)
        _G.AutoAttackSeabeasts = I
        _G.SeaBeast1 = I
    end,
})
Event:Toggle({
    Title = 'Auto Attack Pirate GrandBrigade',
    Desc = 'Auto attack pirate boat',
    Value = false,
    Callback = function(I)
        _G.PGB = I
    end,
})

if World2 then
    Event:Section('Go to Sea 3 for more options.')
end
if World1 then
    Event:Section('Go to Sea 3 or Sea 2 for Farm maritime events')
end
if game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    Event:Toggle({
        Title = 'Auto Shark',
        Desc = 'Auto attack shark groups',
        Value = false,
        Callback = function(I)
            _G.Shark = I
        end,
    })
    Event:Toggle({
        Title = 'Auto Piranha',
        Desc = 'Auto attack fish piranha',
        Value = false,
        Callback = function(I)
            _G.Piranha = I
        end,
    })
    Event:Toggle({
        Title = 'Auto Terror Shark',
        Desc = 'Auto attack terror shark boss',
        Value = false,
        Callback = function(I)
            _G.TerrorShark = I
        end,
    })
    Event:Toggle({
        Title = 'Auto Fish Crew Member',
        Desc = 'Attack fish crew member',
        Value = false,
        Callback = function(I)
            _G.MobCrew = I
        end,
    })
    Event:Toggle({
        Title = 'Auto Haunted Crew Member',
        Desc = 'Auto attack haunted crew member',
        Value = false,
        Callback = function(I)
            _G.HCM = I
        end,
    })
    Event:Toggle({
        Title = 'Auto Attack Fish Boat',
        Desc = 'Attack fish boat',
        Value = false,
        Callback = function(I)
            _G.FishBoat = I
        end,
    })
end

_G.SelectedSkills = {
    Melee = {
        Z = true,
        X = true,
        C = true,
    },
    Sword = {
        Z = true,
        X = true,
    },
    ['Blox Fruit'] = {
        Z = true,
        X = true,
        C = true,
        V = true,
        F = true,
    },
    Gun = {
        Z = true,
        X = true,
    },
}

function ExecuteSkills(category)
    if _G.SelectedSkills[category] then
        weaponSc(category)
        task.wait(0.2)

        local keys = {
            'Z',
            'X',
            'C',
            'V',
            'F',
        }

        for _, skill in ipairs(keys)do
            if _G.SelectedSkills[category][skill] then
                Useskills(category, skill)
                task.wait(0.35)
            end
        end
    end
end

function IsSeaBeastAttackEnabled()
    return _G.SeaBeast1 or _G.AutoAttackSeabeasts
end

function IsLiveSeaBeast(seaBeast)
    if not seaBeast or not seaBeast.Parent or not seaBeast:FindFirstChild('HumanoidRootPart') then
        return false
    end

    if seaBeast:FindFirstChild('Health') then
        return seaBeast.Health.Value > 0
    end

    if seaBeast:FindFirstChild('Humanoid') then
        return seaBeast.Humanoid.Health > 0
    end

    return true
end

function AttackSeaBeastTarget(seaBeast, height)
    if not IsLiveSeaBeast(seaBeast) then
        return
    end

    height = height or 200
    task.spawn(function()
        local waterBase = workspace:FindFirstChild('Map') and workspace.Map:FindFirstChild('WaterBase-Plane')
        local targetY = waterBase and waterBase.Position.Y + height or seaBeast.HumanoidRootPart.Position.Y + height

        _tp(CFrame.new(seaBeast.HumanoidRootPart.Position.X, targetY, seaBeast.HumanoidRootPart.Position.Z))
    end)

    if plr:DistanceFromCharacter(seaBeast.HumanoidRootPart.CFrame.Position) <= 500 then
        MousePos = seaBeast.HumanoidRootPart.Position

        if CheckF() then
            ExecuteSkills('Melee')
        else
            ExecuteSkills('Melee')
            ExecuteSkills('Sword')
            ExecuteSkills('Blox Fruit')
            ExecuteSkills('Gun')
        end
    end
end

task.spawn(function()
    while task.wait() do
        pcall(function()
            local seaEnemies = {
                {
                    Flag = _G.Shark,
                    Name = 'Shark',
                    Check = CheckShark,
                    KillType = 'Normal',
                },
                {
                    Flag = _G.TerrorShark,
                    Name = 'Terrorshark',
                    Check = CheckTerrorShark,
                    KillType = 'Sea',
                },
                {
                    Flag = _G.Piranha,
                    Name = 'Piranha',
                    Check = CheckPiranha,
                    KillType = 'Normal',
                },
                {
                    Flag = _G.MobCrew,
                    Name = 'Fish Crew Member',
                    Check = CheckFishCrew,
                    KillType = 'Normal',
                },
                {
                    Flag = _G.HCM,
                    Name = 'Haunted Crew Member',
                    Check = CheckHauntedCrew,
                    KillType = 'Normal',
                },
            }

            for _, enemyData in ipairs(seaEnemies)do
                if enemyData.Flag and enemyData.Check() then
                    for _, K in pairs(workspace.Enemies:GetChildren())do
                        if K.Name == enemyData.Name and G.Alive(K) then
                            repeat
                                task.wait()

                                if enemyData.KillType == 'Sea' then
                                    G.KillSea(K, enemyData.Flag)
                                else
                                    G.Kill(K, enemyData.Flag)
                                end
                            until not enemyData.Flag or not K.Parent or K.Humanoid.Health <= 0
                        end
                    end
                end
            end

            if IsSeaBeastAttackEnabled() and workspace:FindFirstChild('SeaBeasts') then
                for _, e in pairs(workspace.SeaBeasts:GetChildren())do
                    if IsLiveSeaBeast(e) and e.Name ~= 'Leviathan' then
                        repeat
                            task.wait()
                            AttackSeaBeastTarget(e, 200)
                        until not IsSeaBeastAttackEnabled() or not IsLiveSeaBeast(e)
                    end
                end
            end
            if _G.Leviathan1 and workspace.SeaBeasts:FindFirstChild('Leviathan') then
                for _, e in pairs(workspace.SeaBeasts:GetChildren())do
                    local segment = e:FindFirstChild('Leviathan Segment')

                    if e:FindFirstChild('HumanoidRootPart') and segment and (e:FindFirstChild('Health') and e.Health.Value > 0) then
                        repeat
                            task.wait()
                            task.spawn(function()
                                _tp(CFrame.new(e.HumanoidRootPart.Position.X, workspace.Map['WaterBase-Plane'].Position.Y + 200, e.HumanoidRootPart.Position.Z))
                            end)

                            if plr:DistanceFromCharacter(e.HumanoidRootPart.CFrame.Position) <= 500 then
                                MousePos = segment.Position

                                if CheckF() then
                                    ExecuteSkills('Melee')
                                else
                                    ExecuteSkills('Melee')
                                    ExecuteSkills('Sword')
                                    ExecuteSkills('Blox Fruit')
                                    ExecuteSkills('Gun')
                                end
                            end
                        until not _G.Leviathan1 or not e.Parent or e.Health.Value <= 0
                    end
                end
            end

            local boatConfigs = {
                {
                    Flag = _G.FishBoat,
                    Check = CheckEnemiesBoat,
                    Name = 'FishBoat',
                    Dist = 150,
                    Offset = CFrame.new(0, -50, -25),
                },
                {
                    Flag = _G.PGB,
                    Check = CheckPirateGrandBrigade,
                    Name = 'PirateBrigade',
                    Dist = 150,
                    Offset = CFrame.new(0, -30, -10),
                },
                {
                    Flag = _G.PGB,
                    Check = CheckPirateGrandBrigade,
                    Name = 'PirateGrandBrigade',
                    Dist = 150,
                    Offset = CFrame.new(0, -50, -50),
                },
            }

            for _, boat in ipairs(boatConfigs)do
                if boat.Flag and boat.Check() then
                    for _, e in pairs(workspace.Enemies:GetChildren())do
                        if e.Name == boat.Name and e:FindFirstChild('VehicleSeat') and e.Health.Value > 0 then
                            repeat
                                task.wait()
                                task.spawn(function()
                                    _tp(e.Engine.CFrame * boat.Offset)
                                end)

                                if plr:DistanceFromCharacter(e.Engine.CFrame.Position) <= boat.Dist then
                                    MousePos = e.Engine.Position

                                    if CheckF() then
                                        ExecuteSkills('Blox Fruit')
                                    else
                                        ExecuteSkills('Melee')
                                        ExecuteSkills('Sword')
                                        ExecuteSkills('Blox Fruit')
                                        ExecuteSkills('Gun')
                                    end
                                end
                            until not boat.Flag or not e:FindFirstChild('VehicleSeat') or e.Health.Value <= 0
                        end
                    end
                end
            end
        end)
    end
end)

if game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
    Event:Section('Frozen Dimension')
    Event:Button({
        Title = 'Buy Spy',
        Desc = 'Buy an spy to find the Leviathan sword.',
        Callback = function()
            replicated.Remotes.CommF_:InvokeServer('InfoLeviathan', '2')
        end,
    })
    Event:Toggle({
        Title = 'Teleport Frozen Dimension',
        Desc = 'Teleport to the frozen dimension and activate the Leviathan portal.',
        Value = GetSetting('FrozenTP_Save', false),
        Callback = function(I)
            _G.FrozenTP = I
            _G.SaveData.FrozenTP_Save = I
            SaveSettings()
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.FrozenTP then
                pcall(function()
                    if workspace.Map:FindFirstChild('LeviathanGate') then
                        _tp(workspace.Map.LeviathanGate.CFrame)
                        replicated.Remotes.CommF_:InvokeServer('OpenLeviathanGate')
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Attack Leviathan',
        Desc = 'Auto attack leviathan',
        Value = false,
        Callback = function(I)
            _G.Leviathan1 = I
        end,
    })
    Event:Section('Kitsune Island / Event')
    Event:Toggle({
        Title = 'Auto Find Kitsune Island',
        Desc = 'Auto sail and find Kitsune Island.',
        Value = GetSetting('FindKitsune_Save', false),
        Callback = function(I)
            _G.AutofindKitIs = I
            _G.SaveData.FindKitsune_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait() do
            if _G.AutofindKitIs then
                pcall(function()
                    if not workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island', true) then
                        local I = CheckBoat()

                        if not I then
                            local I = CFrame.new(-16927.451, 9.086, 433.864)

                            TeleportToTarget(I)

                            if (I.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                replicated.Remotes.CommF_:InvokeServer('BuyBoat', _G.SelectedBoat)
                            end
                        else
                            if plr.Character.Humanoid.Sit == false then
                                local e = I.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

                                _tp(e)
                            else
                                local I = CFrame.new(-1E7, 31, 37016.25)

                                repeat
                                    wait()

                                    if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                        _tp(CFrame.new(-1E7, 150, 37016.25))
                                    else
                                        _tp(CFrame.new(-1E7, 31, 37016.25))
                                    end
                                until not _G.AutofindKitIs or (I.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') or plr.Character.Humanoid.Sit == false

                                plr.Character.Humanoid.Sit = false
                            end
                        end
                    else
                        _tp((workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island')).CFrame * CFrame.new(0, 500, 0))
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Teleport to Shrine Actived',
        Desc = 'Teleport to the activated temple.',
        Value = false,
        Callback = function(I)
            _G.tweenShrine = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.tweenShrine then
                pcall(function()
                    local I = workspace.Map:FindFirstChild('KitsuneIsland') or game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island')
                    local e = I:FindFirstChild('ShrineActive')

                    if e then
                        for e, K in next, e:GetDescendants()do
                            if K:IsA('BasePart') and K.Name:find('NeonShrinePart') then
                                (replicated.Modules.Net:FindFirstChild('RE/TouchKitsuneStatue')):FireServer()

                                repeat
                                    wait()
                                    _tp(K.CFrame * CFrame.new(0, 2, 0))
                                until _G.tweenShrine == false or not I
                            end
                        end
                    else
                        _tp((workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island')).CFrame * CFrame.new(0, 500, 0))
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Collect Azure Ember',
        Desc = 'Start to collect Azure Ember',
        Value = GetSetting('CollectAzureEmber_Save', false),
        Callback = function(I)
            _G.Collect_Ember = I
            _G.SaveData.CollectAzureEmber_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.Collect_Ember then
                pcall(function()
                    if workspace:WaitForChild('AttachedAzureEmber') or workspace:WaitForChild('EmberTemplate') then
                        notween(((workspace:WaitForChild('EmberTemplate')):FindFirstChild('Part')).CFrame)
                    else
                        _tp((workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island')).CFrame * CFrame.new(0, 500, 0))
                        replicated.Modules.Net['RF/KitsuneStatuePray']:InvokeServer()
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Trade Azure Ember',
        Desc = 'Exchange Azure Ember',
        Value = GetSetting('TradeAzureEmber_Save', false),
        Callback = function(I)
            _G.Trade_Ember = I
            _G.SaveData.TradeAzureEmber_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.Trade_Ember then
                pcall(function()
                    if workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island', true) then
                        (replicated.Modules.Net:FindFirstChild('RF/KitsuneStatuePray')):InvokeServer()
                    end
                end)
            end
        end
    end)
    Event:Button({
        Title = 'Trade Items Azure',
        Desc = '',
        Callback = function()
            (replicated.Modules.Net:FindFirstChild('RF/KitsuneStatuePray')):InvokeServer()
        end,
    })
    Event:Button({
        Title = 'Talk with kitsune statue',
        Desc = '',
        Callback = function()
            (replicated.Modules.Net:FindFirstChild('RE/TouchKitsuneStatue')):FireServer()
        end,
    })
    Event:Section('Mystic Island / Full Moon')
    Event:Toggle({
        Title = 'Auto Find Mirage Island',
        Desc = 'Auto sail and find mirage island',
        Value = GetSetting('FindMirage_Save', false),
        Callback = function(I)
            _G.FindMirage = I
            _G.SaveData.FindMirage_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait() do
            if _G.FindMirage then
                pcall(function()
                    if not workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island', true) then
                        local I = CheckBoat()

                        if not I then
                            local I = CFrame.new(-16927.451, 9.086, 433.864)

                            TeleportToTarget(I)

                            if (I.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                replicated.Remotes.CommF_:InvokeServer('BuyBoat', _G.SelectedBoat)
                            end
                        else
                            if plr.Character.Humanoid.Sit == false then
                                local e = I.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

                                _tp(e)
                            else
                                repeat
                                    wait()

                                    local I = CFrame.new(-1E7, 31, 37016.25)

                                    if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                        _tp(CFrame.new(-1E7, 150, 37016.25))
                                    else
                                        _tp(CFrame.new(-1E7, 31, 37016.25))
                                    end
                                until not _G.FindMirage or (I.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') or plr.Character.Humanoid.Sit == false

                                plr.Character.Humanoid.Sit = false
                            end
                        end
                    else
                        _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 300, 0))
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Tween To Highest Point',
        Desc = 'Auto tween to top',
        Value = GetSetting('HighestMirage_Save', false),
        Callback = function(I)
            _G.HighestMirage = I
            _G.SaveData.HighestMirage_Save = I

            SaveSettings()
        end,
    })
    task.spawn(function()
        while task.wait(1) do
            if _G.HighestMirage then
                pcall(function()
                    if workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island', true) then
                        if _tp then
                            _tp(workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0))
                        end
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Collect Gear',
        Desc = 'Collect the Blue Gear on Mirage Island.',
        Value = GetSetting('AutoCollectGear_Save', false),
        Callback = function(I)
            _G.TPGEAR = I
            _G.SaveData.AutoCollectGear_Save = I

            SaveSettings()
        end,
    })
    task.spawn(function()
        while task.wait(0.1) do
            if _G.TPGEAR then
                pcall(function()
                    local mystic = workspace.Map:FindFirstChild('MysticIsland')

                    if mystic then
                        for _, e in pairs(mystic:GetChildren())do
                            if e.Name == 'Part' and e:IsA('MeshPart') then
                                if _tp then
                                    _tp(e.CFrame)
                                end
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - e.Position).Magnitude < 20 then
                                    fireproximityprompt(e:FindFirstChildOfClass('ProximityPrompt'), 30)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Change Transparency can see',
        Desc = 'Make the Mirage obstacles transparent.',
        Value = GetSetting('MirageTransparency_Save', false),
        Callback = function(I)
            _G.can = I
            _G.SaveData.MirageTransparency_Save = I

            SaveSettings()

            if not I then
                pcall(function()
                    local mystic = workspace.Map:FindFirstChild('MysticIsland')

                    if mystic then
                        for _, e in pairs(mystic:GetChildren())do
                            if e:IsA('BasePart') then
                                e.Transparency = 0
                            end
                        end
                    end
                end)
            end
        end,
    })
    task.spawn(function()
        while task.wait(1) do
            if _G.can then
                pcall(function()
                    local mystic = workspace.Map:FindFirstChild('MysticIsland')

                    if mystic then
                        for _, e in pairs(mystic:GetChildren())do
                            if e.Name == 'Part' then
                                if e:IsA('MeshPart') then
                                    e.Transparency = 0
                                else
                                    e.Transparency = 1
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Tween Advanced Fruit Dealer',
        Desc = 'TP to the advanced fruit seller on Mirage.',
        Value = GetSetting('AutoTweenAdvancedDealer_Save', false),
        Callback = function(I)
            _G.Addealer = I
            _G.SaveData.AutoTweenAdvancedDealer_Save = I

            SaveSettings()
        end,
    })
    task.spawn(function()
        while task.wait(1) do
            if _G.Addealer then
                pcall(function()
                    local npcs = game:GetService('ReplicatedStorage'):FindFirstChild('NPCs')

                    if npcs then
                        for _, e in pairs(npcs:GetChildren())do
                            if e.Name == 'Advanced Fruit Dealer' and e:FindFirstChild('HumanoidRootPart') then
                                if _tp then
                                    _tp(e.HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Collect Mirage Chest',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.FarmChestM = I
        end,
    })
    spawn(function()
        while wait(0.2) do
            if _G.FarmChestM then
                pcall(function()
                    if workspace.Map.MysticIsland.Chests:FindFirstChild('DiamondChest') or workspace.Map.MysticIsland.Chests:FindFirstChild('FragChest') then
                        local I = game:GetService('CollectionService')
                        local e = game:GetService('Players')
                        local K = e.LocalPlayer
                        local n = K.Character or K.CharacterAdded:Wait()

                        if not n then
                            return
                        end

                        local d = (n:GetPivot()).Position
                        local z = I:GetTagged('_ChestTagged')
                        local H, F = math.huge, nil

                        for I = 1, #z, 1 do
                            local e = z[I]
                            local K = ((e:GetPivot()).Position - d).Magnitude

                            if not SelectedIsland or e:IsDescendantOf(SelectedIsland) then
                                if not e:GetAttribute('IsDisabled') and K < H then
                                    H = K
                                    F = e
                                end
                            end
                        end

                        if F then
                            _tp(F:GetPivot())
                        end
                    end
                end)
            end
        end
    end)
    Event:Section('Volcanic Magnet')
    Event:Toggle({
        Title = 'Auto Craft Volcanic Magnet',
        Desc = 'Enable auto farming of materials and craft a Volcanic Magnet. Stop once you have 1 Volcanic Magnet',
        Value = false,
        Callback = function(I)
            _G.CraftVM = I
        end,
    })
    Event:Button({
        Title = 'Craft Volcanic Magnet',
        Desc = '',
        Callback = function()
            replicated.Remotes.CommF_:FireServer('Notify', '<Color=Yellow>Crafted <Volcanic Magnet><Color=/>')
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.CraftVM then
                    if GetM('Volcanic Magnet') < 1 then
                        if GetM('Scrap Metal') >= 10 and GetM('Blaze Ember') >= 15 then
                            replicated.Remotes.CommF_:FireServer('Notify', '<Color=Yellow>Crafted <Volcanic Magnet><Color=/>')
                        elseif GetM('Scrap Metal') < 10 then
                            local I = GetConnectionEnemies('Forest Pirate')

                            if I then
                                repeat
                                    wait()
                                    G.Kill(I, _G.CraftVM)
                                until not _G.CraftVM or not I.Parent or I.Humanoid.Health <= 0 or GetM('Scrap Metal') >= 10
                            else
                                _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        elseif GetM('Blaze Ember') < 15 then
                            local startTime = tick()

                            repeat
                                replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625))
                                wait(0.1)
                            until (tick() - startTime) >= 1 or not _G.CraftVM
                            repeat
                                wait()

                                _G.FarmBlazeEM = true
                            until not _G.CraftVM or GetM('Blaze Ember') >= 15

                            _G.FarmBlazeEM = false
                        end
                    end
                end
            end)
        end
    end)
    Event:Section('Prehistoric Island')
    Event:Toggle({
        Title = 'Auto Find Prehistoric Island',
        Desc = 'Auto sail and find prehistroic',
        Value = GetSetting('PrehistoricFinder_Save', false),
        Callback = function(I)
            _G.Prehis_Find = I
            _G.SaveData.PrehistoricFinder_Save = I

            SaveSettings()
        end,
    })
    task.spawn(function()
        while task.wait() do
            if _G.Prehis_Find then
                pcall(function()
                    if not workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island', true) then
                        local I = CheckBoat()

                        if I and I:FindFirstChild('VehicleSeat') and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
                            local dist = (plr.Character.HumanoidRootPart.Position - I.VehicleSeat.Position).Magnitude

                            if dist > 2500 then
                                I = nil
                            end
                        end
                        if not I then
                            local DealerPos = CFrame.new(-16927.451, 9.086, 433.864)

                            TeleportToTarget(DealerPos)

                            if (DealerPos.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                replicated.Remotes.CommF_:InvokeServer('BuyBoat', _G.SelectedBoat)
                            end
                        else
                            if plr.Character.Humanoid.Sit == false then
                                local seatCF = I.VehicleSeat.CFrame * CFrame.new(0, 1, 0)

                                _tp(seatCF)
                            else
                                local TargetPos = CFrame.new(-1E7, 31, 37016.25)

                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-1E7, 150, 37016.25))
                                else
                                    _tp(TargetPos)
                                end
                                if workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') or not _G.Prehis_Find then
                                    plr.Character.Humanoid.Sit = false
                                end
                            end
                        end
                    else
                        local Island = workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island')

                        if (Island.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                            _tp(Island.CFrame)
                        end
                        if workspace.Map:FindFirstChild('PrehistoricIsland', true) or workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island', true) then
                            local promptPart = workspace.Map.PrehistoricIsland.Core:FindFirstChild('ActivationPrompt')

                            if promptPart and promptPart:FindFirstChild('ProximityPrompt') then
                                if plr:DistanceFromCharacter(promptPart.Position) <= 150 then
                                    fireproximityprompt(promptPart.ProximityPrompt, math.huge)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
                                    task.wait(1.5)
                                    game:GetService('VirtualInputManager'):SendKeyEvent(false, 'E', false, game)
                                end

                                _tp(promptPart.CFrame)
                            end
                        end
                    end
                end)
            end
        end
    end)
    Event:Toggle({
        Title = 'Auto Event Prehistoric Island',
        Desc = '',
        Value = GetSetting('AutoEventPrehistoric_Save', false),
        Callback = function(I)
            _G.PrehistoricEvent = I
            _G.Prehis_Skills = I
            _G.SaveData.AutoEventPrehistoric_Save = I

            SaveSettings()

            if I then
                local RunService = game:GetService('RunService')

                task.spawn(function()
                    while _G.Prehis_Skills do
                        local char = game.Players.LocalPlayer.Character

                        if char then
                            for _, v in pairs(char:GetChildren())do
                                if v:IsA('BasePart') and v.CanCollide then
                                    v.CanCollide = false
                                end
                            end
                        end

                        RunService.Stepped:Wait()
                    end
                end)
            end
        end,
    })
    spawn(function()
        while task.wait(1.5) do
            if _G.Prehis_Skills then
                pcall(function()
                    local MapIsland = game.Workspace.Map:FindFirstChild('PrehistoricIsland')

                    if MapIsland then
                        local core = MapIsland:FindFirstChild('Core')

                        if core and core:FindFirstChild('InteriorLava') then
                            core.InteriorLava:Destroy()
                        end

                        for _, obj in pairs(MapIsland:GetDescendants())do
                            if (obj:IsA('Part') or obj:IsA('MeshPart')) then
                                if obj.Name == 'Lava' or obj.Name == 'LavaPart' or obj.Name:lower():find('magma') then
                                    obj:Destroy()
                                end
                            end
                            if obj.Name == 'TouchInterest' and obj.Parent then
                                if not obj.Parent.Name:find('TrialTeleport') then
                                    obj.Parent:Destroy()
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
            if _G.Prehis_Skills then
                pcall(function()
                    local plr = game.Players.LocalPlayer

                    if workspace.Enemies:FindFirstChild('Lava Golem') then
                        local enemy = nil

                        pcall(function()
                            if GetConnectionEnemies then
                                enemy = GetConnectionEnemies('Lava Golem')
                            else
                                enemy = workspace.Enemies['Lava Golem']
                            end
                        end)

                        if enemy and enemy:FindFirstChild('Humanoid') and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()

                                if enemy:FindFirstChild('HumanoidRootPart') and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
                                    _tp(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))

                                    plr.Character.HumanoidRootPart.Velocity = Vector3.zero
                                end
                                if G and G.Kill then
                                    G.Kill(enemy, _G.Prehis_Skills)
                                end
                            until not _G.Prehis_Skills or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end

                    local core = game.Workspace.Map:FindFirstChild('PrehistoricIsland') and game.Workspace.Map.PrehistoricIsland:FindFirstChild('Core')

                    if core and core:FindFirstChild('VolcanoRocks') then
                        for _, rock in pairs(core.VolcanoRocks:GetChildren())do
                            if rock:FindFirstChild('VFXLayer') then
                                local layer = rock.VFXLayer

                                if layer:FindFirstChild('At0') and layer.At0:FindFirstChild('Glow') and layer.At0.Glow.Enabled == true then
                                    repeat
                                        task.wait()

                                        if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
                                            local safePosition = layer.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(math.rad(-90), 0, 0)

                                            _tp(safePosition)

                                            plr.Character.HumanoidRootPart.Velocity = Vector3.zero
                                        end
                                        if plr:DistanceFromCharacter(layer.CFrame.Position) <= 200 then
                                            MousePos = layer.CFrame.Position

                                            local VIM = game:GetService('VirtualInputManager')

                                            VIM:SendKeyEvent(true, 'Z', false, game)
                                            VIM:SendKeyEvent(true, 'X', false, game)
                                            VIM:SendKeyEvent(true, 'C', false, game)

                                            if Useskills then
                                                Useskills('Melee', 'Z')
                                                Useskills('Melee', 'X')
                                                Useskills('Melee', 'C')
                                                Useskills('Blox Fruit', 'Z')
                                                Useskills('Blox Fruit', 'X')
                                                Useskills('Blox Fruit', 'C')
                                            end
                                        end
                                    until not _G.Prehis_Skills or layer.At0.Glow.Enabled == false or not rock.Parent
                                end
                            end
                        end
                    end
                end)
            else
                task.wait(1)
            end
        end
    end)
    Event:Button({
        Title = 'Remove Lava',
        Desc = '',
        Callback = function()
            for _, v in pairs(game.Workspace:GetDescendants())do
                if v.Name == 'Lava' then
                    v:Destroy()
                end
            end
            for _, v in pairs(game.ReplicatedStorage:GetDescendants())do
                if v.Name == 'Lava' then
                    v:Destroy()
                end
            end
        end,
    })
    Event:Toggle({
        Title = 'Auto Collect Dino Bones',
        Desc = '',
        Value = GetSetting('DinoBones_Save', false),
        Callback = function(I)
            _G.Prehis_DB = I
            _G.SaveData.DinoBones_Save = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Auto Collect Dragon Eggs',
        Desc = '',
        Value = GetSetting('DragonEggs_Save', false),
        Callback = function(I)
            _G.Prehis_DE = I
            _G.SaveData.DragonEggs_Save = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Auto Reset When Complete Volcano',
        Desc = '',
        Value = GetSetting('ResetVolcano_Save', false),
        Callback = function(I)
            _G.ResetPH = I
            _G.SaveData.ResetVolcano_Save = I

            SaveSettings()
        end,
    })
    task.spawn(function()
        while task.wait() do
            pcall(function()
                local FoundTarget = false

                if _G.Prehis_DE then
                    local MapIsland = workspace.Map:FindFirstChild('PrehistoricIsland')

                    if MapIsland and MapIsland.Core:FindFirstChild('SpawnedDragonEggs') then
                        local Egg = MapIsland.Core.SpawnedDragonEggs:FindFirstChild('DragonEgg')

                        if Egg and Egg:FindFirstChild('Molten') then
                            FoundTarget = true
                            _G.Collecting = true

                            _tp(Egg.Molten.CFrame)

                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Egg.Molten.Position).Magnitude <= 15 then
                                fireproximityprompt(Egg.Molten.ProximityPrompt, 30)
                            end
                        end
                    end
                end
                if _G.Prehis_DB and not FoundTarget then
                    local Bone = workspace:FindFirstChild('DinoBone')

                    if Bone then
                        FoundTarget = true
                        _G.Collecting = true

                        _tp(Bone.CFrame)
                    end
                end
                if not FoundTarget then
                    _G.Collecting = false
                end
            end)
        end
    end)
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                if _G.ResetPH then
                    local MapIsland = workspace.Map:FindFirstChild('PrehistoricIsland')
                    local EventEnded = MapIsland and MapIsland:FindFirstChild('TrialTeleport') and MapIsland.TrialTeleport:FindFirstChild('TouchInterest')

                    if EventEnded then
                        task.wait(4.5)

                        while true do
                            local ShouldWait = false

                            if _G.Prehis_DE and MapIsland.Core.SpawnedDragonEggs:FindFirstChild('DragonEgg') then
                                ShouldWait = true
                            end
                            if _G.Prehis_DB and workspace:FindFirstChild('DinoBone') then
                                ShouldWait = true
                            end
                            if _G.Collecting then
                                ShouldWait = true
                            end
                            if ShouldWait then
                                task.wait(0.5)
                            else
                                break
                            end
                        end

                        game.Players.LocalPlayer.Character.Humanoid.Health = 0

                        task.wait(8)
                    end
                end
            end)
        end
    end)
end
if World2 or World3 then
    Event:Section('Melee setup for sea events')
    Event:Toggle({
        Title = 'Skill Z',
        Value = GetSetting('Skill_Melee_Z', true),
        Callback = function(I)
            _G.SelectedSkills.Melee.Z = I
            _G.SaveData.Skill_Melee_Z = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill X',
        Value = GetSetting('Skill_Melee_X', true),
        Callback = function(I)
            _G.SelectedSkills.Melee.X = I
            _G.SaveData.Skill_Melee_X = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill C',
        Value = GetSetting('Skill_Melee_C', true),
        Callback = function(I)
            _G.SelectedSkills.Melee.C = I
            _G.SaveData.Skill_Melee_C = I

            SaveSettings()
        end,
    })
    Event:Section('Sword')
    Event:Toggle({
        Title = 'Skill Z',
        Value = GetSetting('Skill_Sword_Z', true),
        Callback = function(I)
            _G.SelectedSkills.Sword.Z = I
            _G.SaveData.Skill_Sword_Z = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill X',
        Value = GetSetting('Skill_Sword_X', true),
        Callback = function(I)
            _G.SelectedSkills.Sword.X = I
            _G.SaveData.Skill_Sword_X = I

            SaveSettings()
        end,
    })
    Event:Section('Gun')
    Event:Toggle({
        Title = 'Skill Z',
        Value = GetSetting('Skill_Gun_Z', true),
        Callback = function(I)
            _G.SelectedSkills.Gun.Z = I
            _G.SaveData.Skill_Gun_Z = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill X',
        Value = GetSetting('Skill_Gun_X', true),
        Callback = function(I)
            _G.SelectedSkills.Gun.X = I
            _G.SaveData.Skill_Gun_X = I

            SaveSettings()
        end,
    })
    Event:Section('Blox Fruit')
    Event:Toggle({
        Title = 'Skill Z',
        Value = GetSetting('Skill_Fruit_Z', true),
        Callback = function(I)
            _G.SelectedSkills['Blox Fruit'].Z = I
            _G.SaveData.Skill_Fruit_Z = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill X',
        Value = GetSetting('Skill_Fruit_X', true),
        Callback = function(I)
            _G.SelectedSkills['Blox Fruit'].X = I
            _G.SaveData.Skill_Fruit_X = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill C',
        Value = GetSetting('Skill_Fruit_C', true),
        Callback = function(I)
            _G.SelectedSkills['Blox Fruit'].C = I
            _G.SaveData.Skill_Fruit_C = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill V',
        Value = GetSetting('Skill_Fruit_V', true),
        Callback = function(I)
            _G.SelectedSkills['Blox Fruit'].V = I
            _G.SaveData.Skill_Fruit_V = I

            SaveSettings()
        end,
    })
    Event:Toggle({
        Title = 'Skill F',
        Value = GetSetting('Skill_Fruit_F', true),
        Callback = function(I)
            _G.SelectedSkills['Blox Fruit'].F = I
            _G.SaveData.Skill_Fruit_F = I

            SaveSettings()
        end,
    })
end
