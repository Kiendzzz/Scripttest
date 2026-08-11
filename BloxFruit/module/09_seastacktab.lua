SeaStack:Section('Sea Stack')

local SeaStackStatus = {
    Mirage = SeaStack:Paragraph({Title = 'Mirage Status', Desc = 'N/A'}),
    Kitsune = SeaStack:Paragraph({Title = 'Kitsune Status', Desc = 'N/A'}),
    Prehistoric = SeaStack:Paragraph({Title = 'Prehistoric Status', Desc = 'N/A'}),
    Frozen = SeaStack:Paragraph({Title = 'Frozen Status', Desc = 'N/A'}),
}

function SetSeaStackStatus(paragraph, isSpawned, spawnedText, missingText)
    if paragraph and paragraph.SetDesc then
        paragraph:SetDesc(isSpawned and spawnedText or missingText)
    end
end

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local locations = workspace:FindFirstChild('_WorldOrigin') and workspace._WorldOrigin:FindFirstChild('Locations')
            local map = workspace:FindFirstChild('Map')

            SetSeaStackStatus(SeaStackStatus.Mirage, map and map:FindFirstChild('MysticIsland'), 'Mirage Island Spawning', 'Mirage Island Not Spawn')
            SetSeaStackStatus(SeaStackStatus.Kitsune, locations and locations:FindFirstChild('Kitsune Island'), 'Kitsune Island Spawning', 'Kitsune Island Not Spawn')
            SetSeaStackStatus(SeaStackStatus.Prehistoric, locations and locations:FindFirstChild('Prehistoric Island'), 'Prehistoric Island Spawning', 'Prehistoric Island Not Spawn')
            SetSeaStackStatus(SeaStackStatus.Frozen, locations and locations:FindFirstChild('Frozen Dimension'), 'Frozen Dimension Spawning', 'Frozen Dimension Not Spawn')
        end)
    end
end)

function BuySelectedSeaBoat()
    local boat = CheckBoat()

    if boat then
        return boat
    end

    local boatDealer = CFrame.new(-16927.451, 9.086, 433.864)

    TeleportToTarget(boatDealer)
    if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (boatDealer.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
        replicated.Remotes.CommF_:InvokeServer('BuyBoat', _G.SelectedBoat or 'Guardian')
    end

    return CheckBoat()
end

function SailToSeaStack(targetCFrame, enabledFlag, spawnedCheck)
    local boat = BuySelectedSeaBoat()

    if not boat or not boat:FindFirstChild('VehicleSeat') or not plr.Character or not plr.Character:FindFirstChild('Humanoid') then
        return
    end
    if not plr.Character.Humanoid.Sit then
        _tp(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))

        return
    end

    repeat
        task.wait()
        if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
            _tp(targetCFrame * CFrame.new(0, 150, 0))
        else
            _tp(targetCFrame)
        end
    until not _G[enabledFlag] or spawnedCheck() or not plr.Character or not plr.Character:FindFirstChild('Humanoid') or not plr.Character.Humanoid.Sit
end

SeaStack:Toggle({
    Title = 'Summon Prehistoric Island',
    Desc = 'Need Volcanic Magnet',
    Value = false,
    Callback = function(I)
        _G.SummonPrehistoricIsland = I
    end,
})
SeaStack:Toggle({
    Title = 'Tween To Prehistoric Island',
    Value = false,
    Callback = function(I)
        _G.TweenToPrehistoricIsland = I
    end,
})
SeaStack:Toggle({
    Title = 'Auto Kill Lava Golem',
    Value = false,
    Callback = function(I)
        _G.AutoKillLavaGolem = I
    end,
})
SeaStack:Toggle({
    Title = 'Summon Frozen Dimension',
    Value = false,
    Callback = function(I)
        _G.SummonForzenDimension = I
    end,
})
SeaStack:Button({
    Title = 'Bribe Leviathan',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('InfoLeviathan', '2')
    end,
})
SeaStack:Toggle({
    Title = 'Tween To Frozen Dimension',
    Value = GetSetting('FrozenTP_Save', false),
    Callback = function(I)
        _G.FrozenTP = I
        _G.TweenToFrozenDimension = I
        _G.SaveData.FrozenTP_Save = I
        SaveSettings()
    end,
})
SeaStack:Toggle({
    Title = 'Summon Kitsune Island',
    Value = GetSetting('FindKitsune_Save', false),
    Callback = function(I)
        _G.SummonKitsuneIsland = I
        _G.AutofindKitIs = I
        _G.SaveData.FindKitsune_Save = I
        SaveSettings()
    end,
})
SeaStack:Toggle({
    Title = 'Tween To Kitsune Island',
    Value = false,
    Callback = function(I)
        _G.TweenToKitsuneIsland = I
        _G.tweenShrine = I
    end,
})
SeaStack:Toggle({
    Title = 'Auto Collect Azure Ember',
    Value = false,
    Callback = function(I)
        _G.AutoCollectAzureEmber = I
        _G.Collect_Ember = I
    end,
})
SeaStack:Toggle({
    Title = 'Tween To Mirage Island',
    Value = GetSetting('MirageIsland_Save', false),
    Callback = function(I)
        _G.TweenToMirageIsland = I
        _G.FindMirage = I
        _G.SaveData.MirageIsland_Save = I
        SaveSettings()
    end,
})
SeaStack:Toggle({
    Title = 'Auto Attack Seabeasts',
    Value = false,
    Callback = function(I)
        _G.AutoAttackSeabeasts = I
        _G.SeaBeast1 = I
    end,
})

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local locations = workspace:FindFirstChild('_WorldOrigin') and workspace._WorldOrigin:FindFirstChild('Locations')

            if _G.SummonPrehistoricIsland and World3 then
                SailToSeaStack(CFrame.new(-148073.359, 8.99999523, 7721.05078), 'SummonPrehistoricIsland', function()
                    return locations and locations:FindFirstChild('Prehistoric Island')
                end)
            end
            if _G.SummonForzenDimension and World3 then
                SailToSeaStack(CFrame.new(-148073.359, 8.99999523, 7721.05078), 'SummonForzenDimension', function()
                    return locations and locations:FindFirstChild('Frozen Dimension')
                end)
            end
            if _G.SummonKitsuneIsland and World3 then
                SailToSeaStack(CFrame.new(-44541.7617, 30.0003204, -1244.8584), 'SummonKitsuneIsland', function()
                    return locations and locations:FindFirstChild('Kitsune Island')
                end)
            end
            if _G.TweenToPrehistoricIsland and locations and locations:FindFirstChild('Prehistoric Island') then
                _tp(locations['Prehistoric Island'].CFrame)
            end
            if _G.TweenToFrozenDimension and locations and locations:FindFirstChild('Frozen Dimension') then
                _tp(locations['Frozen Dimension'].CFrame)
            end
            if _G.TweenToKitsuneIsland then
                local shrine = workspace.Map:FindFirstChild('KitsuneIsland') and workspace.Map.KitsuneIsland:FindFirstChild('ShrineActive') and workspace.Map.KitsuneIsland.ShrineActive:FindFirstChild('NeonShrinePart')

                if shrine then
                    _tp(shrine.CFrame * CFrame.new(0, 0, 10))
                elseif locations and locations:FindFirstChild('Kitsune Island') then
                    _tp(locations['Kitsune Island'].CFrame * CFrame.new(0, 100, 0))
                end
            end
            if _G.TweenToMirageIsland and workspace.Map:FindFirstChild('MysticIsland') then
                _tp(workspace.Map.MysticIsland.WorldPivot)
            end
            if _G.AutoCollectAzureEmber and workspace:FindFirstChild('EmberTemplate') and workspace.EmberTemplate:FindFirstChild('Part') then
                _tp(workspace.EmberTemplate.Part.CFrame)
            end
            if _G.AutoKillLavaGolem and workspace.Enemies:FindFirstChild('Lava Golem') then
                for _, mob in pairs(workspace.Enemies:GetChildren())do
                    if mob.Name == 'Lava Golem' and G.Alive(mob) then
                        G.Kill(mob, _G.AutoKillLavaGolem)
                    end
                end
            end
        end)
    end
end)
