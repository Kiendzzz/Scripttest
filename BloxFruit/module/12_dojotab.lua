if World3 then
    Dojo:Section('Dojo Quest & Drago Race')
    Dojo:Toggle({
        Title = 'Auto Dojo Trainer',
        Desc = 'Turn on for do dojo belt quest white to black',
        Value = false,
        Callback = function(I)
            _G.Dojoo = I
        end,
    })

    function printBeltName(I)
        if type(I) == 'table' and I.Quest.BeltName then
            return I.Quest.BeltName
        end
    end

    spawn(function()
        while wait(Sec) do
            if _G.Dojoo then
                pcall(function()
                    local I = {
                        [1] = {
                            NPC = 'Dojo Trainer',
                            Command = 'RequestQuest',
                        },
                    }
                    local e = (replicated.Modules.Net:FindFirstChild('RF/InteractDragonQuest')):InvokeServer(unpack(I))
                    local K = printBeltName(e)

                    if debug == false and (not e and not K) then
                        _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))

                        debug = true
                    elseif debug == true and ((CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                        if K == 'White' then
                            local I = GetConnectionEnemies('Skull Slayer')

                            if I then
                                repeat
                                    task.wait()
                                    G.Kill(I, _G.Dojoo)
                                until not e or not _G.Dojoo or not G.Alive(I)
                            else
                                _tp(CFrame.new(-16759.58984375, 71.283767700195, 1595.3399658203))
                            end
                        elseif K == 'Yellow' then
                            repeat
                                task.wait()

                                _G.SeaBeast1 = true
                                _G.TerrorShark = true
                                _G.Shark = true
                                _G.Piranha = true
                                _G.MobCrew = true
                                _G.FishBoat = true
                                _G.SailBoats = true
                            until not _G.Dojoo or not e

                            _G.SeaBeast1 = false
                            _G.TerrorShark = false
                            _G.Shark = false
                            _G.Piranha = false
                            _G.MobCrew = false
                            _G.FishBoat = false
                            _G.SailBoats = false
                        elseif K == 'Green' then
                            repeat
                                task.wait()

                                _G.SailBoats = true
                            until not _G.Dojoo or not e

                            _G.SailBoats = false
                        elseif K == 'Purple' then
                            repeat
                                task.wait()

                                _G.FarmEliteHunt = true
                            until not _G.Dojoo or not e

                            _G.FarmEliteHunt = false
                        elseif K == 'Red' then
                            repeat
                                task.wait()

                                _G.SailBoats = true
                                _G.FishBoat = true
                            until not _G.Dojoo or not e

                            _G.SailBoats = false
                            _G.FishBoat = false
                        elseif K == 'Black' then
                            repeat
                                task.wait()

                                if workspace.Map:FindFirstChild('PrehistoricIsland') or workspace._WorldOrigin.Locations:FindFirstChild('Prehistoric Island') then
                                    _G.Prehis_Find = true

                                    if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild('ProximityPrompt', true) then
                                        _G.Prehis_Skills = false
                                        _G.Prehis_Find = true
                                    else
                                        _G.Prehis_Skills = true
                                        _G.Prehis_Find = false
                                    end
                                else
                                    _G.Prehis_Find = true
                                    _G.Prehis_Skills = false
                                end
                            until not _G.Dojoo or not e

                            _G.Prehis_Find = false
                            _G.Prehis_Skills = false
                        elseif K == 'Orange' or K == 'Blue' then
                            return nil
                        end
                    end
                    if not e then
                        debug = false

                        local I = {
                            [1] = {
                                NPC = 'Dojo Trainer',
                                Command = 'ClaimQuest',
                            },
                        }

                        (replicated.Modules.Net:FindFirstChild('RF/InteractDragonQuest')):InvokeServer(unpack(I))
                    end
                end)
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Auto Dragon Hunter',
        Desc = 'Turn on for farm blaze ember + auto collect blaze ember',
        Value = false,
        Callback = function(I)
            _G.FarmBlazeEM = I
        end,
    })

    checkQuesta = function()
        local I = {
            [1] = {
                Context = 'Check',
            },
        }
        local e = nil

        pcall(function()
            local I = {
                [1] = {
                    Context = 'RequestQuest',
                },
            }

            ((((game:GetService('ReplicatedStorage')):WaitForChild('Modules')):WaitForChild('Net')):WaitForChild('RF/DragonHunter')):InvokeServer(unpack(I))
        end)

        local K, n = pcall(function()
            e = ((((game:GetService('ReplicatedStorage')):WaitForChild('Modules')):WaitForChild('Net')):WaitForChild('RF/DragonHunter')):InvokeServer(unpack(I))
        end)
        local d = false
        local z
        local H
        local F

        if e then
            if e.Text then
                d = true

                local I = e.Text

                if string.find(tostring(I), 'Defeat') then
                    F = 1
                    z = string.sub(tostring(I), 8, 9)
                    z = tonumber(z)

                    local e = {
                        'Hydra Enforcer',
                        'Venomous Assailant',
                    }

                    for e, K in pairs(e)do
                        if string.find(I, K) then
                            H = K

                            break
                        end
                    end
                elseif string.find(tostring(I), 'Destroy') then
                    z = 10
                    F = 2
                    H = nil
                end
            end
        end

        return d, H, z, F
    end
    BackTODoJo = function()
        for I, e in pairs((game:GetService('Players')).LocalPlayer.PlayerGui.Notifications:GetChildren())do
            if e.Name == 'NotificationTemplate' then
                if string.find(e.Text, 'Head back to the Dojo to complete more tasks') then
                    return true
                end
            end
        end

        return false
    end
    DragonMobClear = function(I, e, K)
        if workspace.Enemies:FindFirstChild(e) then
            for K, n in pairs(workspace.Enemies:GetChildren())do
                if n.Name == e and G.Alive(n) then
                    if I then
                        G.Kill(n, I)
                    end
                end
            end
        else
            _tp(K)
        end
    end

    spawn(function()
        while wait() do
            if _G.FarmBlazeEM then
                pcall(function()
                    local I, e, K, n = checkQuesta()

                    if I == true and not BackTODoJo() then
                        if n == 1 then
                            if e == 'Hydra Enforcer' or e == 'Venomous Assailant' then
                                repeat
                                    wait()
                                    DragonMobClear(true, e, CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492))
                                until not _G.FarmBlazeEM or not I or BackTODoJo()
                            end
                        elseif n == 2 then
                            if workspace.Map.Waterfall.IslandModel:FindFirstChild('Meshes/bambootree', true) then
                                repeat
                                    wait()
                                    spawn(function()
                                        _tp((workspace.Map.Waterfall.IslandModel:FindFirstChild('Meshes/bambootree', true)).CFrame * CFrame.new(4, 0, 0))
                                    end)

                                    if ((workspace.Map.Waterfall.IslandModel:FindFirstChild('Meshes/bambootree', true)).Position - Root.Position).Magnitude <= 200 then
                                        MousePos = (workspace.Map.Waterfall.IslandModel:FindFirstChild('Meshes/bambootree', true)).Position

                                        Useskills('Melee', 'Z')
                                        Useskills('Melee', 'X')
                                        Useskills('Melee', 'C')
                                        wait(0.5)
                                        Useskills('Sword', 'Z')
                                        Useskills('Sword', 'X')
                                        wait(0.5)
                                        Useskills('Blox Fruit', 'Z')
                                        Useskills('Blox Fruit', 'X')
                                        Useskills('Blox Fruit', 'C')
                                        wait(0.5)
                                        Useskills('Gun', 'Z')
                                        Useskills('Gun', 'X')
                                    end
                                until not _G.FarmBlazeEM or not I or BackTODoJo()
                            end
                        end
                    else
                        _tp(CFrame.new(5813, 1208, 884))
                        DragonMobClear(false, nil, nil)
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait(0.1) do
            if _G.FarmBlazeEM then
                pcall(function()
                    if workspace.EmberTemplate:FindFirstChild('Part') then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame
                    end
                end)
            end
        end
    end)
    Dojo:Section('Draco Trial')

    GetQuestDracoLevel = function()
        local I = {
            [1] = {
                NPC = 'Dragon Wizard',
                Command = 'Upgrade',
            },
        }

        return (replicated.Modules.Net:FindFirstChild('RF/InteractDragonQuest')):InvokeServer(unpack(I))
    end

    Dojo:Toggle({
        Title = 'Tween To Upgrade Draco Trial',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.UPGDrago = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.UPGDrago then
                    if GetQuestDracoLevel() == false then
                        return nil
                    elseif GetQuestDracoLevel() == true then
                        if ((CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609)).Position - Root.Position).Magnitude >= 300 then
                            _tp(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609))
                        else
                            _tp(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609))

                            local I = {
                                [1] = {
                                    NPC = 'Dragon Wizard',
                                    Command = 'Upgrade',
                                },
                            }

                            (replicated.Modules.Net:FindFirstChild('RF/InteractDragonQuest')):InvokeServer(unpack(I))
                        end
                    end
                end
            end)
        end
    end)
    Dojo:Toggle({
        Title = 'Auto Race Draco (V1)',
        Desc = 'Turn on for auto quest1 auto prehistoric event + collect dragon eggs',
        Value = false,
        Callback = function(I)
            _G.DragoV1 = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.DragoV1 then
                    if GetM('Dragon Egg') <= 0 then
                        repeat
                            wait()

                            _G.Prehis_Find = true
                            _G.Prehis_Skills = true
                            _G.Prehis_DE = true
                        until not _G.DragoV1 or GetM('Dragon Egg') >= 1

                        _G.Prehis_Find = false
                        _G.Prehis_Skills = false
                        _G.Prehis_DE = false
                    end
                end
            end)
        end
    end)
    Dojo:Toggle({
        Title = 'Auto Race Draco (V2)',
        Desc = 'Turn on for auto kill Forest Pirate & Collect fireflower',
        Value = false,
        Callback = function(I)
            _G.AutoFireFlowers = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.AutoFireFlowers then
                local I = workspace:FindFirstChild('FireFlowers')
                local e = GetConnectionEnemies('Forest Pirate')

                if e then
                    repeat
                        wait()
                        G.Kill(e, _G.AutoFireFlowers)
                    until not _G.AutoFireFlowers or not e.Parent or e.Humanoid.Health <= 0 or I
                else
                    _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                end
                if I then
                    for I, e in pairs(I:GetChildren())do
                        if e:IsA('Model') and e.PrimaryPart then
                            local I = e.PrimaryPart.Position
                            local K = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            local n = (I - K).Magnitude

                            if n <= 100 then
                                vim1:SendKeyEvent(true, 'E', false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, 'E', false, game)
                            else
                                _tp(CFrame.new(I))
                            end
                        end
                    end
                end
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Auto race draco (V3)',
        Desc = 'Turn on for sea event kill terror shark',
        Value = false,
        Callback = function(I)
            _G.DragoV3 = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.DragoV3 then
                    repeat
                        wait()

                        _G.DangerSc = 'Lv Infinite'
                        _G.SailBoats = true
                        _G.TerrorShark = true
                    until not _G.DragoV3

                    _G.DangerSc = 'Lv 1'
                    _G.SailBoats = false
                    _G.TerrorShark = false
                end
            end)
        end
    end)
    Dojo:Toggle({
        Title = 'Auto Relic Draco Trial [Beta]',
        Desc = 'Turn on for auto trial v4 you have to COLLECT RELIC by your self',
        Value = false,
        Callback = function(I)
            _G.Relic123 = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.Relic123 then
                pcall(function()
                    if workspace.Map:FindFirstChild('DracoTrial') then
                        replicated.Remotes.DracoTrial:InvokeServer()
                        wait(0.5)

                        repeat
                            wait()
                            _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-39934.9765625, 10685.359375, 22999.34375)).Position
                        repeat
                            wait()
                            _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)).Position

                        wait(2.5)

                        repeat
                            wait()
                            _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)).Position
                        repeat
                            wait()
                            _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)).Position

                        wait(2.5)

                        repeat
                            wait()
                            _tp(CFrame.new(-39908.5, 10685.405273438, 22990.04296875))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-39908.5, 10685.405273438, 22990.04296875)).Position
                        repeat
                            wait()
                            _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))
                        until not _G.Relic123 or Root.Position == (CFrame.new(-39609.5, 9376.400390625, 23472.94335975)).Position
                    else
                        local I = workspace.Map.PrehistoricIsland:FindFirstChild('TrialTeleport')

                        if I and I:IsA('Part') then
                            _tp(CFrame.new(I.Position))
                        end
                    end
                end)
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Auto to train race draco',
        Desc = 'Turn on for training Drago race v4 + auto upgrade tier',
        Value = false,
        Callback = function(I)
            _G.TrainDrago = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.TrainDrago then
                    local I = {
                        'Venomous Assailant',
                        'Hydra Enforcer',
                    }

                    for e = 1, #I, 1 do
                        if (plr.Character:FindFirstChild('RaceEnergy')).Value == 1 then
                            vim1:SendKeyEvent(true, 'Y', false, game)
                            replicated.Remotes.CommF_:InvokeServer('UpgradeRace', 'Buy', 2)
                            _tp(CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492))
                        elseif (plr.Character:FindFirstChild('RaceTransformed')).Value == false then
                            local e = GetConnectionEnemies(I)

                            if e then
                                repeat
                                    wait()
                                    G.Kill(e, _G.TrainDrago)
                                until _G.TrainDrago == false or e.Humanoid.Health <= 0 or not e.Parent
                            else
                                _tp(CFrame.new(4620.6157226562, 1002.2954711914, 399.08688354492))
                            end
                        end
                    end
                end
            end)
        end
    end)
    Dojo:Toggle({
        Title = 'Fly',
        Desc = 'Fly controlado pelo anal\u{f3}gico ( Subida Autom\u{e1}tica )',
        Value = false,
        Callback = function(v)
            _G.Fly = v
        end,
    })

    local Players = game:GetService('Players')
    local RunService = game:GetService('RunService')
    local player = Players.LocalPlayer
    local flying = false
    local speed = 90
    local yForce = 50
    local bodyGyro, bodyVelocity
    local flyConn

    function startFly()
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:WaitForChild('Humanoid')
        local root = char:WaitForChild('HumanoidRootPart')

        if bodyGyro then
            bodyGyro:Destroy()
        end
        if bodyVelocity then
            bodyVelocity:Destroy()
        end

        bodyGyro = Instance.new('BodyGyro')
        bodyGyro.P = 9e4
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro.CFrame = root.CFrame
        bodyGyro.Parent = root
        bodyVelocity = Instance.new('BodyVelocity')
        bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = root
        flying = true
        flyConn = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
            if not _G.Fly or not flying then
                return
            end

            local moveDir = hum.MoveDirection
            local velX, velZ = 0, 0

            if moveDir.Magnitude > 0 then
                velX = moveDir.Unit.X * speed
                velZ = moveDir.Unit.Z * speed
                bodyGyro.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(moveDir.X, 0, moveDir.Z))
            end

            bodyVelocity.Velocity = Vector3.new(velX, yForce, velZ)
        end))
    end
    function stopFly()
        flying = false

        if flyConn then
            flyConn:Disconnect()

            flyConn = nil
        end
        if bodyGyro then
            bodyGyro:Destroy()

            bodyGyro = nil
        end
        if bodyVelocity then
            bodyVelocity:Destroy()

            bodyVelocity = nil
        end
    end

    task.spawn(function()
        while task.wait() do
            if _G.Fly and not flying then
                startFly()
            elseif not _G.Fly and flying then
                stopFly()
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Tween to Draco Trials',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.TpDrago_Prehis = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.TpDrago_Prehis then
                local I = workspace.Map.PrehistoricIsland:FindFirstChild('TrialTeleport')

                if I and I:IsA('Part') then
                    _tp(CFrame.new(I.Position))
                end
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Swap Draco Race',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.BuyDrago = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.BuyDrago then
                pcall(function()
                    if ((CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609)).Position - Root.Position).Magnitude >= 300 then
                        _tp(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609))
                    else
                        _tp(CFrame.new(5814.4272460938, 1208.3267822266, 884.57855224609))

                        local I = {
                            [1] = {
                                NPC = 'Dragon Wizard',
                                Command = 'DragonRace',
                            },
                        }

                        (replicated.Modules.Net:FindFirstChild('RF/InteractDragonQuest')):InvokeServer(unpack(I))
                    end
                end)
            end
        end
    end)
    Dojo:Toggle({
        Title = 'Upgrade Dragon Talon With Uzoth',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.DT_Uzoth = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.DT_Uzoth then
                local I = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838E-8, -0.584473014, 4.75227395e-8, 1, 4.25682458e-8, 0.584473014, -6.231619659999999E-8, 0.811413169)

                _tp(I)

                if (I.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                    local I = {
                        NPC = 'Uzoth',
                        Command = 'Upgrade',
                    }

                    replicated.Modules.Net['RF/InteractDragonQuest']:InvokeServer(I)
                end
            end
        end
    end)
end
if World1 or World2 then
    Dojo:Section('Only in Sea 3')
end
