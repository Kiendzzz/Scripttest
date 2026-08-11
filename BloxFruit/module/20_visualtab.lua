
local _sTroll = Visual:Section(T('visual.sec_troll'))
RL(function() _sTroll.Text = ' ' .. T('visual.sec_troll') end)

Visual:Button({
    Title = T('visual.rain_fruit'),
    Desc  = T('visual.rain_fruit_desc'),
    Callback = function()
        for h, i in pairs((game:GetObjects("rbxassetid://14759368201"))[1]:GetChildren()) do
            i.Parent = game.Workspace.Map
            i:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
            if i.Fruit:FindFirstChild("AnimationController") then
                ((i.Fruit:FindFirstChild("AnimationController")):LoadAnimation(i.Fruit:FindFirstChild("Idle"))):Play()
            end
            i.Handle.Touched:Connect(function(cR)
                if cR.Parent == game.Players.LocalPlayer.Character then
                    i.Parent = game.Players.LocalPlayer.Backpack
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(i)
                end
            end)
        end
    end,
})

Visual:Button({
    Title = T('visual.attract_ball'),
    Desc  = T('visual.attract_ball_desc'),
    Callback = function()
        local RS   = game:GetService("ReplicatedStorage")
        local plr  = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp  = char:WaitForChild("HumanoidRootPart")

        require(RS.Effect.Container.tensei)({
            char     = char,
            target   = char,
            targetCF = hrp.CFrame * CFrame.new(0, 67, 0),
            max      = math.huge,
        })
    end,
})

local _sAnim = Visual:Section(T('visual.sec_animation'))
RL(function() _sAnim.Text = ' ' .. T('visual.sec_animation') end)

Visual:Button({
    Title = T('visual.meteorite'),
    Desc  = T('visual.meteorite_desc'),
    Callback = function()
        local P   = game:GetService("Players").LocalPlayer
        local C   = P.Character or P.CharacterAdded:Wait()
        local R   = C:WaitForChild("HumanoidRootPart")
        local pos = R.Position + R.CFrame.LookVector * 15
        local hit = workspace:Raycast(pos + Vector3.yAxis * 20, Vector3.yAxis * -100)

        if hit then pos = hit.Position end

        local h   = Instance.new("BoolValue", C)
        h.Name    = "Holding"
        h.Value   = true

        pcall(require(game.ReplicatedStorage.Effect.Container.Gravity.V), {
            Stage          = 4,
            Root           = R,
            Origin         = R.Position,
            Caster         = P,
            Character      = C,
            TargetPosition = pos,
            CanUltimate    = true,
            NightShift     = true,
            CaughtCutscene = {P},
            CaughtLighting = {P},
            Holding        = h,
        })

        task.delay(15, function() h:Destroy() end)
    end,
})

Visual:Button({
    Title = T('visual.view_leviathan'),
    Desc  = T('visual.view_leviathan_desc'),
    Callback = function()
        local Players = game:GetService("Players")
        local plr     = Players.LocalPlayer
        local char    = plr.Character or plr.CharacterAdded:Wait()
        local hrp     = char:WaitForChild("HumanoidRootPart")
        local folder  = plr.PlayerScripts:WaitForChild("LeviathanCinematicc")
        local cine    = require(folder.Intro)()
        local offset  = hrp.Position + hrp.CFrame.LookVector * 120

        for _, v in ipairs(workspace:GetChildren()) do
            if v.Name:match("Leviathan") then
                local root = v:FindFirstChild("RootPart")
                if root then v:PivotTo(CFrame.new(offset)) end
            end
        end

        cine:Play()
        task.delay(14, function() cine:Destroy() end)
    end,
})

Visual:Button({
    Title = T('visual.view_indra'),
    Desc  = T('visual.view_indra_desc'),
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        local cp = game:GetService("ContentProvider")

        task.spawn(function()
            pcall(function()
                cp:PreloadAsync({ rs.Effect.Container.IndraCutscene })
            end)
        end)

        require(rs.Effect.Container.IndraCutscene)()
    end,
})
