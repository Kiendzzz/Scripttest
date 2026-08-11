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
]]

local Release = "AppleHubV2.1"
local Library = {}

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local CoreGui = game:GetService('CoreGui')

local Mobile = if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then true else false

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

function Library:Parent()
    if not RunService:IsStudio() then
        return (gethui and gethui()) or CoreGui
    end
    return PlayerGui
end

function Library:Create(Class, Properties)
    local Creations = Instance.new(Class)
    for prop, value in Properties do
        Creations[prop] = value
    end
    return Creations
end

function Library:Draggable(a)
    local Dragging, DragInput, DragStart, StartPosition = nil, nil, nil, nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        TweenService:Create(a, TweenInfo.new(0.3), {Position = pos}):Play()
    end

    a.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = a.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    a.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(LPH_NO_VIRTUALIZE(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end))
end

function Library:Button(Parent): TextButton
    return Library:Create("TextButton", {
        Name = "Click",
        Parent = Parent,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        ZIndex = Parent.ZIndex + 3
    })
end

function Library:Tween(info)
    return TweenService:Create(info.v, TweenInfo.new(info.t, Enum.EasingStyle[info.s], Enum.EasingDirection[info.d]), info.g)
end

function Library.Effect(c, p)
    p.ClipsDescendants = true

    local Mouse = LocalPlayer:GetMouse()
    local relativeX = Mouse.X - c.AbsolutePosition.X
    local relativeY = Mouse.Y - c.AbsolutePosition.Y

    if relativeX < 0 or relativeY < 0 or relativeX > c.AbsoluteSize.X or relativeY > c.AbsoluteSize.Y then
        return
    end

    local ClickButtonCircle = Library:Create("Frame", {
        Parent = p,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.75,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0, relativeX, 0, relativeY),
        Size = UDim2.new(0, 0, 0, 0),
        ZIndex = p.ZIndex
    })

    Library:Create("UICorner", {
        Parent = ClickButtonCircle,
        CornerRadius = UDim.new(1, 0)
    })

    local expandTween = TweenService:Create(ClickButtonCircle, TweenInfo.new(2.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, c.AbsoluteSize.X * 1.5, 0, c.AbsoluteSize.X * 1.5),
        BackgroundTransparency = 1
    })

    expandTween.Completed:Once(function()
        ClickButtonCircle:Destroy()
    end)

    expandTween:Play()
end

function Library:Asset(rbx)
    if typeof(rbx) == 'number' then
        return "rbxassetid://" .. rbx
    end
    if typeof(rbx) == 'string' and rbx:find('rbxassetid://') then
        return rbx
    end
    return rbx
end

function Library:NewRows(Parent, Title, Desciption)
    local Rows = Library:Create("Frame", {
        Name = "Rows",
        Parent = Parent,
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40)
    })

    Library:Create("UIStroke", {
        Parent = Rows,
        Color = Color3.fromRGB(25, 25, 25),
        Thickness = 0.5
    })

    Library:Create("UICorner", {
        Parent = Rows,
        CornerRadius = UDim.new(0, 3)
    })

    Library:Create("UIListLayout", {
        Parent = Rows,
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    Library:Create("UIPadding", {
        Parent = Rows,
        PaddingBottom = UDim.new(0, 6),
        PaddingTop = UDim.new(0, 5)
    })

    local Vectorize_1 = Library:Create("Frame", {
        Name = "Vectorize",
        Parent = Rows,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIPadding", {
        Parent = Vectorize_1,
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10)
    })

    local Right_1 = Library:Create("Frame", {
        Name = "Right",
        Parent = Vectorize_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIListLayout", {
        Parent = Right_1,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    local Left_1 = Library:Create("Frame", {
        Name = "Left",
        Parent = Vectorize_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    local Text_1 = Library:Create("Frame", {
        Name = "Text",
        Parent = Left_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIListLayout", {
        Parent = Text_1,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    Library:Create("TextLabel", {
        Name = "Title",
        Parent = Text_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = -1,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 13),
        Font = Enum.Font.GothamSemibold,
        RichText = true,
        Text = Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextStrokeTransparency = 0.699999988079071,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local Title_1 = Rows.Vectorize.Left.Text.Title

    Library:Create("UIGradient", {
        Parent = Title_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    Library:Create("TextLabel", {
        Name = "Desc",
        Parent = Text_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 10),
        Font = Enum.Font.GothamMedium,
        RichText = true,
        Text = Desciption,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 10,
        TextStrokeTransparency = 0.699999988079071,
        TextTransparency = 0.6,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    return Rows
end

local _NotifyContainer = nil
    local _ToastContainer  = nil

    local function GetNotifyContainer()
        if _NotifyContainer and _NotifyContainer.Parent and _NotifyContainer.Parent.Parent then
            return _NotifyContainer
        end
        local Gui = Library:Create("ScreenGui", {
            Name = "XovaNotify",
            Parent = Library:Parent(),
            ZIndexBehavior = Enum.ZIndexBehavior.Global,
            IgnoreGuiInset = true,
            DisplayOrder = 99
        })
        local Frame = Library:Create("Frame", {
            Name = "Container",
            Parent = Gui,
            AnchorPoint = Vector2.new(1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, -10, 0, 10),
            Size = UDim2.new(0, 260, 1, -20)
        })
        Library:Create("UIListLayout", {
            Parent = Frame,
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
        _NotifyContainer = Frame
        return Frame
    end

    local function GetToastContainer()
        if _ToastContainer and _ToastContainer.Parent and _ToastContainer.Parent.Parent then
            return _ToastContainer
        end
        local Gui = Library:Create("ScreenGui", {
            Name = "XovaToast",
            Parent = Library:Parent(),
            ZIndexBehavior = Enum.ZIndexBehavior.Global,
            IgnoreGuiInset = true,
            DisplayOrder = 100
        })
        local Frame = Library:Create("Frame", {
            Name = "Container",
            Parent = Gui,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 1, -14),
            Size = UDim2.new(0, 320, 0, 200)
        })
        Library:Create("UIListLayout", {
            Parent = Frame,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        })
        _ToastContainer = Frame
        return Frame
    end

    function Library:Notify(Args)
        local Title    = Args.Title    or "Notification"
        local Desc     = Args.Desc     or Args.Message or ""
        local Duration = Args.Duration or Args.Time    or 4
        local Icon     = Args.Icon

        local Container = GetNotifyContainer()

        -- Wrapper dùng để slide in/out (UIListLayout override Position của Card)
        local Wrapper = Library:Create("Frame", {
            Name = "NotifyWrapper",
            Parent = Container,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true
        })

        local Card = Library:Create("Frame", {
            Name = "NotifyCard",
            Parent = Wrapper,
            BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.new(0, 270, 0, 0)
        })

        Library:Create("UICorner", { Parent = Card, CornerRadius = UDim.new(0, 6) })
        Library:Create("UIStroke", { Parent = Card, Color = Color3.fromRGB(75, 0, 38), Thickness = 1 })

        -- Accent bar (kẻ hồng bên trái)
        local Accent = Library:Create("Frame", {
            Name = "Accent",
            Parent = Card,
            AnchorPoint = Vector2.new(0, 0),
            BackgroundColor3 = Color3.fromRGB(255, 0, 127),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 6),
            Size = UDim2.new(0, 2, 1, -12)
        })
        Library:Create("UICorner", { Parent = Accent, CornerRadius = UDim.new(1, 0) })
        Library:Create("UIGradient", {
            Parent = Accent,
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 56, 56))
            },
            Rotation = 90
        })

        -- Nội dung (padding trái để tránh accent bar)
        local Content = Library:Create("Frame", {
            Name = "Content",
            Parent = Card,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.new(0, 14, 0, 0),
            Size = UDim2.new(1, -14, 0, 0)
        })
        Library:Create("UIPadding", {
            Parent = Content,
            PaddingTop    = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 12),
            PaddingRight  = UDim.new(0, 12)
        })
        Library:Create("UIListLayout", {
            Parent = Content,
            Padding = UDim.new(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })

        -- Hàng tiêu đề: icon (tuỳ chọn) + title text
        local TitleRow = Library:Create("Frame", {
            Name = "TitleRow",
            Parent = Content,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            LayoutOrder = 1
        })
        Library:Create("UIListLayout", {
            Parent = TitleRow,
            Padding = UDim.new(0, 6),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center
        })

        if Icon then
            Library:Create("ImageLabel", {
                Name = "Icon",
                Parent = TitleRow,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(0, 16, 0, 16),
                Image = Library:Asset(Icon),
                ImageColor3 = Color3.fromRGB(255, 0, 127)
            })
        end

        local TitleLbl = Library:Create("TextLabel", {
            Name = "Title",
            Parent = TitleRow,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(0, 0, 0, 0),
            Font = Enum.Font.GothamBold,
            Text = Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            RichText = true,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        Library:Create("UIGradient", {
            Parent = TitleLbl,
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.75, Color3.fromRGB(200, 200, 200)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))
            },
            Rotation = 90
        })

        -- Mô tả
        if Desc ~= "" then
            Library:Create("TextLabel", {
                Name = "Desc",
                Parent = Content,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.new(1, 0, 0, 0),
                Font = Enum.Font.GothamMedium,
                Text = Desc,
                TextColor3 = Color3.fromRGB(200, 200, 200),
                TextSize = 11,
                TextTransparency = 0.2,
                TextWrapped = true,
                RichText = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 2
            })
        end

        -- Progress bar (bottom)
        local Progress = Library:Create("Frame", {
            Name = "Progress",
            Parent = Card,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(75, 0, 38),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 1, 0),
            Size = UDim2.new(1, 0, 0, 2)
        })
        Library:Create("UICorner", { Parent = Progress, CornerRadius = UDim.new(0, 2) })

        -- Slide in
        Library:Tween({ v = Card, t = 0.4, s = "Exponential", d = "Out", g = { Position = UDim2.new(0, 0, 0, 0) } }):Play()
        Library:Tween({ v = Progress, t = Duration, s = "Linear", d = "Out", g = { Size = UDim2.new(0, 0, 0, 2) } }):Play()

        task.delay(Duration, function()
            Library:Tween({ v = Card, t = 0.3, s = "Exponential", d = "In", g = { Position = UDim2.new(0, 270, 0, 0) } }):Play()
            task.delay(0.35, function() Wrapper:Destroy() end)
        end)
    end

    function Library:Toast(Args)
        local Message  = Args.Message or Args.Title or "Done"
        local Duration = Args.Duration or 2.5

        local Container = GetToastContainer()

        local Toast = Library:Create("Frame", {
            Name = "Toast",
            Parent = Container,
            BackgroundColor3 = Color3.fromRGB(18, 18, 18),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        })

        Library:Create("UICorner", { Parent = Toast, CornerRadius = UDim.new(1, 0) })

        Library:Create("UIStroke", {
            Parent = Toast,
            Color = Color3.fromRGB(75, 0, 38),
            Thickness = 0.8
        })

        Library:Create("UIPadding", {
            Parent = Toast,
            PaddingTop    = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft   = UDim.new(0, 14),
            PaddingRight  = UDim.new(0, 14)
        })

        local Msg = Library:Create("TextLabel", {
            Name = "Message",
            Parent = Toast,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.new(0, 0, 0, 0),
            Font = Enum.Font.GothamSemibold,
            Text = Message,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 11,
            TextTransparency = 1
        })

        Library:Tween({ v = Toast, t = 0.25, s = "Exponential", d = "Out", g = { BackgroundTransparency = 0 } }):Play()
        Library:Tween({ v = Msg,   t = 0.25, s = "Exponential", d = "Out", g = { TextTransparency = 0 } }):Play()

        task.delay(Duration, function()
            Library:Tween({ v = Toast, t = 0.25, s = "Exponential", d = "Out", g = { BackgroundTransparency = 1 } }):Play()
            Library:Tween({ v = Msg,   t = 0.25, s = "Exponential", d = "Out", g = { TextTransparency = 1 } }):Play()
            task.delay(0.3, function() Toast:Destroy() end)
        end)
    end

function Library:Window(Args)
    local Title = Args.Title or "Xova's Project"
    local SubTitle = Args.SubTitle or "Made by s1nve"
    local WelcomeTitle = Args.WelcomeTitle or Title
    local LogoId = Args.Logo or 15707987574
    local PlayerName = game:GetService("Players").LocalPlayer.Name

    local Xova = Library:Create("ScreenGui", {
        Name = "Xova",
        Parent = Library:Parent(),
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        IgnoreGuiInset = true
    })

    local Background_1 = Library:Create("Frame", {
        Name = "Background",
        Parent = Xova,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(11, 11, 11),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 500, 0, 350)
    })
    
    function Library:IsDropdownOpen()
        for _, v in pairs(Background_1:GetChildren()) do
            if v.Name == "Dropdown" and v.Visible then
                return true
            end
        end
    end

    Library:Create("UICorner", {
        Parent = Background_1
    })

    Library:Create("ImageLabel", {
        Name = "Shadow",
        Parent = Background_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 120, 1, 120),
        ZIndex = 0,
        Image = "rbxassetid://8992230677",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(99, 99, 99, 99)
    })

    -- Header
    local Header_1 = Library:Create("Frame", {
        Name = "Header",
        Parent = Background_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40)
    })

    -- Return button
    local Return_1 = Library:Create("ImageLabel", {
        Name = "Return",
        Parent = Header_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 25, 0.5, 1),
        Size = UDim2.new(0, 27, 0, 27),
        Image = "rbxassetid://130391877219356",
        ImageColor3 = Color3.fromRGB(255, 0, 127),
        Visible = false
    })

    Library:Create("UIGradient", {
        Parent = Return_1,
        Rotation = 90,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 56, 56))
        },
    })

    -- HeadScale
    local HeadScale_1 = Library:Create("Frame", {
        Name = "HeadScale",
        Parent = Header_1,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIListLayout", {
        Parent = HeadScale_1,
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    Library:Create("UIPadding", {
        Parent = HeadScale_1,
        PaddingBottom = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 20)
    })

    -- Info (title + subtitle)
    local Info_1 = Library:Create("Frame", {
        Name = "Info",
        Parent = HeadScale_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -100, 0, 28)
    })

    Library:Create("UIListLayout", {
        Parent = Info_1,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local Title_1 = Library:Create("TextLabel", {
        Name = "Title",
        Parent = Info_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 14),
        Font = Enum.Font.GothamBold,
        RichText = true,
        Text = Title,
        TextColor3 = Color3.fromRGB(255, 0, 127),
        TextSize = 14,
        TextStrokeTransparency = 0.699999988079071,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    Library:Create("UIGradient", {
        Parent = Title_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    Library:Create("TextLabel", {
        Name = "SubTitle",
        Parent = Info_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 10),
        Font = Enum.Font.GothamMedium,
        RichText = true,
        Text = SubTitle,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 10,
        TextStrokeTransparency = 0.699999988079071,
        TextTransparency = 0.6,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    -- Expires
    local Expires_1 = Library:Create("Frame", {
        Name = "Expires",
        Parent = HeadScale_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.787233949, 0, -3.5, 0),
        Size = UDim2.new(0, 100, 0, 40)
    })

    Library:Create("UIListLayout", {
        Parent = Expires_1,
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    local Asset_1 = Library:Create("ImageLabel", {
        Name = "Asset",
        Parent = Expires_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 20, 0, 20),
        Image = "rbxassetid://100865348188048",
        ImageColor3 = Color3.fromRGB(255, 0, 127),
        LayoutOrder = 1
    })

    Library:Create("UIGradient", {
        Parent = Asset_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    -- Info_2 (expires title + time)
    local Info_2 = Library:Create("Frame", {
        Name = "Info",
        Parent = Expires_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 28)
    })

    Library:Create("UIListLayout", {
        Parent = Info_2,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local Title_2 = Library:Create("TextLabel", {
        Name = "Title",
        Parent = Info_2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 14),
        Font = Enum.Font.GothamSemibold,
        RichText = true,
        Text = "Expires at",
        TextColor3 = Color3.fromRGB(255, 0, 127),
        TextSize = 13,
        TextStrokeTransparency = 0.699999988079071,
        TextXAlignment = Enum.TextXAlignment.Right
    })

    Library:Create("UIGradient", {
        Parent = Title_2,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    local THETIME = Library:Create("TextLabel", {
        Name = "Time",
        Parent = Info_2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 10),
        Font = Enum.Font.GothamMedium,
        RichText = true,
        Text = "00:00:00 Hours",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 10,
        TextStrokeTransparency = 0.699999988079071,
        TextTransparency = 0.6,
        TextXAlignment = Enum.TextXAlignment.Right
    })
    
    

    -- Scale (body)
    local Scale_1 = Library:Create("Frame", {
        Name = "Scale",
        Parent = Background_1,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 1, 0),
        Size = UDim2.new(1, 0, 1, -40)
    })

    local Home_1 = Library:Create("Frame", {
        Name = "Home",
        Parent = Scale_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIPadding", {
        Parent = Home_1,
        PaddingBottom = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14)
    })

    local MainTabsScrolling = Library:Create("ScrollingFrame", {
        Name = "ScrollingFrame",
        Parent = Home_1,
        Active = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        ClipsDescendants = true,
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
        CanvasPosition = Vector2.new(0, 0),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        ScrollBarImageTransparency = 0,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.XY,
        TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
        VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
    })

    Library:Create("UIPadding", {
        Parent = MainTabsScrolling,
        PaddingBottom = UDim.new(0, 1),
        PaddingLeft = UDim.new(0, 1),
        PaddingRight = UDim.new(0, 1),
        PaddingTop = UDim.new(0, 1)
    })

    local UIListLayout_1 = Library:Create("UIListLayout", {
        Parent = MainTabsScrolling,
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Wraps = true
    })

local WelcomeCard = Library:Create("Frame", {
        Name = "WelcomeCard",
        Parent = MainTabsScrolling,
        BackgroundColor3 = Color3.fromRGB(15, 8, 8),
        BorderSizePixel = 0,
        LayoutOrder = -999,
        Size = UDim2.new(1, -2, 0, 62),
    })

    Library:Create("UICorner", { Parent = WelcomeCard, CornerRadius = UDim.new(0, 7) })
    Library:Create("UIStroke", { Parent = WelcomeCard, Color = THEME_DIM, Thickness = 1 })

    -- Subtle red glow banner image
    Library:Create("ImageLabel", {
        Parent = WelcomeCard,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Image = "rbxassetid://125411502674016",
        ImageColor3 = THEME,
        ImageTransparency = 0.82,
        ScaleType = Enum.ScaleType.Crop,
    })

    -- Logo circle on left
    local WelcomeLogo = Library:Create("ImageLabel", {
        Name = "WelcomeLogo",
        Parent = WelcomeCard,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(30, 10, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0.5, 0),
        Size = UDim2.new(0, 40, 0, 40),
        Image = Library:Asset(LogoId),
        ImageColor3 = Color3.fromRGB(255, 255, 255),
    })
    Library:Create("UICorner", { Parent = WelcomeLogo, CornerRadius = UDim.new(1, 0) })
    --Library:Create("UIStroke", { Parent = WelcomeLogo, Color = THEME, Thickness = 1.5 })

    -- Text block
    local WelcomeText = Library:Create("Frame", {
        Name = "WelcomeText",
        Parent = WelcomeCard,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 58, 0.5, 0),
        Size = UDim2.new(1, -68, 0, 48),
    })
    Library:Create("UIListLayout", {
        Parent = WelcomeText,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })

    -- "Welcome to X, PlayerName!"
    Library:Create("TextLabel", {
        Parent = WelcomeText,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 16),
        Font = Enum.Font.GothamBold,
        RichText = true,
        Text = "Welcome to APPLE HUB CAT,  <font color='#FF3050'>" .. PlayerName .. "!</font>",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
    })

    -- "@username"
    Library:Create("TextLabel", {
        Parent = WelcomeText,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 12),
        Font = Enum.Font.GothamMedium,
        Text = "@" .. PlayerName,
        TextColor3 = Color3.fromRGB(180, 180, 180),
        TextTransparency = 0.2,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 2,
    })

    -- subtitle tagline
    Library:Create("TextLabel", {
        Parent = WelcomeText,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 11),
        Font = Enum.Font.Gotham,
        Text = "Apple Hub | Join Discord For Updates!",
        TextColor3 = Color3.fromRGB(160, 160, 160),
        TextTransparency = 0.25,
        TextSize = 9,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 3,
    })

    UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        MainTabsScrolling.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y + 15)
    end)

    local PageService: UIPageLayout = Library:Create("UIPageLayout", {
        Parent = Scale_1
    })

    local Window = {}

function Window:NewPage(Args)
    local Title = Args.Title or "Unknown"
    local Desc = Args.Desc or "Description"
    local Icon = Args.Icon or 15707987574

    local NewTabs = Library:Create("Frame", {
        Name = "NewTabs",
        Parent = MainTabsScrolling,
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 230, 0, 55)
    })

    local Click = Library:Button(NewTabs)

    Library:Create("UICorner", {
        Parent = NewTabs,
        CornerRadius = UDim.new(0, 5)
    })

    Library:Create("UIStroke", {
        Parent = NewTabs,
        Color = Color3.fromRGB(75, 0, 38),
        Thickness = 1
    })

    local Banner_1 = Library:Create("ImageLabel", {
        Name = "Banner",
        Parent = NewTabs,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Image = "rbxassetid://125411502674016",
        ImageColor3 = Color3.fromRGB(255, 0, 128),
        ScaleType = Enum.ScaleType.Crop
    })

    Library:Create("UICorner", {
        Parent = Banner_1,
        CornerRadius = UDim.new(0, 2)
    })

    local Info_1 = Library:Create("Frame", {
        Name = "Info",
        Parent = NewTabs,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    Library:Create("UIListLayout", {
        Parent = Info_1,
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    Library:Create("UIPadding", {
        Parent = Info_1,
        PaddingLeft = UDim.new(0, 15)
    })

    local Icon_1 = Library:Create("ImageLabel", {
        Name = "Icon",
        Parent = Info_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = -1,
        Size = UDim2.new(0, 25, 0, 25),
        Image = Library:Asset(Icon),
        ImageColor3 = Color3.fromRGB(255, 0, 127)
    })

    Library:Create("UIGradient", {
        Parent = Icon_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    local Text_1 = Library:Create("Frame", {
        Name = "Text",
        Parent = Info_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.111111209, 0, 0.144444451, 0),
        Size = UDim2.new(0, 150, 0, 32)
    })

    Library:Create("UIListLayout", {
        Parent = Text_1,
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center
    })

    local Title_1 = Library:Create("TextLabel", {
        Name = "Title",
        Parent = Text_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 150, 0, 14),
        Font = Enum.Font.GothamBold,
        RichText = true,
        Text = Title,
        TextColor3 = Color3.fromRGB(255, 0, 127),
        TextSize = 15,
        TextStrokeTransparency = 0.449999988079071,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    Library:Create("UIGradient", {
        Parent = Title_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
        },
        Rotation = 90
    })

    Library:Create("TextLabel", {
        Name = "Desc",
        Parent = Text_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0.899999976, 0, 0, 10),
        Font = Enum.Font.GothamMedium,
        RichText = true,
        Text = Desc,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 10,
        TextStrokeTransparency = 0.5,
        TextTransparency = 0.20000000298023224,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local NewPage = Library:Create("Frame", {
        Name = "NewPage",
        Parent = Scale_1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0)
    })

    local PageScrolling_1 = Library:Create("ScrollingFrame", {
        Name = "PageScrolling",
        Parent = NewPage,
        Active = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        ClipsDescendants = true,
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
        CanvasPosition = Vector2.new(0, 0),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        HorizontalScrollBarInset = Enum.ScrollBarInset.None,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        ScrollBarImageTransparency = 0,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.XY,
        TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
        VerticalScrollBarInset = Enum.ScrollBarInset.None,
        VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
    })

    Library:Create("UIPadding", {
        Parent = PageScrolling_1,
        PaddingBottom = UDim.new(0, 1),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 1)
    })

    local UIListLayout_2 = Library:Create("UIListLayout", {
        Parent = PageScrolling_1,
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PageScrolling_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 15)
    end)

    local function OnChangPage()
        local RightTweening = Library:Tween({
            v = HeadScale_1,
            t = 0.2,
            s = "Exponential",
            d = "Out",
            g = {
                Size = UDim2.new(1, -30, 1, 0)
            }
        }):Play()

        Return_1.Visible = true

        PageService:JumpTo(NewPage)
    end

    local Page = {}

        function Page:Section(Text)
            local Title = Library:Create("TextLabel", {
                Name = "Title",
                Parent = PageScrolling_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 0, 20),
                Font = Enum.Font.GothamBold,
                RichText = true,
                Text = " " .. Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 15,
                TextStrokeTransparency = 0.7,
                TextXAlignment = Enum.TextXAlignment.Left
            })

            Library:Create("UIGradient", {
                Parent = Title,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                },
                Rotation = 90
            })

            return Title
        end

        function Page:Paragraph(Args)
            local Title = Args.Title
            local Desc = Args.Desc
            local Icon = Args.Image

            local Rows = Library:NewRows(PageScrolling_1, Title, Desc)

            local Left = Rows.Vectorize.Left.Text
            local Right = Rows.Vectorize.Right

            local IconLabel = Library:Create("ImageLabel", {
                Parent = Right,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0.5, 0.5, 1),
                Size = UDim2.new(0, 20, 0, 20),
                Image = Library:Asset(Icon),
                ImageColor3 = Color3.fromRGB(255, 0, 127),
            })

            Library:Create("UIGradient", {
                Parent = IconLabel,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                },
                Rotation = 90
            })

            local Data = {
                Title = Title,
                Desc = Desc,
                Icon = IconLabel,
                Instance = Rows
            }

            local Attribute = setmetatable({}, {
                __newindex = function(t, k, v)
                    rawset(Data, k, v)
                    if k == "Title" then
                        Left.Title.Text = tostring(v)
                    elseif k == "Desc" then
                        Left.Desc.Text = tostring(v)
                    end
                end,
                __index = Data
            })

            return Attribute
        end
        
function Page:InfoNguyenNhat(InfoArgs)
    -- Fallback theme colors 
    local THEME = Color3.fromRGB(255, 0, 128) 
    local THEME_DIM = Color3.fromRGB(75, 0, 38)

    local OwnersRow = Library:Create("Frame", {
        Name = "OwnersRow",
        Parent = PageScrolling_1,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = -998,
        Size = UDim2.new(1, 0, 0, 60),
    })

    Library:Create("UIListLayout", {
        Parent = OwnersRow,
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8),
    })

    local function MakeOwnerCard(parent, layoutOrder, avatarId, name, role, socials)
        local Card = Library:Create("Frame", {
            Name = "OwnerCard",
            Parent = parent,
            BackgroundColor3 = Color3.fromRGB(15, 8, 8),
            BorderSizePixel = 0,
            LayoutOrder = layoutOrder,
            Size = UDim2.new(1, 0, 1, 0),
        })
        
        Library:Create("UICorner", { Parent = Card, CornerRadius = UDim.new(0, 7) })
        Library:Create("UIStroke", { Parent = Card, Color = THEME_DIM, Thickness = 1 })

        -- Faint banner
        Library:Create("ImageLabel", {
            Parent = Card,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Image = "rbxassetid://125411502674016",
            ImageColor3 = THEME,
            ImageTransparency = 0.87,
            ScaleType = Enum.ScaleType.Crop,
        })

        -- Avatar
        local AvatarFrame = Library:Create("ImageLabel", {
            Name = "Avatar",
            Parent = Card,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(30, 10, 10),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 8, 0.5, 0),
            Size = UDim2.new(0, 36, 0, 36),
            Image = "rbxassetid://" .. tostring(avatarId), -- Đã sửa biến dev.avatar thành avatarId
            ImageColor3 = Color3.fromRGB(255, 255, 255),
        })
        Library:Create("UICorner", { Parent = AvatarFrame, CornerRadius = UDim.new(1, 0) })

        -- Text Frame (Thu hẹp chiều rộng xuống -160 để không đè vào icon bên phải)
        local CardText = Library:Create("Frame", {
            Parent = Card,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 52, 0.5, 0),
            Size = UDim2.new(1, -160, 0, 40),
        })
        
        Library:Create("UIListLayout", {
            Parent = CardText,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
            VerticalAlignment = Enum.VerticalAlignment.Center,
        })
        
        Library:Create("TextLabel", {
            Parent = CardText,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 14),
            Font = Enum.Font.GothamBold,
            Text = role,
            TextColor3 = THEME,
            TextSize = 18,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 1,
        })
        
        Library:Create("TextLabel", {
            Parent = CardText,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 12),
            Font = Enum.Font.GothamSemibold,
            Text = name,
            TextColor3 = Color3.fromRGB(230, 230, 230),
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 2,
        })

        -- Khung chứa các nút Mạng xã hội ở góc phải thẻ
        local SocialsContainer = Library:Create("Frame", {
            Name = "SocialsContainer",
            Parent = Card,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, -12, 0.5, 0),
            Size = UDim2.new(0, 90, 0, 24),
        })

        Library:Create("UIListLayout", {
            Parent = SocialsContainer,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })

        -- Hàm tạo nút Icon MXH nhanh
        local function AddSocialIcon(iconId, link, layoutOrder)
            if not link or link == "" then return end
            
            local IconBtn = Library:Create("ImageButton", {
                Parent = SocialsContainer,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 20, 0, 20),
                Image = iconId,
                ImageColor3 = Color3.fromRGB(220, 220, 220),
                LayoutOrder = layoutOrder,
            })

            IconBtn.MouseButton1Click:Connect(function()
                pcall(function()
                    setclipboard(link)
                end)
                -- Hiệu ứng đổi màu báo hiệu đã copy thành công (Xanh lá)
                IconBtn.ImageColor3 = Color3.fromRGB(0, 255, 128)
                task.delay(1, function()
                    IconBtn.ImageColor3 = Color3.fromRGB(220, 220, 220)
                end)
            end)
        end

        -- Thêm các icon tương ứng nếu có link truyền vào
        AddSocialIcon("rbxassetid://121947318640922", socials.Discord, 1)
        AddSocialIcon("rbxassetid://87683378476912", socials.Tiktok, 2)
        AddSocialIcon("rbxassetid://82508315710236", socials.Youtube, 3) 
    end

    -- Xử lý dữ liệu đầu vào từ InfoArgs
    if InfoArgs.Developers then
        for i, dev in ipairs(InfoArgs.Developers) do
            local socialData = dev.Socials or {Discord = "", Tiktok = "", Youtube = ""}
            MakeOwnerCard(OwnersRow, i, dev.Avatar or 6443528638, dev.Name or "Developer", dev.Role or "Script Developer", socialData)
        end
    else
        local DevName = InfoArgs.Developer and InfoArgs.Developer.Name or "Developer"
        local DevRole = InfoArgs.Developer and InfoArgs.Developer.Role or "Script Developer"
        local DevAvatar = InfoArgs.Developer and InfoArgs.Developer.Avatar or 6443528638
        
        -- Link mặc định nếu bạn gọi lẻ hàm không truyền dữ liệu link
        local DevSocials = InfoArgs.Developer and InfoArgs.Developer.Socials or {
            Discord = "https://discord.gg/6mnF7haEjd",
            Tiktok = "https://www.tiktok.com/@toitenhoaikhuong?_r=1&_t=ZS-96mBSJObeKb",
            Youtube = "https://youtube.com/@hirimitinyy?si=1qhruuCFdg5Rzx6i"
        }
        
        MakeOwnerCard(OwnersRow, 1, DevAvatar, DevName, DevRole, DevSocials)
    end

    return OwnersRow
end

function Page:Discord(InfoArgs)
    local THEME = Color3.fromRGB(255, 0, 128)
    local THEME_DIM = Color3.fromRGB(75, 0, 38)

    local serverName = InfoArgs.ServerName or "Discord Server"
    local serverDesc = InfoArgs.ServerDescription or "Tham gia cộng đồng của chúng tôi!"
    local serverIcon = InfoArgs.ServerIcon or "rbxassetid://125411502674016"
    local inviteURL = InfoArgs.InviteURL or "https://discord.gg/6mnF7haEjd"

    if type(serverIcon) == "number" then
        serverIcon = "rbxassetid://" .. serverIcon
    end

    local DiscordFrame = Library:Create("Frame", {
        Name = "DiscordInvite",
        Parent = PageScrolling_1,
        BackgroundColor3 = Color3.fromRGB(15, 8, 8),
        BorderSizePixel = 0,
        LayoutOrder = -998,
        Size = UDim2.new(1, 0, 0, 60), 
    })

    Library:Create("UICorner", { Parent = DiscordFrame, CornerRadius = UDim.new(0, 7) })
    Library:Create("UIStroke", { Parent = DiscordFrame, Color = THEME_DIM, Thickness = 1 })

    local MainLayout = Library:Create("UIListLayout", {
        Parent = DiscordFrame,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12),
    })

    local LeftPadding = Library:Create("UIPadding", {
        Parent = DiscordFrame,
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
    })

    local IconFrame = Library:Create("ImageLabel", {
        Name = "ServerIcon",
        Parent = DiscordFrame,
        BackgroundColor3 = Color3.fromRGB(30, 10, 10),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 42, 0, 42),
        Image = serverIcon,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = 1,
    })
    Library:Create("UICorner", { Parent = IconFrame, CornerRadius = UDim.new(1, 0) })

    local TextFrame = Library:Create("Frame", {
        Parent = DiscordFrame,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -166, 1, 0), -- SỬA Ở ĐÂY: Trừ chuẩn 166px (Icon + Button + Padding) để không bị đẩy lệch nút
        LayoutOrder = 2,
    })

    Library:Create("UIListLayout", {
        Parent = TextFrame,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })

    Library:Create("TextLabel", {
        Parent = TextFrame,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 18),
        Font = Enum.Font.GothamBold,
        Text = serverName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
    })

    Library:Create("TextLabel", {
        Parent = TextFrame,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 13),
        Font = Enum.Font.GothamSemibold,
        Text = serverDesc,
        TextColor3 = Color3.fromRGB(160, 160, 160),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 2,
    })

    local JoinButton = Library:Create("TextButton", {
        Name = "JoinButton",
        Parent = DiscordFrame,
        BackgroundColor3 = THEME,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 100, 0, 32),
        Text = "Join Discord",
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        LayoutOrder = 3,
    })
    Library:Create("UICorner", { Parent = JoinButton, CornerRadius = UDim.new(0, 6) })

    JoinButton.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(inviteURL)
        end)
        JoinButton.Text = "Copy Url Done!"
        JoinButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        task.delay(1.5, function()
            JoinButton.Text = "Join Discord"
            JoinButton.BackgroundColor3 = THEME
        end)
    end)

    return DiscordFrame
end


        function Page:RightLabel(Args)
            local Title = Args.Title
            local Desc = Args.Desc
            local RightText = Args.Right or "None"

            local Rows = Library:NewRows(PageScrolling_1, Title, Desc)

            local Right = Rows.Vectorize.Right

            local Title_1 = Library:Create("TextLabel", {
                Name = "Title",
                Parent = Right,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = -1,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 0, 13),
                Selectable = false,
                Font = Enum.Font.GothamSemibold,
                RichText = true,
                Text = RightText,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                TextStrokeTransparency = 0.699999988079071,
                TextXAlignment = Enum.TextXAlignment.Right
            })

            Library:Create("UIGradient", {
                Parent = Title_1,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                },
                Rotation = 90
            })

            return Title_1
        end

        function Page:Button(Args)
    local Title = Args.Title
    local Desc = Args.Desc
    local Text = Args.Text or "Click"
    local Callback = Args.Callback

    local Rows = Library:NewRows(PageScrolling_1, Title, Desc)

    local Right = Rows.Vectorize.Right
    -- [THÊM MỚI] Lấy thông tin vùng Text bên trái để xử lý layout
    local Left = Rows.Vectorize.Left.Text
    local TitleLabel = Left.Title

    -- [THÊM MỚI] Lưu lại cấu hình mặc định
    local ListLayout = Left:FindFirstChildOfClass("UIListLayout")
    local OriginalVerticalAlign = ListLayout and ListLayout.VerticalAlignment
    local OriginalTextSize = TitleLabel.TextSize
    local OriginalSize = TitleLabel.Size
    local OriginalYAlignment = TitleLabel.TextYAlignment

    local Button = Library:Create("Frame", {
        Name = "Button",
        Parent = Right,
        BackgroundColor3 = Color3.fromRGB(255, 0, 127),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.730158806, 0, 0.166666672, 0),
        Size = UDim2.new(0, 75, 0, 25)
    })

    Library:Create("UICorner", {
        Parent = Button,
        CornerRadius = UDim.new(0, 3)
    })

    Library:Create("UIGradient", {
        Parent = Button,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 56, 56))
        },
        Rotation = 90
    })

    local TextLabel: TextLabel = Library:Create("TextLabel", {
        Name = "Title",
        Parent = Button,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.GothamSemibold,
        RichText = true,
        Text = Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        TextStrokeTransparency = 0.699999988079071
    })

    Button.Size = UDim2.new(0, TextLabel.TextBounds.X + 40, 0, 25)

    local Click = Library:Button(Button)

    -- [THÊM MỚI] Hàm cập nhật trạng thái hiển thị của Title dựa theo Desc
    local function UpdateLayout()
        local HasDesc = Desc and Desc ~= ""
        
        if Left:FindFirstChild("Desc") then
            Left.Desc.Visible = HasDesc
            Left.Desc.Text = tostring(Desc or "")
        end
        
        if HasDesc then
            -- Nếu có Desc thì giữ nguyên kích thước nhỏ ban đầu
            TitleLabel.TextSize = OriginalTextSize
            TitleLabel.Size = OriginalSize
            TitleLabel.TextYAlignment = OriginalYAlignment
            if ListLayout then
                ListLayout.VerticalAlignment = OriginalVerticalAlign
            end
        else
            -- Nếu KHÔNG CÓ Desc thì phóng to chữ và căn giữa dọc hàng
            TitleLabel.TextSize = OriginalTextSize + 3
            TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
            
            if ListLayout then
                ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            else
                TitleLabel.Size = UDim2.new(1, 0, 1, 0)
            end
            
            -- Bỏ dấu `--` ở dưới nếu muốn chữ nhảy ra CHÍNH GIỮA hàng (theo chiều ngang):
            -- TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
        end
    end

    local function Onlick()
        if Library:IsDropdownOpen() then return end
        task.spawn(Library.Effect, Click, Button)
        if Callback then Callback() end
    end

    Click.MouseButton1Click:Connect(Onlick)

    -- [THÊM MỚI] Chạy kiểm tra bố cục ngay khi khởi tạo Button
    UpdateLayout()

    return Click
end

        function Page:Toggle(Args)
    local Title = Args.Title
    local Desc = Args.Desc
    local Value = Args.Value or false
    local Callback = Args.Callback or function() end

    local Rows = Library:NewRows(PageScrolling_1, Title, Desc)

    local Left = Rows.Vectorize.Left.Text
    local Right = Rows.Vectorize.Right
    local TitleLabel = Left.Title

    -- [THÊM MỚI] Lưu lại các thuộc tính gốc để có thể khôi phục khi cần
    local ListLayout = Left:FindFirstChildOfClass("UIListLayout")
    local OriginalVerticalAlign = ListLayout and ListLayout.VerticalAlignment
    local OriginalTextSize = TitleLabel.TextSize
    local OriginalSize = TitleLabel.Size
    local OriginalYAlignment = TitleLabel.TextYAlignment

    local Background = Library:Create("Frame", {
        Name = "Background",
        Parent = Right,
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 20, 0, 20)
    })
    
    local UIStroke = Library:Create("UIStroke", {
        Parent = Background,
        Color = Color3.fromRGB(25, 25, 25),
        Thickness = 0.5
    })

    Library:Create("UICorner", {
        Parent = Background,
        CornerRadius = UDim.new(0, 5)
    })

    local Highligh_1 = Library:Create("Frame", {
        Name = "Highligh",
        Parent = Background,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 0, 127),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 20, 0, 20)
    })

    Library:Create("UICorner", {
        Parent = Highligh_1,
        CornerRadius = UDim.new(0, 5)
    })

    Library:Create("UIGradient", {
        Parent = Highligh_1,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 56, 56))
                },
        Rotation = 90
    })

    local ImageLabel_1 = Library:Create("ImageLabel", {
        Parent = Highligh_1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0.45, 0, 0.45, 0),
        Image = "rbxassetid://86682186031062"
    })

    local Click = Library:Button(Background)

    local Data = {
        Title = Title,
        Desc = Desc,
        Value = Value
    }

    -- [THÊM MỚI] Hàm xử lý căn giữa và phóng to Title khi không có Desc
    local function UpdateLayout()
        local HasDesc = Data.Desc and Data.Desc ~= ""
        
        -- Ẩn/Hiện text Desc dựa trên việc nó có dữ liệu hay không
        if Left:FindFirstChild("Desc") then
            Left.Desc.Visible = HasDesc
            Left.Desc.Text = tostring(Data.Desc or "")
        end
        
        if HasDesc then
            -- Khôi phục cấu trúc mặc định nếu CÓ Desc
            TitleLabel.TextSize = OriginalTextSize
            TitleLabel.Size = OriginalSize
            TitleLabel.TextYAlignment = OriginalYAlignment
            if ListLayout then
                ListLayout.VerticalAlignment = OriginalVerticalAlign
            end
        else
            -- Tùy chỉnh chỉnh layout nếu KHÔNG CÓ Desc
            TitleLabel.TextSize = OriginalTextSize + 3             -- Phóng to tiêu đề thêm 3 đơn vị
            TitleLabel.TextYAlignment = Enum.TextYAlignment.Center -- Căn giữa theo chiều dọc
            
            if ListLayout then
                ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            else
                TitleLabel.Size = UDim2.new(1, 0, 1, 0) -- Phủ kín khung Left để tự động căn giữa dọc
            end
            
            -- LƯU Ý: Nếu bạn muốn căn giữa chữ theo chiều NGANG (chữ nhảy ra giữa dòng), 
            -- hãy bỏ dấu comment (--) ở dòng ngay dưới đây:
            -- TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
        end
    end

    local function OnChanged(value)
        if value then
            Callback(Data.Value)

            ImageLabel_1.Size = UDim2.new(0.85, 0, 0.85, 0)
            TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 127)

            Library:Tween({ v = Highligh_1, t = 0.5, s = "Exponential", d = "Out", g = { BackgroundTransparency = 0 } }):Play()
            Library:Tween({ v = ImageLabel_1, t = 0.5, s = "Exponential", d = "Out", g = { ImageTransparency = 0 } }):Play()
            Library:Tween({ v = ImageLabel_1, t = 0.3, s = "Exponential", d = "Out", g = { Size = UDim2.new(0.5, 0, 0.5, 0) } }):Play()
            UIStroke.Thickness = 0
        else
            Callback(Data.Value)

            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            Library:Tween({ v = Highligh_1, t = 0.5, s = "Exponential", d = "Out", g = { BackgroundTransparency = 1 } }):Play()
            Library:Tween({ v = ImageLabel_1, t = 0.5, s = "Exponential", d = "Out", g = { ImageTransparency = 1 } }):Play()
            UIStroke.Thickness = 0.5
        end
    end

    local function Init()
        Data.Value = not Data.Value
        OnChanged(Data.Value)
    end

    local Attribute = setmetatable({}, {
        __newindex = function(t, k, v)
            rawset(Data, k, v)
            if k == "Title" then
                Left.Title.Text = tostring(v)
            elseif k == "Desc" then
                UpdateLayout() -- [CẬP NHẬT] Gọi hàm đổi layout khi Desc được thay đổi động
            elseif k == "Value" then
                Data.Value = v
                OnChanged(v)
            end
        end,
        __index = Data
    })

    Click.MouseButton1Click:Connect(function()
        if Library:IsDropdownOpen() then return end
        
        Init()
    end)
    
    OnChanged(Data.Value)
    UpdateLayout() -- [THÊM MỚI] Kích hoạt kiểm tra layout ngay khi khởi tạo Toggle

    return Attribute
end


        function Page:Slider(Args)
            local Title = Args.Title
            local Min = Args.Min
            local Max = Args.Max
            local Rounding = Args.Rounding or 0
            local Value = Args.Value or Min
            local Callback = Args.Callback or function() end

            local Slider_1 = Library:Create("Frame", {
                Name = "Slider",
                Parent = PageScrolling_1,
                BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 42),
                Selectable = false
            })

            Library:Create("UICorner", {
                Parent = Slider_1,
                CornerRadius = UDim.new(0, 3)
            })

            Library:Create("UIStroke", {
                Parent = Slider_1,
                Color = Color3.fromRGB(25, 25, 25),
                Thickness = 0.5
            })

            Library:Create("UIPadding", {
                Parent = Slider_1,
                PaddingBottom = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            })

            local Text_1 = Library:Create("Frame", {
                Name = "Text",
                Parent = Slider_1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0.1, 0),
                Size = UDim2.new(0, 111, 0, 22),
                Selectable = false
            })

            Library:Create("UIListLayout", {
                Parent = Text_1,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center
            })

            Library:Create("UIPadding", {
                Parent = Text_1,
                PaddingBottom = UDim.new(0, 3)
            })

            local Title_1 = Library:Create("TextLabel", {
                Name = "Title",
                Parent = Text_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = -1,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 0, 13),
                Selectable = false,
                Font = Enum.Font.GothamSemibold,
                RichText = true,
                Text = Title,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                TextStrokeTransparency = 0.699999988079071,
                TextXAlignment = Enum.TextXAlignment.Left
            })

            Library:Create("UIGradient", {
                Parent = Title_1,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                },
                Rotation = 90
            })

            local Scaling_1 = Library:Create("Frame", {
                Name = "Scaling",
                Parent = Slider_1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Selectable = false
            })

            local Slide_1 = Library:Create("Frame", {
                Name = "Slide",
                Parent = Scaling_1,
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, 0),
                Size = UDim2.new(1, 0, 0, 23),
                Selectable = false
            })

            local ColorBar_1 = Library:Create("Frame", {
                Name = "ColorBar",
                Parent = Slide_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(10, 10, 10),
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 0, 5),
                Selectable = false
            })

            Library:Create("UICorner", {
                Parent = ColorBar_1,
                CornerRadius = UDim.new(0, 3)
            })

            local ColorBar_2 = Library:Create("Frame", {
                Name = "ColorBar",
                Parent = ColorBar_1,
                BackgroundColor3 = Color3.fromRGB(255, 0, 127),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 0, 1, 0),
                Selectable = false
            })

            Library:Create("UICorner", {
                Parent = ColorBar_2,
                CornerRadius = UDim.new(0, 3)
            })

            Library:Create("UIGradient", {
                Parent = ColorBar_2,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(47, 47, 47))
                },
                Rotation = 90
            })

            Library:Create("Frame", {
                Name = "Circle",
                Parent = ColorBar_2,
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.new(0, 5, 0, 11),
                Selectable = false
            })

            local Boxvalue_1 = Library:Create("TextBox", {
                Name = "Boxvalue",
                Parent = Scaling_1,
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(1, -5, 0.449, -2),
                Size = UDim2.new(0, 60, 0, 15),
                ZIndex = 5,
                Font = Enum.Font.GothamMedium,
                PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
                Text = tostring(Value),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 11,
                TextTransparency = 0.5,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Right
            })

            local pink  = Color3.fromRGB(255, 0, 127)
            local white = Color3.fromRGB(255, 255, 255)
            local dragging = false

            local function Round(n, decimals)
                local factor = 10 ^ decimals
                return math.floor(n * factor + 0.5) / factor
            end

            local function UpdateSlider(val)
                val = math.clamp(val, Min, Max)
                val = Round(val, Rounding)

                local ratio = (val - Min) / (Max - Min)

                Library:Tween({
                    v = ColorBar_2,
                    t = 0.1,
                    s = "Linear",
                    d = "Out",
                    g = { Size = UDim2.new(ratio, 0, 1, 0) }
                }):Play()

                Boxvalue_1.Text = tostring(val)
                Callback(val)

                return val
            end

            local function GetValueFromInput(input)
                local absX = ColorBar_1.AbsolutePosition.X
                local absW = ColorBar_1.AbsoluteSize.X
                local ratio = math.clamp((input.Position.X - absX) / absW, 0, 1)
                return ratio * (Max - Min) + Min
            end

            local function SetDragging(state)
                dragging = state

                if state then
                    Library:Tween({ v = Boxvalue_1, t = 0.3, s = "Back", d = "Out", g = { TextSize = 15 } }):Play()
                    Library:Tween({ v = Boxvalue_1, t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = pink  } }):Play()
                    Library:Tween({ v = Title_1,    t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = pink  } }):Play()
                else
                    Library:Tween({ v = Boxvalue_1, t = 0.3, s = "Back", d = "Out", g = { TextSize = 11 } }):Play()
                    Library:Tween({ v = Boxvalue_1, t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = white } }):Play()
                    Library:Tween({ v = Title_1,    t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = white } }):Play()
                end
            end

            local function SetFocused(state)
                if state then
                    Library:Tween({ v = Boxvalue_1, t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = pink  } }):Play()
                    Library:Tween({ v = Title_1,    t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = pink  } }):Play()
                else
                    Library:Tween({ v = Boxvalue_1, t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = white } }):Play()
                    Library:Tween({ v = Title_1,    t = 0.2, s = "Exponential", d = "Out", g = { TextColor3 = white } }):Play()
                end
            end

            local ClickButton = Library:Button(Slider_1)

            ClickButton.InputBegan:Connect(function(input)
                if Library:IsDropdownOpen() then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1
                    or input.UserInputType == Enum.UserInputType.Touch then
                    SetDragging(true)
                    UpdateSlider(GetValueFromInput(input))
                end
            end)

            ClickButton.InputEnded:Connect(function(input)
                if Library:IsDropdownOpen() then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1
                    or input.UserInputType == Enum.UserInputType.Touch then
                    SetDragging(false)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if Library:IsDropdownOpen() then return end
                if dragging and (
                    input.UserInputType == Enum.UserInputType.MouseMovement
                        or input.UserInputType == Enum.UserInputType.Touch
                    ) then
                    UpdateSlider(GetValueFromInput(input))
                end
            end)

            Boxvalue_1.Focused:Connect(function()
                SetFocused(true)
            end)

            Boxvalue_1.FocusLost:Connect(function()
                SetFocused(false)
                local val = tonumber(Boxvalue_1.Text) or Value
                Value = UpdateSlider(val)
            end)

            UpdateSlider(Value)
        end
        
        function Page:Input(Args)
            local Value = Args.Value or ""
            local Callback = Args.Callback or function() end
            
            local Input_1 = Library:Create("Frame", {
                Name = "Input",
                Parent = PageScrolling_1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                Selectable = false
            })

            Library:Create("UIListLayout", {
                Parent = Input_1,
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center
            })

            local Front_1 = Library:Create("Frame", {
                Name = "Front",
                Parent = Input_1,
                BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                BorderSizePixel = 0,
                Size = UDim2.new(1, -35, 1, 0),
                Selectable = false
            })

            Library:Create("UICorner", {
                Parent = Front_1,
                CornerRadius = UDim.new(0, 2)
            })

            Library:Create("UIStroke", {
                Parent = Front_1,
                Color = Color3.fromRGB(25, 25, 25),
                Thickness = 0.5
            })

            local TextBox_1 = Library:Create("TextBox", {
                Parent = Front_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, -20, 1, 0),
                Font = Enum.Font.GothamMedium,
                PlaceholderColor3 = Color3.fromRGB(55, 55, 55),
                PlaceholderText = "Paste your text input here.",
                Text = tostring(Value),
                TextColor3 = Color3.fromRGB(100, 100, 100),
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left
            })

            local Enter_1 = Library:Create("Frame", {
                Name = "Enter",
                Parent = Input_1,
                BackgroundColor3 = Color3.fromRGB(255, 0, 127),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 30, 0, 30),
                Selectable = false
            })

            Library:Create("UICorner", {
                Parent = Enter_1,
                CornerRadius = UDim.new(0, 3)
            })

            Library:Create("UIGradient", {
                Parent = Enter_1,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 56, 56))
                },
                Rotation = 90
            })

            local Asset = Library:Create("ImageLabel", {
                Name = "Asset",
                Parent = Enter_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(0, 15, 0, 15),
                Image = "rbxassetid://78020815235467"
            })

            local Copy = Library:Button(Enter_1)

            local function Submit()
                if TextBox_1.Text ~= "" then
                    Callback(TextBox_1.Text)
                end
            end

            TextBox_1.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    Submit()
                end
            end)

            Copy.MouseButton1Click:Connect(function()
                if Library:IsDropdownOpen() then return end
                
                pcall(setclipboard, Value)
                
                Asset.Image = "rbxassetid://121742282171603"
                
                delay(3, function()
                    Asset.Image = "rbxassetid://78020815235467"
                end)
            end)
            
            return TextBox_1
        end
        
        function Page:Dropdown(Args)
            local Title = Args.Title
            local List = Args.List
            local Value = Args.Value
            local Callback = Args.Callback

            local IsMulti = typeof(Value) == "table" and true or false

            local Rows = Library:NewRows(PageScrolling_1, Title, "N/A")
            local Right = Rows.Vectorize.Right

            local Icon = Library:Create("ImageLabel", {
                Parent = Right,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 20, 0, 20),
                Image = "rbxassetid://132291592681506",
                ImageTransparency = 0.5
            })

            local Open = Library:Button(Rows.Vectorize)
            local Left = Rows.Vectorize.Left.Text

            local function GetText()
                if IsMulti then
                    return table.concat(Value, ", ")
                end
                return tostring(Value)
            end

            Left.Desc.Text = GetText()

            do
                local Dropdown_1 = Library:Create("Frame", {
                    Name = "Dropdown",
                    Parent = Background_1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(18, 18, 18),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.5, 0, 0.3, 0),
                    Size = UDim2.new(0, 300, 0, 250),
                    ZIndex = 500,
                    Selectable = false,
                    Visible = false
                })

                Library:Create("UICorner", {
                    Parent = Dropdown_1,
                    CornerRadius = UDim.new(0, 3)
                })

                Library:Create("UIStroke", {
                    Parent = Dropdown_1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Thickness = 0.5
                })

                Library:Create("UIListLayout", {
                    Parent = Dropdown_1,
                    Padding = UDim.new(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })

                Library:Create("UIPadding", {
                    Parent = Dropdown_1,
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 10)
                })

                local Text_1 = Library:Create("Frame", {
                    Name = "Text",
                    Parent = Dropdown_1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = -5,
                    Size = UDim2.new(1, 0, 0, 30),
                    ZIndex = 500,
                    Selectable = false
                })

                Library:Create("UIListLayout", {
                    Parent = Text_1,
                    Padding = UDim.new(0, 1),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })

                local Title_1 = Library:Create("TextLabel", {
                    Name = "Title",
                    Parent = Text_1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = -1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 0, 13),
                    ZIndex = 500,
                    Selectable = false,
                    Font = Enum.Font.GothamSemibold,
                    RichText = true,
                    Text = Title,
                    TextColor3 = Color3.fromRGB(255, 0, 127),
                    TextSize = 14,
                    TextStrokeTransparency = 0.699999988079071,
                    TextXAlignment = Enum.TextXAlignment.Left
                })

                Library:Create("UIGradient", {
                    Parent = Title_1,
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                    },
                    Rotation = 90
                })

                local Desc_1 = Library:Create("TextLabel", {
                    Name = "Desc",
                    Parent = Text_1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 0, 10),
                    ZIndex = 500,
                    Selectable = false,
                    Font = Enum.Font.GothamMedium,
                    RichText = true,
                    Text = GetText(),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 10,
                    TextStrokeTransparency = 0.699999988079071,
                    TextTransparency = 0.6,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextXAlignment = Enum.TextXAlignment.Left
                })

                local Input_1 = Library:Create("Frame", {
                    Name = "Input",
                    Parent = Dropdown_1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = -4,
                    Size = UDim2.new(1, 0, 0, 25),
                    ZIndex = 500,
                    Selectable = false
                })

                Library:Create("UIListLayout", {
                    Parent = Input_1,
                    Padding = UDim.new(0, 5),
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })

                local Front_1 = Library:Create("Frame", {
                    Name = "Front",
                    Parent = Input_1,
                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    ZIndex = 500,
                    Selectable = false
                })

                Library:Create("UICorner", {
                    Parent = Front_1,
                    CornerRadius = UDim.new(0, 2)
                })

                Library:Create("UIStroke", {
                    Parent = Front_1,
                    Color = Color3.fromRGB(25, 25, 25),
                    Thickness = 0.5
                })

                local TextBox_1 = Library:Create("TextBox", {
                    Name = "Search",
                    Parent = Front_1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    CursorPosition = -1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, -20, 1, 0),
                    ZIndex = 500,
                    Font = Enum.Font.GothamMedium,
                    PlaceholderColor3 = Color3.fromRGB(55, 55, 55),
                    PlaceholderText = "Search",
                    Text = "",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left
                })

                local List_1 = Library:Create("ScrollingFrame", {
                    Name = "List",
                    Parent = Dropdown_1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 160),
                    ZIndex = 500,
                    ScrollBarThickness = 0
                })

                local ScrollLayout = Library:Create("UIListLayout", {
                    Parent = List_1,
                    Padding = UDim.new(0, 3),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })

                Library:Create("UIPadding", {
                    Parent = List_1,
                    PaddingLeft = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1)
                })

                ScrollLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                    List_1.CanvasSize = UDim2.new(0, 0, 0, ScrollLayout.AbsoluteContentSize.Y + 15)
                end)

                local selectedValues = {}
                local selectedOrder = 0

                local function isValueInTable(val, tbl)
                    if type(tbl) ~= "table" then return false end
                    for _, v in pairs(tbl) do
                        if v == val then return true end
                    end
                    return false
                end

                local function Settext()
                    if IsMulti then
                        Desc_1.Text = table.concat(Value, ", ")
                        Left.Desc.Text = table.concat(Value, ", ")
                    else
                        Desc_1.Text = tostring(Value)
                        Left.Desc.Text = tostring(Value)
                    end
                end

                local isOpen = false

                UserInputService.InputBegan:Connect(function(A)
                    if not isOpen then return end

                    local mouse = LocalPlayer:GetMouse()
                    local mx, my = mouse.X, mouse.Y
                    local DBP, DBS = Dropdown_1.AbsolutePosition, Dropdown_1.AbsoluteSize

                    if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
                        if not (mx >= DBP.X and mx <= DBP.X + DBS.X and my >= DBP.Y and my <= DBP.Y + DBS.Y) then
                            isOpen = false
                            Dropdown_1.Visible = false
                            Dropdown_1.Position = UDim2.new(0.5, 0, 0.3, 0)
                        end
                    end
                end)

                Open.MouseButton1Click:Connect(function()
                    if Library:IsDropdownOpen() then return end
                    
                    isOpen = not isOpen

                    if isOpen then
                        Dropdown_1.Visible = true
                        Library:Tween({ v = Dropdown_1, t = 0.3, s = "Back", d = "Out", g = { Position = UDim2.new(0.5, 0, 0.5, 0) } }):Play()
                    else
                        Dropdown_1.Visible = false
                        Dropdown_1.Position = UDim2.new(0.5, 0, 0.3, 0)
                    end
                end)

                local Setting = {}

                function Setting:Clear(a)
                    for _, v in ipairs(List_1:GetChildren()) do
                        if v:IsA("Frame") then
                            local shouldClear = a == nil or (type(a) == "string" and v.Title.Text == a) or (type(a) == "table" and isValueInTable(v.Title.Text, a))
                            if shouldClear then
                                v:Destroy()
                            end
                        end
                    end

                    if a == nil then
                        Value = nil
                        selectedValues = {}
                        selectedOrder = 0
                        Desc_1.Text = "None"
                        Left.Desc.Text = "None"
                    end
                end

                function Setting:AddList(Name)
                    local NewList_1 = Library:Create("Frame", {
                        Name = "NewList",
                        Parent = List_1,
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 0,
                        Size = UDim2.new(1, 0, 0, 25),
                        ZIndex = 500,
                        Selectable = false
                    })

                    Library:Create("UICorner", {
                        Parent = NewList_1,
                        CornerRadius = UDim.new(0, 2)
                    })

                    local Title_2 = Library:Create("TextLabel", {
                        Name = "Title",
                        Parent = NewList_1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = -1,
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        Size = UDim2.new(1, -15, 1, 0),
                        ZIndex = 500,
                        Selectable = false,
                        Font = Enum.Font.GothamSemibold,
                        RichText = true,
                        Text = tostring(Name),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 11,
                        TextStrokeTransparency = 0.699999988079071,
                        TextXAlignment = Enum.TextXAlignment.Left
                    })

                    Library:Create("UIGradient", {
                        Parent = Title_2,
                        Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(0.749568, Color3.fromRGB(163, 163, 163)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
                        },
                        Rotation = 90
                    })

                    local function OnValue(value)
                        Title_2.TextColor3 = value and Color3.fromRGB(255, 0, 127) or Color3.fromRGB(255, 255, 255)

                        if value then
                            Library:Tween({
                                v = NewList_1,
                                t = 0.2,
                                s = "Linear",
                                d = "Out",
                                g = { BackgroundTransparency = 0.85 }
                            }):Play()
                        else
                            Library:Tween({
                                v = NewList_1,
                                t = 0.2,
                                s = "Linear",
                                d = "Out",
                                g = { BackgroundTransparency = 1 }
                            }):Play()
                        end
                    end

                    local Click = Library:Button(Title_2)

                    local function OnSelected()
                        if IsMulti then
                            if selectedValues[Name] then
                                selectedValues[Name] = nil
                                NewList_1.LayoutOrder = 0
                                OnValue(false)
                            else
                                selectedOrder = selectedOrder - 1
                                selectedValues[Name] = selectedOrder
                                NewList_1.LayoutOrder = selectedOrder
                                OnValue(true)
                            end

                            local selectedList = {}
                            for i in pairs(selectedValues) do table.insert(selectedList, i) end

                            if #selectedList > 0 then
                                table.sort(selectedList)
                                Value = selectedList
                                Settext()
                            else
                                Desc_1.Text = "N/A"
                                Left.Desc.Text = "N/A"
                            end

                            pcall(Callback, selectedList)
                        else
                            for _, v in pairs(List_1:GetChildren()) do
                                if v:IsA("Frame") and v.Name == 'NewList' then
                                    v.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    Library:Tween({
                                        v = v,
                                        t = 0.2,
                                        s = "Linear",
                                        d = "Out",
                                        g = { BackgroundTransparency = 1 }
                                    }):Play()
                                end
                            end

                            OnValue(true)
                            Value = Name
                            Settext()
                            pcall(Callback, Value)
                        end
                    end

                    delay(0, function()
                        if IsMulti then
                            if isValueInTable(Name, Value) then
                                selectedOrder = selectedOrder - 1
                                selectedValues[Name] = selectedOrder
                                NewList_1.LayoutOrder = selectedOrder
                                OnValue(true)
                                local selectedList = {}
                                for i in pairs(selectedValues) do table.insert(selectedList, i) end
                                if #selectedList > 0 then
                                    table.sort(selectedList)
                                    Settext()
                                else
                                    Desc_1.Text = "N/A"
                                    Left.Desc.Text = "N/A"
                                end
                                pcall(Callback, selectedList)
                            end
                        else
                            if Name == Value then
                                OnValue(true)
                                Settext()
                                pcall(Callback, Value)
                            end
                        end
                    end)

                    Click.MouseButton1Click:Connect(OnSelected)
                end

                TextBox_1.Changed:Connect(function()
                    local SearchT = string.lower(TextBox_1.Text)
                    for _, v in pairs(List_1:GetChildren()) do
                        if v:IsA("Frame") and v.Name == 'NewList' then
                            v.Visible = string.find(string.lower(v.Title.Text), SearchT, 1, true) ~= nil
                        end
                    end
                end)

                do
                    for _, name in ipairs(List) do
                        Setting:AddList(name)
                    end
                end
            end
        end
        
        function Page:Banner(Assets)
            local NewBanner_1 = Library:Create("ImageLabel", {
                Name = "NewBanner",
                Parent = PageScrolling_1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 235),
                Image = Library:Asset(Assets),
                ScaleType = Enum.ScaleType.Crop
            })

            Library:Create("UICorner", {
                Parent = NewBanner_1,
                CornerRadius = UDim.new(0, 3)
            })
            
            return NewBanner_1
        end

        Click.MouseButton1Click:Connect(OnChangPage)

        return Page
    end

    do
        PageService:JumpTo(Home_1)
        Library:Draggable(Background_1) 

        PageService.HorizontalAlignment = Enum.HorizontalAlignment.Left
        PageService.EasingStyle = Enum.EasingStyle.Exponential
        PageService.TweenTime = 0.5
        
        PageService.GamepadInputEnabled = false
        PageService.ScrollWheelInputEnabled = false
        PageService.TouchInputEnabled = false
        
        Library.PageService = PageService

        Scale_1.ClipsDescendants = true

        local Return_Button = Library:Button(Return_1)

        local function OnReturn()
            Return_1.Visible = false

            Library:Tween({
                v = HeadScale_1,
                t = 0.3,
                s = "Exponential",
                d = "Out",
                g = {
                    Size = UDim2.new(1, 0, 1, 0)
                }
            }):Play()

            PageService:JumpTo(Home_1)
        end
        
        do
            local ToggleScreen = Library:Create("ScreenGui", {
                Name = "Xova",
                Parent = Library:Parent(),
                ZIndexBehavior = Enum.ZIndexBehavior.Global,
                IgnoreGuiInset = true
            })
            
            local Pillow_1 = Library:Create("TextButton", {
                Name = "Pillow",
                Parent = ToggleScreen,
                BackgroundColor3 = Color3.fromRGB(11, 11, 11),
                BorderSizePixel = 0,
                Position = UDim2.new(0.06, 0, 0.15, 0),
                Size = UDim2.new(0, 50, 0, 50),
                Text = ""
            })

            Library:Create("UICorner", {
                Parent = Pillow_1,
                CornerRadius = UDim.new(1, 0)
            })

            Library:Create("ImageLabel", {
                Name = "Logo",
                Parent = Pillow_1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(0.5, 0, 0.5, 0),
                Image = "rbxassetid://15435099885"
            })

            Library:Draggable(Pillow_1)
            
            Pillow_1.MouseButton1Click:Connect(function()
                Background_1.Visible = not Background_1.Visible
            end)
            
            UserInputService.InputBegan:Connect(function(Input, Processed)
                if Processed then return end
                
                if Input.KeyCode == Enum.KeyCode.LeftControl then
                    Background_1.Visible = not Background_1.Visible
                end
            end)
        end

        do
            local WindowSize = 1.45
            
            local Scaler = Library:Create("UIScale", {
                Parent = Xova,
                Scale = if Mobile then 1 else WindowSize
            })
            
            function Library:SizeSlider(Page, Plugins)
                return Plugins:Slider(Page, "Interface Scaler", { 1, 2, 2 }, "Interface Scaler", function(v)
                    Scaler.Scale = v
                end)
            end
            
            function Library:SetTimeValue(Value)
                THETIME.Text = Value
            end
        end

        Return_Button.MouseButton1Click:Connect(OnReturn)
    end

    return Window
end

--return Library
