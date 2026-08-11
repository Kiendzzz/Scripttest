--[[
 █████╗ ██████╗ ██████╗ ██╗     ███████╗    ██╗  ██╗██╗   ██╗██████╗     ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗
██╔══██╗██╔══██╗██╔══██╗██║     ██╔════╝    ██║  ██║██║   ██║██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝
███████║██████╔╝██████╔╝██║     █████╗      ███████║██║   ██║██████╔╝    ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  
██╔══██║██╔═══╝ ██╔═══╝ ██║     ██╔══╝      ██╔══██║██║   ██║██╔══██╗    ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  
██║  ██║██║     ██║     ███████╗███████╗    ██║  ██║╚██████╔╝██████╔╝    ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗
╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
by    888b     d888 d8b               888    888                                   888            
      8888b   d8888 Y8P               888    888                                   888            
      88888b.d88888                   888    888                                   888            
      888Y88888P888 888  .d88b.       8888888888  .d88b.  888d888 888d888 888  888 888888 .d88b.  
      888 Y888P 888 888 d88""88b      888    888 d8P  Y8b 888P"   888P"   888  888 888   d88""88b 
      888  Y8P  888 888 888  888      888    888 88888888 888     888     888  888 888   888  888 
      888   "   888 888 Y88..88P      888    888 Y8b.     888     888     Y88b 888 Y88b. Y88..88P 
      888       888 888  "Y88P"       888    888  "Y8888  888     888      "Y88888  "Y888 "Y88P"  

Main Credits
- Nguyễn Minh Nhật (Mio Herruto)
- APPLE HUB (Blox Fruit) — Language System V2.1 By Mio Herruto
]]

_G.LangUpdaters = {}
_G.AllLangs = {

-- Tiếng Anh
en = {
    common = {
        on = 'ON', off = 'OFF', save = 'Save', cancel = 'Cancel',
        loading = 'Loading...', langApplied = 'Language applied!', saved = 'Saved!'
    },

    pages = {
        status_title = 'Info & Server',       status_desc = 'Player Stats & Server Information',
        farm_title   = 'Tab Farming',         farm_desc   = 'Auto Level, Quests & Boss Farming',
        others_title = 'Stack Farm',          others_desc = 'Combine Multiple Farming Tasks',
        mastery_title= 'Farm Mastery',        mastery_desc= 'Level Up Weapons & Devil Fruit Mastery',
        event_title  = 'Sea Event',           event_desc  = 'Auto Hunt Sea Beasts & Ocean Events',
        seastack_title='Sea Stack',           seastack_desc='Advanced Sea Event Combinations',
        seasettings_title='Sea Settings',     seasettings_desc='Configure Sea Event Automation',
        race_title   = 'Upgrade V4',          race_desc   = 'Race Awakening, Trials & Gears',
        dojo_title   = 'Dojo & Drago Race',   dojo_desc   = 'Dojo Tasks & Dragon Race Features',
        get_title    = 'Get Item & Upgrade',  get_desc    = 'Auto Obtain Swords, Accessories & Materials',
        fruit_title  = 'Raid & Fruit',        fruit_desc  = 'Auto Raids, Sniper & Devil Fruit Management',
        player_title = 'Local Player',        player_desc = 'Character Modifications & Movement (Noclip/Speed)',
        shop_title   = 'Local Shop',          shop_desc   = 'Quick Buy Fighting Styles, Haki & Items',
        esp_title    = 'Stats & ESP',         esp_desc    = 'Auto Allocate Stats & Visual Assistance',
        teleport_title='Tab Teleport',        teleport_desc='Fast Travel Between Islands & Seas',
        setting_title= 'Setting & UI',        setting_desc= 'Script Configuration & Interface Tweaks',
        visual_title = 'Visual & Troll',      visual_desc  = 'Visual Effects, Animations & Troll Features',
    },

    -- ── INFO & SERVER ──────────────────────────────────────────
    status = {
        sec_client      = 'Information Client',
        time_zone       = 'Time Zone',
        game_time       = 'Game Time',
        sec_server      = 'Information Sever',
        mirage_island   = 'Mirage Island',
        kitsune_island  = 'Kitsune Island',
        prehistoric_island = 'Prehistoric Island',
        frozen_dim      = 'Frozen Dimension',
        dim_killed      = 'Dimension Killed',
        tyrant          = 'Tyrant of the Skies',
        rip_indra       = 'Rip Indra',
        dough_king      = 'Dough King',
        elite_hunter    = 'Elite Hunter',
        pull_lever      = 'Pull Lever',
        full_moon       = 'Full Moon',
        legendary_sword = 'Legendary Sword',
        input_job_id = "Input Job Id",
        job_id = "Job ID",
        join_server = "Join Server",
        copy_job_id = "Copy JobId",
        anti_reset = "Anti-reset",
        anti_reset_desc = "Server hop every 30 minutes to avoid reset",
        rejoin_server = "Rejoin Server",
        hop_server = "Hop Server",
        hop_server_less_people = "Hop Server Less People",
        spam_join_server = "Spam Join Server (Job ID)",
        spam_join_server_desc = "Continuously connect to the entered Job ID (Use when the server is full)",
        enter_jobid_first = "Please enter your Job ID before spamming to join!",
    },

    -- ── FARMING TAB ────────────────────────────────────────────
    farm = {
        sec_localMain       = 'Local Main',
        sel_weapon          = 'Select Weapon',       sel_weapon_desc      = 'select weapon',
        super_attack        = 'Super Attack',         super_attack_desc    = 'Hit Super Attack Mob',
        bring_mob           = 'Bring Mob',
        fps_fix             = 'FPS Fix Lag',          fps_fix_desc         = 'Improve FPS for low end device',
        sec_autoFarm        = 'Auto Farm',
        note_title          = 'Note:',
        note_desc           = 'Select what you want to farm Level, Bones, Cake Prince, Tyrant of the skies farm',
        sel_mode            = 'Select Farm Mode',     sel_mode_desc        = 'Select farm you want',
        start               = 'Start Farm',           start_desc           = 'Start farming to selected mode',
        accept_quest        = 'Accept Quests',        accept_quest_desc    = 'Auto accept quest to selected mode',
        sec_aura_near       = 'Aura/Near Farm',
        dist_radius         = 'Distance Radius',      dist_radius_desc     = 'Distance Radius',
        kill_nearest        = 'Kill Mobs Nearest',    kill_nearest_desc    = 'Start killing to nearest mob',
        sec_other           = 'Other',
        factory_raid        = 'Auto Factory Raid',    factory_raid_desc    = 'Auto attack factory',
        pirate_raid         = 'Auto Pirate Raid',     pirate_raid_desc     = 'Auto attack mob on castle of the sea',
        sec_collect         = 'Collect',
        auto_chest          = 'Auto Collect Chest',   auto_chest_desc      = 'Auto collect cheast [Tween]',
        auto_berry          = 'Auto Collect Berry',   auto_berry_desc      = 'Auto collect berry',
        sec_bone            = 'Bone',
        auto_bone           = 'Auto Random Bone',     auto_bone_desc       = 'Auto buy random bone',
        auto_soul_reaper    = 'Auto Soul Reaper',     auto_soul_reaper_desc= 'Auto spawn/kill soul reaper boss if have Hallow Essence',
        sec_material        = 'Material',
        sel_material        = 'Select Material',      sel_material_desc    = 'Select material to farm',
        auto_material       = 'Auto Farm',            auto_material_desc   = 'Start farming material you selected',
        sec_dark_dragger    = 'Dark Dragger + Valkyrie',
        kill_rip_indra      = 'Auto Kill Rip Indra',  kill_rip_indra_desc  = 'Auto attack rip indra',
        auto_cores          = 'Auto Active Cores',    auto_cores_desc      = 'Auto activate color',
    },

    -- ── STACK FARM (OTHERS) ────────────────────────────────────
    others = {
        sec_fishing         = 'Fishing',
        sel_rod             = 'Select Fishing Rod',  sel_rod_desc             = 'Select fishing rod',
        sel_bait            = 'Select Bait',          sel_bait_desc            = 'Select bait',
        auto_buy_bait       = 'Auto Buy Bait',        auto_buy_bait_desc       = 'Auto buy bait',
        auto_fishing        = 'Auto Fishing',         auto_fishing_desc        = 'Auto fishing',
        auto_fishing_quest  = 'Auto Quest Fishing',   auto_fishing_quest_desc  = 'Auto fishing quest',
        auto_quest_complete = 'Auto Complete Quest',  auto_quest_complete_desc = 'Auto complete quest',
        auto_sell_fish      = 'Auto Sell Fish',       auto_sell_fish_desc      = 'Auto sell fish',
        rod_skill           = 'Auto use skill of the rod', rod_skill_desc      = 'Auto use rod skill',
        sec_boss            = 'Boss Farm',
        sel_boss            = 'Select Boss',          sel_boss_desc            = 'Select boss',
        refresh_boss        = 'Refresh Boss List',    refresh_boss_desc        = 'Refresh boss list',
        auto_farm_boss      = 'Auto Farm Boss Select',auto_farm_boss_desc      = 'Auto farm selected boss',
        accept_boss_quest   = 'Accept Quest Boss',    accept_boss_quest_desc   = 'Accept boss quest',
        farm_all_bosses     = 'Farm All Bosses',      farm_all_bosses_desc     = 'Farm all active bosses',
        sec_quests          = 'Quests',
        auto_observation    = 'Auto Farm Observation',auto_observation_desc    = 'Auto farm observation haki',
        auto_obs_v2         = 'Auto Observation V2',  auto_obs_v2_desc         = 'Auto get observation v2',
        auto_citizen        = 'Auto Citizen Quest',   auto_citizen_desc        = 'Citizen quest',
        sec_cursed          = 'Cursed Swords',
        elite_progress      = 'Elites Progress ',
        auto_elite          = 'Auto Elite Quest',     auto_elite_desc          = 'Auto elite hunt quest',
        stop_chalice        = "Stop when got God's Chalice", stop_chalice_desc = 'Stop when chalice obtained',
        auto_tushita        = 'Auto Tushita Sword',   auto_tushita_desc        = 'Auto get tushita sword',
        auto_yama           = 'Auto Yama Sword',      auto_yama_desc           = 'Auto get yama sword',
        sec_buso_colour     = 'Buso/Aura Colours',
        tp_barista          = 'Teleport Barista Haki',tp_barista_desc          = 'Teleport to haki npc',
        buy_buso_colors     = 'Buy Buso Colors',      buy_buso_colors_desc     = 'Buy buso colors',
        auto_rainbow_haki   = 'Auto Rainbow Haki',    auto_rainbow_haki_desc   = 'Auto get rainbow haki',
        bypass_quest        = 'Accept Quest Bypass [Risk]', bypass_quest_desc  = 'Accept quest bypass [risk]',
    },

    -- ── MASTERY ────────────────────────────────────────────────
    mastery = {
        sec_mastery         = 'Mastery',
        sel_method          = 'Select Method',
        farm_mastery_fruit  = 'Auto Farm Mastery Fruit',
        farm_mastery_gun    = 'Auto Farm Mastery Gun',
        skill_z = 'Fruit Skill Z', skill_x = 'Fruit Skill X',
        skill_c = 'Fruit Skill C', skill_v = 'Fruit Skill V', skill_f = 'Fruit Skill F',
    },

    -- ── SEA EVENT ──────────────────────────────────────────────
    seaevent = {
        sec_seaevent        = 'Sea Event / Setting Sail',
        sel_boats           = 'Select Boats',          sel_boats_desc          = 'Select boat type',
        sel_level_sea       = 'Select Level Sea',      sel_level_sea_desc      = 'Select sea danger level',
        auto_sail           = 'Auto Sail Rough Sea',   auto_sail_desc          = 'Buy boat and go to sea',
        activate_speed      = 'Activate Boat Speed',   activate_speed_desc     = 'Adjust speed boat',
        boat_speed_val      = 'Boat Speed Value',      boat_speed_desc         = 'Default Speed 300',
        sec_farm_select     = 'Select what you will farm.',
        sea_beast           = 'Auto Attack Sea Beast', sea_beast_desc          = 'Auto attack sea beast',
        pgb                 = 'Auto Attack Pirate GrandBrigade', pgb_desc     = 'Auto attack pirate boat',
        sec_sea3_only       = 'Go to Sea 3 for more options.',
        sec_sea23           = 'Go to Sea 3 or Sea 2 for Farm maritime events',
        auto_shark          = 'Auto Shark',            auto_shark_desc         = 'Auto attack shark groups',
        auto_piranha        = 'Auto Piranha',          auto_piranha_desc       = 'Auto attack fish piranha',
        auto_terror_shark   = 'Auto Terror Shark',     auto_terror_shark_desc  = 'Auto attack terror shark boss',
        auto_fish_crew      = 'Auto Fish Crew Member', auto_fish_crew_desc     = 'Attack fish crew member',
        auto_haunted        = 'Auto Haunted Crew Member', auto_haunted_desc    = 'Auto attack haunted crew member',
        auto_fish_boat      = 'Auto Attack Fish Boat', auto_fish_boat_desc     = 'Attack fish boat',
        sec_frozen          = 'Frozen Dimension',
        buy_spy             = 'Buy Spy',               buy_spy_desc            = 'Buy an spy to find the Leviathan sword.',
        tp_frozen           = 'Teleport Frozen Dimension', tp_frozen_desc      = 'Teleport to the frozen dimension and activate the Leviathan portal.',
        auto_leviathan      = 'Auto Attack Leviathan', auto_leviathan_desc     = 'Auto attack leviathan',
        sec_kitsune         = 'Kitsune Island / Event',
        find_kitsune        = 'Auto Find Kitsune Island', find_kitsune_desc    = 'Auto sail and find Kitsune Island.',
        tp_shrine           = 'Auto Teleport to Shrine Actived', tp_shrine_desc= 'Teleport to the activated temple.',
        collect_azure       = 'Auto Collect Azure Ember', collect_azure_desc   = 'Start to collect Azure Ember',
        trade_azure         = 'Auto Trade Azure Ember', trade_azure_desc       = 'Exchange Azure Ember',
        trade_items         = 'Trade Items Azure',
        talk_kitsune        = 'Talk with kitsune statue',
        sec_mirage          = 'Mystic Island / Full Moon',
        find_mirage         = 'Auto Find Mirage Island', find_mirage_desc      = 'Auto sail and find mirage island',
        tween_highest       = 'Auto Tween To Highest Point', tween_highest_desc= 'Auto tween to top',
        collect_gear        = 'Auto Collect Gear',     collect_gear_desc       = 'Collect the Blue Gear on Mirage Island.',
        transparency        = 'Change Transparency can see', transparency_desc = 'Make the Mirage obstacles transparent.',
        tp_fruit_dealer     = 'Auto Tween Advanced Fruit Dealer', tp_fruit_dealer_desc = 'TP to the advanced fruit seller on Mirage.',
        collect_mirage_chest= 'Auto Collect Mirage Chest',
        sec_volcanic        = 'Volcanic Magnet',
        auto_craft_magnet   = 'Auto Craft Volcanic Magnet', auto_craft_magnet_desc = 'Enable auto farming of materials and craft a Volcanic Magnet. Stop once you have 1 Volcanic Magnet',
        craft_magnet        = 'Craft Volcanic Magnet',
        sec_prehistoric     = 'Prehistoric Island',
        find_prehistoric    = 'Auto Find Prehistoric Island', find_prehistoric_desc = 'Auto sail and find prehistroic',
        event_prehistoric   = 'Auto Event Prehistoric Island',
        remove_lava         = 'Remove Lava',
        collect_dino_bones  = 'Auto Collect Dino Bones',
        collect_dragon_eggs = 'Auto Collect Dragon Eggs',
        auto_reset_volcano  = 'Auto Reset When Complete Volcano',
    },

    -- ── SEA STACK ──────────────────────────────────────────────
    seastack = {
        sec_seastack        = 'Sea Stack',
        mirage_status       = 'Mirage Status',       kitsune_status       = 'Kitsune Status',
        prehistoric_status  = 'Prehistoric Status',  frozen_status        = 'Frozen Status',
        summon_prehistoric  = 'Summon Prehistoric Island', summon_prehistoric_desc = 'Need Volcanic Magnet',
        tween_prehistoric   = 'Tween To Prehistoric Island',
        kill_lava_golem     = 'Auto Kill Lava Golem',
        summon_frozen       = 'Summon Frozen Dimension',
        bribe_leviathan     = 'Bribe Leviathan',
        tween_frozen        = 'Tween To Frozen Dimension',
        summon_kitsune      = 'Summon Kitsune Island',
        tween_kitsune       = 'Tween To Kitsune Island',
        collect_azure       = 'Auto Collect Azure Ember',
        tween_mirage        = 'Tween To Mirage Island',
        attack_seabeast     = 'Auto Attack Seabeasts',
    },

    -- ── SEA SETTINGS ───────────────────────────────────────────
    seasettings = {
        sec_settings    = 'Settings Sea Envent', sec_tools = 'Tools',
        lightning       = 'Lightning',
        increase_speed  = 'Increase Speed Boat',
        boat_speed_val  = 'Boat Speed Value',    boat_speed_desc = 'Default Speed 300',
        no_clip_rock    = 'No Clip Rock',
        use_devil_fruit = 'Use Devil Fruit Skill',
        use_melee       = 'Use Melee Skill',
        use_sword       = 'Use Sword Skill',
        use_gun         = 'Use Gun Skill',
    },

    -- ── UPGRADE V4 / RACE ─────────────────────────────────────
    race = {
        sec_races       = 'Upgrade Races',
        auto_mink       = 'Auto Mink V2/V3',
        auto_human      = 'Auto Human V2/V3',
        auto_angel      = 'Auto Angel V2/V3',
        auto_shark      = 'Auto Shark V2/V3',
        sec_v4_sea3     = 'Race upgrade v4 only in Sea 3',
        sec_v4_sea23    = 'Only in Sea 2 or 3 to upgrade to Race',
        sec_trials      = 'Trials Quests / Misc V4',
        tiers_status    = ' Tiers V4 Status ',
        look_moon       = 'Auto Look At Moon',
        auto_pull_lever = 'Auto Pull Lever',
        auto_train_v4   = 'Auto Train V4',          auto_train_v4_desc  = 'Turn on for farm tier + auto upgrade your tier level',
        tp_temple       = 'Teleport to Temple of Time',
        tp_ancient_one  = 'Teleport to Ancient One',
        tp_ancient_clock= 'Teleport to Ancient Clock',
        tp_race_doors   = 'Auto Teleport to Race Doors',
        complete_trial  = 'Auto Complete Trial Race',
        kill_after_trial= 'Auto Kill Player After Trial', kill_after_trial_desc = 'Turn on for kill player after the race trials',
    },

    -- ── DOJO & DRAGO RACE ──────────────────────────────────────
    dojo = {
        sec_dojo        = 'Dojo Quest & Drago Race',
        auto_dojo       = 'Auto Dojo Trainer',         auto_dojo_desc      = 'Turn on for do dojo belt quest white to black',
        auto_dragon_hunter = 'Auto Dragon Hunter',     auto_dragon_hunter_desc = 'Turn on for farm blaze ember + auto collect blaze ember',
        sec_draco       = 'Draco Trial',
        tween_upgrade   = 'Tween To Upgrade Draco Trial',
        draco_v1        = 'Auto Race Draco (V1)',       draco_v1_desc       = 'Turn on for auto quest1 auto prehistoric event + collect dragon eggs',
        draco_v2        = 'Auto Race Draco (V2)',       draco_v2_desc       = 'Turn on for auto kill Forest Pirate & Collect fireflower',
        draco_v3        = 'Auto race draco (V3)',       draco_v3_desc       = 'Turn on for sea event kill terror shark',
        draco_relic     = 'Auto Relic Draco Trial [Beta]', draco_relic_desc = 'Turn on for auto trial v4 you have to COLLECT RELIC by your self',
        train_draco     = 'Auto to train race draco',  train_draco_desc    = 'Turn on for training Drago race v4 + auto upgrade tier',
        fly             = 'Fly',
        tween_draco     = 'Tween to Draco Trials',
        swap_draco      = 'Swap Draco Race',
        upgrade_dragon_talon = 'Upgrade Dragon Talon With Uzoth',
        sec_sea3        = 'Only in Sea 3',
    },

    -- ── GET ITEM & UPGRADE ─────────────────────────────────────
    getitem = {
        sec_skull_guitar    = 'Skull Guitar',
        auto_skull_guitar   = 'Auto Skull Guitar',
        auto_farm_mat_skull = 'Auto Farm Material Skull Guitar',
        sec_farming_mastery = 'Farming Mastery',
        auto_600_swords     = 'Auto Farm 600 In Swords',
        sec_cdk             = 'Cursed Dual Katana',
        cdk_quest_count     = 'Number Cursed dual katana quests ',
        auto_cdk_last       = 'Auto Get CDK [ Last Quest ]',
        auto_yama_cdk       = 'Auto Yama CDK',
        auto_tushita_cdk    = 'Auto Tushita CDK',
        sec_ttk             = 'True Triple Katana Sword',
        auto_legendary_sword= 'Auto Buy Legendary Sword',
        tp_legendary_dealer = 'Teleport Legendary Sword Dealer',
        sec_law             = 'Law',
        auto_law_raid       = 'Auto Law Raid',
        sec_world1          = 'world 1 items',
        auto_saw_sword      = 'Auto Saw Sword',
        auto_saber_sword    = 'Auto Saber Sword',
        auto_usoap_hat      = "Auto Usoap's Hat",
        auto_bisento_v2     = 'Auto Bisento V2',
        auto_warden_sword   = 'Auto Warden Sword',
        auto_marine_coat    = 'Auto Marine Coat',
        auto_swan_coat      = 'Auto Swan Coat',
        sec_world2          = 'world 2 items',
        auto_rengoku        = 'Auto Rengoku Sword',
        auto_dragon_trident = 'Auto Dragon Trident',
        auto_long_sword     = 'Auto Long Sword',
        auto_black_spikey   = 'Auto Black Spikey',
        auto_midnight       = 'Auto Midnight Blade',
        auto_darkbeard      = 'Auto Darkbeard',
        auto_donswan        = 'Auto Unlocked DonSwan',
        auto_swan_glasses   = 'Auto Swan Glasses',
        sec_sea3            = 'Sea 3',
        auto_cavendish      = 'Auto Canvendish Sword',
        auto_twin_hooks     = 'Auto Twin Hooks',
        auto_serpent_bow    = 'Auto Serpent Bow',
        auto_lei            = 'Auto Lei Accessory',
    },

    -- ── RAID & FRUIT ───────────────────────────────────────────
    fruit = {
        sec_raiding         = 'Raiding',
        sel_chip            = 'Select Chip',
        buy_chip            = 'Buy Chip With Fruit',   buy_chip_desc       = 'Use your lowest fruit in your bag',
        sec_raid_farming    = 'Raid Farming',
        auto_start_raid     = 'Auto Start Raid',
        auto_complete_raid  = 'Auto Complete Raid',
        sec_dungeon         = 'Dungeon',
        tp_dungeon_hub      = 'Teleport To Dungeon Hub',
        dungeon_weapon      = 'Dungeon Weapon',        dungeon_weapon_desc = 'select dungeon weapon type',
        auto_dungeon_mob    = 'Auto Attack Dungeon Mon', auto_dungeon_mob_desc = 'Auto attack nearest dungeon mobs',
        auto_next_floor     = 'Auto Next Floor',       auto_next_floor_desc = 'Use the floor teleporter when the room is clear',
        auto_choose_card    = 'Auto Choose Card',      auto_choose_card_desc= 'Choose a reward card automatically',
        auto_return_hub     = 'Auto Return To Hub',    auto_return_hub_desc = 'Return to hub when dungeon is done',
        spin_pos            = 'Spin Position',         spin_pos_desc        = 'Circle around dungeon mobs while farming',
        spin_radius         = 'Spin Radius',
        farm_distance       = 'Farm Distance',
        auto_awakening      = 'Auto Awakening',
        sec_fruits_options  = 'Fruits Options',
        sel_fruit_stock     = 'Select Fruit Stock',
        buy_basic_stock     = 'Buy Basic Stock',
        sel_mirage_fruit    = 'Select Mirage Fruit',
        buy_mirage_stock    = 'Buy Mirage Stock',
        auto_random_fruit   = 'Auto Random Fruit',     auto_random_fruit_desc = 'Automatic random devil fruit',
        auto_drop_fruit     = 'Auto Drop Fruit',       auto_drop_fruit_desc   = 'Automatic drop devil fruit',
        auto_store_fruit    = 'Auto Store Fruit',      auto_store_fruit_desc  = 'Automatic store devil fruit',
        auto_tween_fruit    = 'Auto Tween to Fruit',   auto_tween_fruit_desc  = 'Automatic tween to get devil fruit',
        auto_collect_fruit  = 'Auto Collect Fruit',    auto_collect_fruit_desc= 'Automatic bring devil fruit',
    },

    -- ── LOCAL PLAYER ───────────────────────────────────────────
    player = {
        sec_pvp             = 'PVP / Aimbot / Movement',
        sel_players         = 'Select Players',
        refresh_players     = 'Refresh Player List',
        tp_player           = 'Teleport to Player',
        spectate            = 'Spectate Choose Players',
        sec_aimbot          = 'Aimbot',
        aimbot_cam          = 'Aimbot Cam Lock',
        aimbot_skills       = 'Aimbot Skills',
        sec_speed           = 'Speed/Jump',
        set_walkspeed       = 'Set WalkSpeed',         set_walkspeed_desc  = 'Enable custom WalkSpeed',
        walkspeed_val       = 'WalkSpeed Value',       walkspeed_val_desc  = 'Enter desired speed',
        set_jumppower       = 'Set JumpPower',         set_jumppower_desc  = 'Enable custom JumpPower',
        jumppower_val       = 'JumpPower Value',       jumppower_val_desc  = 'Enter desired jump power',
        sec_misc            = 'LocalPlayer Settings / Misc',
        inf_mink_v3         = 'Instance Mink V3 [ INF ]', inf_mink_v3_desc = 'Turn on for make mink v3 infinity',
        inf_energy          = 'Instance Energy [ INF ]',  inf_energy_desc  = 'Turn on for make energy infinity',
        inf_soru            = 'Instance Soru [ INF ]',    inf_soru_desc    = 'Turn on for make soru infinity',
        inf_obs_range       = 'Instance Observation Range [ INF ]', inf_obs_range_desc = 'Turn on for make observation range infinity',
        sec_combat          = 'Settings Combat / Aimbot Settings',
        ignore_teams        = 'Ignore Same Teams',     ignore_teams_desc   = 'Turn on for ignore not aimbot same team',
        accept_allies       = 'Accept Allies',         accept_allies_desc  = 'Turn on for auto accept ally',
    },

    -- ── LOCAL SHOP ────────────────────────────────────────────
    shop = {
        sec_fighting        = 'Fighting Shop',
        black_leg           = 'Black Leg',
        fishman_karate      = 'Fishman Karate',
        electro             = 'Electro',
        dragon_breath       = 'Dragon Breath',
        superhuman          = 'SuperHuman',
        death_step          = 'Death Step',
        sharkman_karate     = 'Sharkman Karate',
        electric_claw       = 'Electric Claw',
        dragon_talon        = 'Dragon Talon',
        god_human           = 'God Human',
        sanguine_art        = 'Sanguine Art',
        sec_sword           = 'Sword',
        cutlass             = 'Cutlass [ 1,000 Beli ]',
        katana              = 'Katana [ 1,000 Beli ]',
        iron_mace           = 'Iron Mace [ 25,000 Beli ]',
        dual_katana         = 'Dual Katana [ 12,000 Beli ]',
        triple_katana       = 'Triple Katana [ 60,000 Beli ]',
        pipe                = 'Pipe [ 100,000 Beli ]',
        dual_blade          = 'Dual-Headed Blade [ 400,000 Beli ]',
        bisento             = 'Bisento [ 1,200,000 Beli ]',
        soul_cane           = 'Soul Cane [ 750,000 Beli ]',
        pole_v2             = 'Pole v.2 [ 5,000 Fragments ]',
        sec_gun             = 'Gun',
        slingshot           = 'Slingshot [ 5,000 Beli ]',
        musket              = 'Musket [ 8,000 Beli ]',
        flintlock           = 'Flintlock [ 10,500 Beli ]',
        refined_sling       = 'Refined Slingshot [ 30,000 Beli ]',
        refined_flint       = 'Refined Flintlock [ 65,000 Beli ]',
        cannon              = 'Cannon [ 100,000 Beli ]',
        kabucha             = 'Kabucha [ 1,500 Fragments]',
        bizarre_rifle       = 'Bizarre Rifle [ 250 Ectoplasm ]',
        sec_abilities       = 'Abilities Shop',
        skyjump             = 'Skyjump [ $10,000 Beli ]',
        buso_haki_shop      = 'Buso Haki [ $25,000 Beli ]',
        obs_haki_shop       = 'Observation haki [ $750,000 Beli ]',
        soru_shop           = 'Soru [ $100,000 Beli ]',
        sec_misc            = 'Misc Shop',
        refund_stat         = 'Buy Refund Stat (2500F)',
        reroll_race         = 'Buy Reroll Race (3000F)',
        buy_draco           = 'Buy Draco',
        buy_ghoul           = 'Buy Ghoul Race',
        buy_cyborg          = 'Buy Cyborg Race (2500F)',
    },

    -- ── STATS & ESP ────────────────────────────────────────────
    esp = {
        sec_esp             = 'Sources Font',
        sec_entity          = 'Esp Items / Entity / Island',
        esp_berries         = 'Esp Berries',
        esp_players         = 'Esp Players',
        esp_chests          = 'Esp Chests',
        esp_fruits          = 'Esp Fruits',
        esp_island          = 'Esp Island',
        esp_flower          = 'Esp Flower',
        esp_legendary_sword = 'Esp Legendary Sword',
        esp_aura_dealers    = 'Esp Aura Colour Dealers',
        esp_gears           = 'Esp Gears',
        esp_fruit_dealer    = 'Esp Advanced Fruits Dealer',
        sec_stats           = 'Stats',
        add_melee           = 'Add Points Melee',      add_melee_desc      = 'Automatically spends points in Melee.',
        add_sword           = 'Add Points Sword',      add_sword_desc      = 'Automatically spends points on Sword.',
        add_gun             = 'Add Points Gun',        add_gun_desc        = 'Automatically spends points on Gun.',
        add_fruit           = 'Add Points Fruit',      add_fruit_desc      = 'Automatically spend points on Fruit.',
        add_defense         = 'Add Points Defense',    add_defense_desc    = 'Automatically spends points on Defense.',
    },

    -- ── TELEPORT ───────────────────────────────────────────────
    teleport = {
        sec_worlds      = 'Travel - Worlds',
        tp_sea1         = 'Teleport Sea 1',
        tp_sea2         = 'Teleport Sea 2',
        tp_sea3         = 'Teleport Sea 3',
        sec_island      = 'Travel - Island',
        sel_travelling  = 'Select Travelling',
        auto_travel     = 'Auto Travel',
        sec_portal      = 'Travel - Portal',
        sel_portal      = 'Select Portal',
        req_entrance    = 'Request Entrance',
        sec_npcs        = 'Travel - NPCs',
        sel_npcs        = 'Select NPCs',
        tween_npcs      = 'Auto Tween to NPCs',   tween_npcs_desc = 'Automatic teleport to pos Npcs',
    },

    -- ── SETTING & UI ───────────────────────────────────────────
    setting = {
        sec_language        = 'Language Settings',
        sel_lang            = 'Select Language',       sel_lang_desc       = 'Change display language (applies immediately)',
        sec_manual_save     = 'Manual Save',
        save_config         = 'Save Config UI',
        reset_config        = 'Reset Config UI',
        sec_font            = 'Sources Font',
        font_amatic_sc = "Apply Font: Amatic SC",
        font_antique = "Apply Font: Antique",
        font_arcade = "Apply Font: Arcade",
        font_arial = "Apply Font: Arial",
        font_arial_bold = "Apply Font: Arial Bold",
        font_bangers = "Apply Font: Bangers",
        font_bodoni = "Apply Font: Bodoni",
        font_cartoon = "Apply Font: Cartoon",
        font_code = "Apply Font: Code",
        font_creepster = "Apply Font: Creepster",
        font_denk_one = "Apply Font: Denk One",
        font_fondamento = "Apply Font: Fondamento",
        font_fredoka_one = "Apply Font: Fredoka One",
        font_garamond = "Apply Font: Garamond",
        font_gotham = "Apply Font: Gotham",
        sec_setting_farm    = 'Setting Farm',
        stop_tween          = 'Stop Tween',            stop_tween_desc     = 'Stop tween',
        remove_hit_vfx      = 'Remove Hit VFX',
        remove_hit_vfx_desc = 'Destroys slash and hit visual effects (SlashHit, CurvedRing, SwordSlash, SlashTail) to improve performance',
        remove_death_vfx    = 'Remove Death & Respawn VFX',
        remove_death_vfx_desc = 'Removes death and respawn visual effects from your screen to reduce screen clutter',
        disable_notify      = 'Disable Notify',
        disable_notify_desc = 'Disables the damage counter and all in-game notifications for a cleaner UI experience',
        safe_mode           = 'Safe Mode',             safe_mode_desc      = 'Enable to protect your health when it is low.',
        auto_haki           = 'Auto Active Haki',      auto_haki_desc      = 'Auto activate haki',
        auto_v3             = 'Auto Active V3',        auto_v3_desc        = 'Auto use v3',
        auto_v4             = 'Auto Active V4',        auto_v4_desc        = 'Auto use v4',
        anti_afk            = 'Anti AFK',              anti_afk_desc       = 'Anti AFK kick',
        sec_select          = 'Select',
        bring_mob_range     = 'Bring Mob',             bring_mob_range_desc= 'Mon bring range',
        farm_height         = 'Select Farm Height',    farm_height_desc    = 'Height above mob',
        tween_speed         = 'Tween Speed',           tween_speed_desc    = 'Tween speed',
        sec_codes           = 'Codes',
        redeem_codes        = 'Redeem All Codes',
        sec_team            = 'Team',
        set_pirate          = 'Set Pirate Team',
        set_marine          = 'Set Marine Team',
        sec_others          = 'Others',
        haki_states         = 'Haki States',
        change_haki         = 'Change Haki',
        nofog               = 'Nofog',
        walk_water          = 'Walk on Water',         walk_water_desc     = 'Walk on water',
        sec_fps             = 'Fps',
        no_animation        = 'No Animation',
        stretch_screen      = 'Stretch the screen',
        disable_notify2     = 'Disable notifications',
    },
    -- ── VISUAL TAB ───────────────────────────────────────────
    visual = {
        sec_troll = 'Troll - Not Real',
        rain_fruit = 'Rain Fruit',
        rain_fruit_desc = 'Create a Virtual Blox Fruit Rain (Only You Can See It)',
        attract_ball = 'The Ball That Attracts Everything',
        attract_ball_desc = 'Create a Sphere That Attracts Everything Without Stopping',
        sec_animation = 'Animation',
        meteorite = 'Meteorite Fall',
        meteorite_desc = 'The player smashed the moon and caused meteorites to fall.',
        view_leviathan = 'View Leviathan',
        view_leviathan_desc = 'View Leviathan Bikini.',
        view_indra = 'View Mygame43 Kill Rip_Indra',
        view_indra_desc = 'View Animation Movie Mygame43 Kill Rip_Indra.',
    },
},

-- Tiếng Việt
vi = {
    common = {
        on = 'BẬT', off = 'TẮT', save = 'Lưu', cancel = 'Hủy',
        loading = 'Đang tải...', langApplied = 'Đã áp dụng ngôn ngữ!', saved = 'Đã lưu!'
    },

    pages = {
        status_title  = 'Thông Tin & Server',      status_desc  = 'Thống kê nhân vật & thông tin server',
        farm_title    = 'Tab Farm',                farm_desc    = 'Tự động Level, Nhiệm vụ & Farm Boss',
        others_title  = 'Stack Farm',              others_desc  = 'Kết hợp nhiều tác vụ farm cùng lúc',
        mastery_title = 'Farm Thuần Thục',         mastery_desc = 'Nâng cấp thuần thục Vũ khí & Trái ác ma',
        event_title   = 'Sự Kiện Biển',            event_desc   = 'Tự động săn Quái Biển & Sự kiện đại dương',
        seastack_title= 'Sea Stack',               seastack_desc= 'Kết hợp sự kiện biển nâng cao',
        seasettings_title='Cài Đặt Biển',         seasettings_desc='Cấu hình tự động hóa sự kiện biển',
        race_title    = 'Nâng Cấp V4',            race_desc    = 'Thức tỉnh chủng tộc, thử thách & trang bị',
        dojo_title    = 'Dojo & Drago Race',       dojo_desc    = 'Nhiệm vụ Dojo & tính năng Dragon Race',
        get_title     = 'Lấy Đồ & Nâng Cấp',     get_desc     = 'Tự động lấy Kiếm, Phụ kiện & Nguyên liệu',
        fruit_title   = 'Raid & Trái',             fruit_desc   = 'Tự động Raid, bắn tỉa & quản lý Trái ác ma',
        player_title  = 'Nhân Vật',                player_desc  = 'Chỉnh sửa nhân vật & di chuyển (Noclip/Speed)',
        shop_title    = 'Cửa Hàng',               shop_desc    = 'Mua nhanh Chiến đấu, Haki & Vật phẩm',
        esp_title     = 'Thống Kê & ESP',          esp_desc     = 'Tự động phân bổ chỉ số & hỗ trợ hiển thị',
        teleport_title= 'Dịch Chuyển',            teleport_desc= 'Di chuyển nhanh giữa các đảo & biển',
        setting_title = 'Cài Đặt & Giao Diện',   setting_desc = 'Cấu hình script & điều chỉnh giao diện',
        visual_title = 'Hiệu Ứng & Troll',       visual_desc  = 'Hiệu ứng hình ảnh, hoạt cảnh & tính năng troll',
    },

    -- ── INFO & SERVER ──────────────────────────────────────────
    status = {
        sec_client         = 'Thông Tin Client',
        time_zone          = 'Múi Giờ',
        game_time          = 'Thời Gian Trong Game',
        sec_server         = 'Thông Tin Server',
        mirage_island      = 'Đảo Ảo',
        kitsune_island     = 'Đảo Kitsune',
        prehistoric_island = 'Đảo Tiền Sử',
        frozen_dim         = 'Chiều Băng',
        dim_killed         = 'Đã Diệt Trong Chiều',
        tyrant             = 'Bạo Chúa Bầu Trời',
        rip_indra          = 'Rip Indra',
        dough_king         = 'Dough King',
        elite_hunter       = 'Elite Hunter',
        pull_lever         = 'Kéo Đòn Bẩy',
        full_moon          = 'Trăng Tròn',
        legendary_sword    = 'Kiếm Huyền Thoại',
        input_job_id = "Nhập Job ID",
        job_id = "Job ID",
        join_server = "Tham Gia Server",
        copy_job_id = "Sao Chép Job ID",
        anti_reset = "Chống Reset",
        anti_reset_desc = "Tự động đổi server sau mỗi 30 phút",
        rejoin_server = "Vào Lại",
        hop_server = "Đổi Server",
        hop_server_less_people = "Server Ít Người",
        spam_join_server = "Spam Vào Server",
        spam_join_server_desc = "Liên tục thử tham gia Job ID đã nhập",
        enter_jobid_first = "Hãy nhập Job ID trước!"
    },

    -- ── FARMING TAB ────────────────────────────────────────────
    farm = {
        sec_localMain       = 'Cài Đặt Chính',
        sel_weapon          = 'Chọn Vũ Khí',           sel_weapon_desc      = 'Chọn vũ khí sử dụng',
        super_attack        = 'Tấn Công Mạnh',          super_attack_desc    = 'Sử dụng đòn tấn công mạnh vào mob',
        bring_mob           = 'Kéo Mob',
        fps_fix             = 'Sửa Lag FPS',            fps_fix_desc         = 'Cải thiện FPS cho máy cấu hình thấp',
        sec_autoFarm        = 'Tự Động Farm',
        note_title          = 'Lưu Ý:',
        note_desc           = 'Chọn chế độ farm: Level, Xương, Hoàng Tử Bánh, Bạo Chúa Bầu Trời',
        sel_mode            = 'Chọn Chế Độ Farm',       sel_mode_desc        = 'Chọn chế độ farm mong muốn',
        start               = 'Bắt Đầu Farm',           start_desc           = 'Bắt đầu farm theo chế độ đã chọn',
        accept_quest        = 'Nhận Nhiệm Vụ',          accept_quest_desc    = 'Tự động nhận nhiệm vụ theo chế độ đã chọn',
        sec_aura_near       = 'Farm Aura / Gần Nhất',
        dist_radius         = 'Bán Kính Khoảng Cách',   dist_radius_desc     = 'Bán kính khoảng cách',
        kill_nearest        = 'Giết Mob Gần Nhất',      kill_nearest_desc    = 'Bắt đầu giết mob gần nhất',
        sec_other           = 'Khác',
        factory_raid        = 'Tự Động Raid Nhà Máy',   factory_raid_desc    = 'Tự động tấn công nhà máy',
        pirate_raid         = 'Tự Động Raid Cướp Biển', pirate_raid_desc     = 'Tự động tấn công mob tại lâu đài biển',
        sec_collect         = 'Thu Thập',
        auto_chest          = 'Tự Động Thu Thập Rương', auto_chest_desc      = 'Tự động thu thập rương [Tween]',
        auto_berry          = 'Tự Động Thu Thập Berry', auto_berry_desc      = 'Tự động thu thập berry',
        sec_bone            = 'Xương',
        auto_bone           = 'Tự Động Mua Xương Ngẫu Nhiên', auto_bone_desc = 'Tự động mua xương ngẫu nhiên',
        auto_soul_reaper    = 'Tự Động Soul Reaper',    auto_soul_reaper_desc= 'Tự động spawn/giết soul reaper boss nếu có Hallow Essence',
        sec_material        = 'Nguyên Liệu',
        sel_material        = 'Chọn Nguyên Liệu',       sel_material_desc    = 'Chọn nguyên liệu để farm',
        auto_material       = 'Tự Động Farm',           auto_material_desc   = 'Bắt đầu farm nguyên liệu đã chọn',
        sec_dark_dragger    = 'Dark Dragger + Valkyrie',
        kill_rip_indra      = 'Tự Động Giết Rip Indra', kill_rip_indra_desc  = 'Tự động tấn công rip indra',
        auto_cores          = 'Tự Động Active Cores',   auto_cores_desc      = 'Tự động kích hoạt màu',
    },

    -- ── STACK FARM (OTHERS) ────────────────────────────────────
    others = {
        sec_fishing         = 'Câu Cá',
        sel_rod             = 'Chọn Cần Câu',           sel_rod_desc             = 'Chọn loại cần câu',
        sel_bait            = 'Chọn Mồi Câu',           sel_bait_desc            = 'Chọn loại mồi câu',
        auto_buy_bait       = 'Tự Động Mua Mồi',        auto_buy_bait_desc       = 'Tự động mua mồi câu',
        auto_fishing        = 'Tự Động Câu Cá',         auto_fishing_desc        = 'Tự động câu cá',
        auto_fishing_quest  = 'Tự Động NV Câu Cá',      auto_fishing_quest_desc  = 'Tự động làm nhiệm vụ câu cá',
        auto_quest_complete = 'Tự Động Hoàn Thành NV',  auto_quest_complete_desc = 'Tự động hoàn thành nhiệm vụ',
        auto_sell_fish      = 'Tự Động Bán Cá',         auto_sell_fish_desc      = 'Tự động bán toàn bộ cá',
        rod_skill           = 'Tự Động Dùng Kỹ Năng Cần', rod_skill_desc         = 'Tự động dùng kỹ năng cần câu',
        sec_boss            = 'Farm Boss',
        sel_boss            = 'Chọn Boss',               sel_boss_desc            = 'Chọn boss',
        refresh_boss        = 'Làm Mới Danh Sách Boss',  refresh_boss_desc        = 'Làm mới danh sách boss',
        auto_farm_boss      = 'Tự Động Farm Boss Đã Chọn', auto_farm_boss_desc   = 'Tự động farm boss đã chọn',
        accept_boss_quest   = 'Nhận NV Boss',            accept_boss_quest_desc   = 'Nhận nhiệm vụ boss',
        farm_all_bosses     = 'Farm Tất Cả Boss',        farm_all_bosses_desc     = 'Farm tất cả boss đang hoạt động',
        sec_quests          = 'Nhiệm Vụ',
        auto_observation    = 'Tự Động Farm Observation', auto_observation_desc   = 'Tự động farm observation haki',
        auto_obs_v2         = 'Tự Động Observation V2',  auto_obs_v2_desc         = 'Tự động lấy observation v2',
        auto_citizen        = 'Tự Động NV Dân',          auto_citizen_desc        = 'Nhiệm vụ dân',
        sec_cursed          = 'Kiếm Nguyền Rủa',
        elite_progress      = 'Tiến Độ Elite ',
        auto_elite          = 'Tự Động NV Elite',        auto_elite_desc          = 'Tự động săn nhiệm vụ elite',
        stop_chalice        = 'Dừng khi lấy được Chén Thánh', stop_chalice_desc  = 'Dừng khi lấy được chalice',
        auto_tushita        = 'Tự Động Kiếm Tushita',   auto_tushita_desc        = 'Tự động lấy kiếm tushita',
        auto_yama           = 'Tự Động Kiếm Yama',      auto_yama_desc           = 'Tự động lấy kiếm yama',
        sec_buso_colour     = 'Màu Buso / Aura',
        tp_barista          = 'Dịch Chuyển Barista Haki', tp_barista_desc         = 'Dịch chuyển đến npc haki',
        buy_buso_colors     = 'Mua Màu Buso',            buy_buso_colors_desc     = 'Mua màu buso',
        auto_rainbow_haki   = 'Tự Động Haki Cầu Vồng',  auto_rainbow_haki_desc   = 'Tự động lấy haki cầu vồng',
        bypass_quest        = 'Nhận NV Bypass [Rủi Ro]', bypass_quest_desc       = 'Nhận nhiệm vụ bypass [rủi ro]',
    },

    -- ── MASTERY ────────────────────────────────────────────────
    mastery = {
        sec_mastery        = 'Thuần Thục',
        sel_method         = 'Chọn Phương Pháp',
        farm_mastery_fruit = 'Tự Động Farm Thuần Thục Trái',
        farm_mastery_gun   = 'Tự Động Farm Thuần Thục Súng',
        skill_z = 'Kỹ Năng Trái Z', skill_x = 'Kỹ Năng Trái X',
        skill_c = 'Kỹ Năng Trái C', skill_v = 'Kỹ Năng Trái V', skill_f = 'Kỹ Năng Trái F',
    },

    -- ── SEA EVENT ──────────────────────────────────────────────
    seaevent = {
        sec_seaevent        = 'Sự Kiện Biển / Ra Khơi',
        sel_boats           = 'Chọn Thuyền',             sel_boats_desc          = 'Chọn loại thuyền',
        sel_level_sea       = 'Chọn Cấp Độ Biển',        sel_level_sea_desc      = 'Chọn cấp độ nguy hiểm biển',
        auto_sail           = 'Tự Động Ra Biển Động',    auto_sail_desc          = 'Mua thuyền và ra biển',
        activate_speed      = 'Kích Hoạt Tăng Tốc Thuyền', activate_speed_desc  = 'Điều chỉnh tốc độ thuyền',
        boat_speed_val      = 'Giá Trị Tốc Độ Thuyền',  boat_speed_desc         = 'Tốc độ mặc định 300',
        sec_farm_select     = 'Chọn Thứ Bạn Muốn Farm.',
        sea_beast           = 'Tự Động Tấn Công Quái Biển', sea_beast_desc       = 'Tự động tấn công quái biển',
        pgb                 = 'Tự Động Tấn Công Đại Đội Cướp', pgb_desc         = 'Tự động tấn công thuyền cướp',
        sec_sea3_only       = 'Vào Biển 3 để có thêm lựa chọn.',
        sec_sea23           = 'Vào Biển 3 hoặc Biển 2 để Farm sự kiện hàng hải',
        auto_shark          = 'Tự Động Cá Mập',          auto_shark_desc         = 'Tự động tấn công nhóm cá mập',
        auto_piranha        = 'Tự Động Cá Piranha',      auto_piranha_desc       = 'Tự động tấn công cá piranha',
        auto_terror_shark   = 'Tự Động Cá Mập Khủng',   auto_terror_shark_desc  = 'Tự động tấn công boss cá mập khủng khiếp',
        auto_fish_crew      = 'Tự Động Thủy Thủ Cá',    auto_fish_crew_desc     = 'Tấn công thủy thủ cá',
        auto_haunted        = 'Tự Động Đội Quỷ',         auto_haunted_desc       = 'Tự động tấn công đội quỷ',
        auto_fish_boat      = 'Tự Động Phá Thuyền Cá',  auto_fish_boat_desc     = 'Tấn công thuyền cá',
        sec_frozen          = 'Chiều Băng',
        buy_spy             = 'Mua Gián Điệp',           buy_spy_desc            = 'Mua gián điệp để tìm kiếm vị trí kiếm Leviathan.',
        tp_frozen           = 'Dịch Chuyển Vào Chiều Băng', tp_frozen_desc       = 'Dịch chuyển vào chiều băng và kích hoạt cổng Leviathan.',
        auto_leviathan      = 'Tự Động Tấn Công Leviathan', auto_leviathan_desc  = 'Tự động tấn công leviathan',
        sec_kitsune         = 'Đảo Kitsune / Sự Kiện',
        find_kitsune        = 'Tự Động Tìm Đảo Kitsune', find_kitsune_desc       = 'Tự động đi thuyền tìm Đảo Kitsune.',
        tp_shrine           = 'Tự Động TP Đền Kitsune',  tp_shrine_desc          = 'Dịch chuyển đến đền đã kích hoạt.',
        collect_azure       = 'Tự Động Thu Thập Azure Ember', collect_azure_desc  = 'Bắt đầu thu thập Azure Ember',
        trade_azure         = 'Tự Động Đổi Azure Ember', trade_azure_desc        = 'Trao đổi Azure Ember',
        trade_items         = 'Đổi Vật Phẩm Azure',
        talk_kitsune        = 'Nói Chuyện Tượng Kitsune',
        sec_mirage          = 'Đảo Ảo / Trăng Tròn',
        find_mirage         = 'Tự Động Tìm Đảo Ảo',     find_mirage_desc        = 'Tự động đi thuyền tìm đảo ảo',
        tween_highest       = 'Tự Động Lên Điểm Cao Nhất', tween_highest_desc    = 'Tự động tween lên đỉnh',
        collect_gear        = 'Tự Động Thu Thập Gear',   collect_gear_desc       = 'Thu thập Bánh Răng Xanh trên Đảo Ảo.',
        transparency        = 'Thay Đổi Độ Trong Suốt',  transparency_desc       = 'Làm các chướng ngại vật Đảo Ảo trong suốt.',
        tp_fruit_dealer     = 'Tự Động TP Người Bán Trái Cao Cấp', tp_fruit_dealer_desc = 'TP đến người bán trái cao cấp trên Đảo Ảo.',
        collect_mirage_chest= 'Tự Động Thu Thập Rương Đảo Ảo',
        sec_volcanic        = 'Nam Châm Núi Lửa',
        auto_craft_magnet   = 'Tự Động Chế Tạo Nam Châm NL', auto_craft_magnet_desc = 'Tự động farm nguyên liệu và chế tạo Nam Châm Núi Lửa. Dừng khi có 1 cái.',
        craft_magnet        = 'Chế Tạo Nam Châm Núi Lửa',
        sec_prehistoric     = 'Đảo Tiền Sử',
        find_prehistoric    = 'Tự Động Tìm Đảo Tiền Sử', find_prehistoric_desc   = 'Tự động đi thuyền tìm đảo tiền sử',
        event_prehistoric   = 'Tự Động Sự Kiện Đảo Tiền Sử',
        remove_lava         = 'Xóa Dung Nham',
        collect_dino_bones  = 'Tự Động Thu Thập Xương Khủng Long',
        collect_dragon_eggs = 'Tự Động Thu Thập Trứng Rồng',
        auto_reset_volcano  = 'Tự Động Reset Khi Hoàn Thành Núi Lửa',
    },

    -- ── SEA STACK ──────────────────────────────────────────────
    seastack = {
        sec_seastack        = 'Sea Stack',
        mirage_status       = 'Trạng Thái Đảo Ảo',   kitsune_status       = 'Trạng Thái Kitsune',
        prehistoric_status  = 'Trạng Thái Tiền Sử',   frozen_status        = 'Trạng Thái Băng',
        summon_prehistoric  = 'Triệu Hồi Đảo Tiền Sử', summon_prehistoric_desc = 'Cần Nam Châm Núi Lửa',
        tween_prehistoric   = 'Di Chuyển Đến Đảo Tiền Sử',
        kill_lava_golem     = 'Tự Động Giết Lava Golem',
        summon_frozen       = 'Triệu Hồi Chiều Băng',
        bribe_leviathan     = 'Mua Chuộc Leviathan',
        tween_frozen        = 'Di Chuyển Vào Chiều Băng',
        summon_kitsune      = 'Triệu Hồi Đảo Kitsune',
        tween_kitsune       = 'Di Chuyển Đến Đảo Kitsune',
        collect_azure       = 'Tự Động Thu Thập Azure Ember',
        tween_mirage        = 'Di Chuyển Đến Đảo Ảo',
        attack_seabeast     = 'Tự Động Tấn Công Quái Biển',
    },

    -- ── SEA SETTINGS ───────────────────────────────────────────
    seasettings = {
        sec_settings    = 'Cài Đặt Sự Kiện Biển',  sec_tools = 'Công Cụ',
        lightning       = 'Ánh Sáng',
        increase_speed  = 'Tăng Tốc Độ Thuyền',
        boat_speed_val  = 'Giá Trị Tốc Độ Thuyền', boat_speed_desc = 'Tốc độ mặc định 300',
        no_clip_rock    = 'Xuyên Tường Đá',
        use_devil_fruit = 'Dùng Kỹ Năng Trái Ác Ma',
        use_melee       = 'Dùng Kỹ Năng Cận Chiến',
        use_sword       = 'Dùng Kỹ Năng Kiếm',
        use_gun         = 'Dùng Kỹ Năng Súng',
    },

    -- ── UPGRADE V4 / RACE ─────────────────────────────────────
    race = {
        sec_races       = 'Nâng Cấp Chủng Tộc',
        auto_mink       = 'Tự Động Mink V2/V3',
        auto_human      = 'Tự Động Human V2/V3',
        auto_angel      = 'Tự Động Angel V2/V3',
        auto_shark      = 'Tự Động Shark V2/V3',
        sec_v4_sea3     = 'Nâng cấp V4 chỉ ở Biển 3',
        sec_v4_sea23    = 'Cần Biển 2 hoặc 3 để nâng cấp Chủng Tộc',
        sec_trials      = 'Nhiệm Vụ Thử Thách / V4',
        tiers_status    = ' Trạng Thái Tiers V4 ',
        look_moon       = 'Tự Động Nhìn Mặt Trăng',
        auto_pull_lever = 'Tự Động Kéo Đòn Bẩy',
        auto_train_v4   = 'Tự Động Train V4',          auto_train_v4_desc  = 'Bật để farm tier + tự động nâng cấp tier',
        tp_temple       = 'Dịch Chuyển Đền Thời Gian',
        tp_ancient_one  = 'Dịch Chuyển Ancient One',
        tp_ancient_clock= 'Dịch Chuyển Đồng Hồ Cổ',
        tp_race_doors   = 'Tự Động TP Cổng Chủng Tộc',
        complete_trial  = 'Tự Động Hoàn Thành Trial Race',
        kill_after_trial= 'Tự Động Giết Người Sau Trial', kill_after_trial_desc = 'Bật để giết người sau race trials',
    },

    -- ── DOJO & DRAGO RACE ──────────────────────────────────────
    dojo = {
        sec_dojo           = 'Nhiệm Vụ Dojo & Drago Race',
        auto_dojo          = 'Tự Động Dojo',              auto_dojo_desc         = 'Bật để làm nhiệm vụ đai từ trắng đến đen',
        auto_dragon_hunter = 'Tự Động Dragon Hunter',     auto_dragon_hunter_desc= 'Bật để farm blaze ember + tự động thu thập',
        sec_draco          = 'Draco Trial',
        tween_upgrade      = 'Di Chuyển Nâng Cấp Draco Trial',
        draco_v1           = 'Tự Động Draco Race (V1)',   draco_v1_desc          = 'Bật để tự động quest1 sự kiện tiền sử + thu trứng rồng',
        draco_v2           = 'Tự Động Draco Race (V2)',   draco_v2_desc          = 'Bật để tự động giết Forest Pirate & Thu thập fireflower',
        draco_v3           = 'Tự Động Draco Race (V3)',   draco_v3_desc          = 'Bật để giết cá mập khủng sự kiện biển',
        draco_relic        = 'Tự Động Relic Draco [Beta]',draco_relic_desc       = 'Bật để tự động trial v4 - tự thu thập RELIC',
        train_draco        = 'Tự Động Train Draco Race',  train_draco_desc       = 'Bật để train Drago race v4 + tự động nâng tier',
        fly                = 'Bay',
        tween_draco        = 'Di Chuyển Draco Trials',
        swap_draco         = 'Đổi Draco Race',
        upgrade_dragon_talon = 'Nâng Cấp Dragon Talon Với Uzoth',
        sec_sea3           = 'Chỉ Ở Biển 3',
    },

    -- ── GET ITEM & UPGRADE ─────────────────────────────────────
    getitem = {
        sec_skull_guitar    = 'Skull Guitar',
        auto_skull_guitar   = 'Tự Động Skull Guitar',
        auto_farm_mat_skull = 'Tự Động Farm Nguyên Liệu Skull Guitar',
        sec_farming_mastery = 'Farm Thuần Thục',
        auto_600_swords     = 'Tự Động Farm 600 Kiếm',
        sec_cdk             = 'Kiếm Đôi Bị Nguyền Rủa',
        cdk_quest_count     = 'Số Nhiệm Vụ CDK ',
        auto_cdk_last       = 'Tự Động Lấy CDK [ Nhiệm Vụ Cuối ]',
        auto_yama_cdk       = 'Tự Động Yama CDK',
        auto_tushita_cdk    = 'Tự Động Tushita CDK',
        sec_ttk             = 'True Triple Katana',
        auto_legendary_sword= 'Tự Động Mua Kiếm Huyền Thoại',
        tp_legendary_dealer = 'TP Người Bán Kiếm Huyền Thoại',
        sec_law             = 'Law',
        auto_law_raid       = 'Tự Động Raid Law',
        sec_world1          = 'Vật Phẩm Thế Giới 1',
        auto_saw_sword      = 'Tự Động Kiếm Cưa',
        auto_saber_sword    = 'Tự Động Kiếm Saber',
        auto_usoap_hat      = 'Tự Động Mũ Usoap',
        auto_bisento_v2     = 'Tự Động Bisento V2',
        auto_warden_sword   = 'Tự Động Kiếm Warden',
        auto_marine_coat    = 'Tự Động Áo Hải Quân',
        auto_swan_coat      = 'Tự Động Áo Swan',
        sec_world2          = 'Vật Phẩm Thế Giới 2',
        auto_rengoku        = 'Tự Động Kiếm Rengoku',
        auto_dragon_trident = 'Tự Động Dragon Trident',
        auto_long_sword     = 'Tự Động Kiếm Dài',
        auto_black_spikey   = 'Tự Động Black Spikey',
        auto_midnight       = 'Tự Động Midnight Blade',
        auto_darkbeard      = 'Tự Động Darkbeard',
        auto_donswan        = 'Tự Động Mở Khóa DonSwan',
        auto_swan_glasses   = 'Tự Động Kính Swan',
        sec_sea3            = 'Biển 3',
        auto_cavendish      = 'Tự Động Kiếm Cavendish',
        auto_twin_hooks     = 'Tự Động Twin Hooks',
        auto_serpent_bow    = 'Tự Động Cung Serpent',
        auto_lei            = 'Tự Động Phụ Kiện Lei',
    },

    -- ── RAID & FRUIT ───────────────────────────────────────────
    fruit = {
        sec_raiding         = 'Raid',
        sel_chip            = 'Chọn Chip',
        buy_chip            = 'Mua Chip Bằng Trái',    buy_chip_desc        = 'Dùng trái thấp nhất trong túi',
        sec_raid_farming    = 'Farm Raid',
        auto_start_raid     = 'Tự Động Bắt Đầu Raid',
        auto_complete_raid  = 'Tự Động Hoàn Thành Raid',
        sec_dungeon         = 'Dungeon',
        tp_dungeon_hub      = 'Dịch Chuyển Vào Dungeon Hub',
        dungeon_weapon      = 'Vũ Khí Dungeon',        dungeon_weapon_desc  = 'Chọn loại vũ khí dungeon',
        auto_dungeon_mob    = 'Tự Động Tấn Công Mob Dungeon', auto_dungeon_mob_desc = 'Tự động tấn công mob gần nhất trong dungeon',
        auto_next_floor     = 'Tự Động Tầng Tiếp Theo', auto_next_floor_desc = 'Dùng bệ dịch chuyển khi phòng đã sạch',
        auto_choose_card    = 'Tự Động Chọn Thẻ',       auto_choose_card_desc= 'Tự động chọn thẻ phần thưởng',
        auto_return_hub     = 'Tự Động Quay Về Hub',    auto_return_hub_desc = 'Quay về hub khi dungeon hoàn thành',
        spin_pos            = 'Vị Trí Xoay Vòng',       spin_pos_desc        = 'Xoay quanh mob dungeon khi farm',
        spin_radius         = 'Bán Kính Xoay',
        farm_distance       = 'Khoảng Cách Farm',
        auto_awakening      = 'Tự Động Thức Tỉnh',
        sec_fruits_options  = 'Tùy Chọn Trái',
        sel_fruit_stock     = 'Chọn Kho Trái',
        buy_basic_stock     = 'Mua Kho Cơ Bản',
        sel_mirage_fruit    = 'Chọn Trái Đảo Ảo',
        buy_mirage_stock    = 'Mua Kho Đảo Ảo',
        auto_random_fruit   = 'Tự Động Trái Ngẫu Nhiên', auto_random_fruit_desc = 'Tự động lấy trái ác ma ngẫu nhiên',
        auto_drop_fruit     = 'Tự Động Thả Trái',       auto_drop_fruit_desc   = 'Tự động thả trái ác ma',
        auto_store_fruit    = 'Tự Động Cất Trái',       auto_store_fruit_desc  = 'Tự động cất trái ác ma',
        auto_tween_fruit    = 'Tự Động Di Chuyển Đến Trái', auto_tween_fruit_desc = 'Tự động tween đến lấy trái ác ma',
        auto_collect_fruit  = 'Tự Động Thu Thập Trái',  auto_collect_fruit_desc= 'Tự động thu thập trái ác ma',
    },

    -- ── LOCAL PLAYER ───────────────────────────────────────────
    player = {
        sec_pvp             = 'PVP / Aimbot / Di Chuyển',
        sel_players         = 'Chọn Người Chơi',
        refresh_players     = 'Làm Mới Danh Sách',
        tp_player           = 'Dịch Chuyển Đến Người Chơi',
        spectate            = 'Quan Sát Người Chơi',
        sec_aimbot          = 'Aimbot',
        aimbot_cam          = 'Khóa Camera Aimbot',
        aimbot_skills       = 'Kỹ Năng Aimbot',
        sec_speed           = 'Tốc Độ / Nhảy',
        set_walkspeed       = 'Cài WalkSpeed',          set_walkspeed_desc  = 'Bật tốc độ đi bộ tùy chỉnh',
        walkspeed_val       = 'Giá Trị WalkSpeed',      walkspeed_val_desc  = 'Nhập tốc độ mong muốn',
        set_jumppower       = 'Cài JumpPower',          set_jumppower_desc  = 'Bật lực nhảy tùy chỉnh',
        jumppower_val       = 'Giá Trị JumpPower',      jumppower_val_desc  = 'Nhập lực nhảy mong muốn',
        sec_misc            = 'Cài Đặt Nhân Vật / Khác',
        inf_mink_v3         = 'Mink V3 Vô Hạn [ INF ]', inf_mink_v3_desc   = 'Bật để làm mink v3 vô hạn',
        inf_energy          = 'Năng Lượng Vô Hạn [ INF ]', inf_energy_desc  = 'Bật để làm năng lượng vô hạn',
        inf_soru            = 'Soru Vô Hạn [ INF ]',    inf_soru_desc       = 'Bật để làm soru vô hạn',
        inf_obs_range       = 'Tầm Nhìn Obs Vô Hạn [ INF ]', inf_obs_range_desc = 'Bật để làm tầm nhìn observation vô hạn',
        sec_combat          = 'Cài Đặt Chiến Đấu / Aimbot',
        ignore_teams        = 'Bỏ Qua Cùng Đội',        ignore_teams_desc   = 'Bật để aimbot bỏ qua cùng đội',
        accept_allies       = 'Chấp Nhận Đồng Minh',    accept_allies_desc  = 'Bật để tự động chấp nhận đồng minh',
    },

    -- ── LOCAL SHOP ────────────────────────────────────────────
    shop = {
        sec_fighting        = 'Cửa Hàng Chiến Đấu',
        black_leg           = 'Black Leg',
        fishman_karate      = 'Fishman Karate',
        electro             = 'Electro',
        dragon_breath       = 'Dragon Breath',
        superhuman          = 'SuperHuman',
        death_step          = 'Death Step',
        sharkman_karate     = 'Sharkman Karate',
        electric_claw       = 'Electric Claw',
        dragon_talon        = 'Dragon Talon',
        god_human           = 'God Human',
        sanguine_art        = 'Sanguine Art',
        sec_sword           = 'Kiếm',
        cutlass             = 'Cutlass [ 1,000 Beli ]',
        katana              = 'Katana [ 1,000 Beli ]',
        iron_mace           = 'Iron Mace [ 25,000 Beli ]',
        dual_katana         = 'Dual Katana [ 12,000 Beli ]',
        triple_katana       = 'Triple Katana [ 60,000 Beli ]',
        pipe                = 'Pipe [ 100,000 Beli ]',
        dual_blade          = 'Dual-Headed Blade [ 400,000 Beli ]',
        bisento             = 'Bisento [ 1,200,000 Beli ]',
        soul_cane           = 'Soul Cane [ 750,000 Beli ]',
        pole_v2             = 'Pole v.2 [ 5,000 Fragments ]',
        sec_gun             = 'Súng',
        slingshot           = 'Slingshot [ 5,000 Beli ]',
        musket              = 'Musket [ 8,000 Beli ]',
        flintlock           = 'Flintlock [ 10,500 Beli ]',
        refined_sling       = 'Refined Slingshot [ 30,000 Beli ]',
        refined_flint       = 'Refined Flintlock [ 65,000 Beli ]',
        cannon              = 'Cannon [ 100,000 Beli ]',
        kabucha             = 'Kabucha [ 1,500 Fragments]',
        bizarre_rifle       = 'Bizarre Rifle [ 250 Ectoplasm ]',
        sec_abilities       = 'Cửa Hàng Kỹ Năng',
        skyjump             = 'Skyjump [ $10,000 Beli ]',
        buso_haki_shop      = 'Buso Haki [ $25,000 Beli ]',
        obs_haki_shop       = 'Observation haki [ $750,000 Beli ]',
        soru_shop           = 'Soru [ $100,000 Beli ]',
        sec_misc            = 'Cửa Hàng Linh Tinh',
        refund_stat         = 'Mua Hoàn Tiền Stat (2500F)',
        reroll_race         = 'Mua Reroll Chủng Tộc (3000F)',
        buy_draco           = 'Mua Draco',
        buy_ghoul           = 'Mua Ghoul Race',
        buy_cyborg          = 'Mua Cyborg Race (2500F)',
    },

    -- ── STATS & ESP ────────────────────────────────────────────
    esp = {
        sec_esp             = 'Chọn Font Chữ',
        sec_entity          = 'Định Vị Vật Phẩm / Thực Thể / Đảo',
        esp_berries         = 'Định Vị Berry',
        esp_players         = 'Định Vị Người Chơi',
        esp_chests          = 'Định Vị Rương',
        esp_fruits          = 'Định Vị Trái Ác Quỷ',
        esp_island          = 'Định Vị Đảo',
        esp_flower          = 'Định Vị Hoa',
        esp_legendary_sword = 'Định Vị Kiếm Huyền Thoại',
        esp_aura_dealers    = 'Định Vị Người Bán Màu Aura',
        esp_gears           = 'Định Vị Gear',
        esp_fruit_dealer    = 'Định Vị Người Bán Trái Cao Cấp',
        sec_stats           = 'Phân Bổ Chỉ Số',
        add_melee           = 'Thêm Điểm Cận Chiến',   add_melee_desc      = 'Tự động dùng điểm cho Cận Chiến.',
        add_sword           = 'Thêm Điểm Kiếm',        add_sword_desc      = 'Tự động dùng điểm cho Kiếm.',
        add_gun             = 'Thêm Điểm Súng',        add_gun_desc        = 'Tự động dùng điểm cho Súng.',
        add_fruit           = 'Thêm Điểm Trái',        add_fruit_desc      = 'Tự động dùng điểm cho Trái.',
        add_defense         = 'Thêm Điểm Phòng Thủ',  add_defense_desc    = 'Tự động dùng điểm cho Phòng Thủ.',
    },

    -- ── TELEPORT ───────────────────────────────────────────────
    teleport = {
        sec_worlds      = 'Di Chuyển - Biển',
        tp_sea1         = 'Dịch Chuyển Biển 1',
        tp_sea2         = 'Dịch Chuyển Biển 2',
        tp_sea3         = 'Dịch Chuyển Biển 3',
        sec_island      = 'Di Chuyển - Đảo',
        sel_travelling  = 'Chọn Địa Điểm',
        auto_travel     = 'Tự Động Di Chuyển',
        sec_portal      = 'Di Chuyển - Cổng',
        sel_portal      = 'Chọn Cổng',
        req_entrance    = 'Yêu Cầu Vào Cổng',
        sec_npcs        = 'Di Chuyển - NPC',
        sel_npcs        = 'Chọn NPC',
        tween_npcs      = 'Tự Động Di Chuyển Đến NPC', tween_npcs_desc = 'Tự động dịch chuyển đến vị trí NPC',
    },

    -- ── SETTING & UI ───────────────────────────────────────────
    setting = {
        sec_language        = 'Cài Đặt Ngôn Ngữ',
        sel_lang            = 'Chọn Ngôn Ngữ',          sel_lang_desc       = 'Đổi ngôn ngữ hiển thị (áp dụng ngay lập tức)',
        sec_manual_save     = 'Lưu Thủ Công',
        save_config         = 'Lưu Cấu Hình',
        reset_config        = 'Đặt Lại Cấu Hình',
        sec_font            = 'Chọn Font Chữ',
        font_amatic_sc = "Sử Dụng Font Chữ: Amatic SC",
        font_antique = "Sử Dụng Font Chữ: Antique",
        font_arcade = "Sử Dụng Font Chữ: Arcade",
        font_arial = "Sử Dụng Font Chữ: Arial",
        font_arial_bold = "Sử Dụng Font Chữ: Arial Bold",
        font_bangers = "Sử Dụng Font Chữ: Bangers",
        font_bodoni = "Sử Dụng Font Chữ: Bodoni",
        font_cartoon = "Sử Dụng Font Chữ: Cartoon",
        font_code = "Sử Dụng Font Chữ: Code",
        font_creepster = "Sử Dụng Font Chữ: Creepster",
        font_denk_one = "Sử Dụng Font Chữ: Denk One",
        font_fondamento = "Sử Dụng Font Chữ: Fondamento",
        font_fredoka_one = "Sử Dụng Font Chữ: Fredoka One",
        font_garamond = "Sử Dụng Font Chữ: Garamond",
        font_gotham = "Sử Dụng Font Chữ: Gotham",
        sec_setting_farm    = 'Cài Đặt Farm',
        stop_tween          = 'Dừng Tween',              stop_tween_desc     = 'Dừng di chuyển tween',
        remove_hit_vfx      = 'Xóa Hiệu Ứng Đánh',
        remove_hit_vfx_desc = 'Xóa hiệu ứng chém và đánh (SlashHit, CurvedRing, SwordSlash, SlashTail) để cải thiện hiệu suất',
        remove_death_vfx    = 'Xóa VFX Chết & Hồi Sinh',
        remove_death_vfx_desc = 'Xóa hiệu ứng chết và hồi sinh để giao diện gọn hơn',
        disable_notify      = 'Tắt Thông Báo',
        disable_notify_desc = 'Tắt bộ đếm sát thương và toàn bộ thông báo trong game',
        safe_mode           = 'Chế Độ An Toàn',          safe_mode_desc      = 'Bật để bảo vệ máu khi HP thấp.',
        auto_haki           = 'Tự Động Kích Hoạt Haki',  auto_haki_desc      = 'Tự động kích hoạt haki',
        auto_v3             = 'Tự Động V3',               auto_v3_desc        = 'Tự động dùng V3',
        auto_v4             = 'Tự Động V4',               auto_v4_desc        = 'Tự động dùng V4',
        anti_afk            = 'Chống AFK',                anti_afk_desc       = 'Chống bị đá do AFK',
        sec_select          = 'Chọn',
        bring_mob_range     = 'Phạm Vi Kéo Mob',         bring_mob_range_desc= 'Phạm vi kéo mob',
        farm_height         = 'Chọn Độ Cao Farm',        farm_height_desc    = 'Độ cao phía trên mob',
        tween_speed         = 'Tốc Độ Di Chuyển',        tween_speed_desc    = 'Tốc độ tween',
        sec_codes           = 'Mã Code',
        redeem_codes        = 'Nhập Tất Cả Mã',
        sec_team            = 'Đội',
        set_pirate          = 'Vào Đội Cướp Biển',
        set_marine          = 'Vào Đội Hải Quân',
        sec_others          = 'Khác',
        haki_states         = 'Trạng Thái Haki',
        change_haki         = 'Đổi Haki',
        nofog               = 'Xóa Sương Mù',
        walk_water          = 'Đi Trên Mặt Nước',        walk_water_desc     = 'Đi lại trên mặt nước',
        sec_fps             = 'FPS',
        no_animation        = 'Tắt Hoạt Ảnh',
        stretch_screen      = 'Kéo Giãn Màn Hình',
        disable_notify2     = 'Tắt thông báo',
    },
    -- ── VISUAL ───────────────────────────────────────────
    visual = {
        sec_troll = 'Troll - Không Có Thật',
        rain_fruit = 'Mưa Trái Ác Quỷ',
        rain_fruit_desc = 'Tạo cơn mưa Trái Ác Quỷ ảo (Chỉ bạn thấy được)',
        attract_ball = 'Quả Cầu Hút Tất Cả',
        attract_ball_desc = 'Tạo quả cầu hút mọi thứ không ngừng nghỉ',
        sec_animation = 'Hoạt Cảnh',
        meteorite = 'Thiên Thạch Rơi',
        meteorite_desc = 'Nhân vật đập vỡ mặt trăng khiến thiên thạch rơi xuống.',
        view_leviathan = 'Xem Leviathan',
        view_leviathan_desc = 'Xem hoạt cảnh Leviathan Bikini.',
        view_indra = 'Xem Mygame43 Giết Rip_Indra',
        view_indra_desc = 'Xem phim hoạt cảnh Mygame43 giết Rip_Indra.',
     },
},
} -- end _G.AllLangs

_G.LangCode = GetSetting('Language_Save', 'vi')
_G.LangData = _G.AllLangs[_G.LangCode] or _G.AllLangs.vi

local _LangRevMap = {}
local function _flattenLang(t, prefix)
    for k, v in pairs(t) do
        local fk = prefix and (prefix .. '.' .. k) or k
        if type(v) == 'table' then
            _flattenLang(v, fk)
        elseif type(v) == 'string' and v ~= '' then
            if not _LangRevMap[v] then
                _LangRevMap[v] = fk
            end
        end
    end
end
for _, langData in pairs(_G.AllLangs) do
    _flattenLang(langData, nil)
end

function T(key)
    local val = _G.LangData
    for part in key:gmatch('[^%.]+') do
        if type(val) ~= 'table' then return key end
        val = val[part]
    end
    if val == nil then return key end
    return tostring(val)
end

function RL(fn)
    table.insert(_G.LangUpdaters, fn)
end

function ApplyLanguage(code)
    if not _G.AllLangs[code] then return end

    _G.LangCode = code
    _G.SaveData.Language_Save = code
    SaveSettings()
    _G.LangData = _G.AllLangs[code]

    for _, fn in ipairs(_G.LangUpdaters) do
        pcall(fn)
    end

    pcall(function()
        local guiParent = nil
        pcall(function()
            guiParent = gethui and gethui() or game:GetService('CoreGui')
        end)
        if not guiParent then
            pcall(function()
                guiParent = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui', 5)
            end)
        end
        if not guiParent then return end

        for _, obj in ipairs(guiParent:GetDescendants()) do
            if obj:IsA('TextLabel') or obj:IsA('TextButton') then
                local txt = obj.Text
                if txt and #txt > 0 then
                    -- Direct match
                    local tKey = _LangRevMap[txt]
                    if tKey then
                        local newTxt = T(tKey)
                        if newTxt ~= tKey and newTxt ~= txt then
                            obj.Text = newTxt
                        end
                    else
                        -- Section labels have a leading space: " Section Name"
                        local stripped = txt:match('^%s+(.+)$')
                        if stripped then
                            local tKey2 = _LangRevMap[stripped]
                            if tKey2 then
                                local newTxt = T(tKey2)
                                if newTxt ~= tKey2 and newTxt ~= stripped then
                                    obj.Text = ' ' .. newTxt
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    pcall(function()
        Library:Notify({Title = 'Apple Hub', Message = T('common.langApplied'), Duration = 3})
    end)
end
