function isnil(I)
    return I == nil
end

function G5(I)
    return math.floor(tonumber(I) + 0.5)
end

Number = math.random(1, 1000000)
EspPly = function()
    for I, e in next, game.Players:GetChildren()do
        pcall(function()
            if not isnil(e.Character) then
                if PlayerEsp then
                    if not isnil(e.Character.Head) and not e.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        local I = Instance.new('BillboardGui', e.Character.Head)

                        I.Name = 'NameEsp' .. Number
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = e.Character.Head
                        I.AlwaysOnTop = true

                        local K = Instance.new('TextLabel', I)

                        K.Font = Enum.Font.Code
                        K.FontSize = 'Size14'
                        K.TextWrapped = true
                        K.Text = e.Name .. ' | Lv. ' .. (e.Data.Level.Value)
                        K.Size = UDim2.new(1, 0, 1, 0)
                        K.TextYAlignment = 'Top'
                        K.BackgroundTransparency = 1
                        K.TextStrokeTransparency = 0.5
                        K.TextColor3 = Color3.new(1, 1, 1)
                    else
                        e.Character.Head['NameEsp' .. Number].TextLabel.Text = e.Name .. ' | Lv. ' .. (e.Data.Level.Value)
                    end
                else
                    if e.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        (e.Character.Head:FindFirstChild('NameEsp' .. Number)):Destroy()
                    end
                end
            end
        end)
    end
end
DevEsp = function()
    for I, e in next, workspace:GetChildren()do
        pcall(function()
            if DevilFruitESP then
                if string.find(e.Name, 'Fruit') then
                    if not e.Handle:FindFirstChild('NameEsp' .. Number) then
                        local I = Instance.new('BillboardGui', e.Handle)

                        I.Name = 'NameEsp' .. Number
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = e.Handle
                        I.AlwaysOnTop = true

                        local K = Instance.new('TextLabel', I)

                        K.Font = Enum.Font.Code
                        K.FontSize = 'Size14'
                        K.TextWrapped = true
                        K.Size = UDim2.new(1, 0, 1, 0)
                        K.TextYAlignment = 'Top'
                        K.BackgroundTransparency = 1
                        K.TextStrokeTransparency = 0.5
                        K.TextColor3 = Color3.fromRGB(255, 255, 255)
                        K.Text = e.Name .. (' \n' .. (G5(((game:GetService('Players')).LocalPlayer.Character.Head.Position - e.Handle.Position).Magnitude / 3) .. ' M'))
                    else
                        e.Handle['NameEsp' .. Number].TextLabel.Text = '[' .. (e.Name .. (']' .. ('   \n' .. (G5(((game:GetService('Players')).LocalPlayer.Character.Head.Position - e.Handle.Position).Magnitude / 3) .. ' M'))))
                    end
                end
            else
                if e.Handle:FindFirstChild('NameEsp' .. Number) then
                    (e.Handle:FindFirstChild('NameEsp' .. Number)):Destroy()
                end
            end
        end)
    end
end
flowerEsp = function()
    for I, e in pairs(workspace:GetChildren())do
        pcall(function()
            if e.Name == 'Flower2' or e.Name == 'Flower1' then
                if FlowerESP then
                    if not e:FindFirstChild('NameEsp' .. Number) then
                        local I = Instance.new('BillboardGui', e)

                        I.Name = 'NameEsp' .. Number
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = e
                        I.AlwaysOnTop = true

                        local K = Instance.new('TextLabel', I)

                        K.Font = Enum.Font.Code
                        K.FontSize = 'Size14'
                        K.TextWrapped = true
                        K.Size = UDim2.new(1, 0, 1, 0)
                        K.TextYAlignment = 'Top'
                        K.BackgroundTransparency = 1
                        K.TextStrokeTransparency = 0.5
                        K.TextColor3 = Color3.fromRGB(255, 255, 255)

                        if e.Name == 'Flower1' then
                            K.Text = 'Blue Flower' .. (' \n' .. (G5(((game:GetService('Players')).LocalPlayer.Character.Head.Position - e.Position).Magnitude / 3) .. ' M'))
                        end
                        if e.Name == 'Flower2' then
                            K.Text = 'Red Flower' .. (' \n' .. (G5(((game:GetService('Players')).LocalPlayer.Character.Head.Position - e.Position).Magnitude / 3) .. ' M'))
                        end
                    else
                        e['NameEsp' .. Number].TextLabel.Text = e.Name .. ('   \n' .. (G5(((game:GetService('Players')).LocalPlayer.Character.Head.Position - e.Position).Magnitude / 3) .. ' M'))
                    end
                else
                    if e:FindFirstChild('NameEsp' .. Number) then
                        (e:FindFirstChild('NameEsp' .. Number)):Destroy()
                    end
                end
            end
        end)
    end
end
gearEsp = function()
    for I, e in pairs(workspace.Map.MysticIsland:GetDescendants())do
        pcall(function()
            if ESPGear then
                if e.Name == 'Part' and e.Material == Enum.Material.Neon then
                    if not e:FindFirstChild('NameEsp') then
                        local I = Instance.new('BillboardGui', e)

                        I.Name = 'NameEsp'
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = e
                        I.AlwaysOnTop = true

                        local K = Instance.new('TextLabel', I)

                        K.Font = 'Code'
                        K.FontSize = 'Size14'
                        K.TextWrapped = true
                        K.Size = UDim2.new(1, 0, 1, 0)
                        K.TextYAlignment = 'Top'
                        K.BackgroundTransparency = 1
                        K.TextStrokeTransparency = 0.5
                        K.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        e.NameEsp.TextLabel.Text = 'Gear' .. ('   \n' .. (G5((plr.Character.Head.Position - e.Position).Magnitude / 3) .. ' M'))
                    end
                end
            else
                if e:FindFirstChild('NameEsp') then
                    (e:FindFirstChild('NameEsp')):Destroy()
                end
            end
        end)
    end
end
AdvanFruitEsp = function()
    if advanEsp == true then
        for I, e in pairs(game:GetService('ReplicatedStorage').NPCs:GetChildren())do
            if e.Name == 'Advanced Fruit Dealer' then
                local Adv = workspace:FindFirstChild('Adv')

                if not Adv then
                    Adv = Instance.new('Part')
                    Adv.Name = 'Adv'
                    Adv.Transparency = 1
                    Adv.Size = Vector3.new(1, 1, 1)
                    Adv.Anchored = true
                    Adv.CanCollide = false
                    Adv.Parent = workspace
                    Adv.CFrame = e.HumanoidRootPart.CFrame
                end
                if Adv then
                    if not Adv:FindFirstChild('NameEsp') then
                        local I = Instance.new('BillboardGui', Adv)

                        I.Name = 'NameEsp'
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = Adv
                        I.AlwaysOnTop = true

                        local txt = Instance.new('TextLabel', I)

                        txt.Font = 'Code'
                        txt.FontSize = 'Size14'
                        txt.TextWrapped = true
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.TextYAlignment = 'Top'
                        txt.BackgroundTransparency = 1
                        txt.TextStrokeTransparency = 0.5
                        txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        Adv.NameEsp.TextLabel.Text = e.Name .. ('   \n' .. (G5((game.Players.LocalPlayer.Character.Head.Position - e.HumanoidRootPart.Position).Magnitude / 3) .. ' M'))
                    end
                end
            end
        end
    else
        if workspace:FindFirstChild('Adv') then
            workspace.Adv:Destroy()
        end
    end
end
HakiClorEsp = function()
    if ColorEsp == true then
        for I, e in pairs(game:GetService('ReplicatedStorage').NPCs:GetChildren())do
            if e.Name == 'Barista Cousin' then
                local Gay = workspace:FindFirstChild('Gay')

                if not Gay then
                    Gay = Instance.new('Part')
                    Gay.Name = 'Gay'
                    Gay.Transparency = 1
                    Gay.Size = Vector3.new(1, 1, 1)
                    Gay.Anchored = true
                    Gay.CanCollide = false
                    Gay.Parent = workspace
                    Gay.CFrame = e.HumanoidRootPart.CFrame
                end
                if Gay then
                    if not Gay:FindFirstChild('NameEsp') then
                        local I = Instance.new('BillboardGui', Gay)

                        I.Name = 'NameEsp'
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = Gay
                        I.AlwaysOnTop = true

                        local txt = Instance.new('TextLabel', I)

                        txt.Font = 'Code'
                        txt.FontSize = 'Size14'
                        txt.TextWrapped = true
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.TextYAlignment = 'Top'
                        txt.BackgroundTransparency = 1
                        txt.TextStrokeTransparency = 0.5
                        txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        Gay.NameEsp.TextLabel.Text = e.Name .. ('   \n' .. (G5((game.Players.LocalPlayer.Character.Head.Position - e.HumanoidRootPart.Position).Magnitude / 3) .. ' M'))
                    end
                end
            end
        end
    else
        if workspace:FindFirstChild('Gay') then
            workspace.Gay:Destroy()
        end
    end
end
LegenSword = function()
    if LegenS == true then
        for I, e in pairs(game:GetService('ReplicatedStorage').NPCs:GetChildren())do
            if e.Name == 'Legendary Sword Dealer ' then
                if not workspace:FindFirstChild('Lgd') then
                    Lgd = Instance.new('Part')
                    Lgd.Name = 'Lgd'
                    Lgd.Transparency = 1
                    Lgd.Size = Vector3.new(1, 1, 1)
                    Lgd.Anchored = true
                    Lgd.CanCollide = false
                    Lgd.Parent = workspace
                    Lgd.CFrame = e.HumanoidRootPart.CFrame
                elseif workspace:FindFirstChild('Lgd') then
                    if not Lgd:FindFirstChild('NameEsp') then
                        local I = Instance.new('BillboardGui', Lgd)

                        I.Name = 'NameEsp'
                        I.ExtentsOffset = Vector3.new(0, 1, 0)
                        I.Size = UDim2.new(1, 200, 1, 30)
                        I.Adornee = Lgd
                        I.AlwaysOnTop = true

                        local txt = Instance.new('TextLabel', I)

                        txt.Font = 'Code'
                        txt.FontSize = 'Size14'
                        txt.TextWrapped = true
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.TextYAlignment = 'Top'
                        txt.BackgroundTransparency = 1
                        txt.TextStrokeTransparency = 0.5
                        txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        Lgd.NameEsp.TextLabel.Text = e.Name .. ('   \n' .. (G5((game.Players.LocalPlayer.Character.Head.Position - e.HumanoidRootPart.Position).Magnitude / 3) .. ' M'))
                    end
                end
            end
        end
    else
        if workspace:FindFirstChild('Lgd') then
            (workspace:FindFirstChild('Lgd')):Destroy()
        end
    end
end
ChestEsp = function()
    if ChestESP then
        local I = game:GetService('CollectionService')
        local z = I:GetTagged('_ChestTagged')

        for _, e in ipairs(z)do
            pcall(function()
                local H = (e:GetPivot().Position - game.Players.LocalPlayer.Character.Head.Position).Magnitude
                local Q = e:FindFirstChild('ChestEspAttachment')

                if not Q then
                    local att = Instance.new('Attachment', e)

                    att.Name = 'ChestEspAttachment'
                    att.Position = Vector3.new(0, 3, 0)

                    local gui = Instance.new('BillboardGui', att)

                    gui.Name = 'NameEsp'
                    gui.Size = UDim2.new(0, 200, 0, 30)
                    gui.AlwaysOnTop = true

                    local txt = Instance.new('TextLabel', gui)

                    txt.Font = Enum.Font.Code
                    txt.TextSize = 14
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = Color3.new(1, 1, 1)
                    txt.Size = UDim2.new(1, 0, 1, 0)
                end

                local X = e.ChestEspAttachment:FindFirstChild('NameEsp')

                if X then
                    X.TextLabel.Text = string.format('[%s] %d M', e.Name:gsub('Label', ''), math.floor(H / 3))
                end
            end)
        end
    else
        for _, e in ipairs((game:GetService('CollectionService')):GetTagged('_ChestTagged'))do
            if e:FindFirstChild('ChestEspAttachment') then
                e.ChestEspAttachment:Destroy()
            end
        end
    end
end
berriesEsp = function()
    if BerryEsp then
        local I = game:GetService('CollectionService')
        local n = I:GetTagged('BerryBush')

        for _, e in ipairs(n)do
            local pos = (e.Parent:GetPivot()).Position

            for _, attr in pairs(e:GetAttributes())do
                local name = 'BerryEspPart_' .. tostring(pos)
                local d = workspace:FindFirstChild(name)

                if not d then
                    d = Instance.new('Part', workspace)
                    d.Name = name
                    d.Transparency = 1
                    d.Anchored = true
                    d.CanCollide = false
                    d.CFrame = CFrame.new(pos)
                end
                if not d:FindFirstChild('NameEsp') then
                    local gui = Instance.new('BillboardGui', d)

                    gui.Name = 'NameEsp'
                    gui.Size = UDim2.new(0, 200, 0, 30)
                    gui.AlwaysOnTop = true

                    local txt = Instance.new('TextLabel', gui)

                    txt.Font = Enum.Font.Code
                    txt.TextColor3 = Color3.new(1, 1, 1)
                    txt.BackgroundTransparency = 1
                    txt.Size = UDim2.new(1, 0, 1, 0)
                end

                local dist = (game.Players.LocalPlayer.Character.Head.Position - pos).Magnitude / 3

                d.NameEsp.TextLabel.Text = '[' .. attr .. '] ' .. math.round(dist) .. ' M'
            end
        end
    else
        for _, e in ipairs(workspace:GetChildren())do
            if e.Name:match('BerryEspPart_') then
                e:Destroy()
            end
        end
    end
end
_G.ESPColor = Color3.fromRGB(255, 255, 255)

function IslandESP_Func()
    for _, island in pairs(workspace._WorldOrigin.Locations:GetChildren())do
        pcall(function()
            if island.Name ~= 'Sea' then
                if _G.IslandESP then
                    if not island:FindFirstChild('IslandESP') then
                        local billboard = Instance.new('BillboardGui', island)

                        billboard.Name = 'IslandESP'
                        billboard.Size = UDim2.new(0, 150, 0, 35)
                        billboard.StudsOffset = Vector3.new(0, 35, 0)
                        billboard.AlwaysOnTop = true

                        local text = Instance.new('TextLabel', billboard)

                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.BackgroundTransparency = 1
                        text.Text = island.Name
                        text.TextColor3 = _G.ESPColor
                        text.TextStrokeTransparency = 0
                        text.TextScaled = true
                        text.Font = Enum.Font.Cartoon
                    end
                else
                    if island:FindFirstChild('IslandESP') then
                        island.IslandESP:Destroy()
                    end
                end
            end
        end)
    end
end

Esp:Section('Esp Items / Entity / Island')
Esp:Toggle({
    Title = 'Esp Berries',
    Value = false,
    Callback = function(I)
        BerryEsp = I

        spawn(function()
            while BerryEsp do
                wait(1)
                berriesEsp()
            end
        end)
    end,
})
Esp:Toggle({
    Title = 'Esp Players',
    Value = false,
    Callback = function(I)
        PlayerEsp = I

        spawn(function()
            while PlayerEsp do
                wait(0.1)
                EspPly()
            end
        end)
    end,
})
Esp:Toggle({
    Title = 'Esp Chests',
    Value = false,
    Callback = function(I)
        ChestESP = I

        spawn(function()
            while ChestESP do
                wait(1)
                ChestEsp()
            end
        end)
    end,
})
Esp:Toggle({
    Title = 'Esp Fruits',
    Value = false,
    Callback = function(I)
        DevilFruitESP = I

        task.spawn(function()
            while DevilFruitESP do
                task.wait(1)
                pcall(DevEsp)
            end
        end)
    end,
})
Esp:Toggle({
    Title = 'Esp Island',
    Value = false,
    Callback = function(I)
        _G.IslandESP = I

        task.spawn(function()
            while _G.IslandESP do
                IslandESP_Func()
                task.wait(2)
            end

            IslandESP_Func()
        end)
    end,
})

if World2 then
    Esp:Toggle({
        Title = 'Esp Flower',
        Value = false,
        Callback = function(I)
            FlowerESP = I

            task.spawn(function()
                while FlowerESP do
                    pcall(flowerEsp)
                    task.wait(1)
                end
            end)
        end,
    })
    Esp:Toggle({
        Title = 'Esp Legendary Sword',
        Value = false,
        Callback = function(I)
            LegenS = I

            task.spawn(function()
                while LegenS do
                    pcall(LegenSword)
                    task.wait(1)
                end
            end)
        end,
    })
end
if World2 or World3 then
    Esp:Toggle({
        Title = 'Esp Aura Colour Dealers',
        Value = false,
        Callback = function(I)
            ColorEsp = I

            task.spawn(function()
                while ColorEsp do
                    pcall(HakiClorEsp)
                    task.wait(1)
                end

                pcall(HakiClorEsp)
            end)
        end,
    })
end
if World3 then
    Esp:Toggle({
        Title = 'Esp Gears',
        Value = false,
        Callback = function(I)
            ESPGear = I

            task.spawn(function()
                while ESPGear do
                    pcall(gearEsp)
                    task.wait(1)
                end
            end)
        end,
    })
    Esp:Toggle({
        Title = 'Esp Advanced Fruits Dealer',
        Value = false,
        Callback = function(I)
            advanEsp = I

            task.spawn(function()
                while advanEsp do
                    pcall(AdvanFruitEsp)
                    task.wait(1)
                end

                pcall(AdvanFruitEsp)
            end)
        end,
    })
end

Esp:Section('Stats')
Esp:Toggle({
    Title = 'Add Points Melee',
    Desc = 'Automatically spends points in Melee.',
    Value = GetSetting('AutoMelee_Save', false),
    Callback = function(I)
        _G.Auto_Melee = I
        _G.SaveData.AutoMelee_Save = I

        SaveSettings()
    end,
})
Esp:Toggle({
    Title = 'Add Points Sword',
    Desc = 'Automatically spends points on Sword.',
    Value = GetSetting('AutoSword_Save', false),
    Callback = function(I)
        _G.Auto_Sword = I
        _G.SaveData.AutoSword_Save = I

        SaveSettings()
    end,
})
Esp:Toggle({
    Title = 'Add Points Gun',
    Desc = 'Automatically spends points on Gun.',
    Value = GetSetting('AutoGun_Save', false),
    Callback = function(I)
        _G.Auto_Gun = I
        _G.SaveData.AutoGun_Save = I

        SaveSettings()
    end,
})
Esp:Toggle({
    Title = 'Add Points Fruit',
    Desc = 'Automatically spend points on Fruit.',
    Value = GetSetting('AutoFruit_Save', false),
    Callback = function(I)
        _G.Auto_Blox = I
        _G.SaveData.AutoFruit_Save = I

        SaveSettings()
    end,
})
Esp:Toggle({
    Title = 'Add Points Defense',
    Desc = 'Automatically spends points on Defense.',
    Value = GetSetting('AutoDefense_Save', false),
    Callback = function(I)
        _G.Auto_Defense = I
        _G.SaveData.AutoDefense_Save = I

        SaveSettings()
    end,
})
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local remote = game:GetService('ReplicatedStorage').Remotes.CommF_

            if _G.Auto_Melee then
                remote:InvokeServer('AddPoint', 'Melee', 3)
            end
            if _G.Auto_Sword then
                remote:InvokeServer('AddPoint', 'Sword', 3)
            end
            if _G.Auto_Gun then
                remote:InvokeServer('AddPoint', 'Gun', 3)
            end
            if _G.Auto_Blox then
                remote:InvokeServer('AddPoint', 'Demon Fruit', 3)
            end
            if _G.Auto_Defense then
                remote:InvokeServer('AddPoint', 'Defense', 3)
            end
        end)
    end
end)

local AllAvailablePoints = 9999999

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Melee then
                statsSetings('Melee', AllAvailablePoints)
            end
        end)
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Sword then
                statsSetings('Sword', AllAvailablePoints)
            end
        end)
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Gun then
                statsSetings('Gun', AllAvailablePoints)
            end
        end)
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Blox then
                statsSetings('Devil', AllAvailablePoints)
            end
        end)
    end
end)
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Defense then
                statsSetings('Defense', AllAvailablePoints)
            end
        end)
    end
end)
