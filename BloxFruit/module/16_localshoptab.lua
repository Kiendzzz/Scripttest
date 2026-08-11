Shop:Section('Fighting Shop')
Shop:Button({
    Title = 'Black Leg',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyBlackLeg')
    end,
})
Shop:Button({
    Title = 'Fishman Karate',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyFishmanKarate')
    end,
})
Shop:Button({
    Title = 'Electro',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectro')
    end,
})
Shop:Button({
    Title = 'Dragon Breath',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '1')
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '2')
    end,
})
Shop:Button({
    Title = 'SuperHuman',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySuperhuman')
    end,
})
Shop:Button({
    Title = 'Death Step',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDeathStep')
    end,
})
Shop:Button({
    Title = 'Sharkman Karate',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate', true)
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySharkmanKarate')
    end,
})
Shop:Button({
    Title = 'Electric Claw',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyElectricClaw')
    end,
})
Shop:Button({
    Title = 'Dragon Talon',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyDragonTalon')
    end,
})
Shop:Button({
    Title = 'God Human',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyGodhuman')
    end,
})
Shop:Button({
    Title = 'Sanguine Art',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySanguineArt', true)
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuySanguineArt')
    end,
})
Shop:Section('Sword')
Shop:Button({
    Title = 'Cutlass [ 1,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Cutlass')
    end,
})
Shop:Button({
    Title = 'Katana [ 1,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Katana')
    end,
})
Shop:Button({
    Title = 'Iron Mace [ 25,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Iron Mace')
    end,
})
Shop:Button({
    Title = 'Dual Katana [ 12,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Duel Katana')
    end,
})
Shop:Button({
    Title = 'Triple Katana [ 60,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Triple Katana')
    end,
})
Shop:Button({
    Title = 'Pipe [ 100,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Pipe')
    end,
})
Shop:Button({
    Title = 'Dual-Headed Blade [ 400,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Dual-Headed Blade')
    end,
})
Shop:Button({
    Title = 'Bisento [ 1,200,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Bisento')
    end,
})
Shop:Button({
    Title = 'Soul Cane [ 750,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Soul Cane')
    end,
})
Shop:Button({
    Title = 'Pole v.2 [ 5,000 Fragments ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ThunderGodTalk')
    end,
})
Shop:Section('Gun')
Shop:Button({
    Title = 'Slingshot [ 5,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Slingshot')
    end,
})
Shop:Button({
    Title = 'Musket [ 8,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Musket')
    end,
})
Shop:Button({
    Title = 'Flintlock [ 10,500 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Flintlock')
    end,
})
Shop:Button({
    Title = 'Refined Slingshot [ 30,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Refined Flintlock')
    end,
})
Shop:Button({
    Title = 'Refined Flintlock [ 65,000 Beli ]',
    Callback = function()
        local args = {
            [1] = 'BuyItem',
            [2] = 'Refined Flintlock',
        }

        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(args))
    end,
})
Shop:Button({
    Title = 'Cannon [ 100,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Cannon')
    end,
})
Shop:Button({
    Title = 'Kabucha [ 1,500 Fragments]',
    Callback = function()
        local Remote = game:GetService('ReplicatedStorage').Remotes.CommF_

        Remote:InvokeServer('BlackbeardReward', 'Slingshot', '1')
        Remote:InvokeServer('BlackbeardReward', 'Slingshot', '2')
    end,
})
Shop:Button({
    Title = 'Bizarre Rifle [ 250 Ectoplasm ]',
    Callback = function()
        local Remote = game:GetService('ReplicatedStorage').Remotes.CommF_
        local args = {
            'Ectoplasm',
            'Buy',
            1,
        }

        Remote:InvokeServer(unpack(args))
        Remote:InvokeServer(unpack(args))
    end,
})
Shop:Section('Abilities Shop')
Shop:Button({
    Title = 'Skyjump [ $10,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Geppo')
    end,
})
Shop:Button({
    Title = 'Buso Haki [ $25,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Buso')
    end,
})
Shop:Button({
    Title = 'Observation haki [ $750,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('KenTalk', 'Buy')
    end,
})
Shop:Button({
    Title = 'Soru [ $100,000 Beli ]',
    Callback = function()
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Soru')
    end,
})
Shop:Section('Misc Shop')
Shop:Button({
    Title = 'Buy Refund Stat (2500F)',
    Callback = function()
        local Remote = game:GetService('ReplicatedStorage').Remotes.CommF_

        Remote:InvokeServer('BlackbeardReward', 'Refund', '1')
        Remote:InvokeServer('BlackbeardReward', 'Refund', '2')
    end,
})
Shop:Button({
    Title = 'Buy Reroll Race (3000F)',
    Callback = function()
        local Remote = game:GetService('ReplicatedStorage').Remotes.CommF_

        Remote:InvokeServer('BlackbeardReward', 'Reroll', '1')
        Remote:InvokeServer('BlackbeardReward', 'Reroll', '2')
    end,
})
Shop:Button({
    Title = 'Buy Draco',
    Callback = function()
        topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))

        local targetPosition = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        repeat
            wait()
        until (character.HumanoidRootPart.Position - targetPosition).Magnitude < 1

        local args = {
            [1] = {
                NPC = 'Dragon Wizard',
                Command = 'DragonRace',
            },
        }

        game:GetService('ReplicatedStorage').Modules.Net:FindFirstChild('RF/InteractDragonQuest'):InvokeServer(unpack(args))
    end,
})
Shop:Button({
    Title = 'Buy Ghoul Race',
    Callback = function()
        local args = {
            [1] = 'Ectoplasm',
            [2] = 'Change',
            [3] = 4,
        }

        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(args))
    end,
})
Shop:Button({
    Title = 'Buy Cyborg Race (2500F)',
    Callback = function()
        local args = {
            [1] = 'CyborgTrainer',
            [2] = 'Buy',
        }

        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(args))
    end,
})
