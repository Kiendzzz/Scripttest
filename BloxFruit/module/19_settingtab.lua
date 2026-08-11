local _sLang = Setting:Section(T('setting.sec_language'))
RL(function() _sLang.Text = ' ' .. T('setting.sec_language') end)

local _LangDisplayList = {'Vietnamese', 'English'}
local _LangCodeMap = {['Vietnamese'] = 'vi', ['English'] = 'en'}
local _LangNameMap = {vi = 'Vietnamese', en = 'English'}

local _dLang = Setting:Dropdown({
    Title = T('setting.sel_lang'),
    Desc = T('setting.sel_lang_desc'),
    List = _LangDisplayList,
    Value = _LangNameMap[_G.LangCode] or 'Vietnamese',
    Multi = false,
    Callback = function(I)
        local code = _LangCodeMap[I]
        if code then
            ApplyLanguage(code)
        end
    end,
})
RL(function()
    _dLang.Title = T('setting.sel_lang')
end)

local _sManualSave = Setting:Section(T('setting.sec_manual_save'))
RL(function() _sManualSave.Text = ' ' .. T('setting.sec_manual_save') end)

Setting:Button({
    Title = T('setting.save_config'),
    Desc = '',
    Callback = function()
        if SaveSettings then
            SaveSettings()
            Library:Notify({Title = "Apple Hub", Message = T('common.saved'), Duration = 5})
        else
            warn('Error Quynh Anh Not Found =))')
        end
    end,
})
Setting:Button({
    Title = T('setting.reset_config'),
    Desc = '',
    Callback = function()
        if isfile and isfile(FullPath) then
            delfile(FullPath)
            _G.SaveData = {}
            Library:Notify({Title = "Apple Hub", Message = "Reset Config Done!", Duration = 5})
        else
            Library:Notify({Title = "Apple Hub", Message = "Reset Config Done!", Duration = 5})
        end
    end,
})

local _sFont = Setting:Section(T('setting.sec_font'))
RL(function() _sFont.Text = ' ' .. T('setting.sec_font') end)

local currentFont = Enum.Font.Oswald

function ApplyGlobalFont(fontEnum)
    currentFont = fontEnum

    for _, obj in ipairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())do
        if obj:IsA('TextLabel') or obj:IsA('TextButton') or obj:IsA('TextBox') then
            obj.Font = fontEnum
        end
    end
end

game.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(function(obj)
    if obj:IsA('TextLabel') or obj:IsA('TextButton') or obj:IsA('TextBox') then
        obj.Font = currentFont
    end
end)

Setting:Button({
    Title = T('setting.font_amatic_sc'),
    Desc = '',
    Callback = function()
        ApplyGlobalFont(Enum.Font.AmaticSC)
    end,
})

Setting:Button({
    Title = T('setting.font_antique'),
    Desc = '',
    Callback = function()
        ApplyGlobalFont(Enum.Font.Antique)
    end,
})

Setting:Button({
    Title = T('setting.font_arcade'),
    Desc = '',
    Callback = function()
        ApplyGlobalFont(Enum.Font.Arcade)
    end,
})

Setting:Button({
    Title = T('setting.font_arial'),
    Desc = '',
    Callback = function()
        ApplyGlobalFont(Enum.Font.Arial)
    end,
})

Setting:Button({
    Title = T('setting.font_arial_bold'),
    Desc = '',
    Callback = function()
        ApplyGlobalFont(Enum.Font.ArialBold)
    end,
})

local _sSettingFarm = Setting:Section(T('setting.sec_setting_farm'))
RL(function() _sSettingFarm.Text = ' ' .. T('setting.sec_setting_farm') end)
Setting:Button({
    Title = T('setting.stop_tween'),
    Desc = T('setting.stop_tween_desc'),
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character

        if not char then
            return
        end

        local hrp = char:FindFirstChild('HumanoidRootPart')
        local hum = char:FindFirstChild('Humanoid')

        shouldTween = false

        if hrp then
            hrp.Anchored = false

            for _, v in pairs(hrp:GetChildren())do
                if v:IsA('BodyVelocity') or v:IsA('BodyPosition') or v:IsA('BodyGyro') then
                    v:Destroy()
                end
            end
        end
        if hum then
            hum.PlatformStand = false
            hum.Sit = false
            hum.WalkSpeed = 16
            hum.JumpPower = 50
            hum.AutoRotate = true

            hum:ChangeState(Enum.HumanoidStateType.Running)
        end

        getgenv().OnFarm = true

        task.wait()

        shouldTween = true
    end,
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local plr = Players.LocalPlayer
local _VFX_TICK = 0.5

Setting:Toggle({
    Title = "Remove Hit VFX",
    Desc = "Destroys slash and hit visual effects (SlashHit, CurvedRing, SwordSlash, SlashTail) to improve performance",
    Value = false,
    Callback = function(Value)
        _G.DistroyHit = Value
    end
})

task.spawn(function()
    while task.wait(_VFX_TICK) do
        if _G.DistroyHit then
            pcall(function()
                local __Effect = {"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}
                for _, x in pairs(workspace["_WorldOrigin"]:GetChildren()) do
                    if table.find(__Effect, x.Name) then
                        x:Destroy()
                    end
                end
            end)
        end
    end
end)

Setting:Toggle({
    Title = "Remove Death & Respawn VFX",
    Desc = "Removes death and respawn visual effects from your screen to reduce screen clutter",
    Value = false,
    Callback = function(Value)
        _G.RDeath = Value
    end
})

task.spawn(function()
    while task.wait(_VFX_TICK) do
        pcall(function()
            if _G.RDeath then
                local effectContainer = ReplicatedStorage:FindFirstChild("Effect") and ReplicatedStorage.Effect:FindFirstChild("Container")
                
                if effectContainer then
                    if effectContainer:FindFirstChild("Death") then
                        effectContainer.Death:Destroy()
                    end
                    if effectContainer:FindFirstChild("Respawn") then
                        effectContainer.Respawn:Destroy()
                    end
                end
            end
        end)
    end
end)

Setting:Toggle({
    Title = "Disable Notify",
    Desc = "Disables the damage counter and all in-game notifications for a cleaner UI experience",
    Value = false,
    Callback = function(Value)
        _G.RemoveDamage = Value
    end
})

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local damageCounter = ReplicatedStorage:FindFirstChild("Assets") and ReplicatedStorage.Assets:FindFirstChild("GUI") and ReplicatedStorage.Assets.GUI:FindFirstChild("DamageCounter")
            local notifications = plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("Notifications")

            if _G.RemoveDamage then
                if damageCounter then damageCounter.Enabled = false end
                if notifications then notifications.Enabled = false end
            else
                if damageCounter then damageCounter.Enabled = true end
                if notifications then notifications.Enabled = true end
            end
        end)
    end
end)

Setting:Toggle({
    Title = 'Safe Mode',
    Desc = 'Enable to protect your health when it is low.',
    Value = GetSetting('SafeMode_Save', false),
    Callback = function(I)
        _G.Safemode = I
        _G.SaveData.SafeMode_Save = I

        SaveSettings()
    end,
})
Setting:Toggle({
    Title = 'Auto Active Haki',
    Desc = 'Auto activate haki',
    Value = GetSetting('AutoHaki_Save', true),
    Callback = function(I)
        Boud = I
        _G.SaveData.AutoHaki_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            if Boud then
                local I = {
                    'HasBuso',
                    'Buso',
                }

                if not plr.Character:FindFirstChild(I[1]) then
                    replicated.Remotes.CommF_:InvokeServer(I[2])
                end
            end
        end)
    end
end)
Setting:Toggle({
    Title = 'Auto Active V3',
    Desc = 'Auto use v3',
    Value = GetSetting('AutoActiveV3_Save', false),
    Callback = function(I)
        _G.RaceClickAutov3 = I
        _G.SaveData.AutoActiveV3_Save = I

        SaveSettings()
    end,
})
Setting:Toggle({
    Title = 'Auto Active V4',
    Desc = 'Auto use v4',
    Value = GetSetting('AutoActiveV4_Save', false),
    Callback = function(I)
        _G.RaceClickAutov4 = I
        _G.SaveData.AutoActiveV4_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.RaceClickAutov3 then
                repeat
                    replicated.Remotes.CommE:FireServer('ActivateAbility')
                    wait(30)
                until not _G.RaceClickAutov3
            end
        end)
    end
end)
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.RaceClickAutov4 then
                if plr.Character:FindFirstChild('RaceEnergy') then
                    if (plr.Character:FindFirstChild('RaceEnergy')).Value == 1 then
                        Useskills('nil', 'Y')
                    end
                end
            end
        end)
    end
end)
Setting:Toggle({
    Title = 'Anti AFK',
    Desc = 'Anti AFK kick',
    Value = true,
    Callback = function(I)
        _G.AntiAFK = I
    end,
})
plr.Idled:connect(function()
    vim2:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vim2:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
Setting:Toggle({
    Title = 'Disable Notify',
    Desc = 'Disable notifications',
    Value = GetSetting('DisableNotify_Save', false),
    Callback = function(I)
        RemoveDamage = I
        _G.SaveData.DisableNotify_Save = I

        SaveSettings()
    end,
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            if RemoveDamage then
                replicated.Assets.GUI.DamageCounter.Enabled = false
                plr.PlayerGui.Notifications.Enabled = false
            else
                replicated.Assets.GUI.DamageCounter.Enabled = true
                plr.PlayerGui.Notifications.Enabled = true
            end
        end)
    end
end)
local _sSelect = Setting:Section(T('setting.sec_select'))
RL(function() _sSelect.Text = ' ' .. T('setting.sec_select') end)
Setting:Slider({
    Title = 'Bring Mob',
    Desc = 'Mon bring range',
    Min = 50,
    Max = 500,
    Rounding = 0,
    Value = _G.BringRange or 250,
    Callback = function(Value)
        _G.BringRange = Value
    end,
})
Setting:Slider({
    Title = 'Select Farm Height',
    Desc = 'Height above mob',
    Min = 0,
    Max = 100,
    Rounding = 0,
    Value = _G.MobHeight or 30,
    Callback = function(Value)
        _G.MobHeight = Value
    end,
})

Setting:Slider({
    Title = 'Tween Speed',
    Desc = 'Tween speed',
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Value = getgenv().TweenSpeedFar or 370,
    Callback = function(Value)
        getgenv().TweenSpeedFar = Value
    end,
})

local _sCodes = Setting:Section(T('setting.sec_codes'))
RL(function() _sCodes.Text = ' ' .. T('setting.sec_codes') end)
Setting:Button({
    Title = 'Redeem All Codes',
    Desc = '',
    Callback = function()
        local Codes = {
            'KITT_RESET',
            'Sub2UncleKizaru',
            'SUB2GAMERROBOT_RESET1',
            'Sub2Fer999',
            'Enyu_is_Pro',
            'JCWK',
            'StarcodeHEO',
            'MagicBus',
            'KittGaming',
            'Sub2CaptainMaui',
            'Sub2OfficalNoobie',
            'TheGreatAce',
            'Sub2NoobMaster123',
            'Sub2Daigrock',
            'Axiore',
            'StrawHatMaine',
            'TantaiGaming',
            'Bluxxy',
            'SUB2GAMERROBOT_EXP1',
            'Chandler',
            'NOMOREHACK',
            'BANEXPLOIT',
            'WildDares',
            'BossBuild',
            'GetPranked',
            'EARN_FRUITS',
            'FIGHT4FRUIT',
            'NOEXPLOITER',
            'NOOB2ADMIN',
            'CODESLIDE',
            'ADMINHACKED',
            'ADMINDARES',
            'fruitconcepts',
            'krazydares',
            'TRIPLEABUSE',
            'SEATROLLING',
            '24NOADMIN',
            'REWARDFUN',
            'NEWTROLL',
            'fudd10_v2',
            'Fudd10',
            'Bignews',
            'SECRET_ADMIN',
        }

        for _, code in ipairs(Codes)do
            pcall(function()
                game:GetService('ReplicatedStorage').Remotes.Redeem:InvokeServer(code)
            end)
        end
    end,
})
local _sTeam = Setting:Section(T('setting.sec_team'))
RL(function() _sTeam.Text = ' ' .. T('setting.sec_team') end)
Setting:Button({
    Title = T('setting.set_pirate'),
    Desc = '',
    Callback = function()
        Pirates()
    end,
})
Setting:Button({
    Title = T('setting.set_marine'),
    Desc = '',
    Callback = function()
        Marines()
    end,
})
local _sOthers = Setting:Section(T('setting.sec_others'))
RL(function() _sOthers.Text = ' ' .. T('setting.sec_others') end)

HakiSt = {
    'State 0',
    'State 1',
    'State 2',
    'State 3',
    'State 4',
    'State 5',
}

Setting:Dropdown({
    Title = 'Haki States',
    Desc = '',
    List = HakiSt,
    Value = false,
    Multi = false,
    Callback = function(I)
        _G.SelectStateHaki = I
    end,
})
Setting:Button({
    Title = 'Change Haki',
    Desc = '',
    Callback = function()
        if _G.SelectStateHaki == 'State 0' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 0)
        elseif _G.SelectStateHaki == 'State 1' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 1)
        elseif _G.SelectStateHaki == 'State 2' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 2)
        elseif _G.SelectStateHaki == 'State 3' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 3)
        elseif _G.SelectStateHaki == 'State 4' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 4)
        elseif _G.SelectStateHaki == 'State 5' then
            replicated.Remotes.CommF_:InvokeServer('ChangeBusoStage', 5)
        end
    end,
})
Setting:Button({
    Title = 'Nofog',
    Desc = '',
    Callback = function()
        if Lighting:FindFirstChild('LightingLayers') then
            Lighting.LightingLayers:Destroy()
        end
        if Lighting:FindFirstChild('SeaTerrorCC') then
            Lighting.SeaTerrorCC:Destroy()
        end
        if Lighting:FindFirstChild('FantasySky') then
            Lighting.FantasySky:Destroy()
        end
    end,
})
Setting:Toggle({
    Title = 'Walk on Water',
    Desc = 'Walk on water',
    Value = true,
    Callback = function(I)
        _G.WalkWater_Part = I

        local e = (game:GetService('Workspace')).Map['WaterBase-Plane']

        if _G.WalkWater_Part then
            e.Size = Vector3.new(1000, 112, 1000)
        else
            e.Size = Vector3.new(1000, 80, 1000)
        end
    end,
})
local _sFps = Setting:Section(T('setting.sec_fps'))
RL(function() _sFps.Text = ' ' .. T('setting.sec_fps') end)

_G.NoAni = _G.NoAni or false

local player = game.Players.LocalPlayer
local AnimConnection

function EnableNoAni(char)
    local humanoid = char:WaitForChild('Humanoid')

    for _, track in pairs(humanoid:GetPlayingAnimationTracks())do
        track:Stop()
    end

    AnimConnection = humanoid.AnimationPlayed:Connect(function(track)
        if _G.NoAni then
            track:Stop()
        end
    end)
end
function DisableNoAni()
    if AnimConnection then
        AnimConnection:Disconnect()

        AnimConnection = nil
    end
end
function SetupChar(char)
    if _G.NoAni then
        EnableNoAni(char)
    end
end

if player.Character then
    SetupChar(player.Character)
end

player.CharacterAdded:Connect(SetupChar)
Setting:Toggle({
    Title = 'No Animation',
    Desc = '',
    Value = GetSetting('NoAni_Save', false),
    Callback = function(I)
        _G.NoAni = I
        _G.SaveData.NoAni_Save = I

        SaveSettings()

        if I then
            if player.Character then
                EnableNoAni(player.Character)
            end
        else
            DisableNoAni()
        end
    end,
})
Setting:Button({
    Title = 'Stretch the screen',
    Desc = '',
    Callback = function()
        getgenv().Resolution = {
            ['.gg/scripters'] = 0.65,
        }

        local Camera = workspace.CurrentCamera

        if getgenv().gg_scripters == nil then
            game:GetService('RunService').RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                pcall(function()
                    Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution['.gg/scripters'], 0, 0, 0, 1)
                end)
            end))
        end

        getgenv().gg_scripters = 'Aori0001'
    end,
})

-- Áp dụng ngôn ngữ đã lưu sau khi toàn bộ UI đã được xây dựng
-- GUI scan sẽ tìm và thay thế tất cả TextLabel khớp với bản dịch
task.delay(0.5, function()
    ApplyLanguage(_G.LangCode)
end)
