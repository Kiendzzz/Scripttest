if World3 then
    Get:Section('Skull Guitar')
    Get:Toggle({
        Title = 'Auto Skull Guitar',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Auto_Soul_Guitar = I
        end,
    })
    task.spawn(function()
        while wait() do
            if _G.Auto_Soul_Guitar then
                pcall(function()
                    local I = GetConnectionEnemies('Living Zombie')

                    if I then
                        I.HumanoidRootPart.CFrame = CFrame.new(-10138.397460938, 138.65246582031, 5902.8920898438)
                        I.Head.CanCollide = false
                        I.Humanoid.Sit = false
                        I.HumanoidRootPart.CanCollide = false
                        I.Humanoid.JumpPower = 0
                        I.Humanoid.WalkSpeed = 0

                        if I.Humanoid:FindFirstChild('Animator') then
                            (I.Humanoid:FindFirstChild('Animator')):Destroy()
                        end
                    end
                end)
            end
        end
    end)

    function getT(I)
        local e

        if I == 1 then
            e = workspace.Map['Haunted Castle'].Tablet.Segment1.Line.Rotation
        elseif I == 3 then
            e = workspace.Map['Haunted Castle'].Tablet.Segment3.Line.Rotation
        elseif I == 4 then
            e = workspace.Map['Haunted Castle'].Tablet.Segment4.Line.Rotation
        elseif I == 7 then
            e = workspace.Map['Haunted Castle'].Tablet.Segment7.Line.Rotation
        elseif I == 10 then
            e = workspace.Map['Haunted Castle'].Tablet.Segment10.Line.Rotation
        end
        if e then
            return e.Z
        end
    end
    function getRT(I)
        local e = workspace.Map['Haunted Castle'].Trophies.Quest
        local K

        for e, n in pairs(e:GetChildren())do
            if I == 1 and (n.Name == 'Trophy1' and n:FindFirstChild('Handle')) then
                K = n.Handle.Rotation
            elseif I == 2 and (n.Name == 'Trophy2' and n:FindFirstChild('Handle')) then
                K = n.Handle.Rotation
            elseif I == 3 and (n.Name == 'Trophy3' and n:FindFirstChild('Handle')) then
                K = n.Handle.Rotation
            elseif I == 4 and (n.Name == 'Trophy4' and n:FindFirstChild('Handle')) then
                K = n.Handle.Rotation
            elseif I == 5 and (n.Name == 'Trophy5' and n:FindFirstChild('Handle')) then
                K = n.Handle.Rotation
            end
            if K then
                return K.Z
            end
        end
    end

    GetFirePlacard = function(I, e)
        if tostring(workspace.Map['Haunted Castle']['Placard' .. I][e].Indicator.BrickColor) ~= 'Pearl' then
            fireclickdetector(workspace.Map['Haunted Castle']['Placard' .. I][e].ClickDetector)
        end
    end

    spawn(function()
        repeat
            task.wait()
        until _G.Auto_Soul_Guitar

        while wait(Sec) do
            pcall(function()
                if _G.Auto_Soul_Guitar then
                    if World3 then
                        replicated.Remotes.CommF_:InvokeServer('gravestoneEvent', 2)
                        replicated.Remotes.CommF_:InvokeServer('gravestoneEvent', 2, true)

                        if replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check') == nil then
                            _tp(CFrame.new(-8655.0166015625, 141.31669616699, 6160.0224609375))
                            replicated.Remotes.CommF_:InvokeServer('gravestoneEvent', 2)
                            replicated.Remotes.CommF_:InvokeServer('gravestoneEvent', 2, true)
                        elseif (replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')).Swamp == false then
                            Quest1 = true
                            Quest2 = false
                            Quest3 = false
                            Quest4 = false

                            local I = GetConnectionEnemies('Living Zombie')

                            if I then
                                repeat
                                    task.wait()
                                    G.Kill(I, _G.Auto_Soul_Guitar)
                                until not _G.Auto_Soul_Guitar or I.Humanoid.Health <= 0 or not I.Parent or workspace.Map['Haunted Castle'].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                            else
                                _tp(CFrame.new(-10170.727539062, 138.65246582031, 5934.2651367188))
                            end
                        elseif (replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')).Gravestones == false then
                            Quest1 = false
                            Quest2 = true
                            Quest3 = false
                            Quest4 = false

                            GetFirePlacard('7', 'Left')
                            GetFirePlacard('6', 'Left')
                            GetFirePlacard('5', 'Left')
                            GetFirePlacard('4', 'Right')
                            GetFirePlacard('3', 'Left')
                            GetFirePlacard('2', 'Right')
                            GetFirePlacard('1', 'Right')
                        elseif (replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')).Ghost == false then
                            replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Ghost')
                            replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Ghost', true)
                        elseif (replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')).Trophies == false then
                            Quest1 = false
                            Quest2 = false
                            Quest3 = true
                            Quest4 = false

                            _tp(CFrame.new(-9532.8232421875, 6.471667766571, 6078.068359375))

                            repeat
                                wait()

                                local I = getRT(1)
                                local e = getT(1)

                                if I and e then
                                    fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment1:FindFirstChild('ClickDetector'))
                                end
                            until I == e
                            repeat
                                wait()

                                local I = getRT(2)
                                local e = getT(3)

                                if I and e then
                                    fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment3:FindFirstChild('ClickDetector'))
                                end
                            until I == e
                            repeat
                                wait()

                                local I = getRT(3)
                                local e = getT(4)

                                if I and e then
                                    fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment4:FindFirstChild('ClickDetector'))
                                end
                            until I == e
                            repeat
                                wait()

                                local I = getRT(4)
                                local e = getT(7)

                                if I and e then
                                    fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment7:FindFirstChild('ClickDetector'))
                                end
                            until I == e
                            repeat
                                wait()

                                local I = getRT(5)
                                local e = getT(10)

                                if I and e then
                                    fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment10:FindFirstChild('ClickDetector'))
                                end
                            until I == e
                            repeat
                                wait()
                                fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment2:FindFirstChild('ClickDetector'))
                                fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment5:FindFirstChild('ClickDetector'))
                                fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment6:FindFirstChild('ClickDetector'))
                                fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment8:FindFirstChild('ClickDetector'))
                                fireclickdetector(workspace.Map['Haunted Castle'].Tablet.Segment9:FindFirstChild('ClickDetector'))
                            until workspace.Map['Haunted Castle'].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map['Haunted Castle'].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map['Haunted Castle'].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map['Haunted Castle'].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map['Haunted Castle'].Tablet.Segment9.Line.Rotation.Z == 0
                        elseif (replicated.Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')).Pipes == false then
                            Quest1 = false
                            Quest2 = false
                            Quest3 = false
                            Quest4 = true

                            _tp(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part3.CFrame)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part3.ClickDetector)
                            _tp(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part4.CFrame)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part4.ClickDetector)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part4.ClickDetector)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part4.ClickDetector)
                            _tp(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part6.CFrame)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part6.ClickDetector)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part6.ClickDetector)
                            _tp(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part8.CFrame)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part8.ClickDetector)
                            _tp(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part10.CFrame)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part10.ClickDetector)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part10.ClickDetector)
                            fireclickdetector(workspace.Map['Haunted Castle']['Lab Puzzle'].ColorFloor.Model.Part10.ClickDetector)
                        end
                    end
                end
            end)
        end
    end)
end
if World2 or World3 then
    Get:Toggle({
        Title = 'Auto Farm Material Skull Guitar',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoMatSoul = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.AutoMatSoul and GetWP('Skull Guitar') == false then
                    if GetM('Bones') >= 500 and (GetM('Ectoplasm') >= 250 and GetM('Dark Fragment') >= 1) then
                        replicated.Remotes.CommF_:InvokeServer('soulGuitarBuy', true)
                    else
                        if GetM('Ectoplasm') <= 250 then
                            if _G.AutoMatSoul and World2 then
                                local I = {
                                    'Ship Deckhand',
                                    'Ship Engineer',
                                    'Ship Steward',
                                    'Ship Officer',
                                    'Arctic Warrior',
                                }
                                local e = GetConnectionEnemies(I)

                                if e then
                                    repeat
                                        task.wait()
                                        G.Kill(e, _G.AutoMatSoul)
                                    until not _G.AutoMatSoul or not e.Parent or e.Humanoid.Health <= 0
                                else
                                    replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                                end
                            else
                                replicated.Remotes.CommF_:InvokeServer('TravelDressrosa')
                            end
                        elseif GetM('Dark Fragment') < 1 then
                            if _G.AutoMatSoul and World2 then
                                local I = GetConnectionEnemies('Darkbeard')

                                if I then
                                    repeat
                                        task.wait()
                                        G.Kill(I, _G.AutoMatSoul)
                                    until _G.AutoMatSoul or I.Humanoid.Health <= 0
                                else
                                    _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
                                end
                            else
                                replicated.Remotes.CommF_:InvokeServer('TravelDressrosa')
                            end
                            if not GetConnectionEnemies('Darkbeard') then
                                Hop()
                            end
                        elseif GetM('Bones') <= 500 then
                            if _G.AutoMatSoul and World3 then
                                local I = {
                                    'Reborn Skeleton',
                                    'Living Zombie',
                                    'Demonic Soul',
                                    'Posessed Mummy',
                                }
                                local e = GetConnectionEnemies(I)

                                if e then
                                    repeat
                                        task.wait()
                                        G.Kill(e, _G.AutoMatSoul)
                                    until not _G.AutoMatSoul or e.Humanoid.Health <= 0 or not e.Parent or e.Humanoid.Health <= 0
                                else
                                    _tp(CFrame.new(-9504.8564453125, 172.14292907715, 6057.259765625))
                                end
                            else
                                replicated.Remotes.CommF_:InvokeServer('TravelZou')
                            end
                        end
                    end
                end
            end)
        end
    end)
end

Get:Section('Farming Mastery')

local TargetMobs = {
    'Reborn Skeleton',
    'Living Zombie',
    'Demonic Soul',
    'Posessed Mummy',
}
local FarmPos = CFrame.new(-9513.63867, 164.010269, 5786.66895, -9.50724334E-2, 9.31791888e-8, 0.995470345, 7.18874515e-9, 1, -9.29166148E-8, -0.995470345, -1.67762626E-9, -9.50724334E-2)

function GetClosestMob()
    local closestDist = math.huge
    local target = nil
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

    if not hrp then
        return nil
    end

    local playerPos = hrp.Position

    for _, v in pairs(game:GetService('Workspace').Enemies:GetChildren())do
        local isTarget = false

        for _, name in pairs(TargetMobs)do
            if v.Name == name then
                isTarget = true

                break
            end
        end

        if isTarget and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            local dist = (v.HumanoidRootPart.Position - playerPos).Magnitude

            if dist < closestDist then
                closestDist = dist
                target = v
            end
        end
    end

    return target
end

Get:Toggle({
    Title = 'Auto Farm 600 In Swords',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.FarmMastery_S = I
    end,
})
spawn(function()
    while wait(0.1) do
        if _G.FarmMastery_S then
            pcall(function()
                local character = game.Players.LocalPlayer.Character

                if not character or not character:FindFirstChild('HumanoidRootPart') then
                    return
                end

                local Target = GetClosestMob()

                if not Target then
                    local distToArea = (character.HumanoidRootPart.Position - FarmPos.Position).Magnitude

                    if distToArea > 150 then
                        _tp(FarmPos)
                        wait(0.5)
                    end
                end

                for _, e in next, replicated.Remotes.CommF_:InvokeServer('getInventory')do
                    if type(e) == 'table' and e.Type == 'Sword' then
                        local SwordName = e.Name
                        local Mastery = tonumber(e.Mastery) or 0

                        if Mastery < 600 then
                            if GetBP(SwordName) then
                                if Target then
                                    repeat
                                        wait()

                                        if _G.FarmMastery_S and Target and Target:FindFirstChild('HumanoidRootPart') and Target.Humanoid.Health > 0 then
                                            G.Sword(Target, _G.FarmMastery_S)
                                        end
                                    until not _G.FarmMastery_S or not Target.Parent or Target.Humanoid.Health <= 0
                                end
                            else
                                replicated.Remotes.CommF_:InvokeServer('LoadItem', SwordName)
                            end

                            break
                        end
                    end
                end
            end)
        end
    end
end)

if World3 then
    Get:Section('Cursed Dual Katana')

    local I5 = Get:Paragraph({
        Title = 'Number Cursed dual katana quests ',
        Desc = 'Quest Numbers:',
        Image = 0,
    })

    spawn(function()
        while wait(0.2) do
            if QuestYama_1 == true then
                I5.Desc = ' Quest Numbers: Yama Quest 1'
            elseif QuestYama_2 == true then
                I5.Desc = ' Quest Numbers: Yama Quest 2'
            elseif QuestYama_3 == true then
                I5.Desc = ' Quest Numbers: Yama Quest 3'
            elseif QuestTushita_1 == true then
                I5.Desc = ' Quest Numbers: Tushita Quest 1'
            elseif QuestTushita_2 == true then
                I5.Desc = ' Quest Numbers: Tushita Quest 2'
            elseif QuestTushita_1 == true then
                I5.Desc = ' Quest Numbers: Tushita Quest 2'
            elseif GetWP('Cursed Dual Katana') then
                I5.Desc = ' Quest Numbers: CDK done!!'
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Get CDK [ Last Quest ]',
        Desc = '',
        Value = GetSetting('AutoCDK_Save', false),
        Callback = function(I)
            _G.CDK = I
            _G.SaveData.AutoCDK_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.CDK then
                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Good')
                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')
                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Boss')

                    local I = GetConnectionEnemies('Cursed Skeleton Boss')

                    if I then
                        repeat
                            wait()

                            if plr.Character:FindFirstChild('Yama') or plr.Backpack:FindFirstChild('Yama') then
                                EquipWeapon('Yama')
                            elseif plr.Character:FindFirstChild('Tushita') or plr.Backpack:FindFirstChild('Tushita') then
                                EquipWeapon('Tushita')
                            end

                            _tp(I.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        until not _G.CDK or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-12318.193359375, 601.95184326172, -6538.662109375))
                        wait(0.5)
                        _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Yama CDK',
        Desc = '',
        Value = GetSetting('AutoYamaCDK_Save', false),
        Callback = function(I)
            _G.CDK_YM = I
            _G.SaveData.AutoYamaCDK_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait() do
            pcall(function()
                if _G.CDK_YM then
                    if tostring(replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor')) ~= 'opened' then
                        replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor')
                        replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor', true)
                    else
                        if (replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Finished == nil then
                            replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                            replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Evil')
                        elseif (replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Finished == false then
                            if tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == -3 then
                                QuestYama_1 = true
                                QuestYama_2 = false
                                QuestYama_3 = false

                                repeat
                                    task.wait()

                                    if not workspace.Enemies:FindFirstChild('Forest Pirate') then
                                        _tp(CFrame.new(-13223.521484375, 428.19381713867, -7766.0678710938))
                                    else
                                        local I = GetConnectionEnemies('Forest Pirate')

                                        if I then
                                            _tp((workspace.Enemies:FindFirstChild('Forest Pirate')).HumanoidRootPart.CFrame)
                                        end
                                    end
                                until tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 1 or not _G.CDK_YM
                            elseif tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == -4 then
                                QuestYama_1 = false
                                QuestYama_2 = true
                                QuestYama_3 = false

                                for I, e in pairs((game:GetService('Players')).LocalPlayer.QuestHaze:GetChildren())do
                                    for I, K in pairs(w)do
                                        if string.find(I, e.Name) and e.Value > 0 then
                                            if (K.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(I) then
                                                for I, e in pairs(workspace.Enemies:GetChildren())do
                                                    if e:FindFirstChild('HumanoidRootPart') and (e:FindFirstChild('Humanoid') and ((e:FindFirstChild('Humanoid')).Health > 0 and e:FindFirstChild('HazeESP'))) then
                                                        repeat
                                                            wait()
                                                            G.Kill(e, _G.CDK_YM)
                                                        until not _G.CDK_YM or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 2 or not e:FindFirstChild('HazeESP') or e.Humanoid.Health <= 0
                                                    end
                                                end
                                            else
                                                _tp(K)
                                            end
                                        end
                                    end
                                end
                            elseif tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == -5 then
                                QuestYama_1 = false
                                QuestYama_2 = false
                                QuestYama_3 = true

                                if workspace.Map:FindFirstChild('HellDimension') then
                                    if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                                        for I, e in pairs(workspace.Map.HellDimension.Exit:GetChildren())do
                                            if tonumber(I) == 2 then
                                                repeat
                                                    task.wait()

                                                    Root.CFrame = workspace.Map.HellDimension.Exit.CFrame
                                                until not _G.CDK_YM or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3
                                            end
                                        end

                                        EquipWeapon(_G.SelectWeapon)

                                        if tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) ~= 3 then
                                            repeat
                                                task.wait()

                                                repeat
                                                    task.wait()
                                                    _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame)

                                                    for I, e in pairs(workspace.Map.HellDimension:GetDescendants())do
                                                        if e:IsA('ProximityPrompt') then
                                                            fireproximityprompt(e)
                                                        end
                                                    end
                                                until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5

                                                wait(2)

                                                _G.T1Yama = true
                                            until not _G.CDK_YM or _G.T1Yama or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3
                                            repeat
                                                task.wait()

                                                repeat
                                                    task.wait()
                                                    _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame)

                                                    for I, e in pairs(workspace.Map.HellDimension:GetDescendants())do
                                                        if e:IsA('ProximityPrompt') then
                                                            fireproximityprompt(e)
                                                        end
                                                    end
                                                until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5

                                                wait(2)

                                                _G.T2Yama = true
                                            until _G.T2Yama or _G.CDK_YM == false or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3
                                            repeat
                                                wait()

                                                repeat
                                                    task.wait()
                                                    _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame)

                                                    for I, e in pairs(workspace.Map.HellDimension:GetDescendants())do
                                                        if e:IsA('ProximityPrompt') then
                                                            fireproximityprompt(e)
                                                        end
                                                    end
                                                until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5

                                                wait(2)

                                                _G.T3Yama = true
                                            until _G.T3Yama or _G.CDK_YM == false or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3
                                        end

                                        for I, e in pairs(workspace.Enemies:GetChildren())do
                                            if ((e:FindFirstChild('HumanoidRootPart')).Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then
                                                if e:FindFirstChild('HumanoidRootPart') and (e:FindFirstChild('Humanoid') and (e:FindFirstChild('Humanoid')).Health > 0) then
                                                    repeat
                                                        task.wait()
                                                        G.Kill(e, _G.CDK_YM)
                                                    until not _G.CDK_YM or e.Humanoid.Health <= 0 or not e.Parent or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.CDK_YM then
                    if tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == -5 then
                        if not workspace.Map:FindFirstChild('HellDimension') or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
                            local I = GetConnectionEnemies('Soul Reaper')

                            if I then
                                repeat
                                    task.wait()
                                    _tp(I.HumanoidRootPart.CFrame)
                                until I.Humanoid.Health <= 0 or not _G.CDK_YM or not I.Parent or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Evil) == 3 or workspace.Map:FindFirstChild('HellDimension') and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000
                            elseif plr.Backpack:FindFirstChild('Hallow Essence') or plr.Character:FindFirstChild('Hallow Essence') then
                                repeat
                                    _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                                    task.wait()
                                until ((CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)).Position - Root.Position).Magnitude <= 8

                                EquipWeapon('Hallow Essence')
                            elseif replicated:FindFirstChild('Soul Reaper') and (replicated:FindFirstChild('Soul Reaper')).Humanoid.Health > 0 then
                                _tp((replicated:FindFirstChild('Soul Reaper')).HumanoidRootPart.CFrame)
                            else
                                if replicated.Remotes.CommF_:InvokeServer('Bones', 'Check') < 50 and (not workspace.Enemies:FindFirstChild('Soul Reaper') and (not replicated:FindFirstChild('Soul Reaper') and not workspace.Map:FindFirstChild('HellDimension'))) then
                                    if workspace.Enemies:FindFirstChild('Reborn Skeleton') or workspace.Enemies:FindFirstChild('Living Zombie') or workspace.Enemies:FindFirstChild('Domenic Soul') or workspace.Enemies:FindFirstChild('Posessed Mummy') then
                                        for I, e in pairs(workspace.Enemies:GetChildren())do
                                            if e.Name == 'Reborn Skeleton' or e.Name == 'Living Zombie' or e.Name == 'Demonic Soul' or e.Name == 'Posessed Mummy' then
                                                if e:FindFirstChild('HumanoidRootPart') and (e:FindFirstChild('Humanoid') and (e:FindFirstChild('Humanoid')).Health > 0) then
                                                    repeat
                                                        task.wait()
                                                        G.Kill(e, _G.CDK_YM)
                                                    until not _G.CDK_YM or e.Humanoid.Health <= 0 or not e.Parent
                                                end
                                            end
                                        end
                                    else
                                        _tp(CFrame.new(-9515.2255859375, 164.00622558594, 5785.3833007812))
                                    end
                                else
                                    replicated.Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Tushita CDK',
        Desc = '',
        Value = GetSetting('AutoTushitaCDK_Save', false),
        Callback = function(I)
            _G.CDK_TS = I
            _G.SaveData.AutoTushitaCDK_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait() do
            pcall(function()
                if _G.CDK_TS then
                    if tostring(replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor')) ~= 'opened' then
                        wait(0.7)
                        replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor')
                        wait(0.3)
                        replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'OpenDoor', true)
                    else
                        if (replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Finished == nil then
                            replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
                        elseif (replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Finished == false then
                            if tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == -3 then
                                QuestTushita_1 = true
                                QuestTushita_2 = false
                                QuestTushita_3 = false

                                repeat
                                    wait()
                                    _tp(CFrame.new(-4602.5107421875, 16.446542739868, -2880.998046875))
                                until ((CFrame.new(-4602.5107421875, 16.446542739868, -2880.998046875)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 1

                                if ((CFrame.new(-4602.5107421875, 16.446542739868, -2880.998046875)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(0.7)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'), 'Check')
                                    wait(0.5)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'))
                                end

                                wait(1)

                                repeat
                                    wait()
                                    _tp(CFrame.new(4001.1853027344, 10.089399337769, -2654.86328125))
                                until ((CFrame.new(4001.1853027344, 10.089399337769, -2654.86328125)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 1

                                if ((CFrame.new(4001.1853027344, 10.089399337769, -2654.86328125)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(0.7)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'), 'Check')
                                    wait(0.5)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'))
                                end

                                wait(1)

                                repeat
                                    wait()
                                    _tp(CFrame.new(-9530.763671875, 7.2452087402344, -8375.5087890625))
                                until ((CFrame.new(-9530.763671875, 7.2452087402344, -8375.5087890625)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 1

                                if ((CFrame.new(-9530.763671875, 7.2452087402344, -8375.5087890625)).Position - (game:GetService('Players')).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(0.7)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'), 'Check')
                                    wait(0.5)
                                    replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', workspace.NPCs:FindFirstChild('Luxury Boat Dealer'))
                                end

                                wait(1)
                            elseif tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == -4 then
                                QuestTushita_1 = false
                                QuestTushita_2 = true
                                QuestTushita_3 = false

                                repeat
                                    wait()

                                    _G.AutoRaidCastle = true
                                until not _G.CDK_TS or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 2

                                _G.AutoRaidCastle = false
                            elseif tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == -5 then
                                QuestTushita_1 = false
                                QuestTushita_2 = false
                                QuestTushita_3 = true

                                if workspace.Enemies:FindFirstChild('Cake Queen') then
                                    for I, e in pairs(workspace.Enemies:GetChildren())do
                                        if e.Name == 'Cake Queen' then
                                            if e:FindFirstChild('Humanoid') and (e:FindFirstChild('HumanoidRootPart') and e.Humanoid.Health > 0) then
                                                repeat
                                                    wait()
                                                    G.Kill(e, _G.CDK_TS)
                                                until not _G.CDK_TS or not e.Parent or e.Humanoid.Health <= 0 or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 3
                                            end
                                        end
                                    end
                                elseif replicated:FindFirstChild('Cake Queen') and (replicated:FindFirstChild('Cake Queen')).Humanoid.Health > 0 then
                                    _tp((replicated:FindFirstChild('Cake Queen')).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                else
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
                                        for I, e in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren())do
                                            Ex = I
                                        end

                                        if Ex == 2 then
                                            repeat
                                                wait()

                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
                                            until not _G.CDK_TS or tonumber((replicated.Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')).Good) == 3
                                        end

                                        repeat
                                            wait()

                                            repeat
                                                wait()
                                                _tp(CFrame.new(-22529.6171875, 5275.7739257812, 3873.5712890625))

                                                for I, e in pairs(workspace.Map.HeavenlyDimension:GetDescendants())do
                                                    if e:IsA('ProximityPrompt') then
                                                        fireproximityprompt(e)
                                                    end
                                                end
                                            until ((CFrame.new(-22529.6171875, 5275.7739257812, 3873.5712890625)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                                            wait(2)

                                            _G.DoneT1 = true
                                        until not _G.CDK_TS or _G.DoneT1
                                        repeat
                                            wait()

                                            repeat
                                                wait()
                                                _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.2885742188))

                                                for I, e in pairs(workspace.Map.HeavenlyDimension:GetDescendants())do
                                                    if e:IsA('ProximityPrompt') then
                                                        fireproximityprompt(e)
                                                    end
                                                end
                                            until ((CFrame.new(-22637.291015625, 5281.365234375, 3749.2885742188)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                                            wait(2)

                                            _G.DoneT2 = true
                                        until _G.DoneT2 or _G.CDK_TS == false
                                        repeat
                                            wait()

                                            repeat
                                                task.wait()
                                                _tp(CFrame.new(-22791.14453125, 5277.1655273438, 3764.5700683594))

                                                for I, e in pairs(workspace.Map.HeavenlyDimension:GetDescendants())do
                                                    if e:IsA('ProximityPrompt') then
                                                        fireproximityprompt(e)
                                                    end
                                                end
                                            until ((CFrame.new(-22791.14453125, 5277.1655273438, 3764.5700683594)).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5

                                            wait(2)

                                            _G.DoneT3 = true
                                        until _G.DoneT3 or _G.CDK_TS == false

                                        for I, e in pairs(workspace.Enemies:GetChildren())do
                                            if ((e:FindFirstChild('HumanoidRootPart')).Position - (CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.3218583399999995e-8, 0.99301964, -8.73070718E-8, 1, -2.30819008E-8, -0.99301964, -8.397513799999999E-8, 0.11794927)).Position).Magnitude <= 300 then
                                                if e:FindFirstChild('HumanoidRootPart') and (e:FindFirstChild('Humanoid') and (e:FindFirstChild('Humanoid')).Health > 0) then
                                                    repeat
                                                        wait()
                                                        G.Kill(e, _G.CDK_TS)
                                                    until not _G.CDK_TS or e.Humanoid.Health <= 0 or not e.Parent
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end
if World2 then
    Get:Section('True Triple Katana Sword')
    Get:Toggle({
        Title = 'Auto Buy Legendary Sword',
        Desc = '',
        Value = GetSetting('TpLegendarySword_Save', false),
        Callback = function(I)
            _G.Tp_LgS = I
            _G.SaveData.TpLegendarySword_Save = I

            SaveSettings()

            if I then
                spawn(function()
                    while _G.Tp_LgS do
                        pcall(function()
                            replicated.Remotes.CommF_:InvokeServer('LegendarySwordDealer', '1')
                            replicated.Remotes.CommF_:InvokeServer('LegendarySwordDealer', '2')
                            replicated.Remotes.CommF_:InvokeServer('LegendarySwordDealer', '3')
                        end)
                        wait(1)
                    end
                end)
            end
        end,
    })
    Get:Toggle({
        Title = 'Teleport Legendary Sword Dealer',
        Desc = '',
        Value = GetSetting('TpLegendarySword_Save', false),
        Callback = function(I)
            _G.Tp_LgS = I
            _G.SaveData.TpLegendarySword_Save = I

            SaveSettings()
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.Tp_LgS then
                pcall(function()
                    for I, e in pairs(replicated.NPCs:GetChildren())do
                        if e.Name == 'Legendary Sword Dealer ' then
                            _tp(e.HumanoidRootPart.CFrame)
                        end
                    end
                end)
            end
        end
    end)
    Get:Section('Law')
    Get:Toggle({
        Title = 'Auto Law Raid',
        Desc = '',
        Value = false,
        Callback = function(state)
            _G.AutoLawKak = state
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.AutoLawKak then
                pcall(function()
                    replicated.Remotes.CommF_:InvokeServer('BlackbeardReward', 'Microchip', '2')
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)

                    local enemy = GetConnectionEnemies('Order')

                    if enemy then
                        repeat
                            task.wait()
                            G.Kill(enemy, _G.AutoLawKak)
                        until not _G.AutoLawKak or not enemy.Parent or enemy.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end)
            end
        end
    end)
end
if World1 then
    Get:Section('world 1 items')
    Get:Toggle({
        Title = 'Auto Saw Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoSaw = I
        end,
    })
    spawn(function()
        while wait(0.2) do
            pcall(function()
                if _G.AutoSaw then
                    local I = GetConnectionEnemies('The Saw')

                    if I then
                        repeat
                            task.wait()
                            G.Kill(I, _G.AutoSaw)
                        until _G.AutoSaw == false or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Saber Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoSaber = I
        end,
    })
    spawn(function()
        while wait(0.2) do
            pcall(function()
                if _G.AutoSaber and (plr.Data.Level.Value >= 200 and (not plr.Backpack:FindFirstChild('Saber') and not plr.Character:FindFirstChild('Saber'))) then
                    if workspace.Map.Jungle.Final.Part.Transparency == 0 then
                        if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if ((CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, -0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, -4.39869794E-8, 0.37091279)).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                _tp(plr.Character.HumanoidRootPart.CFrame)
                                wait(0.5)

                                plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame

                                wait(0.5)

                                plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame

                                wait(0.5)

                                plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame

                                wait(0.5)

                                plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame

                                wait(0.5)

                                plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame

                                wait(0.5)
                            else
                                _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, -0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, -4.39869794E-8, 0.37091279))
                            end
                        else
                            if workspace.Map.Desert.Burn.Part.Transparency == 0 then
                                if plr.Backpack:FindFirstChild('Torch') or plr.Character:FindFirstChild('Torch') then
                                    EquipWeapon('Torch')
                                    firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
                                    firetouchinterest(plr.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
                                    _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094E-9, 0.761243105, -5.70652914E-10, 1, 1.20584542e-9, -0.761243105, 3.4754488199999996e-10, -0.648466587))
                                else
                                    _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -4.49818149E-2, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-5, -0.258850515, 0.965917408))
                                end
                            else
                                if replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'SickMan') ~= 0 then
                                    replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'GetCup')
                                    wait(0.5)
                                    EquipWeapon('Cup')
                                    wait(0.5)
                                    replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'FillCup', plr.Character.Cup)
                                    wait(Sec)
                                    replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'SickMan')
                                else
                                    if replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == nil then
                                        replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon')
                                    elseif replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == 0 then
                                        if workspace.Enemies:FindFirstChild('Mob Leader') or replicated:FindFirstChild('Mob Leader') then
                                            _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -2.27849055E-2, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))

                                            for I, e in pairs(workspace.Enemies:GetChildren())do
                                                if e.Name == 'Mob Leader' and G.Alive(e) then
                                                    repeat
                                                        task.wait()
                                                        G.Kill(e, _G.AutoSaber)
                                                    until e.Humanoid.Health <= 0 or _G.AutoSaber == false
                                                end
                                            end
                                        end
                                    elseif replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == 1 then
                                        replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon')
                                        EquipWeapon('Relic')
                                        _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-9, 0.481375456, 2.53851997e-8, 1, -5.79995607E-8, -0.481375456, 6.30572643e-8, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if workspace.Enemies:FindFirstChild('Saber Expert') or replicated:FindFirstChild('Saber Expert') then
                            for I, e in pairs(workspace.Enemies:GetChildren())do
                                if e.Name == 'Saber Expert' and G.Alive(e) then
                                    repeat
                                        task.wait()
                                        G.Kill(e, _G.AutoSaber)
                                    until e.Humanoid.Health <= 0 or _G.AutoSaber == false

                                    if e.Humanoid.Health <= 0 then
                                        replicated.Remotes.CommF_:InvokeServer('ProQuestProgress', 'PlaceRelic')
                                    end
                                end
                            end
                        else
                            _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-8, 0.513301849, -8.55007443E-8, 1, -2.77243419E-8, -0.513301849, -2.00944328E-8, 0.85820812))
                        end
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = "Auto Usoap's Hat",
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoGetUsoap = I
        end,
    })
    spawn(function()
        while task.wait(Sec) do
            pcall(function()
                if _G.AutoGetUsoap then
                    for I, e in pairs(workspace.Characters:GetChildren())do
                        if e.Name ~= plr.Name then
                            if e.Humanoid.Health > 0 and (e:FindFirstChild('HumanoidRootPart') and (e.Parent and (Root.Position - e.HumanoidRootPart.Position).Magnitude <= 230)) then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    _tp(e.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2))
                                until _G.AutoGetUsoap == false or e.Humanoid.Health <= 0 or not e.Parent or not e:FindFirstChild('HumanoidRootPart') or not e:FindFirstChild('Humanoid')
                            end
                        end
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Bisento V2',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Greybeard = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.Greybeard then
                pcall(function()
                    if not GetWP('Bisento') then
                        replicated.Remotes.CommF_:InvokeServer('BuyItem', 'Bisento')
                    elseif GetWP('Bisento') then
                        replicated.Remotes.CommF_:InvokeServer('LoadItem', 'Bisento')

                        local I = GetConnectionEnemies('Greybeard')

                        if I then
                            repeat
                                wait()
                                G.Kill(I, _G.Greybeard)
                            until _G.Greybeard == false or not I.Parent or I.Humanoid.Health <= 0
                        else
                            _tp(CFrame.new(-5023.3833007812, 28.652032852173, 4332.3818359375))
                        end
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Warden Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.WardenBoss = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.WardenBoss then
                pcall(function()
                    local I = GetConnectionEnemies('Chief Warden')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.WardenBoss)
                        until _G.WardenBoss == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -6.2915677E-4, 0.939684749, 0.00191645394, 0.999998152, -2.80422337E-5, -0.939682961, 0.00181045406, 0.342041939))
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Marine Coat',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.MarinesCoat = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.MarinesCoat then
                pcall(function()
                    local I = GetConnectionEnemies('Vice Admiral')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.MarinesCoat)
                        until _G.MarinesCoat == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Swan Coat',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.SwanCoat = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.SwanCoat then
                pcall(function()
                    local I = GetConnectionEnemies('Swan')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.SwanCoat)
                        until _G.SwanCoat == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
                    end
                end)
            end
        end
    end)
end
if World2 then
    Get:Section('world 2 items')
    Get:Toggle({
        Title = 'Auto Rengoku Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoKeyRen = I
        end,
    })

    
task.spawn(function()
    while task.wait(0.2) do

        if _G.AutoKeyRen then

            pcall(function()
                local plr = game.Players.LocalPlayer
                local char = plr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")

                if not root then return end

                local hasKey = plr.Backpack:FindFirstChild(K[3]) or char:FindFirstChild(K[3])

                if hasKey then
                    EquipWeapon(K[3])

                    local doorPos = CFrame.new(6571.12, 299.23, -6967.84)
                    if (root.Position - doorPos.Position).Magnitude > 10 then
                        _tp(doorPos)
                    end
                    return
                end

                local boss = GetConnectionEnemies("Awakened Ice Admiral")

                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    repeat
                        task.wait()

                        if not _G.AutoKeyRen then break end

                        G.Kill(boss, true)

                    until hasKey
                        or not boss.Parent
                        or boss.Humanoid.Health <= 0

                else
                    local spawnPos = CFrame.new(6080.32, 28.41, -6247.52)

                    if (root.Position - spawnPos.Position).Magnitude > 20 then
                        _tp(spawnPos)
                        task.wait(0.5)
                    end

                    local nearest = nil
                    local dist = math.huge

                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        local hum = mob:FindFirstChild("Humanoid")
                        local hrp = mob:FindFirstChild("HumanoidRootPart")

                        if hum and hrp and hum.Health > 0 then
                            local mag = (hrp.Position - root.Position).Magnitude

                            if mag < dist and mag <= 500 then
                                dist = mag
                                nearest = mob
                            end
                        end
                    end

                    if nearest then
                        repeat
                            task.wait()

                            if not _G.AutoKeyRen then break end

                            G.Kill(nearest, true)

                        until hasKey
                            or not nearest.Parent
                            or nearest.Humanoid.Health <= 0
                    end
                end
            end)

        else
            task.wait(0.5)
        end
    end
end)
    Get:Toggle({
        Title = 'Auto Dragon Trident',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoTridentW2 = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.AutoTridentW2 then
                    local I = GetConnectionEnemies('Tide Keeper')

                    if I then
                        repeat
                            task.wait()
                            G.Kill(I, _G.AutoTridentW2)
                        until _G.AutoTridentW2 == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Long Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.LongsWord = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if _G.LongsWord then
                    local I = GetConnectionEnemies('Diamond')

                    if I then
                        repeat
                            task.wait()
                            G.Kill(I, _G.LongsWord)
                        until _G.LongsWord == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Black Spikey',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.BlackSpikey = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.BlackSpikey then
                pcall(function()
                    local I = GetConnectionEnemies('Jeremy')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.BlackSpikey)
                        until _G.BlackSpikey == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Midnight Blade',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoEcBoss = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.AutoEcBoss then
                    if GetM('Ectoplasm') >= 99 then
                        replicated.Remotes.CommF_:InvokeServer('Ectoplasm', 'Buy', 3)
                    elseif GetM('Ectoplasm') <= 99 then
                        local I = GetConnectionEnemies('Cursed Captain')

                        if I then
                            repeat
                                wait()
                                G.Kill(I, _G.AutoEcBoss)
                            until not _G.AutoEcBoss or not I.Parent or I.Humanoid.Health <= 0
                        else
                            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            wait(0.5)
                            _tp(CFrame.new(916.928589, 181.092773, 33422))
                        end
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Darkbeard',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Auto_Def_DarkCoat = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.Auto_Def_DarkCoat then
                pcall(function()
                    if GetBP('Fist of Darkness') and not workspace.Enemies:FindFirstChild('Darkbeard') then
                        _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                    elseif GetConnectionEnemies('Darkbeard') then
                        local I = GetConnectionEnemies('Darkbeard')

                        if I then
                            repeat
                                wait()
                                G.Kill(I, _G.Auto_Def_DarkCoat)
                            until _G.Auto_Def_DarkCoat == false or not I.Parent or I.Humanoid.Helath <= 0
                        end
                    elseif not GetBP('Fist of Darkness') and not GetConnectionEnemies('Darkbeard') then
                        repeat
                            wait(0.1)

                            _G.AutoFarmChest = true
                        until not _G.Auto_Def_DarkCoat or GetBP('Fist of Darkness') or GetConnectionEnemies('Darkbeard')

                        _G.AutoFarmChest = false
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Unlocked DonSwan',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Auto_DonAcces = I
        end,
    })
    spawn(function()
        while wait(0.1) do
            if _G.Auto_DonAcces then
                pcall(function()
                    if (replicated.Remotes.CommF_:InvokeServer('GetUnlockables')).FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
                        FruitPrice = {}
                        FruitStore = {}

                        for I, e in next, (replicated:WaitForChild('Remotes')).CommF_:InvokeServer('GetFruits')do
                            if e.Price >= 1000000 then
                                table.insert(FruitPrice, e.Name)
                            end
                        end
                        for I, e in pairs(replicated.Remotes.CommF_:InvokeServer('getInventoryFruits'))do
                            for I, e in pairs(e)do
                                if I == 'Name' then
                                    table.insert(FruitStore, e)
                                end
                            end

                            replicated.Remotes.CommF_:InvokeServer('Cousin', 'Buy')

                            for I, e in pairs(FruitPrice)do
                                for I, K in pairs(FruitStore)do
                                    if e == K and (replicated.Remotes.CommF_:InvokeServer('GetUnlockables')).FlamingoAccess == nil then
                                        _G.StoreF = false

                                        if not plr.Backpack:FindFirstChild(FruitStore) then
                                            replicated.Remotes.CommF_:InvokeServer('LoadFruit', tostring(e))
                                        else
                                            replicated.Remotes.CommF_:InvokeServer('TalkTrevor', '1')
                                            replicated.Remotes.CommF_:InvokeServer('TalkTrevor', '2')
                                            replicated.Remotes.CommF_:InvokeServer('TalkTrevor', '3')
                                        end
                                    end
                                end
                            end

                            if (replicated.Remotes.CommF_:InvokeServer('GetUnlockables')).FlamingoAccess ~= nil then
                                _G.StoreF = true
                                _G.Auto_DonAcces = false
                            end
                        end
                    end
                end)
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Swan Glasses',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Auto_SwanGG = I
        end,
    })
    spawn(function()
        while wait(0.2) do
            if _G.Auto_SwanGG then
                pcall(function()
                    local I = GetConnectionEnemies('Don Swan')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.Auto_SwanGG)
                        until _G.Auto_SwanGG == false or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
                    end
                end)
            end
        end
    end)
end
if World3 then
    Get:Section('Sea 3')
    Get:Toggle({
        Title = 'Auto Canvendish Sword',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.Auto_Cavender = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.Auto_Cavender then
                    local I = GetConnectionEnemies('Beautiful Pirate')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.Auto_Cavender)
                        until not _G.Auto_Cavender or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(5283.6094, 22.5622, -110.7829))
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Twin Hooks',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.TwinHook = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            pcall(function()
                if _G.TwinHook then
                    local I = GetConnectionEnemies('Captain Elephant')

                    if I then
                        repeat
                            wait()
                            G.Kill(I, _G.TwinHook)
                        until not _G.TwinHook or I.Humanoid.Health <= 0
                    else
                        replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-12471.1699, 374.9402, -7551.6777))
                        wait(0.2)
                        _tp(CFrame.new(-13376.7578, 433.2869, -8071.3926))
                    end
                end
            end)
        end
    end)
    Get:Toggle({
        Title = 'Auto Serpent Bow',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoSerpentBow = I
        end,
    })
    spawn(function()
        while wait(Sec) do
            if _G.AutoSerpentBow then
                local I = GetConnectionEnemies('Hydra Leader')

                if I then
                    repeat
                        wait()
                        G.Kill(I, _G.AutoSerpentBow)
                    until not _G.AutoSerpentBow or not I.Parent or I.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(5821.898, 1019.0951, -73.7192))
                end
            end
        end
    end)
    Get:Toggle({
        Title = 'Auto Lei Accessory',
        Desc = '',
        Value = false,
        Callback = function(I)
            _G.AutoKilo = I
        end,
    })
    spawn(function()
        while wait(0.2) do
            if _G.AutoKilo then
                pcall(function()
                    local I = GetConnectionEnemies('Kilo Admiral')

                    if I then
                        repeat
                            task.wait()
                            G.Kill(I, _G.AutoKilo)
                        until not _G.AutoKilo or not I.Parent or I.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(2764.2234, 432.4615, -7144.458))
                    end
                end)
            end
        end
    end)
end
