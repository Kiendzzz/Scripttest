Fruit:Section('Raiding')

e = {
    'Flame',
    'Ice',
    'Quake',
    'Light',
    'Dark',
    'String',
    'Rumble',
    'Magma',
    'Human: Buddha',
    'Sand',
    'Bird: Phoenix',
    'Dough',
}

Fruit:Dropdown({
    Title = 'Select Chip',
    Desc = '',
    List = e,
    Value = 'Flame',
    Multi = false,
    Callback = function(I)
        _G.SelectChip = I
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.AutoSelectDungeon then
            pcall(function()
                if GetBP('Flame-Flame') then
                    _G.SelectChip = 'Flame'
                elseif GetBP('Ice-Ice') then
                    _G.SelectChip = 'Ice'
                elseif GetBP('Quake-Quake') then
                    _G.SelectChip = 'Quake'
                elseif GetBP('Light-Light') then
                    _G.SelectChip = 'Light'
                elseif GetBP('Dark-Dark') then
                    _G.SelectChip = 'Dark'
                elseif GetBP('String-String') then
                    _G.SelectChip = 'String'
                elseif GetBP('Rumble-Rumble') then
                    _G.SelectChip = 'Rumble'
                elseif GetBP('Magma-Magma') then
                    _G.SelectChip = 'Magma'
                elseif GetBP('Human-Human: Buddha Fruit') then
                    _G.SelectChip = 'Human: Buddha'
                elseif GetBP('Dough-Dough') then
                    _G.SelectChip = 'Dough'
                elseif GetBP('Sand-Sand') then
                    _G.SelectChip = 'Sand'
                elseif GetBP('Bird-Bird: Phoenix') then
                    _G.SelectChip = 'Bird: Phoenix'
                else
                    _G.SelectChip = 'Ice'
                end
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Buy Chip With Fruit',
    Desc = 'Use your lowest fruit in your bag',
    Value = false,
    Callback = function(state)
        _G.AutoBuyChip = state

        task.spawn(function()
            while _G.AutoBuyChip do
                if not GetBP('Special Microchip') then
                    local I = {}

                    for _, data in next, replicated.Remotes.CommF_:InvokeServer('GetFruits')do
                        local rarity = tostring(data.Rarity or ''):lower()

                        if data.Price <= 1150000 or rarity == 'common' or rarity == 'uncommon' or rarity == 'rare' then
                            table.insert(I, data.Name)
                        end
                    end
                    for _, fruitName in pairs(I)do
                        if not GetBP('Special Microchip') then
                            replicated.Remotes.CommF_:InvokeServer('LoadFruit', fruitName)
                            replicated.Remotes.CommF_:InvokeServer('RaidsNpc', 'Select', _G.SelectChip)
                        end
                    end
                end

                task.wait(3)
            end
        end)
    end,
})
Fruit:Section('Raid Farming')
Fruit:Toggle({
    Title = 'Auto Start Raid',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.Auto_StartRaid = I
    end,
})
spawn(function()
    while true do
        task.wait(10)

        if _G.Auto_StartRaid then
            pcall(function()
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
                    if GetBP('Special Microchip') then
                        if World2 then
                            _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-5097.93164, 316.447021, -3142.66602))
                            task.wait(0.5)
                            _tp(CFrame.new(-5033.50879, 315.014252, -2947.77539))
                            fireclickdetector(workspace.Map['Boat Castle'].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Auto Complete Raid',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.Raiding = I
    end,
})

function IsIslandRaid(cu)
    local locs = game:GetService('Workspace')._WorldOrigin.Locations

    if locs:FindFirstChild('Island ' .. cu) then
        local min = 4500

        for _, v in ipairs(locs:GetChildren())do
            if v.Name == 'Island ' .. cu then
                local dist = (v.Position - plr.Character.HumanoidRootPart.Position).Magnitude

                if dist < min then
                    min = dist
                end
            end
        end
        for _, v in ipairs(locs:GetChildren())do
            if v.Name == 'Island ' .. cu then
                local dist = (v.Position - plr.Character.HumanoidRootPart.Position).Magnitude

                if dist <= min then
                    return v
                end
            end
        end
    end
end
function getNextIsland()
    local order = {
        5,
        4,
        3,
        2,
        1,
    }

    for _, id in ipairs(order)do
        local island = IsIslandRaid(id)

        if island then
            local dist = (island.Position - plr.Character.HumanoidRootPart.Position).Magnitude

            if dist <= 4500 then
                return island
            end
        end
    end
end
function attackNearbyEnemies()
    for _, mob in pairs(workspace.Enemies:GetChildren())do
        if mob:FindFirstChild('HumanoidRootPart') and mob:FindFirstChild('Humanoid') then
            if mob.Humanoid.Health > 0 then
                local dist = (mob.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude

                if dist <= 1000 then
                    repeat
                        G.Kill(mob, _G.Raiding)
                        task.wait()
                    until not _G.Raiding or not mob.Parent or mob.Humanoid.Health <= 0
                end
            end
        end
    end
end

spawn(function()
    pcall(function()
        while wait(Sec) do
            if _G.Raiding then
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
                    attackNearbyEnemies()

                    local nextIsland = getNextIsland()

                    if nextIsland then
                        _tp(nextIsland.CFrame * CFrame.new(0, 50, 0))

                        NextIs = true
                    else
                        NextIs = false
                    end
                else
                    NextIs = false
                end
            else
                NextIs = false
            end
        end
    end)
end)

Fruit:Section('Dungeon')
Fruit:Button({
    Title = 'Teleport To Dungeon Hub',
    Callback = function()
        local modules = replicated:FindFirstChild('Modules')
        local net = modules and modules:FindFirstChild('Net')
        local dungeonRemote = net and (net:FindFirstChild('RF/DungeonNPCNetworkFunction') or net:FindFirstChild('RF/DungeonNPCFunction'))

        if dungeonRemote then
            dungeonRemote:InvokeServer('TeleportToDungeonHub', false)
        end
    end,
})
Fruit:Dropdown({
    Title = 'Dungeon Weapon',
    Desc = 'select dungeon weapon type',
    List = {
        'Melee',
        'Sword',
        'Blox Fruit',
    },
    Value = _G.DungeonWeaponMode,
    Multi = false,
    Callback = function(I)
        _G.DungeonWeaponMode = I
    end,
})
Fruit:Toggle({
    Title = 'Auto Attack Dungeon Mon',
    Desc = 'Auto attack nearest dungeon mobs',
    Value = false,
    Callback = function(I)
        _G.AutoAttackMonDungeon = I
    end,
})
Fruit:Toggle({
    Title = 'Auto Next Floor',
    Desc = 'Use the floor teleporter when the room is clear',
    Value = false,
    Callback = function(I)
        _G.AutoNextFloor = I
    end,
})
Fruit:Toggle({
    Title = 'Auto Choose Card',
    Desc = 'Choose a reward card automatically',
    Value = false,
    Callback = function(I)
        _G.AutoChooseCard = I
    end,
})
Fruit:Toggle({
    Title = 'Auto Return To Hub',
    Desc = 'Return to hub when dungeon is done',
    Value = false,
    Callback = function(I)
        _G.AutoReturnToHub = I
    end,
})
Fruit:Toggle({
    Title = 'Spin Position',
    Desc = 'Circle around dungeon mobs while farming',
    Value = false,
    Callback = function(I)
        _G.SpinPosition = I
    end,
})
Fruit:Slider({
    Title = 'Spin Radius',
    Min = 1,
    Max = 40,
    Rounding = 0,
    Value = _G.SpinRadius,
    Callback = function(I)
        _G.SpinRadius = I
    end,
})
Fruit:Slider({
    Title = 'Farm Distance',
    Min = 10,
    Max = 50,
    Rounding = 0,
    Value = _G.FarmDistance,
    Callback = function(I)
        _G.FarmDistance = I
    end,
})

function GetDungeonMap()
    return workspace:FindFirstChild('Map') and workspace.Map:FindFirstChild('Dungeon')
end

function GetHighestDungeonFloor()
    local dungeon = GetDungeonMap()
    local highest = -math.huge
    local highestFloor = nil

    if not dungeon then
        return nil
    end
    for _, floor in pairs(dungeon:GetChildren())do
        local number = tonumber(floor.Name)

        if number and number > highest then
            highest = number
            highestFloor = floor
        end
    end

    return highestFloor
end

function GetCurrentDungeonFloor()
    local highestFloor = GetHighestDungeonFloor()
    local dungeon = GetDungeonMap()
    local highest = highestFloor and tonumber(highestFloor.Name)

    if not dungeon or not highest then
        return nil
    end

    return dungeon:FindFirstChild(tostring(highest - 1)) or dungeon:FindFirstChild(tostring(highest - 2)) or highestFloor
end

function FindDungeonRewardButton(gui)
    for _, item in ipairs(gui:GetDescendants())do
        if item:IsA('TextButton') then
            return item
        end
    end
end

function ResolveDungeonWeapon()
    local mode = _G.DungeonWeaponMode or _G.ChooseWP or 'Melee'

    for _, tool in pairs(plr.Backpack:GetChildren())do
        if tool:IsA('Tool') and tool.ToolTip == mode then
            return tool.Name
        end
    end

    local charTool = plr.Character and plr.Character:FindFirstChildOfClass('Tool')

    if charTool and (charTool.ToolTip == mode or not mode) then
        return charTool.Name
    end

    return _G.SelectWeapon
end

function IsDungeonMobAlive(mob, root, highestFloor)
    if not G.Alive(mob) or not mob:FindFirstChild('HumanoidRootPart') or string.find(mob.Name, 'Blank Buddy') then
        return false
    end
    if root and (mob.HumanoidRootPart.Position - root.Position).Magnitude > 3000 then
        return false
    end
    if highestFloor and highestFloor:FindFirstChild('Root') and (mob.HumanoidRootPart.Position - highestFloor.Root.Position).Magnitude > 2000 then
        return false
    end

    return true
end

function AttackDungeonMob(mob)
    if not mob or not mob:FindFirstChild('HumanoidRootPart') then
        return
    end

    AutoHaki()
    local weapon = ResolveDungeonWeapon()

    if weapon then
        _G.SelectWeapon = weapon
        EquipWeapon(weapon)
    end

    _tp(mob.HumanoidRootPart.CFrame * DungeonAttackOffset)
    G.Kill(mob, _G.AutoAttackMonDungeon)
end

task.spawn(function()
    local angle = 0

    while task.wait() do
        if _G.SpinPosition then
            local radius = _G.SpinRadius or 20
            local y = _G.FarmDistance or 35
            local radian = math.rad(angle)

            DungeonAttackOffset = CFrame.new(math.cos(radian) * radius, y, math.sin(radian) * radius)
            angle = (angle + 30) % 360
        else
            DungeonAttackOffset = CFrame.new(0, _G.FarmDistance or 35, 0)
        end
    end
end)

task.spawn(function()
    while task.wait(0.15) do
        if _G.AutoAttackMonDungeon then
            pcall(function()
                local char = plr.Character
                local root = char and char:FindFirstChild('HumanoidRootPart')
                local highestFloor = GetHighestDungeonFloor()

                if not root or not highestFloor or not highestFloor:FindFirstChild('Root') then
                    return
                end

                local foundMob = false

                for _, mob in pairs(workspace.Enemies:GetChildren())do
                    if IsDungeonMobAlive(mob, root, highestFloor) then
                        foundMob = true

                        repeat
                            task.wait()
                            AttackDungeonMob(mob)
                        until not _G.AutoAttackMonDungeon or not IsDungeonMobAlive(mob, root, highestFloor)
                    end
                end

                if _G.AutoNextFloor and not foundMob then
                    local floor = GetCurrentDungeonFloor()
                    local teleporter = floor and floor:FindFirstChild('ExitTeleporter') and floor.ExitTeleporter:FindFirstChild('Root')

                    if teleporter then
                        firetouchinterest(teleporter, root, 0)
                        firetouchinterest(teleporter, root, 1)
                    end
                elseif (root.Position - highestFloor.Root.Position).Magnitude > 9000 then
                    _tp(highestFloor.Root.CFrame)
                end
            end)
        end
    end
end)

local DungeonNextFloorDebounce = false

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoNextFloor and not DungeonNextFloorDebounce then
            pcall(function()
                local char = plr.Character
                local root = char and char:FindFirstChild('HumanoidRootPart')
                local highestFloor = GetHighestDungeonFloor()
                local floor = GetCurrentDungeonFloor()
                local teleporter = floor and floor:FindFirstChild('ExitTeleporter') and floor.ExitTeleporter:FindFirstChild('Root')

                if not root or not teleporter then
                    return
                end

                local enemiesAlive = false

                for _, mob in pairs(workspace.Enemies:GetChildren())do
                    if IsDungeonMobAlive(mob, root, highestFloor) then
                        enemiesAlive = true

                        break
                    end
                end

                if not enemiesAlive then
                    DungeonNextFloorDebounce = true
                    firetouchinterest(teleporter, root, 0)
                    firetouchinterest(teleporter, root, 1)
                    task.wait(3)
                    DungeonNextFloorDebounce = false
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if _G.AutoReturnToHub then
            pcall(function()
                local dungeonShared = replicated:FindFirstChild('DungeonShared')
                local returnRemote = dungeonShared and dungeonShared:FindFirstChild('ReturnToHub')

                if returnRemote then
                    returnRemote:FireServer()
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoChooseCard then
            pcall(function()
                for _, gui in pairs(plr.PlayerGui:GetChildren())do
                    if gui.Name == 'Gui' and #gui:GetChildren() > 0 then
                        local button = FindDungeonRewardButton(gui)

                        if button then
                            firesignal(button.Activated)
                        end
                    end
                end
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Auto Awakening',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.Auto_Awakener = I
    end,
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Awakener then
                replicated.Remotes.CommF_:InvokeServer('Awakener', 'Check')
                replicated.Remotes.CommF_:InvokeServer('Awakener', 'Awaken')
            end
        end)
    end
end)
Fruit:Section('Fruits Options')

local J5 = {}

function i5(I)
    local e = tostring(I)

    while true do
        e, k = e:gsub('^(-?%d+)(%d%d%d)', '%1,%2')

        if k == 0 then
            break
        end
    end

    return e
end

for I, e in pairs(replicated.Remotes.CommF_:InvokeServer('GetFruits', true))do
    if e.OnSale == true then
        local I = i5(e.Price)
        local K = e.Name

        table.insert(J5, K)
    end
end

local C5 = {}

for I, e in pairs(replicated.Remotes.CommF_:InvokeServer('GetFruits', false))do
    if e.OnSale == true then
        local I = i5(e.Price)
        local K = e.Name

        table.insert(C5, K)
    end
end

Fruit:Dropdown({
    Title = 'Select Fruit Stock',
    Desc = '',
    List = C5,
    Value = false,
    Multi = false,
    Callback = function(I)
        _G.SelectFruit = I
    end,
})
Fruit:Button({
    Title = 'Buy Basic Stock',
    Desc = '',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('PurchaseRawFruit', _G.SelectFruit)
    end,
})
Fruit:Dropdown({
    Title = 'Select Mirage Fruit',
    Desc = '',
    List = J5,
    Value = false,
    Multi = false,
    Callback = function(I)
        SelectF_Adv = I
    end,
})

local M5 = {}

for I, e in pairs(replicated.Remotes.CommF_:InvokeServer('GetFruits', false))do
    if e.OnSale == true then
        local I = i5(e.Price)
        local K = e.Name

        table.insert(M5, K)
    end
end

Fruit:Button({
    Title = 'Buy Mirage Stock',
    Desc = '',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('PurchaseRawFruit', SelectF_Adv)
    end,
})
Fruit:Toggle({
    Title = 'Auto Random Fruit',
    Desc = 'Automatic random devil fruit',
    Value = GetSetting('AutoRandomFruit_Save', false),
    Callback = function(I)
        _G.Random_Auto = I
        _G.SaveData.AutoRandomFruit_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Random_Auto then
                replicated.Remotes.CommF_:InvokeServer('Cousin', 'Buy')
            end
        end)
    end
end)
Get:Toggle({
    Title = 'Auto Drop Fruit',
    Desc = 'Automatic drop devil fruit',
    Value = false,
    Callback = function(I)
        _G.DropFruit = I
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.DropFruit then
            pcall(function()
                DropFruits()
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Auto Store Fruit',
    Desc = 'Automatic store devil fruit',
    Value = GetSetting('AutoStoreFruit_Save', false),
    Callback = function(I)
        _G.StoreF = I
        _G.SaveData.AutoStoreFruit_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.StoreF then
            pcall(function()
                UpdStFruit()
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Auto Tween to Fruit',
    Desc = 'Automatic tween to get devil fruit',
    Value = GetSetting('AutoTweenFruit_Save', false),
    Callback = function(I)
        _G.TwFruits = I
        _G.SaveData.AutoTweenFruit_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.TwFruits then
            pcall(function()
                for I, e in pairs(workspace:GetChildren())do
                    if string.find(e.Name, 'Fruit') then
                        _tp(e.Handle.CFrame)
                    end
                end
            end)
        end
    end
end)
Fruit:Toggle({
    Title = 'Auto Collect Fruit',
    Desc = 'Automatic bring devil fruit',
    Value = GetSetting('AutoCollectFruit_Save', false),
    Callback = function(I)
        _G.InstanceF = I
        _G.SaveData.AutoCollectFruit_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.InstanceF then
            pcall(function()
                collectFruits(_G.InstanceF)
            end)
        end
    end
end)
