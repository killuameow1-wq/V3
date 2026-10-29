-- Pluma UI v19.4.1 Anime Premium Edition
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)
getgenv().Pluma = {}

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
if not player then return end

for _, name in ipairs({"PlumaTest","PlumaUI","PlumaUIv9","PlumaUIv10","PlumaUIv11","PlumaUIv12","PlumaUIv13","PlumaUIv14","PlumaUIv15","PlumaUIv16","PlumaUIv17","PlumaUIv18","PlumaLite","PlumaV19","PlumaV193","PlumaV1931","PlumaV1932","PlumaV1933","PlumaV1934","PlumaV1935","PlumaV1936","PlumaV1937","PlumaV1938","PlumaV1939","PlumaV19310","PlumaV19311","PlumaV19312","PlumaV19313","PlumaV19314","PlumaV19315","PlumaV19316","PlumaV19317","PlumaV19318","PlumaV19319","PlumaV19320","PlumaV19321","PlumaV19322","PlumaV19323","PlumaV19324","PlumaV19325","PlumaV19326","PlumaV19327","PlumaV19328","PlumaV19329","PlumaV1940","PlumaV1941"}) do
    local old = player.PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local plumaGui = Instance.new("ScreenGui")
plumaGui.Name = "PlumaUI"
plumaGui.ResetOnSpawn = false
plumaGui.IgnoreGuiInset = true
plumaGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
plumaGui.DisplayOrder = 999
plumaGui.Parent = player.PlayerGui

local Config = {
    aimOn=false, aimPlayers=true, aimBots=true, wallCheck=true, smartTargets=true, autoPriority=true, aimMemory=true,
    torsoFallback=true, adaptiveSmooth=true, triggerBot=false, autoReload=false, aimVehicles=false, aimPreset="fast",
    boxEsp=false, lineEsp=false, nickEsp=false, hpBar=false, adminEsp=false, botEsp=false, tracer=false, chams=false, distEsp=false, lootEsp=false, teamCheck=true, zoneEsp=false,
    fullbright=false, noFog=false, noclip=false, fastInteract=false,
    antiRagdoll=false, antiAfk=false, antiKick=true, autoRejoin=false,
    lootBaseRadius=250, lootDrawRadius=600,
    aimFov=250
}

-- Аниме-палитра (Неон + Пастель)
local C = {
    bg=Color3.fromRGB(15, 15, 25), side=Color3.fromRGB(20, 20, 35), card=Color3.fromRGB(30, 30, 50),
    accent=Color3.fromRGB(255, 100, 200), -- Розовый неон
    accent2=Color3.fromRGB(100, 200, 255), -- Голубой неон
    text=Color3.fromRGB(255, 255, 255), sub=Color3.fromRGB(150, 150, 180),
    btn=Color3.fromRGB(45, 45, 70), btnHov=Color3.fromRGB(60, 60, 90), danger=Color3.fromRGB(255, 80, 100),
    toggleOn=Color3.fromRGB(255, 100, 200), zoneNear=Color3.fromRGB(100, 255, 200), zoneFar=Color3.fromRGB(100, 200, 255),
    xp=Color3.fromRGB(255, 220, 100), purple=Color3.fromRGB(180, 100, 255), green=Color3.fromRGB(100, 255, 150),
    red=Color3.fromRGB(255, 80, 80), bot=Color3.fromRGB(100, 200, 255), loot=Color3.fromRGB(255, 200, 50)
}

local function toast(title, desc)
    local t = Instance.new("Frame"); t.Size = UDim2.new(0,260,0,60); t.Position = UDim2.new(1,-280,0,50)
    t.BackgroundColor3 = C.side; t.BorderSizePixel = 0; t.Parent = plumaGui
    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0,10); tc.Parent = t
    local ts = Instance.new("UIStroke"); ts.Color = C.accent; ts.Thickness = 1.5; ts.Transparency = 0.2; ts.Parent = t
    local tl = Instance.new("TextLabel"); tl.Size = UDim2.new(1,-16,0,24); tl.Position = UDim2.new(0,8,0,6); tl.BackgroundTransparency = 1; tl.Text = title; tl.TextColor3 = C.accent; tl.TextSize = 13; tl.Font = Enum.Font.GothamBold; tl.TextXAlignment = Enum.TextXAlignment.Left; tl.Parent = t
    local td = Instance.new("TextLabel"); td.Size = UDim2.new(1,-16,0,20); td.Position = UDim2.new(0,8,0,30); td.BackgroundTransparency = 1; td.Text = desc; td.TextColor3 = C.text; td.TextSize = 11; td.Font = Enum.Font.Gotham; td.TextXAlignment = Enum.TextXAlignment.Left; td.TextWrapped = true; td.Parent = t
    task.delay(3.5, function() t:Destroy() end)
end

local fab = Instance.new("TextButton"); fab.Size = UDim2.new(0,56,0,56); fab.Position = UDim2.new(0,20,0,120)
fab.BackgroundColor3 = C.accent; fab.Text = "◆"; fab.TextColor3 = C.text; fab.TextSize = 24; fab.Font = Enum.Font.GothamBold; fab.AutoButtonColor = false; fab.Visible = false; fab.Parent = plumaGui
local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(1,0); fc.Parent = fab
local fs = Instance.new("UIStroke"); fs.Color = C.accent2; fs.Thickness = 2; fs.Transparency = 0.5; fs.Parent = fab

local watermark = Instance.new("Frame"); watermark.Size = UDim2.new(0,220,0,30); watermark.Position = UDim2.new(1,-240,0,16); watermark.BackgroundColor3 = C.side; watermark.BackgroundTransparency = 0.2; watermark.BorderSizePixel = 0; watermark.Parent = plumaGui
local wmc = Instance.new("UICorner"); wmc.CornerRadius = UDim.new(0,8); wmc.Parent = watermark
local wms = Instance.new("UIStroke"); wms.Color = C.accent2; wms.Thickness = 1; wms.Transparency = 0.4; wms.Parent = watermark
local wmLabel = Instance.new("TextLabel"); wmLabel.Size = UDim2.new(1,-12,1,0); wmLabel.Position = UDim2.new(0,8,0,0); wmLabel.BackgroundTransparency = 1; wmLabel.Text = "Pluma v19.4.1 Anime"; wmLabel.TextColor3 = C.accent2; wmLabel.TextSize = 11; wmLabel.Font = Enum.Font.GothamBold; wmLabel.TextXAlignment = Enum.TextXAlignment.Left; wmLabel.Parent = watermark

-- === ПЛАВАЮЩАЯ КНОПКА АИМА (Anime Style) ===
local aimFab = Instance.new("TextButton")
aimFab.Size = UDim2.new(0, 60, 0, 60)
aimFab.Position = UDim2.new(0, 20, 1, -130)
aimFab.BackgroundColor3 = C.bg
aimFab.BackgroundTransparency = 0.2
aimFab.Text = "✜"
aimFab.TextColor3 = C.accent
aimFab.TextSize = 28
aimFab.Font = Enum.Font.GothamBold
aimFab.AutoButtonColor = false
aimFab.Parent = plumaGui
local afc = Instance.new("UICorner"); afc.CornerRadius = UDim.new(1,0); afc.Parent = aimFab
local afs = Instance.new("UIStroke"); afs.Color = C.accent; afs.Thickness = 2; afs.Transparency = 0.3; afs.Parent = aimFab

local aimMenu = Instance.new("Frame")
aimMenu.Size = UDim2.new(0, 220, 0, 220)
aimMenu.Position = UDim2.new(0, 90, 1, -260)
aimMenu.BackgroundColor3 = C.bg
aimMenu.BackgroundTransparency = 0.1
aimMenu.BorderSizePixel = 0
aimMenu.Visible = false
aimMenu.Parent = plumaGui
local amc = Instance.new("UICorner"); amc.CornerRadius = UDim.new(0,12); amc.Parent = aimMenu
local ams = Instance.new("UIStroke"); ams.Color = C.accent; ams.Thickness = 1.5; ams.Transparency = 0.2; ams.Parent = aimMenu

-- Делаем меню FOV перетаскиваемым, но не самим ползунком
local amDrag = false
aimMenu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        amDrag = true
    end
end)
aimMenu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        amDrag = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if amDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        aimMenu.Position = UDim2.new(aimMenu.Position.X.Scale, aimMenu.Position.X.Offset + input.Delta.X, aimMenu.Position.Y.Scale, aimMenu.Position.Y.Offset + input.Delta.Y)
    end
end)

local aimLbl = Instance.new("TextLabel"); aimLbl.Size = UDim2.new(1,0,0,24); aimLbl.Position = UDim2.new(0,0,0,8); aimLbl.BackgroundTransparency = 1; aimLbl.Text = "⚡ PREMIUM AIM"; aimLbl.TextColor3 = C.accent; aimLbl.Font = Enum.Font.GothamBold; aimLbl.TextSize = 13; aimLbl.Parent = aimMenu

local btnPlayers = Instance.new("TextButton"); btnPlayers.Size = UDim2.new(1,-20,0,30); btnPlayers.Position = UDim2.new(0,10,0,40); btnPlayers.BackgroundColor3 = C.card; btnPlayers.Text = "Aim Players: ON"; btnPlayers.TextColor3 = C.text; btnPlayers.Font = Enum.Font.Gotham; btnPlayers.TextSize = 11; btnPlayers.Parent = aimMenu
local bpc = Instance.new("UICorner"); bpc.CornerRadius = UDim.new(0,6); bpc.Parent = btnPlayers

local btnBots = Instance.new("TextButton"); btnBots.Size = UDim2.new(1,-20,0,30); btnBots.Position = UDim2.new(0,10,0,80); btnBots.BackgroundColor3 = C.card; btnBots.Text = "Aim Bots: ON"; btnBots.TextColor3 = C.text; btnBots.Font = Enum.Font.Gotham; btnBots.TextSize = 11; btnBots.Parent = aimMenu
local bbc = Instance.new("UICorner"); bbc.CornerRadius = UDim.new(0,6); bbc.Parent = btnBots

-- FOV Слайдер (Без движения меню)
local fovLbl = Instance.new("TextLabel"); fovLbl.Size = UDim2.new(1,-20,0,18); fovLbl.Position = UDim2.new(0,10,0,120); fovLbl.BackgroundTransparency = 1; fovLbl.Text = "FOV: 250"; fovLbl.TextColor3 = C.sub; fovLbl.Font = Enum.Font.Gotham; fovLbl.TextSize = 11; fovLbl.TextXAlignment = Enum.TextXAlignment.Left; fovLbl.Parent = aimMenu

local fovBar = Instance.new("Frame"); fovBar.Size = UDim2.new(1,-20,0,12); fovBar.Position = UDim2.new(0,10,0,145); fovBar.BackgroundColor3 = C.card; fovBar.Parent = aimMenu
local fbc = Instance.new("UICorner"); fbc.CornerRadius = UDim.new(1,0); fbc.Parent = fovBar

local fovFill = Instance.new("Frame"); fovFill.Size = UDim2.new(0.5, 0, 1, 0); fovFill.BackgroundColor3 = C.accent2; fovFill.Parent = fovBar
local ffc = Instance.new("UICorner"); ffc.CornerRadius = UDim.new(1,0); ffc.Parent = fovFill

local btnCloseAim = Instance.new("TextButton"); btnCloseAim.Size = UDim2.new(1,-20,0,28); btnCloseAim.Position = UDim2.new(0,10,0,180); btnCloseAim.BackgroundColor3 = C.danger; btnCloseAim.Text = "Close"; btnCloseAim.TextColor3 = C.text; btnCloseAim.Font = Enum.Font.GothamBold; btnCloseAim.TextSize = 11; btnCloseAim.Parent = aimMenu
local bcac = Instance.new("UICorner"); bcac.CornerRadius = UDim.new(0,6); bcac.Parent = btnCloseAim

aimFab.MouseButton1Click:Connect(function() aimMenu.Visible = not aimMenu.Visible end)

btnPlayers.MouseButton1Click:Connect(function()
    Config.aimPlayers = not Config.aimPlayers
    btnPlayers.Text = "Aim Players: " .. (Config.aimPlayers and "ON" or "OFF")
    btnPlayers.BackgroundColor3 = Config.aimPlayers and C.accent or C.card
end)

btnBots.MouseButton1Click:Connect(function()
    Config.aimBots = not Config.aimBots
    btnBots.Text = "Aim Bots: " .. (Config.aimBots and "ON" or "OFF")
    btnBots.BackgroundColor3 = Config.aimBots and C.accent or C.card
end)

btnCloseAim.MouseButton1Click:Connect(function() aimMenu.Visible = false end)

local isDraggingFov = false
fovBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDraggingFov = true
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDraggingFov = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if isDraggingFov and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mouseX = input.Position.X - fovBar.AbsolutePosition.X
        local percent = math.clamp(mouseX / fovBar.AbsoluteSize.X, 0, 1)
        Config.aimFov = math.floor(50 + percent * 450) 
        fovFill.Size = UDim2.new(percent, 0, 1, 0)
        fovLbl.Text = "FOV: " .. Config.aimFov
    end
end)

-- === ОСНОВНОЙ ИНТЕРФЕЙС ===
local main = Instance.new("Frame"); main.Size = UDim2.new(0,470,0,440); main.Position = UDim2.new(0,60,0,60); main.BackgroundColor3 = C.bg; main.BackgroundTransparency = 0.1; main.BorderSizePixel = 0; main.Active = true; main.ClipsDescendants = true; main.Parent = plumaGui
local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0,16); mc.Parent = main
local ms = Instance.new("UIStroke"); ms.Color = C.accent; ms.Thickness = 1.5; ms.Transparency = 0.3; ms.Parent = main

task.spawn(function()
    while main.Parent do
        local vp = Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize or Vector2.new(800,600)
        if vp.X < 520 then local s = vp.X/500; main.Size = UDim2.new(0, math.floor(470*s), 0, math.floor(440*s)) end
        task.wait(1)
    end
end)

local header = Instance.new("Frame"); header.Size = UDim2.new(1,0,0,48); header.BackgroundColor3 = C.side; header.BackgroundTransparency = 0.2; header.BorderSizePixel = 0; header.Parent = main
local hc = Instance.new("UICorner"); hc.CornerRadius = UDim.new(0,16); hc.Parent = header
local hFix = Instance.new("Frame"); hFix.Size = UDim2.new(1,0,0,16); hFix.Position = UDim2.new(0,0,1,-16); hFix.BackgroundColor3 = C.side; hFix.BackgroundTransparency = 0.2; hFix.BorderSizePixel = 0; hFix.Parent = header
local hTitle = Instance.new("TextLabel"); hTitle.Size = UDim2.new(0,160,1,0); hTitle.Position = UDim2.new(0,20,0,0); hTitle.BackgroundTransparency = 1; hTitle.Text = "PLUMA v19.4.1"; hTitle.TextColor3 = C.accent; hTitle.TextSize = 16; hTitle.Font = Enum.Font.GothamBold; hTitle.TextXAlignment = Enum.TextXAlignment.Left; hTitle.Parent = header

local searchBox = Instance.new("Frame"); searchBox.Size = UDim2.new(0,160,0,28); searchBox.Position = UDim2.new(0,160,0.5,-14); searchBox.BackgroundColor3 = C.card; searchBox.BorderSizePixel = 0; searchBox.Parent = header
local sbc = Instance.new("UICorner"); sbc.CornerRadius = UDim.new(0,7); sbc.Parent = searchBox
local searchInput = Instance.new("TextBox"); searchInput.Size = UDim2.new(1,-16,1,0); searchInput.Position = UDim2.new(0,8,0,0); searchInput.BackgroundTransparency = 1; searchInput.PlaceholderText = "search..."; searchInput.PlaceholderColor3 = C.sub; searchInput.Text = ""; searchInput.TextColor3 = C.text; searchInput.TextSize = 11; searchInput.Font = Enum.Font.Gotham; searchInput.TextXAlignment = Enum.TextXAlignment.Left; searchInput.ClearTextOnFocus = false; searchInput.Parent = searchBox

local closeBtn = Instance.new("TextButton"); closeBtn.Size = UDim2.new(0,28,0,28); closeBtn.Position = UDim2.new(1,-38,0.5,-14); closeBtn.BackgroundColor3 = C.card; closeBtn.Text = "✕"; closeBtn.TextColor3 = C.text; closeBtn.TextSize = 14; closeBtn.Font = Enum.Font.GothamBold; closeBtn.AutoButtonColor = false; closeBtn.Parent = header
local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0,7); cc.Parent = closeBtn

local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0,90,1,-48); sidebar.Position = UDim2.new(0,0,0,48); sidebar.BackgroundColor3 = C.side; sidebar.BackgroundTransparency = 0.2; sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 0; sidebar.CanvasSize = UDim2.new(0,0,0,0); sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
sidebar.ScrollingDirection = Enum.ScrollingDirection.Y; sidebar.Parent = main
local sideLayout = Instance.new("UIListLayout"); sideLayout.Padding = UDim.new(0,4); sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; sideLayout.SortOrder = Enum.SortOrder.LayoutOrder; sideLayout.Parent = sidebar
local sidePadding = Instance.new("UIPadding"); sidePadding.PaddingTop = UDim.new(0,10); sidePadding.PaddingBottom = UDim.new(0,10); sidePadding.Parent = sidebar

local tabButtons, pages = {}, {}
local function switchTab(name)
    for tn, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = (tn == name) and C.accent or Color3.fromRGB(0,0,0,0)
        btn.TextColor3 = (tn == name) and C.text or C.sub
    end
    for pn, page in pairs(pages) do page.Visible = (pn == name) end
    local btn = tabButtons[name]
    if btn and sidebar then sidebar.CanvasPosition = Vector2.new(0, math.max(0, btn.AbsolutePosition.Y - sidebar.AbsolutePosition.Y - 40)) end
end

local function createTab(name, icon, displayName, order)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0,74,0,44); btn.BackgroundColor3 = Color3.fromRGB(0,0,0,0); btn.Text = icon .. "\n" .. displayName; btn.TextColor3 = C.sub; btn.TextSize = 9; btn.Font = Enum.Font.GothamMedium; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = sidebar
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,8); bc.Parent = btn
    btn.MouseButton1Click:Connect(function() switchTab(name) end)
    tabButtons[name] = btn
end

local content = Instance.new("Frame"); content.Size = UDim2.new(1,-100,1,-84); content.Position = UDim2.new(0,96,0,54); content.BackgroundTransparency = 1; content.Parent = main

local function createPage(name)
    local scroll = Instance.new("ScrollingFrame"); scroll.Size = UDim2.new(1,0,1,0); scroll.BackgroundTransparency = 1; scroll.ScrollBarThickness = 3; scroll.ScrollBarImageColor3 = C.accent; scroll.CanvasSize = UDim2.new(0,0,0,0); scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y; scroll.Visible = false; scroll.Parent = content
    local l = Instance.new("UIListLayout"); l.Padding = UDim.new(0,6); l.SortOrder = Enum.SortOrder.LayoutOrder; l.Parent = scroll
    pages[name] = scroll
    return scroll
end

local statusBar = Instance.new("Frame"); statusBar.Size = UDim2.new(1,-20,0,26); statusBar.Position = UDim2.new(0,10,1,-34); statusBar.BackgroundColor3 = C.side; statusBar.BackgroundTransparency = 0.2; statusBar.BorderSizePixel = 0; statusBar.Parent = main
local sbc2 = Instance.new("UICorner"); sbc2.CornerRadius = UDim.new(0,7); sbc2.Parent = statusBar
local dot = Instance.new("Frame"); dot.Size = UDim2.new(0,6,0,6); dot.Position = UDim2.new(0,12,0.5,-3); dot.BackgroundColor3 = C.accent; dot.BorderSizePixel = 0; dot.Parent = statusBar
local dc = Instance.new("UICorner"); dc.CornerRadius = UDim.new(1,0); dc.Parent = dot
local st = Instance.new("TextLabel"); st.Size = UDim2.new(1,-34,1,0); st.Position = UDim2.new(0,26,0,0); st.BackgroundTransparency = 1; st.Text = "Готов"; st.TextColor3 = C.text; st.TextSize = 10; st.Font = Enum.Font.Gotham; st.TextXAlignment = Enum.TextXAlignment.Left; st.Parent = statusBar
local function setStatus(txt, err) st.Text = txt; dot.BackgroundColor3 = err and C.danger or C.accent end

local function draggable(frame, handle)
    local dragging, dragInput, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    handle.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+delta.X, startPos.Y.Scale, startPos.Y.Offset+delta.Y)
        end
    end)
end
draggable(main, header); draggable(fab, fab); draggable(watermark, watermark)
draggable(aimFab, aimFab)

local function addSection(parent, text, order)
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,0,0,16); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.accent2; lbl.TextSize = 10; lbl.Font = Enum.Font.GothamBold; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.LayoutOrder = order; lbl.Parent = parent
end

local toggleWidgets = {}
local function makeToggle(parent, key, icon, text, order, cb)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1,0,0,36); btn.BackgroundColor3 = C.card; btn.Text = ""; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = parent
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,10); bc.Parent = btn
    local ic = Instance.new("TextLabel"); ic.Size = UDim2.new(0,22,0,22); ic.Position = UDim2.new(0,8,0.5,-11); ic.BackgroundColor3 = C.btn; ic.Text = icon; ic.TextColor3 = C.accent; ic.TextSize = 12; ic.Font = Enum.Font.GothamBold; ic.Parent = btn
    local icc = Instance.new("UICorner"); icc.CornerRadius = UDim.new(1,0); icc.Parent = ic
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-84,1,0); lbl.Position = UDim2.new(0,38,0,0); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.text; lbl.TextSize = 11; lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = btn
    local track = Instance.new("Frame"); track.Size = UDim2.new(0,30,0,16); track.Position = UDim2.new(1,-42,0.5,-8); track.BackgroundColor3 = C.btnHov; track.BorderSizePixel = 0; track.Parent = btn
    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(1,0); tc.Parent = track
    local knob = Instance.new("Frame"); knob.Size = UDim2.new(0,12,0,12); knob.Position = UDim2.new(0,2,0.5,-6); knob.BackgroundColor3 = C.text; knob.BorderSizePixel = 0; knob.Parent = track
    local kc = Instance.new("UICorner"); kc.CornerRadius = UDim.new(1,0); kc.Parent = knob
    local state = Config[key] or false
    local function refresh()
        track.BackgroundColor3 = state and C.toggleOn or C.btnHov
        knob.Position = state and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
    end
    refresh()
    btn.MouseButton1Click:Connect(function() state = not state; Config[key] = state; refresh(); if cb then cb(state) end end)
    btn:SetAttribute("SearchText", text:lower())
    toggleWidgets[key] = {btn=btn, set=function(v) state=v; Config[key]=v; refresh(); if cb then cb(v) end end}
    return btn
end

local function makeAction(parent, icon, text, order, cb)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1,0,0,36); btn.BackgroundColor3 = C.card; btn.Text = ""; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = parent
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,10); bc.Parent = btn
    local ic = Instance.new("TextLabel"); ic.Size = UDim2.new(0,22,0,22); ic.Position = UDim2.new(0,8,0.5,-11); ic.BackgroundColor3 = C.btn; ic.Text = icon; ic.TextColor3 = C.accent; ic.TextSize = 12; ic.Font = Enum.Font.GothamBold; ic.Parent = btn
    local icc = Instance.new("UICorner"); icc.CornerRadius = UDim.new(1,0); icc.Parent = ic
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-46,1,0); lbl.Position = UDim2.new(0,38,0,0); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.text; lbl.TextSize = 11; lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = btn
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = C.btnHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = C.card end)
    btn.MouseButton1Click:Connect(cb)
    btn:SetAttribute("SearchText", text:lower())
    return btn
end

local function makeInput(parent, text, placeholder, order, cb)
    local wrap = Instance.new("Frame"); wrap.Size = UDim2.new(1,0,0,42); wrap.BackgroundColor3 = C.card; wrap.BorderSizePixel = 0; wrap.LayoutOrder = order; wrap.Parent = parent
    local wc = Instance.new("UICorner"); wc.CornerRadius = UDim.new(0,10); wc.Parent = wrap
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-16,0,16); lbl.Position = UDim2.new(0,8,0,4); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.sub; lbl.TextSize = 10; lbl.Font = Enum.Font.Gotham; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = wrap
    local input = Instance.new("TextBox"); input.Size = UDim2.new(1,-16,0,18); input.Position = UDim2.new(0,8,0,20); input.BackgroundTransparency = 1; input.PlaceholderText = placeholder; input.PlaceholderColor3 = C.sub; input.Text = ""; input.TextColor3 = C.text; input.TextSize = 11; input.Font = Enum.Font.Gotham; input.TextXAlignment = Enum.TextXAlignment.Left; input.ClearTextOnFocus = false; input.Parent = wrap
    input.FocusLost:Connect(function() cb(input.Text) end)
    return wrap
end

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchInput.Text:lower()
    for _, page in pairs(pages) do
        for _, child in ipairs(page:GetChildren()) do
            if child:IsA("TextButton") then
                local s = child:GetAttribute("SearchText") or ""
                child.Visible = (q == "") or s:find(q,1,true) ~= nil
            end
        end
    end
end)

local basePos = nil
task.spawn(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 10)
    if hrp then basePos = hrp.Position end
end)

local function getBasePos()
    if basePos then return basePos end
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then basePos = hrp.Position end
    return basePos
end

local function SafeTeleport(targetCFrame, character)
    if not character then return false end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero end)
    local offset = Vector3.new(math.random(-3,3), 3, math.random(-3,3))
    local finalPos = targetCFrame.Position + offset
    local bp = Instance.new("BodyPosition"); bp.MaxForce = Vector3.new(1e6,1e6,1e6); bp.Position = finalPos; bp.P = 10000; bp.D = 500; bp.Parent = hrp
    local t0 = tick()
    while (hrp.Position - finalPos).Magnitude > 5 and tick() - t0 < 2 do task.wait(0.05) end
    bp:Destroy()
    pcall(function() hrp.CFrame = CFrame.new(finalPos) end)
    return true
end

local zoneCache = {list={}, time=0}
local function getZones()
    if tick() - zoneCache.time < 2 and #zoneCache.list > 0 then return zoneCache.list end
    local zones = {}
    local bp = getBasePos()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local n = obj.Name:lower()
            if n:find("flag") or n:find("zone") or n:find("capture") or n:find("outpost") or n:find("point") or n:find("base") or n:find("spawn") then
                local pos
                if obj:IsA("BasePart") then pos = obj.Position
                elseif obj.PrimaryPart then pos = obj.PrimaryPart.Position
                else local p = obj:FindFirstChildWhichIsA("BasePart"); if p then pos = p.Position end end
                if pos then
                    local isBase = false
                    if bp and (pos - bp).Magnitude < 50 then isBase = true end
                    if not isBase then table.insert(zones, {obj=obj, pos=pos, name=obj.Name}) end
                end
            end
        end
    end
    zoneCache.list = zones; zoneCache.time = tick()
    return zones
end

local zoneFolder = Instance.new("Folder"); zoneFolder.Name = "PlumaZoneESP"; zoneFolder.Parent = Workspace
local function clearZoneESP() for _, v in ipairs(zoneFolder:GetChildren()) do v:Destroy() end end
local function refreshZoneESP()
    clearZoneESP()
    if not Config.zoneEsp then return end
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, z in ipairs(getZones()) do
        local dist = math.floor((z.pos - hrp.Position).Magnitude)
        if dist <= 1000 then
            local ad = z.obj:IsA("BasePart") and z.obj or (z.obj.PrimaryPart or z.obj:FindFirstChildWhichIsA("BasePart"))
            if ad then
                local bill = Instance.new("BillboardGui"); bill.Size = UDim2.new(0,140,0,32); bill.StudsOffset = Vector3.new(0,8,0); bill.Adornee = ad; bill.AlwaysOnTop = true; bill.Parent = zoneFolder
                local bg = Instance.new("Frame"); bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = C.bg; bg.BackgroundTransparency = 0.2; bg.BorderSizePixel = 0; bg.Parent = bill
                local bgc = Instance.new("UICorner"); bgc.CornerRadius = UDim.new(0,6); bgc.Parent = bg
                local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,0.55,0); nl.BackgroundTransparency = 1; nl.Text = z.name; nl.TextColor3 = dist < 120 and C.zoneNear or C.zoneFar; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.Parent = bill
                local il = Instance.new("TextLabel"); il.Size = UDim2.new(1,0,0.45,0); il.Position = UDim2.new(0,0,0.55,0); il.BackgroundTransparency = 1; il.Text = dist .. " studs"; il.TextColor3 = C.sub; il.TextSize = 9; il.Font = Enum.Font.Gotham; il.Parent = bill
            end
        end
    end
end

local espDrawings, adminHighlights, chamHighlights, botESP, lootESP = {}, {}, {}, {}, {}
local espMissing = {}
local lootCache = {models={}, time=0}
local zoneRefreshTimer = 0

local function isAdmin(plr)
    if plr == player then return false end
    local name = plr.Name:lower()
    if name:find("admin") or name:find("owner") or name:find("mod") or name:find("creator") then return true end
    local aa = plr:GetAttribute("Admin") or plr:GetAttribute("IsAdmin") or plr:GetAttribute("Owner")
    if aa == true then return true end
    local ok, rank = pcall(function() return plr:GetRankInGroup(0) end)
    if ok and rank and rank >= 250 then return true end
    return false
end

local function isSameTeam(plr)
    if not Config.teamCheck then return false end
    if player.Team and plr.Team and player.Team == plr.Team then return true end
    return false
end

local function getXP(plr)
    local stats = plr:FindFirstChild("leaderstats")
    if stats then
        for _, v in ipairs(stats:GetChildren()) do
            local n = v.Name:lower()
            if n == "level" or n == "xp" or n == "lvl" then return v.Name .. ": " .. tostring(v.Value) end
        end
    end
end

local function getHPColor(ratio)
    if ratio > 0.5 then return C.green elseif ratio > 0.25 then return C.xp else return C.red end
end

local function createESP(plr)
    if plr == player or espDrawings[plr] then return end
    if isSameTeam(plr) then return end
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
    if not hrp then return end
    local admin = isAdmin(plr)
    local data = {isAdmin=admin}
    local box = Drawing.new("Square"); box.Thickness = admin and 2 or 1; box.Color = admin and C.red or C.purple; box.Filled = false; box.Visible = false
    data.box = box
    local hpBg = Drawing.new("Square"); hpBg.Thickness = 0; hpBg.Color = Color3.fromRGB(30,30,40); hpBg.Filled = true; hpBg.Visible = false
    local hpFill = Drawing.new("Square"); hpFill.Thickness = 0; hpFill.Color = C.green; hpFill.Filled = true; hpFill.Visible = false
    data.hpBg = hpBg; data.hpFill = hpFill
    local lineTo = Drawing.new("Line"); lineTo.Thickness = 1.5; lineTo.Color = C.purple; lineTo.Visible = false; data.lineToPlayer = lineTo
    local tracer = Drawing.new("Line"); tracer.Thickness = 1.2; tracer.Color = Color3.fromRGB(255,160,60); tracer.Visible = false; data.tracer = tracer
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,150,0,16); nickBill.StudsOffset = Vector3.new(0,3.8,0); nickBill.Adornee = hrp; nickBill.AlwaysOnTop = true; nickBill.Enabled = false; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = (admin and "[ADMIN] " or "") .. plr.Name; nl.TextColor3 = admin and C.red or C.green; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.5; nl.Parent = nickBill
    data.nickBill = nickBill
    local xpBill = Instance.new("BillboardGui"); xpBill.Size = UDim2.new(0,160,0,16); xpBill.StudsOffset = Vector3.new(0,2.8,0); xpBill.Adornee = hrp; xpBill.AlwaysOnTop = true; xpBill.Enabled = false; xpBill.Parent = plumaGui
    local xpLbl = Instance.new("TextLabel"); xpLbl.Size = UDim2.new(1,0,1,0); xpLbl.BackgroundTransparency = 1; xpLbl.Text = ""; xpLbl.TextColor3 = C.xp; xpLbl.TextSize = 10; xpLbl.Font = Enum.Font.GothamBold; xpLbl.Parent = xpBill
    data.xpBill = xpBill; data.xpLbl = xpLbl
    local distBill = Instance.new("BillboardGui"); distBill.Size = UDim2.new(0,100,0,14); distBill.StudsOffset = Vector3.new(0,4.6,0); distBill.Adornee = hrp; distBill.AlwaysOnTop = true; distBill.Enabled = false; distBill.Parent = plumaGui
    local distLbl = Instance.new("TextLabel"); distLbl.Size = UDim2.new(1,0,1,0); distLbl.BackgroundTransparency = 1; distLbl.Text = ""; distLbl.TextColor3 = C.purple; distLbl.TextSize = 9; distLbl.Font = Enum.Font.GothamBold; distLbl.Parent = distBill
    data.distBill = distBill; data.distLbl = distLbl
    if admin and Config.adminEsp then
        local hl = Instance.new("Highlight"); hl.FillColor = C.red; hl.FillTransparency = 0.5; hl.OutlineColor = C.red; hl.OutlineTransparency = 0; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Adornee = char; hl.Parent = char; adminHighlights[plr] = hl
    end
    if Config.chams then
        local h = Instance.new("Highlight"); h.FillColor = C.purple; h.FillTransparency = 0.6; h.OutlineColor = C.purple; h.OutlineTransparency = 0; h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; h.Adornee = char; h.Parent = char; chamHighlights[plr] = h
    end
    espDrawings[plr] = data
    espMissing[plr] = nil
end

local function destroyESP(plr)
    local d = espDrawings[plr]
    if not d then return end
    if d.box then d.box:Remove() end
    if d.lineToPlayer then d.lineToPlayer:Remove() end
    if d.tracer then d.tracer:Remove() end
    if d.hpBg then d.hpBg:Remove() end
    if d.hpFill then d.hpFill:Remove() end
    if d.nickBill then d.nickBill:Destroy() end
    if d.xpBill then d.xpBill:Destroy() end
    if d.distBill then d.distBill:Destroy() end
    espDrawings[plr] = nil
    espMissing[plr] = nil
end

local function clearPlayerESP()
    for plr, _ in pairs(espDrawings) do destroyESP(plr) end
    table.clear(espDrawings); table.clear(espMissing)
    for _, h in pairs(adminHighlights) do if h and h.Parent then h:Destroy() end end
    for _, h in pairs(chamHighlights) do if h and h.Parent then h:Destroy() end end
    table.clear(adminHighlights); table.clear(chamHighlights)
end

local function clearBotESP()
    for _, d in pairs(botESP) do
        if d.box then d.box:Remove() end
        if d.hpBg then d.hpBg:Remove() end
        if d.hpFill then d.hpFill:Remove() end
        if d.nick then d.nick:Destroy() end
    end
    table.clear(botESP)
end

local function clearLootESP()
    for _, d in pairs(lootESP) do
        if d.box then d.box:Remove() end
        if d.line then d.line:Remove() end
        if d.nick then d.nick:Destroy() end
        if d.dist then d.dist:Destroy() end
    end
    table.clear(lootESP)
end

local function createBotESP(model)
    if botESP[model] then return end
    local head = model:FindFirstChild("Head"); local hrp = model:FindFirstChild("HumanoidRootPart")
    if not head or not hrp then return end
    local box = Drawing.new("Square"); box.Thickness = 1; box.Color = C.bot; box.Filled = false; box.Visible = false
    local hpBg = Drawing.new("Square"); hpBg.Thickness = 0; hpBg.Color = Color3.fromRGB(30,30,40); hpBg.Filled = true; hpBg.Visible = false
    local hpFill = Drawing.new("Square"); hpFill.Thickness = 0; hpFill.Color = C.green; hpFill.Filled = true; hpFill.Visible = false
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,120,0,14); nickBill.StudsOffset = Vector3.new(0,3.5,0); nickBill.Adornee = head; nickBill.AlwaysOnTop = true; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = "[BOT] " .. model.Name; nl.TextColor3 = C.bot; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.4; nl.Parent = nickBill
    botESP[model] = {box=box, hpBg=hpBg, hpFill=hpFill, nick=nickBill, head=head}
end

local function createLootESP(model, part)
    if lootESP[model] then return end
    local box = Drawing.new("Square"); box.Thickness = 2; box.Color = C.loot; box.Filled = false; box.Visible = false
    local line = Drawing.new("Line"); line.Thickness = 1.5; line.Color = C.loot; line.Visible = false
    
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,160,0,20); nickBill.StudsOffset = Vector3.new(0,2.5,0); nickBill.Adornee = part; nickBill.AlwaysOnTop = true; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = "★ " .. model.Name; nl.TextColor3 = C.loot; nl.TextSize = 12; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.4; nl.Parent = nickBill
    
    local distBill = Instance.new("BillboardGui"); distBill.Size = UDim2.new(0,100,0,14); distBill.StudsOffset = Vector3.new(0,1.5,0); distBill.Adornee = part; distBill.AlwaysOnTop = true; distBill.Parent = plumaGui
    local distLbl = Instance.new("TextLabel"); distLbl.Size = UDim2.new(1,0,1,0); distLbl.BackgroundTransparency = 1; distLbl.Text = ""; distLbl.TextColor3 = C.text; distLbl.TextSize = 10; distLbl.Font = Enum.Font.GothamBold; distLbl.Parent = distBill
    
    lootESP[model] = {box=box, line=line, nick=nickBill, dist=distBill, distLbl=distLbl, part=part}
end

local function hideAllPlayerDrawings(data)
    if data.box then data.box.Visible = false end
    if data.lineToPlayer then data.lineToPlayer.Visible = false end
    if data.tracer then data.tracer.Visible = false end
    if data.hpBg then data.hpBg.Visible = false end
    if data.hpFill then data.hpFill.Visible = false end
    if data.nickBill then data.nickBill.Enabled = false end
    if data.xpBill then data.xpBill.Enabled = false end
    if data.distBill then data.distBill.Enabled = false end
end

local function isLootValid(name, obj)
    local n = string.lower(name or "")
    local exactBad = {"electricbox", "hitbox", "gunmodel", "door", "wall", "floor", "gate", "button", "glass"}
    for _, b in ipairs(exactBad) do if string.find(n, b, 1, true) then return false end end
    local exactGood = {"militarybox", "militarycrate", "matchbox", "ammo", "crate", "clickerdropper", "loot", "drop", "supply"}
    for _, g in ipairs(exactGood) do if string.find(n, g, 1, true) then return true end end
    return false
end

local function updateLootCache(myHrp)
    if not myHrp then return end
    local newList = {}
    local bp = getBasePos()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("Model") or obj:IsA("UnionOperation") then
            if isLootValid(obj.Name, obj) then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part then
                    local dist = (part.Position - myHrp.Position).Magnitude
                    if dist <= (Config.lootDrawRadius or 600) then
                        local onMyBase = false
                        if bp and (part.Position - bp).Magnitude < (Config.lootBaseRadius or 250) then onMyBase = true end
                        if not onMyBase then table.insert(newList, {model=obj, part=part, dist=dist}) end
                    end
                end
            end
        end
    end
    lootCache.models = newList
    lootCache.time = tick()
end

local function updateESP()
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local bp = getBasePos()
    
    if tick() - zoneRefreshTimer > 1.0 then
        zoneRefreshTimer = tick()
        task.spawn(refreshZoneESP)
    end

    for plr, data in pairs(espDrawings) do
        if plr.Parent == nil then destroyESP(plr); continue end
        local char = plr.Character
        local head = char and char:FindFirstChild("Head")
        local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart"))
        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or torso)
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not (char and hrp and head) then
            espMissing[plr] = (espMissing[plr] or 0) + 1
            if espMissing[plr] > 120 then destroyESP(plr) end
            hideAllPlayerDrawings(data)
            continue
        end
        espMissing[plr] = nil
        local distToMe = myHrp and (hrp.Position - myHrp.Position).Magnitude or 0
        if distToMe > 5000 then hideAllPlayerDrawings(data); continue end
        if data.nickBill then
            if data.nickBill.Adornee ~= head then data.nickBill.Adornee = head end
            data.nickBill.Enabled = Config.nickEsp
        end
        if data.xpBill then
            if data.xpBill.Adornee ~= head then data.xpBill.Adornee = head end
            data.xpBill.Enabled = true
            data.xpLbl.Text = getXP(plr) or ""
        end
        if data.distBill then
            if data.distBill.Adornee ~= head then data.distBill.Adornee = head end
            data.distBill.Enabled = Config.distEsp
            data.distLbl.Text = string.format("%d m", math.floor(distToMe))
        end
        local tt, on1 = cam:WorldToViewportPoint(head.Position)
        local bb, on2 = cam:WorldToViewportPoint(hrp.Position)
        local onScreen = on1 and on2 and tt.Z > 0 and bb.Z > 0
        if data.box then
            if Config.boxEsp and onScreen then
                local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
                data.box.Size = Vector2.new(w,h); data.box.Position = Vector2.new(tt.X - w/2, tt.Y); data.box.Visible = true
            else data.box.Visible = false end
        end
        if Config.hpBar and hum and onScreen then
            local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
            local bx = tt.X - w/2 - 7; local by = tt.Y
            local ratio = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
            data.hpBg.Size = Vector2.new(4,h); data.hpBg.Position = Vector2.new(bx,by); data.hpBg.Visible = true
            local fh = h * ratio
            data.hpFill.Size = Vector2.new(4,fh); data.hpFill.Position = Vector2.new(bx, by + (h-fh)); data.hpFill.Color = getHPColor(ratio); data.hpFill.Visible = true
        else
            if data.hpBg then data.hpBg.Visible = false end
            if data.hpFill then data.hpFill.Visible = false end
        end
        if data.lineToPlayer and Config.lineEsp then
            local tS, tOn = cam:WorldToViewportPoint(hrp.Position)
            if tOn and tS.Z > 0 then
                data.lineToPlayer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                data.lineToPlayer.To = Vector2.new(tS.X, tS.Y)
                data.lineToPlayer.Visible = true
            else data.lineToPlayer.Visible = false end
        elseif data.lineToPlayer then data.lineToPlayer.Visible = false end
        if data.tracer and Config.tracer then
            local tS, tOn = cam:WorldToViewportPoint(hrp.Position)
            if tOn and tS.Z > 0 then
                data.tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                data.tracer.To = Vector2.new(tS.X, tS.Y)
                data.tracer.Visible = true
            else data.tracer.Visible = false end
        elseif data.tracer then data.tracer.Visible = false end
    end

    if Config.botEsp then
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and not obj:FindFirstChildOfClass("Player") then
                local hum = obj:FindFirstChildOfClass("Humanoid"); local head = obj:FindFirstChild("Head"); local hrp = obj:FindFirstChild("HumanoidRootPart")
                local isPlr = false
                for _, plr in ipairs(Players:GetPlayers()) do if plr.Character == obj then isPlr = true; break end end
                if hum and head and hrp and not isPlr and hum.Health > 0 then
                    createBotESP(obj)
                    local d = botESP[obj]
                    if d then
                        local tt, on1 = cam:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
                        local bb, on2 = cam:WorldToViewportPoint(hrp.Position - Vector3.new(0,3,0))
                        if on1 and on2 and tt.Z > 0 and bb.Z > 0 then
                            local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
                            d.box.Size = Vector2.new(w,h); d.box.Position = Vector2.new(tt.X - w/2, tt.Y); d.box.Visible = true
                            local ratio = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
                            local bx = tt.X - w/2 - 7
                            d.hpBg.Size = Vector2.new(4,h); d.hpBg.Position = Vector2.new(bx,tt.Y); d.hpBg.Visible = true
                            local fh = h * ratio
                            d.hpFill.Size = Vector2.new(4,fh); d.hpFill.Position = Vector2.new(bx, tt.Y + (h-fh)); d.hpFill.Color = getHPColor(ratio); d.hpFill.Visible = true
                            if d.head and d.nick.Adornee ~= d.head then d.nick.Adornee = d.head end
                            d.nick.Enabled = true
                        else d.box.Visible = false; d.hpBg.Visible = false; d.hpFill.Visible = false; d.nick.Enabled = false end
                    end
                end
            end
        end
        for m, d in pairs(botESP) do
            if not m.Parent then
                if d.box then d.box:Remove() end
                if d.hpBg then d.hpBg:Remove() end
                if d.hpFill then d.hpFill:Remove() end
                if d.nick then d.nick:Destroy() end
                botESP[m] = nil
            end
        end
    elseif next(botESP) then clearBotESP() end

    if Config.lootEsp then
        if tick() - lootCache.time > 2.0 then
            task.spawn(function() updateLootCache(myHrp) end)
            lootCache.time = tick()
        end
        local validModels = {}
        for _, item in ipairs(lootCache.models) do
            local obj = item.model
            if obj and obj.Parent then
                validModels[obj] = true
                if not lootESP[obj] then createLootESP(obj, item.part) end
                local d = lootESP[obj]
                if d and d.part then
                    local sp, on = cam:WorldToViewportPoint(d.part.Position)
                    if on and sp.Z > 0 then
                        local sz = math.clamp(1500/sp.Z, 15, 100)
                        d.box.Size = Vector2.new(sz,sz); d.box.Position = Vector2.new(sp.X - sz/2, sp.Y - sz/2); d.box.Visible = true
                        d.line.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y); d.line.To = Vector2.new(sp.X, sp.Y); d.line.Visible = true
                        d.nick.Enabled = true
                        d.dist.Enabled = true
                        d.distLbl.Text = math.floor(item.dist) .. " studs"
                    else 
                        d.box.Visible = false; d.line.Visible = false
                        d.nick.Enabled = false; d.dist.Enabled = false 
                    end
                end
            end
        end
        for obj, d in pairs(lootESP) do
            if not obj.Parent or not validModels[obj] then
                if d.box then d.box:Remove() end
                if d.line then d.line:Remove() end
                if d.nick then d.nick:Destroy() end
                if d.dist then d.dist:Destroy() end
                lootESP[obj] = nil
            end
        end
    elseif next(lootESP) then clearLootESP() end
end

RunService.RenderStepped:Connect(function() pcall(updateESP) end)

local function hideMain() main.Visible = false; fab.Visible = true end
local function showMain() main.Visible = true; fab.Visible = false end
closeBtn.MouseButton1Click:Connect(hideMain)
fab.MouseButton1Click:Connect(showMain)

-- === ЛОГИКА АИМА (Premium Anime AI) ===
local aimRunning = true
local currentTarget = nil
local cachedTargets = {list={}, time=0}
local lastFireTime = 0
local myBasePos = nil
local manualTargetLockUntil = 0
local touchStartPos = nil
local lastSwipeTime = 0
local maxDistance = 125
local isHoldingFire = false

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1; fovCircle.Color = C.accent; fovCircle.Transparency = 0.5; fovCircle.NumSides = 60; fovCircle.Visible = false
fovCircle.Position = Vector2.new(Workspace.CurrentCamera.ViewportSize.X/2, Workspace.CurrentCamera.ViewportSize.Y/2)
fovCircle.Radius = Config.aimFov

task.spawn(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 10)
    if hrp then myBasePos = hrp.Position end
end)

local function onFire() 
    lastFireTime = tick() 
end

local function hookTool(tool) 
    if tool:IsA("Tool") then 
        tool.Activated:Connect(onFire) 
    end 
end

local function setupChar(char)
    char.ChildAdded:Connect(hookTool)
    for _, child in ipairs(char:GetChildren()) do hookTool(child) end
end
if player.Character then setupChar(player.Character) end
player.CharacterAdded:Connect(setupChar)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        touchStartPos = input.Position
        if not input:IsA("GuiObject") then
            local vp = Workspace.CurrentCamera.ViewportSize
            if input.Position.X > vp.X * 0.5 and input.Position.Y > vp.Y * 0.5 then 
                isHoldingFire = true
                onFire() 
            end
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then 
        touchStartPos = nil 
        isHoldingFire = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch and touchStartPos then
        local deltaX = input.Position.X - touchStartPos.X
        if math.abs(deltaX) > 50 and tick() - lastSwipeTime > 0.3 then
            lastSwipeTime = tick()
            local validTargets = {}
            local centerScreen = Vector2.new(Workspace.CurrentCamera.ViewportSize.X/2, Workspace.CurrentCamera.ViewportSize.Y/2)
            local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            
            if myHrp then
                for _, t in ipairs(cachedTargets.list) do
                    if t.model.Parent and t.hum.Health > 0 and not t.friendly then
                        local worldDist = (t.head.Position - myHrp.Position).Magnitude
                        if worldDist < maxDistance then
                            local sp, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(t.head.Position)
                            -- Строгая проверка 2D-дистанции (внутри круга FOV)
                            if onScreen and (Vector2.new(sp.X, sp.Y) - centerScreen).Magnitude < Config.aimFov then
                                table.insert(validTargets, t)
                            end
                        end
                    end
                end
            end
            
            if #validTargets > 0 then
                table.sort(validTargets, function(a, b)
                    return Workspace.CurrentCamera:WorldToViewportPoint(a.head.Position).X < Workspace.CurrentCamera:WorldToViewportPoint(b.head.Position).X
                end)
                
                local currentIndex = nil
                for i, t in ipairs(validTargets) do if t == currentTarget then currentIndex = i; break end end
                
                if deltaX > 0 then
                    if currentIndex then currentIndex = currentIndex + 1 else currentIndex = 1 end
                    if currentIndex > #validTargets then currentIndex = 1 end
                else
                    if currentIndex then currentIndex = currentIndex - 1 else currentIndex = #validTargets end
                    if currentIndex < 1 then currentIndex = #validTargets end
                end
                
                currentTarget = validTargets[currentIndex]
                manualTargetLockUntil = tick() + 2.0
                print("[Pluma AI] Ручной свайп: цель изменена на " .. tostring(currentTarget.model.Name))
            end
        end
        touchStartPos = input.Position
    end
end)

local function isFriendlyBot(model, pos)
    if Config.teamCheck then
        local n = model.Name:lower()
        if n:find("ally") or n:find("friendly") or n:find("defender") or n:find("player") then return true end
        if model:GetAttribute("Owner") == player.Name or model:GetAttribute("Owner") == player.UserId then return true end
        local botTeam = model:FindFirstChild("Team")
        if botTeam and player.Team and botTeam.Value == player.Team then return true end
        if myBasePos and pos and (pos - myBasePos).Magnitude < 115 then return true end
    end
    return false
end

local function scanAimTargets()
    local targets = {}
    local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end

    if Config.aimPlayers then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and not isSameTeam(plr) then
                local char = plr.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid"); local head = char:FindFirstChild("Head")
                    if head and hum and hum.Health > 0 then 
                        table.insert(targets, {model=char, head=head, hum=hum, friendly=false, isPlayer=true}) 
                    end
                end
            end
        end
    end
    
    if Config.aimBots then
        local map = Workspace:FindFirstChild("Map")
        local creatures = map and map:FindFirstChild("Creatures")
        local scanRoot = creatures or Workspace

        for _, obj in ipairs(scanRoot:GetChildren()) do
            if obj:IsA("Model") then
                local hum = obj:FindFirstChildOfClass("Humanoid")
                local head = obj:FindFirstChild("Head")
                local isPlr = false
                for _, p in ipairs(Players:GetPlayers()) do if p.Character == obj then isPlr = true; break end end
                
                if hum and head and hum.Health > 0 and hum:GetState() ~= Enum.HumanoidStateType.Dead and not isPlr then
                    local dist = (head.Position - myHrp.Position).Magnitude
                    if dist < maxDistance then
                        table.insert(targets, {model=obj, head=head, hum=hum, friendly=isFriendlyBot(obj, head.Position), isPlayer=false})
                    end
                end
            end
        end
    end
    
    cachedTargets.list = targets
    cachedTargets.time = tick()
end

local function hasLineOfSight(targetPos, model)
    local rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    rp.FilterDescendantsInstances = {player.Character, plumaGui}
    local result = Workspace:Raycast(Workspace.CurrentCamera.CFrame.Position, (targetPos - Workspace.CurrentCamera.CFrame.Position), rp)
    if result == nil then return true end
    if result.Instance:IsDescendantOf(model) then return true end
    return false
end

-- ИИ DeepSeek: Оценка угрозы
local function evaluateThreat(t, myHrp, centerScreen, sp)
    local screenDist = (Vector2.new(sp.X, sp.Y) - centerScreen).Magnitude
    local threat = screenDist
    
    if t.hum.Health < 30 then threat = threat * 0.5 end
    local toMe = (myHrp.Position - t.head.Position).Unit
    if t.head.CFrame.LookVector:Dot(toMe) > 0.5 then threat = threat * 0.7 end
    local vel = t.head.AssemblyLinearVelocity
    if vel.Magnitude > 5 and vel.Unit:Dot(toMe) > 0.5 then threat = threat * 0.8 end
    
    return threat
end

RunService.RenderStepped:Connect(function(dt)
    if not aimRunning then return end
    
    local cam = Workspace.CurrentCamera
    local myChar = player.Character
    local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end

    fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    fovCircle.Radius = Config.aimFov
    fovCircle.Visible = Config.aimOn

    if not Config.aimOn then return end

    if tick() - cachedTargets.time > 0.5 then
        task.spawn(scanAimTargets)
    end

    local isArmed = myChar:FindFirstChildOfClass("Tool") ~= nil
    local currentlyFiring = isHoldingFire and isArmed and (tick() - lastFireTime < 0.2)
    local centerScreen = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)

    if currentTarget then
        if not currentTarget.model.Parent or currentTarget.hum.Health <= 0 or currentTarget.hum:GetState() == Enum.HumanoidStateType.Dead then
            print("[Pluma AI] Цель уничтожена. Переключение...")
            currentTarget = nil
            manualTargetLockUntil = 0
        end
    end

    if currentlyFiring then
        if not currentTarget and tick() > manualTargetLockUntil then
            local bestTarget = nil
            local bestScore = math.huge

            for _, t in ipairs(cachedTargets.list) do
                if t.model.Parent and t.hum.Health > 0 and not t.friendly then
                    local sp, onScreen = cam:WorldToViewportPoint(t.head.Position)
                    if onScreen then
                        local screenDist = (Vector2.new(sp.X, sp.Y) - centerScreen).Magnitude
                        -- СТРОГАЯ ПРОВЕРКА FOV (2D)
                        if screenDist < Config.aimFov and hasLineOfSight(t.head.Position, t.model) then
                            local threat = evaluateThreat(t, myHrp, centerScreen, sp)
                            if threat < bestScore then
                                bestScore = threat
                                bestTarget = t
                            end
                        end
                    end
                end
            end
            if bestTarget then
                currentTarget = bestTarget
                print("[Pluma AI] DeepSeek выбрал цель: " .. tostring(bestTarget.model.Name) .. " (Угроза: " .. math.floor(bestScore) .. ")")
            end
        end
    else
        if tick() > manualTargetLockUntil then currentTarget = nil end
    end

    if currentTarget and currentlyFiring then
        local velocity = currentTarget.head.AssemblyLinearVelocity or Vector3.zero
        local aimPos = currentTarget.head.Position + (velocity * 0.15)
        
        local curCF = cam.CFrame
        local goalCF = CFrame.new(curCF.Position, aimPos)
        
        -- Премиум плавность (Аниме-стиль)
        local smoothFactor = 1 - math.exp(-18 * dt) 
        cam.CFrame = curCF:Lerp(goalCF, smoothFactor)
    end
end)

getgenv().Pluma = {
    Config=Config, C=C, toast=toast,
    plumaGui=plumaGui, main=main, fab=fab, watermark=watermark, wmLabel=wmLabel,
    sidebar=sidebar, switchTab=switchTab, createTab=createTab,
    createPage=createPage, addSection=addSection, makeToggle=makeToggle,
    makeAction=makeAction, makeInput=makeInput, toggleWidgets=toggleWidgets,
    pages=pages, setStatus=setStatus, hideMain=hideMain, showMain=showMain,
    SafeTeleport=SafeTeleport, getZones=getZones, clearZoneESP=clearZoneESP,
    refreshZoneESP=refreshZoneESP, createESP=createESP, destroyESP=destroyESP,
    clearPlayerESP=clearPlayerESP, clearBotESP=clearBotESP, clearLootESP=clearLootESP,
    updateESP=updateESP, isAdmin=isAdmin, espDrawings=espDrawings, botESP=botESP, lootESP=lootESP,
    getBasePos=getBasePos,
}

createTab("main", "◆", "Main", 1)
createTab("visual", "◉", "Visual", 2)
createTab("combat", "✜", "Combat", 3)
createTab("world", "▣", "World", 4)
createTab("players", "☺", "Players", 5)
createTab("util", "⚙", "Util", 6)

local pageMain = createPage("main")
local pageVisual = createPage("visual")
local pageCombat = createPage("combat")
local pageWorld = createPage("world")
local pagePlayers = createPage("players")
local pageUtil = createPage("util")

addSection(pageMain, "ТЕЛЕПОРТ", 1)
makeAction(pageMain, "⟶", "TP к ближайшей базе", 2, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then setStatus("нет персонажа", true); return end
    local bp = getBasePos()
    local zones = getZones()
    if #zones == 0 then setStatus("зоны не найдены", true); return end
    local best, bd = nil, 500
    for _, z in ipairs(zones) do local d = (z.pos - hrp.Position).Magnitude; if d < bd then best, bd = z, d end end
    if best then SafeTeleport(CFrame.new(best.pos), char); setStatus("tp: " .. best.name) else setStatus("базы рядом нет", true) end
end)
makeAction(pageMain, "⏎", "TP на базу (save/return)", 3, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bp = getBasePos()
    if not bp then basePos = hrp.Position; toast("База", "сохранена") else SafeTeleport(CFrame.new(bp), char); toast("TP", "на базу") end
end)

addSection(pageMain, "ВЗАИМОДЕЙСТВИЕ", 4)
makeToggle(pageMain, "fastInteract", "⚡", "Fast Interact", 5)

addSection(pageVisual, "ESP ЗОНЫ", 1)
makeToggle(pageVisual, "zoneEsp", "▣", "ESP зон", 2, function(v) if v then task.spawn(refreshZoneESP) else clearZoneESP() end end)
addSection(pageVisual, "ESP ИГРОКИ", 3)
makeToggle(pageVisual, "boxEsp", "□", "Box", 4, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end else clearPlayerESP() end end)
makeToggle(pageVisual, "lineEsp", "⟶", "Line", 6, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "tracer", "╲", "Tracer", 7, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "nickEsp", "☰", "Nickname", 8, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "hpBar", "▮", "HP Bar", 9, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "distEsp", "◎", "Дистанция", 10, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "chams", "◈", "Chams (все)", 11, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "adminEsp", "◈", "Admin Highlight", 12, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "teamCheck", "⚑", "Team Check", 13, function(v) if not v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end else clearPlayerESP() end end)
makeToggle(pageVisual, "botEsp", "○", "ESP ботов", 14)

addSection(pageVisual, "ЛУТ И ТП", 15)
makeToggle(pageVisual, "lootEsp", "★", "ESP лута (жирный)", 16, function(v) if not v then clearLootESP() end end)
makeAction(pageVisual, "⟶", "ТП к ближайшему луту", 17, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then setStatus("нет персонажа", true); return end
    local best, bd = nil, math.huge
    for obj, d in pairs(lootESP) do
        if obj.Parent and d.part and d.box.Visible then
            local dist = (d.part.Position - hrp.Position).Magnitude
            if dist < bd then best, bd = d.part, dist end
        end
    end
    if best then
        SafeTeleport(CFrame.new(best.Position), char)
        setStatus(string.format("TP к луту (%.0f studs)", bd))
        toast("ТП к луту", "перемещение...")
    else
        setStatus("лут не найден", true)
        toast("ТП к луту", "включи ESP лута и подожди")
    end
end)

addSection(pageCombat, "ПРИЦЕЛ", 1)
makeToggle(pageCombat, "aimOn", "✜", "Auto-Aim (только при стрельбе)", 2)
makeToggle(pageCombat, "aimPlayers", "◉", "Aim на игроков", 3)
makeToggle(pageCombat, "aimBots", "○", "Aim на ботов (NPC)", 4)
makeToggle(pageCombat, "wallCheck", "▤", "Wall Check", 5)
makeToggle(pageCombat, "smartTargets", "◈", "Smart Targets", 6)
makeToggle(pageCombat, "autoPriority", "◎", "Auto Priority", 7)
makeToggle(pageCombat, "aimMemory", "◔", "Aim Memory", 8)
makeToggle(pageCombat, "torsoFallback", "▽", "Torso Fallback", 9)
makeToggle(pageCombat, "adaptiveSmooth", "◈", "Adaptive Smooth + FPS", 10)
makeToggle(pageCombat, "triggerBot", "⚡", "Trigger Bot", 11)
makeToggle(pageCombat, "autoReload", "⟳", "Auto Reload", 12)
makeToggle(pageCombat, "aimVehicles", "⛊", "Aim на технику", 13)

addSection(pageWorld, "МИР", 1)
makeToggle(pageWorld, "fullbright", "☀", "Fullbright", 2)
makeToggle(pageWorld, "noFog", "☁", "No Fog", 3)
makeToggle(pageWorld, "noclip", "◌", "Noclip", 4)

local origBrightness = Lighting.Brightness
local origFogEnd = Lighting.FogEnd
task.spawn(function()
    while plumaGui.Parent do
        pcall(function()
            Lighting.Brightness = Config.fullbright and 3 or origBrightness
            Lighting.FogEnd = Config.noFog and 1e6 or origFogEnd
            Lighting.FogStart = Config.noFog and 1e6 or 0
        end)
        if Config.noclip and player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
        end
        task.wait(0.5)
    end
end)

local function refreshPlayersList()
    for _, child in ipairs(pagePlayers:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    local i = 1
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            local label = (isAdmin(plr) and "[ADMIN] " or "") .. plr.Name
            makeAction(pagePlayers, "☺", label, i, function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local tchar = plr.Character
                local thrp = tchar and tchar:FindFirstChild("HumanoidRootPart")
                if hrp and thrp then SafeTeleport(CFrame.new(thrp.Position), char); setStatus("tp к " .. plr.Name) end
            end)
            i = i + 1
        end
    end
end
Players.PlayerAdded:Connect(function() task.wait(0.5); refreshPlayersList() end)
Players.PlayerRemoving:Connect(function(plr) destroyESP(plr); task.wait(0.5); refreshPlayersList() end)
task.spawn(function() task.wait(2); refreshPlayersList() end)

switchTab("main")

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(0.3)
        local want = Config.boxEsp or Config.lineEsp or Config.nickEsp or Config.hpBar or Config.distEsp or Config.tracer or Config.chams or Config.adminEsp
        if want then createESP(plr) end
    end)
end)

task.spawn(function()
    task.wait(1)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            if Config.boxEsp or Config.lineEsp or Config.nickEsp or Config.hpBar or Config.distEsp or Config.tracer or Config.chams or Config.adminEsp then
                createESP(p)
            end
        end
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        local ping = "—"
        pcall(function() ping = tostring(math.floor(player:GetNetworkPing() * 1000)) end)
        wmLabel.Text = string.format("Pluma v19.4.1 Anime · %s ms", ping)
        task.wait(1)
    end
end)

addSection(pageUtil, "ЗАЩИТА", 1)
makeToggle(pageUtil, "antiRagdoll", "⊘", "Anti-Ragdoll", 2)
makeToggle(pageUtil, "antiAfk", "◔", "Anti-AFK", 3)
makeToggle(pageUtil, "antiKick", "⛨", "Anti-Kick", 4)
makeToggle(pageUtil, "autoRejoin", "⟲", "Auto-Rejoin", 5)

addSection(pageUtil, "ДЕЙСТВИЯ", 6)
makeAction(pageUtil, "⟳", "Server Hop", 7, function()
    task.spawn(function()
        local ok, res = pcall(function()
            local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
            local data = HttpService:JSONDecode(game:HttpGet(url))
            for _, srv in ipairs(data.data or {}) do if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then return srv.id end end
        end)
        if ok and res then pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, res, player) end) end
    end)
end)
makeAction(pageUtil, "⟲", "Rejoin", 8, function() pcall(function() TeleportService:Teleport(game.PlaceId, player) end) end)
makeAction(pageUtil, "⏻", "Выгрузить всё", 10, function()
    pcall(function() clearZoneESP() end)
    pcall(function() clearPlayerESP() end)
    pcall(function() clearBotESP() end)
    pcall(function() clearLootESP() end)
    pcall(function() fovCircle:Remove() end)
    aimRunning = false
    plumaGui:Destroy()
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        if main.Visible then hideMain() else showMain() end
    elseif input.KeyCode == Enum.KeyCode.Insert then
        Config.aimOn = not Config.aimOn; if toggleWidgets.aimOn then toggleWidgets.aimOn.set(Config.aimOn) end; toast("Aim", Config.aimOn and "вкл" or "выкл")
    elseif input.KeyCode == Enum.KeyCode.End then
        local v = not Config.boxEsp
        for _, k in ipairs({"boxEsp","nickEsp","hpBar"}) do Config[k] = v; if toggleWidgets[k] then toggleWidgets[k].set(v) end end
        toast("ESP", v and "вкл" or "выкл")
    elseif input.KeyCode == Enum.KeyCode.Delete then
        Config.noclip = not Config.noclip; if toggleWidgets.noclip then toggleWidgets.noclip.set(Config.noclip) end; toast("Noclip", Config.noclip and "вкл" or "выкл")
    end
end)

print("[PlumaUI v19.4.1 Anime Premium] загружен")
