Player:Section('PVP / Aimbot / Movement')

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local O5 = {}

for _, p in pairs(Players:GetPlayers())do
    if p.Name ~= LocalPlayer.Name then
        table.insert(O5, p.Name)
    end
end

local PlayerDropdown = Player:Dropdown({
    Title = 'Select Players',
    Desc = '',
    List = O5,
    Value = nil,
    Multi = false,
    Callback = function(I)
        _G.PlayersList = I
    end,
})

Player:Button({
    Title = 'Refresh Player List',
    Desc = '',
    Callback = function()
        local NewPlayers = {}

        for _, p in pairs(Players:GetPlayers())do
            if p.Name ~= LocalPlayer.Name then
                table.insert(NewPlayers, p.Name)
            end
        end

        PlayerDropdown:Refresh(NewPlayers, true)
    end,
})
Player:Toggle({
    Title = 'Teleport to Player',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.TpPly = I

        spawn(function()
            pcall(function()
                while _G.TpPly do
                    wait()
                    _tp((game:GetService('Players'))[_G.PlayersList].Character.HumanoidRootPart.CFrame)
                end
            end)
        end)
    end,
})
Player:Toggle({
    Title = 'Spectate Choose Players',
    Desc = '',
    Value = false,
    Callback = function(I)
        SpectatePlys = I

        spawn(function()
            repeat
                task.wait(0.1)

                workspace.Camera.CameraSubject = ((game:GetService('Players')):FindFirstChild(_G.PlayersList)).Character.Humanoid
            until not SpectatePlys

            workspace.Camera.CameraSubject = plr.Character.Humanoid
        end)
    end,
})
Player:Section('Aimbot')
Player:Toggle({
    Title = 'Aimbot Cam Lock',
    Desc = '',
    Value = false,
    Callback = function(I)
        _G.AimCam = I
    end,
})
task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.AimCam then
                local I = workspace.CurrentCamera

                closestplayer = function()
                    local I = math.huge
                    local e = nil

                    for K, n in next, ply:GetPlayers()do
                        if n ~= plr then
                            if n.Character and (n.Character:FindFirstChild('Head') and (_G.AimCam and n.Character.Humanoid.Health > 0)) then
                                local K = (n.Character.Head.Position - plr.Character.Head.Position).Magnitude

                                if K < I then
                                    I = K
                                    e = n
                                end
                            end
                        end
                    end

                    return e
                end

                repeat
                    task.wait()

                    I.CFrame = CFrame.new(I.CFrame.Position, (closestplayer()).Character.HumanoidRootPart.Position)
                until _G.AimCam == false or Mag > dist
            end
        end)
    end
end)

local SilentAim_Enabled = false

Player:Toggle({
    Title = 'Aimbot Skills',
    Desc = '',
    Value = false,
    Callback = function(state)
        SilentAim_Enabled = state
    end,
})

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local RS = game:GetService('ReplicatedStorage')
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local PredictionEnabled = true
local PredictionAmount = 0.1
local maxRange = 1000
local renderConnection = nil
local currentTool = nil
local PlayersPosition = nil
local Selectedplayer = nil
local characterConnections = {}

function getHRP(model)
    return model and model:FindFirstChild('HumanoidRootPart')
end
function clearConnections()
    for _, c in ipairs(characterConnections)do
        pcall(function()
            c:Disconnect()
        end)
    end

    characterConnections = {}
end
function isEnemy(plr)
    if not plr or plr == player then
        return false
    end
    if not player.Team or not plr.Team then
        return true
    end

    return player.Team ~= plr.Team
end
function getPredictedPosition(hrp)
    if not hrp then
        return nil
    end

    local hum = hrp.Parent:FindFirstChildWhichIsA('Humanoid')

    if not hum or not PredictionEnabled or hum.WalkSpeed < 5 then
        return hrp.Position
    end

    return hrp.Position + (hrp.Velocity * PredictionAmount)
end
function getClosestPlayer(lpHRP)
    local closest, dist = nil, math.huge

    for _, plr in ipairs(Players:GetPlayers())do
        if isEnemy(plr) and plr.Character then
            local hum = plr.Character:FindFirstChildWhichIsA('Humanoid')
            local hrp = getHRP(plr.Character)

            if hum and hum.Health > 0 and hrp then
                local d = (hrp.Position - lpHRP.Position).Magnitude

                if d < dist and d <= maxRange then
                    dist = d
                    closest = plr
                end
            end
        end
    end

    return closest
end
function isSkillReadyForTool(toolName)
    if not toolName then
        return false
    end

    local gui = player:FindFirstChild('PlayerGui')

    if not gui then
        return false
    end

    local skills = gui:FindFirstChild('Main') and gui.Main:FindFirstChild('Skills')

    if not skills then
        return false
    end

    local tool = skills:FindFirstChild(toolName)

    if not tool then
        return false
    end

    for _, key in ipairs({
        'Z',
        'X',
        'C',
        'V',
    })do
        local skill = tool:FindFirstChild(key)

        if skill and skill:FindFirstChild('Cooldown') then
            if skill.Cooldown.Size.X.Scale == 1 then
                return true
            end
        end
    end

    return false
end
function startRender()
    if renderConnection then
        return
    end

    renderConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
        if not SilentAim_Enabled then
            return
        end

        local char = player.Character
        local hrp = char and getHRP(char)

        if not hrp then
            return
        end

        local target = Selectedplayer or getClosestPlayer(hrp)

        if not (target and target.Character) then
            PlayersPosition = nil

            return
        end

        local thrp = getHRP(target.Character)

        if not thrp then
            return
        end

        PlayersPosition = getPredictedPosition(thrp)

        if currentTool and isSkillReadyForTool(currentTool.Name) then
            local look = (Vector3.new(PlayersPosition.X, hrp.Position.Y, PlayersPosition.Z) - hrp.Position).Unit

            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + look)
        end
    end))
end
function stopRender()
    if renderConnection then
        renderConnection:Disconnect()

        renderConnection = nil
    end
end

player.CharacterAdded:Connect(function(char)
    clearConnections()
    table.insert(characterConnections, char.ChildAdded:Connect(function(obj)
        if obj:IsA('Tool') then
            currentTool = obj
        end
    end))
end)
pcall(function()
    local mt = getrawmetatable(game)

    setreadonly(mt, false)

    local old = mt.__namecall

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if (method == 'FireServer' or method == 'InvokeServer') and SilentAim_Enabled and PlayersPosition and typeof(args[1]) == 'Vector3' then
            args[1] = PlayersPosition

            return old(self, unpack(args))
        end

        return old(self, ...)
    end)

    setreadonly(mt, true)
end)
RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
    if SilentAim_Enabled then
        startRender()
    else
        stopRender()
    end
end))
Player:Section('Speed/Jump')

local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local plr = Players.LocalPlayer
local humanoid = plr.Character and plr.Character:FindFirstChildOfClass('Humanoid') or nil

plr.CharacterAdded:Connect(function(char)
    humanoid = char:WaitForChild('Humanoid')
end)

local SpeedEnabled = false
local JumpEnabled = false
local desiredSpeed = 16
local desiredJump = 50

function protectSpeed()
    if humanoid then
        humanoid:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
            if SpeedEnabled and humanoid.WalkSpeed ~= desiredSpeed then
                humanoid.WalkSpeed = desiredSpeed
            end
        end)
    end
end
function applyStats()
    if humanoid then
        if SpeedEnabled then
            humanoid.WalkSpeed = desiredSpeed
        end
        if JumpEnabled then
            humanoid.JumpPower = desiredJump
        end
    end
end

RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
    if humanoid then
        if SpeedEnabled and humanoid.WalkSpeed ~= desiredSpeed then
            humanoid.WalkSpeed = desiredSpeed
        end
        if JumpEnabled and humanoid.JumpPower ~= desiredJump then
            humanoid.JumpPower = desiredJump
        end
    end
end))
plr.CharacterAdded:Connect(function(char)
    humanoid = char:WaitForChild('Humanoid')

    protectSpeed()
end)
protectSpeed()
Player:Toggle({
    Title = 'Set WalkSpeed',
    Desc = 'Enable custom WalkSpeed',
    Value = false,
    Callback = function(Value)
        SpeedEnabled = Value

        applyStats()
    end,
})
Player:Slider({
    Title = 'WalkSpeed Value',
    Desc = 'Enter desired speed',
    Min = 0,
    Max = 200,
    Rounding = 0,
    Value = desiredSpeed or 16,
    Callback = function(Value)
        desiredSpeed = Value
        applyStats()
    end,
})
Player:Toggle({
    Title = 'Set JumpPower',
    Desc = 'Enable custom JumpPower',
    Value = false,
    Callback = function(Value)
        JumpEnabled = Value

        applyStats()
    end,
})
Player:Slider({
    Title = 'JumpPower Value',
    Desc = 'Enter desired jump power',
    Min = 0,
    Max = 200,
    Rounding = 0,
    Value = desiredJump or 50,
    Callback = function(Value)
        desiredJump = Value
        applyStats()
    end,
})
Player:Section('LocalPlayer Settings / Misc')
Player:Toggle({
    Title = 'Instance Mink V3 [ INF ]',
    Desc = 'Turn on for make mink v3 infinity',
    Value = false,
    Callback = function(I)
        InfAblities = I
    end,
})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if InfAblities then
                if not plr.Character.HumanoidRootPart:FindFirstChild('Agility') then
                    local I = replicated.FX.Agility:Clone()

                    I.Name = 'Agility'
                    I.Parent = plr.Character.HumanoidRootPart
                end
            else
                plr.Character.HumanoidRootPart.Agility:Destroy()
            end
        end)
    end
end)
Player:Toggle({
    Title = 'Instance Energy [ INF ]',
    Desc = 'Turn on for make energy infinity',
    Value = false,
    Callback = function(I)
        infEnergy = I

        if I then
            getInfinity_Ability('Energy', infEnergy)
        end
    end,
})
Player:Toggle({
    Title = 'Instance Soru [ INF ]',
    Desc = 'Turn on for make soru infinity',
    Value = false,
    Callback = function(I)
        _G.InfSoru = I

        if I then
            getInfinity_Ability('Soru', _G.InfSoru)
        end
    end,
})
Player:Toggle({
    Title = 'Instance Observation Range [ INF ]',
    Desc = 'Turn on for make observation range infinity',
    Value = false,
    Callback = function(I)
        _G.InfiniteObRange = I

        if I then
            getInfinity_Ability('Observation', _G.InfiniteObRange)
        end
    end,
})
Player:Section('Settings Combat / Aimbot Settings')
Player:Toggle({
    Title = 'Ignore Same Teams',
    Desc = 'Turn on for ignore not aimbot same team',
    Value = false,
    Callback = function(I)
        _G.NoAimTeam = I
    end,
})
Player:Toggle({
    Title = 'Accept Allies',
    Desc = 'Turn on for auto accept ally',
    Value = false,
    Callback = function(I)
        _G.AcceptAlly = I
    end,
})
spawn(function()
    while wait(Sec) do
        if _G.AcceptAlly then
            pcall(function()
                for I, e in pairs(ply:GetChildren())do
                    if e.Name ~= plr.Name and (e:FindFirstChild('Humanoid') and e:FindFirstChild('HumanoidRootPart')) then
                        ((replicated:WaitForChild('Remotes')):WaitForChild('CommF_')):InvokeServer('AcceptAlly', e.Name)
                    end
                end
            end)
        end
    end
end)
