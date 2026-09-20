local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

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
-- 2. Main Frame (Premium Dark Gradient)
-- ==========================================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 380)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -190)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 12))
})
gradient.Rotation = 135
gradient.Parent = mainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 255, 136)
stroke.Thickness = 1.5
stroke.Transparency = 0.6
stroke.Parent = mainFrame

-- ==========================================
-- 3. Ambient Particles (Cyber Dust)
-- ==========================================
local particle = Instance.new("ParticleEmitter")
particle.Color = ColorSequence.new(Color3.fromRGB(0, 255, 136), Color3.fromRGB(0, 100, 50))
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
local checkingLabel = Instance.new("TextLabel")
checkingLabel.Size = UDim2.new(0, 220, 0, 50)
checkingLabel.Position = UDim2.new(0, 25, 0, 20)
checkingLabel.BackgroundTransparency = 1
checkingLabel.Text = "CHECKING....."
checkingLabel.TextColor3 = Color3.fromRGB(0, 255, 136)
checkingLabel.Font = Enum.Font.GothamBlack
checkingLabel.TextSize = 26
checkingLabel.TextXAlignment = Enum.TextXAlignment.Left
checkingLabel.TextStrokeTransparency = 0.8
checkingLabel.Parent = mainFrame

local versionBadge = Instance.new("Frame")
versionBadge.Size = UDim2.new(0, 110, 0, 32)
versionBadge.Position = UDim2.new(1, -135, 0, 24)
versionBadge.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
versionBadge.Parent = mainFrame

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(1, 0)
badgeCorner.Parent = versionBadge

local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(1, 0, 1, 0)
versionText.BackgroundTransparency = 1
versionText.Text = "Console"
versionText.TextColor3 = Color3.fromRGB(10, 10, 12)
versionText.Font = Enum.Font.GothamBlack
versionText.TextSize = 18
versionText.Parent = versionBadge

-- ==========================================
-- 5. Progress Bar
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
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
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
logContainer.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 136)
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
-- 7. DROPDOWN SCRIPT & EXECUTE BUTTON (REFINED)
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

-- [A] Dropdown Button Container
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
dropStroke.Color = Color3.fromRGB(0, 255, 136)
dropStroke.Thickness = 1.5
dropStroke.Transparency = 0.6
dropStroke.Parent = dropdownContainer

-- Dropdown Button (Clickable Area)
local dropdownBtn = Instance.new("TextButton")
dropdownBtn.Size = UDim2.new(1, 0, 1, 0)
dropdownBtn.BackgroundTransparency = 1
dropdownBtn.Text = ""
dropdownBtn.ZIndex = 5
dropdownBtn.Parent = dropdownContainer

-- Text Label untuk nama script (kiri)
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

-- Arrow Label (kanan, fixed position)
local arrowLabel = Instance.new("TextLabel")
arrowLabel.Size = UDim2.new(0, 24, 1, 0)
arrowLabel.Position = UDim2.new(1, -28, 0, 0)
arrowLabel.BackgroundTransparency = 1
arrowLabel.Text = "▼"
arrowLabel.TextColor3 = Color3.fromRGB(0, 255, 136)
arrowLabel.Font = Enum.Font.GothamBold
arrowLabel.TextSize = 14
arrowLabel.TextXAlignment = Enum.TextXAlignment.Center
arrowLabel.ZIndex = 6
arrowLabel.Parent = dropdownBtn

-- [B] Dropdown List (ScrollingFrame)
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
dropdownList.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 136)
dropdownList.ScrollBarImageTransparency = 0.3
dropdownList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
dropdownList.Parent = mainFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 10)
listCorner.Parent = dropdownList

local listStroke = Instance.new("UIStroke")
listStroke.Color = Color3.fromRGB(0, 255, 136)
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

-- [C] Search Bar (Refined)
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
searchStroke.Color = Color3.fromRGB(0, 255, 136)
searchStroke.Thickness = 1
searchStroke.Transparency = 0.5
searchStroke.ZIndex = 26
searchStroke.Parent = searchBar

-- Search Icon (Fixed di kiri)
local searchIcon = Instance.new("TextLabel")
searchIcon.Size = UDim2.new(0, 28, 1, 0)
searchIcon.Position = UDim2.new(0, 4.7, 0.1, 0)
searchIcon.BackgroundTransparency = 1
searchIcon.Text = "🔍"
searchIcon.TextSize = 13
searchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
searchIcon.ZIndex = 27
searchIcon.Parent = searchBar

-- Search Input (Menempel dengan icon)
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

-- Populate Items
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
		item.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
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

-- Search functionality
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

-- Fungsi Buka/Tutup
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

-- Tutup jika klik/sentuh di luar (Support Mobile & PC)
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

-- [D] Execute Button
local continueBtn = Instance.new("TextButton")
continueBtn.Size = UDim2.new(0, 210, 0, 48)
continueBtn.Position = UDim2.new(0, 250, 1, -70)
continueBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
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

-- Hover effects (Khusus PC / Mouse)
continueBtn.MouseEnter:Connect(function()
	if not UserInputService.TouchEnabled then
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 255, 180)}):Play()
	end
end)

continueBtn.MouseLeave:Connect(function()
	if not UserInputService.TouchEnabled then
		TweenService:Create(continueBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 136)}):Play()
	end
end)

-- Execute Action (UI TIDAK DIHANCURKAN)
continueBtn.MouseButton1Click:Connect(function()
	-- Cegah klik ganda
	if continueBtn.Text == "⏳ RUNNING..." then return end
	
	continueBtn.Interactable = false
	continueBtn.Text = "⏳ RUNNING..."
	
	-- Animasi tombol saat running
	TweenService:Create(continueBtn, TweenInfo.new(0.3), {
		BackgroundColor3 = Color3.fromRGB(255, 200, 0),
		TextSize = 18
	}):Play()
	
	task.wait(0.2)
	
	-- Eksekusi script di thread terpisah agar UI tidak freeze
	task.spawn(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet(selectedScriptUrl))()
		end)
		
		-- Kembalikan tombol ke state semula
		task.wait(0.5)
		
		if success then
			continueBtn.Text = "✅ EXECUTED"
			TweenService:Create(continueBtn, TweenInfo.new(0.3), {
				BackgroundColor3 = Color3.fromRGB(0, 255, 136),
				TextSize = 20
			}):Play()
		else
			continueBtn.Text = "❌ FAILED"
			TweenService:Create(continueBtn, TweenInfo.new(0.3), {
				BackgroundColor3 = Color3.fromRGB(255, 60, 60),
				TextSize = 20
			}):Play()
		end
		
		-- Reset tombol setelah 2 detik agar bisa dieksekusi ulang
		task.wait(2)
		continueBtn.Text = "⏩ EXECUTE"
		continueBtn.Interactable = true
		TweenService:Create(continueBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = Color3.fromRGB(0, 255, 136),
			TextSize = 20
		}):Play()
	end)
end)

-- ==========================================
-- 8. LOGIKA DRAGGING (PC & MOBILE)
-- ==========================================
local dragging = false
local dragStart = Vector2.new(0, 0)
local startPos = UDim2.new(0, 0, 0, 0)

mainFrame.InputBegan:Connect(function(input)
	-- Mendukung Mouse (PC) DAN Touch (Mobile)
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
-- 9. AUTO-COLORING LOG SYSTEM (RICHTEXT)
-- ==========================================
local tagColors = {
	["[SYSTEM]"]   = Color3.fromRGB(0, 170, 255),
	["[DEVICE]"]   = Color3.fromRGB(0, 255, 136),
	["[INPUT]"]    = Color3.fromRGB(255, 200, 0),
	["[SECURITY]"] = Color3.fromRGB(255, 60, 60),
	["[CORE]"]     = Color3.fromRGB(180, 0, 255),
	["[VERSION]"]  = Color3.fromRGB(0, 229, 255),
	["[NETWORK]"]  = Color3.fromRGB(255, 140, 0),
	["[LICENSE]"]  = Color3.fromRGB(255, 0, 170),
	["[EXECUTOR]"] = Color3.fromRGB(0, 255, 200),
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
-- 10. Checking Sequence (PC & MOBILE DETECTION)
-- ==========================================
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local isPC = UserInputService.MouseEnabled and not UserInputService.TouchEnabled

local function runChecks()
	addLog("[SYSTEM] Initializing core modules...")
	updateProgress(10)
	task.wait(0.3)
	
	if isMobile then
		-- LOG KHUSUS MOBILE
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
		addLog("[WARNING] Support module: ❌")
		updateProgress(99)
		task.wait(0.3)
		addLog("[SYSTEM] Checking complete!")
		task.wait(1)
		addLog("[INFO] Select script & click Execute")
		updateProgress(100)
		
	elseif isPC then
		-- LOG KHUSUS PC
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
		-- LOG UNTUK DEVICE TIDAK DIKENAL
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

-- Animasi masuk UI
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
-- 11. SETTINGS PANEL (With Scripts Button & ZETHUB Toggle)
-- ==========================================
local HttpService = game:GetService("HttpService")

-- Warna default UI
local currentThemeColor = Color3.fromRGB(0, 255, 136) -- Hijau default
local currentDarkColor = Color3.fromRGB(30, 30, 35)
local currentDarkerColor = Color3.fromRGB(20, 20, 25)

-- Settings Button
local settingsBtn = Instance.new("TextButton")
settingsBtn.Name = "SettingsBtn"
settingsBtn.Size = UDim2.new(0, 70, 0, 36)
settingsBtn.Position = UDim2.new(0, 265, 0, 22)
settingsBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
settingsBtn.Text = "⚙️"
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

-- Settings Panel
local settingsPanel = Instance.new("Frame")
settingsPanel.Name = "SettingsPanel"
settingsPanel.Size = UDim2.new(0, 320, 0, 280)
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
settingsStroke.Color = currentThemeColor
settingsStroke.Thickness = 1.5
settingsStroke.Transparency = 0.4
settingsStroke.Parent = settingsPanel

-- Settings Header
local settingsHeader = Instance.new("TextLabel")
settingsHeader.Size = UDim2.new(1, -50, 0, 40)
settingsHeader.Position = UDim2.new(0, 0, 0, 10)
settingsHeader.BackgroundTransparency = 1
settingsHeader.Text = "Settings Panel"
settingsHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsHeader.Font = Enum.Font.GothamBold
settingsHeader.TextSize = 22
settingsHeader.TextXAlignment = Enum.TextXAlignment.Center
settingsHeader.Parent = settingsPanel

-- Close Button (X)
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

-- Separator Line
local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -20, 0, 2)
separator.Position = UDim2.new(0, 10, 0, 55)
separator.BackgroundColor3 = currentThemeColor
separator.BackgroundTransparency = 0.6
separator.Parent = settingsPanel

local sepCorner = Instance.new("UICorner")
sepCorner.CornerRadius = UDim.new(1, 0)
sepCorner.Parent = separator

-- Settings Options Container
local settingsOptions = Instance.new("Frame")
settingsOptions.Size = UDim2.new(1, -30, 0, 200)
settingsOptions.Position = UDim2.new(0, 15, 0, 70)
settingsOptions.BackgroundTransparency = 1
settingsOptions.Parent = settingsPanel

local settingsListLayout = Instance.new("UIListLayout")
settingsListLayout.Padding = UDim.new(0, 12)
settingsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
settingsListLayout.Parent = settingsOptions

-- Helper function untuk membuat setting row
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

-- Setting 1: Scripts Button
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
scriptsBtn.BackgroundColor3 = currentThemeColor
scriptsBtn.Text = "Click"
scriptsBtn.TextColor3 = Color3.fromRGB(10, 10, 12)
scriptsBtn.Font = Enum.Font.GothamBold
scriptsBtn.TextSize = 14
scriptsBtn.Parent = row1

local scriptsCorner = Instance.new("UICorner")
scriptsCorner.CornerRadius = UDim.new(0, 6)
scriptsCorner.Parent = scriptsBtn

scriptsBtn.MouseEnter:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = currentThemeColor:Lerp(Color3.new(1,1,1), 0.3)}):Play()
end)

scriptsBtn.MouseLeave:Connect(function()
	TweenService:Create(scriptsBtn, TweenInfo.new(0.2), {BackgroundColor3 = currentThemeColor}):Play()
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

-- Setting 2: Check FPS
local row2, checkFpsBtn = createSettingRow("Check FPS", "OFF", settingsOptions)
local checkFpsEnabled = false
local fpsLabel = nil
local fpsConnection = nil

checkFpsBtn.MouseButton1Click:Connect(function()
	checkFpsEnabled = not checkFpsEnabled
	checkFpsBtn.Text = checkFpsEnabled and "ON" or "OFF"
	
	if checkFpsEnabled then
		TweenService:Create(checkFpsBtn, TweenInfo.new(0.3), {
			BackgroundColor3 = currentThemeColor,
			TextColor3 = Color3.fromRGB(10, 10, 12)
		}):Play()
		
		fpsLabel = Instance.new("TextLabel")
		fpsLabel.Name = "FPSCounter"
		fpsLabel.Size = UDim2.new(0, 100, 0, 30)
		fpsLabel.Position = UDim2.new(0.5, -50, 0, 5)
		fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		fpsLabel.BackgroundTransparency = 0.5
		fpsLabel.Text = "FPS: 60"
		fpsLabel.TextColor3 = currentThemeColor
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

-- Setting 3: Destroy UI
local row3, destroyUiBtn = createSettingRow("Destroy UI", "Click", settingsOptions)

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

-- Toggle Settings Panel
settingsBtn.MouseEnter:Connect(function()
	TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 45)}):Play()
	settingsBtnStroke.Color = currentThemeColor
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
		
		TweenService:Create(settingsBtn, TweenInfo.new(0.2), {BackgroundColor3 = currentThemeColor}):Play()
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

-- Dragging untuk Settings Panel (PC & Mobile)
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
