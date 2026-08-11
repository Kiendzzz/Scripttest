SeaSettings:Section('Settings Sea Envent')
SeaSettings:Toggle({
    Title = 'Lightning',
    Value = false,
    Callback = function(I)
        _G.Lightning = I
    end,
})
SeaSettings:Toggle({
    Title = 'Increase Speed Boat',
    Value = false,
    Callback = function(I)
        _G.SpeedBoat = I
        _G.IncreaseSpeedBoat = I
    end,
})
SeaSettings:Slider({
    Title = 'Boat Speed Value',
    Desc = 'Default Speed 300',
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Value = _G.SetSpeedBoat or 300,
    Callback = function(I)
        _G.SetSpeedBoat = I
    end,
})
SeaSettings:Toggle({
    Title = 'No Clip Rock',
    Value = false,
    Callback = function(I)
        _G.NoClipRock = I
    end,
})
SeaSettings:Section('Tools')
SeaSettings:Toggle({
    Title = 'Use Devil Fruit Skill',
    Value = true,
    Callback = function(I)
        for _, key in ipairs({'Z', 'X', 'C', 'V', 'F'})do
            _G.SelectedSkills['Blox Fruit'][key] = I
        end
    end,
})
SeaSettings:Toggle({
    Title = 'Use Melee Skill',
    Value = true,
    Callback = function(I)
        for _, key in ipairs({'Z', 'X', 'C'})do
            _G.SelectedSkills.Melee[key] = I
        end
    end,
})
SeaSettings:Toggle({
    Title = 'Use Sword Skill',
    Value = true,
    Callback = function(I)
        for _, key in ipairs({'Z', 'X'})do
            _G.SelectedSkills.Sword[key] = I
        end
    end,
})
SeaSettings:Toggle({
    Title = 'Use Gun Skill',
    Value = true,
    Callback = function(I)
        for _, key in ipairs({'Z', 'X'})do
            _G.SelectedSkills.Gun[key] = I
        end
    end,
})

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if _G.Lightning then
                game:GetService('Lighting').ClockTime = 12
            end
            if _G.NoClipRock or _G.SailBoats then
                for _, boat in pairs(workspace.Boats:GetChildren())do
                    for _, part in pairs(boat:GetDescendants())do
                        if part:IsA('BasePart') then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end
end)
