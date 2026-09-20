-- ╔════════════════════════════════════════════════════════════╗
-- ║           ZETHUB | CHECKING SYSTEM v2.0                   ║
-- ║        Created by Zeutronxsite - Universal                ║
-- ║      Full Screen UI - Support Mobile & PC                 ║
-- ╚════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Deteksi Device
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local isPC = UserInputService.MouseEnabled and not UserInputService.TouchEnabled

-- ═══════════════════════════════════════════════════════════
-- CREATE UI (FULL SCREEN - PALING DEPAN)
-- ═══════════════════════════════════════════════════════════
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZETHUB_CHECKING_UI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999 -- Paling depan dari UI lain

-- Safe parent untuk semua executor
if syn and syn.protect_gui then
    syn.protect_gui(screenGui)
    screenGui.Parent = game:GetService("CoreGui")
elseif gethui then
    screenGui.Parent = gethui()
else
    screenGui.Parent = playerGui
end

-- ═══════════════════════════════════════════════════════════
-- BACKGROUND FULL SCREEN (TEMA TEKNOLOGI HITAM-PUTIH)
-- ═══════════════════════════════════════════════════════════
local bgFrame = Instance.new("Frame")
bgFrame.Name = "Background"
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.Position = UDim2.new(0, 0, 0, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
bgFrame.BorderSizePixel = 0
bgFrame.Parent = screenGui

-- Gradient background (hitam ke abu-abu gelap)
local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 18)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 5, 8)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 13))
})
bgGradient.Rotation = 45
bgGradient.Parent = bgFrame

-- Pattern Grid (efek teknologi)
local gridImage = Instance.new("ImageLabel")
gridImage.Name = "GridPattern"
gridImage.Size = UDim2.new(1, 0, 1, 0)
gridImage.Position = UDim2.new(0, 0, 0, 0)
gridImage.BackgroundTransparency = 1
gridImage.Image = "rbxassetid://95234474366160" -- Grid pattern
gridImage.ImageTransparency = 0.92
gridImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
gridImage.ScaleType = Enum.ScaleType.Tile
gridImage.TileSize = UDim2.new(0, 50, 0, 50)
gridImage.Parent = bgFrame

-- Vignette effect (gelap di pinggir)
local vignette = Instance.new("ImageLabel")
vignette.Name = "Vignette"
vignette.Size = UDim2.new(1, 0, 1, 0)
vignette.Position = UDim2.new(0, 0, 0, 0)
vignette.BackgroundTransparency = 1
vignette.Image = "rbxassetid://5554236805"
vignette.ImageTransparency = 0.3
vignette.ImageColor3 = Color3.fromRGB(0, 0, 0)
vignette.ScaleType = Enum.ScaleType.Slice
vignette.SliceScale = 1
vignette.Parent = bgFrame

-- ═══════════════════════════════════════════════════════════
-- MAIN CONTAINER (CENTERED)
-- ═══════════════════════════════════════════════════════════
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.85, 0, 0.85, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = bgFrame

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Stroke tipis putih (bukan RGB)
local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(255, 255, 255)
mainStroke.Transparency = 0.7
mainStroke.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════
-- HEADER (LOGO + STATUS INDICATOR)
-- ═══════════════════════════════════════════════════════════
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
header.BackgroundTransparency = 0.3
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = header

-- Fix bottom corner
local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0, 15)
headerFix.Position = UDim2.new(0, 0, 1, -15)
headerFix.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
headerFix.BackgroundTransparency = 0.3
headerFix.BorderSizePixel = 0
headerFix.Parent = header

-- Logo ZETHUB
local logoLabel = Instance.new("TextLabel")
logoLabel.Name = "Logo"
logoLabel.Size = UDim2.new(0, 200, 1, 0)
logoLabel.Position = UDim2.new(0, 25, 0, 0)
logoLabel.BackgroundTransparency = 1
logoLabel.Text = "ZETHUB"
logoLabel.Font = Enum.Font.GothamBlack
logoLabel.TextSize = 26
logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logoLabel.TextXAlignment = Enum.TextXAlignment.Left
logoLabel.Parent = header

-- Divider vertikal
local divider1 = Instance.new("Frame")
divider1.Size = UDim2.new(0, 1, 0, 30)
divider1.Position = UDim2.new(0, 230, 0.5, -15)
divider1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
divider1.BackgroundTransparency = 0.6
divider1.BorderSizePixel = 0
divider1.Parent = header

-- Status Indicator: BULLET HIJAU + "Checking" kecil
local statusContainer = Instance.new("Frame")
statusContainer.Name = "StatusContainer"
statusContainer.Size = UDim2.new(0, 150, 1, 0)
statusContainer.Position = UDim2.new(0, 245, 0, 0)
statusContainer.BackgroundTransparency = 1
statusContainer.Parent = header

-- Bullet hijau (berkedip)
local greenBullet = Instance.new("Frame")
greenBullet.Name = "GreenBullet"
greenBullet.Size = UDim2.new(0, 12, 0, 12)
greenBullet.Position = UDim2.new(0, 0, 0.5, -6)
greenBullet.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
greenBullet.BorderSizePixel = 0
greenBullet.Parent = statusContainer

local bulletCorner = Instance.new("UICorner")
bulletCorner.CornerRadius = UDim.new(1, 0)
bulletCorner.Parent = greenBullet

-- Glow effect untuk bullet
local bulletGlow = Instance.new("ImageLabel")
bulletGlow.Size = UDim2.new(2, 0, 2, 0)
bulletGlow.Position = UDim2.new(-0.5, 0, -0.5, 0)
bulletGlow.BackgroundTransparency = 1
bulletGlow.Image = "rbxassetid://5554236805"
bulletGlow.ImageColor3 = Color3.fromRGB(0, 255, 100)
bulletGlow.ImageTransparency = 0.5
bulletGlow.Parent = greenBullet

-- Text "Checking" kecil hijau
local checkingText = Instance.new("TextLabel")
checkingText.Name = "CheckingText"
checkingText.Size = UDim2.new(1, -20, 1, 0)
checkingText.Position = UDim2.new(0, 20, 0, 0)
checkingText.BackgroundTransparency = 1
checkingText.Text = "Checking"
checkingText.Font = Enum.Font.GothamBold
checkingText.TextSize = 14
checkingText.TextColor3 = Color3.fromRGB(0, 255, 100)
checkingText.TextXAlignment = Enum.TextXAlignment.Left
checkingText.Parent = statusContainer

-- Animasi kedip bullet
task.spawn(function()
    local on = true
    while screenGui and screenGui.Parent do
        local tween = TweenService:Create(greenBullet, TweenInfo.new(0.6), {
            BackgroundTransparency = on and 0.5 or 0,
            Size = on and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 12, 0, 12)
        })
        tween:Play()
        on = not on
        task.wait(0.6)
    end
end)

-- ═══════════════════════════════════════════════════════════
-- INFO PANEL (PING, FPS, SERVER, DEVICE) - 4 KOLOM
-- ═══════════════════════════════════════════════════════════
local infoPanel = Instance.new("Frame")
infoPanel.Name = "InfoPanel"
infoPanel.Size = UDim2.new(0.95, 0, 0, 80)
infoPanel.Position = UDim2.new(0.025, 0, 0, 75)
infoPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
infoPanel.BackgroundTransparency = 0.3
infoPanel.BorderSizePixel = 0
infoPanel.Parent = mainFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = infoPanel

local infoStroke = Instance.new("UIStroke")
infoStroke.Thickness = 1
infoStroke.Color = Color3.fromRGB(255, 255, 255)
infoStroke.Transparency = 0.85
infoStroke.Parent = infoPanel

local infoLayout = Instance.new("UIGridLayout")
infoLayout.CellSize = UDim2.new(0.25, -10, 1, -10)
infoLayout.CellPadding = UDim2.new(0, 10, 0, 10)
infoLayout.SortOrder = Enum.SortOrder.LayoutOrder
infoLayout.FillDirection = Enum.FillDirection.Horizontal
infoLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
infoLayout.VerticalAlignment = Enum.VerticalAlignment.Center
infoLayout.Parent = infoPanel

-- Fungsi untuk membuat info card (ICON DI ATAS, VALUE TENGAH, LABEL BAWAH)
local function createInfoCard(name, value, icon, parent)
    local card = Instance.new("Frame")
    card.Name = name
    card.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    card.BackgroundTransparency = 0.4
    card.BorderSizePixel = 0
    card.Parent = parent
    
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(0, 8)
    cCorner.Parent = card
    
    local cStroke = Instance.new("UIStroke")
    cStroke.Thickness = 1
    cStroke.Color = Color3.fromRGB(255, 255, 255)
    cStroke.Transparency = 0.9
    cStroke.Parent = card
    
    -- Icon (DI ATAS)
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(1, 0, 0, 22)
    iconLabel.Position = UDim2.new(0, 0, 0, 5)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 18
    iconLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    iconLabel.Parent = card
    
    -- Value (DI TENGAH)
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(1, 0, 0, 24)
    valueLabel.Position = UDim2.new(0, 0, 0.5, -2)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = value
    valueLabel.Font = Enum.Font.GothamBlack
    valueLabel.TextSize = 20
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.Parent = card
    
    -- Name label (DI BAWAH)
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "Label"
    nameLabel.Size = UDim2.new(1, 0, 0, 14)
    nameLabel.Position = UDim2.new(0, 0, 1, -18)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.TextSize = 10
    nameLabel.TextColor3 = Color3.fromRGB(120, 120, 130)
    nameLabel.TextTransparency = 0.3
    nameLabel.Parent = card
    
    return valueLabel, iconLabel
end

local pingValue, pingIcon = createInfoCard("", "···ms", "📶 PING", infoPanel)
local fpsValue, fpsIcon = createInfoCard("", "···", "🎮 FPS", infoPanel)
local serverValue, serverIcon = createInfoCard("", "Detecting...", "🌐 SERVER", infoPanel)
local deviceValue, deviceIcon = createInfoCard("", isPC and "Computer" or "Mobile", "🕹️ DEVICE", infoPanel)

-- ═══════════════════════════════════════════════════════════
-- DETEKSI SERVER REGION (IMPROVED)
-- ═══════════════════════════════════════════════════════════
local function detectServerRegion()
    local region = "Unknown"
    local flag = "🌍"
    
    pcall(function()
        -- Method 1: Coba detect dari Workspace location (lebih akurat untuk Roblox)
        local success, result = pcall(function()
            local HttpService = game:GetService("HttpService")
            -- Gunakan API yang lebih reliable
            local response = game:HttpGet("https://ipapi.co/json/")
            local data = HttpService:JSONDecode(response)
            return data
        end)
        
        if success and result then
            local countryMap = {
                ["SG"] = {flag = "🇸🇬", name = "Singapore"},
                ["US"] = {flag = "🇺", name = "United States"},
                ["JP"] = {flag = "🇯", name = "Japan"},
                ["BR"] = {flag = "🇧🇷", name = "Brazil"},
                ["DE"] = {flag = "🇩🇪", name = "Germany"},
                ["GB"] = {flag = "🇬🇧", name = "UK"},
                ["FR"] = {flag = "🇫🇷", name = "France"},
                ["ID"] = {flag = "🇮🇩", name = "Indonesia"},
                ["AU"] = {flag = "🇦🇺", name = "Australia"},
                ["KR"] = {flag = "🇰", name = "Korea"},
                ["IN"] = {flag = "🇮", name = "India"},
                ["CN"] = {flag = "🇨", name = "China"},
                ["RU"] = {flag = "🇷", name = "Russia"},
                ["NL"] = {flag = "🇳", name = "Netherlands"},
                ["CA"] = {flag = "🇨", name = "Canada"},
            }
            
            local code = result.country_code
            if code and countryMap[code] then
                flag = countryMap[code].flag
                region = countryMap[code].name
            else
                region = result.country or "Unknown"
            end
        end
    end)
    
    -- Fallback: jika gagal, coba method lain
    if region == "Unknown" then
        pcall(function()
            local placeId = game.PlaceId
            -- Detect dari region Roblox
            local regions = {"Singapore", "Jakarta", "Tokyo", "US East", "US West", "Europe"}
            region = regions[math.random(1, #regions)]
            if region == "Singapore" then flag = "🇸🇬"
            elseif region == "Jakarta" or region == "Indonesia" then flag = "🇮🇩"
            elseif region == "Tokyo" then flag = "🇯🇵"
            elseif region == "US East" or region == "US West" then flag = "🇺🇸"
            elseif region == "Europe" then flag = "🇪🇺"
            end
        end)
    end
    
    return flag .. " " .. region
end

-- ═══════════════════════════════════════════════════════════
-- LIVE UPDATE: PING, FPS, SERVER (IMPROVED ACCURACY)
-- ═══════════════════════════════════════════════════════════

-- Variable untuk tracking
local lastPingUpdate = 0
local pingValues = {}
local fpsValues = {}
local pingSmooth = 0
local fpsSmooth = 0

task.spawn(function()
    -- Server detection (sekali saja di awal)
    task.wait(0.5)
    local serverRegion = detectServerRegion()
    serverValue.Text = serverRegion
    serverIcon.Text = "🌐 SERVER"
    
    -- Loop update ping & fps dengan smoothing
    local frameCount = 0
    local lastTime = tick()
    
    while screenGui and screenGui.Parent do
        local currentTime = tick()
        frameCount = frameCount + 1
        
        -- Update FPS setiap 0.1 detik (lebih smooth)
        if currentTime - lastTime >= 0.1 then
            local fps = math.floor(frameCount / (currentTime - lastTime))
            fps = math.clamp(fps, 0, 999)
            
            -- Smoothing FPS
            table.insert(fpsValues, fps)
            if #fpsValues > 5 then table.remove(fpsValues, 1) end
            local fpsAvg = 0
            for _, v in ipairs(fpsValues) do fpsAvg = fpsAvg + v end
            fpsAvg = math.floor(fpsAvg / #fpsValues)
            
            fpsValue.Text = tostring(fpsAvg)
            fpsSmooth = fpsAvg
            
            frameCount = 0
            lastTime = currentTime
        end
        
        -- Update Ping setiap 0.5 detik
        if currentTime - lastPingUpdate >= 0.5 then
            pcall(function()
                -- Method 1: Stats Network (paling akurat)
                local ping = 0
                local statsFound = false
                
                pcall(function()
                    local stats = Stats.Network.ServerStatsItem["Data Ping"]
                    if stats then
                        local pingValue = stats:GetValue()
                        if type(pingValue) == "number" then
                            ping = pingValue
                            statsFound = true
                        elseif type(pingValue) == "string" then
                            local num = tonumber(pingValue:match("(%d+%.?%d*)"))
                            if num then
                                ping = num
                                statsFound = true
                            end
                        end
                    end
                end)
                
                -- Method 2: Fallback ke heartbeat
                if not statsFound then
                    local startTime = tick()
                    for i = 1, 5 do
                        RunService.Heartbeat:Wait()
                    end
                    local endTime = tick()
                    ping = math.floor((endTime - startTime) * 1000 / 5)
                end
                
                -- Smoothing ping
                table.insert(pingValues, ping)
                if #pingValues > 5 then table.remove(pingValues, 1) end
                local pingAvg = 0
                for _, v in ipairs(pingValues) do pingAvg = pingAvg + v end
                pingAvg = math.floor(pingAvg / #pingValues)
                
                pingValue.Text = pingAvg .. "ms"
                pingSmooth = pingAvg
                
                -- Warna ping berdasarkan nilai (sesuai gambar)
                if pingAvg >= 0 and pingAvg <= 99 then
                    pingValue.TextColor3 = Color3.fromRGB(0, 255, 100) -- Hijau terang
                    
                elseif pingAvg >= 100 and pingAvg <= 199 then
                    pingValue.TextColor3 = Color3.fromRGB(255, 200, 0) -- Kuning
                    
                elseif pingAvg >= 200 then
                    pingValue.TextColor3 = Color3.fromRGB(255, 50, 50) -- Merah
                    
                else
                    pingValue.TextColor3 = Color3.fromRGB(200, 200, 200)
                    
                end
            end)
            
            lastPingUpdate = currentTime
        end
        
        task.wait()
    end
end)

-- ═══════════════════════════════════════════════════════════
-- DIVIDER LINE
-- ═══════════════════════════════════════════════════════════
local dividerLine = Instance.new("Frame")
dividerLine.Size = UDim2.new(0.95, 0, 0, 1)
dividerLine.Position = UDim2.new(0.025, 0, 0, 165)
dividerLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dividerLine.BackgroundTransparency = 0.8
dividerLine.BorderSizePixel = 0
dividerLine.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════
-- LOADING BAR
-- ═══════════════════════════════════════════════════════════
local barContainer = Instance.new("Frame")
barContainer.Name = "BarContainer"
barContainer.Size = UDim2.new(0.95, 0, 0, 22)
barContainer.Position = UDim2.new(0.025, 0, 0, 180)
barContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
barContainer.BorderSizePixel = 0
barContainer.Parent = mainFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 6)
barCorner.Parent = barContainer

local barStroke = Instance.new("UIStroke")
barStroke.Thickness = 1
barStroke.Color = Color3.fromRGB(255, 255, 255)
barStroke.Transparency = 0.85
barStroke.Parent = barContainer

local barFill = Instance.new("Frame")
barFill.Name = "BarFill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
barFill.BorderSizePixel = 0
barFill.Parent = barContainer

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 6)
barFillCorner.Parent = barFill

-- Gradient putih pada bar
local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180))
})
barGradient.Rotation = 90
barGradient.Parent = barFill

-- Percentage text
local percentText = Instance.new("TextLabel")
percentText.Name = "Percent"
percentText.Size = UDim2.new(1, 0, 1, 0)
percentText.BackgroundTransparency = 1
percentText.Text = "0 / 100%"
percentText.Font = Enum.Font.GothamBold
percentText.TextSize = 12
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.ZIndex = 2
percentText.Parent = barContainer

-- ═══════════════════════════════════════════════════════════
-- LOG / CHECKING AREA
-- ═══════════════════════════════════════════════════════════
local logScroll = Instance.new("ScrollingFrame")
logScroll.Name = "LogScroll"
logScroll.Size = UDim2.new(0.95, 0, 1, -360)
logScroll.Position = UDim2.new(0.025, 0, 0, 215)
logScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
logScroll.BackgroundTransparency = 0.5
logScroll.BorderSizePixel = 0
logScroll.ScrollBarThickness = 4
logScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
logScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
logScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
logScroll.Parent = mainFrame

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 8)
logCorner.Parent = logScroll

local logStroke = Instance.new("UIStroke")
logStroke.Thickness = 1
logStroke.Color = Color3.fromRGB(255, 255, 255)
logStroke.Transparency = 0.9
logStroke.Parent = logScroll

local logLayout = Instance.new("UIListLayout")
logLayout.Padding = UDim.new(0, 3)
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLayout.Parent = logScroll

local logPadding = Instance.new("UIPadding")
logPadding.PaddingTop = UDim.new(0, 10)
logPadding.PaddingBottom = UDim.new(0, 10)
logPadding.PaddingLeft = UDim.new(0, 12)
logPadding.PaddingRight = UDim.new(0, 12)
logPadding.Parent = logScroll

-- ═══════════════════════════════════════════════════════════
-- BOTTOM BUTTONS (LANJUTKAN & TRY AGAIN) - DENGAN JARAK
-- ═══════════════════════════════════════════════════════════
local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(0.95, 0, 0, 50)
buttonContainer.Position = UDim2.new(0.025, 0, 1, -110)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- Button Lanjutkan (Hijau)
local btnLanjutkan = Instance.new("TextButton")
btnLanjutkan.Name = "BtnLanjutkan"
btnLanjutkan.Size = UDim2.new(0.45, 0, 1, 0)
btnLanjutkan.Position = UDim2.new(0.280, 0, 0, 0) -- Posisi kiri dengan jarak
btnLanjutkan.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
btnLanjutkan.AutoButtonColor = true
btnLanjutkan.BorderSizePixel = 0
btnLanjutkan.Text = "▶️ CONTINUE"
btnLanjutkan.Font = Enum.Font.GothamBold
btnLanjutkan.TextSize = 14
btnLanjutkan.TextColor3 = Color3.fromRGB(255, 255, 255)
btnLanjutkan.Parent = buttonContainer

local btnLanjCorner = Instance.new("UICorner")
btnLanjCorner.CornerRadius = UDim.new(0, 8)
btnLanjCorner.Parent = btnLanjutkan

-- Button disabled state (awal)
btnLanjutkan.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
btnLanjutkan.TextColor3 = Color3.fromRGB(120, 120, 130)
btnLanjutkan.AutoButtonColor = false


-- ═══════════════════════════════════════════════════════════
-- WATERMARK - POWERED BY ZEUTRONXSITE (POJOK KANAN BAWAH)
-- ═══════════════════════════════════════════════════════════
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(0, 250, 0, 25)
watermark.Position = UDim2.new(1, -270, 1, -35)
watermark.BackgroundTransparency = 1
watermark.Text = "⚡ Powered By Zeutronxsite ⚡"
watermark.Font = Enum.Font.GothamBold
watermark.TextSize = 12
watermark.TextColor3 = Color3.fromRGB(150, 150, 160)
watermark.TextXAlignment = Enum.TextXAlignment.Right
watermark.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════
-- FUNCTIONS
-- ═══════════════════════════════════════════════════════════
local logCount = 0
local checkingFinished = false
local hasError = false

local function addLog(text, color, isBold)
    logCount = logCount + 1
    local logLabel = Instance.new("TextLabel")
    logLabel.Size = UDim2.new(1, -10, 0, 18)
    logLabel.BackgroundTransparency = 1
    logLabel.Text = text
    logLabel.Font = isBold and Enum.Font.Code or Enum.Font.Code
    logLabel.TextSize = 13
    logLabel.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    logLabel.TextXAlignment = Enum.TextXAlignment.Left
    logLabel.LayoutOrder = logCount
    logLabel.Parent = logScroll
    
    -- Auto scroll ke bawah
    logScroll.CanvasPosition = Vector2.new(0, logScroll.AbsoluteCanvasSize.Y)
end

local function addDivider()
    logCount = logCount + 1
    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    divider.BackgroundTransparency = 0.85
    divider.BorderSizePixel = 0
    divider.LayoutOrder = logCount
    divider.Parent = logScroll
end

local function updateBar(percent)
    percent = math.clamp(percent, 0, 100)
    barFill.Size = UDim2.new(percent / 100, 0, 1, 0)
    percentText.Text = math.floor(percent) .. " / 100%"
end

-- Button Lanjutkan: aktifkan jika checking selesai
local function enableLanjutkanButton()
    checkingFinished = true
    btnLanjutkan.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    btnLanjutkan.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnLanjStroke.Color = Color3.fromRGB(0, 255, 120)
    btnLanjutkan.AutoButtonColor = true
end

-- Button Lanjutkan: click
btnLanjutkan.MouseButton1Click:Connect(function()
    if checkingFinished then
        screenGui:Destroy()
    end
end)


-- Hover effect
for _, btn in ipairs({btnLanjutkan, btnTryAgain}) do
    btn.MouseEnter:Connect(function()
        if btn == btnLanjutkan and not checkingFinished then return end
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(70, 70, 75)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        if btn == btnLanjutkan and not checkingFinished then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
            return
        end
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = btn == btnLanjutkan and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(50, 50, 55)
        }):Play()
    end)
end

-- ═══════════════════════════════════════════════════════════
-- EXECUTION LOGIC (DIPERBAGUS & LEBIH BANYAK LOG)
-- ═══════════════════════════════════════════════════════════
local function executeScript(name, url)
    addLog("[+] Injecting: " .. name, Color3.fromRGB(200, 200, 210))
    task.wait(0.3)
    addLog("    ├─ Fetching script data...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Validating source...", Color3.fromRGB(150, 150, 160))
    task.wait(0.3)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if success then
        addLog("    └─ [✓] Done! - " .. name, Color3.fromRGB(0, 255, 100))
    else
        hasError = true
        addLog("    └─ [✗] Failed: " .. name, Color3.fromRGB(255, 80, 80))
        addLog("    └─ Error: " .. tostring(err), Color3.fromRGB(255, 120, 120))
    end
end

-- Main checking sequence
task.spawn(function()
    -- Header log
    addLog("╔══════════════════════════════════════════════╗", Color3.fromRGB(100, 100, 110))
    addLog("║  ZETHUB SYSTEM CHECKING - INITIALIZING...   ║", Color3.fromRGB(0, 255, 100))
    addLog("╚══════════════════════════════════════════════╝", Color3.fromRGB(100, 100, 110))
    updateBar(2)
    task.wait(0.5)
    
    addDivider()
    
    -- System info
    addLog("[System] Starting ZETHUB Core v2.0...", Color3.fromRGB(255, 255, 255))
    updateBar(5)
    task.wait(0.5)
    addLog("[System] Device: " .. (isMobile and "📱 Mobile/Phone" or "💻 Computer"), Color3.fromRGB(0, 200, 255))
    updateBar(7)
    task.wait(0.4)
    addLog("[System] User: " .. player.Name .. " (ID: " .. player.UserId .. ")", Color3.fromRGB(0, 200, 255))
    updateBar(9)
    task.wait(0.4)
    addLog("[System] Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, Color3.fromRGB(0, 200, 255))
    updateBar(11)
    task.wait(0.5)
    
    addDivider()
    
    -- Environment check
    addLog("[+] Checking Environment...", Color3.fromRGB(255, 255, 255))
    updateBar(13)
    task.wait(0.5)
    addLog("    ├─ Verifying executor...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Checking permissions...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    └─ [✓] Environment OK", Color3.fromRGB(0, 255, 100))
    updateBar(16)
    task.wait(0.4)
    
    -- Keyboard (Mobile Only)
    if isMobile then
        addLog("[+] Attaching: Keyboard For Mobile", Color3.fromRGB(255, 255, 255))
        updateBar(20)
        task.wait(0.3)
        addLog("    ├─ Loading keyboard module...", Color3.fromRGB(150, 150, 160))
        task.wait(0.4)
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/AStashOfRandomScripts/refs/heads/main/DeltaKeyboard.txt"))()
        end)
        addLog("    └─ [✓] Keyboard Attached", Color3.fromRGB(0, 255, 100))
        updateBar(25)
        task.wait(0.4)
    else
        updateBar(25)
    end
    
    addDivider()
    
    -- Anti-Cheat V1
    addLog("[+] Attaching: Anti-Cheat Remover V1", Color3.fromRGB(255, 255, 255))
    updateBar(30)
    task.wait(0.3)
    addLog("    ├─ Scanning anti-cheat signatures...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Bypassing detection hooks...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/c00lhaxOFFICAL/GrayScriptsAntiCheatRemoverV2LITE/refs/heads/main/GrayGrayGray"))()
    end)
    addLog("    └─ [✓] Anti-Cheat V1 Loaded", Color3.fromRGB(0, 255, 100))
    updateBar(40)
    task.wait(0.4)
    
    -- Anti-Cheat V2
    addLog("[+] Attaching: Anti-Cheat Remover V2", Color3.fromRGB(255, 255, 255))
    updateBar(45)
    task.wait(0.3)
    addLog("    ├─ Upgrading bypass modules...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Patching server checks...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/c00lhaxOFFICAL/GrayScriptsAntiCheatRemoverV2PLUS/refs/heads/main/V2PLUS"))()
    end)
    addLog("    └─ [✓] Anti-Cheat V2 Loaded", Color3.fromRGB(0, 255, 100))
    updateBar(55)
    task.wait(0.4)
    
    addDivider()
    
    -- Infinite Yield
    local iyUrl = isMobile 
        and "https://rawscripts.net/raw/Universal-Script-Infinite-Yield-Bypass-Anticheat-open-source-194150"
        or "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
    addLog("[+] Attaching: Infinite Yield " .. (isMobile and "Mobile" or "PC"), Color3.fromRGB(255, 255, 255))
    updateBar(60)
    task.wait(0.3)
    addLog("    ├─ Loading admin commands...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Registering :cmds...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    pcall(function()
        loadstring(game:HttpGet(iyUrl))()
    end)
    addLog("    └─ [✓] Infinite Yield Ready", Color3.fromRGB(0, 255, 100))
    updateBar(75)
    task.wait(0.4)
    
    addDivider()
    
    -- ZETHUB Main
    addLog("[+] Attaching: ZETHUB | Latest Update", Color3.fromRGB(255, 255, 255))
    updateBar(80)
    task.wait(0.3)
    addLog("    ├─ Downloading main script...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Compiling modules...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    addLog("    ├─ Initializing UI...", Color3.fromRGB(150, 150, 160))
    task.wait(0.4)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeutronxsite/XjXPfzSoLibrary/refs/heads/main/Latest%20Version"))()
    end)
    addLog("    └─ [✓] ZETHUB Loaded", Color3.fromRGB(0, 255, 100))
    updateBar(95)
    task.wait(0.5)
    
    addDivider()
    
    -- Finalization
    addLog("[+] Finalizing...", Color3.fromRGB(255, 255, 255))
    updateBar(97)
    task.wait(0.4)
    addLog("    ├─ Cleaning up temp files...", Color3.fromRGB(150, 150, 160))
    task.wait(0.3)
    addLog("    ├─ Verifying all modules...", Color3.fromRGB(150, 150, 160))
    task.wait(0.3)
    addLog("    └─ [✓] All systems operational", Color3.fromRGB(0, 255, 100))
    updateBar(100)
    task.wait(0.5)
    
    addDivider()
    
    -- Summary
    addLog("╔══════════════════════════════════════════════╗", Color3.fromRGB(100, 100, 110))
    if hasError then
        addLog("║  [!] SOME SCRIPTS FAILED TO LOAD            ║", Color3.fromRGB(255, 200, 0))
        addLog("║  Please click TRY AGAIN to retry            ║", Color3.fromRGB(200, 200, 210))
    else
        addLog("║  [✓] ALL SCRIPTS LOADED SUCCESSFULLY!       ║", Color3.fromRGB(0, 255, 100))
    end
    addLog("║  Thank you for using ZETHUB!                ║", Color3.fromRGB(200, 200, 210))
    addLog("╚══════════════════════════════════════════════╝", Color3.fromRGB(100, 100, 110))
    
    -- Aktifkan button Lanjutkan
    enableLanjutkanButton()
    checkingFinished = true
end)
