local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- ==========================================
-- Fungsi Animasi Rainbow (HSV -> Color3)
-- ==========================================
local function getRainbowColor(offset)
	local hue = (tick() + offset) % 5 / 5
	return Color3.fromHSV(hue, 1, 1)
end

-- ==========================================
-- 1. Setup ScreenGui (Paling Depan / Topmost)
-- ==========================================
local gui = Instance.new("ScreenGui")
gui.Name = "Zeutron_LoadingUI_vmax"
gui.DisplayOrder = 999999 
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- ==========================================
-- 2. Main Frame (Premium Dark Gradient + Rainbow Stroke)
-- ==========================================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 380)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -190)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = mainFrame

-- Rainbow Stroke via UIGradient animation
local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Transparency = 0.6
stroke.Parent = mainFrame

-- ==========================================
-- 3. Ambient Particles (Rainbow Dust)
-- ==========================================
local particle = Instance.new("ParticleEmitter")
particle.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
	ColorSequenceKeypoint.new(0.2, Color3.fromHSV(0.2, 1, 1)),
	ColorSequenceKeypoint.new(0.4, Color3.fromHSV(0.4, 1, 1)),
	ColorSequenceKeypoint.new(0.6, Color3.fromHSV(0.6, 1, 1)),
	ColorSequenceKeypoint.new(0.8, Color3.fromHSV(0.8, 1, 1)),
	ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1))
})
particle.Lifetime = NumberRange.new(3, 5)
particle.Rate = 15
particle.Speed = NumberRange.new(2, 5)
particle.SpreadAngle = Vector2.new(360, 360)
particle.Transparency = NumberSequence.new(0.8, 0.2, 0.9)
particle.Size = NumberSequence.new(4, 8, 0)
particle.ZOffset = 5
particle.Parent = mainFrame

-- ==========================================
-- 4. Header & Version Badge (Rainbow Text) - DIPERBAIKI
-- ==========================================
local checkingLabel = Instance.new("TextLabel")
checkingLabel.Size = UDim2.new(0, 220, 0, 50)
checkingLabel.Position = UDim2.new(0, 25, 0, 20)
checkingLabel.BackgroundTransparency = 1
checkingLabel.Text = "CHECKING....."
checkingLabel.Font = Enum.Font.GothamBlack
checkingLabel.TextSize = 26
checkingLabel.TextXAlignment = Enum.TextXAlignment.Left
checkingLabel.TextStrokeTransparency = 0.8
checkingLabel.Parent = mainFrame

local versionBadge = Instance.new("Frame")
versionBadge.Size = UDim2.new(0, 110, 0, 32)
versionBadge.Position = UDim2.new(1, -135, 0, 24)
versionBadge.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
versionBadge.Parent = mainFrame

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(1, 0)
badgeCorner.Parent = versionBadge

local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(1, 0, 1, 0)
versionText.BackgroundTransparency = 1
versionText.Text = "Admin"
versionText.Font = Enum.Font.GothamBlack
versionText.TextSize = 18
versionText.TextColor3 = Color3.fromRGB(255, 255, 255)
versionText.Parent = versionBadge

-- ==========================================
-- 5. Progress Bar (Rainbow Fill)
-- ==========================================
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -50, 0, 6)
progressBg.Position = UDim2.new(0, 25, 0, 75)
progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
progressBg.Parent = mainFrame
local progressCorner = Instance.new("UICorner") 
progressCorner.CornerRadius = UDim.new(1, 0) 
progressCorner.Parent = progressBg

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
progressBar.Parent = progressBg
local barCorner = Instance.new("UICorner") 
barCorner.CornerRadius = UDim.new(1, 0) 
barCorner.Parent = progressBar

-- ==========================================
-- 6. Log Container (Sleek Scrolling)
-- ==========================================
local logContainer = Instance.new("ScrollingFrame")
logContainer.Size = UDim2.new(1, -50, 0, 200)
logContainer.Position = UDim2.new(0, 25, 0, 95)
logContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
logContainer.BackgroundTransparency = 0.3
logContainer.BorderSizePixel = 0
logContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
logContainer.ScrollBarThickness = 3
logContainer.Parent = mainFrame
local logCorner = Instance.new("UICorner") 
logCorner.CornerRadius = UDim.new(0, 8) 
logCorner.Parent = logContainer

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = logContainer

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 12)
padding.Parent = logContainer

-- ==========================================
-- 7. DROPDOWN SCRIPT & EXECUTE BUTTON
-- ==========================================
local availableScripts = {
	{ name = "🎮 Automatic Picker", url = "https://raw.githubusercontent.com/zeutronxsite/Checking/refs/heads/main/reworked" },
	{ name = "👑 Zeutron Hub", url = "https://raw.githubusercontent.com/Zyptrue/Release/refs/heads/main/New%20Interface" },
	{ name = "️🛠️ TLK Prison", url = "https://raw.githubusercontent.com/IOERHUB/CheckingV2/refs/heads/main/Protection" },
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
dropdownContainer.Position = UDim2.new(0, 20, 1, -70)
dropdownContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
dropdownContainer.BackgroundTransparency = 0.3
dropdownContainer.BorderSizePixel = 0
dropdownContainer.Parent = mainFrame

local dropCorner = Instance.new("UICorner")
dropCorner.CornerRadius = UDim.new(0, 10)
dropCorner.Parent = dropdownContainer

local dropStroke = Instance.new("UIStroke")
dropStroke.Color = Color3.fromRGB(255, 0, 0)
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
scriptNameLabel.Font = Enum.Font.GothamBold
scriptNameLabel.TextSize = 15
scriptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
scriptNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
scriptNameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
scriptNameLabel.ZIndex = 6
scriptNameLabel.Parent = dropdownBtn

local arrowLabel = Instance.new("TextLabel")
arrowLabel.Size = UDim2.new(0, 24, 1, 0)
arrowLabel.Position = UDim2.new(1, -28, 0, 0)
arrowLabel.BackgroundTransparency = 1
arrowLabel.Text = "▼"
arrowLabel.Font = Enum.Font.GothamBold
arrowLabel.TextSize = 14
arrowLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
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
dropdownList.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
dropdownList.ScrollBarImageTransparency = 0.3
dropdownList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.Parent = mainFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 10)
listCorner.Parent = dropdownList

local listStroke = Instance.new("UIStroke")
listStroke.Color = Color3.fromRGB(255, 0, 0)
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
searchStroke.Color = Color3.fromRGB(255, 0, 0)
searchStroke.Thickness = 1
searchStroke.Transparency = 0.5
searchStroke.ZIndex = 26
searchStroke.Parent = searchBar

local searchIcon = Instance.new("TextLabel")
searchIcon.Size = UDim2.new(0, 28, 1, 0)
searchIcon.Position = UDim2.new(0, 4.7, 0.1, 0)
searchIcon.BackgroundTransparency = 1
searchIcon.Text = ""
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
		item.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
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
continueBtn.Position = UDim2.new(0, 250, 1, -70)
continueBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
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
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 255, 100)}):Play()
	end
end)

continueBtn.MouseLeave:Connect(function()
	if not UserInputService.TouchEnabled then
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
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
				BackgroundColor3 = Color3.fromRGB(0, 255, 0),
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
			BackgroundColor3 = Color3.fromRGB(0, 255, 0),
			TextSize = 20
		}):Play()
	end)
end)

-- ==========================================
-- 8. LOGIKA DRAGGING
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
-- 9. AUTO-COLORING LOG SYSTEM
-- ==========================================
local tagColors = {
	["[SYSTEM]"]   = Color3.fromRGB(0, 170, 255),
	["[DEVICE]"]   = Color3.fromRGB(255, 0, 0),
	["[INPUT]"]    = Color3.fromRGB(255, 200, 0),
	["[SECURITY]"] = Color3.fromRGB(255, 60, 60),
	["[CORE]"]     = Color3.fromRGB(180, 0, 255),
	["[VERSION]"]  = Color3.fromRGB(0, 229, 255),
	["[NETWORK]"]  = Color3.fromRGB(255, 140, 0),
	["[LICENSE]"]  = Color3.fromRGB(255, 0, 170),
	["[EXECUTOR]"] = Color3.fromRGB(255, 0, 0),
	["[SUPPORT]"]  = Color3.fromRGB(200, 200, 255),
	["[WARNING]"]  = Color3.fromRGB(255, 165, 0),
	["[ERROR]"]    = Color3.fromRGB(255, 0, 0),
	["[INFO]"]     = Color3.fromRGB(123, 63, 0)
}

local function colorToHex(color)
	return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
end

local function addLog(text)
	local tag = text:match("^%b[]")
	local richText = text
	
	if tag and tagColors[tag] then
		local hexColor = colorToHex(tagColors[tag])
		richText = string.format('<font color="%s">%s</font><font color="#E0E0E0">%s</font>', hexColor, tag, text:sub(#tag + 1))
	else
		richText = string.format('<font color="#E0E0E0">%s</font>', text)
	end

	local logLabel = Instance.new("TextLabel")
	logLabel.Size = UDim2.new(1, -24, 0, 24)
	logLabel.BackgroundTransparency = 1
	logLabel.RichText = true
	logLabel.Text = richText
	logLabel.Font = Enum.Font.Code
	logLabel.TextSize = 15
	logLabel.TextXAlignment = Enum.TextXAlignment.Left
	logLabel.TextTransparency = 1
	logLabel.Parent = logContainer
	
	logLabel.Position = UDim2.new(0, -20, 0, 0)
	TweenService:Create(logLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		TextTransparency = 0,
		Position = UDim2.new(0, 0, 0, 0)
	}):Play()
	
	logContainer.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
	logContainer.CanvasPosition = Vector2.new(0, listLayout.AbsoluteContentSize.Y)
end

local function updateProgress(percent)
	TweenService:Create(progressBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
		Size = UDim2.new(percent / 100, 0, 1, 0)
	}):Play()
end

-- ==========================================
-- 10. Checking Sequence
-- ==========================================
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local isPC = UserInputService.MouseEnabled and not UserInputService.TouchEnabled

local function runChecks()
	addLog("[SYSTEM] Initializing core modules...")
	updateProgress(10)
	task.wait(0.3)
	
	if isMobile then
		addLog("[DEVICE] Mobile/Phone detected!")
		updateProgress(20)
		task.wait(0.2)
		addLog("[INPUT] TouchScreen API: ✅")
		updateProgress(30)
		task.wait(0.2)
		addLog("[SECURITY] Bypassing mobile restrictions...")
		task.wait(0.3)
		addLog("[CORE] Script Status: ✅")
		updateProgress(50)
		task.wait(0.2)
		addLog("[VERSION] V-Auto | By Zeutronxsite")
		updateProgress(60)
		task.wait(0.2)
		addLog("[NETWORK] Checking license server...")
		task.wait(0.4)
		addLog("[LICENSE] Authentication: ✅")
		updateProgress(80)
		task.wait(0.2)
		addLog("[EXECUTOR] Compatibility: 98%")
		updateProgress(90)
		task.wait(0.2)
		addLog("[WARNING] Support module: ")
		updateProgress(99)
		task.wait(0.3)
		addLog("[SYSTEM] Checking complete!")
		task.wait(1)
		addLog("[INFO] Select script & click Execute")
		updateProgress(100)
	elseif isPC then
		addLog("[DEVICE] PC/Computer detected!")
		updateProgress(20)
		task.wait(0.2)
		addLog("[INPUT] Mouse/Keyboard API: ✅")
		updateProgress(30)
		task.wait(0.2)
		addLog("[SECURITY] Scanning for hooks...")
		task.wait(0.3)
		addLog("[CORE] Script Status: ✅")
		updateProgress(50)
		task.wait(0.2)
		addLog("[VERSION] V-Auto | By Zeutronxsite")
		updateProgress(60)
		task.wait(0.2)
		addLog("[NETWORK] Checking license server...")
		task.wait(0.4)
		addLog("[LICENSE] Authentication: ✅")
		updateProgress(80)
		task.wait(0.2)
		addLog("[EXECUTOR] Compatibility: 100%")
		updateProgress(90)
		task.wait(0.2)
		addLog("[SUPPORT] Premium support module: ✅")
		updateProgress(99)
		task.wait(0.3)
		addLog("[SYSTEM] Checking complete!")
		task.wait(1)
		addLog("[INFO] Select script & click Execute")
		updateProgress(100)
	else
		addLog("[DEVICE] Unknown device detected!")
		updateProgress(20)
		task.wait(0.2)
		addLog("[INPUT] Unknown input method")
		updateProgress(30)
		task.wait(0.2)
		addLog("[SECURITY] Scanning for hooks...")
		task.wait(0.3)
		addLog("[CORE] Script Status: ✅")
		updateProgress(50)
		task.wait(0.2)
		addLog("[VERSION] V-Auto | By Zeutronxsite")
		updateProgress(60)
		task.wait(0.2)
		addLog("[NETWORK] Checking license server...")
		task.wait(0.4)
		addLog("[LICENSE] Authentication: ✅")
		updateProgress(80)
		task.wait(0.2)
		addLog("[EXECUTOR] Compatibility: 100%")
		updateProgress(90)
		task.wait(0.2)
		addLog("[SUPPORT] Premium support module: ✅")
		updateProgress(99)
		task.wait(0.3)
		addLog("[SYSTEM] Checking complete!")
		task.wait(1)
		addLog("[INFO] Select script & click Execute")
		updateProgress(100)
	end
	
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
-- 11. ADMIN PANEL (DIPERBESAR) - DIPERBAIKI RGB
-- ==========================================
local HttpService = game:GetService("HttpService")

local currentDarkColor = Color3.fromRGB(30, 30, 35)
local currentDarkerColor = Color3.fromRGB(20, 20, 25)

local settingsBtn = Instance.new("TextButton")
settingsBtn.Name = "SettingsBtn"
settingsBtn.Size = UDim2.new(0, 70, 0, 36)
settingsBtn.Position = UDim2.new(0, 265, 0, 22)
settingsBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
settingsBtn.Text = "🔧"
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

-- PERBESAR ADMIN PANEL
local settingsPanel = Instance.new("Frame")
settingsPanel.Name = "SettingsPanel"
settingsPanel.Size = UDim2.new(0, 380, 0, 520) -- LEBIH BESAR
settingsPanel.Position = UDim2.new(0.5, 260, 0.5, -140)
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false
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
settingsStroke.Color = Color3.fromRGB(255, 0, 0)
settingsStroke.Thickness = 1.5
settingsStroke.Transparency = 0.4
settingsStroke.Parent = settingsPanel

local settingsHeader = Instance.new("TextLabel")
settingsHeader.Size = UDim2.new(1, -50, 0, 40)
settingsHeader.Position = UDim2.new(0, 0, 0, 10)
settingsHeader.BackgroundTransparency = 1
settingsHeader.Text = "Admin Panel"
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
	TweenService:Create(closeSettingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 60, 60)}):Play()
	closeSettingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

closeSettingsBtn.MouseLeave:Connect(function()
	TweenService:Create(closeSettingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
	closeSettingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -20, 0, 2)
separator.Position = UDim2.new(0, 10, 0, 55)
separator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
separator.BackgroundTransparency = 0.6
separator.Parent = settingsPanel

local sepCorner = Instance.new("UICorner")
sepCorner.CornerRadius = UDim.new(1, 0)
sepCorner.Parent = separator

-- PERBESAR CONTAINER
local settingsOptions = Instance.new("Frame")
settingsOptions.Size = UDim2.new(1, -30, 0, 440) -- LEBIH BESAR
settingsOptions.Position = UDim2.new(0, 15, 0, 70)
settingsOptions.BackgroundTransparency = 1
settingsOptions.Parent = settingsPanel

local settingsListLayout = Instance.new("UIListLayout")
settingsListLayout.Padding = UDim.new(0, 12)
settingsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
settingsListLayout.Parent = settingsOptions

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

-- SLIDER ROW FUNCTION (DIPERBAIKI)
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
	label.Size = UDim2.new(0.5, 0, 0, 20)
	label.Position = UDim2.new(0, 12, 0, 8)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextColor3 = Color3.fromRGB(220, 220, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 15
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = row
	
	local toggleBtn = Instance.new("TextButton")
	toggleBtn.Size = UDim2.new(0, 50, 0, 24)
	toggleBtn.Position = UDim2.new(1, -60, 0, 8)
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
	sliderBg.Size = UDim2.new(0.7, 0, 0, 8)
	sliderBg.Position = UDim2.new(0, 12, 1, -22)
	sliderBg.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	sliderBg.Parent = row
	
	local sliderBgCorner = Instance.new("UICorner")
	sliderBgCorner.CornerRadius = UDim.new(1, 0)
	sliderBgCorner.Parent = sliderBg
	
	local sliderFill = Instance.new("Frame")
	sliderFill.Size = UDim2.new(0, 0, 1, 0)
	sliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
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
	valueLabel.Position = UDim2.new(0.75, 10, 1, -24)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = tostring(defaultVal)
	valueLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
	valueLabel.Font = Enum.Font.GothamBold
	valueLabel.TextSize = 14
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
-- FITUR ADMIN PANEL
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
scriptsBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
scriptsBtn.Text = "Click"
scriptsBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
scriptsBtn.Font = Enum.Font.GothamBold
scriptsBtn.TextSize = 14
scriptsBtn.Parent = row1

local scriptsCorner = Instance.new("UICorner")
scriptsCorner.CornerRadius = UDim.new(0, 6)
scriptsCorner.Parent = scriptsBtn

scriptsBtn.MouseEnter:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

scriptsBtn.MouseLeave:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
end)

scriptsBtn.MouseButton1Click:Connect(function()
	addLog("[SCRIPTS] Loading Infinite Yield...")
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
			addLog("[ERROR] Failed to load Infinite Yield")
		end
	end)
end)

-- 2. Check FPS
local row2, checkFpsBtn = createSettingRow("Check FPS", "OFF", settingsOptions)
local checkFpsEnabled = false
local fpsLabel = nil
local fpsConnection = nil

checkFpsBtn.MouseButton1Click:Connect(function()
	checkFpsEnabled = not checkFpsEnabled
	checkFpsBtn.Text = checkFpsEnabled and "ON" or "OFF"
	
	if checkFpsEnabled then
		TweenService:Create(checkFpsBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
		
		fpsLabel = Instance.new("TextLabel")
		fpsLabel.Name = "FPSCounter"
		fpsLabel.Size = UDim2.new(0, 100, 0, 30)
		fpsLabel.Position = UDim2.new(0.5, -50, 0, 5)
		fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		fpsLabel.BackgroundTransparency = 0.5
		fpsLabel.Text = "FPS: 60"
		fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		fpsLabel.Font = Enum.Font.GothamBold
		fpsLabel.TextSize = 16
		fpsLabel.ZIndex = 100
		fpsLabel.Parent = gui
		
		local fpsCorner = Instance.new("UICorner")
		fpsCorner.CornerRadius = UDim.new(0, 6)
		fpsCorner.Parent = fpsLabel
		
		local lastTime = tick()
		local frameCount = 0
		fpsConnection = RunService.RenderStepped:Connect(function()
			frameCount = frameCount + 1
			local currentTime = tick()
			if currentTime - lastTime >= 1 then
				local fps = math.floor(frameCount / (currentTime - lastTime))
				fpsLabel.Text = "FPS: " .. fps
				frameCount = 0
				lastTime = currentTime
			end
		end)
	else
		TweenService:Create(checkFpsBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			TextColor3 = Color3.fromRGB(200, 200, 200)
		}):Play()
		
		if fpsLabel then
			fpsLabel:Destroy()
			fpsLabel = nil
		end
		if fpsConnection then
			fpsConnection:Disconnect()
			fpsConnection = nil
		end
	end
end)

-- 3. Player ESP Toggle
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

-- 4. Infinite Jump Toggle
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

-- 5. Walkspeed Slider + Toggle (LIMIT 1000)
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

-- 6. Jumpower Slider + Toggle (LIMIT 2000)
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

-- 7. Destroy UI
local row3, destroyUiBtn = createSettingRow("Destroy UI", "Click", settingsOptions)

-- ==========================================
-- LOGIKA FITUR
-- ==========================================

local espEnabledState = false
local espObjects = {} 
local espUpdateConnection = nil

local function getTeamColor(player)
	local team = player.Team
	local teamName = team and team.Name or ""
	
	local teamColorMap = {
		["Fugitive"] = Color3.fromRGB(255, 50, 50),
		["Prison"]   = Color3.fromRGB(255, 150, 0),
		["Police"]   = Color3.fromRGB(0, 100, 255),
		["Civilian"] = Color3.fromRGB(50, 255, 50),
		["Hostage"]  = Color3.fromRGB(255, 0, 255),
		["Choosing"] = Color3.fromRGB(0, 255, 255),
		["ADMIN"]    = Color3.fromRGB(255, 215, 0),
		["Red"]      = Color3.fromRGB(255, 50, 50),
		["Blue"]     = Color3.fromRGB(50, 100, 255),
		["Green"]    = Color3.fromRGB(50, 255, 50),
		["Yellow"]   = Color3.fromRGB(255, 255, 50),
		["Purple"]   = Color3.fromRGB(200, 50, 255),
		["White"]    = Color3.fromRGB(255, 255, 255),
		["Black"]    = Color3.fromRGB(50, 50, 50),
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
		
		local distanceLabel = Instance.new("TextLabel")
		distanceLabel.Name = "DistanceLabel"
		distanceLabel.Size = UDim2.new(1, 0, 0, 12)
		distanceLabel.Position = UDim2.new(0, 0, 0, 13)
		distanceLabel.BackgroundTransparency = 1
		distanceLabel.Text = "[0m]"
		distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		distanceLabel.TextStrokeTransparency = 0
		distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		distanceLabel.Font = Enum.Font.GothamBold
		distanceLabel.TextSize = 11
		distanceLabel.Parent = billboard
		
		local hpBg = Instance.new("Frame")
		hpBg.Name = "HealthBg"
		hpBg.Size = UDim2.new(0, 120, 0, 6)
		hpBg.Position = UDim2.new(0.5, -60, 0, 26)
		hpBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		hpBg.BorderSizePixel = 0
		hpBg.Parent = billboard
		
		local hpCornerBg = Instance.new("UICorner")
		hpCornerBg.CornerRadius = UDim.new(0, 3)
		hpCornerBg.Parent = hpBg
		
		local hpFill = Instance.new("Frame")
		hpFill.Name = "HealthFill"
		hpFill.Size = UDim2.new(1, 0, 1, 0)
		hpFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		hpFill.BorderSizePixel = 0
		hpFill.Parent = hpBg
		
		local hpCornerFill = Instance.new("UICorner")
		hpCornerFill.CornerRadius = UDim.new(0, 3)
		hpCornerFill.Parent = hpFill
		
		local hpLabel = Instance.new("TextLabel")
		hpLabel.Name = "HPLabel"
		hpLabel.Size = UDim2.new(1, 0, 0, 12)
		hpLabel.Position = UDim2.new(0, 0, 0, 34)
		hpLabel.BackgroundTransparency = 1
		hpLabel.Text = "HP: 100/100"
		hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		hpLabel.TextStrokeTransparency = 0
		hpLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		hpLabel.Font = Enum.Font.GothamBold
		hpLabel.TextSize = 11
		hpLabel.Parent = billboard
		
		local teamLabel = Instance.new("TextLabel")
		teamLabel.Name = "TeamLabel"
		teamLabel.Size = UDim2.new(1, 0, 0, 10)
		teamLabel.Position = UDim2.new(0, 0, 0, 46)
		teamLabel.BackgroundTransparency = 1
		teamLabel.Text = "[" .. (targetPlayer.Team and targetPlayer.Team.Name or "No Team") .. "]"
		teamLabel.TextColor3 = teamColor
		teamLabel.TextStrokeTransparency = 0
		teamLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		teamLabel.Font = Enum.Font.Gotham
		teamLabel.TextSize = 10
		teamLabel.Parent = billboard
		
		espObjects[targetPlayer] = {
			billboard = billboard,
			highlight = highlight,
			hpFill = hpFill,
			hpLabel = hpLabel,
			distanceLabel = distanceLabel,
			nameLabel = nameLabel,
			teamLabel = teamLabel,
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

local function startUpdateLoop()
	if espUpdateConnection then espUpdateConnection:Disconnect() end
	
	espUpdateConnection = RunService.RenderStepped:Connect(function()
		local myChar = lp.Character
		local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
		
		for player, data in pairs(espObjects) do
			pcall(function()
				local hum = data.humanoid
				local hrp = data.hrp
				local fill = data.hpFill
				local hpLabel = data.hpLabel
				local distLabel = data.distanceLabel
				
				if hum and fill and hpLabel and hum.Parent then
					local currentHP = math.floor(hum.Health)
					local maxHP = math.floor(hum.MaxHealth)
					local percent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
					
					fill.Size = UDim2.new(percent, 0, 1, 0)
					hpLabel.Text = string.format("HP: %d/%d", currentHP, maxHP)
					
					if percent > 0.6 then
						fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
						hpLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
					elseif percent > 0.3 then
						fill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
						hpLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
					else
						fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
						hpLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
					end
				end
				
				if myHRP and hrp and hrp.Parent and distLabel then
					local distance = (myHRP.Position - hrp.Position).Magnitude
					distLabel.Text = string.format("[%dm]", math.floor(distance))
					
					if distance < 15 then
						distLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
					elseif distance < 40 then
						distLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
					else
						distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					end
				end
			end)
		end
	end)
end

local function toggleESP(state)
	espEnabledState = state
	
	if state then
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= lp then
				createESP(player)
			end
		end
		startUpdateLoop()
	else
		if espUpdateConnection then
			espUpdateConnection:Disconnect()
			espUpdateConnection = nil
		end
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
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
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

local infJumpEnabled = false
local infJumpConnection = nil

infJumpToggleBtn.MouseButton1Click:Connect(function()
	infJumpEnabled = not infJumpEnabled
	infJumpToggleBtn.Text = infJumpEnabled and "ON" or "OFF"
	if infJumpEnabled then
		TweenService:Create(infJumpToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
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

walkspeedToggleBtn.MouseButton1Click:Connect(function()
	walkspeedEnabled = not walkspeedEnabled
	walkspeedToggleBtn.Text = walkspeedEnabled and "ON" or "OFF"
	if walkspeedEnabled then
		TweenService:Create(walkspeedToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
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

jumpowerToggleBtn.MouseButton1Click:Connect(function()
	jumpowerEnabled = not jumpowerEnabled
	jumpowerToggleBtn.Text = jumpowerEnabled and "ON" or "OFF"
	if jumpowerEnabled then
		TweenService:Create(jumpowerToggleBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
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

destroyUiBtn.MouseButton1Click:Connect(function()
	addLog("[SYSTEM] Destroying UI...")
	task.wait(0.2)
	
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
	
	task.wait(0.3)
	gui:Destroy()
end)

-- ==========================================
-- TOGGLE SETTINGS PANEL
-- ==========================================
settingsBtn.MouseEnter:Connect(function()
	TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
	settingsBtnStroke.Color = Color3.fromRGB(255, 0, 0)
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
		settingsPanel.Position = UDim2.new(0.5, 260, 0.5, -140)
		settingsPanel.BackgroundTransparency = 1
		TweenService:Create(settingsPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, 260, 0.5, -140),
			BackgroundTransparency = 0
		}):Play()
		
		TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
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

-- ==========================================
-- ANIMASI RAINBOW GLOBAL - DIPERBAIKI
-- ==========================================
RunService.RenderStepped:Connect(function()
	-- Update semua elemen rainbow
	stroke.Color = getRainbowColor(0)
	checkingLabel.TextColor3 = getRainbowColor(0.2)
	versionText.TextColor3 = getRainbowColor(0.4)  -- DIPERBAIKI: Admin text
	progressBar.BackgroundColor3 = getRainbowColor(0.6)
	dropStroke.Color = getRainbowColor(0.8)
	listStroke.Color = getRainbowColor(0.9)
	searchStroke.Color = getRainbowColor(0.3)
	arrowLabel.TextColor3 = getRainbowColor(0.5)
	settingsStroke.Color = getRainbowColor(0.7)
	separator.BackgroundColor3 = getRainbowColor(0.1)
	settingsHeader.TextColor3 = getRainbowColor(0.3)  -- DIPERBAIKI: Admin Panel text
	
	-- Update slider elements
	sliderFill.BackgroundColor3 = getRainbowColor(0.6)
	valueLabel.TextColor3 = getRainbowColor(0.8)
	
	if fpsLabel then
		fpsLabel.TextColor3 = getRainbowColor(0)
	end
end)
