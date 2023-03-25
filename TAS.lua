-- FPS Unlocker --
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local WindowFocusedFunction = function()
	RunService:Set3dRenderingEnabled(true)
	setfpscap(360)
	return
end

local Initialize = function()
	UserInputService.WindowFocused:Connect(WindowFocusedFunction)
	return
end
Initialize()

_G.CurrentlySavedData = {
		Value = "",
		CompressedState = false
	}
_G.Precision = 100

_G.SAVE_MEMORY = { -- SAVE DATA
    {}, -- 1. Save Slot 1 		-- Compressed
    {}, -- 2. Save Slot 2 		-- Compressed
    {}, -- 3. Save Slot 3 		-- Compressed
    {}, -- 4. Recording Data 	-- Decompressed
    {}, -- 5. Ghost Data 		-- Decompressed
	{}	-- 6. Temp Ghost Data 	-- Decompressed
}

_G.prevKey = nil
_G.curKey = nil
_G.TAS = true

_G.UpdateGhostTAS = false
_G.T_Ghost = false
local T_AutoSet = false
local T_ShouldReplaceRun = false

local time = 1/60 -- 60 FPS

-- Gui to Lua
-- Version: 3.2

-- Instances:

local TASMenu = Instance.new("ScreenGui")
local GUI = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local TextInputs = Instance.new("Folder")
local Title = Instance.new("TextLabel")
local PlaybackSpeed = Instance.new("Folder")
local input = Instance.new("TextBox")
local PlaybackSpeed_2 = Instance.new("TextLabel")
local Title2 = Instance.new("TextLabel")
local RewindSpeed = Instance.new("Folder")
local input_2 = Instance.new("TextBox")
local RewindSpeed_2 = Instance.new("TextLabel")
local FastForwardSpeed = Instance.new("Folder")
local input_3 = Instance.new("TextBox")
local FastForwardSpeed_2 = Instance.new("TextLabel")
local GhostIndicator = Instance.new("TextLabel")
local AutoRecIndicator = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local TextButtons = Instance.new("Folder")
local Clear = Instance.new("TextButton")
local Settings = Instance.new("TextButton")
local TASMenu_2 = Instance.new("TextButton")
local GhostMenu = Instance.new("TextButton")
local SettingsFrame = Instance.new("Frame")
local TextInputs_2 = Instance.new("Folder")
local ClearKeybind = Instance.new("Folder")
local ClearBut = Instance.new("TextButton")
local ClearText = Instance.new("TextLabel")
local FastForwardKeybind = Instance.new("Folder")
local FastForwardText = Instance.new("TextLabel")
local FastForwardBut = Instance.new("TextButton")
local RewindKeybind = Instance.new("Folder")
local RewindText = Instance.new("TextLabel")
local RewindBut = Instance.new("TextButton")
local ManRecKeybind = Instance.new("Folder")
local ManRecBut = Instance.new("TextButton")
local ManRecText = Instance.new("TextLabel")
local PlaybackKeybind = Instance.new("Folder")
local PlaybackText = Instance.new("TextLabel")
local PlaybackBut = Instance.new("TextButton")
local AutoRecKeybind = Instance.new("Folder")
local AutoRecBut = Instance.new("TextButton")
local AutoRecText = Instance.new("TextLabel")
local PauseKeybind = Instance.new("Folder")
local PauseBut = Instance.new("TextButton")
local PauseText = Instance.new("TextLabel")
local SkipForwardFrame = Instance.new("Folder")
local SkipForwardBut = Instance.new("TextButton")
local SkipForwardText = Instance.new("TextLabel")
local SkipBackFrame = Instance.new("Folder")
local SkipBackBut = Instance.new("TextButton")
local SkipBackText = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Open = Instance.new("TextButton")
local CurAction = Instance.new("TextLabel")
local TASFrame = Instance.new("Frame")
local SaveSlots = Instance.new("Folder")
local Buttons = Instance.new("Folder")
local Save2 = Instance.new("TextButton")
local Save1 = Instance.new("TextButton")
local Save3 = Instance.new("TextButton")
local LoadTo = Instance.new("TextButton")
local SaveTo = Instance.new("TextButton")
local AddBox = Instance.new("TextButton")
local RemoveBox = Instance.new("TextButton")
local Terminal = Instance.new("TextButton")
local ClearSlot = Instance.new("TextButton")
local Text = Instance.new("Folder")
local ScrollingFrame1 = Instance.new("ScrollingFrame")
local TextBox1 = Instance.new("TextBox")
local TextBox2 = Instance.new("TextBox")
local TextBox3 = Instance.new("TextBox")
local TextBox4 = Instance.new("TextBox")
local TextBox5 = Instance.new("TextBox")
local ScrollingFrame2 = Instance.new("ScrollingFrame")
local TextBox1_2 = Instance.new("TextBox")
local TextBox2_2 = Instance.new("TextBox")
local TextBox3_2 = Instance.new("TextBox")
local TextBox4_2 = Instance.new("TextBox")
local TextBox5_2 = Instance.new("TextBox")
local ScrollingFrame3 = Instance.new("ScrollingFrame")
local TextBox1_3 = Instance.new("TextBox")
local TextBox2_3 = Instance.new("TextBox")
local TextBox3_3 = Instance.new("TextBox")
local TextBox4_3 = Instance.new("TextBox")
local TextBox5_3 = Instance.new("TextBox")
local Boxes = Instance.new("TextLabel")
local GhostFrame = Instance.new("Frame")
local ToggleGhost = Instance.new("TextButton")
local SaveData = Instance.new("Folder")
local RecMem = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local Save1_2 = Instance.new("TextButton")
local Save2_2 = Instance.new("TextButton")
local Save3_2 = Instance.new("TextButton")
local Transparency = Instance.new("Folder")
local input_4 = Instance.new("TextBox")
local Transparency_2 = Instance.new("TextLabel")
local Terminal_2 = Instance.new("TextButton")
local Info_2 = Instance.new("TextLabel")
local Info_3 = Instance.new("TextLabel")
local AutoSet = Instance.new("TextButton")
local KeyCodeSelector = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextButtons_2 = Instance.new("Folder")
local Mid1 = Instance.new("TextButton")
local Mid2 = Instance.new("TextButton")
local Mid3 = Instance.new("TextButton")
local Mid4 = Instance.new("TextButton")
local Mid5 = Instance.new("TextButton")
local Mid6 = Instance.new("TextButton")
local Mid7 = Instance.new("TextButton")
local Mid8 = Instance.new("TextButton")
local Mid9 = Instance.new("TextButton")
local Close = Instance.new("TextButton")

--Properties:

TASMenu.Name = "TASMenu"
TASMenu.Parent = game.CoreGui

GUI.Name = "GUI"
GUI.Parent = TASMenu
GUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUI.BackgroundTransparency = 1.000
GUI.BorderSizePixel = 0
GUI.Position = UDim2.new(0.349999994, 0, 0.200000003, 0)
GUI.Size = UDim2.new(0, 700, 0, 350)
GUI.Active = true
GUI.Draggable = true

MainFrame.Name = "MainFrame"
MainFrame.Parent = GUI
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 126)
MainFrame.BackgroundTransparency = 0.500
MainFrame.BorderColor3 = Color3.fromRGB(255, 66, 49)
MainFrame.BorderSizePixel = 5
MainFrame.Position = UDim2.new(0, 350, 0, 175)
MainFrame.Size = UDim2.new(0, 700, 0, 350)

TextInputs.Name = "TextInputs"
TextInputs.Parent = MainFrame

Title.Name = "Title"
Title.Parent = TextInputs
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 155, 0, 25)
Title.Size = UDim2.new(0, 505, 0, 50)
Title.Font = Enum.Font.Bangers
Title.Text = "Ball And Axe TAS Tool"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 68.000

PlaybackSpeed.Name = "PlaybackSpeed"
PlaybackSpeed.Parent = TextInputs

input.Name = "input"
input.Parent = PlaybackSpeed
input.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
input.BorderSizePixel = 2
input.Position = UDim2.new(0, 193, 0, 121)
input.Size = UDim2.new(0, 129, 0, 38)
input.Font = Enum.Font.LuckiestGuy
input.PlaceholderColor3 = Color3.fromRGB(98, 0, 0)
input.PlaceholderText = "100"
input.Text = ""
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.TextSize = 14.000

PlaybackSpeed_2.Name = "PlaybackSpeed"
PlaybackSpeed_2.Parent = PlaybackSpeed
PlaybackSpeed_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
PlaybackSpeed_2.BorderSizePixel = 2
PlaybackSpeed_2.Position = UDim2.new(0, 24, 0, 121)
PlaybackSpeed_2.Size = UDim2.new(0, 157, 0, 38)
PlaybackSpeed_2.Font = Enum.Font.LuckiestGuy
PlaybackSpeed_2.Text = "Playback speed (%):"
PlaybackSpeed_2.TextColor3 = Color3.fromRGB(0, 0, 0)
PlaybackSpeed_2.TextSize = 14.000
PlaybackSpeed_2.TextWrapped = true

Title2.Name = "Title2"
Title2.Parent = TextInputs
Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title2.BackgroundTransparency = 1.000
Title2.BorderSizePixel = 0
Title2.Position = UDim2.new(0, 139, 0, 66)
Title2.Size = UDim2.new(0, 237, 0, 39)
Title2.Font = Enum.Font.Bangers
Title2.Text = "By MEE5 and ManlyTorch"
Title2.TextColor3 = Color3.fromRGB(0, 0, 0)
Title2.TextSize = 23.000
Title2.TextWrapped = true

RewindSpeed.Name = "RewindSpeed"
RewindSpeed.Parent = TextInputs

input_2.Name = "input"
input_2.Parent = RewindSpeed
input_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
input_2.BorderSizePixel = 2
input_2.Position = UDim2.new(0, 193, 0, 172)
input_2.Size = UDim2.new(0, 129, 0, 38)
input_2.Font = Enum.Font.LuckiestGuy
input_2.PlaceholderColor3 = Color3.fromRGB(98, 0, 0)
input_2.PlaceholderText = "100"
input_2.Text = ""
input_2.TextColor3 = Color3.fromRGB(0, 0, 0)
input_2.TextSize = 14.000

RewindSpeed_2.Name = "RewindSpeed"
RewindSpeed_2.Parent = RewindSpeed
RewindSpeed_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
RewindSpeed_2.BorderSizePixel = 2
RewindSpeed_2.Position = UDim2.new(0, 24, 0, 172)
RewindSpeed_2.Size = UDim2.new(0, 157, 0, 38)
RewindSpeed_2.Font = Enum.Font.LuckiestGuy
RewindSpeed_2.Text = "Rewind speed (%):"
RewindSpeed_2.TextColor3 = Color3.fromRGB(0, 0, 0)
RewindSpeed_2.TextSize = 14.000
RewindSpeed_2.TextWrapped = true

FastForwardSpeed.Name = "FastForwardSpeed"
FastForwardSpeed.Parent = TextInputs

input_3.Name = "input"
input_3.Parent = FastForwardSpeed
input_3.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
input_3.BorderSizePixel = 2
input_3.Position = UDim2.new(0, 193, 0, 224)
input_3.Size = UDim2.new(0, 129, 0, 38)
input_3.Font = Enum.Font.LuckiestGuy
input_3.PlaceholderColor3 = Color3.fromRGB(98, 0, 0)
input_3.PlaceholderText = "100"
input_3.Text = ""
input_3.TextColor3 = Color3.fromRGB(0, 0, 0)
input_3.TextSize = 14.000

FastForwardSpeed_2.Name = "FastForwardSpeed"
FastForwardSpeed_2.Parent = FastForwardSpeed
FastForwardSpeed_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
FastForwardSpeed_2.BorderSizePixel = 2
FastForwardSpeed_2.Position = UDim2.new(0, 24, 0, 224)
FastForwardSpeed_2.Size = UDim2.new(0, 157, 0, 38)
FastForwardSpeed_2.Font = Enum.Font.LuckiestGuy
FastForwardSpeed_2.Text = "FastFOrward      speed (%):"
FastForwardSpeed_2.TextColor3 = Color3.fromRGB(0, 0, 0)
FastForwardSpeed_2.TextSize = 14.000
FastForwardSpeed_2.TextWrapped = true

GhostIndicator.Name = "GhostIndicator"
GhostIndicator.Parent = TextInputs
GhostIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GhostIndicator.BackgroundTransparency = 1.000
GhostIndicator.BorderSizePixel = 0
GhostIndicator.Position = UDim2.new(0, 519, 0, 212)
GhostIndicator.Size = UDim2.new(0, 146, 0, 39)
GhostIndicator.Font = Enum.Font.Bangers
GhostIndicator.Text = "Ghost : off"
GhostIndicator.TextColor3 = Color3.fromRGB(0, 0, 0)
GhostIndicator.TextSize = 23.000
GhostIndicator.TextWrapped = true

AutoRecIndicator.Name = "AutoRecIndicator"
AutoRecIndicator.Parent = TextInputs
AutoRecIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoRecIndicator.BackgroundTransparency = 1.000
AutoRecIndicator.BorderSizePixel = 0
AutoRecIndicator.Position = UDim2.new(0, 350, 0, 212)
AutoRecIndicator.Size = UDim2.new(0, 146, 0, 39)
AutoRecIndicator.Font = Enum.Font.Bangers
AutoRecIndicator.Text = "Auto Record: Off"
AutoRecIndicator.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoRecIndicator.TextSize = 23.000
AutoRecIndicator.TextWrapped = true

Info.Name = "Info"
Info.Parent = TextInputs
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.BorderSizePixel = 0
Info.Position = UDim2.new(0, 384, 0, 121)
Info.Size = UDim2.new(0, 237, 0, 39)
Info.Font = Enum.Font.Bangers
Info.Text = "Current Action:"
Info.TextColor3 = Color3.fromRGB(0, 0, 0)
Info.TextSize = 41.000
Info.TextWrapped = true

TextButtons.Name = "TextButtons"
TextButtons.Parent = MainFrame

Clear.Name = "Clear"
Clear.Parent = TextButtons
Clear.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Clear.BorderSizePixel = 2
Clear.Position = UDim2.new(0, 24, 0, 277)
Clear.Size = UDim2.new(0, 150, 0, 50)
Clear.Font = Enum.Font.LuckiestGuy
Clear.Text = "Clear Recording"
Clear.TextColor3 = Color3.fromRGB(0, 0, 0)
Clear.TextSize = 22.000
Clear.TextWrapped = true

Settings.Name = "Settings"
Settings.Parent = TextButtons
Settings.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Settings.BorderSizePixel = 2
Settings.Position = UDim2.new(0, 351, 0, 277)
Settings.Size = UDim2.new(0, 150, 0, 50)
Settings.Font = Enum.Font.LuckiestGuy
Settings.Text = "Keybinds"
Settings.TextColor3 = Color3.fromRGB(0, 0, 0)
Settings.TextSize = 30.000

TASMenu_2.Name = "TASMenu"
TASMenu_2.Parent = TextButtons
TASMenu_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
TASMenu_2.BorderSizePixel = 2
TASMenu_2.Position = UDim2.new(0, 188, 0, 277)
TASMenu_2.Size = UDim2.new(0, 150, 0, 50)
TASMenu_2.Font = Enum.Font.LuckiestGuy
TASMenu_2.Text = "Save Menu"
TASMenu_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TASMenu_2.TextScaled = true
TASMenu_2.TextSize = 30.000
TASMenu_2.TextWrapped = true

GhostMenu.Name = "GhostMenu"
GhostMenu.Parent = TextButtons
GhostMenu.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
GhostMenu.BorderSizePixel = 2
GhostMenu.Position = UDim2.new(0, 515, 0, 277)
GhostMenu.Size = UDim2.new(0, 150, 0, 50)
GhostMenu.Font = Enum.Font.LuckiestGuy
GhostMenu.Text = "Ghost"
GhostMenu.TextColor3 = Color3.fromRGB(0, 0, 0)
GhostMenu.TextSize = 30.000

SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Parent = GUI
SettingsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 126)
SettingsFrame.BackgroundTransparency = 0.500
SettingsFrame.BorderColor3 = Color3.fromRGB(255, 66, 49)
SettingsFrame.BorderSizePixel = 5
SettingsFrame.Position = UDim2.new(0, 350, 0, 465)
SettingsFrame.Size = UDim2.new(0, 700, 0, 200)
SettingsFrame.Visible = false

TextInputs_2.Name = "TextInputs"
TextInputs_2.Parent = SettingsFrame

ClearKeybind.Name = "ClearKeybind"
ClearKeybind.Parent = TextInputs_2

ClearBut.Name = "ClearBut"
ClearBut.Parent = ClearKeybind
ClearBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ClearBut.BorderSizePixel = 2
ClearBut.Position = UDim2.new(0, 596, 0, 136)
ClearBut.Size = UDim2.new(0, 75, 0, 38)
ClearBut.Font = Enum.Font.LuckiestGuy
ClearBut.Text = "C"
ClearBut.TextColor3 = Color3.fromRGB(0, 0, 0)
ClearBut.TextSize = 14.000
ClearBut.TextWrapped = true

ClearText.Name = "ClearText"
ClearText.Parent = ClearKeybind
ClearText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ClearText.BorderSizePixel = 2
ClearText.Position = UDim2.new(0, 481, 0, 136)
ClearText.Size = UDim2.new(0, 100, 0, 38)
ClearText.Font = Enum.Font.LuckiestGuy
ClearText.Text = "Clear Recording Keybind:"
ClearText.TextColor3 = Color3.fromRGB(0, 0, 0)
ClearText.TextScaled = true
ClearText.TextSize = 14.000
ClearText.TextWrapped = true

FastForwardKeybind.Name = "FastForwardKeybind"
FastForwardKeybind.Parent = TextInputs_2

FastForwardText.Name = "FastForwardText"
FastForwardText.Parent = FastForwardKeybind
FastForwardText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
FastForwardText.BorderSizePixel = 2
FastForwardText.Position = UDim2.new(0, 19, 0, 136)
FastForwardText.Size = UDim2.new(0, 100, 0, 38)
FastForwardText.Font = Enum.Font.LuckiestGuy
FastForwardText.Text = "Fast Forward Keybind:"
FastForwardText.TextColor3 = Color3.fromRGB(0, 0, 0)
FastForwardText.TextSize = 14.000
FastForwardText.TextWrapped = true

FastForwardBut.Name = "FastForwardBut"
FastForwardBut.Parent = FastForwardKeybind
FastForwardBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
FastForwardBut.BorderSizePixel = 2
FastForwardBut.Position = UDim2.new(0, 133, 0, 136)
FastForwardBut.Size = UDim2.new(0, 75, 0, 38)
FastForwardBut.Font = Enum.Font.LuckiestGuy
FastForwardBut.Text = "E"
FastForwardBut.TextColor3 = Color3.fromRGB(0, 0, 0)
FastForwardBut.TextSize = 14.000
FastForwardBut.TextWrapped = true

RewindKeybind.Name = "RewindKeybind"
RewindKeybind.Parent = TextInputs_2

RewindText.Name = "RewindText"
RewindText.Parent = RewindKeybind
RewindText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
RewindText.BorderSizePixel = 2
RewindText.Position = UDim2.new(0, 19, 0, 76)
RewindText.Size = UDim2.new(0, 100, 0, 38)
RewindText.Font = Enum.Font.LuckiestGuy
RewindText.Text = "Rewind Keybind:"
RewindText.TextColor3 = Color3.fromRGB(0, 0, 0)
RewindText.TextSize = 14.000
RewindText.TextWrapped = true

RewindBut.Name = "RewindBut"
RewindBut.Parent = RewindKeybind
RewindBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
RewindBut.BorderSizePixel = 2
RewindBut.Position = UDim2.new(0, 133, 0, 76)
RewindBut.Size = UDim2.new(0, 75, 0, 38)
RewindBut.Font = Enum.Font.LuckiestGuy
RewindBut.Text = "Q"
RewindBut.TextColor3 = Color3.fromRGB(0, 0, 0)
RewindBut.TextSize = 14.000
RewindBut.TextWrapped = true

ManRecKeybind.Name = "ManRecKeybind"
ManRecKeybind.Parent = TextInputs_2

ManRecBut.Name = "ManRecBut"
ManRecBut.Parent = ManRecKeybind
ManRecBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ManRecBut.BorderSizePixel = 2
ManRecBut.Position = UDim2.new(0, 596, 0, 76)
ManRecBut.Size = UDim2.new(0, 75, 0, 38)
ManRecBut.Font = Enum.Font.LuckiestGuy
ManRecBut.Text = "T"
ManRecBut.TextColor3 = Color3.fromRGB(0, 0, 0)
ManRecBut.TextSize = 14.000
ManRecBut.TextWrapped = true

ManRecText.Name = "ManRecText"
ManRecText.Parent = ManRecKeybind
ManRecText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ManRecText.BorderSizePixel = 2
ManRecText.Position = UDim2.new(0, 481, 0, 76)
ManRecText.Size = UDim2.new(0, 100, 0, 38)
ManRecText.Font = Enum.Font.LuckiestGuy
ManRecText.Text = "Manual Record Keybind:"
ManRecText.TextColor3 = Color3.fromRGB(0, 0, 0)
ManRecText.TextScaled = true
ManRecText.TextSize = 14.000
ManRecText.TextWrapped = true

PlaybackKeybind.Name = "PlaybackKeybind"
PlaybackKeybind.Parent = TextInputs_2

PlaybackText.Name = "PlaybackText"
PlaybackText.Parent = PlaybackKeybind
PlaybackText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
PlaybackText.BorderSizePixel = 2
PlaybackText.Position = UDim2.new(0, 19, 0, 16)
PlaybackText.Size = UDim2.new(0, 100, 0, 38)
PlaybackText.Font = Enum.Font.LuckiestGuy
PlaybackText.Text = "Playback Keybind:"
PlaybackText.TextColor3 = Color3.fromRGB(0, 0, 0)
PlaybackText.TextSize = 14.000
PlaybackText.TextWrapped = true

PlaybackBut.Name = "PlaybackBut"
PlaybackBut.Parent = PlaybackKeybind
PlaybackBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
PlaybackBut.BorderSizePixel = 2
PlaybackBut.Position = UDim2.new(0, 133, 0, 16)
PlaybackBut.Size = UDim2.new(0, 75, 0, 38)
PlaybackBut.Font = Enum.Font.LuckiestGuy
PlaybackBut.Text = "F"
PlaybackBut.TextColor3 = Color3.fromRGB(0, 0, 0)
PlaybackBut.TextSize = 14.000
PlaybackBut.TextWrapped = true

AutoRecKeybind.Name = "AutoRecKeybind"
AutoRecKeybind.Parent = TextInputs_2

AutoRecBut.Name = "AutoRecBut"
AutoRecBut.Parent = AutoRecKeybind
AutoRecBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
AutoRecBut.BorderSizePixel = 2
AutoRecBut.Position = UDim2.new(0, 596, 0, 16)
AutoRecBut.Size = UDim2.new(0, 75, 0, 38)
AutoRecBut.Font = Enum.Font.LuckiestGuy
AutoRecBut.Text = "G"
AutoRecBut.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoRecBut.TextSize = 14.000
AutoRecBut.TextWrapped = true

AutoRecText.Name = "AutoRecText"
AutoRecText.Parent = AutoRecKeybind
AutoRecText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
AutoRecText.BorderSizePixel = 2
AutoRecText.Position = UDim2.new(0, 481, 0, 16)
AutoRecText.Size = UDim2.new(0, 100, 0, 38)
AutoRecText.Font = Enum.Font.LuckiestGuy
AutoRecText.Text = "Auto Record Keybind:"
AutoRecText.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoRecText.TextScaled = true
AutoRecText.TextSize = 14.000
AutoRecText.TextWrapped = true

PauseKeybind.Name = "PauseKeybind"
PauseKeybind.Parent = TextInputs_2

PauseBut.Name = "PauseBut"
PauseBut.Parent = PauseKeybind
PauseBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
PauseBut.BorderSizePixel = 2
PauseBut.Position = UDim2.new(0, 365, 0, 16)
PauseBut.Size = UDim2.new(0, 75, 0, 38)
PauseBut.Font = Enum.Font.LuckiestGuy
PauseBut.Text = "w"
PauseBut.TextColor3 = Color3.fromRGB(0, 0, 0)
PauseBut.TextSize = 14.000
PauseBut.TextWrapped = true

PauseText.Name = "PauseText"
PauseText.Parent = PauseKeybind
PauseText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
PauseText.BorderSizePixel = 2
PauseText.Position = UDim2.new(0, 250, 0, 16)
PauseText.Size = UDim2.new(0, 100, 0, 38)
PauseText.Font = Enum.Font.LuckiestGuy
PauseText.Text = "Pause Keybind:"
PauseText.TextColor3 = Color3.fromRGB(0, 0, 0)
PauseText.TextSize = 14.000
PauseText.TextWrapped = true

SkipForwardFrame.Name = "SkipForwardFrame"
SkipForwardFrame.Parent = TextInputs_2

SkipForwardBut.Name = "SkipForwardBut"
SkipForwardBut.Parent = SkipForwardFrame
SkipForwardBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
SkipForwardBut.BorderSizePixel = 2
SkipForwardBut.Position = UDim2.new(0, 365, 0, 136)
SkipForwardBut.Size = UDim2.new(0, 75, 0, 38)
SkipForwardBut.Font = Enum.Font.LuckiestGuy
SkipForwardBut.Text = "D"
SkipForwardBut.TextColor3 = Color3.fromRGB(0, 0, 0)
SkipForwardBut.TextSize = 14.000
SkipForwardBut.TextWrapped = true

SkipForwardText.Name = "SkipForwardText"
SkipForwardText.Parent = SkipForwardFrame
SkipForwardText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
SkipForwardText.BorderSizePixel = 2
SkipForwardText.Position = UDim2.new(0, 250, 0, 136)
SkipForwardText.Size = UDim2.new(0, 100, 0, 38)
SkipForwardText.Font = Enum.Font.LuckiestGuy
SkipForwardText.Text = "Forward 1 frame keybind:"
SkipForwardText.TextColor3 = Color3.fromRGB(0, 0, 0)
SkipForwardText.TextScaled = true
SkipForwardText.TextSize = 14.000
SkipForwardText.TextWrapped = true

SkipBackFrame.Name = "SkipBackFrame"
SkipBackFrame.Parent = TextInputs_2

SkipBackBut.Name = "SkipBackBut"
SkipBackBut.Parent = SkipBackFrame
SkipBackBut.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
SkipBackBut.BorderSizePixel = 2
SkipBackBut.Position = UDim2.new(0, 365, 0, 76)
SkipBackBut.Size = UDim2.new(0, 75, 0, 38)
SkipBackBut.Font = Enum.Font.LuckiestGuy
SkipBackBut.Text = "A"
SkipBackBut.TextColor3 = Color3.fromRGB(0, 0, 0)
SkipBackBut.TextSize = 14.000
SkipBackBut.TextWrapped = true

SkipBackText.Name = "SkipBackText"
SkipBackText.Parent = SkipBackFrame
SkipBackText.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
SkipBackText.BorderSizePixel = 2
SkipBackText.Position = UDim2.new(0, 250, 0, 76)
SkipBackText.Size = UDim2.new(0, 100, 0, 38)
SkipBackText.Font = Enum.Font.LuckiestGuy
SkipBackText.Text = "Backward 1 frame keybind:"
SkipBackText.TextColor3 = Color3.fromRGB(0, 0, 0)
SkipBackText.TextScaled = true
SkipBackText.TextSize = 14.000
SkipBackText.TextWrapped = true

Icon.Name = "Icon"
Icon.Parent = GUI
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0, 10, 0, 10)
Icon.Size = UDim2.new(0, 108, 0, 100)
Icon.Image = "http://www.roblox.com/asset/?id=12790110018"

TextLabel.Parent = Icon
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 3, 0, 2)
TextLabel.Size = UDim2.new(0, 25, 0, 25)
TextLabel.Visible = false
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "●"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Open.Name = "Open"
Open.Parent = GUI
Open.BackgroundColor3 = Color3.fromRGB(255, 126, 126)
Open.BackgroundTransparency = 0.500
Open.BorderColor3 = Color3.fromRGB(255, 66, 49)
Open.BorderSizePixel = 5
Open.Position = UDim2.new(0, 720, 0, 0)
Open.Size = UDim2.new(0, 38, 0, 38)
Open.Font = Enum.Font.LuckiestGuy
Open.Text = "<"
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextSize = 23.000
Open.TextYAlignment = Enum.TextYAlignment.Bottom

CurAction.Name = "CurAction"
CurAction.Parent = GUI
CurAction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CurAction.BackgroundTransparency = 1.000
CurAction.BorderSizePixel = 0
CurAction.Position = UDim2.new(0, 389, 0, 160)
CurAction.Size = UDim2.new(0, 237, 0, 39)
CurAction.Font = Enum.Font.Bangers
CurAction.Text = "No Action"
CurAction.TextColor3 = Color3.fromRGB(0, 0, 0)
CurAction.TextSize = 23.000
CurAction.TextWrapped = true

TASFrame.Name = "TASFrame"
TASFrame.Parent = GUI
TASFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TASFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 126)
TASFrame.BackgroundTransparency = 0.500
TASFrame.BorderColor3 = Color3.fromRGB(255, 66, 49)
TASFrame.BorderSizePixel = 5
TASFrame.Position = UDim2.new(0, 350, 0, 540)
TASFrame.Size = UDim2.new(0, 700, 0, 350)
TASFrame.Visible = false

SaveSlots.Name = "SaveSlots"
SaveSlots.Parent = TASFrame

Buttons.Name = "Buttons"
Buttons.Parent = SaveSlots

Save2.Name = "Save2"
Save2.Parent = Buttons
Save2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save2.BorderSizePixel = 2
Save2.Position = UDim2.new(0, 245, 0, 7)
Save2.Size = UDim2.new(0, 200, 0, 40)
Save2.Font = Enum.Font.LuckiestGuy
Save2.Text = "Save Slot 2"
Save2.TextColor3 = Color3.fromRGB(0, 0, 0)
Save2.TextSize = 14.000

Save1.Name = "Save1"
Save1.Parent = Buttons
Save1.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save1.BorderSizePixel = 2
Save1.Position = UDim2.new(0, 14, 0, 7)
Save1.Size = UDim2.new(0, 200, 0, 40)
Save1.Font = Enum.Font.LuckiestGuy
Save1.Text = "Save SLot 1"
Save1.TextColor3 = Color3.fromRGB(0, 0, 0)
Save1.TextSize = 14.000

Save3.Name = "Save3"
Save3.Parent = Buttons
Save3.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save3.BorderSizePixel = 2
Save3.Position = UDim2.new(0, 476, 0, 7)
Save3.Size = UDim2.new(0, 200, 0, 40)
Save3.Font = Enum.Font.LuckiestGuy
Save3.Text = "Save Slot 3"
Save3.TextColor3 = Color3.fromRGB(0, 0, 0)
Save3.TextSize = 14.000

LoadTo.Name = "LoadTo"
LoadTo.Parent = Buttons
LoadTo.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
LoadTo.BorderSizePixel = 2
LoadTo.Position = UDim2.new(0, 14, 0, 172)
LoadTo.Size = UDim2.new(0, 200, 0, 40)
LoadTo.Font = Enum.Font.LuckiestGuy
LoadTo.Text = "Load Current Slot to Memory"
LoadTo.TextColor3 = Color3.fromRGB(0, 0, 0)
LoadTo.TextSize = 14.000
LoadTo.TextWrapped = true

SaveTo.Name = "SaveTo"
SaveTo.Parent = Buttons
SaveTo.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
SaveTo.BorderSizePixel = 2
SaveTo.Position = UDim2.new(0, 14, 0, 120)
SaveTo.Size = UDim2.new(0, 200, 0, 40)
SaveTo.Font = Enum.Font.LuckiestGuy
SaveTo.Text = "Save Current Recording to slot"
SaveTo.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveTo.TextSize = 14.000
SaveTo.TextWrapped = true

AddBox.Name = "AddBox"
AddBox.Parent = Buttons
AddBox.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
AddBox.BorderSizePixel = 2
AddBox.Position = UDim2.new(0, 171, 0, 238)
AddBox.Size = UDim2.new(0, 25, 0, 25)
AddBox.Font = Enum.Font.LuckiestGuy
AddBox.Text = "+"
AddBox.TextColor3 = Color3.fromRGB(0, 0, 0)
AddBox.TextSize = 14.000
AddBox.TextWrapped = true

RemoveBox.Name = "RemoveBox"
RemoveBox.Parent = Buttons
RemoveBox.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
RemoveBox.BorderSizePixel = 2
RemoveBox.Position = UDim2.new(0, 32, 0, 238)
RemoveBox.Size = UDim2.new(0, 25, 0, 25)
RemoveBox.Font = Enum.Font.LuckiestGuy
RemoveBox.Text = "-"
RemoveBox.TextColor3 = Color3.fromRGB(0, 0, 0)
RemoveBox.TextSize = 14.000
RemoveBox.TextWrapped = true

Terminal.Name = "Terminal"
Terminal.Parent = Buttons
Terminal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Terminal.BorderSizePixel = 2
Terminal.Position = UDim2.new(0, 256, 0, 70)
Terminal.Size = UDim2.new(0, 420, 0, 40)
Terminal.Font = Enum.Font.RobotoMono
Terminal.Text = "Terminal:"
Terminal.TextColor3 = Color3.fromRGB(0, 0, 0)
Terminal.TextSize = 12.000
Terminal.TextWrapped = true
Terminal.TextXAlignment = Enum.TextXAlignment.Left
Terminal.TextYAlignment = Enum.TextYAlignment.Top

ClearSlot.Name = "ClearSlot"
ClearSlot.Parent = Buttons
ClearSlot.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ClearSlot.BorderSizePixel = 2
ClearSlot.Position = UDim2.new(0, 14, 0, 70)
ClearSlot.Size = UDim2.new(0, 200, 0, 40)
ClearSlot.Font = Enum.Font.LuckiestGuy
ClearSlot.Text = "Clear Save Slot"
ClearSlot.TextColor3 = Color3.fromRGB(0, 0, 0)
ClearSlot.TextSize = 14.000
ClearSlot.TextWrapped = true

Text.Name = "Text"
Text.Parent = SaveSlots

ScrollingFrame1.Name = "ScrollingFrame1"
ScrollingFrame1.Parent = Text
ScrollingFrame1.Active = true
ScrollingFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame1.ScrollBarImageColor3 = Color3.fromRGB(104, 104, 104)
ScrollingFrame1.Position = UDim2.new(0, 256, 0, 120)
ScrollingFrame1.Size = UDim2.new(0, 420, 0, 200)
ScrollingFrame1.ZIndex = 2
ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, 10000)

TextBox1.Name = "TextBox1"
TextBox1.Parent = ScrollingFrame1
TextBox1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox1.BorderSizePixel = 2
TextBox1.Size = UDim2.new(0, 408, 0, 150)
TextBox1.ZIndex = 3
TextBox1.ClearTextOnFocus = false
TextBox1.Font = Enum.Font.RobotoMono
TextBox1.MultiLine = true
TextBox1.PlaceholderText = "Save Slot Data"
TextBox1.Text = ""
TextBox1.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox1.TextSize = 15.000
TextBox1.TextWrapped = true
TextBox1.TextXAlignment = Enum.TextXAlignment.Left
TextBox1.TextYAlignment = Enum.TextYAlignment.Top

TextBox2.Name = "TextBox2"
TextBox2.Parent = ScrollingFrame1
TextBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox2.BorderSizePixel = 2
TextBox2.Size = UDim2.new(0, 408, 0, 150)
TextBox2.ZIndex = 3
TextBox2.ClearTextOnFocus = false
TextBox2.Font = Enum.Font.RobotoMono
TextBox2.MultiLine = true
TextBox2.PlaceholderText = "Save Slot Data"
TextBox2.Text = ""
TextBox2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox2.TextSize = 15.000
TextBox2.TextWrapped = true
TextBox2.TextXAlignment = Enum.TextXAlignment.Left
TextBox2.TextYAlignment = Enum.TextYAlignment.Top

TextBox3.Name = "TextBox3"
TextBox3.Parent = ScrollingFrame1
TextBox3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox3.BorderSizePixel = 2
TextBox3.Size = UDim2.new(0, 408, 0, 150)
TextBox3.ZIndex = 3
TextBox3.ClearTextOnFocus = false
TextBox3.Font = Enum.Font.RobotoMono
TextBox3.MultiLine = true
TextBox3.PlaceholderText = "Save Slot Data"
TextBox3.Text = ""
TextBox3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox3.TextSize = 15.000
TextBox3.TextWrapped = true
TextBox3.TextXAlignment = Enum.TextXAlignment.Left
TextBox3.TextYAlignment = Enum.TextYAlignment.Top

TextBox4.Name = "TextBox4"
TextBox4.Parent = ScrollingFrame1
TextBox4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox4.BorderSizePixel = 2
TextBox4.Size = UDim2.new(0, 408, 0, 150)
TextBox4.ZIndex = 3
TextBox4.ClearTextOnFocus = false
TextBox4.Font = Enum.Font.RobotoMono
TextBox4.MultiLine = true
TextBox4.PlaceholderText = "Save Slot Data"
TextBox4.Text = ""
TextBox4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox4.TextSize = 15.000
TextBox4.TextWrapped = true
TextBox4.TextXAlignment = Enum.TextXAlignment.Left
TextBox4.TextYAlignment = Enum.TextYAlignment.Top

TextBox5.Name = "TextBox5"
TextBox5.Parent = ScrollingFrame1
TextBox5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox5.BorderSizePixel = 2
TextBox5.Size = UDim2.new(0, 408, 0, 150)
TextBox5.ZIndex = 3
TextBox5.ClearTextOnFocus = false
TextBox5.Font = Enum.Font.RobotoMono
TextBox5.MultiLine = true
TextBox5.PlaceholderText = "Save Slot Data"
TextBox5.Text = ""
TextBox5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox5.TextSize = 15.000
TextBox5.TextWrapped = true
TextBox5.TextXAlignment = Enum.TextXAlignment.Left
TextBox5.TextYAlignment = Enum.TextYAlignment.Top

ScrollingFrame2.Name = "ScrollingFrame2"
ScrollingFrame2.Parent = Text
ScrollingFrame2.Active = true
ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(104, 104, 104)
ScrollingFrame2.Position = UDim2.new(0, 256, 0, 120)
ScrollingFrame2.Size = UDim2.new(0, 420, 0, 200)
ScrollingFrame2.Visible = false
ScrollingFrame2.ZIndex = 2
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 10000)

TextBox1_2.Name = "TextBox1"
TextBox1_2.Parent = ScrollingFrame2
TextBox1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox1_2.BorderSizePixel = 2
TextBox1_2.Size = UDim2.new(0, 408, 0, 150)
TextBox1_2.ZIndex = 3
TextBox1_2.ClearTextOnFocus = false
TextBox1_2.Font = Enum.Font.RobotoMono
TextBox1_2.MultiLine = true
TextBox1_2.PlaceholderText = "Save Slot Data"
TextBox1_2.Text = ""
TextBox1_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox1_2.TextSize = 15.000
TextBox1_2.TextWrapped = true
TextBox1_2.TextXAlignment = Enum.TextXAlignment.Left
TextBox1_2.TextYAlignment = Enum.TextYAlignment.Top

TextBox2_2.Name = "TextBox2"
TextBox2_2.Parent = ScrollingFrame2
TextBox2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox2_2.BorderSizePixel = 2
TextBox2_2.Size = UDim2.new(0, 408, 0, 150)
TextBox2_2.ZIndex = 3
TextBox2_2.ClearTextOnFocus = false
TextBox2_2.Font = Enum.Font.RobotoMono
TextBox2_2.MultiLine = true
TextBox2_2.PlaceholderText = "Save Slot Data"
TextBox2_2.Text = ""
TextBox2_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox2_2.TextSize = 15.000
TextBox2_2.TextWrapped = true
TextBox2_2.TextXAlignment = Enum.TextXAlignment.Left
TextBox2_2.TextYAlignment = Enum.TextYAlignment.Top

TextBox3_2.Name = "TextBox3"
TextBox3_2.Parent = ScrollingFrame2
TextBox3_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox3_2.BorderSizePixel = 2
TextBox3_2.Size = UDim2.new(0, 408, 0, 150)
TextBox3_2.ZIndex = 3
TextBox3_2.ClearTextOnFocus = false
TextBox3_2.Font = Enum.Font.RobotoMono
TextBox3_2.MultiLine = true
TextBox3_2.PlaceholderText = "Save Slot Data"
TextBox3_2.Text = ""
TextBox3_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox3_2.TextSize = 15.000
TextBox3_2.TextWrapped = true
TextBox3_2.TextXAlignment = Enum.TextXAlignment.Left
TextBox3_2.TextYAlignment = Enum.TextYAlignment.Top

TextBox4_2.Name = "TextBox4"
TextBox4_2.Parent = ScrollingFrame2
TextBox4_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox4_2.BorderSizePixel = 2
TextBox4_2.Size = UDim2.new(0, 408, 0, 150)
TextBox4_2.ZIndex = 3
TextBox4_2.ClearTextOnFocus = false
TextBox4_2.Font = Enum.Font.RobotoMono
TextBox4_2.MultiLine = true
TextBox4_2.PlaceholderText = "Save Slot Data"
TextBox4_2.Text = ""
TextBox4_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox4_2.TextSize = 15.000
TextBox4_2.TextWrapped = true
TextBox4_2.TextXAlignment = Enum.TextXAlignment.Left
TextBox4_2.TextYAlignment = Enum.TextYAlignment.Top

TextBox5_2.Name = "TextBox5"
TextBox5_2.Parent = ScrollingFrame2
TextBox5_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox5_2.BorderSizePixel = 2
TextBox5_2.Size = UDim2.new(0, 408, 0, 150)
TextBox5_2.ZIndex = 3
TextBox5_2.ClearTextOnFocus = false
TextBox5_2.Font = Enum.Font.RobotoMono
TextBox5_2.MultiLine = true
TextBox5_2.PlaceholderText = "Save Slot Data"
TextBox5_2.Text = ""
TextBox5_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox5_2.TextSize = 15.000
TextBox5_2.TextWrapped = true
TextBox5_2.TextXAlignment = Enum.TextXAlignment.Left
TextBox5_2.TextYAlignment = Enum.TextYAlignment.Top

ScrollingFrame3.Name = "ScrollingFrame3"
ScrollingFrame3.Parent = Text
ScrollingFrame3.Active = true
ScrollingFrame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame3.ScrollBarImageColor3 = Color3.fromRGB(104, 104, 104)
ScrollingFrame3.Position = UDim2.new(0, 256, 0, 120)
ScrollingFrame3.Size = UDim2.new(0, 420, 0, 200)
ScrollingFrame3.Visible = false
ScrollingFrame3.ZIndex = 2
ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 10000)

TextBox1_3.Name = "TextBox1"
TextBox1_3.Parent = ScrollingFrame3
TextBox1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox1_3.BorderSizePixel = 2
TextBox1_3.Size = UDim2.new(0, 408, 0, 150)
TextBox1_3.ZIndex = 3
TextBox1_3.ClearTextOnFocus = false
TextBox1_3.Font = Enum.Font.RobotoMono
TextBox1_3.MultiLine = true
TextBox1_3.PlaceholderText = "Save Slot Data"
TextBox1_3.Text = ""
TextBox1_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox1_3.TextSize = 15.000
TextBox1_3.TextWrapped = true
TextBox1_3.TextXAlignment = Enum.TextXAlignment.Left
TextBox1_3.TextYAlignment = Enum.TextYAlignment.Top

TextBox2_3.Name = "TextBox2"
TextBox2_3.Parent = ScrollingFrame3
TextBox2_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox2_3.BorderSizePixel = 2
TextBox2_3.Size = UDim2.new(0, 408, 0, 150)
TextBox2_3.ZIndex = 3
TextBox2_3.ClearTextOnFocus = false
TextBox2_3.Font = Enum.Font.RobotoMono
TextBox2_3.MultiLine = true
TextBox2_3.PlaceholderText = "Save Slot Data"
TextBox2_3.Text = ""
TextBox2_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox2_3.TextSize = 15.000
TextBox2_3.TextWrapped = true
TextBox2_3.TextXAlignment = Enum.TextXAlignment.Left
TextBox2_3.TextYAlignment = Enum.TextYAlignment.Top

TextBox3_3.Name = "TextBox3"
TextBox3_3.Parent = ScrollingFrame3
TextBox3_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox3_3.BorderSizePixel = 2
TextBox3_3.Size = UDim2.new(0, 408, 0, 150)
TextBox3_3.ZIndex = 3
TextBox3_3.ClearTextOnFocus = false
TextBox3_3.Font = Enum.Font.RobotoMono
TextBox3_3.MultiLine = true
TextBox3_3.PlaceholderText = "Save Slot Data"
TextBox3_3.Text = ""
TextBox3_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox3_3.TextSize = 15.000
TextBox3_3.TextWrapped = true
TextBox3_3.TextXAlignment = Enum.TextXAlignment.Left
TextBox3_3.TextYAlignment = Enum.TextYAlignment.Top

TextBox4_3.Name = "TextBox4"
TextBox4_3.Parent = ScrollingFrame3
TextBox4_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox4_3.BorderSizePixel = 2
TextBox4_3.Size = UDim2.new(0, 408, 0, 150)
TextBox4_3.ZIndex = 3
TextBox4_3.ClearTextOnFocus = false
TextBox4_3.Font = Enum.Font.RobotoMono
TextBox4_3.MultiLine = true
TextBox4_3.PlaceholderText = "Save Slot Data"
TextBox4_3.Text = ""
TextBox4_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox4_3.TextSize = 15.000
TextBox4_3.TextWrapped = true
TextBox4_3.TextXAlignment = Enum.TextXAlignment.Left
TextBox4_3.TextYAlignment = Enum.TextYAlignment.Top

TextBox5_3.Name = "TextBox5"
TextBox5_3.Parent = ScrollingFrame3
TextBox5_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox5_3.BorderSizePixel = 2
TextBox5_3.Size = UDim2.new(0, 408, 0, 150)
TextBox5_3.ZIndex = 3
TextBox5_3.ClearTextOnFocus = false
TextBox5_3.Font = Enum.Font.RobotoMono
TextBox5_3.MultiLine = true
TextBox5_3.PlaceholderText = "Save Slot Data"
TextBox5_3.Text = ""
TextBox5_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox5_3.TextSize = 15.000
TextBox5_3.TextWrapped = true
TextBox5_3.TextXAlignment = Enum.TextXAlignment.Left
TextBox5_3.TextYAlignment = Enum.TextYAlignment.Top

Boxes.Name = "Boxes"
Boxes.Parent = TASFrame
Boxes.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Boxes.BorderSizePixel = 2
Boxes.Position = UDim2.new(0, 64, 0, 235)
Boxes.Size = UDim2.new(0, 100, 0, 30)
Boxes.Font = Enum.Font.Bangers
Boxes.Text = "1"
Boxes.TextColor3 = Color3.fromRGB(0, 0, 0)
Boxes.TextSize = 22.000
Boxes.TextWrapped = true

GhostFrame.Name = "GhostFrame"
GhostFrame.Parent = GUI
GhostFrame.AnchorPoint = Vector2.new(0.5, 0.5)
GhostFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 126)
GhostFrame.BackgroundTransparency = 0.500
GhostFrame.BorderColor3 = Color3.fromRGB(255, 66, 49)
GhostFrame.BorderSizePixel = 5
GhostFrame.Position = UDim2.new(0, 350, 0, 540)
GhostFrame.Size = UDim2.new(0, 700, 0, 350)
GhostFrame.Visible = false

ToggleGhost.Name = "ToggleGhost"
ToggleGhost.Parent = GhostFrame
ToggleGhost.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
ToggleGhost.BorderSizePixel = 2
ToggleGhost.Position = UDim2.new(0, 182, 0, 277)
ToggleGhost.Size = UDim2.new(0, 150, 0, 50)
ToggleGhost.Font = Enum.Font.LuckiestGuy
ToggleGhost.Text = "Toggle ghost: Off"
ToggleGhost.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleGhost.TextSize = 14.000
ToggleGhost.TextWrapped = true

SaveData.Name = "SaveData"
SaveData.Parent = GhostFrame

RecMem.Name = "RecMem"
RecMem.Parent = SaveData
RecMem.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
RecMem.BorderSizePixel = 2
RecMem.Position = UDim2.new(0, 238, 0, 16)
RecMem.Size = UDim2.new(0, 90, 0, 40)
RecMem.Font = Enum.Font.LuckiestGuy
RecMem.Text = "Recording Memory"
RecMem.TextColor3 = Color3.fromRGB(0, 0, 0)
RecMem.TextSize = 14.000
RecMem.TextWrapped = true

TextLabel_2.Parent = SaveData
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
TextLabel_2.BorderSizePixel = 2
TextLabel_2.Position = UDim2.new(0.0151664512, 0, 0.0399999991, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 44)
TextLabel_2.Font = Enum.Font.LuckiestGuy
TextLabel_2.Text = "Ghost Memory Slot:"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 14.000

Save1_2.Name = "Save1"
Save1_2.Parent = SaveData
Save1_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save1_2.BorderSizePixel = 2
Save1_2.Position = UDim2.new(0, 356, 0, 16)
Save1_2.Size = UDim2.new(0, 90, 0, 40)
Save1_2.Font = Enum.Font.LuckiestGuy
Save1_2.Text = "sAVE SLOT 1"
Save1_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Save1_2.TextSize = 14.000
Save1_2.TextWrapped = true

Save2_2.Name = "Save2"
Save2_2.Parent = SaveData
Save2_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save2_2.BorderSizePixel = 2
Save2_2.Position = UDim2.new(0, 475, 0, 16)
Save2_2.Size = UDim2.new(0, 90, 0, 40)
Save2_2.Font = Enum.Font.LuckiestGuy
Save2_2.Text = "sAVE sLOT 2"
Save2_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Save2_2.TextSize = 14.000
Save2_2.TextWrapped = true

Save3_2.Name = "Save3"
Save3_2.Parent = SaveData
Save3_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Save3_2.BorderSizePixel = 2
Save3_2.Position = UDim2.new(0, 589, 0, 16)
Save3_2.Size = UDim2.new(0, 90, 0, 40)
Save3_2.Font = Enum.Font.LuckiestGuy
Save3_2.Text = "SAVE SLOT 3"
Save3_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Save3_2.TextSize = 14.000
Save3_2.TextWrapped = true

Transparency.Name = "Transparency"
Transparency.Parent = GhostFrame

input_4.Name = "input"
input_4.Parent = Transparency
input_4.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
input_4.BorderSizePixel = 2
input_4.Position = UDim2.new(0, 180, 0, 73)
input_4.Size = UDim2.new(0, 129, 0, 40)
input_4.Font = Enum.Font.LuckiestGuy
input_4.PlaceholderColor3 = Color3.fromRGB(98, 0, 0)
input_4.PlaceholderText = "65"
input_4.Text = ""
input_4.TextColor3 = Color3.fromRGB(0, 0, 0)
input_4.TextSize = 14.000

Transparency_2.Name = "Transparency"
Transparency_2.Parent = Transparency
Transparency_2.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
Transparency_2.BorderSizePixel = 2
Transparency_2.Position = UDim2.new(0, 11, 0, 73)
Transparency_2.Size = UDim2.new(0, 157, 0, 40)
Transparency_2.Font = Enum.Font.LuckiestGuy
Transparency_2.Text = "Transparency (%):"
Transparency_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Transparency_2.TextSize = 14.000
Transparency_2.TextWrapped = true

Terminal_2.Name = "Terminal"
Terminal_2.Parent = GhostFrame
Terminal_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Terminal_2.BorderSizePixel = 2
Terminal_2.Position = UDim2.new(0, 328, 0, 73)
Terminal_2.Size = UDim2.new(0, 351, 0, 40)
Terminal_2.Font = Enum.Font.RobotoMono
Terminal_2.Text = "Terminal:"
Terminal_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Terminal_2.TextSize = 12.000
Terminal_2.TextWrapped = true
Terminal_2.TextXAlignment = Enum.TextXAlignment.Left
Terminal_2.TextYAlignment = Enum.TextYAlignment.Top

Info_2.Name = "Info"
Info_2.Parent = GhostFrame
Info_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info_2.BackgroundTransparency = 1.000
Info_2.BorderSizePixel = 0
Info_2.Position = UDim2.new(0, 200, 0, 128)
Info_2.Size = UDim2.new(0, 290, 0, 39)
Info_2.Font = Enum.Font.DenkOne
Info_2.Text = "Ghost Information:"
Info_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Info_2.TextSize = 40.000
Info_2.TextWrapped = true

Info_3.Name = "Info"
Info_3.Parent = GhostFrame
Info_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info_3.BackgroundTransparency = 1.000
Info_3.BorderSizePixel = 0
Info_3.Position = UDim2.new(0, 8, 0, 179)
Info_3.Size = UDim2.new(0, 674, 0, 86)
Info_3.Font = Enum.Font.DenkOne
Info_3.Text = "	The recording memory data slot is updated when the player resets. Only save slots with valid TAS data can be used for ghost data. Toggling a ghost on/off is only done when the player resets. Rewing, fast forward, pause, etc. do not affect the ghost. On launch, save slot 3 has a run by ManlyTorch that you can race	."
Info_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Info_3.TextSize = 21.000
Info_3.TextWrapped = true
Info_3.TextXAlignment = Enum.TextXAlignment.Left
Info_3.TextYAlignment = Enum.TextYAlignment.Top

AutoSet.Name = "AutoSet"
AutoSet.Parent = GhostFrame
AutoSet.BackgroundColor3 = Color3.fromRGB(255, 121, 121)
AutoSet.BorderSizePixel = 2
AutoSet.Position = UDim2.new(0, 358, 0, 277)
AutoSet.Size = UDim2.new(0, 150, 0, 50)
AutoSet.Font = Enum.Font.LuckiestGuy
AutoSet.Text = "Auto set recording to ghost: Off"
AutoSet.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoSet.TextSize = 14.000
AutoSet.TextWrapped = true

KeyCodeSelector.Name = "KeyCodeSelector"
KeyCodeSelector.Parent = TASMenu
KeyCodeSelector.AnchorPoint = Vector2.new(0.5, 0.5)
KeyCodeSelector.BackgroundColor3 = Color3.fromRGB(255, 175, 175)
KeyCodeSelector.BorderSizePixel = 3
KeyCodeSelector.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyCodeSelector.Size = UDim2.new(0, 550, 0, 350)
KeyCodeSelector.Visible = false

Title_2.Name = "Title"
Title_2.Parent = KeyCodeSelector
Title_2.BackgroundColor3 = Color3.fromRGB(255, 121, 116)
Title_2.BorderSizePixel = 3
Title_2.Size = UDim2.new(0, 550, 0, 25)
Title_2.Font = Enum.Font.LuckiestGuy
Title_2.Text = "Select  Desired KeyBind"
Title_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Title_2.TextSize = 14.000

ScrollingFrame.Parent = KeyCodeSelector
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 175, 175)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(104, 104, 104)
ScrollingFrame.Position = UDim2.new(0, 25, 0, 50)
ScrollingFrame.Size = UDim2.new(0, 500, 0, 275)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 200)
ScrollingFrame.ScrollBarThickness = 10

TextButtons_2.Name = "TextButtons"
TextButtons_2.Parent = ScrollingFrame

Mid1.Name = "Mid1"
Mid1.Parent = TextButtons_2
Mid1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid1.BackgroundTransparency = 0.300
Mid1.Size = UDim2.new(0, 489, 0, 50)
Mid1.Font = Enum.Font.LuckiestGuy
Mid1.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid1.TextSize = 30.000

Mid2.Name = "Mid2"
Mid2.Parent = TextButtons_2
Mid2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid2.BackgroundTransparency = 0.300
Mid2.Size = UDim2.new(0, 489, 0, 50)
Mid2.Font = Enum.Font.LuckiestGuy
Mid2.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid2.TextSize = 30.000

Mid3.Name = "Mid3"
Mid3.Parent = TextButtons_2
Mid3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid3.BackgroundTransparency = 0.300
Mid3.Size = UDim2.new(0, 489, 0, 50)
Mid3.Font = Enum.Font.LuckiestGuy
Mid3.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid3.TextSize = 30.000

Mid4.Name = "Mid4"
Mid4.Parent = TextButtons_2
Mid4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid4.BackgroundTransparency = 0.300
Mid4.Size = UDim2.new(0, 489, 0, 50)
Mid4.Font = Enum.Font.LuckiestGuy
Mid4.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid4.TextSize = 30.000

Mid5.Name = "Mid5"
Mid5.Parent = TextButtons_2
Mid5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid5.BackgroundTransparency = 0.300
Mid5.Size = UDim2.new(0, 489, 0, 50)
Mid5.Font = Enum.Font.LuckiestGuy
Mid5.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid5.TextSize = 30.000

Mid6.Name = "Mid6"
Mid6.Parent = TextButtons_2
Mid6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid6.BackgroundTransparency = 0.300
Mid6.Size = UDim2.new(0, 489, 0, 50)
Mid6.Font = Enum.Font.LuckiestGuy
Mid6.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid6.TextSize = 30.000

Mid7.Name = "Mid7"
Mid7.Parent = TextButtons_2
Mid7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid7.BackgroundTransparency = 0.300
Mid7.Size = UDim2.new(0, 489, 0, 50)
Mid7.Font = Enum.Font.LuckiestGuy
Mid7.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid7.TextSize = 30.000

Mid8.Name = "Mid8"
Mid8.Parent = TextButtons_2
Mid8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid8.BackgroundTransparency = 0.300
Mid8.Size = UDim2.new(0, 489, 0, 50)
Mid8.Font = Enum.Font.LuckiestGuy
Mid8.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid8.TextSize = 30.000

Mid9.Name = "Mid9"
Mid9.Parent = TextButtons_2
Mid9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mid9.BackgroundTransparency = 0.300
Mid9.Size = UDim2.new(0, 489, 0, 50)
Mid9.Font = Enum.Font.LuckiestGuy
Mid9.TextColor3 = Color3.fromRGB(0, 0, 0)
Mid9.TextSize = 30.000

Close.Name = "Close"
Close.Parent = KeyCodeSelector
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Close.BorderSizePixel = 3
Close.Position = UDim2.new(0.954545438, 0, 0, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000

-- Scripts:

local function STUDIOS_TASLocalScript () -- TASFrame.TASLocalScript 
	local script = Instance.new('LocalScript', TASFrame)

	-- Main Frame --
	local TAS = script.Parent

	-- Buttons --
	_G.SaveTo = TAS.SaveSlots.Buttons.SaveTo
	_G.LoadTo = TAS.SaveSlots.Buttons.LoadTo

	_G.S1 = TAS.SaveSlots.Buttons.Save1
	_G.S2 = TAS.SaveSlots.Buttons.Save2
	_G.S3 = TAS.SaveSlots.Buttons.Save3

	-- TextBoxes --
	_G.TB1 = TAS.SaveSlots.Text.ScrollingFrame1
	_G.TB2 = TAS.SaveSlots.Text.ScrollingFrame2
	_G.TB3 = TAS.SaveSlots.Text.ScrollingFrame3

	-- Variables --
	_G.SaveSlotStatuses = "Unloaded"

	_G.CurSaveSlot = 1
	local activeSlot = 1


	-- Functions --

	_G.S1.MouseButton1Up:Connect(function() -- Slot 1
		_G.CurSaveSlot = 1
		_G.TB1.Visible = true
		_G.TB2.Visible = false
		_G.TB3.Visible = false
	end)

	_G.S2.MouseButton1Up:Connect(function() -- Slot 2
		_G.CurSaveSlot = 2
		_G.TB1.Visible = false
		_G.TB2.Visible = true
		_G.TB3.Visible = false
	end)

	_G.S3.MouseButton1Up:Connect(function() -- Slot 3
		_G.CurSaveSlot = 3
		_G.TB1.Visible = false
		_G.TB2.Visible = false
		_G.TB3.Visible = true
	end)
end
coroutine.wrap(STUDIOS_TASLocalScript )()
local function STUDIOS_TASEncoding () -- TASFrame.TASEncoding 
	local script = Instance.new('LocalScript', TASFrame)

	-- SAVE DATA --
	
	local dictionary, length = {}, 0
	for i = 32, 127 do
		if i ~= 34 and i ~= 92 then
			local c = string.char(i)
			dictionary[c], dictionary[length] = length, c
			length = length + 1
		end
	end
	
	local escapemap = {}
	for i = 1, 34 do
		i = ({34, 92, 127})[i-31] or i
		local c, e = string.char(i), string.char(i + 31)
		escapemap[c], escapemap[e] = e, c
	end
	local function escape(s)
		return (s:gsub("[%c\"\\]", function(c)
			return "\127"..escapemap[c]
		end))
	end
	
	local function unescape(s)
		return (s:gsub("\127(.)", function(c)
			return escapemap[c]
		end))
	end
	
	local function copy(t)
		local new = {}
		for k, v in pairs(t) do
			new[k] = v
		end
		return new
	end
	
	local function tobase93(n)
		local value = ""
		repeat
			local remainder = n%93
			value = dictionary[remainder]..value
			n = (n - remainder)/93
		until n == 0
		return value
	end
	
	local function tobase10(value)
		local n = 0
		for i = 1, #value do
			n = n + 93^(i-1)*dictionary[value:sub(-i, -i)]
		end
		return n
	end
	
	_G.compress = function(text)
		local dictionary = copy(dictionary)
		local key, sequence, size = "", {}, #dictionary
		local width, spans, span = 1, {}, 0
		local function listkey(key)
			local value = tobase93(dictionary[key])
			if #value > width then
				width, span, spans[width] = #value, 0, span
			end
			sequence[#sequence+1] = (" "):rep(width - #value)..value
			span = span + 1
		end
		text = escape(text)
		for i = 1, #text do
			local c = text:sub(i, i)
			local new = key..c
			if dictionary[new] then
				key = new
			else
				listkey(key)
				key, size = c, size+1
				dictionary[new], dictionary[size] = size, new
			end
		end
		listkey(key)
		spans[width] = span
		return table.concat(spans, ",").."|"..table.concat(sequence)
	end
	
	_G.decompress = function(text)
		local dictionary = copy(dictionary)
		local sequence, spans, content = {}, text:match("(.-)|(.*)")
		local groups, start = {}, 1
		for span in spans:gmatch("%d+") do
			local width = #groups+1
			groups[width] = content:sub(start, start + span*width - 1)
			start = start + span*width
		end
		local previous;
		for width = 1, #groups do
			for value in groups[width]:gmatch(('.'):rep(width)) do
				local entry = dictionary[tobase10(value)]
				if previous then
					if entry then
						sequence[#sequence+1] = entry
						dictionary[#dictionary+1] = previous..entry:sub(1, 1)
					else
						entry = previous..previous:sub(1, 1)
						sequence[#sequence+1] = entry
						dictionary[#dictionary+1] = entry
					end
				else
					sequence[1] = entry
				end
				previous = entry
			end
		end
		return unescape(table.concat(sequence))
	end
end
coroutine.wrap(STUDIOS_TASEncoding )()
local function STUDIOS_TASWriteToMemory() -- TASFrame.TASWriteToMemory 
	local script = Instance.new('LocalScript', TASFrame)

	-- Data Prep --
	
	-- Round off CFrame --
	-- Convert CFrame to list --
	-- Convert CFrame list to 3 Vector3's --
	
	-- Concatinate each Vector3 to string --
	-- Concatinate all Vector3 strings --
	
	-- Compress string --
	
	
	function roundMul(num)
		return tostring(math.round(num * _G.Precision))
	end
	
	function rCFtoList(cframe) -- WARNING: CFRAME LOOK VECTOR NOT INCLUDED, REMEMBER TO ADD WHEN DECOMPRESSING, NUMBERS ARE MULTIPLIED BY 10
		return {roundMul(cframe.X), roundMul(cframe.Y), roundMul(cframe.Z),	-- X,   Y,   Z
			roundMul(cframe.RightVector.X), roundMul(cframe.UpVector.X),		-- R00, R01
			roundMul(cframe.RightVector.Y), roundMul(cframe.UpVector.Y),		-- R10, R11
			roundMul(cframe.RightVector.Z), roundMul(cframe.UpVector.Z)}		-- R20, R21
	end
	
	local function writeMCFToVec3(data) -- Writes the modified (list) CFrame to 3 unique Vector3's
		local i = 1
		local lst = {}
		while i <= 9 do
			lst[#lst+1] = Vector3.new(data[i], data[i+1], data[i+2])
			i += 3
		end
		return lst
	end
	
	function vec3ToString(vec3, bool) -- Concatinated a Vector3 into a string, with numbers separated by commas
		if bool then
			return tostring(roundMul(vec3.X))..","..tostring(roundMul(vec3.Y))..","..tostring(roundMul(vec3.Z))..","
		end
		return tostring(vec3.X)..","..tostring(vec3.Y)..","..tostring(vec3.Z)..","
	end
	
	local function writeFrameToString(cframe, vec3_1, vec3_2)
		-- Write CFrame to rounded Vec3's
		local temp = ""
		cframe = writeMCFToVec3(rCFtoList(cframe)) -- 3 vec3's
		
		-- Write the 5 Vec3's to string
		temp = vec3ToString(cframe[1], false)
		temp = temp..vec3ToString(cframe[2], false)
		temp = temp..vec3ToString(cframe[3], false)
		temp = temp..vec3ToString(vec3_1, true)
		temp = temp..vec3ToString(vec3_2, true)
		return temp
	end
	
	_G.WriteMemoryToCompressedString = function(data) -- Write all frames to memory
		local i = 1
		local temp = ""
		while i <= #data do
			if math.fmod(i, 100) == 0 then task.wait() end
			temp = temp..writeFrameToString(data[i][1], data[i][2], data[i][3])
			i += 1
		end
		-- Temp is all data uncompressed
		_G.CurrentlySavedData.Value = _G.compress(temp)
		_G.CurrentlySavedData.CompressedState = true
		return _G.CurrentlySavedData.Value -- Compressed data
	end
end
coroutine.wrap(STUDIOS_TASWriteToMemory)()
local function STUDIOS_TASReadFromMemory() -- TASFrame.TASReadFromMemory 
	local script = Instance.new('LocalScript', TASFrame)

	-- Data Decryption --
	
	-- Decompress string --
	-- Separate string of all Vector3's --
	-- Separate values for each individual Vector3 --
	
	-- Convert 3 Vector3's to CFrame list --
	-- Convert CFrame list to CFrame --
	
	function stringToVec3(str) -- Concatinated a Vector3 into a string, with numbers separated by commas
		str = string.split(str)
		return Vector3.new(str[1], str[2], str[3])
	end
	
	function listToRCFrame(lst) -- WARNING: CFRAME LOOK VECTOR WAS NOT INCLUDED, REMEMBER TO ADD WHEN DECOMPRESSING, NUMBERS WERE MULTIPLIED BY 10
		return CFrame.new(lst[1]/_G.Precision, lst[2]/_G.Precision,lst[3]/_G.Precision, lst[4]/_G.Precision, lst[5]/_G.Precision, 0, lst[6]/_G.Precision, lst[7]/_G.Precision, 0, lst[8]/_G.Precision, lst[9]/_G.Precision, 1)
	end
	
	_G.ReadMemoryFromCompressedString = function(data) -- Write all frames to memory
		data = _G.decompress(data)	-- Decompress
		data = string.split(data)
		for i, d in pairs(data) do
			data[i] = tonumber(d)
		end
		
		local lst = {}
		local i = 1
		while i <= #data do
			lst[#lst+1] =  {
				listToRCFrame({data[i], data[i+1], data[i+2], data[i+3], data[i+4], data[i+5], data[i+6], data[i+7], data[i+8]}),	-- Axe.CFrame
				Vector3.new(data[i+9]/_G.Precision, data[i+10]/_G.Precision, data[i+11]/_G.Precision),								-- Ball.Position
				Vector3.new(data[i+12]/_G.Precision, data[i+13]/_G.Precision, data[i+14]/_G.Precision)								-- Ball.Velocity
			}							
			i += 15
		end
		_G.CurrentlySavedData.Value = lst
		_G.CurrentlySavedData.CompressedState = false
		return _G.CurrentlySavedData.Value -- Decompressed data
	end
end
coroutine.wrap(STUDIOS_TASReadFromMemory)()
local function STUDIOS_GuiLocalScript() -- GUI.GuiLocalScript 
	local script = Instance.new('LocalScript', GUI)

	-- Main Gui --
	local Gui = script.Parent
	local GuiSizeX = 700
	local GuiSizeY = 350
	
	local CurAction = Gui.CurAction

	-- Sub Guis --
	local SettingsGui = Gui.SettingsFrame
	local TASGui = Gui.TASFrame
	local GhostGui = Gui.GhostFrame
	
	-- Main Frame Buttons --
	local GuiToggle = Gui.Open
	local Icon = Gui.Icon
	local MainGui = Gui.MainFrame
	local autoRecIndicator = MainGui.TextInputs.AutoRecIndicator
	local ghostIndicator = MainGui.TextInputs.GhostIndicator
	
	-- Special Buttons --
	local Clear = MainGui.TextButtons.Clear
	local Settings = MainGui.TextButtons.Settings
	local TAS = MainGui.TextButtons.TASMenu
	local Ghost = MainGui.TextButtons.GhostMenu
	
	-- Keybind Buttons --
	local AutoRecBut = SettingsGui.TextInputs.AutoRecKeybind.AutoRecBut
	local ClearBut = SettingsGui.TextInputs.ClearKeybind.ClearBut
	local FastForwardBut = SettingsGui.TextInputs.FastForwardKeybind.FastForwardBut
	local ManRecBut = SettingsGui.TextInputs.ManRecKeybind.ManRecBut
	local PlaybackBut = SettingsGui.TextInputs.PlaybackKeybind.PlaybackBut
	local RewindBut = SettingsGui.TextInputs.RewindKeybind.RewindBut
	local PauseBut = SettingsGui.TextInputs.PauseKeybind.PauseBut
	local SkipForwardBut = SettingsGui.TextInputs.SkipForwardFrame.SkipForwardBut
	local SkipBackBut = SettingsGui.TextInputs.SkipBackFrame.SkipBackBut
	
	-- Variables --
	local menuOpen = true
	local curSubMenu = 1
	
	local lPlyr = game.Players.LocalPlayer
	local UIP = game:GetService("UserInputService")
	
	local keybindInputs = {
		AutoRecBut,
		ClearBut,
		FastForwardBut,
		ManRecBut,
		PlaybackBut,
		RewindBut,
		PauseBut,
		SkipForwardBut,
		SkipBackBut
	}
	
	local replayIndex = 1
	
	-- Toggles --
	local T_Record = false	--	Toggle for Recording
	local T_Replay = false	--	Toggle for Replaying
	local T_Forward = false	--	Toggle for Fast Forward
	local T_Rewind = false	--	Toggle for Rewind
	local T_Pause = false	--	Toggle for Rewind

	local T_SkipFrame = false	--	Toggle for Skipping Ahead 1 Frame
	local T_BackFrame = false	--	Toggle for Going Back 1 Frame

	local T_AutoRec = false
	local T_AutoReset = false
	
	-- Ball And Axe Specific Functions --
	local Player = game.Players.LocalPlayer.Name
	local PM    = game.Workspace.playerModels
	local Ball  = PM:WaitForChild(Player).ball
	local Axe   = PM:WaitForChild(Player).axe
	
	-- General Functions --
	function ResizeGui(x, y) -- Resize Gui for dragging purposes
		Gui:TweenSize(
			UDim2.new(0, x, 0, y), -- Open Position
			"Out",		-- Easing Direction
			"Quad",		-- Easing Type
			0.25,		-- Motion time (seconds)
			true		-- Override any other tweens
		)
		GuiSizeX = x
		GuiSizeY = y
	end
	
	function TweenIcon(x1, y1, x2, y2, x3, y3)
		GuiToggle:TweenPosition(
			UDim2.new(0, x1, 0, y1), -- Open Position
			"Out",		-- Easing Direction
			"Quad",		-- Easing Type
			0.25,		-- Motion time (seconds)
			false		-- Override any other tweens
		)
		Icon:TweenPosition(
			UDim2.new(0, x2, 0, y2), -- Open Position
			"Out",		-- Easing Direction
			"Quad",		-- Easing Type
			0.25,		-- Motion time (seconds)
			false		-- Override any other tweens
		)
		CurAction:TweenPosition(
			UDim2.new(0, x3, 0, y3), -- Open Position
			"Out",		-- Easing Direction
			"Quad",		-- Easing Type
			0.25,		-- Motion time (seconds)
			false		-- Override any other tweens
		)
	end
	
	function FindKeyCode(string)
		string = string.upper(string)
		if not (string == string.lower(string)) then
			return Enum.KeyCode[string]
		elseif string == "0" then -- NEW
			return Enum.KeyCode.Zero
		elseif string == "1" then
			return Enum.KeyCode.One
		elseif string == "2" then
			return Enum.KeyCode.Two
		elseif string == "3" then
			return Enum.KeyCode.Three
		elseif string == "4" then
			return Enum.KeyCode.Four
		elseif string == "5" then
			return Enum.KeyCode.Five
		elseif string == "6" then
			return Enum.KeyCode.Six
		elseif string == "7" then
			return Enum.KeyCode.Seven
		elseif string == "8" then
			return Enum.KeyCode.Eight
		elseif string == "9" then
			return Enum.KeyCode.Nine
		elseif string == ";" then
			return Enum.KeyCode.Semicolon
		elseif string == "=" then
			return Enum.KeyCode.Equals
		elseif string == "[" then
			return Enum.KeyCode.LeftBracket
		elseif string == "]" then
			return Enum.KeyCode.RightBracket
		elseif string == "-" then
			return Enum.KeyCode.Minus
		end
		return nil
	end
	
	local function recallibratePlayer() -- Reset what player the TAS should work with
		Player = game.Players.LocalPlayer.Name
		PM    = game.Workspace.playerModels
		Ball  = PM:WaitForChild(Player).ball
		Axe   = PM:WaitForChild(Player).axe
	end
	
	local function writeFrameToMemory(loc) -- Push current Ball + Axe data to end of specified memory list
		_G.SAVE_MEMORY[loc][#_G.SAVE_MEMORY[loc]+1] = {Axe.CFrame, Ball.Position, Ball.Velocity}
	end
	
	local function doUserInput(bool) -- Toggle User Input (true = can input, false = can't input)
		Ball.Anchored = not bool
		Ball.CanCollide = bool
		Axe.Anchored = not bool
		Axe.CanCollide = bool
	end
	
	local function playbackFrame(loc, frame)
		if (replayIndex + frame < 1) or (replayIndex + frame > #_G.SAVE_MEMORY[loc]) then return end
		Axe.CFrame = _G.SAVE_MEMORY[loc][replayIndex + frame][1]
		Ball.Position = _G.SAVE_MEMORY[loc][replayIndex + frame][2]
		Ball.Velocity = _G.SAVE_MEMORY[loc][replayIndex + frame][3]
	end
	
	local function removeEndList(lst, index) -- Remove items in list past give index
		local i = #lst
		while i > index do
			table.remove(lst, i)
			i = i - 1
		end
		return(lst)
	end
	
	-- Action Specific Functions --
	local function Record()
		if T_Record then
			if not T_Replay then 
				_G.SAVE_MEMORY[4] = {} 
			else
				T_Replay = false
				doUserInput(true)
			end
			--_G.RecordingIndicator()
			recallibratePlayer()
			replayIndex = #_G.SAVE_MEMORY[4]
			while task.wait(time) and T_Record do
				_G.RecordingIndicator()
				CurAction.Text = "Recording"
				writeFrameToMemory(4)
				replayIndex += 1
			end
		end
	end
	
	local function Replay()
		recallibratePlayer()
		if T_Replay then
			_G.PlaybackIndicator()
			doUserInput(false)
			T_Record = false
			while T_Replay and (replayIndex ~= #_G.SAVE_MEMORY[4] or T_Pause or T_Rewind or T_Forward ) do
				playbackFrame(4, replayDir)
				replayIndex += replayDir
				if replayIndex > #_G.SAVE_MEMORY[4] then replayIndex = #_G.SAVE_MEMORY[4] end
				if replayIndex < 1 then replayIndex = 1 end

				if not (T_Pause or T_Forward or T_Rewind) then CurAction.Text = "Playing back" end

				if replayDir == -1 then
					local rws = input_2.Text
					if (rws == nil or tonumber(rws) == nil ) then rws = input_2.PlaceholderText end
					rws = tonumber(rws)/100
					task.wait(time/rws)
				elseif T_Forward then
					local ffs = input_3.Text
					if (ffs == nil or tonumber(ffs) == nil ) then ffs = input_3.PlaceholderText end
					ffs = tonumber(ffs)/100
					task.wait(time/ffs)
				else
					local pbs = input.Text
					if (pbs == nil or tonumber(pbs) == nil) then pbs = input.PlaceholderText end
					pbs = tonumber(pbs)/100
					task.wait(time/pbs)
				end
			end
			_G.TurnOffIndicator()
			T_Replay = false
			T_Pause = false
			T_Forward = false
			T_Rewind = false
			doUserInput(true)
		end
	end
	
	-- Keys Pressed --
	UIP.InputBegan:Connect(function(key, gameProcessedEvent)
		if gameProcessedEvent then return end
		if key.UserInputType == Enum.UserInputType.Keyboard then
			
			-- Auto Record Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[1].Text) then
				T_AutoRec = not T_AutoRec
				if T_AutoRec then autoRecIndicator.Text = "Auto Record: On"
				else autoRecIndicator.Text = "Auto Record: Off" end
			end
			-- Clear Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[2].Text) then
				_G.SAVE_MEMORY[4] = {} -- Clear Recording Data
				_G.TurnOffIndicator()
				T_Replay = false
				T_Record = false
				T_Pause = false
				T_Forward = false
				T_Rewind = false
				doUserInput(true)
			end
			-- Fast Forward Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[3].Text) and not T_Rewind and not T_Record and T_Replay then
				T_Forward = true
				CurAction.Text = "Fast forwarding"
				replayDir = 1
			end
			-- Manual Recording Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[4].Text) then
				T_Record = not T_Record
				if T_Replay then _G.SAVE_MEMORY[4] = removeEndList(_G.SAVE_MEMORY[4], replayIndex) end
				Record()
			end
			-- Playback Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[5].Text) then
				if not T_Record then
					CurAction.Text = "Playing back"
					T_Replay = not T_Replay
					replayIndex = 1
					replayDir = 1
					Replay()
				end
			end
			-- Rewind Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[6].Text) and not T_Forward and (T_Replay or T_Record) then
				if T_Record then T_Record = false end
				T_Rewind = true
				CurAction.Text = "Rewinding"
				replayDir = -1
				if not T_Replay then 
					T_Replay = true 
					Replay() 
				end
			end
			-- Pause Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[7].Text) and (T_Replay or T_Record) then
				if T_Record then T_Record = false end
				T_Pause = not T_Pause
				if T_Pause then CurAction.Text = "Paused" replayDir = 0 end
				if not T_Pause then replayDir = 1 end
				if not T_Replay then 
					T_Replay = true 
					Replay() 
				end
			end
			-- Skip Ahead Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[8].Text) and not T_Record then
				T_Pause = true
				replayDir = 0
				CurAction.Text = "Paused"
				playbackFrame(4, 1)
				if replayIndex ~= #_G.SAVE_MEMORY[4] then replayIndex += 1 end
				if not T_Replay then 
					T_Replay = true 
					Replay() 
				end
			end
			-- Skip Back Key Pressed --
			if key.KeyCode == FindKeyCode(keybindInputs[9].Text) then
				if T_Record then T_Record = false end
				T_Pause = true
				replayDir = 0
				CurAction.Text = "Paused"
				playbackFrame(4, -1)
				if replayIndex ~= 1 then replayIndex -= 1 end
				if not T_Replay then 
					T_Replay = true 
					Replay() 
				end
			end
		end
	end)
	
	-- Keys Released --
	UIP.InputEnded:Connect(function(key, gameProcessedEvent)
		if key.UserInputType == Enum.UserInputType.Keyboard then
			
			-- Fast Forward Key Released --
			if key.KeyCode == FindKeyCode(keybindInputs[3].Text) and T_Forward then
				T_Pause = true
				T_Forward = false
				CurAction.Text = "Paused"
				replayDir = 0
			end
			-- Rewind Key Released --
			if key.KeyCode == FindKeyCode(keybindInputs[6].Text) and T_Rewind then
				T_Pause = true
				T_Rewind = false
				CurAction.Text = "Paused"
				replayDir = 0
			end
			
		end
	end)
	
	GuiToggle.MouseButton1Up:Connect(function() -- Menu opened/closed
		-- Open Gui
		if menuOpen then
			CurAction.TextXAlignment = "Left"
			CurAction.TextYAlignment = "Top"
			TweenIcon(115, 0, 0, -8, 2, 90)
			ResizeGui(150, 100)
			
			MainGui.Visible = false
			SettingsGui.Visible = false
			TASGui.Visible = false
			GhostGui.Visible = false
			
			menuOpen = false
			GuiToggle.Text = ">"
		
		else
			CurAction.TextXAlignment = "Center"
			CurAction.TextYAlignment = "Center"
			TweenIcon(720, 0, 10, 10, 381, 178)
			ResizeGui(GuiSizeX, GuiSizeY)
			
			MainGui.Visible = true
			if curSubMenu == 2 then SettingsGui.Visible = true end
			if curSubMenu == 3 then TASGui.Visible = true end
			if curSubMenu == 4 then GhostGui.Visible = true end
			
			menuOpen = true
			GuiToggle.Text = "<"
	
		end
	end)
	
	Clear.MouseButton1Up:Connect(function() -- Clear button pressed
		_G.SAVE_MEMORY[4] = {}
	end)
	
	Settings.MouseButton1Up:Connect(function() -- Settings button pressed
		if curSubMenu == 2 then 	-- On Setting Gui
			curSubMenu = 1
			SettingsGui.Visible = false
			ResizeGui(700, 350)
		else						-- On Other Gui
			curSubMenu = 2
			SettingsGui.Visible = true
			TASGui.Visible = false
			GhostGui.Visible = false
			ResizeGui(700, 570)
		end
	end)
	
	TAS.MouseButton1Up:Connect(function() -- TAS button pressed
		if curSubMenu == 3 then 	-- On TAS Gui
			curSubMenu = 1
			TASGui.Visible = false
			ResizeGui(700, 350)
		else						-- On Other Gui
			curSubMenu = 3
			TASGui.Visible = true
			SettingsGui.Visible = false
			GhostGui.Visible = false
			ResizeGui(700, 720)
		end
	end)

	Ghost.MouseButton1Up:Connect(function() -- TAS button pressed
		if curSubMenu == 4 then 	-- On TAS Gui
			curSubMenu = 1
			GhostGui.Visible = false
			ResizeGui(700, 350)
		else						-- On Other Gui
			curSubMenu = 4
			GhostGui.Visible = true
			SettingsGui.Visible = false
			TASGui.Visible = false
			ResizeGui(700, 720)
		end
	end)
	
	for i, but in pairs(keybindInputs) do -- Keybind assigning buttons pressed
		but.MouseButton1Up:Connect(function()
			Gui.Parent.KeyCodeSelector.Visible = true 
		
			while _G.curKey == _G.prevKey and Gui.Parent.KeyCodeSelector.Visible == true and wait(0.01) do
				-- wait
			end
			
			but.Text = _G.curKey
			_G.prevKey = _G.curKey
		end)
	end

	lPlyr.CharacterAdded:Connect(function(Char)
		_G.TurnOffIndicator()
		T_Replay = false
		T_Record = false
		T_Pause = false
		T_Forward = false
		T_Rewind = false
		doUserInput(true)
		task.wait(time)
		if T_AutoRec then
			local timer = game.Players.LocalPlayer.PlayerGui:WaitForChild("Timer").timer
			while timer.Text == "00:12.631" and task.wait() do
				-- wait
			end
			_G.SAVE_MEMORY[4] = {}
			_G.RecordingIndicator()
        	T_Record = true
        	Record()
      	end
	end)
	
	while true and task.wait(0.01) do
		_G.TAS = true
		recallibratePlayer()
		if _G.T_Ghost then
			ghostIndicator.Text = "Ghost: On"
		else
			ghostIndicator.Text = "Ghost: Off"
		end
		if  lPlyr.PlayerGui:WaitForChild("LevelEndCard").Enabled then 
			if T_AutoRec then T_Record = false end
			if (#_G.SAVE_MEMORY[5] > #_G.SAVE_MEMORY[4] or #_G.SAVE_MEMORY[5] == 0) and T_AutoSet then T_ShouldReplaceRun = true end
		end
		if not(T_Record or T_Forward or T_Replay or T_Rewind or T_Pause) then CurAction.Text = "No Action" end
		if not T_Replay and not T_Record then
			_G.TurnOffIndicator()
		end
	end
end
coroutine.wrap(STUDIOS_GuiLocalScript)()
local function STUDIOS_IconLocalScript() -- Icon.IconLocalScript 
	local script = Instance.new('LocalScript', Icon)

	-- Icon --
	local icon = script.Parent
	
	-- Indicator --
	dot = icon.TextLabel
	
	-- States --
	on = "●"
	off = ""
	
	_G.RecordingIndicator = function()
		dot.Visible = true
		dot.TextColor3 = Color3.new(0.666667, 0.113725, 0.12549)
	end
	
	_G.PlaybackIndicator = function()
		dot.Visible = true
		dot.TextColor3 = Color3.new(0.109804, 0.976471, 0.168627)
	end
	
	_G.TurnOffIndicator = function()
		dot.Visible = false
	end
	
	local bool = true
	while task.wait(0.5) and true do
		bool = not bool
		if bool then
			dot.Text = on
		else
			dot.Text = off
		end
	end
end
coroutine.wrap(STUDIOS_IconLocalScript)()
local function STUDIOS_KeyCodeLocalScript() -- KeyCodeSelector.KeyCodeLocalScript 
	local script = Instance.new('LocalScript', KeyCodeSelector)

	-- Main Gui --
	local Gui = script.Parent
	
	-- X button --
	local closeBut = Gui.Close
	
	-- Scrolling Frame --
	local Scroll = Gui.ScrollingFrame
	local TBut = Scroll.TextButtons
	
	local scrollButtons = {
		TBut.Mid1,
		TBut.Mid2,
		TBut.Mid3,
		TBut.Mid4,
		TBut.Mid5,
		TBut.Mid6,
		TBut.Mid7,
		TBut.Mid8,
		TBut.Mid9
	}
	
	local buttonNames = {
		"No Keybind",
		"A",
		"B",
		"C",
		"D",
		"E",
		"F",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"T",
		"U",
		"V",
		"W",
		"X",
		"Y",
		"Z",	
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"0",
		";",
		"=",
		"[",
		"]",
		"-"
	}
	
	Scroll.CanvasSize = UDim2.new(0, 0, 0, #buttonNames*50) -- Open Position
	
	
	-- Close Gui if Buttons Pressed
	for i, but in pairs(scrollButtons) do
		but.MouseButton1Up:Connect(function() -- Menu opened/closed
			-- Close Gui
			_G.curKey = buttonNames[math.floor(loopScrollPos(9, 50, i, Scroll.CanvasPosition.Y)/50)+1]
			Gui.Visible = false
		end)
	end
	
	closeBut.MouseButton1Up:Connect(function() -- Menu opened/closed
		-- Close Gui
		Gui.Visible = false
	end)
	
	-- Find position to tween to--
	function loopScrollPos(numBut, butSize, indx, scrlDst)
		local int = (numBut*butSize)*math.floor((scrlDst+butSize*(numBut-indx))/(numBut*butSize))+butSize*(indx-1)
		if int >= Scroll.CanvasSize.Y.Offset then
			int = (numBut*butSize)*math.floor((scrlDst+butSize*(numBut-indx))/(numBut*butSize))+butSize*(indx-1) - (numBut*butSize)
		end
		return int
	end
	
	-- Main loop --
	while true and wait(0.01) do
		local scrollDist = Scroll.CanvasPosition.Y
		for i, but in pairs(scrollButtons) do
			local yPos = loopScrollPos(9, 50, i, scrollDist)
			but.Text = "Keyboard Input:  "..buttonNames[math.floor(yPos/50)+1]
			but:TweenPosition(
				UDim2.new(0, 0, 0, yPos), -- Open Position
				"Out",		-- Easing Direction
				"Quad",		-- Easing Type
				0,		-- Motion time (seconds)
				false		-- Override any other tweens
			)
		end 
	end
end
coroutine.wrap(STUDIOS_KeyCodeLocalScript)()
local function STUDIOS_TASImportAndExport() -- TASFrame.TASImportAndExport 
	local script = Instance.new('LocalScript', TASFrame)

	-- Main Gui --
	local Gui = script.Parent
	
	-- Scrolling Frame --
	local Scroll = {
		Gui.SaveSlots.Text.ScrollingFrame1,
		Gui.SaveSlots.Text.ScrollingFrame2,
		Gui.SaveSlots.Text.ScrollingFrame3
	}
	
	-- Buttons
	local addBut = Gui.SaveSlots.Buttons.AddBox
	local removeBut = Gui.SaveSlots.Buttons.RemoveBox
	local clearBut = Gui.SaveSlots.Buttons.ClearSlot
	
	-- Text Boxes
	local boxes = Gui.Boxes
	local boxInput = {
		1, 1, 1
	}
	local textPos = {
		0, 0, 0, 0, 0
	}
	
	local curSave = 1
	
	-- Variables
	local scrollText = {
		{Scroll[1].TextBox1, Scroll[1].TextBox2, Scroll[1].TextBox3, Scroll[1].TextBox4, Scroll[1].TextBox5},
		{Scroll[2].TextBox1, Scroll[2].TextBox2, Scroll[2].TextBox3, Scroll[2].TextBox4, Scroll[2].TextBox5},
		{Scroll[3].TextBox1, Scroll[3].TextBox2, Scroll[3].TextBox3, Scroll[3].TextBox4, Scroll[3].TextBox5}
	}
	
	local scrollDist = 0
	local prevScrollDist = 0
	
	local compDataSplits = {
		{}, {}, {}
	}
	
	-- Find position to tween to--
	local function loopScrollPos(numBut, butSize, indx, scrlDst, save)
		local int = (numBut*butSize)*math.floor((scrlDst+butSize*(numBut-indx))/(numBut*butSize))+butSize*(indx-1)
		if int >= Scroll[save].CanvasSize.Y.Offset then
			int = (numBut*butSize)*math.floor((scrlDst+butSize*(numBut-indx))/(numBut*butSize))+butSize*(indx-1) - (numBut*butSize)
		end
		return int
	end
	
	local function updatePosition(save)
		curSave = save
		prevScrollDist = scrollDist
		local butSize = 150
		local width = 408
		if boxInput[curSave] == 1 then butSize = 200 end
		if boxInput[curSave] == 1 then width = 420 end
		scrollDist = Scroll[save].CanvasPosition.Y
		for i, but in pairs(scrollText[save]) do
			Scroll[curSave].CanvasSize = UDim2.new(0, 0, 0, boxInput[curSave]*butSize)
			but.Position = UDim2.new(0, 0, 0, loopScrollPos(5, butSize, i, scrollDist, save))
			but.Size = UDim2.new(0, width, 0, butSize)
		end 
	end
	
	local function updateText(save)
		curSave = save
		local butSize = 150
		for i, but in pairs(scrollText[save]) do
			local yPos = loopScrollPos(5, butSize, i, scrollDist, save)
			local indx = math.floor(yPos/butSize)+1
			if indx < 1 then indx += 5 end
			but.PlaceholderText = "Save Data Chunk "..tostring(indx)

			if textPos[i] ~= indx then
				if compDataSplits[curSave][indx] ~= nil then 
					but.Text = compDataSplits[curSave][indx]
				else 
					but.Text = "" 
				end
			else
				if but.Text == "" then compDataSplits[curSave][indx] = nil
				else compDataSplits[curSave][indx] = but.Text end
			end
			textPos[i] = indx
		end 
	end

	local function updatePositionAndText(save)
		updatePosition(save)
		updateText(save)
	end
	
	local function termLog(text)
		Gui.SaveSlots.Buttons.Terminal.Text = "Terminal: "..text
	end
	
	addBut.MouseButton1Up:Connect(function() -- Add box
		boxInput[curSave] += 1
	end)
	
	removeBut.MouseButton1Up:Connect(function() -- Remove box
		if boxInput[curSave] ~= 1 then boxInput[curSave] -= 1 end
	end)
	
	_G.SaveTo.MouseButton1Up:Connect(function() -- Save Recording as Key
		termLog("")
		if #_G.SAVE_MEMORY[4] == 0 then termLog("Error: No recording found to convert") return end

		_G.SAVE_MEMORY[curSave] = {}
		compDataSplits[curSave] = {}
		for _, but in pairs(scrollText[curSave]) do
			but.Text = ""
		end
		boxInput[curSave] = 1
		updatePosition(curSave)

		compDataSplits[curSave] = {}
		local data = _G.WriteMemoryToCompressedString(_G.SAVE_MEMORY[4])
	
		local divs = math.ceil(#data/16300)
	
		local temp = "Data Chunk 1:["..tostring(divs).."]"..string.sub(data, 1, 16300)
		compDataSplits[curSave][#compDataSplits[curSave]+1] = temp
		local i = 2
		while i <= divs do
			temp = "Data Chunk "..tostring(i)..":"..string.sub(data, 1 + 16300*(i-1), 16300*i)
			compDataSplits[curSave][#compDataSplits[curSave]+1] = temp
			i += 1
		end
		boxInput[curSave] = divs
		textPos = {nil, nil, nil, nil, nil}
		updateText(curSave)
		termLog("Saved!")
	end)
	
	_G.LoadTo.MouseButton1Up:Connect(function() -- Load Key from TextBox to Memory
		termLog("")
		if #compDataSplits[curSave] == 0 then termLog("Error: No data found to load") return end
		local tempTerm = false
		local tempTermIndx = 0
		for i, dat in pairs(compDataSplits[curSave]) do 
			if tempTermIndx + 1 ~= i then 
				tempTerm = true
			end
			if not tempTerm then tempTermIndx = i end
		end
		if tempTerm then termLog("Error: Data chunk missing, chunk "..tostring(tempTermIndx+1)) return end
		local divs = string.split(compDataSplits[curSave][1], "[")[2]
		divs = tonumber(string.split(divs, "]")[1])
		if divs ~= #compDataSplits[curSave] then termLog("Error: Too many/little data chunks found, need "..tostring(divs)..", found "..tostring(#compDataSplits[curSave])) return end
	
		local out = ""
		for i, dat in pairs(compDataSplits[curSave]) do 
			local temp = string.sub(dat, 1, #dat)
			while string.sub(temp, 1, 1) ~= ":" do
				temp = string.sub(temp, 2, #temp)
			end
			if i == 1 then temp = string.sub(temp, 4, #temp) end
			temp = string.sub(temp, 2, #temp)
			out = out..temp
		end
		_G.SAVE_MEMORY[curSave] = out
		_G.SAVE_MEMORY[4] = _G.ReadMemoryFromCompressedString(out)
		termLog("Loaded!")
	end)

	_G.LoadDataFrom = function(save) -- Non-local data loading from save file (ghost)
		if #compDataSplits[save] == 0 then return false end
		local divs = string.split(compDataSplits[save][1], "[")[2]
		divs = tonumber(string.split(divs, "]")[1])
		if divs ~= #compDataSplits[save] then return false end

		local out = ""
		for i, dat in pairs(compDataSplits[save]) do 
			local temp = string.sub(dat, 1, #dat)
			while string.sub(temp, 1, 1) ~= ":" do
				temp = string.sub(temp, 2, #temp)
			end
			if i == 1 then temp = string.sub(temp, 4, #temp) end
			temp = string.sub(temp, 2, #temp)
			out = out..temp
		end
		_G.SAVE_MEMORY[save] = out
		_G.SAVE_MEMORY[6] = _G.ReadMemoryFromCompressedString(out)
		return true
	end
	
	clearBut.MouseButton1Up:Connect(function() -- Clear Slot Save
		_G.SAVE_MEMORY[curSave] = {}
		compDataSplits[curSave] = {}
		for _, but in pairs(scrollText[curSave]) do
			but.Text = ""
		end
	end)
	
	-- Main loop --
	while true and wait(0.01) do
		if _G.TB1.Visible then
			updatePositionAndText(1)
		elseif _G.TB2.Visible then
			updatePositionAndText(2)
		elseif _G.TB3.Visible then
			updatePositionAndText(3)
		end
		boxes.Text = boxInput[curSave]
	end
end
coroutine.wrap(STUDIOS_TASImportAndExport)()
local function STUDIOS_GhostLocalScript() -- GhostFrame.GhostLocalScript 
	local script = Instance.new('LocalScript', GhostFrame)

	-- Main Gui
	local Gui = script.Parent
	local transparency = Gui.transparency
	
	-- Buttons --
	local toggleGhostBut = Gui.ToggleGhost
	local autoSetBut = Gui.AutoSet
	local recMemBut = Gui.SaveData.RecMem
	local save1But = Gui.SaveData.Save1
	local save2But = Gui.SaveData.Save2
	local save3But = Gui.SaveData.Save3
	
	-- Ghost Creation
	local GhostIterator = 1
	
	local Player = game.Players.LocalPlayer.Name
	
	local FolderClone = game.Workspace.TerrainCursorPart
	local Clone = FolderClone:Clone()
	
	Clone.Name = "Temp"
	Clone.Parent = game.Workspace.playerModels
	
	local PM = game.Workspace.playerModels
	local MClone = PM:WaitForChild(Player)
	local Clone = MClone:Clone()
	local Ghost = Instance.new("Part")
	Ghost.Parent = PM
	Ghost.Name = "Ghost"
	Ghost.CanCollide = true
	Ghost.Anchored = true
	
	Clone.Name = Player
	Clone.Parent = PM.Temp
	m1    = PM.Temp:WaitForChild(Player).ball
	m1.Parent = PM.Ghost
	m2    = PM.Temp:WaitForChild(Player).axe
	PM.Temp:WaitForChild(Player).axe.hitCatch:Destroy()
	m2.Parent = PM.Ghost
	PM.Temp:Destroy()
	
	Ghost.ball.Anchored = true
	Ghost.axe.Anchored = true

	Ghost.ball.emitterPart:Destroy()
	
	GhostIterator = 1
	
	-- Functions --
	
	local function showGhost()
		local vis = input_4.Text
		if (vis == nil or tonumber(vis) == nil ) then vis = input_4.PlaceholderText end
		vis = tonumber(vis)/100
		Ghost.ball.Transparency = vis
		Ghost.axe.Transparency = vis
		Ghost.axe.handle.Transparency = vis
	end
	
	local function hideGhost()
		Ghost.ball.Transparency = 1
		Ghost.axe.Transparency = 1
		Ghost.axe.handle.Transparency = 1
	end
	hideGhost()
	
	local function moveGhost()
		if GhostIterator > #_G.SAVE_MEMORY[5] then GhostIterator = #_G.SAVE_MEMORY[5] end
		if #_G.SAVE_MEMORY[5] ~= 0 then
			Ghost.axe.CFrame = _G.SAVE_MEMORY[5][GhostIterator][1]
			Ghost.ball.Position = _G.SAVE_MEMORY[5][GhostIterator][2]
			--Ghost.ball.Velocity = _G.SAVE_MEMORY[5][GhostIterator][3]
		end
		if GhostIterator < #_G.SAVE_MEMORY[5] then GhostIterator += 1 end
	end
	
	local nextSaveLoad = 0
	
	local function termLog(text)
		Gui.Terminal.Text = "Terminal: "..text
	end
	
	recMemBut.MouseButton1Up:Connect(function()
		termLog("")
		_G.UpdateGhostTAS = false
		if #_G.SAVE_MEMORY[4] == 0 then termLog("Error: No valid run found in recording memory") return end
		_G.SAVE_MEMORY[6] = _G.SAVE_MEMORY[4]
		_G.UpdateGhostTAS = true
		termLog("Loaded recording!")
	end)
	
	save1But.MouseButton1Up:Connect(function()
		termLog("")
		_G.UpdateGhostTAS = false
		if not _G.LoadDataFrom(1) then termLog("Error: No valid run found in save 1 memory") return end
		_G.UpdateGhostTAS = true
		termLog("Loaded save 1!")
	end)
	
	save2But.MouseButton1Up:Connect(function()
		termLog("")
		_G.UpdateGhostTAS = false
		if not _G.LoadDataFrom(2) then termLog("Error: No valid run found in save 2 memory") return end
		_G.UpdateGhostTAS = true
		termLog("Loaded save 2!")
	end)
	
	save3But.MouseButton1Up:Connect(function()
		termLog("")
		_G.UpdateGhostTAS = false
		if not _G.LoadDataFrom(3) then termLog("Error: No valid run found in save 3 memory") return end
		_G.UpdateGhostTAS = true
		termLog("Loaded save 3!")
	end)

	toggleGhostBut.MouseButton1Up:Connect(function()
		_G.T_Ghost = not _G.T_Ghost
		if _G.T_Ghost then toggleGhostBut.Text = "Toggle ghost: On"
		else toggleGhostBut.Text = "Toggle ghost: Off" end
	end)

	autoSetBut.MouseButton1Up:Connect(function()
		T_AutoSet = not T_AutoSet
		if T_AutoSet then autoSetBut.Text = "Auto set recording to ghost: On"
		else autoSetBut.Text = "Auto set recording to ghost: Off" end
	end)
	
	local function updateSaveData()
		_G.SAVE_MEMORY[5] = _G.SAVE_MEMORY[6]
		_G.UpdateGhostTAS = false
	end
	
	
	game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
		if _G.T_Ghost then
			local timer = game.Players.LocalPlayer.PlayerGui:WaitForChild("Timer").timer
			if T_AutoSet then
				if #_G.SAVE_MEMORY[4] == 0 then 
					termLog("Warning: Found no recording data; keeping old data")
					return
				end
				if (#_G.SAVE_MEMORY[5] > #_G.SAVE_MEMORY[4] or #_G.SAVE_MEMORY[5] == 0) and T_ShouldReplaceRun then 
					GhostIterator = #_G.SAVE_MEMORY[4]
					_G.SAVE_MEMORY[5] = _G.SAVE_MEMORY[4]
					T_ShouldReplaceRun = false
				end

				--_G.UpdateGhostTAS = true
				termLog("Auto save loaded!")
			end
			while timer.Text == "00:12.631" and task.wait() do
				-- wait
			end
			GhostIterator = 1
			showGhost()
		else
			hideGhost()
		end
	end)
	
	while task.wait(time) do
		if _G.UpdateGhostTAS then updateSaveData() end
		if _G.T_Ghost then moveGhost() end
		Ghost.ball.Velocity = Vector3.new(0, 0, 0)
	end
end
coroutine.wrap(STUDIOS_GhostLocalScript)()
