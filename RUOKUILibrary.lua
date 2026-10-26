local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local NAME = "RUOKUILibrary"
local FILE = "RUOKHub_theme.json"
local BLACK, WHITE = Color3.new(0, 0, 0), Color3.new(1, 1, 1)

local Library = {
	Flags = {},
	ToggleKey = Enum.KeyCode.RightShift,
	SpinEnabled = true,
	SpinSpeed = 90,
	Rainbow = false,
	Transparency = 0,
	FontSize = 13,
	ThemeName = "Sky Milk",
	-- สไตล์ปุ่มควบคุมหน้าต่าง: "Dots" | "GlassDots" | "Squares" | "MacGlass" | "Minimal"
	WindowControlStyle = "GlassDots",
}

----------------------------------------------------------------
-- ธีมสำเร็จรูป 30 เฉดสี
----------------------------------------------------------------
local Presets = {
	{ Name = "Sky Milk", Main = Color3.fromRGB(205, 225, 245), Accent = Color3.fromRGB(0, 140, 240), Accent2 = Color3.fromRGB(0, 210, 255) },
	{ Name = "Midnight", Main = Color3.fromRGB(15, 23, 42), Accent = Color3.fromRGB(56, 189, 248), Accent2 = Color3.fromRGB(99, 102, 241) },
	{ Name = "Dark Violet", Main = Color3.fromRGB(28, 30, 38), Accent = Color3.fromRGB(139, 92, 246), Accent2 = Color3.fromRGB(0, 200, 255) },
	{ Name = "Rose", Main = Color3.fromRGB(255, 230, 236), Accent = Color3.fromRGB(244, 63, 94), Accent2 = Color3.fromRGB(251, 146, 60) },
	{ Name = "Mint", Main = Color3.fromRGB(215, 245, 232), Accent = Color3.fromRGB(16, 185, 129), Accent2 = Color3.fromRGB(6, 182, 212) },
	{ Name = "Sunset", Main = Color3.fromRGB(255, 236, 214), Accent = Color3.fromRGB(249, 115, 22), Accent2 = Color3.fromRGB(236, 72, 153) },
	{ Name = "Lavender", Main = Color3.fromRGB(232, 224, 250), Accent = Color3.fromRGB(139, 92, 246), Accent2 = Color3.fromRGB(217, 70, 239) },
	{ Name = "Crimson", Main = Color3.fromRGB(24, 18, 20), Accent = Color3.fromRGB(239, 68, 68), Accent2 = Color3.fromRGB(249, 115, 22) },
	{ Name = "Forest", Main = Color3.fromRGB(20, 32, 26), Accent = Color3.fromRGB(74, 222, 128), Accent2 = Color3.fromRGB(163, 230, 53) },
	{ Name = "Neon", Main = Color3.fromRGB(10, 10, 16), Accent = Color3.fromRGB(0, 255, 170), Accent2 = Color3.fromRGB(255, 0, 200) },
	{ Name = "Gold", Main = Color3.fromRGB(30, 26, 18), Accent = Color3.fromRGB(250, 204, 21), Accent2 = Color3.fromRGB(245, 158, 11) },
	{ Name = "Mono", Main = Color3.fromRGB(240, 240, 240), Accent = Color3.fromRGB(40, 40, 40), Accent2 = Color3.fromRGB(130, 130, 130) },
	{ Name = "Cyberpunk", Main = Color3.fromRGB(18, 18, 28), Accent = Color3.fromRGB(255, 0, 85), Accent2 = Color3.fromRGB(0, 240, 255) },
	{ Name = "Emerald", Main = Color3.fromRGB(12, 28, 20), Accent = Color3.fromRGB(16, 185, 129), Accent2 = Color3.fromRGB(52, 211, 153) },
	{ Name = "Ruby", Main = Color3.fromRGB(32, 12, 16), Accent = Color3.fromRGB(225, 29, 72), Accent2 = Color3.fromRGB(251, 113, 133) },
	{ Name = "Amethyst", Main = Color3.fromRGB(24, 16, 32), Accent = Color3.fromRGB(168, 85, 247), Accent2 = Color3.fromRGB(192, 132, 252) },
	{ Name = "Sunset Glow", Main = Color3.fromRGB(42, 20, 20), Accent = Color3.fromRGB(249, 115, 22), Accent2 = Color3.fromRGB(250, 204, 21) },
	{ Name = "Deep Ocean", Main = Color3.fromRGB(10, 22, 38), Accent = Color3.fromRGB(14, 165, 233), Accent2 = Color3.fromRGB(56, 189, 248) },
	{ Name = "Peach Milk", Main = Color3.fromRGB(255, 240, 230), Accent = Color3.fromRGB(251, 146, 60), Accent2 = Color3.fromRGB(244, 63, 94) },
	{ Name = "Charcoal", Main = Color3.fromRGB(35, 35, 40), Accent = Color3.fromRGB(120, 120, 130), Accent2 = Color3.fromRGB(200, 200, 210) },
	{ Name = "Royal Blue", Main = Color3.fromRGB(15, 20, 45), Accent = Color3.fromRGB(37, 99, 235), Accent2 = Color3.fromRGB(96, 165, 250) },
	{ Name = "Lime Punch", Main = Color3.fromRGB(20, 30, 20), Accent = Color3.fromRGB(132, 204, 22), Accent2 = Color3.fromRGB(74, 222, 128) },
	{ Name = "Sakura", Main = Color3.fromRGB(255, 240, 245), Accent = Color3.fromRGB(255, 105, 180), Accent2 = Color3.fromRGB(255, 182, 193) },
	{ Name = "Nordic", Main = Color3.fromRGB(46, 52, 64), Accent = Color3.fromRGB(136, 192, 208), Accent2 = Color3.fromRGB(129, 161, 193) },
	{ Name = "Dracula", Main = Color3.fromRGB(40, 42, 54), Accent = Color3.fromRGB(255, 121, 198), Accent2 = Color3.fromRGB(189, 147, 249) },
	{ Name = "Matcha", Main = Color3.fromRGB(235, 245, 230), Accent = Color3.fromRGB(100, 160, 90), Accent2 = Color3.fromRGB(160, 210, 140) },
	{ Name = "Coffee", Main = Color3.fromRGB(38, 28, 24), Accent = Color3.fromRGB(180, 130, 90), Accent2 = Color3.fromRGB(220, 180, 140) },
	{ Name = "Aqua", Main = Color3.fromRGB(220, 245, 250), Accent = Color3.fromRGB(0, 180, 210), Accent2 = Color3.fromRGB(100, 220, 240) },
	{ Name = "Grape", Main = Color3.fromRGB(30, 20, 40), Accent = Color3.fromRGB(160, 60, 220), Accent2 = Color3.fromRGB(210, 120, 255) },
	{ Name = "Solar", Main = Color3.fromRGB(25, 25, 20), Accent = Color3.fromRGB(255, 160, 0), Accent2 = Color3.fromRGB(255, 210, 0) },
}
Library.Presets = Presets

local Theme = {}
local bindings = {}
local spinners = {}
local bars = {}
local conns = {}
local themeListeners = {}
local fontLabels = {}

local function lum(c) return 0.299 * c.R + 0.587 * c.G + 0.114 * c.B end

local function buildTheme(main, accent, accent2)
	local light = lum(main) > 0.55
	return {
		Main = main,
		Side = light and main:Lerp(BLACK, 0.07) or main:Lerp(WHITE, 0.05),
		Element = light and main:Lerp(BLACK, 0.12) or main:Lerp(WHITE, 0.09),
		Stroke = light and main:Lerp(BLACK, 0.25) or main:Lerp(WHITE, 0.22),
		Text = light and Color3.fromRGB(30, 45, 65) or Color3.fromRGB(240, 244, 252),
		Sub = light and Color3.fromRGB(85, 105, 128) or Color3.fromRGB(150, 160, 180),
		Accent = accent,
		Accent2 = accent2,
		OnAccent = lum(accent) > 0.62 and Color3.fromRGB(20, 24, 32) or WHITE,
	}
end

local function create(class, props)
	local inst = Instance.new(class)
	local parent
	for k, v in pairs(props) do
		if k == "Parent" then parent = v else inst[k] = v end
	end
	inst.Parent = parent
	return inst
end

local function corner(inst, r)
	return create("UICorner", { CornerRadius = UDim.new(0, r), Parent = inst })
end

local function tween(inst, props, t)
	local tw = TweenService:Create(inst, TweenInfo.new(t or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end

local function safe(fn, ...)
	if type(fn) == "function" then
		local ok, err = pcall(fn, ...)
		if not ok then warn("[RUOK UI] " .. tostring(err)) end
	end
end

local function track(conn)
	conns[#conns + 1] = conn
	return conn
end

local function bind(inst, prop, key)
	bindings[#bindings + 1] = { inst, prop, key }
	inst[prop] = Theme[key]
	return inst
end

local function applyBindings(animate, onlyKey)
	for i = #bindings, 1, -1 do
		local b = bindings[i]
		local inst, prop, key = b[1], b[2], b[3]
		if not inst:IsDescendantOf(game) then
			table.remove(bindings, i)
		elseif not onlyKey or key == onlyKey then
			if animate then
				TweenService:Create(inst, TweenInfo.new(0.3), { [prop] = Theme[key] }):Play()
			else
				inst[prop] = Theme[key]
			end
		end
	end
end

local function ringSequence()
	local base, a, b = Theme.Stroke, Theme.Accent, Theme.Accent2
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, base),
		ColorSequenceKeypoint.new(0.15, a),
		ColorSequenceKeypoint.new(0.25, b),
		ColorSequenceKeypoint.new(0.4, base),
		ColorSequenceKeypoint.new(0.6, base),
		ColorSequenceKeypoint.new(0.65, a),
		ColorSequenceKeypoint.new(0.75, b),
		ColorSequenceKeypoint.new(0.9, base),
		ColorSequenceKeypoint.new(1, base),
	})
end

local function refreshGradients()
	local ring = ringSequence()
	for _, g in ipairs(spinners) do if g.Parent then g.Color = ring end end
	local bar = ColorSequence.new(Theme.Accent, Theme.Accent2)
	for _, g in ipairs(bars) do if g.Parent then g.Color = bar end end
end

local function fireListeners(source)
	for _, fn in ipairs(themeListeners) do pcall(fn, source) end
end

local function setColors(main, a, b, instant, source)
	for k, v in pairs(buildTheme(main, a, b)) do Theme[k] = v end
	applyBindings(not instant)
	refreshGradients()
	fireListeners(source)
end

local function setAccent(a, b)
	Theme.Accent, Theme.Accent2 = a, b
	Theme.OnAccent = lum(a) > 0.62 and Color3.fromRGB(20, 24, 32) or WHITE
	applyBindings(false, "Accent")
	applyBindings(false, "OnAccent")
	refreshGradients()
end

local function textLabel(parent, props, key)
	props.BackgroundTransparency = 1
	props.Parent = parent
	props.Font = props.Font or Enum.Font.GothamMedium
	props.TextSize = props.TextSize or Library.FontSize
	local l = create("TextLabel", props)
	if key then bind(l, "TextColor3", key) end
	table.insert(fontLabels, { inst = l, baseSize = props.TextSize })
	return l
end

local function updateFontSize(delta)
	for _, item in ipairs(fontLabels) do
		if item.inst and item.inst.Parent then
			item.inst.TextSize = math.clamp(item.baseSize + delta, 8, 30)
		end
	end
end

local function isPress(input)
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local function isMove(input)
	return input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
end

local function dragInput(handle, fn, scroller)
	local dragging = false
	track(handle.InputBegan:Connect(function(input)
		if isPress(input) then
			dragging = true
			if scroller then scroller.ScrollingEnabled = false end
			fn(input.Position)
		end
	end))
	track(UIS.InputChanged:Connect(function(input)
		if dragging and isMove(input) then fn(input.Position) end
	end))
	track(UIS.InputEnded:Connect(function(input)
		if dragging and isPress(input) then
			dragging = false
			if scroller then scroller.ScrollingEnabled = true end
		end
	end))
end

local function makeDraggable(handle, target)
	local state = { moved = false }
	local dragging, dragStart, startPos = false, nil, nil
	track(handle.InputBegan:Connect(function(input)
		if isPress(input) then
			dragging, state.moved = true, false
			dragStart, startPos = input.Position, target.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end))
	track(UIS.InputChanged:Connect(function(input)
		if dragging and isMove(input) then
			local d = input.Position - dragStart
			if math.abs(d.X) + math.abs(d.Y) > 4 then state.moved = true end
			target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end))
	return state
end

local function getGuiParent()
	local ok, ui = pcall(function() return gethui and gethui() end)
	if ok and typeof(ui) == "Instance" then return ui end
	local ok2 = pcall(function() return CoreGui.Name end)
	if ok2 then return CoreGui end
	return LocalPlayer:WaitForChild("PlayerGui")
end

local function hexStr(c)
	return string.format("#%02X%02X%02X", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
end

local function c2t(c) return { math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5) } end
local function t2c(t) return Color3.fromRGB(t[1], t[2], t[3]) end

do
	local p = Presets[1]
	for k, v in pairs(buildTheme(p.Main, p.Accent, p.Accent2)) do Theme[k] = v end
end

function Library:SetTheme(name)
	for _, p in ipairs(Presets) do
		if p.Name == name then
			Library.ThemeName = name
			setColors(p.Main, p.Accent, p.Accent2, false)
			return true
		end
	end
	return false
end

function Library:SaveConfig()
	if not writefile then return false end
	return (pcall(function()
		writefile(FILE, HttpService:JSONEncode({
			Main = c2t(Theme.Main), Accent = c2t(Theme.Accent), Accent2 = c2t(Theme.Accent2),
			Transparency = Library.Transparency, Spin = Library.SpinEnabled,
			SpinSpeed = Library.SpinSpeed, Theme = Library.ThemeName,
			FontSize = Library.FontSize,
			WindowControlStyle = Library.WindowControlStyle,
		}))
	end))
end

function Library:LoadConfig()
	if not (isfile and readfile) then return false end
	local ok, data = pcall(function()
		if isfile(FILE) then return HttpService:JSONDecode(readfile(FILE)) end
	end)
	if ok and type(data) == "table" and data.Main and data.Accent and data.Accent2 then
		Library.ThemeName = data.Theme or "Custom"
		Library.Transparency = data.Transparency or 0
		if data.Spin ~= nil then Library.SpinEnabled = data.Spin end
		Library.SpinSpeed = data.SpinSpeed or Library.SpinSpeed
		Library.FontSize = data.FontSize or 13
		if data.WindowControlStyle then Library.WindowControlStyle = data.WindowControlStyle end
		setColors(t2c(data.Main), t2c(data.Accent), t2c(data.Accent2), true)
		return true
	end
	return false
end

function Library:Destroy()
	for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
	table.clear(conns)
	table.clear(bindings)
	table.clear(spinners)
	table.clear(bars)
	table.clear(themeListeners)
	table.clear(fontLabels)
	if Library.Gui then Library.Gui:Destroy() end
	Library.Gui, Library.NotifyHolder, Library.Window = nil, nil, nil
end

local notifyOrder = 0
function Library:Notify(o)
	if not Library.NotifyHolder then return end
	o = o or {}
	local dur = o.Duration or 4
	notifyOrder = notifyOrder + 1
	local n = create("CanvasGroup", {
		Size = UDim2.new(1, 0, 0, 60), BorderSizePixel = 0, GroupTransparency = 1,
		LayoutOrder = notifyOrder, Parent = Library.NotifyHolder,
	})
	bind(n, "BackgroundColor3", "Main")
	corner(n, 8)
	local st = create("UIStroke", { Thickness = 1.6, Parent = n })
	bind(st, "Color", "Accent")
	textLabel(n, { Text = o.Title or "แจ้งเตือน", Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0, 12, 0, 7), Size = UDim2.new(1, -24, 0, 18) }, "Text")
	textLabel(n, { Text = o.Text or "", TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, Position = UDim2.new(0, 12, 0, 26), Size = UDim2.new(1, -24, 0, 28) }, "Sub")
	local prog = create("Frame", { Size = UDim2.new(1, 0, 0, 3), Position = UDim2.new(0, 0, 1, -3), BorderSizePixel = 0, Parent = n })
	bind(prog, "BackgroundColor3", "Accent")
	tween(n, { GroupTransparency = 0 }, 0.25)
	tween(prog, { Size = UDim2.new(0, 0, 0, 3) }, dur)
	task.delay(dur, function()
		if n.Parent then
			tween(n, { GroupTransparency = 1 }, 0.3)
			task.wait(0.32)
			n:Destroy()
		end
	end)
end

local TabMeta = {}
TabMeta.__index = TabMeta

local function nextOrder(tab)
	tab._order = tab._order + 1
	return tab._order
end

local function elementHeight(o) return 38 end

local function newElement(tab, height)
	local f = create("Frame", { Size = UDim2.new(1, 0, 0, height), BorderSizePixel = 0, LayoutOrder = nextOrder(tab), Parent = tab.Page })
	bind(f, "BackgroundColor3", "Element")
	corner(f, 6)
	return f
end

local function makeTitle(f, o, rightPad)
	return textLabel(f, {
		Text = o.Name or "Element", Font = Enum.Font.GothamBold, TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
		Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(1, -(rightPad + 12), 1, 0),
	}, "Text")
end

function TabMeta:AddSection(name)
	local f = create("Frame", { Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, LayoutOrder = nextOrder(self), Parent = self.Page })
	local bar = create("Frame", { Size = UDim2.new(0, 3, 0, 14), Position = UDim2.new(0, 0, 0.5, -7), BorderSizePixel = 0, Parent = f })
	bind(bar, "BackgroundColor3", "Accent")
	corner(bar, 2)
	textLabel(f, { Text = name, Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0, 10, 0, 0), Size = UDim2.new(1, -10, 1, 0) }, "Text")
end

function TabMeta:AddLabel(text)
	local l = textLabel(self.Page, {
		Text = text, TextSize = 12, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2.new(1, 0, 0, 18), LayoutOrder = nextOrder(self),
	}, "Sub")
	local obj = {}
	function obj:Set(t) l.Text = t end
	return obj
end

function TabMeta:AddButton(o)
	local f = newElement(self, elementHeight(o))
	makeTitle(f, o, 36)
	textLabel(f, { Text = "›", Font = Enum.Font.GothamBold, TextSize = 22, Position = UDim2.new(1, -30, 0, 0), Size = UDim2.new(0, 20, 1, 0) }, "Accent")
	local flash = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = f })
	bind(flash, "BackgroundColor3", "Accent")
	corner(flash, 6)
	local b = create("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", Parent = f })
	b.MouseButton1Click:Connect(function()
		flash.BackgroundTransparency = 0.65
		tween(flash, { BackgroundTransparency = 1 }, 0.35)
		safe(o.Callback)
	end)
end

function TabMeta:AddToggle(o)
	-- สวิตช์สไตล์กระจกเรืองแสง (แบบในภาพ Power / glass toggle)
	local state = o.Default == true
	local f = newElement(self, elementHeight(o))
	makeTitle(f, o, 78)

	local trackW, trackH = 56, 28
	local track_ = create("Frame", {
		Size = UDim2.fromOffset(trackW, trackH),
		Position = UDim2.new(1, -(trackW + 12), 0.5, -trackH / 2),
		BorderSizePixel = 0, Parent = f,
	})
	bind(track_, "BackgroundColor3", "Stroke")
	corner(track_, 14)
	local trackStroke = create("UIStroke", { Thickness = 1.8, Transparency = 0.15, Parent = track_ })
	bind(trackStroke, "Color", "Accent")

	local fill = create("Frame", {
		Size = UDim2.fromScale(1, 1), BorderSizePixel = 0, Parent = track_,
		BackgroundTransparency = state and 0.08 or 1,
	})
	bind(fill, "BackgroundColor3", "Accent")
	corner(fill, 14)
	local fillGrad = create("UIGradient", {
		Color = ColorSequence.new(Theme.Accent, Theme.Accent2),
		Rotation = 90, Parent = fill,
	})
	table.insert(bars, fillGrad)

	-- ไอคอน power เล็ก ๆ ด้านซ้าย (มองเห็นเมื่อเปิด)
	local powerIcon = textLabel(track_, {
		Text = "⏻", Font = Enum.Font.GothamBold, TextSize = 14,
		Position = UDim2.fromOffset(6, 0), Size = UDim2.fromOffset(16, trackH),
		TextTransparency = state and 0.15 or 0.75,
	}, "OnAccent")

	local knob = create("Frame", {
		Size = UDim2.fromOffset(22, 22),
		Position = state and UDim2.fromOffset(trackW - 25, 3) or UDim2.fromOffset(3, 3),
		BackgroundColor3 = WHITE, BorderSizePixel = 0, Parent = track_, ZIndex = 2,
	})
	corner(knob, 11)
	local knobStroke = create("UIStroke", { Thickness = 2, Transparency = 0.2, Parent = knob })
	bind(knobStroke, "Color", "Accent")
	-- ไฮไลต์บนลูกบิด
	local knobShine = create("Frame", {
		Size = UDim2.fromOffset(10, 10), Position = UDim2.fromOffset(4, 3),
		BackgroundColor3 = WHITE, BackgroundTransparency = 0.55, BorderSizePixel = 0, Parent = knob,
	})
	corner(knobShine, 5)

	local hit = create("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", Parent = f })
	if o.Flag then Library.Flags[o.Flag] = state end

	local obj = {}
	function obj:Set(v, silent)
		state = v and true or false
		tween(fill, { BackgroundTransparency = state and 0.08 or 1 }, 0.2)
		tween(knob, { Position = state and UDim2.fromOffset(trackW - 25, 3) or UDim2.fromOffset(3, 3) }, 0.2)
		tween(powerIcon, { TextTransparency = state and 0.15 or 0.75 }, 0.2)
		tween(trackStroke, { Transparency = state and 0 or 0.35 }, 0.2)
		if o.Flag then Library.Flags[o.Flag] = state end
		if not silent then safe(o.Callback, state) end
	end
	function obj:Get() return state end
	hit.MouseButton1Click:Connect(function() obj:Set(not state) end)
	return obj
end

function TabMeta:AddSlider(o)
	-- สไลเดอร์สไตล์กระจกเรืองแสง (แบบในภาพ: แท่งกลม + ดาวหัว-ท้าย + ลูกบิดขาวใหญ่)
	local min, max, inc = o.Min or 0, o.Max or 100, o.Increment or 1
	local value = math.clamp(o.Default or min, min, max)
	local f = newElement(self, 58)
	textLabel(f, { Text = o.Name or "Slider", Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0, 12, 0, 6), Size = UDim2.new(0.55, 0, 0, 18) }, "Text")
	local vl = textLabel(f, { TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right, Position = UDim2.new(0.55, 0, 0, 6), Size = UDim2.new(0.45, -12, 0, 18) }, "Accent")

	-- แถบหลักแบบแคปซูลกระจก
	local bar = create("Frame", {
		Position = UDim2.new(0, 12, 0, 32), Size = UDim2.new(1, -24, 0, 18),
		BorderSizePixel = 0, Parent = f,
	})
	bind(bar, "BackgroundColor3", "Stroke")
	corner(bar, 9)
	local barStroke = create("UIStroke", { Thickness = 1.6, Transparency = 0.25, Parent = bar })
	bind(barStroke, "Color", "Accent")

	-- ดาวซ้าย / ขวา
	local starL = textLabel(bar, {
		Text = "✦", Font = Enum.Font.GothamBold, TextSize = 11,
		Position = UDim2.fromOffset(4, 0), Size = UDim2.fromOffset(14, 18),
		TextTransparency = 0.15,
	}, "Accent")
	local starR = textLabel(bar, {
		Text = "✦", Font = Enum.Font.GothamBold, TextSize = 11,
		Position = UDim2.new(1, -18, 0, 0), Size = UDim2.fromOffset(14, 18),
		TextTransparency = 0.15,
	}, "Accent")

	-- ช่องเลื่อนภายใน (เว้นที่ดาว)
	local trackInner = create("Frame", {
		Position = UDim2.fromOffset(20, 5), Size = UDim2.new(1, -40, 0, 8),
		BackgroundTransparency = 1, BorderSizePixel = 0, Parent = bar,
	})
	local fill = create("Frame", { Size = UDim2.new(0, 0, 1, 0), BorderSizePixel = 0, Parent = trackInner })
	bind(fill, "BackgroundColor3", "Accent")
	corner(fill, 4)
	local fillGrad = create("UIGradient", {
		Color = ColorSequence.new(Theme.Accent, Theme.Accent2), Parent = fill,
	})
	table.insert(bars, fillGrad)

	local knob = create("Frame", {
		Size = UDim2.fromOffset(18, 18), BackgroundColor3 = WHITE, BorderSizePixel = 0,
		Parent = trackInner, ZIndex = 3,
	})
	corner(knob, 9)
	local ks = create("UIStroke", { Thickness = 2.2, Transparency = 0.1, Parent = knob })
	bind(ks, "Color", "Accent")
	local knobShine = create("Frame", {
		Size = UDim2.fromOffset(8, 8), Position = UDim2.fromOffset(3, 2),
		BackgroundColor3 = WHITE, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = knob,
	})
	corner(knobShine, 4)

	local hit = create("TextButton", {
		Position = UDim2.new(0, 0, 0, 24), Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1, Text = "", Parent = f,
	})

	local obj = {}
	local function setValue(x, silent)
		x = math.clamp(math.floor((x - min) / inc + 0.5) * inc + min, min, max)
		x = tonumber(string.format("%.4f", x))
		value = x
		local a = (max == min) and 0 or (x - min) / (max - min)
		fill.Size = UDim2.new(a, 0, 1, 0)
		knob.Position = UDim2.new(a, -9, 0.5, -9)
		vl.Text = tostring(x) .. (o.Suffix or "")
		if o.Flag then Library.Flags[o.Flag] = x end
		if not silent then safe(o.Callback, x) end
	end
	function obj:Set(x, silent) setValue(x, silent) end
	function obj:Get() return value end
	setValue(value, true)

	local sliding = false
	track(hit.InputBegan:Connect(function(input)
		if isPress(input) then
			sliding = true
			if self.Page then self.Page.ScrollingEnabled = false end
			local a = math.clamp((input.Position.X - trackInner.AbsolutePosition.X) / math.max(trackInner.AbsoluteSize.X, 1), 0, 1)
			setValue(min + (max - min) * a)
		end
	end))
	track(UIS.InputChanged:Connect(function(input)
		if sliding and isMove(input) then
			local a = math.clamp((input.Position.X - trackInner.AbsolutePosition.X) / math.max(trackInner.AbsoluteSize.X, 1), 0, 1)
			setValue(min + (max - min) * a)
		end
	end))
	track(UIS.InputEnded:Connect(function(input)
		if sliding and isPress(input) then
			sliding = false
			if self.Page then self.Page.ScrollingEnabled = true end
		end
	end))
	return obj
end

function TabMeta:AddDropdown(o)
	local options = o.Options or {}
	local current = o.Default
	local open = false
	local f = newElement(self, 38)
	f.ClipsDescendants = true
	local head = create("TextButton", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, Text = "", Parent = f })
	textLabel(head, { Text = o.Name or "Dropdown", Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0.5, -12, 1, 0) }, "Text")
	local val = textLabel(head, { Text = current ~= nil and tostring(current) or "เลือก...", TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right, TextTruncate = Enum.TextTruncate.AtEnd, Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0.5, -34, 1, 0) }, "Accent")
	local arrow = textLabel(head, { Text = "▼", TextSize = 10, Position = UDim2.new(1, -28, 0, 0), Size = UDim2.fromOffset(20, 38) }, "Sub")
	local list = create("ScrollingFrame", {
		Position = UDim2.fromOffset(8, 44), Size = UDim2.new(1, -16, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = f,
	})
	bind(list, "ScrollBarImageColor3", "Accent")
	create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, Parent = list })

	local entries = {}
	local function listHeight()
		local n = math.min(#options, 5)
		return n * 30 + math.max(n - 1, 0) * 4
	end
	local function resize()
		tween(f, { Size = UDim2.new(1, 0, 0, open and (44 + listHeight() + 8) or 38) }, 0.2)
		tween(list, { Size = UDim2.new(1, -16, 0, listHeight()) }, 0.2)
		tween(arrow, { Rotation = open and 180 or 0 }, 0.2)
	end
	local function paint()
		for _, e in ipairs(entries) do e.btn.TextColor3 = (e.opt == current) and Theme.Accent or Theme.Text end
	end
	table.insert(themeListeners, paint)

	local obj = {}
	local function choose(opt, silent)
		current = opt
		val.Text = tostring(opt)
		paint()
		open = false
		resize()
		if o.Flag then Library.Flags[o.Flag] = opt end
		if not silent then safe(o.Callback, opt) end
	end
	local function rebuild()
		for _, e in ipairs(entries) do e.btn:Destroy() end
		table.clear(entries)
		for i, opt in ipairs(options) do
			local b = create("TextButton", {
				Size = UDim2.new(1, -6, 0, 30), BorderSizePixel = 0, Text = tostring(opt), Font = Enum.Font.GothamMedium,
				TextSize = 12, AutoButtonColor = false, LayoutOrder = i, Parent = list,
			})
			bind(b, "BackgroundColor3", "Side")
			corner(b, 5)
			b.MouseButton1Click:Connect(function() choose(opt) end)
			entries[#entries + 1] = { opt = opt, btn = b }
		end
		paint()
	end
	rebuild()
	head.MouseButton1Click:Connect(function()
		open = not open
		resize()
	end)
	function obj:Set(v, silent) choose(v, silent) end
	function obj:Get() return current end
	function obj:Refresh(newOptions, keep)
		options = newOptions or {}
		if not keep then current = nil val.Text = "เลือก..." end
		rebuild()
		if open then resize() end
	end
	if o.Flag and current ~= nil then Library.Flags[o.Flag] = current end
	return obj
end

function TabMeta:AddTextbox(o)
	local f = newElement(self, elementHeight(o))
	makeTitle(f, o, 180)
	local box = create("TextBox", {
		Size = UDim2.fromOffset(160, 26), Position = UDim2.new(1, -172, 0.5, -13), BorderSizePixel = 0,
		Text = o.Default or "", PlaceholderText = o.Placeholder or "พิมพ์ที่นี่...", ClearTextOnFocus = false,
		Font = Enum.Font.GothamMedium, TextSize = 12, Parent = f,
	})
	bind(box, "BackgroundColor3", "Side")
	bind(box, "TextColor3", "Text")
	bind(box, "PlaceholderColor3", "Sub")
	corner(box, 5)
	box.FocusLost:Connect(function(enter)
		if o.Flag then Library.Flags[o.Flag] = box.Text end
		safe(o.Callback, box.Text, enter)
	end)
	local obj = {}
	function obj:Set(t) box.Text = t end
	function obj:Get() return box.Text end
	return obj
end

function TabMeta:AddKeybind(o)
	-- ปุ่มคีย์สไตล์กระจก (แบบปุ่ม Keyboard / E ในภาพ)
	local key = o.Default or Enum.KeyCode.F
	local listening = false
	local f = newElement(self, elementHeight(o))
	makeTitle(f, o, 118)

	local btn = create("TextButton", {
		Size = UDim2.fromOffset(96, 28), Position = UDim2.new(1, -108, 0.5, -14),
		BorderSizePixel = 0, Font = Enum.Font.GothamBold, TextSize = 13,
		Text = key.Name, AutoButtonColor = false, Parent = f,
	})
	bind(btn, "BackgroundColor3", "Side")
	bind(btn, "TextColor3", "Accent")
	corner(btn, 8)
	local btnStroke = create("UIStroke", { Thickness = 1.6, Transparency = 0.2, Parent = btn })
	bind(btnStroke, "Color", "Accent")
	-- มุมวงเล็บแบบในภาพ (มุมกล้อง)
	local function cornerMark(parent, pos, rot)
		local m = create("Frame", {
			Size = UDim2.fromOffset(8, 8), Position = pos, BackgroundTransparency = 1,
			BorderSizePixel = 0, Parent = parent, Rotation = rot or 0,
		})
		local s = create("UIStroke", { Thickness = 1.4, Transparency = 0.35, Parent = m })
		bind(s, "Color", "Accent")
		corner(m, 2)
		return m
	end
	cornerMark(btn, UDim2.fromOffset(3, 3))
	cornerMark(btn, UDim2.new(1, -11, 0, 3))
	cornerMark(btn, UDim2.fromOffset(3, 17))
	cornerMark(btn, UDim2.new(1, -11, 0, 17))

	btn.MouseButton1Click:Connect(function()
		listening = true
		btn.Text = "..."
	end)
	track(UIS.InputBegan:Connect(function(input, gp)
		if listening then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				listening = false
				if input.KeyCode ~= Enum.KeyCode.Escape then
					key = input.KeyCode
					safe(o.Changed, key)
				end
				btn.Text = key.Name
			end
		elseif not gp and input.KeyCode == key then
			safe(o.Callback, key)
		end
	end))
	local obj = {}
	function obj:Get() return key end
	function obj:Set(k) key = k btn.Text = k.Name end
	return obj
end

function TabMeta:AddColorPicker(o)
	local color = o.Default or Color3.fromRGB(0, 170, 255)
	local h, s, v = color:ToHSV()
	local f = newElement(self, 195)
	f.ClipsDescendants = true
	
	textLabel(f, { Text = o.Name or "Color", Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, -24, 0, 18) }, "Text")

	local sv = create("Frame", { Position = UDim2.fromOffset(12, 34), Size = UDim2.new(1, -64, 0, 110), BorderSizePixel = 0, Parent = f })
	corner(sv, 4)
	local white = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, Parent = sv })
	corner(white, 4)
	create("UIGradient", { Transparency = NumberSequence.new(0, 1), Parent = white })
	local blackF = create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK, BorderSizePixel = 0, Parent = sv })
	corner(blackF, 4)
	create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0), Parent = blackF })
	local cursor = create("Frame", { Size = UDim2.fromOffset(10, 10), BackgroundTransparency = 1, Parent = sv })
	corner(cursor, 5)
	create("UIStroke", { Thickness = 2, Color = WHITE, Parent = cursor })

	local hueBar = create("Frame", { Position = UDim2.new(1, -44, 0, 34), Size = UDim2.fromOffset(22, 110), BackgroundColor3 = WHITE, BorderSizePixel = 0, Parent = f })
	corner(hueBar, 4)
	local kps = {}
	for i = 0, 6 do kps[#kps + 1] = ColorSequenceKeypoint.new(i / 6, Color3.fromHSV((i % 6) / 6, 1, 1)) end
	create("UIGradient", { Rotation = 90, Color = ColorSequence.new(kps), Parent = hueBar })
	local hueMark = create("Frame", { Size = UDim2.new(1, 4, 0, 4), BackgroundColor3 = WHITE, BorderSizePixel = 0, Parent = hueBar })
	create("UIStroke", { Thickness = 1, Color = BLACK, Parent = hueMark })

	local hexBox = create("TextBox", {
		Size = UDim2.new(0.55, 0, 0, 28), Position = UDim2.new(0, 12, 0, 153), BorderSizePixel = 0,
		Text = hexStr(color), PlaceholderText = "#RRGGBB หรือ R,G,B", Font = Enum.Font.GothamMedium, TextSize = 12, Parent = f,
	})
	bind(hexBox, "BackgroundColor3", "Side")
	bind(hexBox, "TextColor3", "Text")
	bind(hexBox, "PlaceholderColor3", "Sub")
	corner(hexBox, 5)

	local saveCodeBtn = create("TextButton", {
		Size = UDim2.new(0.38, 0, 0, 28), Position = UDim2.new(0.58, 4, 0, 153), BorderSizePixel = 0,
		Text = "บันทึกโค้ดสี", Font = Enum.Font.GothamBold, TextSize = 12, AutoButtonColor = false, Parent = f,
	})
	bind(saveCodeBtn, "BackgroundColor3", "Accent")
	bind(saveCodeBtn, "TextColor3", "OnAccent")
	corner(saveCodeBtn, 5)

	local obj = {}
	local function update(silent)
		color = Color3.fromHSV(h, s, v)
		sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
		cursor.Position = UDim2.new(s, -5, 1 - v, -5)
		hueMark.Position = UDim2.new(0, -2, h, -2)
		hexBox.Text = hexStr(color)
		if o.Flag then Library.Flags[o.Flag] = color end
		if not silent then safe(o.Callback, color) end
	end

	function obj:Set(c, silent)
		h, s, v = c:ToHSV()
		update(silent)
	end
	function obj:Get() return color end
	update(true)

	dragInput(sv, function(pos)
		s = math.clamp((pos.X - sv.AbsolutePosition.X) / math.max(sv.AbsoluteSize.X, 1), 0, 1)
		v = 1 - math.clamp((pos.Y - sv.AbsolutePosition.Y) / math.max(sv.AbsoluteSize.Y, 1), 0, 1)
		update()
	end, self.Page)
	
	dragInput(hueBar, function(pos)
		h = math.clamp((pos.Y - hueBar.AbsolutePosition.Y) / math.max(hueBar.AbsoluteSize.Y, 1), 0, 1)
		update()
	end, self.Page)

	hexBox.FocusLost:Connect(function()
		local text = hexBox.Text:gsub("%s+", "")
		local r, g, b = text:match("(%d+),(%d+),(%d+)")
		if r and g and b then
			local newC = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
			h, s, v = newC:ToHSV()
			update()
		elseif text:sub(1,1) == "#" and #text == 7 then
			local hexNum = tonumber(text:sub(2), 16)
			if hexNum then
				local newC = Color3.fromRGB(math.floor(hexNum / 65536), math.floor((hexNum / 256) % 256), hexNum % 256)
				h, s, v = newC:ToHSV()
				update()
			end
		end
	end)

	-- แก้ไขปุ่มบันทึกโค้ดสี ให้ทำการคัดลอกโค้ดสี (Copy to Clipboard) และไม่เด้งแป้นพิมพ์ค้าง
	saveCodeBtn.MouseButton1Click:Connect(function()
		local code = hexBox.Text
		if setclipboard then
			pcall(function() setclipboard(code) end)
		end
		Library:Notify({ Title = "คัดลอกโค้ดสีแล้ว!", Text = "คัดลอก " .. code .. " ลงคลิปบอร์ดสำเร็จ" })
	end)

	return obj
end

-- ตัวอย่างสด (Mini Preview) จำลอง UI จริงย่อส่วน
function TabMeta:AddPreview()
	local f = newElement(self, 140)
	local miniUI = create("Frame", { Position = UDim2.fromOffset(12, 10), Size = UDim2.new(1, -24, 1, -20), BorderSizePixel = 0, ClipsDescendants = true, Parent = f })
	bind(miniUI, "BackgroundColor3", "Main")
	corner(miniUI, 6)
	local miniStroke = create("UIStroke", { Thickness = 1.5, Color = WHITE, Parent = miniUI })
	spinners[#spinners + 1] = create("UIGradient", { Color = ringSequence(), Parent = miniStroke })

	local mSide = create("Frame", { Size = UDim2.new(0, 55, 1, 0), BorderSizePixel = 0, Parent = miniUI })
	bind(mSide, "BackgroundColor3", "Side")
	for i = 1, 3 do
		local r = create("Frame", { Position = UDim2.fromOffset(6, 6 + (i - 1) * 16), Size = UDim2.new(1, -12, 0, 12), BorderSizePixel = 0, Parent = mSide })
		bind(r, "BackgroundColor3", i == 1 and "Accent" or "Element")
		corner(r, 3)
	end

	local mHead = create("Frame", { Position = UDim2.fromOffset(55, 0), Size = UDim2.new(1, -55, 0, 24), BackgroundTransparency = 1, Parent = miniUI })
	textLabel(mHead, { Text = "UI Preview", Font = Enum.Font.GothamBold, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(6, 4), Size = UDim2.new(1, -6, 1, 0) }, "Text")

	local mContent = create("Frame", { Position = UDim2.fromOffset(61, 28), Size = UDim2.new(1, -67, 1, -32), BackgroundTransparency = 1, Parent = miniUI })
	local mBtn = create("Frame", { Size = UDim2.new(1, -6, 0, 18), BorderSizePixel = 0, Parent = mContent })
	bind(mBtn, "BackgroundColor3", "Accent")
	corner(mBtn, 3)
	textLabel(mBtn, { Text = "Sample Element", Font = Enum.Font.GothamBold, TextSize = 8, Size = UDim2.fromScale(1, 1) }, "OnAccent")

	local mTgl = create("Frame", { Position = UDim2.fromOffset(0, 24), Size = UDim2.new(1, -6, 0, 18), BorderSizePixel = 0, Parent = mContent })
	bind(mTgl, "BackgroundColor3", "Element")
	corner(mTgl, 3)
	textLabel(mTgl, { Text = "Toggle Option", Font = Enum.Font.GothamMedium, TextSize = 8, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(4, 0), Size = UDim2.new(1, -4, 1, 0) }, "Text")
end

function TabMeta:AddThemeGallery()
	local holder = create("Frame", { Size = UDim2.new(1, 0, 0, 100), BackgroundTransparency = 1, LayoutOrder = nextOrder(self), Parent = self.Page })
	local grid = create("UIGridLayout", { CellSize = UDim2.fromOffset(142, 74), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder })
	grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		holder.Size = UDim2.new(1, 0, 0, grid.AbsoluteContentSize.Y)
	end)
	local cards = {}
	local obj = {}
	function obj:Refresh()
		for _, c in ipairs(cards) do
			local sel = (c.name == Library.ThemeName)
			c.stroke.Color = sel and Theme.Accent or c.idle
			c.stroke.Thickness = sel and 3 or 1.5
			c.check.Visible = sel
		end
	end
	for i, p in ipairs(Presets) do
		local t = buildTheme(p.Main, p.Accent, p.Accent2)
		local card = create("TextButton", { BackgroundColor3 = p.Main, BorderSizePixel = 0, Text = "", AutoButtonColor = false, LayoutOrder = i, ClipsDescendants = true, Parent = holder })
		corner(card, 8)
		local stroke = create("UIStroke", { Thickness = 1.5, Color = t.Stroke, Parent = card })
		local strip = create("Frame", { Size = UDim2.new(0, 40, 1, 0), BackgroundColor3 = t.Side, BorderSizePixel = 0, Parent = card })
		for k = 0, 2 do
			local r = create("Frame", { Position = UDim2.fromOffset(6, 10 + k * 14), Size = UDim2.new(28, 8), BackgroundColor3 = k == 0 and p.Accent or t.Element, BorderSizePixel = 0, Parent = strip })
			corner(r, 3)
		end
		local top = create("Frame", { Position = UDim2.fromOffset(48, 10), Size = UDim2.new(1, -58, 0, 6), BackgroundColor3 = WHITE, BorderSizePixel = 0, Parent = card })
		corner(top, 3)
		create("UIGradient", { Color = ColorSequence.new(p.Accent, p.Accent2), Parent = top })
		local dot = create("Frame", { Position = UDim2.fromOffset(48, 24), Size = UDim2.fromOffset(38, 12), BackgroundColor3 = p.Accent, BorderSizePixel = 0, Parent = card })
		corner(dot, 4)
		local dot2 = create("Frame", { Position = UDim2.fromOffset(90, 24), Size = UDim2.new(12, 12), BackgroundColor3 = p.Accent2, BorderSizePixel = 0, Parent = card })
		corner(dot2, 6)
		create("TextLabel", { BackgroundTransparency = 1, Text = p.Name, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = t.Text, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(48, 46), Size = UDim2.new(1, -54, 0, 18), Parent = card })
		local check = create("TextLabel", { BackgroundTransparency = 1, Text = "✓", Font = Enum.Font.GothamBold, TextSize = 16, TextColor3 = p.Accent, Position = UDim2.new(1, -24, 0, 2), Size = UDim2.fromOffset(20, 20), Visible = false, Parent = card })
		cards[#cards + 1] = { name = p.Name, stroke = stroke, check = check, idle = t.Stroke }
		card.MouseButton1Click:Connect(function()
			Library.ThemeName = p.Name
			setColors(p.Main, p.Accent, p.Accent2, false)
			obj:Refresh()
		end)
	end
	obj:Refresh()
	table.insert(themeListeners, function() obj:Refresh() end)
	return obj
end

function Library:CreateWindow(cfg)
	cfg = cfg or {}
	Library:Destroy()
	local parent = getGuiParent()
	local old = parent:FindFirstChild(NAME)
	if old then old:Destroy() end
	if cfg.AutoLoad ~= false then Library:LoadConfig() end
	if cfg.WindowControlStyle then Library.WindowControlStyle = cfg.WindowControlStyle end

	local Window = { Tabs = {} }
	local cam = workspace.CurrentCamera
	local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
	local W = math.min(cfg.Size and cfg.Size.X or 720, vp.X - 20)
	local H = math.min(cfg.Size and cfg.Size.Y or 485, vp.Y - 20)
	local sideW = W < 560 and 150 or 210
	local HEAD_H = 60
	local curW = W

	local gui = create("ScreenGui", { Name = NAME, ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999, Parent = parent })
	Library.Gui, Library.Window = gui, Window
	Window.Gui = gui

	local main = create("Frame", {
		Name = "Main", Size = UDim2.fromOffset(W, H), Position = UDim2.new(0.5, -W / 2, 0.5, -H / 2),
		BorderSizePixel = 0, Active = true, ClipsDescendants = true, Parent = gui,
	})
	bind(main, "BackgroundColor3", "Main")
	corner(main, 8)
	local ring = create("UIStroke", { Thickness = 2.5, Color = WHITE, Parent = main })
	spinners[#spinners + 1] = create("UIGradient", { Color = ringSequence(), Parent = ring })

	local side = create("Frame", { Name = "Sidebar", Size = UDim2.new(0, sideW, 1, 0), BorderSizePixel = 0, Parent = main })
	bind(side, "BackgroundColor3", "Side")
	local sideLine = create("Frame", { Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(1, -1, 0, 0), BorderSizePixel = 0, Parent = side })
	bind(sideLine, "BackgroundColor3", "Stroke")

	-- โลโก้ภาพซ้ายบน (Sidebar)
	local logoF = create("Frame", { Size = UDim2.new(1, 0, 0, 64), BackgroundTransparency = 1, Parent = side })
	local logoImg = create("ImageLabel", {
		Size = UDim2.new(0, 160, 0, 50),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit,
		ResampleMode = Enum.ResamplerMode.Default,
		Parent = logoF
	})
	
	task.spawn(function()
		pcall(function()
			local url = "https://raw.githubusercontent.com/USBHub444/USBHub444/refs/heads/main/file_0000000072d08211b878eafb071d0b94.png"
			if writefile and getcustomasset then 
				local fn = "single_image_pure.png"
				if not isfile(fn) then 
					local success, data = pcall(function()
						return game:HttpGet(url)
					end)
					if success and data and #data > 0 then
						writefile(fn, data)
					end
				end
				if isfile(fn) then
					logoImg.Image = getcustomasset(fn)
				end
			else 
				logoImg.Image = "rbxassetid://0"
			end 
		end)
	end)

	local logoLine = create("Frame", { Size = UDim2.new(1, -24, 0, 2), Position = UDim2.fromOffset(12, 64), BorderSizePixel = 0, Parent = side })
	bind(logoLine, "BackgroundColor3", "Stroke")

	local tabList = create("ScrollingFrame", {
		Position = UDim2.fromOffset(0, 70), Size = UDim2.new(1, 0, 1, -136), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = side,
	})
	bind(tabList, "ScrollBarImageColor3", "Accent")
	create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = tabList })
	create("UIPadding", { PaddingTop = UDim.new(0, 4), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), Parent = tabList })

	local pf = create("Frame", { Size = UDim2.new(1, -16, 0, 52), Position = UDim2.new(0, 8, 1, -60), BorderSizePixel = 0, Parent = side })
	bind(pf, "BackgroundColor3", "Element")
	corner(pf, 6)
	local pfs = create("UIStroke", { Thickness = 1.5, Color = WHITE, Parent = pf })
	spinners[#spinners + 1] = create("UIGradient", { Color = ringSequence(), Parent = pfs })
	
	local avatar = create("ImageLabel", { Size = UDim2.fromOffset(36, 36), Position = UDim2.new(0, 8, 0.5, -18), BackgroundTransparency = 1, Parent = pf })
	corner(avatar, 18)
	task.spawn(function()
		local ok, img = pcall(function()
			return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		end)
		if ok and avatar.Parent then avatar.Image = img end
	end)
	textLabel(pf, { Text = LocalPlayer.DisplayName, Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Position = UDim2.fromOffset(52, 8), Size = UDim2.new(1, -58, 0, 18) }, "Text")
	textLabel(pf, { Text = "@" .. LocalPlayer.Name, Font = Enum.Font.Gotham, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Position = UDim2.fromOffset(52, 28), Size = UDim2.new(1, -58, 0, 14) }, "Sub")

	-- Header ฝั่งขวา: ชื่อ ! Clown ขนาด 24 (เปลี่ยนสีตาม Accent ธีม) + r3z by uou ขนาด 14 (สีเทาคงที่) + เส้นคั่นสีเทายาวเกือบถึงขอบ
	local header = create("Frame", { Position = UDim2.fromOffset(sideW, 0), Size = UDim2.new(1, -sideW, 0, HEAD_H), BackgroundTransparency = 1, Parent = main })
	
	-- ชื่อสคริปต์หลัก ! Clown (ขนาด 24 สีเปลี่ยนตาม Accent ธีม)
	local headTitle = create("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(16, 6),
		Size = UDim2.new(1, -100, 0, 26),
		Font = Enum.Font.GothamBold,
		TextSize = 24,
		Text = "! Clown",
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = header
	})
	bind(headTitle, "TextColor3", "Accent")

	-- ข้อความใต้ชื่อ r3z by uou (ขนาด 14 สีเทา Sub คงที่ ไม่เปลี่ยนตามธีม)
	local headSub = create("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(16, 32),
		Size = UDim2.new(1, -100, 0, 18),
		Font = Enum.Font.Gotham,
		TextSize = 14,
		Text = "r3z by uou",
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = header
	})
	bind(headSub, "TextColor3", "Sub")

	-- เส้นคั่นสีเทายาวใต้ข้อความ (เว้นระยะไม่ชนขอบ)
	local subLine = create("Frame", {
		Position = UDim2.new(0, 16, 1, -2),
		Size = UDim2.new(1, -32, 0, 1),
		BorderSizePixel = 0,
		Parent = header
	})
	bind(subLine, "BackgroundColor3", "Stroke")

	makeDraggable(header, main)
	makeDraggable(logoF, main)

	----------------------------------------------------------------
	-- ปุ่มควบคุมหน้าต่าง (หลายสไตล์ตามภาพ)
	-- Library.WindowControlStyle = "Dots" | "GlassDots" | "Squares" | "MacGlass" | "Minimal"
	----------------------------------------------------------------
	local style = Library.WindowControlStyle or "GlassDots"
	local ctrl = create("Frame", {
		Size = UDim2.fromOffset(style == "Squares" and 78 or 72, style == "MacGlass" and 22 or 18),
		Position = UDim2.new(1, style == "Squares" and -90 or -84, 0, style == "MacGlass" and 12 or 14),
		BackgroundTransparency = 1, Parent = header,
	})

	local red, yellow, green

	if style == "MacGlass" then
		-- แคปซูลกระจก + จุดสี (แบบแถวบนซ้ายในภาพ)
		local capsule = create("Frame", {
			Size = UDim2.fromOffset(70, 22), Position = UDim2.fromOffset(0, 0),
			BorderSizePixel = 0, Parent = ctrl,
		})
		bind(capsule, "BackgroundColor3", "Side")
		corner(capsule, 11)
		local capStroke = create("UIStroke", { Thickness = 1.5, Transparency = 0.2, Parent = capsule })
		bind(capStroke, "Color", "Accent")
		create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder, Parent = capsule,
		})
		local function macDot(color, order, symbol)
			local b = create("TextButton", {
				Size = UDim2.fromOffset(14, 14), BackgroundColor3 = color, Text = symbol or "",
				Font = Enum.Font.GothamBold, TextSize = 9, TextColor3 = Color3.fromRGB(40, 40, 40),
				TextTransparency = 0.35, AutoButtonColor = false, LayoutOrder = order, Parent = capsule,
			})
			corner(b, 7)
			return b
		end
		red = macDot(Color3.fromRGB(255, 95, 86), 1, "×")
		yellow = macDot(Color3.fromRGB(255, 189, 46), 2, "–")
		green = macDot(Color3.fromRGB(39, 201, 63), 3, "□")

	elseif style == "Squares" then
		-- ปุ่มสี่เหลี่ยมไอคอน (minimize / maximize / close)
		create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = ctrl,
		})
		local function sqBtn(bg, order, symbol, textColor)
			local b = create("TextButton", {
				Size = UDim2.fromOffset(22, 18), BackgroundColor3 = bg, Text = symbol,
				Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = textColor or WHITE,
				AutoButtonColor = false, LayoutOrder = order, Parent = ctrl,
			})
			corner(b, 5)
			local st = create("UIStroke", { Thickness = 1.2, Transparency = 0.35, Parent = b })
			bind(st, "Color", "Accent")
			return b
		end
		yellow = sqBtn(Color3.fromRGB(50, 60, 80), 1, "–")
		green = sqBtn(Color3.fromRGB(50, 60, 80), 2, "□")
		red = sqBtn(Color3.fromRGB(230, 70, 70), 3, "×")

	elseif style == "Minimal" then
		-- เส้นบาง minimal
		create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = ctrl,
		})
		local function minBtn(order, symbol)
			local b = create("TextButton", {
				Size = UDim2.fromOffset(20, 16), BackgroundTransparency = 1, Text = symbol,
				Font = Enum.Font.GothamBold, TextSize = 13, AutoButtonColor = false,
				LayoutOrder = order, Parent = ctrl,
			})
			bind(b, "TextColor3", "Sub")
			return b
		end
		yellow = minBtn(1, "–")
		green = minBtn(2, "□")
		red = minBtn(3, "×")

	elseif style == "Dots" then
		-- จุดสีธรรมดา (เดิม)
		create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = ctrl,
		})
		local function plainDot(color, order)
			local b = create("TextButton", {
				Size = UDim2.fromOffset(14, 14), BackgroundColor3 = color, Text = "",
				AutoButtonColor = false, LayoutOrder = order, Parent = ctrl,
			})
			corner(b, 7)
			return b
		end
		red = plainDot(Color3.fromRGB(255, 95, 86), 1)
		yellow = plainDot(Color3.fromRGB(255, 189, 46), 2)
		green = plainDot(Color3.fromRGB(39, 201, 63), 3)

	else
		-- GlassDots (ค่าเริ่มต้น): จุดสีในแคปซูลกระจกเรืองแสง
		local capsule = create("Frame", {
			Size = UDim2.fromOffset(68, 20), BorderSizePixel = 0, Parent = ctrl,
		})
		bind(capsule, "BackgroundColor3", "Side")
		corner(capsule, 10)
		local capStroke = create("UIStroke", { Thickness = 1.5, Transparency = 0.15, Parent = capsule })
		bind(capStroke, "Color", "Accent")
		create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 7),
			SortOrder = Enum.SortOrder.LayoutOrder, Parent = capsule,
		})
		local function glassDot(color, order)
			local b = create("TextButton", {
				Size = UDim2.fromOffset(12, 12), BackgroundColor3 = color, Text = "",
				AutoButtonColor = false, LayoutOrder = order, Parent = capsule,
			})
			corner(b, 6)
			local shine = create("Frame", {
				Size = UDim2.fromOffset(5, 5), Position = UDim2.fromOffset(2, 1),
				BackgroundColor3 = WHITE, BackgroundTransparency = 0.55, BorderSizePixel = 0, Parent = b,
			})
			corner(shine, 3)
			return b
		end
		red = glassDot(Color3.fromRGB(255, 95, 86), 1)
		yellow = glassDot(Color3.fromRGB(255, 189, 46), 2)
		green = glassDot(Color3.fromRGB(39, 201, 63), 3)
	end

	red.MouseButton1Click:Connect(function()
		tween(main, { BackgroundTransparency = 1 }, 0.2)
		task.wait(0.2)
		Library:Destroy()
	end)
	local minimized = false
	yellow.MouseButton1Click:Connect(function()
		minimized = not minimized
		tween(main, { Size = UDim2.fromOffset(curW, minimized and HEAD_H or H) }, 0.25)
	end)
	local wide = false
	green.MouseButton1Click:Connect(function()
		wide = not wide
		curW = math.min(W + (wide and 120 or 0), vp.X - 20)
		tween(main, { Size = UDim2.fromOffset(curW, minimized and HEAD_H or H) }, 0.3)
	end)

	local pages = create("Frame", { Position = UDim2.fromOffset(sideW, HEAD_H), Size = UDim2.new(1, -sideW, 1, -HEAD_H), BackgroundTransparency = 1, ClipsDescendants = true, Parent = main })

	local nh = create("Frame", { AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -16, 1, -16), Size = UDim2.new(0, 270, 1, -32), BackgroundTransparency = 1, Parent = gui })
	create("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom, Parent = nh })
	Library.NotifyHolder = nh

	local tabSound
	if cfg.TabSound then tabSound = create("Sound", { SoundId = cfg.TabSound, Volume = 1, Parent = gui }) end

	-- ปุ่มเปิด/ปิด UI ลอย (สไตล์กระจกเรืองแสง)
	if cfg.ToggleButton == true or (cfg.ToggleButton == nil and UIS.TouchEnabled) then
		local fb = create("TextButton", {
			Size = UDim2.fromOffset(48, 48), Position = UDim2.new(0, 14, 0.5, -24),
			BorderSizePixel = 0, Text = "", AutoButtonColor = false, Parent = gui,
		})
		bind(fb, "BackgroundColor3", "Accent")
		corner(fb, 14)
		local fbStroke = create("UIStroke", { Thickness = 2, Transparency = 0.15, Parent = fb })
		bind(fbStroke, "Color", "Accent2")
		-- ไอคอนเมนู 3 เส้น
		for i = 0, 2 do
			local line = create("Frame", {
				Size = UDim2.fromOffset(20, 3),
				Position = UDim2.new(0.5, -10, 0.5, -8 + i * 7),
				BorderSizePixel = 0, Parent = fb,
			})
			bind(line, "BackgroundColor3", "OnAccent")
			corner(line, 2)
		end
		-- ไฮไลต์กระจก
		local shine = create("Frame", {
			Size = UDim2.new(1, -8, 0, 12), Position = UDim2.fromOffset(4, 4),
			BackgroundColor3 = WHITE, BackgroundTransparency = 0.75, BorderSizePixel = 0, Parent = fb,
		})
		corner(shine, 6)
		local st = makeDraggable(fb, fb)
		fb.MouseButton1Click:Connect(function() if not st.moved then main.Visible = not main.Visible end end)
	end

	track(UIS.InputBegan:Connect(function(input, gp)
		if not gp and input.KeyCode == Library.ToggleKey then main.Visible = not main.Visible end
	end))

	track(RunService.Heartbeat:Connect(function(dt)
		if Library.SpinEnabled then
			for _, g in ipairs(spinners) do g.Rotation = (g.Rotation + dt * Library.SpinSpeed) % 360 end
		end
		if Library.Rainbow then
			local hue = (os.clock() * 0.08) % 1
			setAccent(Color3.fromHSV(hue, 0.75, 1), Color3.fromHSV((hue + 0.15) % 1, 0.75, 1))
		end
	end))

	function Window:SetTransparency(x)
		Library.Transparency = x
		main.BackgroundTransparency = x
		side.BackgroundTransparency = x
	end
	function Window:Toggle() main.Visible = not main.Visible end
	function Window:Destroy() Library:Destroy() end

	local function selectTab(t)
		for _, x in ipairs(Window.Tabs) do
			local on = (x == t)
			x.Page.Visible = on
			x.Indicator.Visible = on
			if on then
				x.Button.BackgroundTransparency = 0
				x.Stroke.Transparency = 0
			else
				x.Button.BackgroundTransparency = 0.6
				x.Stroke.Transparency = 1
			end
		end
		if tabSound then pcall(function() tabSound:Play() end) end
	end

	function Window:AddTab(info)
		info = info or {}
		local Tab = setmetatable({ _order = 0, Name = info.Name or "Tab", Sub = info.Sub }, TabMeta)
		local idx = #Window.Tabs + 1

		local btn = create("TextButton", { Size = UDim2.new(1, 0, 0, 42), BorderSizePixel = 0, Text = "", AutoButtonColor = false, BackgroundTransparency = 0.6, LayoutOrder = idx, ClipsDescendants = true, Parent = tabList })
		bind(btn, "BackgroundColor3", "Element")
		corner(btn, 6)
		
		local btnStroke = create("UIStroke", { Thickness = 1.8, Transparency = 1, Parent = btn })
		bind(btnStroke, "Color", "Accent")
		Tab.Stroke = btnStroke

		local ind = create("Frame", { Size = UDim2.new(0, 3, 0, 22), Position = UDim2.new(0, 0, 0.5, -11), BorderSizePixel = 0, Visible = false, Parent = btn })
		bind(ind, "BackgroundColor3", "Accent")
		corner(ind, 2)
		local tx = 12
		if info.Icon then
			create("ImageLabel", { Size = UDim2.fromOffset(24, 24), Position = UDim2.new(0, 10, 0.5, -12), BackgroundTransparency = 1, Image = info.Icon, Parent = btn })
			tx = 42
		end
		textLabel(btn, { Text = Tab.Name, Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(tx, 4), Size = UDim2.new(1, -(tx + 6), 0, 18) }, "Text")
		textLabel(btn, { Text = info.Sub or "", Font = Enum.Font.Gotham, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(tx, 22), Size = UDim2.new(1, -(tx + 6), 0, 14) }, "Sub")

		local page = create("ScrollingFrame", {
			Name = Tab.Name, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3,
			CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false, Parent = pages,
		})
		bind(page, "ScrollBarImageColor3", "Accent")
		create("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = page })
		create("UIPadding", { PaddingTop = UDim.new(0, 12), PaddingBottom = UDim.new(0, 12), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14), Parent = page })

		Tab.Button, Tab.Page, Tab.Indicator = btn, page, ind
		Window.Tabs[idx] = Tab
		btn.MouseButton1Click:Connect(function() selectTab(Tab) end)
		if idx == 1 then selectTab(Tab) end
		return Tab
	end

	function Window:AddSettingsTab(info)
		info = info or {}
		local tab = Window:AddTab({ Name = info.Name or "Settings", Sub = info.Sub or "ปรับแต่ง UI", Icon = info.Icon })

		tab:AddSection("ตัวอย่างสด")
		tab:AddPreview()

		tab:AddSection("ธีมสำเร็จรูป")
		local gallery = tab:AddThemeGallery()

		tab:AddSection("ปรับสีเอง")
		local mainPick, accPick, acc2Pick
		mainPick = tab:AddColorPicker({ Name = "สีพื้นหลัง", Default = Theme.Main, Callback = function(c)
			Library.ThemeName = "Custom"
			setColors(c, Theme.Accent, Theme.Accent2, true, "picker")
			gallery:Refresh()
		end })
		accPick = tab:AddColorPicker({ Name = "สีหลัก", Default = Theme.Accent, Callback = function(c)
			Library.ThemeName = "Custom"
			setAccent(c, Theme.Accent2)
			gallery:Refresh()
		end })
		acc2Pick = tab:AddColorPicker({ Name = "สีรอง", Default = Theme.Accent2, Callback = function(c)
			Library.ThemeName = "Custom"
			setAccent(Theme.Accent, c)
			gallery:Refresh()
		end })
		table.insert(themeListeners, function(source)
			if source ~= "picker" then
				mainPick:Set(Theme.Main, true)
				accPick:Set(Theme.Accent, true)
				acc2Pick:Set(Theme.Accent2, true)
			end
		end)

		tab:AddSection("ปรับแต่ง UI ทั่วไป")
		tab:AddSlider({ Name = "ปรับขนาดตัวอักษร", Min = -3, Max = 5, Default = 0, Suffix = "px", Callback = function(v)
			updateFontSize(v)
		end })
		tab:AddSlider({ Name = "ความโปร่งใสหน้าต่าง", Min = 0, Max = 60, Default = math.floor(Library.Transparency * 100), Suffix = "%", Callback = function(v)
			Window:SetTransparency(v / 100)
		end })
		tab:AddToggle({ Name = "ขอบเรืองแสงหมุน", Default = Library.SpinEnabled, Callback = function(v) Library.SpinEnabled = v end })
		tab:AddSlider({ Name = "ความเร็วขอบหมุน", Min = 10, Max = 300, Default = Library.SpinSpeed, Increment = 5, Callback = function(v) Library.SpinSpeed = v end })
		tab:AddToggle({ Name = "สีรุ้ง", Default = Library.Rainbow, Callback = function(v)
			Library.Rainbow = v
			if not v then
				Library.ThemeName = "Custom"
				gallery:Refresh()
			end
		end })
		tab:AddKeybind({ Name = "ปุ่มเปิดปิด UI", Default = Library.ToggleKey, Changed = function(k) Library.ToggleKey = k end })

		tab:AddSection("ปุ่มควบคุมหน้าต่าง")
		tab:AddLabel("เลือกสไตล์แล้วกดบันทึก → เปิด UI ใหม่เพื่อเห็นผล")
		tab:AddDropdown({
			Name = "สไตล์ปุ่มมุมขวาบน",
			Options = { "GlassDots", "MacGlass", "Squares", "Dots", "Minimal" },
			Default = Library.WindowControlStyle or "GlassDots",
			Callback = function(v)
				Library.WindowControlStyle = v
				Library:Notify({ Title = "สไตล์ปุ่ม", Text = "ตั้งเป็น " .. v .. " — บันทึกแล้วเปิด UI ใหม่", Duration = 3 })
			end,
		})
		tab:AddButton({
			Name = "บันทึกการตั้งค่า",
			Callback = function()
				local ok = Library:SaveConfig()
				Library:Notify({
					Title = ok and "บันทึกแล้ว" or "บันทึกไม่ได้",
					Text = ok and "ธีม + สไตล์ปุ่ม ถูกบันทึกแล้ว" or "executor ไม่รองรับ writefile",
					Duration = 3,
				})
			end,
		})

		return tab
	end

	Window:SetTransparency(Library.Transparency)
	return Window
end

----------------------------------------------------------------
-- ตัวอย่างการรันใช้งาน
----------------------------------------------------------------
local Window = Library:CreateWindow()

Window:AddSettingsTab({ Name = "Settings", Sub = "ปรับแต่ง UI" })

Library:Notify({ Title = "ระบบ", Text = "อัปเดตสวิตช์/สไลเดอร์กระจก + ปุ่มควบคุมหลายสไตล์แล้ว!", Duration = 4 })

return Library