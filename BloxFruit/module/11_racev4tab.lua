if World2 then
    Race:Section('Upgrade Races')
    Race:Toggle({
        Title = 'Auto Mink V2/V3',
        Desc = '',
        Value = false,
        Callback = function(I)
            G.Auto_Mink = I
        end,
    })
local lastMsg_Mink = ""

spawn(function()
    while wait(Sec) do
        pcall(function()
            if G.Auto_Mink then
                function Notify(msg)
                    if msg ~= lastMsg_Mink then
                        lastMsg_Mink = msg
                        Library:Notify({ Title    = "Auto Mink (APPLE HUB)", Message  = msg, Duration = 6 })
                    end
                end

                local status = replicated.Remotes.CommF_:InvokeServer('Alchemist', '1')

                if status ~= 2 then
                    if status == 0 then
                        Notify("Starting Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '2')

                    elseif status == 1 then
                        if not plr.Backpack:FindFirstChild('Flower 1') and not plr.Character:FindFirstChild('Flower 1') then
                            Notify("Missing Flower 1")
                            tp(workspace.Flower1.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 2') and not plr.Character:FindFirstChild('Flower 2') then
                            Notify("Missing Flower 2")
                            tp(workspace.Flower2.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 3') and not plr.Character:FindFirstChild('Flower 3') then
                            Notify("Missing Flower 3")
                            local I = GetConnectionEnemies('Swan Pirate')

                            if I then
                                repeat
                                    wait()
                                    G.Kill(I, G.Auto_Mink)
                                until GetBP('Flower 3') 
                                    or not I.Parent 
                                    or I.Humanoid.Health <= 0 
                                    or G.Auto_Mink == false
                            else
                                Notify("No Swan Pirates")
                                tp(CFrame.new(980, 121, 1287))
                            end
                        else
                            Notify("All Flowers Collected")
                        end

                    elseif status == 2 then
                        Notify("Finishing Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '3')
                    end

                else
                    local raceStatus = replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '1')

                    if raceStatus == 0 then
                        Notify("Starting Trial")
                        replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '2')

                    elseif raceStatus == 1 then
                        Notify("Auto Farming Chests")
                        G.AutoFarmChest = true
                    else
                        Notify("Stopping Chest Farm")
                        G.AutoFarmChest = false
                    end
                end
            end
        end)
    end
end)
    Race:Toggle({
        Title = 'Auto Human V2/V3',
        Desc = '',
        Value = false,
        Callback = function(I)
            G.Auto_Human = I
        end,
    })
local lastMsg_Human = ""

spawn(function()
    while wait(Sec) do
        pcall(function()
            if G.Auto_Human then
                function Notify(msg)
                    if msg ~= lastMsg_Human then
                        lastMsg_Human = msg
                        Library:Notify({ Title    = "Auto Human (APPLE HUB)", Message  = msg, Duration = 6 })
                    end
                end

                local status = replicated.Remotes.CommF_:InvokeServer('Alchemist', '1')

                if status ~= -2 then
                    if status == 0 then
                        Notify("Starting Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '2')

                    elseif status == 1 then
                        if not plr.Backpack:FindFirstChild('Flower 1') and not plr.Character:FindFirstChild('Flower 1') then
                            Notify("Missing Flower 1")
                            tp(workspace.Flower1.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 2') and not plr.Character:FindFirstChild('Flower 2') then
                            Notify("Missing Flower 2")
                            tp(workspace.Flower2.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 3') and not plr.Character:FindFirstChild('Flower 3') then
                            Notify("Missing Flower 3")
                            local I = GetConnectionEnemies('Swan Pirate')

                            if I then
                                repeat
                                    wait()
                                    G.Kill(I, G.Auto_Human)
                                until plr.Backpack:FindFirstChild('Flower 3') 
                                    or not I.Parent 
                                    or I.Humanoid.Health <= 0 
                                    or G.Auto_Human == false
                            else
                                Notify("No Swan Pirates")
                                tp(CFrame.new(980, 121, 1287))
                            end
                        else
                            Notify("All Flowers Collected")
                        end

                    elseif status == 2 then
                        Notify("Finishing Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '3')
                    end

                else
                    local raceStatus = replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '1')

                    if raceStatus == 0 then
                        Notify("Starting Trial")
                        replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '2')

                    elseif raceStatus == 1 then
                        Notify("Killing Trial Enemies")

                        local I = GetConnectionEnemies(F[1])
                        if I then
                            repeat
                                wait()
                                G.Kill(I, G.Auto_Human)
                            until I.Humanoid.Health <= 0 or not I.Parent or not G.Auto_Human
                        else
                            Notify("Enemy 1 Not Found")
                            _tp(CFrame.new(-2172, 103, -4015))
                        end

                        local e = GetConnectionEnemies(F[2])
                        if e then
                            repeat
                                wait()
                                G.Kill(e, G.Auto_Human)
                            until e.Humanoid.Health <= 0 or not e.Parent or not G.Auto_Human
                        else
                            Notify("Enemy 2 Not Found")
                            _tp(CFrame.new(2006, 448, 853))
                        end

                        local K = GetConnectionEnemies(F[3])
                        if K then
                            repeat
                                wait()
                                G.Kill(K, G.Auto_Human)
                            until K.Humanoid.Health <= 0 or not K.Parent or not G.Auto_Human
                        else
                            Notify("Enemy 3 Not Found")
                            tp(CFrame.new(-1576, 198, 13))
                        end
                    end
                end
            end
        end)
    end
end)
    Race:Toggle({
        Title = 'Auto Angel V2/V3',
        Desc = '',
        Value = false,
        Callback = function(I)
            G.Auto_Skypiea = I
        end,
    })
local lastMsg = ""

spawn(function()
    while wait(Sec) do
        pcall(function()
            if G.Auto_Skypiea then
                function Notify(msg)
                    if msg ~= lastMsg then
                        lastMsg = msg
                        Library:Notify({ Title    = "Auto Skypiea (APPLE HUB)", Message  = msg, Duration = 6 })
                    end
                end

                local status = replicated.Remotes.CommF_:InvokeServer('Alchemist', '1')

                if status ~= -2 then
                    if status == 0 then
                        Notify("Starting Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '2')

                    elseif status == 1 then
                        if not plr.Backpack:FindFirstChild('Flower 1') and not plr.Character:FindFirstChild('Flower 1') then
                            Notify("Missing Flower 1")
                            tp(workspace.Flower1.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 2') and not plr.Character:FindFirstChild('Flower 2') then
                            Notify("Missing Flower 2")
                            tp(workspace.Flower2.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 3') and not plr.Character:FindFirstChild('Flower 3') then
                            Notify("Missing Flower 3")
                            local I = GetConnectionEnemies('Swan Pirate')

                            if I then
                                repeat
                                    task.wait()
                                    G.Kill(I, G.Auto_Skypiea)
                                until plr.Backpack:FindFirstChild('Flower 3') 
                                    or not I.Parent 
                                    or I.Humanoid.Health <= 0 
                                    or G.Auto_Skypiea == false
                            else
                                Notify("No Swan Pirates")
                                tp(CFrame.new(980, 121, 1287))
                            end
                        else
                            Notify("All Flowers Collected")
                        end

                    elseif status == 2 then
                        Notify("Finishing Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '3')
                    end

                else
                    local raceStatus = replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '1')

                    if raceStatus == 0 then
                        Notify("Starting Trial")
                        replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '2')

                    elseif raceStatus == 1 then
                        Notify("Finding Skypiea Player")
                        for _, e in pairs(game.Players:GetChildren()) do
                            if e.Name ~= plr.Name and tostring(e.Data.Race.Value) == 'Skypiea' then
                                repeat
                                    task.wait()
                                    tp((e.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0)) * CFrame.Angles(math.rad(-45), 0, 0))
                                until e.Humanoid.Health <= 0 or G.Auto_Skypiea == false
                            end
                        end
                    end
                end
            end
        end)
    end
end)
    Race:Toggle({
        Title = 'Auto Shark V2/V3',
        Desc = '',
        Value = false,
        Callback = function(I)
            G.Auto_Fish = I
        end,
    })
   local lastMsg_Fish = ""

spawn(function()
    while wait(Sec) do
        pcall(function()
            if G.Auto_Fish then
                function Notify(msg)
                    if msg ~= lastMsg_Fish then
                        lastMsg_Fish = msg
                        Library:Notify({ Title    = "Auto Fisch (APPLE HUB)", Message  = msg, Duration = 6 })
                    end
                end

                local status = replicated.Remotes.CommF_:InvokeServer('Alchemist', '1')

                if status ~= -2 then
                    if status == 0 then
                        Notify("Starting Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '2')

                    elseif status == 1 then
                        if not plr.Backpack:FindFirstChild('Flower 1') and not plr.Character:FindFirstChild('Flower 1') then
                            Notify("Missing Flower 1")
                            tp(workspace.Flower1.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 2') and not plr.Character:FindFirstChild('Flower 2') then
                            Notify("Missing Flower 2")
                            tp(workspace.Flower2.CFrame)

                        elseif not plr.Backpack:FindFirstChild('Flower 3') and not plr.Character:FindFirstChild('Flower 3') then
                            Notify("Missing Flower 3")
                            local I = GetConnectionEnemies('Swan Pirate')

                            if I then
                                repeat
                                    wait()
                                    G.Kill(I, G.Auto_Fish)
                                until plr.Backpack:FindFirstChild('Flower 3') 
                                    or not I.Parent 
                                    or I.Humanoid.Health <= 0 
                                    or G.Auto_Fish == false
                            else
                                Notify("No Swan Pirates")
                                tp(CFrame.new(980, 121, 1287))
                            end
                        else
                            Notify("All Flowers Collected")
                        end

                    elseif status == 2 then
                        Notify("Finishing Quest")
                        replicated.Remotes.CommF_:InvokeServer('Alchemist', '3')
                    end

                else
                    local raceStatus = replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '1')

                    if raceStatus == 0 then
                        Notify("Starting Trial")
                        replicated.Remotes.CommF_:InvokeServer('Wenlocktoad', '2')

                    elseif raceStatus == 1 then
                        Notify("Sea Beast Soon")
                    end
                end
            end
        end)
    end
end)
    Race:Section('Race upgrade v4 only in Sea 3')
end
if World1 then
    Race:Section('Only in Sea 2 or 3 to upgrade to Race')
end
if World3 then
    Race:Section('Trials Quests / Misc V4')

    local K5 = Race:Paragraph({
        Title = ' Tiers V4 Status ',
        Desc = '',
        Image = 0,
    })

    spawn(function()
        pcall(function()
            while wait(0.2) do
                K5.Desc = ' Tiers - V4:' .. (' ' .. plr.Data.Race.C.Value)
            end
        end)
    end)
    Race:Toggle({
        Title = 'Auto Look At Moon',
        Desc = '',
        Value = false,
        Callback = function(I)
            LookM = I
        end,
    })

    function MoveCamtoMoon()
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
    end

    task.spawn(function()
        while task.wait() do
            if LookM then
                MoveCamtoMoon()
                wait(0.1)
                replicated.Remotes.CommE:FireServer('ActivateAbility')
            end
        end
    end)
    Race:Toggle({
        Title = 'Auto Pull Lever',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Lver = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.Lver then
                pcall(function()
                    for I, e in pairs(workspace.Map['Temple of Time']:GetDescendants())do
                        if e.Name == 'ProximityPrompt' then
                            fireproximityprompt(e, math.huge)
                        end
                    end
                end)
            end
        end
    end)
    Race:Toggle({
        Title = 'Auto Train V4',
        Desc = 'Turn on for farm tier + auto upgrade your tier level',
        Value = false,
        Callback = function(I)
            _G.AcientOne = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.AcientOne then
                    local I = {
                        'Reborn Skeleton',
                        'Living Zombie',
                        'Demonic Soul',
                        'Posessed Mummy',
                    }

                    for e = 1, #I, 1 do
                        if (plr.Character:FindFirstChild('RaceEnergy')).Value == 1 then
                            vim1:SendKeyEvent(true, 'Y', false, game)
                            replicated.Remotes.CommF_:InvokeServer('UpgradeRace', 'Buy')
                            _tp(CFrame.new(-8987.041015625, 215.86206054688, 5886.7104492188))
                        elseif (plr.Character:FindFirstChild('RaceTransformed')).Value == false then
                            local e = GetConnectionEnemies(I)

                            if e then
                                repeat
                                    wait()
                                    G.Kill(e, _G.AcientOne)
                                until _G.AcientOne == false or e.Humanoid.Health <= 0 or not e.Parent
                            else
                                _tp(CFrame.new(-9495.6806640625, 453.58624267578, 5977.3486328125))
                            end
                        end
                    end
                end
            end)
        end
    end)
    Race:Button({
        Title = 'Teleport to Temple of Time',
        Desc = '',
        Callback = function()
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(28286.35546875, 14895.301757812, 102.62469482422))
        end,
    })
    Race:Button({
        Title = 'Teleport to Ancient One',
        Desc = '',
        Callback = function()
            notween(CFrame.new(28981.552734375, 14888.426757812, -120.24584960938))
        end,
    })
    Race:Button({
        Title = 'Teleport to Ancient Clock',
        Desc = '',
        Callback = function()
            notween(CFrame.new(29549, 15069, -88))
        end,
    })
    Race:Toggle({
        Title = 'Auto Teleport to Race Doors',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.TPDoor = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.TPDoor then
                    if tostring(plr.Data.Race.Value) == 'Mink' then
                        _tp(CFrame.new(29020.66015625, 14889.426757812, -379.2682800293))
                    elseif tostring(plr.Data.Race.Value) == 'Fishman' then
                        _tp(CFrame.new(28224.056640625, 14889.426757812, -210.58720397949))
                    elseif tostring(plr.Data.Race.Value) == 'Cyborg' then
                        _tp(CFrame.new(28492.4140625, 14894.426757812, -422.11001586914))
                    elseif tostring(plr.Data.Race.Value) == 'Skypiea' then
                        _tp(CFrame.new(28967.408203125, 14918.075195312, 234.31198120117))
                    elseif tostring(plr.Data.Race.Value) == 'Ghoul' then
                        _tp(CFrame.new(28672.720703125, 14889.127929688, 454.59616088867))
                    elseif tostring(plr.Data.Race.Value) == 'Human' then
                        _tp(CFrame.new(29237.294921875, 14889.426757812, -206.94955444336))
                    end
                end
            end)
        end
    end)
    Race:Toggle({
        Title = 'Auto Complete Trial Race',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Complete_Trials = I
        end,
    })

    GetSeaBeastTrial = function()
        if not workspace.Map:FindFirstChild('FishmanTrial') then
            return nil
        end
        if workspace._WorldOrigin.Locations:FindFirstChild('Trial of Water') then
            FishmanTrial = workspace._WorldOrigin.Locations:FindFirstChild('Trial of Water')
        end
        if FishmanTrial then
            for I, e in next, workspace.SeaBeasts:GetChildren()do
                if e:FindFirstChild('HumanoidRootPart') and (e.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
                    if e.Health.Value > 0 then
                        return e
                    end
                end
            end
        end
    end

    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Complete_Trials then
                    if tostring(plr.Data.Race.Value) == 'Mink' then
                        notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0))
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Complete_Trials then
                    if tostring(plr.Data.Race.Value) == 'Fishman' then
                        if GetSeaBeastTrial() then
                            repeat
                                task.wait()
                                spawn(function()
                                    _tp(CFrame.new((GetSeaBeastTrial()).HumanoidRootPart.Position.X, (game:GetService('Workspace')).Map['WaterBase-Plane'].Position.Y + 300, (GetSeaBeastTrial()).HumanoidRootPart.Position.Z))
                                end)

                                MousePos = (GetSeaBeastTrial()).HumanoidRootPart.Position

                                Useskills('Melee', 'Z')
                                Useskills('Melee', 'X')
                                Useskills('Melee', 'C')
                                wait(0.1)
                                Useskills('Sword', 'Z')
                                Useskills('Sword', 'X')
                                wait(0.1)
                                Useskills('Blox Fruit', 'Z')
                                Useskills('Blox Fruit', 'X')
                                Useskills('Blox Fruit', 'C')
                                wait(0.1)
                                Useskills('Gun', 'Z')
                                Useskills('Gun', 'X')
                            until _G.Complete_Trials == false or not GetSeaBeastTrial()
                        end
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Complete_Trials then
                    if tostring(plr.Data.Race.Value) == 'Cyborg' then
                        _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0))
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Complete_Trials then
                    if tostring(plr.Data.Race.Value) == 'Skypiea' then
                        notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.Complete_Trials then
                    if tostring(plr.Data.Race.Value) == 'Human' or tostring(plr.Data.Race.Value) == 'Ghoul' then
                        local I = {
                            'Ancient Vampire',
                            'Ancient Zombie',
                        }
                        local e = GetConnectionEnemies(I)

                        if e then
                            repeat
                                wait()
                                G.Kill(e, _G.Complete_Trials)
                            until _G.Complete_Trials == false or not e.Parent or e.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end)
    Race:Toggle({
        Title = 'Auto Kill Player After Trial',
        Desc = 'Turn on for kill player after the race trials',
        Value = false,
        Callback = function(I)
            _G.Defeating = I
        end,
    })
    spawn(function()
        while task.wait(Sec) do
            pcall(function()
                if _G.Defeating then
                    for I, e in pairs(workspace.Characters:GetChildren())do
                        if e.Name ~= plr.Name then
                            if e.Humanoid.Health > 0 and (e:FindFirstChild('HumanoidRootPart') and (e.Parent and (Root.Position - e.HumanoidRootPart.Position).Magnitude <= 250)) then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    _tp(e.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15))
                                    sethiddenproperty(plr, 'SimulationRadius', math.huge)
                                until _G.Defeating == false or e.Humanoid.Health <= 0 or not e.Parent or not e:FindFirstChild('HumanoidRootPart') or not e:FindFirstChild('Humanoid')
                            end
                        end
                    end
                end
            end)
        end
    end)
end
