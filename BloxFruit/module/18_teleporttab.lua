Teleport:Section('Travel - Worlds')
Teleport:Button({
    Title = 'Teleport Sea 1',
    Desc = '',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('TravelMain')
    end,
})
Teleport:Button({
    Title = 'Teleport Sea 2',
    Desc = '',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('TravelDressrosa')
    end,
})
Teleport:Button({
    Title = 'Teleport Sea 3',
    Desc = '',
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer('TravelZou')
    end,
})
Teleport:Section('Travel - Island')

Location = {}

for _, e in pairs(workspace._WorldOrigin.Locations:GetChildren())do
    table.insert(Location, e.Name)
end

Teleport:Dropdown({
    Title = 'Select Travelling',
    Desc = '',
    List = Location,
    Value = false,
    Multi = false,
    Callback = function(I)
        _G.Island = I
    end,
})
Teleport:Toggle({
    Title = 'Auto Travel',
    Desc = '',
    Value = false,
    Callback = function(Value)
        _G.Teleport = Value

        if Value then
            local targetIsland = workspace._WorldOrigin.Locations:FindFirstChild(_G.Island)

            if targetIsland then
                spawn(function()
                    Root.CFrame = Root.CFrame * CFrame.new(0, 700, 0)

                    wait(0.1)

                    local destination = targetIsland.CFrame * CFrame.new(0, 700, 0)

                    repeat
                        wait()
                        _tp(destination)
                    until not _G.Teleport or (Root.Position - destination.p).Magnitude < 10

                    if _G.Teleport then
                        Root.CFrame = targetIsland.CFrame * CFrame.new(0, 5, 0)
                    end

                    _G.Teleport = false
                end)
            else
                print('Selecione uma ilha primeiro!')

                _G.Teleport = false
            end
        end
    end,
})
Teleport:Section('Travel - Portal')

if World1 then
    Location_Portal = {
        'Sky',
        'UnderWater',
    }
elseif World2 then
    Location_Portal = {
        'SwanRoom',
        'Cursed Ship',
    }
elseif World3 then
    Location_Portal = {
        'Castle On The Sea',
        'Mansion Cafe',
        'Hydra Teleport',
        'Canvendish Room',
        'Temple of Time',
    }
end

Teleport:Dropdown({
    Title = 'Select Portal',
    Desc = '',
    List = Location_Portal,
    Value = false,
    Multi = false,
    Callback = function(I)
        _G.Island_PT = I
    end,
})
Teleport:Button({
    Title = 'Request Entrance',
    Desc = '',
    Callback = function()
        if _G.Island_PT == 'Sky' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-7894, 5547, -380))
        elseif _G.Island_PT == 'UnderWater' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(61163, 11, 1819))
        elseif _G.Island_PT == 'SwanRoom' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(2285, 15, 905))
        elseif _G.Island_PT == 'Cursed Ship' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(923, 126, 32852))
        elseif _G.Island_PT == 'Castle On The Sea' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743E-8, 0.914313197, -1.9094333199999998E-8, 1, 3.8755778999999997e-8, -0.914313197, -1.76180437E-9, -0.405007899))
        elseif _G.Island_PT == 'Mansion Cafe' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        elseif _G.Island_PT == 'Hydra Teleport' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(5643.4526367188, 1013.0858154297, -340.51025390625))
        elseif _G.Island_PT == 'Canvendish Room' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(5314.5463867188, 22.562219619751, -127.06755065918))
        elseif _G.Island_PT == 'Temple of Time' then
            replicated.Remotes.CommF_:InvokeServer('requestEntrance', Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132E-8, -0.882831335, -3.23509219E-8, 1, -1.51411736E-8, 0.882831335, 2.1448748600000003e-8, -0.469690144))
        end
    end,
})
Teleport:Section('Travel - NPCs')

for I, e in pairs(replicated.NPCs:GetChildren())do
    table.insert(NPCList, e.Name)
end

Teleport:Dropdown({
    Title = 'Select NPCs',
    Desc = '',
    List = NPCList,
    Value = false,
    Multi = false,
    Callback = function(I)
        NPClist = I
    end,
})
Teleport:Toggle({
    Title = 'Auto Tween to NPCs',
    Desc = 'Automatic teleport to pos Npcs',
    Value = false,
    Callback = function(I)
        _G.TPNpc = I
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.TPNpc then
            pcall(function()
                for I, e in pairs(replicated.NPCs:GetChildren())do
                    if e.Name == NPClist then
                        _tp(e.HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
