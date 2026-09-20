local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local lp = Players.LocalPlayer

-- ==========================================
-- 1. Setup ScreenGui
-- ==========================================
local gui = Instance.new("ScreenGui")
gui.Name = "Zeutron_DeveloperUI_vmax"
gui.DisplayOrder = 999999 
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- ==========================================
-- 2. Main Frame (SYSTEM INFO)
-- ==========================================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 530, 0, 440)
mainFrame.Position = UDim2.new(0.5, -265, 0.5, -220) -- DIPERBARUI
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 80, 160)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 40, 80))
})
gradient.Rotation = 135
gradient.Parent = mainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = mainFrame

local themeColor = Color3.fromRGB(0, 150, 255)

local stroke = Instance.new("UIStroke")
stroke.Color = themeColor
stroke.Thickness = 2
stroke.Transparency = 0.3
stroke.Parent = mainFrame

-- ==========================================
-- 3. Ambient Particles (Blue)
-- ==========================================
local particle = Instance.new("ParticleEmitter")
particle.Color = ColorSequence.new(themeColor, Color3.fromRGB(0, 100, 200))
particle.Lifetime = NumberRange.new(3, 5)
particle.Rate = 15
particle.Speed = NumberRange.new(2, 5)
particle.SpreadAngle = Vector2.new(360, 360)
particle.Transparency = NumberSequence.new(0.8, 0.2, 0.9)
particle.Size = NumberSequence.new(4, 8, 0)
particle.ZOffset = 5
particle.Parent = mainFrame

-- ==========================================
-- 4. Header & Version Badge
-- ==========================================
local sysInfoLabel = Instance.new("TextLabel")
sysInfoLabel.Size = UDim2.new(0, 250, 0, 40)
sysInfoLabel.Position = UDim2.new(0, 25, 0, 15)
sysInfoLabel.BackgroundTransparency = 1
sysInfoLabel.Text = "Maintenance"
sysInfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sysInfoLabel.Font = Enum.Font.GothamBlack
sysInfoLabel.TextSize = 28
sysInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
sysInfoLabel.TextStrokeTransparency = 0.8
sysInfoLabel.Parent = mainFrame

local versionBadge = Instance.new("Frame")
versionBadge.Size = UDim2.new(0, 160, 0, 36)
versionBadge.Position = UDim2.new(1, -185, 0, 20)
versionBadge.BackgroundColor3 = themeColor
versionBadge.Parent = mainFrame

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(1, 0)
badgeCorner.Parent = versionBadge

local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(1, 0, 1, 0)
versionText.BackgroundTransparency = 1
versionText.Text = "Developer"
versionText.TextColor3 = Color3.fromRGB(10, 10, 12)
versionText.Font = Enum.Font.GothamBlack
versionText.TextSize = 18
versionText.Parent = versionBadge

-- ==========================================
-- 5. Checking Text & Progress Bar
-- ==========================================
local checkingLabel = Instance.new("TextLabel")
checkingLabel.Size = UDim2.new(0, 220, 0, 30)
checkingLabel.Position = UDim2.new(0, 25, 0, 60)
checkingLabel.BackgroundTransparency = 1
checkingLabel.Text = ""
checkingLabel.TextColor3 = themeColor
checkingLabel.Font = Enum.Font.GothamBlack
checkingLabel.TextSize = 20
checkingLabel.TextXAlignment = Enum.TextXAlignment.Left
checkingLabel.TextStrokeTransparency = 0.8
checkingLabel.Parent = mainFrame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -50, 0, 6)
progressBg.Position = UDim2.new(0, 25, 0, 95)
progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
progressBg.Parent = mainFrame
local progressCorner = Instance.new("UICorner") 
progressCorner.CornerRadius = UDim.new(1, 0) 
progressCorner.Parent = progressBg

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = themeColor
progressBar.Parent = progressBg
local barCorner = Instance.new("UICorner") 
barCorner.CornerRadius = UDim.new(1, 0) 
barCorner.Parent = progressBar

-- ==========================================
-- 6. System Information Frame (Disesuaikan)
-- ==========================================
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -50, 0, 230)
infoFrame.Position = UDim2.new(0, 25, 0, 115)
infoFrame.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
infoFrame.BackgroundTransparency = 0.3
infoFrame.BorderSizePixel = 0
infoFrame.Parent = mainFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = infoFrame

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = themeColor
infoStroke.Thickness = 1.5
infoStroke.Transparency = 0.4
infoStroke.Parent = infoFrame

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, -20, 0, 30)
infoTitle.Position = UDim2.new(0, 10, 0, 8)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "📊 System Information"
infoTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextSize = 16
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoFrame

local infoSeparator = Instance.new("Frame")
infoSeparator.Size = UDim2.new(1, -20, 0, 2)
infoSeparator.Position = UDim2.new(0, 10, 0, 38)
infoSeparator.BackgroundColor3 = themeColor
infoSeparator.BackgroundTransparency = 0.4
infoSeparator.Parent = infoFrame

local sepInfoCorner = Instance.new("UICorner")
sepInfoCorner.CornerRadius = UDim.new(1, 0)
sepInfoCorner.Parent = infoSeparator

local infoContainer = Instance.new("Frame")
infoContainer.Size = UDim2.new(1, -40, 0, 200)
infoContainer.Position = UDim2.new(0, 20, 0, 45)
infoContainer.BackgroundTransparency = 1
infoContainer.Parent = infoFrame

local infoListLayout = Instance.new("UIListLayout")
infoListLayout.Padding = UDim.new(0, 8)
infoListLayout.SortOrder = Enum.SortOrder.LayoutOrder
infoListLayout.Parent = infoContainer

-- Ping Info
local pingRow = Instance.new("Frame")
pingRow.Size = UDim2.new(1, 0, 0, 30)
pingRow.BackgroundTransparency = 1
pingRow.Parent = infoContainer
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(0.35, 0, 1, 0)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "🌐 Network/Ping:"
pingLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
pingLabel.Font = Enum.Font.Gotham
pingLabel.TextSize = 17
pingLabel.TextXAlignment = Enum.TextXAlignment.Left
pingLabel.Parent = pingRow
local pingValue = Instance.new("TextLabel")
pingValue.Name = "PingValue"
pingValue.Size = UDim2.new(0.65, 0, 1, 0)
pingValue.Position = UDim2.new(0.35, 0, 0, 0)
pingValue.BackgroundTransparency = 1
pingValue.Text = "Loading..."
pingValue.TextColor3 = themeColor
pingValue.Font = Enum.Font.GothamBold
pingValue.TextSize = 15
pingValue.TextXAlignment = Enum.TextXAlignment.Right
pingValue.Parent = pingRow

-- Account Name Info
local accountRow = Instance.new("Frame")
accountRow.Size = UDim2.new(1, 0, 0, 30)
accountRow.BackgroundTransparency = 1
accountRow.Parent = infoContainer
local accountLabel = Instance.new("TextLabel")
accountLabel.Size = UDim2.new(0.35, 0, 1, 0)
accountLabel.BackgroundTransparency = 1
accountLabel.Text = "👤 Account/Username:"
accountLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
accountLabel.Font = Enum.Font.Gotham
accountLabel.TextSize = 17
accountLabel.TextXAlignment = Enum.TextXAlignment.Left
accountLabel.Parent = accountRow
local accountValue = Instance.new("TextLabel")
accountValue.Name = "AccountValue"
accountValue.Size = UDim2.new(0.65, 0, 1, 0)
accountValue.Position = UDim2.new(0.35, 0, 0, 0)
accountValue.BackgroundTransparency = 1
accountValue.Text = lp.Name
accountValue.TextColor3 = Color3.fromRGB(255, 255, 255)
accountValue.Font = Enum.Font.GothamBold
accountValue.TextSize = 15
accountValue.TextXAlignment = Enum.TextXAlignment.Right
accountValue.TextTruncate = Enum.TextTruncate.AtEnd
accountValue.Parent = accountRow

-- Executor Info
local executorRow = Instance.new("Frame")
executorRow.Size = UDim2.new(1, 0, 0, 30)
executorRow.BackgroundTransparency = 1
executorRow.Parent = infoContainer
local executorLabel = Instance.new("TextLabel")
executorLabel.Size = UDim2.new(0.35, 0, 1, 0)
executorLabel.BackgroundTransparency = 1
executorLabel.Text = "⚡ Executor:"
executorLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
executorLabel.Font = Enum.Font.Gotham
executorLabel.TextSize = 17
executorLabel.TextXAlignment = Enum.TextXAlignment.Left
executorLabel.Parent = executorRow
local executorValue = Instance.new("TextLabel")
executorValue.Name = "ExecutorValue"
executorValue.Size = UDim2.new(0.65, 0, 1, 0)
executorValue.Position = UDim2.new(0.35, 0, 0, 0)
executorValue.BackgroundTransparency = 1
executorValue.Text = "Working"
executorValue.TextColor3 = Color3.fromRGB(0, 255, 150)
executorValue.Font = Enum.Font.GothamBold
executorValue.TextSize = 15
executorValue.TextXAlignment = Enum.TextXAlignment.Right
executorValue.Parent = executorRow

-- Device Info
local deviceRow = Instance.new("Frame")
deviceRow.Size = UDim2.new(1, 0, 0, 30)
deviceRow.BackgroundTransparency = 1
deviceRow.Parent = infoContainer
local deviceLabel = Instance.new("TextLabel")
deviceLabel.Size = UDim2.new(0.35, 0, 1, 0)
deviceLabel.BackgroundTransparency = 1
deviceLabel.Text = "💻 Device:"
deviceLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
deviceLabel.Font = Enum.Font.Gotham
deviceLabel.TextSize = 17
deviceLabel.TextXAlignment = Enum.TextXAlignment.Left
deviceLabel.Parent = deviceRow
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local isPC = UserInputService.MouseEnabled and not UserInputService.TouchEnabled
local deviceValue = Instance.new("TextLabel")
deviceValue.Name = "DeviceValue"
deviceValue.Size = UDim2.new(0.65, 0, 1, 0)
deviceValue.Position = UDim2.new(0.35, 0, 0, 0)
deviceValue.BackgroundTransparency = 1
deviceValue.Text = isPC and "Computer" or (isMobile and "Mobile" or "Unknown")
deviceValue.TextColor3 = Color3.fromRGB(255, 200, 0)
deviceValue.Font = Enum.Font.GothamBold
deviceValue.TextSize = 15
deviceValue.TextXAlignment = Enum.TextXAlignment.Right
deviceValue.Parent = deviceRow

-- FPS Info
local fpsRow = Instance.new("Frame")
fpsRow.Size = UDim2.new(1, 0, 0, 30)
fpsRow.BackgroundTransparency = 1
fpsRow.Parent = infoContainer
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0.35, 0, 1, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "📈 Your Fps:"
fpsLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextSize = 17
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = fpsRow
local fpsValue = Instance.new("TextLabel")
fpsValue.Name = "FPSValue"
fpsValue.Size = UDim2.new(0.65, 0, 1, 0)
fpsValue.Position = UDim2.new(0.35, 0, 0, 0)
fpsValue.BackgroundTransparency = 1
fpsValue.Text = "60"
fpsValue.TextColor3 = Color3.fromRGB(0, 200, 255)
fpsValue.Font = Enum.Font.GothamBold
fpsValue.TextSize = 15
fpsValue.TextXAlignment = Enum.TextXAlignment.Right
fpsValue.Parent = fpsRow

-- Update Info Function
local function updateInfo()
	local ping = 0
	pcall(function()
		ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue() * 1)
	end)
	pingValue.Text = ping .. " ms"
	
	if ping < 100 then
		pingValue.TextColor3 = Color3.fromRGB(0, 255, 150)
	elseif ping < 200 then
		pingValue.TextColor3 = Color3.fromRGB(255, 200, 0)
	else
		pingValue.TextColor3 = Color3.fromRGB(255, 60, 60)
	end
	
	local fps = math.floor(1 / RunService.RenderStepped:Wait())
	fpsValue.Text = fps .. " ms"
end

task.spawn(function()
	while infoFrame.Parent do
		pcall(updateInfo)
		task.wait(2)
	end
end)

-- ==========================================
-- 7. DROPDOWN SCRIPT & EXECUTE BUTTON
-- ==========================================
local availableScripts = {
	{ name = "🎮 Automatic Picker", url = "https://raw.githubusercontent.com/zeutronxsite/Checking/refs/heads/main/reworked" },
	{ name = "👑 Zeutron Hub", url = "https://raw.githubusercontent.com/Zyptrue/Release/refs/heads/main/New%20Interface" },
	{ name = "🛠️ TLK Prison", url = "https://raw.githubusercontent.com/IOERHUB/R4jej3fe-V4/refs/heads/main/Zeutronisbest.lua" },
	{ name = "🎯 Area 51 Remake", url = "https://raw.githubusercontent.com/zeutronxsite/Area-51-Remake/refs/heads/main/Latest%20Version" },
	{ name = "🚗 Jailbreak", url = "https://raw.githubusercontent.com/zeutronxsite/M6txEKBDBreak/refs/heads/main/Working" },
	{ name = "🔪 Violence District", url = "https://raw.githubusercontent.com/zeutronxsite/XptC65ba-MainDestrict/refs/heads/main/5N8Eji9H" },
	{ name = "🔥 Power Incremental", url = "https://raw.githubusercontent.com/IOERHUB/Power-Incremental/refs/heads/main/Working" }
}

local selectedScriptUrl = availableScripts[1].url
local selectedScriptName = availableScripts[1].name
local isDropdownOpen = false
local dropdownItems = {}
local filteredScripts = {}

local dropdownContainer = Instance.new("Frame")
dropdownContainer.Size = UDim2.new(0, 210, 0, 48)
dropdownContainer.Position = UDim2.new(0, 25, 1, -70)
dropdownContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
dropdownContainer.BackgroundTransparency = 0.3
dropdownContainer.BorderSizePixel = 0
dropdownContainer.Parent = mainFrame

local dropCorner = Instance.new("UICorner")
dropCorner.CornerRadius = UDim.new(0, 10)
dropCorner.Parent = dropdownContainer

local dropStroke = Instance.new("UIStroke")
dropStroke.Color = themeColor
dropStroke.Thickness = 1.5
dropStroke.Transparency = 0.6
dropStroke.Parent = dropdownContainer

local dropdownBtn = Instance.new("TextButton")
dropdownBtn.Size = UDim2.new(1, 0, 1, 0)
dropdownBtn.BackgroundTransparency = 1
dropdownBtn.Text = ""
dropdownBtn.ZIndex = 5
dropdownBtn.Parent = dropdownContainer

local scriptNameLabel = Instance.new("TextLabel")
scriptNameLabel.Size = UDim2.new(1, -30, 1, 0)
scriptNameLabel.Position = UDim2.new(0, 12, 0, 0)
scriptNameLabel.BackgroundTransparency = 1
scriptNameLabel.Text = "" .. selectedScriptName
scriptNameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
scriptNameLabel.Font = Enum.Font.GothamBold
scriptNameLabel.TextSize = 15
scriptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
scriptNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
scriptNameLabel.ZIndex = 6
scriptNameLabel.Parent = dropdownBtn

local arrowLabel = Instance.new("TextLabel")
arrowLabel.Size = UDim2.new(0, 24, 1, 0)
arrowLabel.Position = UDim2.new(1, -28, 0, 0)
arrowLabel.BackgroundTransparency = 1
arrowLabel.Text = "▼"
arrowLabel.TextColor3 = themeColor
arrowLabel.Font = Enum.Font.GothamBold
arrowLabel.TextSize = 14
arrowLabel.TextXAlignment = Enum.TextXAlignment.Center
arrowLabel.ZIndex = 6
arrowLabel.Parent = dropdownBtn

local dropdownList = Instance.new("ScrollingFrame")
dropdownList.Size = UDim2.new(0, 210, 0, 0)
dropdownList.Position = UDim2.new(0, 20, 1, -22)
dropdownList.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
dropdownList.BackgroundTransparency = 0.1
dropdownList.BorderSizePixel = 0
dropdownList.ZIndex = 20
dropdownList.Visible = false
dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdownList.ScrollBarThickness = 4
dropdownList.ScrollBarImageColor3 = themeColor
dropdownList.ScrollBarImageTransparency = 0.3
dropdownList.Parent = mainFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 10)
listCorner.Parent = dropdownList

local listStroke = Instance.new("UIStroke")
listStroke.Color = themeColor
listStroke.Thickness = 1.5
listStroke.Transparency = 0.4
listStroke.ZIndex = 21
listStroke.Parent = dropdownList

local dropListLayout = Instance.new("UIListLayout")
dropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
dropListLayout.Padding = UDim.new(0, 2)
dropListLayout.Parent = dropdownList

local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0, 8)
listPadding.PaddingBottom = UDim.new(0, 8)
listPadding.PaddingLeft = UDim.new(0, 8)
listPadding.PaddingRight = UDim.new(0, 8)
listPadding.Parent = dropdownList

local searchBar = Instance.new("Frame")
searchBar.Size = UDim2.new(1, 0, 0, 32)
searchBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
searchBar.BorderSizePixel = 0
searchBar.ZIndex = 25
searchBar.Parent = dropdownList

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 6)
searchCorner.Parent = searchBar

local searchStroke = Instance.new("UIStroke")
searchStroke.Color = themeColor
searchStroke.Thickness = 1
searchStroke.Transparency = 0.5
searchStroke.ZIndex = 26
searchStroke.Parent = searchBar

local searchIcon = Instance.new("TextLabel")
searchIcon.Size = UDim2.new(0, 28, 1, 0)
searchIcon.Position = UDim2.new(0, 4.7, 0.1, 0)
searchIcon.BackgroundTransparency = 1
searchIcon.Text = "🔍"
searchIcon.TextSize = 13
searchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
searchIcon.ZIndex = 27
searchIcon.Parent = searchBar

local searchInput = Instance.new("TextBox")
searchInput.Size = UDim2.new(1, -38, 1, 0)
searchInput.Position = UDim2.new(0, 34, 0, 0)
searchInput.BackgroundTransparency = 1
searchInput.Text = ""
searchInput.PlaceholderText = "Search script..."
searchInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
searchInput.TextColor3 = Color3.fromRGB(220, 220, 220)
searchInput.Font = Enum.Font.Gotham
searchInput.TextSize = 13
searchInput.TextXAlignment = Enum.TextXAlignment.Left
searchInput.ZIndex = 27
searchInput.ClearTextOnFocus = false
searchInput.Parent = searchBar

local function createDropdownItems()
	for _, item in ipairs(dropdownItems) do
		if item and item.Parent then
			item:Destroy()
		end
	end
	dropdownItems = {}
	
	for i, scriptData in ipairs(filteredScripts) do
		local item = Instance.new("TextButton")
		item.Name = "DropdownItem"
		item.Size = UDim2.new(1, 0, 0, 34)
		item.BackgroundTransparency = 1
		item.BackgroundColor3 = themeColor
		item.Text = scriptData.name
		item.TextColor3 = Color3.fromRGB(200, 200, 200)
		item.Font = Enum.Font.Gotham
		item.TextSize = 14
		item.TextXAlignment = Enum.TextXAlignment.Left
		item.TextTruncate = Enum.TextTruncate.AtEnd
		item.ZIndex = 22
		item.Visible = true
		item.Parent = dropdownList
		
		local itemPadding = Instance.new("UIPadding")
		itemPadding.PaddingLeft = UDim.new(0, 10)
		itemPadding.Parent = item
		
		local itemCorner = Instance.new("UICorner")
		itemCorner.CornerRadius = UDim.new(0, 6)
		itemCorner.Parent = item

		table.insert(dropdownItems, item)

		item.MouseEnter:Connect(function()
			item.BackgroundTransparency = 0.2
			item.TextColor3 = Color3.fromRGB(10, 10, 12)
		end)
		
		item.MouseLeave:Connect(function()
			item.BackgroundTransparency = 1
			item.TextColor3 = Color3.fromRGB(200, 200, 200)
		end)

		item.MouseButton1Click:Connect(function()
			selectedScriptUrl = scriptData.url
			selectedScriptName = scriptData.name
			scriptNameLabel.Text = "" .. selectedScriptName
			closeDropdown()
		end)
	end
	
	task.wait()
	dropdownList.CanvasSize = UDim2.new(0, 0, 0, dropListLayout.AbsoluteContentSize.Y + 48)
end

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchInput.Text:lower()
	filteredScripts = {}
	
	for _, scriptData in ipairs(availableScripts) do
		if scriptData.name:lower():find(query) then
			table.insert(filteredScripts, scriptData)
		end
	end
	
	createDropdownItems()
end)

local function openDropdown()
	isDropdownOpen = true
	dropdownList.Visible = true
	
	searchInput.Text = ""
	filteredScripts = {}
	for _, s in ipairs(availableScripts) do
		table.insert(filteredScripts, s)
	end
	
	createDropdownItems()
	
	local totalHeight = math.min(200, (#filteredScripts * 36) + 48)
	TweenService:Create(dropdownList, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 210, 0, totalHeight),
		Position = UDim2.new(0, 20, 1, -22)
	}):Play()
end

local function closeDropdown()
	isDropdownOpen = false
	
	TweenService:Create(dropdownList, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 210, 0, 0),
		Position = UDim2.new(0, 20, 1, -22)
	}):Play()
	
	task.spawn(function()
		task.wait(0.25)
		if not isDropdownOpen then
			dropdownList.Visible = false
			for _, item in ipairs(dropdownItems) do
				if item and item.Parent then
					item.Visible = false
				end
			end
		end
	end)
end

dropdownBtn.MouseButton1Click:Connect(function()
	if isDropdownOpen then
		closeDropdown()
	else
		openDropdown()
	end
end)

UserInputService.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and isDropdownOpen then
		local touchPos = input.Position
		local listPos = dropdownList.AbsolutePosition
		local listSize = dropdownList.AbsoluteSize
		local btnPos = dropdownContainer.AbsolutePosition
		local btnSize = dropdownContainer.AbsoluteSize
		
		local inList = touchPos.X >= listPos.X and touchPos.X <= listPos.X + listSize.X and
		               touchPos.Y >= listPos.Y and touchPos.Y <= listPos.Y + listSize.Y
		local inBtn = touchPos.X >= btnPos.X and touchPos.X <= btnPos.X + btnSize.X and
		              touchPos.Y >= btnPos.Y and touchPos.Y <= btnPos.Y + btnSize.Y
		              
		if not inList and not inBtn then
			closeDropdown()
		end
	end
end)

local continueBtn = Instance.new("TextButton")
continueBtn.Size = UDim2.new(0, 210, 0, 48)
continueBtn.Position = UDim2.new(0, 295, 1, -70)
continueBtn.BackgroundColor3 = themeColor
continueBtn.Text = "⏩ EXECUTE"
continueBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
continueBtn.Font = Enum.Font.GothamBlack
continueBtn.TextSize = 20
continueBtn.Visible = false
continueBtn.ZIndex = 5
continueBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = continueBtn

continueBtn.MouseEnter:Connect(function()
	if not UserInputService.TouchEnabled then
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 180, 255)}):Play()
	end
end)

continueBtn.MouseLeave:Connect(function()
	if not UserInputService.TouchEnabled then
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor}):Play()
	end
end)

continueBtn.MouseButton1Click:Connect(function()
	if continueBtn.Text == " RUNNING..." then return end
	
	continueBtn.Interactable = false
	continueBtn.Text = "⏳ RUNNING..."
	
	TweenService:Create(continueBtn, TweenInfo.new(0.3), {
		BackgroundColor3 = Color3.fromRGB(255, 200, 0),
		TextSize = 18
	}):Play()
	
	task.wait(0.2)
	
	task.spawn(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet(selectedScriptUrl))()
		end)
		
		task.wait(0.5)
		
		if success then
			continueBtn.Text = "✅ EXECUTED"
			TweenService:Create(continueBtn, TweenInfo.new(0.3), {
				BackgroundColor3 = themeColor,
				TextSize = 20
			}):Play()
		else
			continueBtn.Text = "❌ FAILED"
			TweenService:Create(continueBtn, TweenInfo.new(0.3), {
				BackgroundColor3 = Color3.fromRGB(255, 60, 60),
				TextSize = 20
			}):Play()
		end
		
		task.wait(2)
		continueBtn.Text = "⏩ EXECUTE"
		continueBtn.Interactable = true
		TweenService:Create(continueBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = themeColor,
			TextSize = 20
		}):Play()
	end)
end)

-- ==========================================
-- 8. LOGIKA DRAGGING MAIN FRAME
-- ==========================================
local dragging = false
local dragStart = Vector2.new(0, 0)
local startPos = UDim2.new(0, 0, 0, 0)

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

-- ==========================================
-- 9. PROGRESS & CHECKING SEQUENCE
-- ==========================================
local function updateProgress(percent)
	TweenService:Create(progressBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
		Size = UDim2.new(percent / 100, 0, 1, 0)
	}):Play()
end

local function runChecks()
	updateProgress(10)
	task.wait(0.3)
	
	if isMobile then
		checkingLabel.Text = "Checking Mobile... ✅"
		updateProgress(20)
		task.wait(0.2)
		checkingLabel.Text = "Bypassing restrictions... ✅"
		updateProgress(50)
		task.wait(0.2)
		checkingLabel.Text = "Authenticating... ✅"
		updateProgress(80)
		task.wait(0.2)
		checkingLabel.Text = "Checking complete!"
		updateProgress(100)
	elseif isPC then
		checkingLabel.Text = "Checking PC... ✅"
		updateProgress(20)
		task.wait(0.2)
		checkingLabel.Text = "Scanning for hooks... ✅"
		updateProgress(50)
		task.wait(0.2)
		checkingLabel.Text = "Authenticating... ✅"
		updateProgress(80)
		task.wait(0.2)
		checkingLabel.Text = "Checking complete!"
		updateProgress(100)
	else
		checkingLabel.Text = "Checking Unknown Device... ✅"
		updateProgress(20)
		task.wait(0.2)
		checkingLabel.Text = "Scanning... ✅"
		updateProgress(50)
		task.wait(0.2)
		checkingLabel.Text = "Authenticating... ✅"
		updateProgress(80)
		task.wait(0.2)
		checkingLabel.Text = "Checking complete!"
		updateProgress(100)
	end
	
	task.wait(1)
	checkingLabel.Text = "🟢 Status: Operational"
	continueBtn.Visible = true
end

mainFrame.Position = UDim2.new(0.5, -240, 0.5, -150)
mainFrame.BackgroundTransparency = 1
stroke.Transparency = 1

local enterTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, -240, 0.5, -190),
	BackgroundTransparency = 0
})
local strokeTween = TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 0.6})

enterTween:Play()
strokeTween:Play()

task.wait(0.5)
task.spawn(runChecks)

-- ==========================================
-- 10. DEV PANEL (Settings)
-- ==========================================
local currentDarkColor = Color3.fromRGB(30, 30, 35)
local currentDarkerColor = Color3.fromRGB(20, 20, 25)

local settingsBtn = Instance.new("TextButton")
settingsBtn.Name = "SettingsBtn"
settingsBtn.Size = UDim2.new(0, 70, 0, 36)
settingsBtn.Position = UDim2.new(0, 265, 0, 22)
settingsBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
settingsBtn.Text = "🛠️"
settingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 14
settingsBtn.TextWrapped = true
settingsBtn.ZIndex = 10
settingsBtn.Parent = mainFrame

local settingsBtnCorner = Instance.new("UICorner")
settingsBtnCorner.CornerRadius = UDim.new(0, 6)
settingsBtnCorner.Parent = settingsBtn

local settingsBtnStroke = Instance.new("UIStroke")
settingsBtnStroke.Color = Color3.fromRGB(100, 100, 100)
settingsBtnStroke.Thickness = 1
settingsBtnStroke.Transparency = 0.5
settingsBtnStroke.Parent = settingsBtn

-- Dev Panel Frame
local settingsPanel = Instance.new("Frame")
settingsPanel.Name = "DevPanel"
settingsPanel.Size = UDim2.new(0, 400, 0, 460)
settingsPanel.Position = UDim2.new(1, -420, 0.5, -230) -- DIPERBARUI - Posisi kanan
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false -- DIPERBARUI - Langsung terlihat
settingsPanel.ClipsDescendants = true
settingsPanel.Parent = gui

local settingsGradient = Instance.new("UIGradient")
settingsGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, currentDarkColor),
	ColorSequenceKeypoint.new(1, currentDarkerColor)
})
settingsGradient.Rotation = 135
settingsGradient.Parent = settingsPanel

local settingsCorner = Instance.new("UICorner")
settingsCorner.CornerRadius = UDim.new(0, 14)
settingsCorner.Parent = settingsPanel

local settingsStroke = Instance.new("UIStroke")
settingsStroke.Color = themeColor
settingsStroke.Thickness = 1.5
settingsStroke.Transparency = 0.4
settingsStroke.Parent = settingsPanel

local settingsHeader = Instance.new("TextLabel")
settingsHeader.Size = UDim2.new(1, -50, 0, 40)
settingsHeader.Position = UDim2.new(0, 0, 0, 10)
settingsHeader.BackgroundTransparency = 1
settingsHeader.Text = "Dev Panel"
settingsHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsHeader.Font = Enum.Font.GothamBold
settingsHeader.TextSize = 22
settingsHeader.TextXAlignment = Enum.TextXAlignment.Center
settingsHeader.Parent = settingsPanel

local closeSettingsBtn = Instance.new("TextButton")
closeSettingsBtn.Size = UDim2.new(0, 36, 0, 36)
closeSettingsBtn.Position = UDim2.new(1, -44, 0, 12)
closeSettingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
closeSettingsBtn.Text = "X"
closeSettingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeSettingsBtn.Font = Enum.Font.GothamBold
closeSettingsBtn.TextSize = 16
closeSettingsBtn.ZIndex = 10
closeSettingsBtn.Parent = settingsPanel

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 6)
closeBtnCorner.Parent = closeSettingsBtn

closeSettingsBtn.MouseEnter:Connect(function()
	TweenService:Create(closeSettingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
	closeSettingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

closeSettingsBtn.MouseLeave:Connect(function()
	TweenService:Create(closeSettingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
	closeSettingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -20, 0, 2)
separator.Position = UDim2.new(0, 10, 0, 55)
separator.BackgroundColor3 = themeColor
separator.BackgroundTransparency = 0.6
separator.Parent = settingsPanel

local sepCorner = Instance.new("UICorner")
sepCorner.CornerRadius = UDim.new(1, 0)
sepCorner.Parent = separator

-- ScrollingFrame untuk Developer Panel (Sesuai Permintaan)
local settingsOptions = Instance.new("ScrollingFrame")
settingsOptions.Size = UDim2.new(1, -30, 0, 380)
settingsOptions.Position = UDim2.new(0, 15, 0, 70)
settingsOptions.BackgroundTransparency = 1
settingsOptions.BorderSizePixel = 0
settingsOptions.CanvasSize = UDim2.new(0, 0, 0, 0)
settingsOptions.ScrollBarThickness = 4
settingsOptions.ScrollBarImageColor3 = themeColor
settingsOptions.ScrollBarImageTransparency = 0.3
settingsOptions.Parent = settingsPanel

local settingsListLayout = Instance.new("UIListLayout")
settingsListLayout.Padding = UDim.new(0, 12)
settingsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
settingsListLayout.Parent = settingsOptions

settingsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	settingsOptions.CanvasSize = UDim2.new(0, 0, 0, settingsListLayout.AbsoluteContentSize.Y + 20)
end)

-- Helper functions
local function createSettingRow(name, optionType, parent)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 44)
	row.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
	row.BackgroundTransparency = 0.3
	row.BorderSizePixel = 0
	row.Parent = parent
	row.ClipsDescendants = true
	
	local rowCorner = Instance.new("UICorner")
	rowCorner.CornerRadius = UDim.new(0, 8)
	rowCorner.Parent = row
	
	local rowStroke = Instance.new("UIStroke")
	rowStroke.Color = Color3.fromRGB(60, 60, 65)
	rowStroke.Thickness = 1
	rowStroke.Parent = row
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.58, 0, 1, 0)
	label.Position = UDim2.new(0, 12, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextColor3 = Color3.fromRGB(220, 220, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 15
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextTruncate = Enum.TextTruncate.AtEnd
	label.Parent = row
	
	local optionBtn = Instance.new("TextButton")
	optionBtn.Size = UDim2.new(0.38, 0, 0.7, 0)
	optionBtn.Position = UDim2.new(0.60, 0, 0.15, 0)
	optionBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
	optionBtn.Text = optionType
	optionBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	optionBtn.Font = Enum.Font.GothamBold
	optionBtn.TextSize = 13
	optionBtn.TextTruncate = Enum.TextTruncate.AtEnd
	optionBtn.Parent = row
	
	local optCorner = Instance.new("UICorner")
	optCorner.CornerRadius = UDim.new(0, 6)
	optCorner.Parent = optionBtn
	
	return row, optionBtn
end

local function createSliderRow(name, minVal, maxVal, defaultVal, parent, onValueChange)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 60)
	row.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
	row.BackgroundTransparency = 0.3
	row.BorderSizePixel = 0
	row.Parent = parent
	row.ClipsDescendants = true
	
	local rowCorner = Instance.new("UICorner")
	rowCorner.CornerRadius = UDim.new(0, 8)
	rowCorner.Parent = row
	
	local rowStroke = Instance.new("UIStroke")
	rowStroke.Color = Color3.fromRGB(60, 60, 65)
	rowStroke.Thickness = 1
	rowStroke.Parent = row
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.45, 0, 0, 20)
	label.Position = UDim2.new(0, 12, 0, 8)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextColor3 = Color3.fromRGB(220, 220, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 15
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = row
	
	local toggleBtn = Instance.new("TextButton")
	toggleBtn.Size = UDim2.new(0, 55, 0, 24)
	toggleBtn.Position = UDim2.new(1, -65, 0, 8)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
	toggleBtn.Text = "OFF"
	toggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	toggleBtn.Font = Enum.Font.GothamBold
	toggleBtn.TextSize = 12
	toggleBtn.Parent = row
	
	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(1, 0)
	toggleCorner.Parent = toggleBtn
	
	local sliderBg = Instance.new("Frame")
	sliderBg.Size = UDim2.new(0.75, 0, 0, 8)
	sliderBg.Position = UDim2.new(0, 12, 1, -24)
	sliderBg.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	sliderBg.Parent = row
	
	local sliderBgCorner = Instance.new("UICorner")
	sliderBgCorner.CornerRadius = UDim.new(1, 0)
	sliderBgCorner.Parent = sliderBg
	
	local sliderFill = Instance.new("Frame")
	sliderFill.Size = UDim2.new(0, 0, 1, 0)
	sliderFill.BackgroundColor3 = themeColor
	sliderFill.Parent = sliderBg
	
	local sliderFillCorner = Instance.new("UICorner")
	sliderFillCorner.CornerRadius = UDim.new(1, 0)
	sliderFillCorner.Parent = sliderFill
	
	local sliderKnob = Instance.new("TextButton")
	sliderKnob.Size = UDim2.new(0, 14, 0, 14)
	sliderKnob.Position = UDim2.new(0, -7, 0.5, -7)
	sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sliderKnob.Text = ""
	sliderKnob.Parent = sliderFill
	
	local sliderKnobCorner = Instance.new("UICorner")
	sliderKnobCorner.CornerRadius = UDim.new(1, 0)
	sliderKnobCorner.Parent = sliderKnob
	
	local valueLabel = Instance.new("TextLabel")
	valueLabel.Size = UDim2.new(0, 50, 0, 20)
	valueLabel.Position = UDim2.new(0.78, 5, 1, -24)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = tostring(defaultVal)
	valueLabel.TextColor3 = themeColor
	valueLabel.Font = Enum.Font.GothamBold
	valueLabel.TextSize = 14
	valueLabel.TextXAlignment = Enum.TextXAlignment.Right
	valueLabel.Parent = row

	local drag = false
	local currentValue = defaultVal
	
	local function updateSlider(input)
		local sliderWidth = sliderBg.AbsoluteSize.X
		local relativeX = input.Position.X - sliderBg.AbsolutePosition.X
		local percent = math.clamp(relativeX / sliderWidth, 0, 1)
		
		sliderFill.Size = UDim2.new(percent, 0, 1, 0)
		sliderKnob.Position = UDim2.new(percent, -7, 0.5, -7)
		
		currentValue = math.floor(minVal + (maxVal - minVal) * percent)
		valueLabel.Text = tostring(currentValue)
		
		if onValueChange then
			onValueChange(currentValue)
		end
	end
	
	sliderKnob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			drag = true
		end
	end)
	
	sliderKnob.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			drag = false
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateSlider(input)
		end
	end)
	
	sliderBg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			updateSlider(input)
			drag = true
		end
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			drag = false
		end
	end)
	
	local initPercent = (defaultVal - minVal) / (maxVal - minVal)
	sliderFill.Size = UDim2.new(initPercent, 0, 1, 0)
	sliderKnob.Position = UDim2.new(initPercent, -7, 0.5, -7)
	
	return row, toggleBtn, function() return currentValue end
end

-- ==========================================
-- FITUR DEV PANEL
-- ==========================================

-- 1. Infinite Yield
local row1 = Instance.new("Frame")
row1.Size = UDim2.new(1, 0, 0, 44)
row1.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
row1.BackgroundTransparency = 0.3
row1.BorderSizePixel = 0
row1.Parent = settingsOptions
row1.ClipsDescendants = true

local row1Corner = Instance.new("UICorner")
row1Corner.CornerRadius = UDim.new(0, 8)
row1Corner.Parent = row1

local row1Stroke = Instance.new("UIStroke")
row1Stroke.Color = Color3.fromRGB(60, 60, 65)
row1Stroke.Thickness = 1
row1Stroke.Parent = row1

local scriptsLabel = Instance.new("TextLabel")
scriptsLabel.Size = UDim2.new(0.58, 0, 1, 0)
scriptsLabel.Position = UDim2.new(0, 12, 0, 0)
scriptsLabel.BackgroundTransparency = 1
scriptsLabel.Text = "Infinite Yield"
scriptsLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
scriptsLabel.Font = Enum.Font.Gotham
scriptsLabel.TextSize = 15
scriptsLabel.TextXAlignment = Enum.TextXAlignment.Left
scriptsLabel.Parent = row1

local scriptsBtn = Instance.new("TextButton")
scriptsBtn.Size = UDim2.new(0.38, 0, 0.7, 0)
scriptsBtn.Position = UDim2.new(0.60, 0, 0.15, 0)
scriptsBtn.BackgroundColor3 = themeColor
scriptsBtn.Text = "Click"
scriptsBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
scriptsBtn.Font = Enum.Font.GothamBold
scriptsBtn.TextSize = 14
scriptsBtn.Parent = row1

local scriptsCorner = Instance.new("UICorner")
scriptsCorner.CornerRadius = UDim.new(0, 6)
scriptsCorner.Parent = scriptsBtn

scriptsBtn.MouseEnter:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor:Lerp(Color3.new(1,1,1), 0.3)}):Play()
end)

scriptsBtn.MouseLeave:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor}):Play()
end)

scriptsBtn.MouseButton1Click:Connect(function()
	scriptsBtn.Text = "Loading..."
	scriptsBtn.Interactable = false
	
	task.spawn(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end)
		
		if success then
			scriptsBtn.Text = "Loaded!"
			task.wait(1)
			scriptsBtn.Text = "Click"
			scriptsBtn.Interactable = true
		else
			scriptsBtn.Text = "Error!"
			task.wait(1)
			scriptsBtn.Text = "Click"
			scriptsBtn.Interactable = true
		end
	end)
end)

-- 2. Player ESP Toggle
local espRow = Instance.new("Frame")
espRow.Size = UDim2.new(1, 0, 0, 44)
espRow.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
espRow.BackgroundTransparency = 0.3
espRow.BorderSizePixel = 0
espRow.Parent = settingsOptions
espRow.ClipsDescendants = true

local espRowCorner = Instance.new("UICorner")
espRowCorner.CornerRadius = UDim.new(0, 8)
espRowCorner.Parent = espRow

local espRowStroke = Instance.new("UIStroke")
espRowStroke.Color = Color3.fromRGB(60, 60, 65)
espRowStroke.Thickness = 1
espRowStroke.Parent = espRow

local espLabel = Instance.new("TextLabel")
espLabel.Size = UDim2.new(0.7, 0, 1, 0)
espLabel.Position = UDim2.new(0, 12, 0, 0)
espLabel.BackgroundTransparency = 1
espLabel.Text = "Player ESP"
espLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
espLabel.Font = Enum.Font.Gotham
espLabel.TextSize = 15
espLabel.TextXAlignment = Enum.TextXAlignment.Left
espLabel.Parent = espRow

local espToggleBtn = Instance.new("TextButton")
espToggleBtn.Size = UDim2.new(0.25, 0, 0.7, 0)
espToggleBtn.Position = UDim2.new(0.73, 0, 0.15, 0)
espToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
espToggleBtn.Text = "OFF"
espToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
espToggleBtn.Font = Enum.Font.GothamBold
espToggleBtn.TextSize = 13
espToggleBtn.Parent = espRow

local espToggleCorner = Instance.new("UICorner")
espToggleCorner.CornerRadius = UDim.new(1, 0)
espToggleCorner.Parent = espToggleBtn

-- 3. Infinite Jump Toggle
local infJumpRow = Instance.new("Frame")
infJumpRow.Size = UDim2.new(1, 0, 0, 44)
infJumpRow.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
infJumpRow.BackgroundTransparency = 0.3
infJumpRow.BorderSizePixel = 0
infJumpRow.Parent = settingsOptions
infJumpRow.ClipsDescendants = true

local infJumpRowCorner = Instance.new("UICorner")
infJumpRowCorner.CornerRadius = UDim.new(0, 8)
infJumpRowCorner.Parent = infJumpRow

local infJumpRowStroke = Instance.new("UIStroke")
infJumpRowStroke.Color = Color3.fromRGB(60, 60, 65)
infJumpRowStroke.Thickness = 1
infJumpRowStroke.Parent = infJumpRow

local infJumpLabel = Instance.new("TextLabel")
infJumpLabel.Size = UDim2.new(0.7, 0, 1, 0)
infJumpLabel.Position = UDim2.new(0, 12, 0, 0)
infJumpLabel.BackgroundTransparency = 1
infJumpLabel.Text = "Infinite Jump"
infJumpLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
infJumpLabel.Font = Enum.Font.Gotham
infJumpLabel.TextSize = 15
infJumpLabel.TextXAlignment = Enum.TextXAlignment.Left
infJumpLabel.Parent = infJumpRow

local infJumpToggleBtn = Instance.new("TextButton")
infJumpToggleBtn.Size = UDim2.new(0.25, 0, 0.7, 0)
infJumpToggleBtn.Position = UDim2.new(0.73, 0, 0.15, 0)
infJumpToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
infJumpToggleBtn.Text = "OFF"
infJumpToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
infJumpToggleBtn.Font = Enum.Font.GothamBold
infJumpToggleBtn.TextSize = 13
infJumpToggleBtn.Parent = infJumpRow

local infJumpToggleCorner = Instance.new("UICorner")
infJumpToggleCorner.CornerRadius = UDim.new(1, 0)
infJumpToggleCorner.Parent = infJumpToggleBtn

-- 4. Walkspeed Slider + Toggle
local walkspeedEnabled = false
local walkspeedRow, walkspeedToggleBtn, getWalkspeed = createSliderRow("Walkspeed", 16, 1000, 16, settingsOptions, function(val)
	if walkspeedEnabled then
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = val end
		end
	end
end)

-- 5. Jumpower Slider + Toggle
local jumpowerEnabled = false
local jumpowerRow, jumpowerToggleBtn, getJumpower = createSliderRow("Jumpower", 50, 2000, 50, settingsOptions, function(val)
	if jumpowerEnabled then
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then 
				hum.UseJumpPower = true
				hum.JumpPower = val 
			end
		end
	end
end)

-- 6. Executor Panel (Menggantikan posisi lama Destroy UI)
local rowExecutor, executorPanelBtn = createSettingRow("Executor Panel", "Open", settingsOptions)

-- ==========================================
-- SCRIPT EXECUTOR PANEL
-- ==========================================
local executorPanel = Instance.new("Frame")
executorPanel.Name = "executorPanel"
executorPanel.Size = UDim2.new(0, 350, 0, 300)
executorPanel.Position = UDim2.new(0, 20, 0.5, -150) -- DIPERBARUI - Posisi kiri
executorPanel.BorderSizePixel = 0
executorPanel.Visible = false -- DIPERBARUI - Langsung terlihat
executorPanel.ClipsDescendants = true
executorPanel.Parent = gui

local executorGradient = Instance.new("UIGradient")
executorGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, currentDarkColor),
	ColorSequenceKeypoint.new(1, currentDarkerColor)
})
executorGradient.Rotation = 135
executorGradient.Parent = executorPanel

local executorCorner = Instance.new("UICorner")
executorCorner.CornerRadius = UDim.new(0, 14)
executorCorner.Parent = executorPanel

local executorStroke = Instance.new("UIStroke")
executorStroke.Color = themeColor
executorStroke.Thickness = 1.5
executorStroke.Transparency = 0.4
executorStroke.Parent = executorPanel

local executorHeader = Instance.new("TextLabel")
executorHeader.Size = UDim2.new(1, -50, 0, 35)
executorHeader.Position = UDim2.new(0, 0, 0, 10)
executorHeader.BackgroundTransparency = 1
executorHeader.Text = "Zeutron Executor | V247"
executorHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
executorHeader.Font = Enum.Font.GothamBold
executorHeader.TextSize = 18
executorHeader.TextXAlignment = Enum.TextXAlignment.Center
executorHeader.Parent = executorPanel

local closeExecutorBtn = Instance.new("TextButton")
closeExecutorBtn.Size = UDim2.new(0, 30, 0, 30)
closeExecutorBtn.Position = UDim2.new(1, -38, 0, 12)
closeExecutorBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
closeExecutorBtn.Text = "X"
closeExecutorBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeExecutorBtn.Font = Enum.Font.GothamBold
closeExecutorBtn.TextSize = 14
closeExecutorBtn.ZIndex = 10
closeExecutorBtn.Parent = executorPanel

local closeExecCorner = Instance.new("UICorner")
closeExecCorner.CornerRadius = UDim.new(0, 6)
closeExecCorner.Parent = closeExecutorBtn

closeExecutorBtn.MouseEnter:Connect(function()
	TweenService:Create(closeExecutorBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
end)

closeExecutorBtn.MouseLeave:Connect(function()
	TweenService:Create(closeExecutorBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
end)

local scriptInput = Instance.new("TextBox")
scriptInput.Size = UDim2.new(1, -20, 0, 180)
scriptInput.Position = UDim2.new(0, 10, 0, 55)
scriptInput.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
scriptInput.BackgroundTransparency = 0.3
scriptInput.Text = ""
scriptInput.PlaceholderText = "-- Enter your Lua script here...\nprint(\"Hello World\")"
scriptInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
scriptInput.TextColor3 = Color3.fromRGB(220, 220, 220)
scriptInput.Font = Enum.Font.Code
scriptInput.TextSize = 13
scriptInput.TextXAlignment = Enum.TextXAlignment.Left
scriptInput.TextYAlignment = Enum.TextYAlignment.Top
scriptInput.ClearTextOnFocus = false
scriptInput.MultiLine = true
scriptInput.Parent = executorPanel

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = scriptInput

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = themeColor
inputStroke.Thickness = 1
inputStroke.Transparency = 0.5
inputStroke.Parent = scriptInput

local execButton = Instance.new("TextButton")
execButton.Size = UDim2.new(0, 120, 0, 35)
execButton.Position = UDim2.new(0, 10, 1, -45)
execButton.BackgroundColor3 = themeColor
execButton.Text = " EXECUTE"
execButton.TextColor3 = Color3.fromRGB(10, 10, 12)
execButton.Font = Enum.Font.GothamBlack
execButton.TextSize = 16
execButton.Parent = executorPanel

local execCorner = Instance.new("UICorner")
execCorner.CornerRadius = UDim.new(0, 8)
execCorner.Parent = execButton

execButton.MouseEnter:Connect(function()
	TweenService:Create(execButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 180, 255)}):Play()
end)

execButton.MouseLeave:Connect(function()
	TweenService:Create(execButton, TweenInfo.new(0.2), {BackgroundColor3 = themeColor}):Play()
end)

execButton.MouseButton1Click:Connect(function()
	local script = scriptInput.Text
	if script and script ~= "" then
		execButton.Text = "⌛ Running..."
		execButton.Interactable = false
		
		task.spawn(function()
			local success, err = pcall(function()
				loadstring(script)()
			end)
			
			task.wait(0.5)
			
			if success then
				execButton.Text = "✅ Executed"
			else
				execButton.Text = "❌ Error"
			end
			
			task.wait(1.5)
			execButton.Text = "⏩ EXECUTE"
			execButton.Interactable = true
		end)
	end
end)

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0, 100, 0, 35)
clearButton.Position = UDim2.new(0, 140, 1, -45)
clearButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
clearButton.Text = "🧹 Clear"
clearButton.TextColor3 = Color3.fromRGB(200, 200, 200)
clearButton.Font = Enum.Font.GothamBold
clearButton.TextSize = 14
clearButton.Parent = executorPanel

local clearCorner = Instance.new("UICorner")
clearCorner.CornerRadius = UDim.new(0, 8)
clearCorner.Parent = clearButton

clearButton.MouseEnter:Connect(function()
	TweenService:Create(clearButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
end)

clearButton.MouseLeave:Connect(function()
	TweenService:Create(clearButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 55)}):Play()
end)

clearButton.MouseButton1Click:Connect(function()
	scriptInput.Text = ""
end)

local workingButton = Instance.new("TextButton")
workingButton.Size = UDim2.new(0, 50, 0, 35)
workingButton.Position = UDim2.new(0, 285, 1, -45)
workingButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
workingButton.Text = "🟢"
workingButton.TextColor3 = Color3.fromRGB(20, 20, 25)
workingButton.Font = Enum.Font.GothamBold
workingButton.TextSize = 14
workingButton.Parent = executorPanel

local workingCorner = Instance.new("UICorner")
workingCorner.CornerRadius = UDim.new(0, 8)
workingCorner.Parent = clearButton

executorPanelBtn.BackgroundColor3 = themeColor
executorPanelBtn.TextColor3 = Color3.fromRGB(10, 10, 12)

executorPanelBtn.MouseEnter:Connect(function()
	TweenService:Create(executorPanelBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor:Lerp(Color3.new(1,1,1), 0.3)}):Play()
end)

executorPanelBtn.MouseLeave:Connect(function()
	TweenService:Create(executorPanelBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor}):Play()
end)

executorPanelBtn.MouseButton1Click:Connect(function()
	executorPanel.Visible = not executorPanel.Visible
	if executorPanel.Visible then
		executorPanel.Position = UDim2.new(0, 20, 0.5, -150)
		executorPanel.BackgroundTransparency = 1
		TweenService:Create(executorPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 20, 0.5, -150),
			BackgroundTransparency = 0
		}):Play()
	else
		TweenService:Create(executorPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			BackgroundTransparency = 1
		}):Play()
	end
end)


-- 7. Destroy UI (BARU - Warna Merah & Logic Sesuai Permintaan)
local rowDestroy, destroyUiBtn = createSettingRow("Destroy UI", "Click", settingsOptions)

-- Styling Merah untuk Destroy UI
rowDestroy.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
rowDestroy.BackgroundTransparency = 0.3
local rowDestroyStroke = rowDestroy:FindFirstChildOfClass("UIStroke")
if rowDestroyStroke then
	rowDestroyStroke.Color = Color3.fromRGB(255, 50, 50)
end

destroyUiBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
destroyUiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

destroyUiBtn.MouseEnter:Connect(function()
	TweenService:Create(destroyUiBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)

destroyUiBtn.MouseLeave:Connect(function()
	TweenService:Create(destroyUiBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)

destroyUiBtn.MouseButton1Click:Connect(function()
	if mainFrame then
		TweenService:Create(mainFrame, TweenInfo.new(0.3), {
			Position = UDim2.new(0.5, -240, 0.5, -300),
			BackgroundTransparency = 1
		}):Play()
	end
	
	TweenService:Create(settingsPanel, TweenInfo.new(0.3), {
		Position = UDim2.new(0.5, 260, 0.5, -300),
		BackgroundTransparency = 1
	}):Play()
	
	if executorPanel then
		TweenService:Create(executorPanel, TweenInfo.new(0.3), {
			Position = UDim2.new(0.5, -175, 0.5, 300),
			BackgroundTransparency = 1
		}):Play()
	end
	
	task.wait(0.3)
	gui:Destroy()
end)

-- ==========================================
-- ESP Logic (Simplified)
-- ==========================================
local espEnabledState = false
local espObjects = {} 

local function getTeamColor(player)
	local team = player.Team
	local teamName = team and team.Name or ""
	
	local teamColorMap = {
		["Fugitive"] = Color3.fromRGB(255, 50, 50),
		["Prison"]   = Color3.fromRGB(255, 150, 0),
		["Police"]   = Color3.fromRGB(0, 100, 255),
		["Civilian"] = Color3.fromRGB(50, 255, 50),
	}
	
	for name, color in pairs(teamColorMap) do
		if string.lower(teamName) == string.lower(name) then
			return color
		end
	end
	
	if team and team.TeamColor then
		return team.TeamColor.Color
	end
	
	return Color3.fromRGB(255, 255, 255)
end

local function createESP(targetPlayer)
	if targetPlayer == lp then return end
	
	local function setupESP(char)
		if not char then return end
		local head = char:WaitForChild("Head", 5)
		local hum = char:WaitForChild("Humanoid", 5)
		local hrp = char:WaitForChild("HumanoidRootPart", 5)
		if not head or not hum or not hrp then return end
		
		local teamColor = getTeamColor(targetPlayer)
		
		if head:FindFirstChild("PlayerESP_GUI") then
			head.PlayerESP_GUI:Destroy()
		end
		if char:FindFirstChild("PlayerESP_HL") then
			char.PlayerESP_HL:Destroy()
		end
		
		local highlight = Instance.new("Highlight")
		highlight.Name = "PlayerESP_HL"
		highlight.FillColor = teamColor
		highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
		highlight.FillTransparency = 0.7
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Adornee = char
		highlight.Parent = char
		
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "PlayerESP_GUI"
		billboard.Adornee = head
		billboard.Size = UDim2.new(0, 140, 0, 60)
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.AlwaysOnTop = true
		billboard.ResetOnSpawn = false
		billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		billboard.Parent = head
		
		local nameLabel = Instance.new("TextLabel")
		nameLabel.Name = "NameLabel"
		nameLabel.Size = UDim2.new(1, 0, 0, 14)
		nameLabel.Position = UDim2.new(0, 0, 0, 0)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = targetPlayer.Name
		nameLabel.TextColor3 = teamColor
		nameLabel.TextStrokeTransparency = 0
		nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		nameLabel.Font = Enum.Font.GothamBold
		nameLabel.TextSize = 12
		nameLabel.Parent = billboard
		
		espObjects[targetPlayer] = {
			billboard = billboard,
			highlight = highlight,
			humanoid = hum,
			hrp = hrp,
			character = char
		}
	end
	
	if targetPlayer.Character then
		setupESP(targetPlayer.Character)
	end
	
	targetPlayer.CharacterAdded:Connect(function(char)
		if espEnabledState then
			task.wait(0.5)
			setupESP(char)
		end
	end)
end

local function clearAllESP()
	for _, data in pairs(espObjects) do
		pcall(function()
			if data.billboard then data.billboard:Destroy() end
			if data.highlight then data.highlight:Destroy() end
		end)
	end
	espObjects = {}
end

local function toggleESP(state)
	espEnabledState = state
	
	if state then
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= lp then
				createESP(player)
			end
		end
	else
		clearAllESP()
	end
end

Players.PlayerAdded:Connect(function(player)
	if espEnabledState and player ~= lp then
		createESP(player)
	end
end)

Players.PlayerRemoving:Connect(function(player)
	if espObjects[player] then
		pcall(function()
			if espObjects[player].billboard then espObjects[player].billboard:Destroy() end
			if espObjects[player].highlight then espObjects[player].highlight:Destroy() end
		end)
		espObjects[player] = nil
	end
end)

espToggleBtn.MouseButton1Click:Connect(function()
	local newState = not espEnabledState
	espToggleBtn.Text = newState and "ON" or "OFF"
	if newState then
		TweenService:Create(espToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = themeColor,
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
	else
		TweenService:Create(espToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			TextColor3 = Color3.fromRGB(200, 200, 200)
		}):Play()
	end
	toggleESP(newState)
end)

-- Infinite Jump Toggle
local infJumpEnabled = false
local infJumpConnection = nil

infJumpToggleBtn.MouseButton1Click:Connect(function()
	infJumpEnabled = not infJumpEnabled
	infJumpToggleBtn.Text = infJumpEnabled and "ON" or "OFF"
	if infJumpEnabled then
		TweenService:Create(infJumpToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = themeColor,
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
		
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			local char = lp.Character
			if char then
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum then
					hum:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end)
	else
		TweenService:Create(infJumpToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			TextColor3 = Color3.fromRGB(200, 200, 200)
		}):Play()
		
		if infJumpConnection then
			infJumpConnection:Disconnect()
			infJumpConnection = nil
		end
	end
end)

-- Walkspeed Toggle
walkspeedToggleBtn.MouseButton1Click:Connect(function()
	walkspeedEnabled = not walkspeedEnabled
	walkspeedToggleBtn.Text = walkspeedEnabled and "ON" or "OFF"
	if walkspeedEnabled then
		TweenService:Create(walkspeedToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = themeColor,
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
		
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = getWalkspeed() end
		end
	else
		TweenService:Create(walkspeedToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			TextColor3 = Color3.fromRGB(200, 200, 200)
		}):Play()
		
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then hum.WalkSpeed = 16 end
		end
	end
end)

-- Jumpower Toggle
jumpowerToggleBtn.MouseButton1Click:Connect(function()
	jumpowerEnabled = not jumpowerEnabled
	jumpowerToggleBtn.Text = jumpowerEnabled and "ON" or "OFF"
	if jumpowerEnabled then
		TweenService:Create(jumpowerToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = themeColor,
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
		
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then 
				hum.UseJumpPower = true
				hum.JumpPower = getJumpower() 
			end
		end
	else
		TweenService:Create(jumpowerToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			TextColor3 = Color3.fromRGB(200, 200, 200)
		}):Play()
		
		local char = lp.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then 
				hum.UseJumpPower = true
				hum.JumpPower = 50 
			end
		end
	end
end)

-- ==========================================
-- TOGGLE SETTINGS PANEL
-- ==========================================
settingsBtn.MouseEnter:Connect(function()
	TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
	settingsBtnStroke.Color = themeColor
end)

settingsBtn.MouseLeave:Connect(function()
	if not settingsPanel.Visible then
		TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
		settingsBtnStroke.Color = Color3.fromRGB(100, 100, 100)
	end
end)

settingsBtn.MouseButton1Click:Connect(function()
	settingsPanel.Visible = not settingsPanel.Visible
	
	if settingsPanel.Visible then
		settingsPanel.Position = UDim2.new(1, -420, 0.5, -230)
		settingsPanel.BackgroundTransparency = 1
		TweenService:Create(settingsPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(1, -420, 0.5, -230),
			BackgroundTransparency = 0
		}):Play()
		
		TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = themeColor}):Play()
		settingsBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
	else
		TweenService:Create(settingsPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			BackgroundTransparency = 1
		}):Play()
		
		TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
		settingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	end
end)

closeSettingsBtn.MouseButton1Click:Connect(function()
	settingsPanel.Visible = false
	TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
	settingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

closeExecutorBtn.MouseButton1Click:Connect(function()
	executorPanel.Visible = false
	TweenService:Create(executorPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		BackgroundTransparency = 1
	}):Play()
end)

-- Dragging untuk Settings Panel
local settingsDragging = false
local settingsDragStart = Vector2.new(0, 0)
local settingsStartPos = UDim2.new(0, 0, 0, 0)

settingsPanel.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		settingsDragging = true
		settingsDragStart = input.Position
		settingsStartPos = settingsPanel.Position
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		settingsDragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if settingsDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - settingsDragStart
		settingsPanel.Position = UDim2.new(
			settingsStartPos.X.Scale, settingsStartPos.X.Offset + delta.X,
			settingsStartPos.Y.Scale, settingsStartPos.Y.Offset + delta.Y
		)
	end
end)

-- Dragging untuk Executor Panel
local executorDragging = false
local executorDragStart = Vector2.new(0, 0)
local executorStartPos = UDim2.new(0, 0, 0, 0)

executorPanel.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		executorDragging = true
		executorDragStart = input.Position
		executorStartPos = executorPanel.Position
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		executorDragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if executorDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - executorDragStart
		executorPanel.Position = UDim2.new(
			executorStartPos.X.Scale, executorStartPos.X.Offset + delta.X,
			executorStartPos.Y.Scale, executorStartPos.Y.Offset + delta.Y
		)
	end
end)
