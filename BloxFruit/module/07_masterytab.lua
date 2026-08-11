Maestry:Section('Mastery')

local islands = {
    'Cake',
    'Bone',
}

Maestry:Dropdown({
    Title = 'Select Method',
    Desc = '',
    List = islands,
    Value = 'Cake',
    Callback = function(I)
        SelectIsland = I
    end,
})

function GetNearestMobFromList(list)
    local plr = game.Players.LocalPlayer
    local root = plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')

    if not root then
        return nil
    end

    local nearest, dist = nil, math.huge

    for _, mob in pairs(workspace.Enemies:GetChildren())do
        if table.find(list, mob.Name) and mob:FindFirstChild('HumanoidRootPart') and mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0 then
            local d = (mob.HumanoidRootPart.Position - root.Position).Magnitude

            if d < dist then
                dist = d
                nearest = mob
            end
        end
    end

    return nearest
end
function HasAliveMob(list)
    for _, mob in pairs(workspace.Enemies:GetChildren())do
        if table.find(list, mob.Name) and mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0 then
            return true
        end
    end

    return false
end

Maestry:Toggle({
    Title = 'Auto Farm Mastery Fruit',
    Desc = '',
    Value = GetSetting('FarmMastery_Dev', false),
    Callback = function(I)
        _G.FarmMastery_Dev = I
        _G.SaveData.FarmMastery_Dev = I

        SaveSettings()
    end,
})
spawn(function()
    RunSer.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
        if _G.FarmMastery_Dev then
            pcall(function()
                for _, e in pairs(plr.PlayerGui.Notifications:GetChildren())do
                    if e.Name == 'NotificationTemplate' and string.find(e.Text, 'Skill locked!') then
                        e:Destroy()
                    end
                end
            end)
        end
    end))
end)
spawn(function()
    while task.wait(Sec) do
        if _G.FarmMastery_Dev then
            pcall(function()
                local list = (SelectIsland == 'Cake' and X or P)
                local mob = GetNearestMobFromList(list)

                if mob then
                    HealthM = mob.Humanoid.MaxHealth * 0.7

                    repeat
                        task.wait()

                        if not mob.Parent or not mob:FindFirstChild('Humanoid') or mob.Humanoid.Health <= 0 or not mob:FindFirstChild('HumanoidRootPart') then
                            mob = GetNearestMobFromList(list)

                            if not mob then
                                break
                            end
                        end

                        MousePos = mob.HumanoidRootPart.Position

                        G.Mas(mob, _G.FarmMastery_Dev)

                        if not HasAliveMob(list) then
                            break
                        end
                    until not _G.FarmMastery_Dev
                else
                    if SelectIsland == 'Cake' then
                        _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
                    else
                        _tp(CFrame.new(-9495.6806, 453.5862, 5977.3486))
                    end
                end
            end)
        end
    end
end)
Maestry:Toggle({
    Title = 'Auto Farm Mastery Gun',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.FarmMastery_G = I
    end,
})
spawn(function()
    while task.wait(Sec) do
        if _G.FarmMastery_G then
            pcall(function()
                local list = (SelectIsland == 'Cake' and X or P)
                local mob = GetNearestMobFromList(list)

                if mob then
                    HealthM = mob.Humanoid.MaxHealth * 0.7

                    repeat
                        task.wait()

                        if not mob.Parent or not mob:FindFirstChild('Humanoid') or mob.Humanoid.Health <= 0 or not mob:FindFirstChild('HumanoidRootPart') then
                            mob = GetNearestMobFromList(list)

                            if not mob then
                                break
                            end
                        end

                        MousePos = mob.HumanoidRootPart.Position

                        G.Masgun(mob, _G.FarmMastery_G)

                        local modules = replicated:FindFirstChild('Modules')
                        local K = modules:FindFirstChild('Net')
                        local shoot = K:FindFirstChild('RE/ShootGunEvent')
                        local tool = plr.Character:FindFirstChildOfClass('Tool')

                        if tool and tool.Name == 'Skull Guitar' then
                            SoulGuitar = true

                            tool.RemoteEvent:FireServer('TAP', MousePos)
                        elseif tool then
                            SoulGuitar = false

                            shoot:FireServer(MousePos, {
                                mob.HumanoidRootPart,
                            })
                        end
                        if not HasAliveMob(list) then
                            break
                        end
                    until not _G.FarmMastery_G

                    SoulGuitar = false
                else
                    if SelectIsland == 'Cake' then
                        _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
                    else
                        _tp(CFrame.new(-9495.6806, 453.5862, 5977.3486))
                    end
                end
            end)
        end
    end
end)
Maestry:Toggle({
    Title = 'Fruit Skill Z',
    Value = false,
    Callback = function(v)
        _G.FruitSkills.Z = v
    end,
})
Maestry:Toggle({
    Title = 'Fruit Skill X',
    Value = false,
    Callback = function(v)
        _G.FruitSkills.X = v
    end,
})
Maestry:Toggle({
    Title = 'Fruit Skill C',
    Value = false,
    Callback = function(v)
        _G.FruitSkills.C = v
    end,
})
Maestry:Toggle({
    Title = 'Fruit Skill V',
    Value = false,
    Callback = function(v)
        _G.FruitSkills.V = v
    end,
})
Maestry:Toggle({
    Title = 'Fruit Skill F',
    Value = false,
    Callback = function(v)
        _G.FruitSkills.F = v
    end,
})
