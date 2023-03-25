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
		1, 1, 7
	}
	local textPos = {
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0}
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

			if textPos[curSave][i] ~= indx then
				if compDataSplits[curSave][indx] ~= nil then 
					but.Text = compDataSplits[curSave][indx]
				else 
					but.Text = "" 
				end
			else
				if but.Text == "" then compDataSplits[curSave][indx] = nil
				else compDataSplits[curSave][indx] = but.Text end
			end
			textPos[curSave][i] = indx
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
		textPos[curSave] = {nil, nil, nil, nil, nil}
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

	-- ManlyTorch Run --
	compDataSplits[3] = {
		"Data Chunk 1:[7]19,8562,29982|-9321,2803,-65,100,!3 -!3!1!3!5!5 9 2 9!& 2 3 1!&!-!/!6!, 1 2!/ 1 5!C!#!%!'!)!5 6!+!8!4!,!7!2!V!F!!!=!? 3 0 8!,!S!W!, 2!a!0 5 4!,!N!? 7 9!E 6 2!0!Y!:!t!9!e!]!>!'!`!+!-!C!5!=!s 1 4 9!l!$!n 9!R!X!x!F!U!v!z!?!= 7!, 5!b![ 3 7!J 4!E!m!' 7 8!s - 5#6#1!e#H![!<!{ 2!=!5 5 6!y#>!b 1 3#(!!#*#A 7!k#E!J!u#I#a#K!^!'!(#D!j!y!j#% 3#^#@ 2 7 6!C 5#%#c#.!Z!;#e#N 6#X!L!y 6 4#R!H#6#Y!O#p 5#P#w!v#J#y#M!I#9#'!y 7!=!0#N#)$( 7#;!, 4#U#v!w#x!l#z 2#>$=$&!5 8!H!0 1$&#o$5#D$#$A$-$@#3#f!`$=!E$I 9$$$K$'!n 0$& 4!k$.$S!y#L#4#&$=#^!;!o!t#9 9$#!k 2#r!E 4!s!p!,!$ ,$|$z![$/!3!%$r$=!& 8#9!1#p!t#D!p#,!'$>!C 4!3#q!c!/!. ,%6%!$C 8#(!%%;%4 ,#8!G!a!k 9$N!.%?!(!E$< 4!M!&!{%O!e#y%>!'!K!C 3!b$&!B%) ,!<!l$!!/!g%& - 3#R!5!U$f#d%0!%$E${#R -!(!G!`#6%_!!#8#U$]$&#m${%.!/% $|!F%#%W 0%Y#^$R -#&$k 8#?!L#% 8#B${!~%D -$J ,&:#E#9#2$i!'$b%r 3!~ 4%]#t!+&<$r&F!0$J&C#D 7$&$! ,&S -&Q!y$/!? 0$3%g#D&% 1$v%:$q%Z#($M&L%g!M!5$d ,&l!!#2&Y&A$k%g%j%* 7$M%:#? 3#i&a%0&t!l%M!3$X%y&X$C%a 1 9&0!f#X#V!G!o!+$5$9!&&a!1'-!l&v!0$N&>$h#$!0$r%r%t&-!C 1%>!&#|'(#G!j'B%*!Y!!%`%E&p'(!T!>#^%,'D!G%H#R 6$N$)!0$>$&'X!U%g$}'R''!z!T%)##%r!B!f 0%9&U!<#t'a!g!f'n!Y#D#D'e&?!='k%h!f!E'7%s$M']%.!@#G%h#X!I'h%r'y'S'j'; 9(.#^#9#{!& 5#X!<(/#V'w%s#^!U(='h%<(4((##!~'c#m!k&8!<'/!H#F!f!~(6$L!G!M#X'~!#';(&$8#E!f#>!s 5#?!g$$!g'c%.&f'|(k'i#L$e 6 6(9%3($&{%C(*&)$L&8!O!!&f!~'/(~(o!=(q(/%s##'x(/$*!l'*#U!B##!;&f(C#n(Z'>%&!K&<(A!C#p'q&m$q)/!t!r'Z!l)4!G)6)%)9 5(w&-)7%s!o!s&,!>(V'+%]$q) %u)F)J$e$s!G!b'{!>#R&n!< 0&#&D)`)[$_$_(V(G(p'a!K'0&m'-$]&m(*)r&4(%%]!Y(&)~'O([$e%h(C#R#9%v!/%B!]'*&;(<!G(2!t%E(F([!T!}*0(x!f#B!b%Z$C*-&0'.%r(V* )[)o#e!H 6%j!J',(B'I$<*,#(*@!G#?&f%j)3)% 8(h(`)r&{(.#&#R(#*,!b*R&-(C!Y#9'N(3!<%6%^)!!k*I'E#]!s%~*,%w&8&s!U&+*4'>*I({'E&I*Y%u$x$}(U!%!/&0'n)!'O'5*|#d+&!B&`!T!K*V)i&%(P&I#i&-+-!;'Q&-*!'>'w!B'F!G#%$d$&#]'$!M!%+;'E%.(9%$!;!b&?'*+5!h&-#%#q%r&F$t(=%e*.(%&!${!&!A'!(o'6$L!*(X&A$u!f!@!P$C)g&;!d'Y&9#X$R&,%V)o!B$e%++n!@$8$o'X)T*Q'I+x&<*/*/&9!&&?'q+X'N!''L&m 0!s+p!!'*+*$;+n&V!q']%r#<$B&o+F+E)|#A*~$!,:#?'F&I&W+A!c#X,?,?!-#(#2%>#r$L'%'7#p$F#F,:#n, %`(z,S&V!5&w%:!C 7#/$[&a,^$q#A+m&F%d!~%>)L&;%f#X+}$F$F+y'i%)*/, *B!''^!/#;#6(`&4'+&;*L'.'O!/(%+B![%)$k!B'u&9-*',!A%$!C*@*Q!{->&o&m&E(U(3)z&f!K$&)a-+'@!+(A 8#>%G'%#9'3,+,+'3(G&4)r-<,~-?%Q!J,~!`!b(6-C#7!3&4!,-o#E-L%J({,U-*%a*f&M-p+N%--v%g#6(]#Y${$H!y*Y-;):!,-.,o+M-z,0+h!1&h%}!3% &$-L#Q-N(e.+,u'n(r';-p)g#G&[(K'8)v!!'B)O$I#t,!-=.,'o%s(#&x&V(6#.+J${%G#n#^*u,Z$##G*`!c#A*O!$#G,D%H.5&8$c!+&~&~ 4!~.^!O+3#X#R$)+z,9!i.+)V+v.t!c!s&5&V#9)D-`*%,^!R#[$c(])r.T,E-0.b!-!k,R,R&U,Z#Z!B$6!-%1,{#E'5#^!o,l&4&R,T%:&P#D,+,Z#g,^!C.u!A!?%V&s!o%9)z/1%6%9!D.+%r/J(w, &7%W-o$;(,.z*~&4/H-{%C#9&8#C,F$J*C!K#}%W*=)1#U&P!p,>#P-p#6&]&]-o,Z&a,!,-/s)^/m$_!o#Q+v$&#?!k)M)M%&0!+D!%/k%W'7'*(z.P0*%w&U#?-.'W#n#6,Z%F$7/=$t#&%d!@!J-C&),*%r-7%j!0'h0D&L!H-F$t$u-.!I0L-p'F-j/m(a&9!E,{/=',0D)}&D+^#f'^&A#]*2&9#p+5(S -#^)-&9%w0-,p/e*6,+0Y%,,=*U-{,]&.&C(W)$/p!V,k!>#G%4+z%W!d'F0+,~$M!7*I!~!+0u/m/m(S#/*;/?*+0H#W';%V,U'+$e#B&_%`.[-,&#$m!Z#B$<#&%;-T!1&f&w&#.+$J!7&0.[$A.W'}1S!)!T$*1b!%+u&a%D-Z$!&f&4!5.l!&%S0v%Q#!1S#q#U)L%Y07!J*I*d.+#''k-#'2/ ,k%5#D1A$5$e#Q1;/s$$!L%w2%.x'F.P1<+*(8(N$Z1S(s1|-q1X,{#&1F+J!$!T#q1M%~,}0/1R,k$!!T#r1)!%'I#V$<+J'`$M(`2S%`(=&f/[2@$b!0!S%}%W0p(R!s,D!@(q0b!~#u*V)*&&.+#F190u1X,E!B.?,D)B0#!E'|0a'9)j(G#<%~&a%;,:$M.C!)&T.+&a#%*I'B${1Q!l1O'i#]/Q#|'c/a%Q,l2~/^#8'{$=*',~+z2c![#]2E&w2q3@-2*p3228#Q2t0+ 8,y&73K,k%4#U$;)*05'2,E!E,o2{!j3?!-/ -Z/$2-$4#;'5*s!f2i#(#|(d.+!*'K+h%s!c%[/@#^(s3;!$$$#<3#2i#6#84+3y&[!i/-&P!&,o3y323;#O';&U3-3e2e!q$]/?.#&P']!q3f3].+$E1K,W4;**4/4#)T'a/X/w&T/M,n.J32*C#B)=2i*a.x4#%)10*O#D3Y%C0P%r4d3(&a2J*L4;0[)R3~*~#&+m3}&9#R#~/>-p4F&V*H1G(9/a!7.o)t!-3Y*$/=%.!3&n)e0|,j&:$M+}3-',+&4_.r%v3t.$.d$N!+#2,o&l50'.%W&~(#55'5$E3F!!-.'B*B0C$ (63`-q#4.x+=#(!~(s5#!B,R(n)#)#(V#2#|'u50)!#f,r(B-,3~%D-<'W'h*{+A5-#|-b&Q5A#N*b#V*a4p!7!K5H'e!k*g5p*Y#G4Y!G#f%&$E!+5V*Y$^.;&-*E'o.P5_$ #C1Z5Q!|$|(M'g,X28$M'E!l'c$t0B,F'^30$M.#!_&l!@6*,T$6!B&~!M.[2O396D#]3r.G!_/t$R5V$r#G+)6&-H0v5~#n5p3w(5%*!|%t%B6]$3!H*u-C0P(;6q6D!.1K%H6&,%$Q6L,X+20]6a0b(S1=!s5`*I!J0*6y!A%*&L/H!N$70p6/.T.~&T4R5`#Q6$-x!_$_!@.u,T+m(@'n.+6+&T-Z5<$ !L66(%!|4/%g)D/H'l!0#W%]!c/@#6/5!k5`&F3r,R!_+Y,w!'4p$$7]6a-=+$+$#E7&$ .o+[4$6/!@ 0#}4$7Q6n#Q(C.X6T%f%~5`#W1K0u7`4#&S7Q,H(s7U&V'h'e5M![!S5j#<0R0`(;7?!-#<$e3Y5t%I%`.u8.!R4&';0x'51a&67c!-!S$$%H5A/%$o$o)D5`!=4'8C1G'E$t7V0p(i6?%x$>)@-26D$u8S83+K,$.~8&7s6i'e+/#H!R7r8B8d*[%d!c!a%?)g6i%R%31x1-!c'*8!833>!e#h(6#%(65A/W4D%:%i!Z2T8c6&&a4h%$#7(>'@/-!3,{*L',,{#/#r.1#]5A1m!/!7#7,z&M6.'$.l.Z+'%T8}7A9A91!r1y#s%)892e#0%G2a'a9N!-$b6$&]!7#89T9F0(&Q.p${$A5o9j2u9_#~&g)7!K)M9E&=$o$M-=%j#(-1!!%*)7#-+p9q#I$>9i9U.?$M9t8F2N8F9n(<)v:$9Y+r#09F5b$52?0v.l!;&k9i#P%H+[9b7S$o:5&=/^&w3K9:!E*L/=#/(<5?9Q#08A:E3E7)(&8n%:1I75:/!<2J8^#0!(:'9F,H.-$4#6&U&U,R:N%>9a'=!H+p9u9d2o9i,<&m8z).9^4,:n#I50#I9F+D!.'=9l9n1e![#89p82#I#;$$0(;!(q9I+i' '%% #23E8!2c&})R2E:d$$'^/7#74v4g:u#P#B4'/I'@303M0S&=;#:k3~2%%:4_'i#F;+0b-B%a7R9U$X&})O&h%V- .&;)5>&M+B5u%w!h9U7s';*=!['C)v.G%t;8(r#G$J3o#N+F&w#%#7#<3`;76a%k+.,F#Q.r#C2c#N+u*I&f< 2e'F&n+L+i$z+h;8#889*b%$!%(N;_;C+21/!e,E8H&T#R,E<9/t-V2?5u5*-;#7#F'U:D.5.I!'9{9-;)$*8D4w<=$8!A!J#7$>+S'C#w(E8m<c%915<M!g-T<@#E&{&Z:`-n!b:`8^%_:N$x1`,/;Z/?<b7k!d!g<f/F%:2+=':N%Z'k*~!F<-%5<0/>4d)/1y<x-P/|+U!Z)L1U.(9$2V*8#s#&$e!#<M.!*B8>8|<q)}*Y!v#N;r,Y#7,f'F,l!['o)n)n.P:N!I890+=/#N'c'/$+',291y-r&;=8-m:z%@9H1y<-3#(]$+<k3a.'2;<Q-p;F=R6F-V<,=%37:N0E1m3o)$*y)I(G!L+2-V=N8o0v;u-m=46v$h'.#%(n>*7s8D<<,6.G$<$+9w(r&?3:011R;)&[*K;p%$-V0Y7Z-m&W3+0D8}4S.A=J#'0(=}!e!A+p.o,1>22S7j!R4U:Y>S9n#'-;++>Z8b&m,l$+!{6>;%5#-H.n:>$=*R'F/%'$$u*<%6>@3`7p##6C6x(B9^<d*K0n!F!$%B#p7l0v(6'k<}%:8,!Y;e&k$;#U/g>k;n&a#/$>*C$r2?5,,g&m>F&k5W&M72>{4/$o?9%D!g=_-n0{%C?T?(#r;x?L$}%o.%!Z$#,`4|#0'O']9k?@#Q*K,W+L+}-<?`%40H<4?F>s5#&~?@#'1q44?,3.)`<Y$x%9%e)7-[.t#(-_?w$R>y2c!A4A+&&k.*<n2c#~7j+$<^#S#W=-1y!$;n&i>r)g&f!p1R(/?&6x(/#27n;/:M?](}$x9D${'+8D93'g8k!Y7H![@N1q>s>{%p<q<Y#W+D3Y3K08+.@f,F<{>I9i!$(}!r@W%Z3N%f9z%`$q9~@h%X&M(`>{/-,o=:. )D&g;e%,.G;t8?$=>$!)@,1k0_?0%h+$18)O$~&1& @h!*6W3o@<3I@O7O08(r;%(#.#.#(##27T6$%;?M(=<I37-;1:#S$y%P$=?01s!>3r;3#**V'31s$d#%!j=g=7/{>w,F@p6$><#*)!+6!Z&D>P&F>&.;4h4h.;AF1g(^A,.S:p=Q%g*7#V/!8@&c1^!c@W1s$;;@+}@]'|&D>_&^8^#V5S!R%[(K7E#/A034.??,#N(%%OA=@-$e=a3p&T@&7D=J%h6N,M>k,;#&63&i)i, =g&W:i7WBG#Q'5</>k-#33>N&t/,!a:u30,/,/30B7#'20?[?-'|$;@oBa!tAI=y4e;CBrBg%S!K&h'$!a&GA[${!a!X?[4u%C=B4yBG%Z9c+F=/#C%]$uA{%v.C?k-p#(&,+|=Q1s&D#=)n%$35%E7}B~2j$b=g%a1D#yBG!(0'=o!$7G8.%v'5'q)O%&*u*u02Al$E10=U-B*u:&Al'q$??#%b+s%s$q2c1s<>4P;;%H(tB.!`14'q:9-1*-)N3&B7&gCj#I-&!i@~Co!X+w*W)l(nCw+2Ao#I4O7f1s.B)C=g!U0e0TAl1Y'a@S(g7X%VD,&|8w!Z'e-6D2D,14$*<M!`5z44D:#u0+*W&-!J*TBG&)A_.],6A!#tCND-!1&S$n(b%16@=J8R'K,]=/8e4jB?7s.`AtC4$Y&m:KC8'-08(<9i0s)^CV&i;l$E<Y309_&T$I!x##*Y(q.S%$$5!T%4@`>H$7$z1.>SDb?O!Z#g19*+C=%p#V<y*:A!'`2s.<)|D~E92!Cb$1!J?/E1&F(,8^$I4v$+C'#/#p616g=/(<.`>1.Q61&F5`43:Z# D_A@';@=C=+2&)EN'*.f98:,9LA|,F$u$K2])7>|&#@G!f.a&}3K'w9|9|'w#20]4'<t,u&I*~)2=e;A!y$6A&<VE|$*!7#q<M?J!)?0<n1h9|&k+*3IDkEN#>7)B -?7X%S9zCs?A7I9,/Z%7D_#W1Z.#E%<.@/'Z')&F@W@%/E&V7l(J&|!)<M#Q*d$X9z-o1V3K8O/H77F(!`&3=&5GED5#F`+HC#-V%C0w2=El$u?3;z&{'KE8)NAn@(DjC64g: +qE6%)Dr!$-gC@F|E'DG#)$}%}5;D_1597'=6z#f>~'Z44*`@~)v'C;r9-##Eu$]=N&{%d#rB^)/10!dD#(m)[EN!a%d,9Ep7J!P'o)2)9$#<Y=Y)^GOE1&[,:$bF[&5EOB^#{9c)-$I$2/|-P'=F`)a0W9$#F-.!j@W0K;@!{,k6]BDBF;''A2i=N#k%1!O?$28-a=;4c+*0e3o9z4/<-GT'/!@+F?$H4!a<Y:46x?&:4#/>y,:CX9$FD<-@~2n-T@N!V;6&#-,!v&u'o#N-F%$>^0oA=%%GGCV?z'3H[HN'0,l,%DD-o!g.x&u-1!=?4H=<o%`?8'0+r7><,7,'@#~%j*q$}!*2?Cs%*3%(G92,xC<6'8JDY+G7u%|<D3v4T>eH}8I%1+&=/0k-SH?HxGV=6%w*i<vHmDL',$ED6%Z?;,]:<C=&s!X9k<&'i9s-T#t=o.o3`C30d)a-WF(.5@u'p,FBM!?(e=N&FB)Bb=$@-#S&#:<F:!y=C)aGtGs7A#FA{%><=E$FH%;%;%9#2#V$z$u+YHS2E)L>&G'5e>F44=UJ%5-#V#iFv@C&F2b=cC4.u=O:g&T5V(KA(+='z;w9$'^'5(e8.AV$WI~=w#_BuIg=]-wDr/o40G=$8;j.'C5+^G#IX(g#AC+%$$]E'0 ).)a6K$h6*G1G/Iv!K%d#]@k9`!i)i!;$k=O;e@F3#0?IX7sE%Dz+L+D!p?0J?=O>&*C.>G_+7)a&N>Z8~#f&:!;*=5uGI$U<i.H%?6,>Z&{<oBN!1(w#N@S5ID[@^6x+V,:#,@O#m,]H5:96OHS5f$I#s#(BeB.$I?.!p>_#m'u2V@d7 0]>F:j7X&R>N,k4d!=+$'$%OGb;Q+Z7u(s?@,~0z$=DnFV#6!`*-9J/mHd>F(RJs@o&d%`1;=:!R,l!`'u9J&S+W@d92!P/mD,<6'#=J*I*t>:HJ8A<3KDGQ<W(w##8<A'=J,7>[KPHr5c$h,?!^@o+a%`&_Kl>h$}Ak>{>p#qBR6J!o@~,W4$7p,??@+r7,9-?-BX/6#7$:F$$C${*<$qFW%q5U?^>{BwI}!y8A#pD9(F@eD@+f0/7>HJEO)q>&G4%L#/*C*VJ~($Lg%D9J<2!AJm!?'V!ZHg'{+QD_+m.e=Q&D.10K$ <WJY.H<W'8M9H?%~&D4/9J5?#V1R$3!`FA+i&%+9@OK]+'$8MA*U9y$L*t.2M+6S%g9L#/*<#m7HC:$y:B/qLIL G/*b*b=r!V8^C:=:C:F#<,+u@-G[6*&C*B7H!X0/3qL0,{#B.&JF@lA{(]5:Ja!V??+'4d9J)-&w@;Mo!I@WN!J`.$!x=@&DCV&D8^!S@kFq4&N 5*-J!lE?%L$}E(L0%S)L)7$#Lg.?.K%C&7,yMKNC+gB>L0%,D(!F3V?]IB.z76:[E0?,)v#mMNMM0/>b&T)-G)A=0p7pLTB^5*#~Nb5M&DLWB2%:$<?-<YJ$,n,n0|$**aHT9JHoCt-n<`,%64NvG~4$!v<)NCC@Ns0~!e!<*a!%=g0n72720n!v!SNRL6MM6*3oK5+g'F)O%9Is(1A=%5@V.oK@2I4G:}(#!A/X!R/3+JKZ$B#q5U7nNTBl.&:pOD?r!-3d.+&RB&&;(/NbMk@l'x9TG)LIEh3kB#/#75!v%>2OH'O@%q1R4r*<8u$ 3lB$Os!v$rO[$kO#&E&,5!%VC~P#Ot/!>z#bMoNDO#0w/:9c44FhOFP$OuOs%<DX9JK<MM!q=Z2f%tDE;e!d/4Og''+E*a@pNE-ZIz2f,''+;%&SPN7VPP2]+'LU+':`)Q#I=uD`FEOHFHPBK7+'*/MA*i<EF.%a( PLF@;S87PP#5+'1FN)$nO`3Y)a#,OFB4O+;%!7K2MM7lM^%E&81`#MK03L43=)4{$B#&LW!=M2GF(X=.!7!#>K=&&V*p&R+JNn'a$o.eOl8#5GD).?Ln;%BS4#BU$-)L-,!INr&{%*Op=/!2,:#];e8OI+74QV!{2I>NMj)HEa&A1F)>;e1?/k*iAT2f&LAYMy%]#'<MJg8b;%Fq6.6.Fq$-,o6*<3My'nIm9$!H-Q(AEJ*97kEMPf,?<a!xC:*&*L-B*/!I.G$I/|+zKiQ865LI(}M%%](s<M6G>=DyC5$c-PG$0`L.)v+L5f2FDr29>=B^8y%':y2u+WL.?[( '|((!V05$t(<Jx0/%M0.9NEf5UD<Dc-q#,7l05Ii%0DZ,;,;?&N3I5MFDrGH<Q9-%%.u#8N/%{)E9}9N(iKn!*<,#'&CF_#f+m$1N/(l+G*EN3%^HwDR$E4s*=<=;n$1B.D0#7*|R<S1><H5%?Po5e,N&5E<(a0QS/!g0/&[S'SBJ3S]H4IjDKEn>8N3$E+g'qSfExMG;{%dSb3&))&ASpSf%_-i@C$E!J#ZIpS)STD^%s.u5LS/Op/O>.5?!S>N;{GuL(;4$XHKT$!d!AP}G84'CVRi>=JKA),8La2uSBMSO,7M#U9#+SG>#|B^:D,]E/G$Sx?M>_,%24T4<n>K$|>cN[TI1yHSSuB<RhMF)qTO!2Sh$K1sMtKy%qS/#tO5EIG8) QmTS?]E8*j$AGo,6R6,aRhJ]5Y<,Q9$})L5M4w7i4v=gIDLK7HT8!1B*68*t#<2c:L1<+;''$u6[-ARhE7!t'%%$%z$}Q%O3-4*2I!=/KgMM5M%e.!<$!(P<H!!F<71;.l:9C=CSAm1S6B1R!AME/S!eO84!&TA(C/Mw&lC9!|)7CL*tC>?,#RACMr$BC/-,#m=:@b@k&DMZ?S$=IG'OQHC/UwKP%5@;UUC:3K$e@f&kUo#|5U&{7l)yUuNw&{V&UzV)=NV+Pn>N*$'=M3KnV2#jV4SJV6(VQk19&AUXUvPn3K$$V(.b=N,oL!RwT,K1*=V%$4V@8+VN@VA0HJ+g)(9J1FVU-9VW@~FM+g#;V95U;QNsUwG[VWDn)>MwN(&M)d3|9J'7VU%j%Q9['YN3@}+'RzM7>mUX#eC:A='/=X'.MuJTMw6311(x@;0sPnW)UlV|,rV~%p#m'7998^;*>k*~W(D=9{IVCuV~OR$xU)$|!rA:I>V8E1%QWFOzE%%SM[QjWLF>2I6*&{Gg&#$N'cNP,aO[$35*Fq#<W3*-MlC_%`A5' V~,]KA9-$!O&UgSYPn@o38!!3:V~R6<d!V&Q-n@rLI+$Q.@0%`AR1w8|QQNCRU,g%GD!LI%9C:B.<xI9AdN3!)RmJ..2!T!*Ug2FPcA{3X3ZBtX<LW1}N%G4/92?>[*tKA9.4 PxTA>KNh(e9-A~5FF T&PcB.QSP^&VUa&4RmS}#&Fq2X@k2|P|8.R!Fs-pK[<WMo#r>_1V8DR0RFXRG+%0?t-KS/!#*a!.@O%X0YR?RFPRVv6TCTEjN3$]UiF6!i8Y!.Nr!1Uq%p+T.@&-'<Y$6x#;Ux:*K/HeHw!ONsA{'e9{SKS@*a$JO}/0LnTOXgPaN=$=!+>s?vHJ&B$}1rD)Qo!.TO#<*tEXUV!c:hQG9N-A5U!>:'QA,6TR$!+g!r=[C'7jMQ+LME$]>N09IRIqIy>}GL7zW|1NZ(R8'F5*!27H>y7<S$+&#WHtS<1+>6Ym%%,8Gj@y0YTo5a,8MgE>1cZ:$33_X[$J!?B19$1{)wTU#ACcG>.&>{$oKbXxLP&A0x>K%V.oW#7hH-R2R8OS:wZ'50=DDbBz4M#'7lHZ43Q5YmXS%OE,';&5OEUXJcDlE0-qZG*QZTN'5~2nN%#B1`)#LK5~@n!VH=T!HlYm$x1uLwPs+[,;Kq)d1pN%@g@eH^KQ[3-11`1l2g>Z$>[+E8!U1d+BKaZ^B-N%ZJ!iP:T~.;7]5MHz)jY5'$GUOMY(YQ'aE4$}[,,w7lZS*:8=Ym!jC5#;=Q295'@;#|5**;[-Rm37Z*2uFyC5%4!x29!T0Z>Z#<=9+r.51u:xHRHJ#r5*<{[OEnR)?,-V)R*Y7l%_<w*dTu*%/|$dZ 1_$p@;)c)@%a-n(NXrFq[x'^];NZZ-9Z2c%4$kZm7H30Db,]JtHJ1[?GK';h%(Y+11**$rZn%8(1<H2?'$;M$dZu6G*QKG:w%6Q{@O,lHZV!Ym&Q5~$*=:6GB4?DQY&mY~!VO83f%8[!C)]wKp(53v;37nRAFO,]:DQdYm]2DlZP'F'w.9!e.o&WZmU!%w4c(d^&&4YZ!j[|#C5~@S$d%~>h!x:J-p-6>v#W'o-W[m<+G0.&+I=9Zu)--q-oZ[HJ$r1u(e[^%,( ^:#tWgBf&m3HG CgU>'3F<^U%tA-!F#>'I$>I%?uIe@[MhEdDl8P@y#%:W^l'7^y!x+&-F%RH/,88^^wZ0!o[$^:!SC5>j5*AQ:yI0_*Jg^wZ U/2f_5ZG_8-I?F-H^}<O)?^wY((sYZ9i$#,{$>DJ?G_GY 2P:w1F^wX[NXI!_Q<v&0@O$R+}Z^^o%O44^w[m$xTC!vGZ**8E5*^m-$P-Mh+WZ{V.HrCi^v-R_S7H&L_eRO9N[2^DG9!H)?EE_|Z^&07l_dF9_u_9%NS*[;&SXS^v,o]3Z6$F`#Dl`%N.DlLo$r<vQmAo]3Tl^{N@_F2u$x,l#>63!Q]~I7%N>Y<OX+_;TY)wFq$#!h!3(s(;Q0>m)-[FQj9{(*U>`@$z?a=Q2176'=I^YZ-VM].!(UJ_`%*7$#S6A^=(_n&Q=9FO)i:-)i`M/O^l$RJV=13o&F+$[FV WnMHH^>^[+L`3+0,^:U[[FN3UlWa-*`y,r._[m$yL]<d`HN3.la@H>MhUY^lX1'DV'?r<d)d>-N%WE3&O%aN^S&wGI9wA~^:!)_7T4)rW+.ya(!hFRGI&|6)ac]PQ#[-V@G$.o_K2K=;*6;Q%2_a>?)t@U5*`y+ua/WtQI`q#C1u@cD=VW`ZavaVGW%:'KPr)@%p:&NjVW[!ava}^UL[]NC-)@O?-yah-ya(aq0pE%:_=6bA:&<Y*-Ey@vbGC5#,Qj*m#]b@!O:&HFW`S~V_aN>]70'$J|b5%2b+B}%sb^K9bj`y^K$]_c)}3iac4Mbc)EbQS-_*W<]~W#]O[`^X!oKJ&)<YVKSU_gUr?VJ.#W#U&{a (]>+]y.!IV&xbz0+1iR8$z6oI71?!(_*8{:vMGN>)DDCM2CsGr`9+r'L7HJ$/G=(8|^;(;!a>_av!tIq`PKJ[,.5N>YY?Fbz&:!L(z_r.l[R+I(;3O[-?;[XK{-I%V!L)r[r*d?+N>)i#FNK9kD?<iZ_4+GrWg&I)?^vCx#FMG&$*t$yNP$d4=1VMh]rMQE(;DCVYz6s+vcQNS!LSQ`^7F@k%H4+!r=:<E2}]e$BA^(d18Mh&L]+>Z%/4eJ.J%Zp,mdGcV!LR%Dl'H?zbd%DBW5M-^/ 2lA{],*=7J9-[jBD!vZ5dAH6U`;SNkA($d)-IL7l7x:Ydk!p;D^)/X%69*dU,.O(Y|)CXP/xdP=Q+w&5&5Z'^v$#(d!I]bE+V;@B4eE{D|>U]S0|$d*~DUbO,l5{@,GDe7dvQtOi/je!U2b20v%_Z-A:%H85NcR$!kR!OJ?G1FQW?0]vZZeC0p<)7HU#*'U%dU%p)LLo(~J[@77T(d!rV9JQ_fdU!YGv@~Az%1d[U>'I<)]NCGCEe<#;!b!j]Z5T$tT)dN%9<)V;(UHL9M%<OM2;:q*S#~#p])#We>!S=NY=Hg'S>^4+4,D=_3M7.&Z5f$O=X#?6%5''_l-6!SevPYLI>Jez;D$6Hu)[=Y4F$x+&2wHVR)4&UX(6fV8./~Kj?1fMK%GtHV=,N'e}&l7xTH/$!+e+Q):w#iS*ENfnCL_nH94e[AT.d*;4_n?n%zGw%h*aZ-^:!1cibi5}5$1eZ.&WDqfmMi7se}%0#8IuD^:4H;b;,9f$5OE1VHQ;NH'q4+!#N/`x. G/[x'+3v&[8.6K%d)f^:!*gDDuer0vJQgQ#~</fm(#CIMD!2%8&[In^P#7NOYm!>2l&.gFgeLMdN44]+B.1?0--P_.%Z,?#rK`(Tge6EdN%p2T1AI*>f<THJ#C%8S^(Jge;W>Z4`76+uML+wfv]u+$dBF3I2$E-x'$-V!beoA{Xc/2Of]udLOmh2.u3_h5!Yf;FS]c!c,D]f[b(V2gB.6K$tFh]!,LM[Yi?+?+?['$>B&ThPhN#fRGG0)?fPhG4CPkBqhh'o%cg*%~O6UXY8hje80r%Cg{/i[x,chjM86K.uA8>Z#83v]<M+Un7OgPR8.LNgfW(T5XY%i-hw]iD=!Y5ng4NC,E!.TA.Q%B<3V;.ofu^JM+(j#fS~R8^;Ngg#.Q:#9hK1&l$!&LIe0v**#?'SN53v!rH:<a2f]G>{'u$!NZ74E]TK''0k``!.g*;lDqK$%B$!M8hf/34#HmB-fuRJgF)?XjA:)g4CW=950_&;KIiqTx;AHF57Iw<M^ 6vYx0d*.L^j0+p'^AE(T-b!(<,RvNgg>eM-p]8Ad%<7,hE_A(J$8`)=N3Y%8Rk?`Dm,|DkjLIwU`^kiV*UY+f72lBYF7Dj- URLI(z'^iUh^cW@C?:<Gf4i_jg+zjiK~2l$Jj3a%PHC/,Cj@jt-$jhiq&)fu3Yh?)iREUD.;(rFm3Gjuk1%<#5*p<Lgs<H-#C=<.[:&kX:8]fw#$']*Rh2%8_<DS]cMcfi0y=iKkS/h6(s'Ih2f$0uU<%,(r#i#P6td6kON8&4j{I:J+e-itH+^Oj;R3T>`R2Aif(w#;;zZ_<GZ6#EFt]G+<Wq'H%>k*.u%x%$FJ<G$F#P:K&I&7hX?/jyaQ6K-TPV2n:hf);G/i7#[!0Zk(BNl,!t@CK~jr?0KKj.j,T>f)[qf{$|@z#fk.AOTV74TXTih=%>A{gVi%Ip*p<:9.J5b3B%X.bs(sPE.Q6pX4%@4C_#<F,A&yhVl[!hl^hy3#k:%WiyU 9.,U'2G|N3NI7FF{i*& M|DghjaQ-_'IdaX.]-2AlE$2[7&ATJe=1zP^KXX.ko7FG.iG&7b`SY'H7T!Z7#f$eGGEWL=MgF:`7(9$!*``*^.'H.R2R;=?(]RJf{(`(<f<kWQ[m<$2_ajIX.7 5WGg)>($G6,9%8V>JjAS)wR`Sf&x5WGwjC?g+ofuW^i1ThMfW-%@3vhDgs]wmb'w80B.;t[/M<U8$6kQGgkq%>mb+FT)G=H{./g#+S-o2AF3(e/v[a!g)rT)K+$I&;Lr<n'HYpE1;M1m=o&):hb{E<5|#aQ@3BKOE1!p1`Y.<nhEmrD#)5M '*!O#|f&C149T|;n,MN [u%gRo^F0+.-E)6F%cR-%S!.#c-o/}RC^F+u5>A/'q20kUlphE?Y1fJ3lZOu[|3s3gBn1FQ9M|5wU`js4$,WLRcn;<=(aQ!}*$*O-Bm}n*?`I8mZ0v5M19$6;}nxM49Xn2!/o'WD@tSp^)P;%[T}D,;lU+D)&W$5Mg!ObxWT40<H0#nP2{0NCz)DJe=:$3^^RA8|*`7XRZ##.hWn2?18'2d'X#QEYj;Toi%4oH'*lQ$]*dCZY6@'h}-nEK=kh#:R.;$5J.%s%H'2<$2FOV%B.i?]A6Zu:a(]$PHFd@BD9rOO5s7Hf>IWiU!74H/FT4p-e-lG!H;|5&[;.5!l$g#0K%2/o|cb?r+E@'K0#w6?$f, oH]}om4dGZP543%>:''O2$p_Bo$5cyp-P/;YX+D8X&=Y*62`Q8!*2)>n)u-TI!JI#B])9|*-bPVeHl2,G9p-6x'*2cQb&ck}[0.Q!|[0P''w$5S}&t0:$_``$z*;P''B.,[hOw6xq9=QJS'P!Fj$M{1R;t%?<X$B#,q*]y_,.&?JM{P'L+$Xp7c]/3#pZI'.prqX*YHy%MODa3P'2eq9V.%x$u2?qen{&$qiq^X+43qp[O#X(-U]WhmyUN%Mg%qvM*:8]yjh3oqe1Fr!A6A4qR&xpU[O/k><qL#C'=&$W]qjO3q8h1&M/$a[kQ&c[)[w+89K''!<q`Es0`4G9irB5s)77|6SX&UN%,p+qn*id$``',a!rQ6RNC[wP'+h&wCVOE).O<4d&QQ?rE1PrbO3%~&wXi_,FLj^b3r,.51;Kn`vrH2Y+kQ@+-b5kXb3rZLE@P`jhBO3%S3O5MEf(Xs$#~+]2c>u_FY]UN$FN+s/?&!HF fI#<R~kMfiofHmP(o4[|pv^}!S/ ^9!FZ}bTsC!xJw=(TAZL+ZMGN9&yCbk@8_q2.i'2)gVN39!xsZU/.&8]Gm8`%<sTR'3K9|`omHorcujYg_^lsvP'$3`:)O,=On^!rq79!e- [9jYszoHgCF(Z^7lf)U/U0jv`?eiry7X!*>F%4)ROzt/#Qt1Dk`=ddKyOKOc$>%[f4t<B:c]t?Idr0%[ny=;'))1t!/3t=t%t2t@qR!h@}c&G;ZtU]t#tIsv-!F8'',[,mTd2%2JU;J3tTsusj>mslqEokFOrgQ9)7sgF]t%?U^]A(lP,mkR+l';sK$|]#OwXr#idXUN?7A-3bMCt`%5<Rt%9UeIf&X%@'hAi?UWqW%t]#2?P3mqB#qE<H^g##'w.vU]+p]#@$N{dTp|sOqFV-D=Oj_ qK,&lVuXB$pJ$Bo;+KTHKn> qK,r<!.&0xU$?Vu_q?d=E KnFDqK)?sAj(L*Hwtf/b)L@`,Ef#2?lVsA1RZD[Iux/3L-Wm%4DRNXv!IgDN=Yji%)<H'^V.-!/KNW8^sA:u;p(]ADfwv2b3e..?$dq=%CMzmS=;kuXr%<J 1THF+r$diii#orp(LTlu;R2uk`:YP*.%NosK&l]#?0k]ec9N*Y*d!2XFb%bs!F4(s[G[Wb,6iQ!V*R!)u,#t**+It{orMg;&+/;&!x&0-n-OH+/|hc?d(z1{N -.2q(Uo@&;1F^G<Y&2:wp0$b3lh8Md*(Kxw#+h3Yv]?1Z.U,+E/3!#Xp4+ELkLw#+rQ#?0FR,8+B/_j.#cu^PAS}w%&I)_?I+gtgpS1n[%!Ru:OP,X8|A+*.EU#>Knad:}4$-Vp,^Nj:<q8|/A+v)?&kMEV7pS!d++CNrGZ)Ek!xq#+vO;YY5U9?:}%t)zffVWXt6%XgwP<`GU?dw~M*k~q3@FW-&Q!s-:B^%O6*.o;;Z/,gti%S_,]'wv/TH*@0W];J$r1tti1n-C(;cn_AOxX8+h4&r8W*'*>_'Io0fuDn3<,|DuiMM')7J #LZn3vFe>ex&1FK?A{vzCoxm,]wH=:9<#hx@eW$;AQ;nwz-.'+OwAB._[-[3mgGz<D@D.*wz$tkzI)HLE0G>(.qQ!v:HLEW9YY.,-qu3Ulk/ck'@bwq(,o`hleO])>uA$K%HUd$A<h$@`:tB?~^t[,qK'u'+fT'e,:pRq>.l%hLVRjhnv(.U.&=YIFBNr[Ulb~&kJLd-!e(eV{F~q%clpDU`9{vD?`$(mI^vFa!21v<U'xaAaQ``44`DxwuIqy^v.r!2prADY&TgO<)D!pbC]-3c>Z1'vi9i.n6dc`U].;!pm5xC&(M|CBB{t%#hm>eH%<$!=Gti0v!hn9jpXAK5u5j",
		"Data Chunk 2:,*/&<O<&LJW=Q#>5F]mW4g/+BTI2l/ 4V(r%Q>4?T1x=oeAgh.&m#3vwezT&:%|>NfdWnDr9wZ/'=vVO*CbqK;s5qvt14S?Dc.C&[zchJXcy==W&w=:(</?SAo`&[1y=.30e;OY+FyRK@(S3+=F2rkGeT&;2>''$PHlVsi:P4C/!w?ruiKj^`vmExjzE1%p%@G6>Pz'?D6e?s?Hth@tx)#E=$`N9$=ez'@,KxN!fwV7.UIn`*mE=/%0!8F G@[hQCz--j$]bOL/!(_&:b{X9r$N9{1Z''-t!8wB!1PXZj-*V'gj^:fK5$zc|;jGbAUYH${3MQbF)U'.{jsLcWG+#>N)<,L#{fLl!;f/' zT1#0Nh],rUrVNXAgT?o`KzD|3jQmcCwupY]l<!81@lA&:,-zp,rK5Nc&^MZBq!$*U0EK|dpi~|3@e--CWQXmMc/cWi zzG}FV9NmEX@Cn+p@-@k,?g/N_7YhjhJ2u(<$?S4}#Hwpr#W!XJ]E-io>d}9'))ga+& +`X&?p-}gyj/l?}9z&(<B?JL#,]N(Q3zvc}P179N#8D kY+f%?wwd%#`z }CTJ}E^Mo`VOD3.Of~$?lrG{;R{)}94$|7Di&i,:v(]1VK9S9.>dlM}wXAZYD,IKhn.eBpS6nf7{3:}9{I%FlQ&:SgEpzwjTm<|>-G^M2E!alzLAOO=`CP9&RhL8=I}90V7sG+mn=0nn$Ls Bs&9l&~SO-BwDgC}2e!gyC!|ETZC|}U^''QW+lzW?-&ANuh`, l#_G&l&ls899%t)1kJKQ'@4shC5z!j@OHjq5sBNW.rU+@oL#pNNWoR2TpO%CSJ;(99(Q/9B79wF/U]MBl1Z*Y0ro! ( 0L !K @` nl pr nD '6 ]5 {P JC vR ^v /p ,P Al eA WM t% .R 9s e* OV hJ L]! G _% =@ A] 1h z( *. +5 EG Mh jJ &9 mY _n A1 s> Cn :) Bh t% {I &. Rw qQ M9 i8 z% 5z qy 1s =4 kq sO MB V[ 5z px >' KL >m +5 8R WD E' @7 K# +3 AL c' (0 dG }3 (@ Z  EP >< !) .` Vh =; VW ji X! +3 NZ yw Vt 9i [P!!% ?0 ,r bE y@ 5* )9 Iw {! *~ Hd si 61 A~ Gg -j =H !f cn !L! [ >1 s> C[ 1y b* ,^ bI c_ .m := }_ o) Fb N% >  6)!!: ;_ A~ @W XG Br {n }_! i ^i [; $K c? 1R ar!!% 9> XU QD vX }l 0t p| !< *< .a! u '5 5w 8. BS J4 }8 ^M {~ 33 Y( ,3 Tq!!T BP 5w @W ]6 mX mZ sf -b &} op >l WC w% 5z g+ MU ra MW 6T 2u fP $L Wi N% zg Pa q/ &| E7 S: $7 Z7 I! z- 5z!!U 9c Mi )& <D q< {p c( 31 w! ^! :1 =T Y( !j 0/ =T U] L# %X L| (9 HA Ss X# ~s +W [m vx Hw |9 (r _% }T M+ q[ |U 9N 3) $L gR N% cq <W Cb i[ $L rB K( ?_ *O ru %5 6n F4 D= )r ?R 2c !r -N <! M+ wz _U 6b x& 0V (g bO (Q eQ U] 7A ,P @~ l4 i# lS ot ED 7s YK j& J  NW 2E q.!!e }^ |p!#u 5X +N 8. oS 3. 3o cc $7 CQ nC ZR qB!$M zh po /, }n `, $7 ol ?5 9l v% 2u Dd %%!#. 2b PV z  6o `| Y# Y  =z /c $7 #N K+ 4@ _P )- s> p| i| ow su %5 /^ B< @W S? E7 c! ED #F >_ Dz ,L -n H^ Bm!$s AL +Z c. s' GU *H T- 0X t: `X!$f 6N 7r SH 1U (i yv E:!$/ z) p- M: Y+ q* $7 @< D= 5X cI `` Sd #C pA *A _B!#L /F BA VH %j 6n )g {A =4 !( y0 8k 0S iB p+!%H SQ DL %G MQ _A 0W Tl *C GN!%S {:!%H q: w& 8E sO jB y_ yG (` $8 [Y ,m ED ^R D= (S &Q 2? Ya B1 j+ <7 L) <$ V! >7 v*!%} *p Y5 !>!%2 c6 Tg N#!$% ,m pE %O GI N8 >< !p!&0 >_ _W $l _G x& <2 5G!&8 (d MQ {# B1 cd kM 0x t}!#u 4/ s> G+ ab vQ #b .r Q; ]R ]E <c {O!&M!&* MG += 0/ L] .2 (h!%u w% eI &= l@!#?!%k vz %j +h R> #b 14 #5 xp >T E] h- q> 6_!#D %j 6N Bq DX [~ o} X# xq 75!&t BD (h #>!!e #G sB!&{ E+ u# wW oc cn 9# s> SQ 0I ?G xF!&o on %5 nU lZ F> OK!&* Pb M3 &; Qm DX BA!'7 lY h: Oe!$f ?> hA _* }x +3!&n!'C G. hH P[ [!!%n (R b2 AO &. 9r Cq E+!'P hU <F b5!$~ [~ ,7 %5 }3 X=!&n 6_!$9!$~ 7F ;R C3 u3 5F U= ?T 1X aM DX (l :@ X# ]t Q7 ey u3 >7 #r xw 89 pX !a >7 p. ^! oH ,D hs!$f!$' np WD '5 #, :' ?n 0W AL Aq XH ;3!$& [~ {. Te %{ q2 , !($ AL `! X: By X#!%  :8 =; H8 YD :*!'[ Qj Ul `w [b!#u jQ qa A{ l^ lp ;; tv #5 U) =G Cc 'X!&A (l FZ m< $6 ;{ 9r 09!'[ [^ oK S. JU!#Y 5F &0!#.!&l M? :} Xk #5!#(! y L} }, 9w!%] FS +F 5G!(U }x Ph [| VL H^ E_ 0W G+ 80 I/!(U ;_ #5 I4 b.!)# 0+ 0W p( DC /< OB L4!(2!!= aY S. Cu!#? 6n Fh ff +& 5G!'Y (?!(W Al x# 7| >v Wu 7S Jg @0 %? 6: r!!'h q+ sE Ac kK sf .1 >[ xB ,r 5u t1 pE!'v !R!(' FG /Y!#? E6 OS ?@ zY .* vm!%[ sG Gk tq o? o>!#2 (, s~! r 8v s$ 5? Hh ev )} <% [K 4S Q* Pm!)r '@ C3 a/!)I |t kv -6 :K |K 28 x_ Al )9 &0 f- $$ T3 Aa Gn sl!(B NW )9 M? B? ') B( Gs #l Dx Ig *B |1 *8 O- eN M3 wP [C DR o{ 7S V[ pS fY -N $B 9d!*J M$ AS J< ^} &a!*0 !L @, G2 N0!*O '3 2X F{ xE 'a y` -' BH!$S H, j; kJ 99 L# W< X8 B0 mV #0 0n X] qW BU {7 yv {I M[ @W #T $7 ]V xb 7S JI vm ,B <G lh ~W EH!*R g_ )0 D6!)c %) '= As ;D w2!*O o) #m &W k>!!} vE >| 7S xS vt tW te ^M!)U! g k> #` &% @]!+: `C .[ r: CV ~r *6!#z @X %0 sT ^v 28 v* [e!%Q!!> Dn!!O 7S #t )O F- *. NH 5/ oy Xx!)x 6/ <i 1i!+Y ^} -r %[ @S (< 7e D- .5 5J z* PE!!A!+L `c /> :h vR ;$ 'a!#) .5 *t q{ `h cQ Xk V2!+[ %D!$- <D 5? E(!%)!&W kt!&Y _*!*^ Q[ >& BY v( =1 10 @@ X#!'9 Od uD Mh 1' *^!,2 3B wy w2 5! D<!'j Nl Q' `M!*n AO 3L LS ;3 >j 4r |m xd cO ;J N> Sy S% -9 TJ Y5 /C!+z _T!'R! R _X NS 5w [R 5I i} U0!+` j) ^! EZ N[ |9 bd )  BJ #K za n{ 9V!,[ U! *d ^@!&e R8 0( g+ B^ s% 5Y xm /, oy!+? kh 9< ^Q eA A0 A= j? 0F qE )^ )g `  [  Ac :B [Z (, ;} UV #l rD :m!,[ `  _s g^ iR Sy!*; >c #=!,M *C oy V9 _: cB g} /t ;. A/ 1# hi u- /? }H ]* Tg 59 ^o I2 E7 #a!$x o; sO eN oy LY!)E Mw [1 Q* 3Y M] 8^ (i 3o ?<!,O UG!(Y! m ^& 9p g~ e* &W #{!+. A! oy Us IU 3& X{ hh ) !!y ck %d `} sO {I!-w!!_!(t S; [x!*D!'D pL S) ;J!(l!,t HJ V@ >v %O!-Q v] =C %? TG t% 0V oy!%# $y W8 _. i0 4r B} {J #A Y+ ~:!,O ~5 [h M9 Ce `% 6F Kb [m!%b EO U0 jQ 3_ C0!,  !] s) }9 |r %O dX 6> SP <$ $J 10 (@ z!!%9!%7 }_!,) #{ [& &x !I ~x j. #= >y ?` :; `K :: }_ }3 @  s/ ]X Sg!!o .r @Y!*, s(!.Y %g G$ BY 2F y@ 18 w. vE!!p a6 Al .Y!#> DR mH 4a }b ;` J@ t% <k xE!!J!.K ;t Tu (r 7e }@ N% {. +)!-i :1 vD F3 WR Sp hn yd [` rK 6g (g r8 ~s ds ev &# W8 hX!%b =C!'2!(S )/ s5!*^ zg vc Vd!#u!)/ ]i [m j$ RS #b 08 F< @o VW >v #B!-C i8 92 2J Y5 Y: 5! jV 9E b! ;N w# (Q F< ]y jl (^ op MT *` SD 31!/y ^o my 0I Mg 3+ J- $- @x oj ]5 V@ Tu /U *` ^)!.E 5{ O` Ci Xy!)  V@ _& ]& 5! k= PW 5! b` B1 Fo Tl [= ?6 9N sT G< Z0!/?!)I $- %h /? OZ as!/y G$ y) QI M@ 2f <k 05 :% &x Fb @O!!' 9l ^o !8 Fo j+ %+ -7 7C G< QI Di |; 5m Rp oa 1V `_ %- (C 7; Jh!0G T* V@ _. .2 5! yW }A 'W!') `5 1V ^6!0>!0q!.% TD!0u .% :o f) Xy GI b.!0q 2{ $# Lo %+ &+ `c Ev 4P Vs 0v x1!0q!/F!0  }A 0- n{ &g!0A p3 pQ!/y qJ [| 5Y Cj X[!%Y %7 O` vn!0+ ev 9Z 60 _X +3 #= zs !t 6.!$r #0!1R!'& lQ!/I!)9!/K ({ GK a~ |7 KM R& 1U ]i F3!!K Cc!.M Ra 9x 4P ]% $p (* ;; cj =C le r/ '& &^ Rp 3  `^ Z0 J( )F op R' [` im +h .6 qh Rp!0^ 0I h# (R $q!(B &} 10 ?a Wm!2, B~!2. /^ wl Y( Q= &o ;;!/[ e= h]! l qO!2.!/9 J=!#y 'X!%O #I!/g!2C E1!1o!.L =&!)[ +H!#^!/B /4 lo!/r!2) h]!-m L9 Ra |x 'a )L o% %f f)!1_ 7A!2O 'm x< 'c!0e Q= 0I Y< 71 5U!2'!$x e= F3 %G a@ ?'!2`!14!#l ~z *p ;;!.c!2) HF!1c Ez `Z Iw )4!2| ({ &E op H* =C q+ &x!!? [! &. #U (c Z  0E :o i; Ih bO!1U )$ bF [| yu!2o!37 o8 D) A1 vQ!$P .l W8 >v 0I 10 i6 .5 UC +S!2< J, D=!3I 60!3K wQ!3B [- ?4 Q_!.O _Q!%}!.( *S Rp Zm!2b!2p !# {j ~]!26 kJ {F WF!(i 9c ;l!36 [-!.o Q_ An OM WQ!(g!3& Rp Tj!3e >N ]4 U4 D< =C!1u bm @E vq Ra ^E!3| vt @^ f< ;_!/G nP!/< <V!4(!/d!3N b3 U& +o #= NS!&' Wo tl P;!/p!37 '3 ;z ,9 7e!4: +f a3!1} Y. 9c q-!3q 5! cr mF 1# vD B^ a% Ej a' [| eo!4* F. 6F!4O )4 Kb! J!-T AD!33 J9!2o @O =a =2!3Q 1C!,A!.v!!Y c_ Ra W !4d Rh IL!%9!3Q #= f9!(F d8 C$ 4x!4n 5b (c Us!%. Wx Q_ 6Z g~ ~# I, ~% nu!/v Ji!#{ PR Q| 5X ^; Nj :h QT!#$ [O!*q -W iR U6 Mn!,) mV !; MV CU!1W ?C!2b k0 8  '. nF!2t %h W) et SJ!#X +S EW H% bd r, |7 mF An %Z G[ @v Ct!%y (i 7e NG ^a BL s+ <>!49 dn .$ i3 mu S/ w& 0I O0 M* &t ;z HQ!/M!#d +q iP!)9 Sj!2U >1 @a .[ tb ,%!35 l  E< *i YN K7!35!4r bd :4 @  HC D' [l M+!+}!.Z s+ k~!4|!+X bd @= w6 ER {~ ^; e[ ou Py!!t T> iK!2b!&I &e 3n jp!&N ^; @W /f D} 8t S/ >W [` Lo &e 3f rD |+ +H #;!*y o~!)R Tl U< 14 +I LY 9G .T G6 $r 5! BH ?`!+| T=!1G Eb )^!*z hC A& +B !}!5{ FO gO Um ?_ V~ ?> ]< Q-!-: 5I XC!4. -i!/! -x -x T4 E% 2j A^ K@ K? Q/ fF 6` Q9 }b jt `> jt X< .; =C YG @a %] N& B; L# <{ XF U3 wt 9= 9$ wH!*b S} g~ Aj Bj!+9 Q9 y& 9F zS m= Ym !2!6` NZ A0 -P rx ?] *m <{ 8. ~c!6;!$} Hw!7! }& [Z &] C: >k =e @i o !'F P% Z, $| p1 QZ %A @, A} Zt G[ y. >0 mi V]!-E #m M2 U9!)q +'!0`!.^ A= *C (% DN [x Em!*b |m!(x eX K1 (?!.^ SH 'O 7X YN M? 4a x) >| lu A:!(o &. q+ H= Sn vs N)!6Q T- qp 9{ `c M3 7e!.r i^ 5# Y[ [> %4!26 2e C=!-p Cb N7 +H!*} R1 4x ve [x!#D =C ZP Iy DM P4 Am E' )B!8N 'u 7h!-V! g!/Y Us jV *` @, _l 'v!2p!4y #~!8P i5 B0!3G!4q A1 <r [E Fa!.y m< mK Za Ym v( 0I J. $1 >7 :+ K2!4u!4N ~T Bt =_ @S hh $F!5i U) R, wT ?, Ij 2F uQ }6 m1 ]H!-^!!8 U< 5/!,h Uk EW ^w #j gn U1 iq 6V!2b B} $1 Ul!8=!4W!2o s} |0! y Iq ?, #B )^ fB k; +# M] zU 4P fT a' %& UT iq 8: 4P!0Z Em '2!8W {. 1V [a B: ,E iD <Y hC 0( ?a!4e }: <G }2 >p _S yl!!Z `J dy!2< !r UG os!2I N` q& Bh {! Z9 yQ tA c-!35 [D U< */!27!+Q :# ?x Z0 *h -p $g Z.!4.!#}!:' Ne ?D Bx !i I5!+o aA T  q6 ^~! s Yd!4q ,{ !( `q !I J< 'q!&= i2 AB!.4 (R 4P Di 0] GR `q ig +6 0h jY G! sy _v 6N _Q W) As!:Q!$x cc ]5 wJ p' b; 4| *`!7; &- &< gr ^v!5U 40 y@ Xq!&X vR <O!.U!0B Y? 3# fT d- 20!1L -n 1< 4f!+1 `M 6O 4P yS &- 7p aO e/ Dp DX!4+!&e wb `%!1L!0% ev Db!%|!;( A_ Jr vt (; #} ]l!;. -; `{ SH =_ Yh e/ <2 N~ x} `` #-!'@!;; +H! L *J #P :B IN &f $*!5+ {D D{ ]V _J!:%!7E *f 4# ^` IN 20 mc vt 99!;9!;G c@ <2 `^ N3 $w __ %Z!;] Es cb Qs l@ c@!5N oW!5Q P4 IN 1h!;^ O&!;,!,v cQ!;/ `P `  +& vR IN!;5!2p gz <  eH c@!:+ ES t! Vg NH %Z!<#!3} ^A!<& T-!:r )4 *I H?!*W ^:!<.!:8!;k!<1 #E ^?!;z!:Y C> dy!<- =4 $*!;k xX!7F ]Z!<4 4P!!@ U` _n!;i!<; 9-!;R!6F!<@!<5 S6 <U MD PS +6 f4 Fd!'! au R.!;# Dn (R ]N I@!<; 5M e  /Y hu :w!/R UE!4V!(i Z_!:F i8 ]r =) p !:r CY dn nM _P Z5!:8 S6 .? <E!9g!;.!:+!#v Sf!;M [{!<} >_ za xW %C!<`!=%!+J ,6 PH d- 1| !* `/!-= JO!=$ 7e w$ !V!:B b, e/ +D!;P KP d+ MH!.A!:e ?A!(R HM ]m!2u!<; _k!3a IE!:X +H sT Ch!#_ mM ]i 24!4C Al!/m!;;!;]!8G ;C XR Cb (c!<r gU!-y!1d a5!$C!:8 j_ &0 +g g= ^h ~s!<F C} -f T. b/ Bo Y) Rl U.!+D Dl 6N!<F ff!-H!.h `M!$V 5{ w; &9 !h f# NH!#l!<[ w5 %( 4g 6r `% DW Tj @~!(S =, _n w6!<[!-*!,j in!,l _/ 20!7r =; Nh H* e/ *m!<F Nj Zq ,j 46!># 3D cV @0!6i!<{ eN!<F gy JB R$!.4 ,9 'K!#z A] YP X{ `N DM gZ ms N#!5d _=!=A i.!// x+ }L <n!=j R] ~I ,( _g &) 20!:t!0R T~ ])!&7 C*!%d [W!:h!#g!+Q j& ,c @o %6!+4 `q Y: [Q <8 )k )! (U 4V [{ oN B7 N;!5%!+Q 6F!2c N !*N +x!3P U> )K ~:!)~ |x gI DT!%| E< (E!#X N` Fa %z!.W OA vE ?p 1h dW i? -n!:/!?B bd >P!+l C} -1 -i _P I5! = YG 9l!5~!5L ^p BX &)!?S qP __ mG !i j$!?@ pQ!?] f9 (q gJ!6b JV!=K t+ -O F{!%k!#K G$ Z5 ;@ $%!6b ,: [P!:* Fz W# >' J}!3> c: 0V h! xB (z )> e} :# ES!5p (A (A!%y 8  BX!)} A) E5!?V E6 *I m5 [f )P!1p c:!7e h>!*, Ii!<p ,9 34 dJ!$!!>b!&4!5w 2f!'? AU!.!!=P t9 34 7  R1 4w!8k ^a 8( m3 AU !_ cg ,9 BX c*!<u cO!>I dy En Yu!?. #4 @7 t9 BX!'&!40 F* M; dy!&N %c CN 6(!(I!+Q q& it ]R!03 ^3 Cs 1p!*F!:P gI <2 (r!?'!(@ mZ!(B!9i 2b )L!@'!'( b5 c- 2b W  q> =' }+!,S Y` >3 ?i!6b *K @S Z5 2o +m ?W!&K ?W!.* 2{ >B LC IO eP |r 8) 9- <7 %Y!=s!.* }x!A! Cn {~ rB }~ TC ^b [- )Y += px!,y A! kX C0 0( *I UX ;y 2f gE #w!1=!0o!,y!)/ A@ B? 3h!4, G0 :7 E*!=f uI!-y!Ag 19 yK! J 5! lo %h }3 yK [e 1; z8 Mg hC 5X j? C} <k `8 hh ?> N+ =Q tp!A$!,y 1U '^ L` 7O BA su V- 1Z =C!;7 z`!;:!B.!At!:T 7O _%!8J y, 6> |m dD Yk!+% h.!@7!'f Te #u U, N5 3r 1m ^! +J oH ^% 8| %Z!AF h/ Al z; q2 M3 2J!*V!,i e:!%M!BT ]> 92!&] %h :;!7' L# :H dv!9> gl!,y 7A RJ C0 .?!!/ BK +[ BM! ^ mZ!#/!BT ww 92 uQ &e Nv XP n9 (^ i8!8C ?s W- [l 19 J !@X Ng @; ^7 (^!=_ v< ye Y`!Bz >3 ph!*, en V;!BO!/* K@ +e <7 Le -- 2b jE JV Ys K$ {I 5> S' ~H ZQ R8 5s!Ab w; ~s ey <a 3r c% Ty 3& M,!C5 19 #, UG ed ix!AS rf IV [W dk ['!CN A( vE UY .f (6 ]=!CV cl!Cc >A #, @~ 2E!C:!@% (6!(f S.!Cb ]!!Co!0t _| ix!Ci ]j!Ca!Cm!Cy!CB j+ r- ?{!Ct!D !Cl -z!Cn!D% `  Qv ix Gy ]j!9J 4X $B!CA!Ab!/) -T ~+ Eu V+ _M!*M _B!D-!Ab Oz qP A:!D<!Cu!#y!D?!9# ]g!Co EU $k!Bf!CF 34!DG 5!!DI QH!D7 &} k! [Z dk N& ;`!2>!DI Oh!DV TG Qu w) +L!*q!D= N%!?* px p,!DK!CB i] K1 @, Cx!D]!.' Z8!#J!DA!#4!DU!([ X'!DQ ]j (Y!Dj! {!Da eD dk X{ @- 2!!DR 0q |I *2!CL!Co po +L!E$ EP!E( -4 <g!Bz!Co bi Bz W&!@7!E2 |> Dn!E!!+5 >Z!6k !@!C_ @O Ts !U cn!E! u, JV!7'!$x!Dg fL!$d ?7!E5!CB!?~ JV!C!!AZ!E( *1 !U GA ^W!ER eW!#R B; 2j V+ dh |> NP!DV VO 0| ^g B; ')!Eb Mh |> Xt -- 3` !2 c& }$ K1 [C {# '$ |>!C( rk E` zW 6` hP ?, L>!El 9u <& 9E!CL 2W `:!*F f$!Cg CL!Ab aQ 'E )} <'!F(!CS ZP ?1 '] rD N7 BX!Ew!5K!F& VA ]W 6n!CH 9. ?N _u Wl ;` Xp ~<!EG jq 18!B1 6g _b!Do!E' l_ 5^!*A!AW!CL (? 3g A= *R nO!F! >P V+ Gg !M H| oZ #; 1l yK |) ;_!>`!F! nl!E(!@; M9!2_ dk rB 6> |6 P` )1 VG >3!Fl >E rm!D6!,} 3O!%# }& pL Uu A1!EM $G k2!)m R8!1/ :H H? `o 2X fF @a!F/!!e eG!7H jL!@8 (^ T-!;% 08 h`!F!!@z (6!7S Yl O: A( Q[ 3r!>j Hu!&B!Cg!=) 18 zW dD ,C 2v [i 0V $P!$P }- MT ?,!GI R' MY #h 4+ g|!BT >+ '; WO!GF!3I f- q- 5>!FY t| R@!BT 'b!G_ I%!;% (z!5k PD +[!,7 mf!7n I0 y0 Ka 1' q9!/T (V wA K1 5/ 3g G[ r`!5?!Gi 1# oV am q? Y. 0k 6$ zO !; <V /: X1 Ka 0: 3a W) iw!9T!F!!$x yK J> vq )(!+r Pa 1K aO *J %a dw!F!!FW oS Y= (' %W Cv NE 3r ~h!HB ^c Ug A} N+!5V )E!5X!EG aO :*!?' DL Qh |w f7!C$ n  n/ C+ n1 Tq 3` I2!HB JV @k 7  6> js =Y 6$ M  4&!HM!1G!H[ TE BK!B6! n!Hn Y> 63 >{ :G hc *J /Q m+ @- 6$ d  60 ;@!Hp >  :*!;$ /q <= K$!*^ ;}!7y '. DM!Hp!1s!I+!H( #P!Cs :V p, =Y >7!I5 +2 $;!6n /q 'E ?4 >[ F. l~ SU 2$ 9l Z,!B) UU!HB '{ rl -A 7) $b n< 9j +>!BT!(# ;o!F6 /q %M!8~ g/ E`!DM!EP 8+!IK Y^!FA!HN *0 4s!6= ?{ A?!Cj M+ cl!>z S. R8!@C ;o y@!G9 =B XC .r 3> n  .u y; Cc Y2 Fa 3a a` 7N!#D!Il!AS bi!*[ gO N2 Rh zI ;o #c!#j 'p!Dp AN!(% $[ sx sw -$ T> gp!G_ l8!%I X_ +E!Ab!!W j: /= 0g Wc *Y 1Z Ko E1!0O _{!E/!Ci!JC!<^ wX TL vv!J0 DV 4$ Nb V]!AF -k 1S!>H Zo X.!%h $; ~g!1L M5 RV!H, eL PM 3m lZ a>!*: ig 1s!$Q Ah D4!GJ w5 *d!=-!&f a> iH!Jb CN MT Ux xy!Ia 8.!(4!!g Di U< 2{!Jz C_ LR =o!G> E` ~m!,- ]G kv Xt e2!H@!9# K~ 8V G6 Io!K-!Cq!<? i!!<> m&!Gx U7 D, >s!EB ZM =e!F* 9.!)_ &V OI m& 08 3a E) 3| Co J:!0` #| e.!<%!K> i! GE!GP K_ C_ &s oy HC!Iz gX!H. Cd |# >. Xk $5 F{ Ko #P [R =a!DQ _& 9l nK!Eh Tz!Gy C_ :4 h! nn!CY Nu!=g Sr!Ir R- =4 pn DV a' n] mF )} [q J{ $Q Z. La =N `)!G_ ks MF :K PV 09 (q #, =g vd 6t f<!F) (+ C_ U#!(< #C!C* <$ ,0!B9 j- f< :e ;{!L= =H |/ T( %) >& uB o! o$ QO 6$ Wx D: -4 M` iE ih n{ lg <F!9e eW 09!B] n^!#) 'D @7 -O 2o lG!7U hE -Z QH <3 F.! = C_ /X s> 9r!#z 3+ Nf!Li!'k!!t R& eN 3O!4R tO += tl!3/ PW!+h!GA do!Ly Pf 1U N+ Cn!Lc O~ ;- F& EQ 2Q FH d}!9h ih 4'!H- B~ &U Xj O` M'!0[!Lh P3 zn B$ $-! L 18 }z %v '| {< #I $1 2f H% -9 zQ!&e!G8 Gi!Eq Oz &t %; &} 9T!5n 0# v}!9?!JF PP $*!C~ >& !} .> vR :p .f 2& m< /+ ]~!)R $-!*z Ev gU Q3!'X!MJ!@7!+A T= Va LD PB f#!Ab ~M ,o G#!MX .1 iz ;% .7 uw!1}!0Q /^ 3w h] :O .~ OB BB!MZ >F Ez +S!HK pE 5/ 5q Gw =< (b :'!$t Qv!   =Y!!} S=!MJ o) 5q n5 n& O} J1 1m!J1 <'!F1 H^ 6O!Ci!&1 bj Oj Cb pL TC!)2 GM!?t oi!2%!DW!2v {C!0E =@!NI N  )a )2!#g !X /, TG lQ +_ $p!(c >A di R{ 0A D^!)  +2 3> F; $F!F[ 5z 0: >B Jx!Nc IW!K}!3O!F; ei!!a {O op Q`!0[ Z= 9l!?A <i!AT 18!>& 5G '2 kG!CZ!0[ ei 8-!$c iB qS!E| H:!.^ jF <D!AA ;,!$!!5e Tf vY!FA GS EF $8 ~{ q} BX!Aa KH!LD!LC vY!B) 3z EF $| `{ yv Zw m( =; *i %( u6!$f 81 S[!OS -, ey tE!M{ C} Ro 7|!/W <2 ,o kJ 6) 5J NH BI p<!Nd!Cw +R },!*q!Ok!O; 5X ~^!6*!O.!$=!FI },!H&!,D (b ~K!7'!MS bO ~< `Z!A6!ME!Ni /%!C:!CS!C{!E3 9k G$ i6!ME HF lx!OO!7 !M{ ff e~!L* `%!Az!,h ?$ >s!B^ UD Gy!Iv!>U!:~!(6 ZO E`!+( 0K Kn ;3 !I!PF J# ,k dS!@a ]W!IS Pb iV |` lw!AS!D& As!*' JD MA E` Y+ (B!?Q _# Sg!CN R]!H# MX!J.!BN!Dy )P!(z &[ Us!9)!L(!?L .b *1 aJ!Ln IP )& %K TR {I 5q n. yH!):!Hd a9 2] ^) q; ZK su {W &}!;$ N! Ms N$ DF!L/!L}!@( w9 Rh!GP!;v Ac!A> Ac ~>!J= HV %H G* X[ Cs!Ff m<!:| Bt!9$ sf ;o %, om 4q!=l #b!B6 |B!,, +< dX #P 4' /' om!FA!LZ 2J Ci CG CF!L,!$)!Hf l8 6^!ML Cr 1Z `A Y= (} (}!Hd!;% 9a js Hh A_ p !:h 3`!%]!Pw!+d Lr (' 9a ks 8R 5!!Pe EE :*!9# ~} gA 9^ >l A#!QA!-v!Al .  F.!>@!8A zE!$3 CW 3`!+f!QN *6!9L iM :*!E?!K= 7$!G[ 9n }! 9x Es p- L# J] ;) En +K hT ov hf hX >0 8S!K. 8R 0L :B!<> 1K $x!(R 7G O* 5% ?(!K' sr '- :)!'Z 8/!7e 3M ?0 m1 }6 :/!FW }` nP 0n '+!Re /Q Qb!Re!6G!%* H^!RT 8B l+ bp ,g 1A -' 9A B^!9& ~U!!h 9n!)' (( wB 8R %[ p7!Bc Wi <z Xs!&Y!,-!S#!KF ie!Rk oO vc!R]!RC!8w :L _. QD 6$!)H!QN gS JK!R5 bC ve k] 9n U[ (( Wf!R_ KJ!8h!0X 9x!;$ {Z sC ^` KM 7) p$!SI ?G!8( 9@ I[ ?` RC sP 9^ Ox n` Gg $]!2r!)w 6F 4( ff!S[!Mj 9n &K n` o| 'I E; (X!I@ BW!SZ Ac!S] ;'!Er 49!PY 8R 1Z H?!(d 9x e.!SO -q!SQ Q/!SS!%0!Sz kM!&x o) U/!!e!Gh!T#!Rt ~t!Sx H:!Sb )t!&x 4X!Sr kZ Yy!>0 ;'!Q( #q!JC!T(!?B MC 1Z n6!4w C$!SD H?!N`!T> F3!T4!:h Kt l  9x!:g!SC!T;!TH :) +] p; ,+ ]  =V i>!SM!K! k[!TS!3T 5r!#o!Rk q{ ks +6 AW pH!TR =R 9^ 5w!SS _T!RD +z!&P dw!RB XF!T_!Tk ;'!6'!SG!T3 ,+ eh D= &b 9x!5c!Tj!4z H? I^ 49 k! Ph 3k Iv h& 9x!0Z!4z uj!U%!%}!M*!;J!R_ 2Z KD Je u%!B=!U$ @7!HB 1Z mE!S> =y Iv 7* &g u#!U0!C]!U2 Hu B0 sA!2D 7p!J< =V -V 1Z i>!T9!TF!T` Hu!QE h4!QN *T :u xb E~!NP!QU eU vK H? sA 8B!:g 8R +- rT Ef +[ C)!OY j- ,- Tu!:h!B)!A)!Rk 'E 6> Ig!%u!R;!,|!*t OX H?!*. 8B!5c!:C 4g!%0 o{!R/!PY!92 QU!(-!TC!C{ Q; '| OT 'p )} B(!7l mg!Gu >_ 9z }x 82 o| 3*!?~ n9!Ul im YL +@ K- =%!TC!NP #O (N!?Y =%!R/ iF!D5 Y? M  )) Zw Yf gU !# qx!=e!&y!Mz mf I0!V7 G3 Bw 88 DV xJ!LB!VE ;o ])!LC Bd }^ E| nZ 8B!1{ |a }W IT!CP zK 8/ z| }) E| ao 9x q+!K6 j. Ew!?p!Rd!9=!-% 0e Oh .Q!Oj!MI D: /3!Kz nT!V! :9 2M!4T QH .Q G; #q!U/!6l i# A$ ~@!Rv!U]!/U 60 eW (B .r LM Bn 4M F>!Q{ 1K!0  UN at El 7f (( i  K_ *< Y5 EV F. a! ^h sv Z^!W= N. 2J dB nP /m!6z ;q!Mn!9N '=!'Q! Q (G R>!SS ~M .{!JM ma 4k mM!Q1 Th ru ;q nm (( a~ pp!-5 F( 3s 6G wS 'O yb! . *: ;l #q!0& pp Yo t, )9 *; s5 >D W{ E| X$!U(!VT .# F !Q+ 1G ^`!+/ Bs K8 E  +D!X !QA!I= ;e !`!$^ ~(!Lx ,V k( 'i UK F. |L oQ +R =g OS!AD oe k? mY!Wd gX!WK ~Z .S #p!X<!Hk LM!02!EO!?M 9",
		"Data Chunk 3:n K_!WX!MT DE *( b5 A| -; 9A Cn !M |V!4I B~ BP LM Df 5f yu #:!:R!R| Al!Og ~1 B7 cT 49 p, Ln (%!XI /8 9A!)> |c!$1!R@ ab!WK n5 gw Y. A| ;_ 9A w5!G[!$>!Y$! 3 _6 E1 <[!$a!X| 5X 9A 2. lZ e+ w1 &^!Rc!-+ ##!MI 8~ 3K Q. &g f&!.h!V] B7 Ln Zv eL c? ,d @K A|!&y!Nj Sc!I> )$ B7 L1!&  Gw 9G 4H A3 /K 9q G= 0@ D[ K9!YV!J# F2 nP .x 6K!Mb m`!S~ Jx c^!.v -H Bg :G aW uo %K s'!Xc ?!!KU gl wu j: Bg c; *; HV -V -.!;* #:!,a X$ Jx )R &k CG B7 H% 6G!Q* #g i+! Y nf!Az a_!Qx w  K- yf 6W im!Z1 '@ su . !)/ x? J>!$1 ?E B7 |4 !Q EN!JT <l Ll!O9 3. m5!M&!${! 2 1l 1g!ZI!W& :9 t9 5P EU 7% zS n{ B' 5b FZ HF!Aa!*V >& xC 66!*`!$o!!Z!R@ c# ;h u, |+!;O!Xb @  +[ e6!Jo uv &i 9^ Af &M Xn!X7 7e C# .o!FA!In!Y@ D^!85!Zx bU!Zz pH :b '5!<| @X!&R eO h] w0 q3 aM AU! & a9 E  1U T_ @X!P5 F2!Ni![% 6A ?( &) 8D rL![8 6_ aM i_ c; 1g F3 T# [.![A 5j!L@!Zb iH XD @X!U- F2 Df!$X!2: >g!;/!%O!ZI 5? &[ t8 88 ;h!C{!H$ rR ?( ?| ^7!Q}!=<!Sk @X `R ]k Kw La!6}!Uq $x G& >l E  wp Ux eM!Xk '[!.s!Y!!4m LV!*^ C- ~5 ]r Bq eM!F) nQ =;!T. ?U >g Ns @y Du UK fu F~ wC!Zs!8h!R~!PI ^o :: ') 3Y!=_ Ce e` tb ?1!H&!(/!5& lL .t!V8 $l iH wA!Z! ]o K8 Bh!4Y y0!6:!9f !q [! 6c Hz 8A L7 <.!R- Bh 7)!K9 ,k 7/ }* F~ F7!Z`!H~ (b z.!]4 Bh 5P ei!V* hJ ?h >p @c hy!N5 t8!0L *;!$=!GY!$?!KX #S!#@ ,P p7 ;{ 2S UC Q{ 4' v@!8[ d7 C$ @H '^!( !Qq Xj Qn!]t 81 h6!R1!$2!ES $G 08 =}!F` zY q|![m!Se!]_ b_ 6B!Nq #S!1R!=l!F` Ia rl o?!L{ nB SU 5~ +0 ?9!]p (e!/H 0+ B< >r!Z6 6G!B1 *C!?)!NA![m :#!*.!3$ 6J 4j!]{ @* 1g R] -,!AJ g& #S!3. *Y!F6 +N +S {] `^ 1q #J _- mg :v (G #'!$E yF GB jQ 4? Ic Xk![P!QG vF =x!9$!^v!]* =T!U/ 1k &3!4U $Y =4!]= hr Ng ht 4z >W ?j!5+ ))!Y~ lo i_ /Q >L!(R!'G /5 =z -r ~s &4!UF %e 19!=z g_ =L cx ?`! _ s^ >9 14 -0 HV!=v!4)![T o) Xg j3!2k (T ;V!;* RS H:!'Z 2F!Ze V7 0`!21!1( >* 4r r?!SH ))!*n kw >w -; bU K@!/0 Z)!/2 ={ 'k!,Z )2 ~s z2 &k!3g 97 yS!=, j- ?4!Kk |r %) jm nG!$U =g $* ?B 5u vt! D Aq _X 7k -' kz F3!@[ MR ;8 `A nZ G. @F!Np sB #P!JJ Zx Gg!=6 %- Ap Mx nZ!%^!NK mo!`> /^ ,[ GP (w!+; ;) _S I3 pA!H< b^ =+ 2W :m!_Q %~ &0 ;e (e Cs QA!ED!+= t( vI 7A n* lQ pz b3!+[!$r!`F cM!+#!=  NP kt!9) qS!`A $X (s Ap!&# 't {;!$K!;8 L:!Gj 09!VG!?d vH ;)!DG xb g# *+ %a f  L:!+Z ~w! n <n ]` OF $b @A u1 HS![? D] :N!G-!(/!_^ +{ b` #  ;_ 'V UG ?%!Ya :/!#q!L4 @d!L6 `S ~# 2W 'V S]!D+ lG!QW BP K? ;% &g!:|!Re!.r xb }I!@/ 3%!-{ ;C 4q }W!aT C>!#@ >c {~!aM aX!D+ a[!QW ')!Cp!U] C^ #] KW!aX!ag F.!DI!]U!%( %{ g:!T~ (S ^4 8/! I!aY X[ )I!-E :z!%h AV bO!_C Hl :9!@&!_| X[!D} 1, :/ x' xb!_6 =% .C s+ #  eN!aA!==!Ed :z k) 97!PM |a $% OF!Vk!aY!$P!P)!b= 14!&/ SH!UD!`* $ !*I!aY ev!Di pv L: o; nZ!NP! = Fi!b+!%?!aY!Z!![X!.M :N Yr nZ |m DL J) t7 P# ?> 'V xB %. cA FO :? {I #L!%#!(E %@!,2!>j!aY l>!Y.!]x!ba!b9!(o 9z $( P{!a} }3 Yp Dy :?!=. >U 9> i, +W N_ %e ,x {+ 9? -g .a!5= [v!Fy!c* :) ^b HF!ay!Km!bN 28 1/ G[!5E 1*!H{ 9O Q@ F< G` #M RZ 8/ $b %{ Lu D#!^Y!YU ~# 5? P(!`g Kr!?l!cJ *m &@!Kc G? Cf L, :~ ,=!^l!IT ;K 5` P! +W!O) %a r, r, ]C 9. -| ,=!Gl (g *K!Wo Xw =D!8E m<!=9!J9 Lo 8n 0V %/!_Q!QO vE #  9p ?C!$=!:b =h wL!cl 5/ Y3!_Q!7/!Jb P# 08 KO MY I:!G&! ` L, ~h q.!%d ?R 34!Y)!9w %{!5O Y/ Rn 6T 9>!Ay!Z>!ck )) {I!MM 8@ .R /x!N{!K|!a[ L, b~ Ef!a!!/d! S Wu 'U!96 8,!)y E? /2 /^ yR h] )g #l!Vf iz!(.!2V!HH q& (= cn /2!aL!X  G` +2!;'!)^ G; @B L| &_ Lc!Qb!)^ 7A Cl!`t [~ m+ 8H!af!dX!OO d^!OZ L,!2V )/!V.!;^ +E :u 6E -g 2w!J] 45!J_!S# #F!(;!RC =% XA!Lh 8)!'(!#q :X!]F :[ 9> #r 9' wq G` %p!_{!Vs =4 JW :N!Tv!UI hV &| '+!d9!?d ^G $4 )g -g hi!Zj!+O!Zj!e@ Fa )V!`4 (# jq Q4 Jv 2A Al {u Kz 9^ v4!(.!C+ 'p no ;3 4{ >p eQ C}!C> r#!eg #q =D tg )2 $R!!8 3L!&m Ef k0!1q {-!!M!eg!Bs!V'!a< ]; QR T3!* !B1!H= .!!4'!!r Bw -k!`4 Qw!V1 &V!#: Ef!T' M. Ez!S: 8) -g <C!ex -. zb 2%!dh !o H?!di!(g!aj 7@ @A (P!dn!A+ $4!+] =5!&8!D?!3? ls!a` rI!dn '] )O t0 ;K pH * !Ad!0? 4. 'U!fW!f@ T;!,K ~s )V!4R ~< >v ,j!`r 96 )2 4w 5{ $4!4c -k _*!En 9^ 3g!fK!Z0 Si (b 5=!9b!Cu Z0 (n!?s!SE!=i o{!D&!DO 8H Fc ZA Hd ti K;!f. D]!SE!_[ gR!Aj 7W :9 1{ &Z $b `u G/!J+ 1A =S )V C} &< 7R!,K (S n9 ^) :` %_!By!g3 .r '+!1{ _,!^G!XW &r g> {B!%, e9!gL @A!eC AU 'N!+u ]# &Z!8M!]b vW!A3 4{!dK!2L!Z+ Vz >< ,A!)X!@[ >N!LO!Ji!fx!B7 Rq @~!=) +Z!gj Qb l- J1 ]D!&X u+!`0 1[!(.!E{ AU W,!=P QD JL!@C sS!ZD %G!Rt 1[ @A xh![5 )H rD!f6 %6!VK [V!Pl ro!PT!*q eQ!@q (C!+X 3L!>@ n9 Mg L9 A%!]: rr!eU!B= cV DL Or $; )-!hB!AH![@!eE!]U {:!'(!+y 8@!Uv IP!IA 8v!8Z!(g $(!1c 1A Hd!Z>!&] *e nB!h@!-g ,9 #a fZ!%R G$ FV :# Y3 GI!C/ /> BR!+4 +o!A<!9K!N@!%S FV!eN!Kw!%W )( 33 3p $F!VK!1N /z #`!h- mn q.!Q* 0# l- 5= 6:!VK [m $@ iB!f6 -b!d+ fC (V!Od!hg <e!&1!EY .b K-!IA!eU!I[ [_!4v G{!(a ,9 C@!b$ bD!hm ?:!iB YK!In!7~!h@!Pr!.n!%v )=!h`!-7 Q@ BJ GB -'!_l!i5 &Z!&m z)!c[!.K 1A!Mn Y~ Gg Om!YO!Jb GR!:E [-!:I!(L!fx!?K q. Tl!W> 8> Qc ~,!e7 pA!7m _+ `Z ,A 5j bp n( `O @7!f6!hh!ga nr RB!T) 2@ 61 |( H:!!k!,' G{!j' X1 4d R# +* W-!KJ 2E o} F;!W. :u!IA!Nc!h]!Wb lY!SE N+!* !D&!$t!-}!fZ c*!hB =Q FT wg!]c Of!c{!$r GX!Kn!i# -. 0N e*!Vt dc!fx!dm Ef!VA Cs 'q Fc!hu!VK sf Pw!!t!7V Xe 1' Cl s/ =4 8 !jV!hv xc!Wc hH 5=![b )/ e8 O] :*!f) $R!VK t.!>; ^2!jD <B => q> &Z ]V!j& i+!GE!_# Ar JB 2. +r!g( 9- xh 7r!g8 XS!VK eb p% C'!T$ Xe!j- dz!#h ,d hn!j&!jW!k+!i| _; >& 2Q G>!7J dC!$* jV!hg!il!71 p4 '& tl!,K 30 Hd g> vZ CI!LN ~v!VK ZX!=O!hS!A! &r!4N!(= }>!ht!j3 c& VW!hF I. n9 T- o*!7P!j> yf!hv!YV [w!)F!fx v( =%!7; 2] up K8 ?:!g` iU!'. P% P4 ,k i' n@ Xx!-e T~ a[!h' l-!7u _H N?!R3!l% %S <n G. 15 up!g^!Y4!e7 L| |J 9]!@# 1S!<F VF!1G Z1 Xa!fO 8h!%I!OM #E KJ }^!SE!OU ?R!0t 15 O5!kA sA +S!.5!Un i!!G4 5= yN j)!l( 'u T3 J#!<6 ZZ!,c!H0 yE!@m 3p (] (g rK >Y Fh Fc!N,!li :u!P2!VB!i/ =$ gJ ]= 5# )& 5=!Rj 8Z O` *W!(u!i/ lF w9 qn!l3!%r!l%!bf! ' >{ uv!F6!]` 6(!cK ^F K) q0 3L!3{ %e m+ C7!:U!M5 FV!lt!BW nR GG P4 QD Kr K5 Wt!Rr!;E =J $P!:P E0 ,P!:'!fZ z  O6!&1 HZ db cP!g? Ix 7s Oz ^7 hO Kd ?: 0H ~]!,8 75!l!!g?!gF Dg!l( JL ;. 3p {b R.!B+!W# NM j;!g? *- 1k!07!!U =a Fc U5 23 w#!`b!cy 3y ~6 DX ^e -B C# p+ Gq zK!6c!/% s* Le ,j f6 )1!md &Z!b7 rr 3-!OU .5!h8!=1 ,j uI!1X [O $( vi $4!<a +)!&% &C Bz qD ls %n 2|!jm!^{!a> @} %d Jc [V!`T!:= wd!!E 6O r( jQ!eC 3L .D 13 YG!3y oX!dj 3w %? :p!nQ +[!LZ!Eg 13 }I yz -z!Qn l^!n] pb _$!M$ 5N!j|!O.!AU )Z W* Kl kQ ZK 48 1` .r!%( 5N S8 YE! + ,S!0I!S0!&l #V!kc!!U!M; 64 $3 {c s/ ?e!0'!)z 87!lh MC ^e![,! F Kg .u ^7!)  1s @T!o.!B0 3-!dD!nw![,!Kz -+!nI kD yc!`I Yj (/ +N!0, #C _% UC v4!oC!km 'z 3t!i4 ;A!n0!lO!oK ,^!b+!^+ 5B!i= i@ Uy!oS yF <> S6 ^7 #u!_G!A! 1X ]a! + (1!oF 8H )i <> }I ^7 %Q!RS ;$ ZK!'i yT!1H!o;!+l!(T!m} {O VJ di %% CV!g%!:!!eg!lz Xj sf .x!`O!)^ z1!`'!3O ai ag!hm Y8 -B Q{!== -1 *e OU!4A SY ~| J[!5q!%y !D ?Q %X!Bk v'!e,!6' <- I% G> (9!2Q 9>!SY!/D V9 /m!ec!Rb KB ~] sS!io!-T!pL!l3 9s 5M!O<!<*!Rb!Yh ~] ~| ],!&? Y]!)^ hz Bx LY 0n i6 8/ T] HE w#!QT!Ub!p& ^f Jc LY b% :+ # !Sn!cp!&~ N] Os!'# !D O$ O.!6W [b VJ :p S7 T4 h  /$!,G!pL!mo! =!-x Q$ PZ!IY =0 Wt!jg dq!p&!$* -O!0N /N PL 0E =0!0b!q6!69!q- 2D!E? Gr!H_!cJ Hc!g. ^! dF lg tb!)^ HP ): pA 1P KW P!!p! =:!`o!GN!qN %7 ?b vH!mE!RV $ !qU o{ e*!KI!<i!q- R< l_ vP ;J 9_ %V!p!! P!jC!jt!KH!qP 2# u< NM!q= %_ =0!)T P2!,9!q- 0H Yw!%J 3v!_, 9_!cH!K,!Ba ^1 h+!e3!.m 4j!!= &: ]X!cJ Hg GJ!p6!&g cb!p2!!k 2V!;$ ?^!Zl!a}!qP!T4 99 2<!S-!PJ!q !nI!Tc!Y@ Id!q&!h_!Zt C%!4x @6!i} it -B h& om!3I!b+ s> 5B Z=!A$!d5!A& %7!on!25 i? (l!3s!eA!oh!rX!> !7m!pL!o# pn Ty!>_ PL 6o!rW!,y!4` 6*!Uq !.!oH 9x!k8 7)!+h!rc!ro Lv!4G!C?!q8 2z!:T ZY Ef!e, pL 5B!SH @D aL!RM 1p!Z$!L@ XM `* )B!a}!n6 `D!#C!=O!`0 il Gq!JH!#y H4 y,!r=!Z$ H!!/x VL!rO yu %% ti ^7 5J!]A ]+!n]!oi!Nd bx Sq!S# t9 5B!l5!`v !P!]' gx!s( @`!ip!5d >< 8@ Ge =% Xx!:l M'!b+!mU 5B!Ti!j7!K$!s, Fy S7!qE )B Nb!a2!qx 8~!,|!jZ FU!dC K)!oI [; Nh x'!r1!s@!e~ eV!_$!:q B%!.m =O!qR YZ!s' >c 0n!$h R] Gu ($!87 .~ Ix 7r [m Xn xC PL!Qw %%!Q0!cA 62!p2 '` ;j ]y L& ?p O7!sE Hd In!`b!J: 9> KU 4H!2$ &5 ^R OF :0 5e!+(!L^ lh lf!tJ $X B<!1u -c G0 pr 87 H1 lR ys :y!>!!tJ `* Iy!1K OR!0O 8/!Ue!$t j_!f-![3!s,!#` #{ a8!rn [y $  !o #4!^y /1!F> /; (G 2T 0Y!%. !X N;!s> K| LA |+ pA!E< 'i GH J0!fE `6 MZ mM 87!mo Q; T*!CJ!Pp >c {b %L!i2 Np NB 8/!Tc H5!A# AR R^!t~!;* HQ X?!O` @<!b+ 3E 6j y0!Z[!KV!cd Fq HQ!mI![` jj VJ }< HG!kK!e1!'x!c7 <o Ga [; WV z5 7m!me!OI!gV D{!<T!S#!O`!t4 V.!OR (  O7!JX 7> yS s^ X9!eg t+ H5!lB I5 CI PZ ]} (+ a~ z7!(N!B  8t HP LX [;!tX ZN!a} $<!EB!%j!5W aY!ba %n Bk [; $( yF!cJ z# 4O!Ad 6L!i4 ES <o mn #. GG!Kz g= k~!'D!`_ yI :z sT l,!i2!@(!G^ ;f S8 7T ~|!i{!-H!ba 6J Uv Bn!*T!,% Hg 8  ]R!`|!lI!&g!vT )a #m!;W '?!p( #j!Od!EB G9 OG!((!_1 :] J) M[ lQ 9w!B~!`P Ho!BU ^M!k9 C$!k; }T!vb e0!JK Sy!Ko ^E!q< PE tX _t!RM!+l ,: Ur!X: E+ :u NG w. fD!L+!6|!Z*!vH!Sn <r Wz 0~ >F NG !_ Pe hh!rq!(N :] ,E 0K k! m;!7D!9=!qx [l Q-!=D!kR!S: }:!w* NX := )^!WC eh!w$ YU!41 Cd!v1!6/!hI Lj Oc eh <o!u/!I. oY!wM!K, 7>!Q* L1!:@ ;)!Um (+ W#!3l aZ!rs!O'!ur gU @* oV!9=!-s!>)!Dh!=O!fl!<6!c/!R<!bD ZY!wj!wB f# x}!@x!uj!^:!A/ %E ;x!f5 U !w* M{ N%!_e!c*!x)!Dn (?!p+ gm 7u u}!!2!1I!s,!Sw (+!16 7P DP!wv ,x x' L~!!?!Rt!<6 k~!gg!8$ SY Ap!sR!EB!U/!+V!I'!vH Hc!5U!k2!qx!Q8!vt <o $J Gw!3% (t!vH H` }@!+b!o) 7s :9!#^!w*!s/ E !wW!1q!ba f6 @9 X[ l< O6!xg )_!EB EU $<!6p!J,!ba uI c-!<o!Z$!3D kt ~6 =, A= `0 Dj!J9 :l %n ]O [^ KB!Bv!`P x= k7!QW!:~!X4 :/!`[ %1!1O n2 3-!YO!^P !_ my B3!RY o1!b= uI 3_ UG Iy %W |G (e!o)!5U B^ Bc!;a!>'!b% ,' Kb T* iM +N!xg &b!EB!+( Jn!t0 bl :N!rj Sg TA!:E GR ey {n!vZ p[!3V 7S!NA!QW!uR <{ Rw #t 9'!qk Gt !_!f?!y( +{ g` :N BJ!O0!9+ En => ;)!Aa SB!5c m% })!aE!y+ [4 %1 A1!ap #j !) !? %O!3s!Ua!S.!i^ l$!o)!RV qH d= 1m :I ]# %1!hr X* :v 0X!47 #_ zY @I!6( Bi!+[ _N H&!^G |#!/= <(!*z 6) `c 6)!=;!yW!.m av A$!Fa!h^! { kt!zU!<: =/![ !+z!K!!r8 iK =g!ld!.K! n!`> QP vD I] +D OO!;L +u 6) PV!>I!'y N| ;V Lm ^J!zl (l |t!+Z hO!KQ #K!H/ (= 4z #t I= ]< Ep![/!c3 ={ 6B!f* #K S,!Q& fw 7k 6J e= G6!R:!g;!]+!l3 OM!Y9 BT!54 kZ 6( vQ!{( F) e. 2& IR m; l$!y4 l' :z!:7 TM Dr!6' xO >w ^t ds CN!wK d)!{J H1 (c!zl %[ im +_ IR!+] @s!sO!fI -r {o XL!z_!`u!R< _Q 6B!df!:/!1I!Uq <[ HH!2V!{f ci xB!*P Sx!B}!=[ >g!'v Sx @K 6) 1u v} |O!{^!Gv V@!Rt 2&!z/ NX!{r!<l ?o!)X `^ UG!0{ ?( -: /<!Q- HT a)!wQ 6B Xw Rh!|0 >g aW!{v kp!on!HZ @ !z/ je!%`!sC!R[!y+ h4!{f )  X8 s~ Dx!J1!12 >g 9Q!{v S3 (w ks!z0 0@ So (a!x< ?X Hg wl!|T $Q!gt!CT Sx }I 'P!1I!hm $s!{^ Rd HT *f!.W 44 Sx!bW!3U!3> rD ?I `* wl IM ,/ e$ @P lF!{@ fC!3a!VO >g!A6 Sx!5y `P +f!gB!{?!27!sN WS!|& i6!}% I] ,/!=)! r!z6!&7!JK!_X!:< >g wQ!{{ I] /% #' CN JI!zR!4R!{T!es!}:!|| A` HC /X i' B'!{? UK!.f xK!^t ?@!wk!4} HC TI!JC f# 0@ Sx!Ss og kN!].!{Q!vM I{ /M l_ f# HS ao!T9 @5!UV AS!yR!l@ =` ]G!U' B'!-s f] l>!79!9? >g J]!Y[ Sw 5S!}N!}q!.! QN!y3!k-!QI ?@ q. I/ Y] K7 GB C0 x? H&!&]!ui!Rs![g!j| vQ S3 Db Rg B' 7u f]!e@!tU!GL![A!lh vQ Z3 'n ~g!dm!O0 hG xf FU!'m A) K6 vQ =o!b) hI!Z_ %? WJ!# !r* ip!R@!eO I/!fB CO!:/!Z_ IR wc G  $w jX!~U!(z!~K iY hE!g6!~]!SK 4]![Y!%F Lb KB!8n!GU 6[ bi!6R!~P 6` E<!ok!?] . !{&!+]!9M (w JI B'!v,!7`!HH!Aq!Ne v^!{p!jx!Ps !t iU!x% H&!RC!P`!_#!_%!ZF!$* -W!-G /t!;6 #: >Y!)@ XF ,~!ug!3[ 1s!2V!}0 Mh M5!QB Ll H* 4H!Z3!to![& (G KQ hO!e4# C (z!nS! r!zU os ?,!Ey 'i Uv# N y0 B> 43!X0!Ay ,d!z, z3!tc!rg Ll DE %1!<B :w *- [: #:!4r hA F !~0!<T AF JF Dx yS (R #=!Xb B- IZ!;!!p/!n~!p/# s!||!B0!!_!+R 7N!Jo ~[ 25 [V k|!f#!H1 & !s= V7!#N!,n :9 jC SP Ma!'d }7 hI!E?!Jo!qm Ao s/!hb B1#!4!zI!.n!:T 'u 9; -6!n( OS 6B![b pE!)B![G QY IZ![B HJ!_q CS Xt &i!{3 e]!&6! [ Ew ?x %1 *l [&!k_ BG!rn CX!ck R. #u!P| wl!z* ~. 2r (F!S:!X=!.!!x]!!_ H<!i^ 4H!mX!w~!|r!bS!R@!{7 I>!!Q Ze >j!W^!:B FR H: $y WS#!o!1O I> MG (@!(' >F Dx!z/ :f!Zu!29!Zw#!{ {b _S!2># k!RS!|N# h u,!xx!(M!xz C_!Yh ^y##9!:| E| |O# h!PY %B!}P zX!R(!0X I>!!W#!A W% F(!z` Dx jG `J 6b _I '- ?Q tE!sb M0!Lv!.|# h yM!h,!.u ?r!rS 0@!^&!*$ <W )O!v-##c!y&##e##Y!`0 !^ TZ!%^# g!*} ;q!>s##V!Y !4l 6c!R(!`%!z* rf!K[ D4##y ge GZ ?~##q |d!X[ vg#$#!2> 'z##/ 57##V xB#$+!Y#![^!z/!S_ Q* pj!Vv!{& zq |b##} yS!X7##u _y ,h!i! ;q Fv# h }z!w& k% EN ZY I>!16!JJ 5g F( ao# u ff te!J: ~m L7!h5 tE Z #$R!F.#$H!yD!)' ?I!WT 3J D_!|R 'b!xq!Ij!_G <-!|8 i !uu!d5 jH#$N yt qf!Dh!63!gj %% 0@!A_!]+ sC!T/#$h#$1 _E!o$ 5V!(i ('!{? lV!Kk!W! j<!X[ h&##+#$_ /R -8 05!~P!yJ =; *' XH!S! EN!:@#!} [m a)!>' :u 05!YN!SB!;y!R=!Uq J*!z* dn##R 4u#%A!B^ TM!aW!;G!yP E]#%.!|v!X? B1 #n!qk +) HH!*# :X /!!M@!R( lV CX ]Z B1 +-#!u ab 4H!7* PM OW o# EN O. CX _##%e (X!7O ('!mo!zx 9.!js OX!X[!4) CX tu!G; :p#%M#$1!K_!)^ FF!KJ Pk#%n!~c!%b#$; B, oF 'p Kr IN!pL#&' It!RM hA hO!L%#$;!?)!Vf (g!~P Q+ |{!=!!]T!R( 7b Dx##Q!X= )H!Xb D7 %1!@K!'l U_!RZ!X[!&R# u!2$ ?m O] ;q!jb#&K!_6!7T!M&#&P!&l e0!&= =_ 6O##m#&W!!a!6E!qL!~< F;#!0 #a!b> ,G IT!`; *7 }t!,F G~ f{ (V Sx h# *e#$! ;q XD!({!yM!QH!S!!9' (T!ym!e/ p% %. Kd HE# . Jx!pV!>c gF!t, -W x}!~5 L4#$H!!E Zt!dM C+!Hc#%G uT Sx i8!V  'D!ye!k4!z= uQ %k!dZ!R( gG |O!mj (m!zK!vc!z=!Gl G]!l=!hz ,% UW JY k7 +=!em Hp#'B G[!2- 3|!&( (T ~[!{R vt 6p 7f##y!wB Zt n !9s Y#!X[ ^g!tL ]5 /: Jc#!4 l  5G!4$!yB }v!Vv#$] c-#'b!V0 X4!W>!}~##a!!L n!!XC!&m!zR ]R ,_!Ue!W^#&^!)M x; K9 x= Fu!i$ iK! C &u!_9 !@#&u ^J!gn ~b Pw EN!5n!)@#'n 9~!P| OO!Y[ ~|!{!!nA uH!yD!ia lA 33 ;% =O!.!!45 IH# ~!d[ Jz H&!HZ 0b!1:#&V!~>!NV 8` &h!rY#(<!oH Zt!7y %j!E{#&V#&$ L`!q7 Py hg G% 0@!BO!Gh!TM!aH#'`!<f 99!K<!uP {a!{Q 4| }C 8~!U]!QP!zP ^M x@!>/ Zc {a#&^ L4!&x 3#!7J Ig 3Y 0@!7Y!k, Ft!rC 5u!.!!-/!v~ 'Z!,c ,P#), Z=!_~!Vg!hm!$t!z/!>p nP *r!Z? <3#&> Z=#%k! R!fl!$t!w*!#x <= C.!qk 15 HH#)-#&Z!qB#(v!)L!ov re 32 ;e <3 ,d#)Q!,G!q*!R( Z;#(6 SQ!>f 87 @d!BW#(}!BP ow!jh!]U =O!vD!:g!2% A|!U8!qx OM!jr!qp!52#)`!oH 8 !Mp )=!Uj vn!zP!j~!5'!r*#(<!(n!sM Lb (9! S :$!zP xc!k #*$#)$ w.!6_!T~!at =V#$i!8q!mE Dz!;R#*%#*1 k0 6J![y!UE#&K Z6!~/!mE#'k K)!5D 2@ <W Ly!z,#*,!r4!gC!v^#(< ?.!A: fC!#_!9I!lw#)t!==#%E Qr#)`!vU!E# 'x 1P#*J!)?#*W!*j!{H ~V {a!hN f9 p; YZ _u Y?!{9#*7!k,!(5#&6 KU 7T @` '7!#l#*5 ?.#*c!ml#!G!ml#'k 7P!:$!Xs gS!U8 K)#*z @4#)!!U= +q!x9 9(!ed QE @d!$r#*L!!A#$~ oh#'k#'f#!R!h1 Yf Ig!hM#*A cU o=!rZ#)l |- T?!gt '/ >L#+;!on#*z ~p ^|##s '? SB!Dn >0 ye#)Y!d.#+2 :w!.g xL#'k#(7!+{ AS !X!h3 Eo#+= h.!/#!ch#':!|v!Xw! r +X D/#+<#+T!`N 9L :+ (J ,`!z0!$7 >7!u2#*@#+k!}D p5!X[ U7 Sg i8 FC!R-!S~#+`!CD!@l [R (J!|v!:7 JV 1|!LZ ((!.!#)-!hR g?#+L!`;![D Fr!B]#+R H`!{:!ah bx!{b K7 hO!0^!$~ ;x!Z3 50!z/!R0!#J ah vE uH!~8!MK!+o!fK#*J #M![  {; V@#*r!z6 uG!#~ Gq PH!Ur#)[!it!i( (F#*r yt!%V!+: 0[ {] 29#),#+O!xR!|s!]:#$n#&K S}!Qf!4f#)*#*V#)-!Zw##4!Xi (' ~6 A^ s/!BO SB#)f!4A#,O o< sl tp!X[ N&#!v#%>!zD!]4 xb#,C#+O#)R ov!Vj#$(!>Y [` kV s} Cl#&X R] *t w= T= Ee!|v!R^!0l Dx#!4!eT#&X!!=!Wz 8G!i4 ~]!|C!0Z 1V!vb!WC +)#&> iF k% -# U,!fp HS!:@ P. 0J![y 5u IR!&R!y@!f6!RY Cb )2!~c!1+!9c /s!ze qy#'<!+[!*g!S9 II!iP FR Xx!@j!l4#$T 8&!|.!ZL![q LF#-k!|o I^ Z  iS ,=#!4!LH Dx q2!%D!Fn F+!Ux#*y!BI )q <|#(L L& CX DR!}9!f!!:< Iv <C I>!*H!cu 50 >& O6#!w!X+!b_!QM#)*!~>!^k!0_!Gq#.8!cb I>#%3!c]!zM Iv Ya I> ])!Mr 33!ze!?d#.4##/!{#!zg tA!TM HS :^ :% (?!?K#(e#$9!+u ;6!le Wp#)*!|-!Qf 9Y!7e iS =V# E#$P!XI!#t!N%!UC!~> on#.f #l!YO 8~!~P jE #:!Xg!4G!HZ#(c#-x ~F#.r 71#.2!~c#!`#.x!Zv#.{ '0 ?. <[ O`!jy#(m )` Pt!]] Ll#.y qt IX y>!.n :+ Q9 VK j_ ,P ,d!(%!Xp ~0 8F!U, Hc DC#/, +u#.q#(c J)!:, #S {h#$,!U, ?Q!M` op }M#.@ Hu!qm F- 78 FG#&5 II f)#!D :o t_!h# *0 Ho ?x sp!h+!.u!U, H1 cc :' kq!ec *J!^R >W Iv 'O YM!?O *S 8Y cq#/, cw K4 C^#&7 sp!{/!HV II!OI!:E =& Q9 YZ v}!7)#!_! S CS!dA x$ Iv!yp!=2#/8 ]- }M!&k#'f!r? ^n k3#-Q )H Hg >+ 9T![t Mb!3T yt#-4 KM# 1 {N!Tx 7u >+ ;; HI!m]!&x!{&!~V!6G =.!gU!Tl ds!=2 M` {p!rV#)' HH!J[ h9!## P@!U& $( d;!Mm T/ ev!N< hA Du!<i!M4!Tl#'y!yc#0b %3 W)!~&#0f TH!'^!tT ;'!!1!:E#0U 3|!<a Vz @! ?x Xb!69!${#0u#*>!'3#/  EV!$)!{9!gN hd QF Px M=#0`!:j!6` &_!Fs#.d q: iD#1,!L[!TH Jn#)p#11 @P!$P L4#/{!l?!+$ lf!'` I&!@A m+!_` -m!8(#/I!)j!qY ]d!GN ;'!KD!:E!=P tw!v% i?#%v!fd FG /X#0i#1P zY cc!Mm 'X!1  )F##u LQ!,9 h;!T<!uR ]x#/^ ,; 1L M+#'5#$v E- ]T }k!$) KB!M` O} f] 4y n #$u wB!;l!7F!P9!$)!&l DC#/Q K; im!S_#%p Xp!`.!*(!Tl!5R#/7#1k -7 pH!s; CX p, @6 wK Nf *V K^!<F#1` %*!t* 4y 0@ cj!)k#(]!*3 I4 .;!.n!&I R. /@ |G K0#24 R]!pc##~!Yp i?!~J ~F#!M %3 G+ E! ex!I<!rr Lb i4!?L#.v!(< J1 ~= 4y HH ]X!#t MI +e!#d#.v#!f 8o Op EJ##1!I<!aD!g0 =J JW ,6 xG pE )-!Tc!,W HS y> D# %]!9J L|!)?#/+!!_ +p I(!,W#2@!5c!$e ZD!Sj#0`!OR Q* M4 ~^ +y#2p#1> n= Ts 9n y6!.n sV IS!*V#/d!~P!%n# $!N3!5s m<!!E cc _]!`K!y! nO CX#.= x$ M> Y1!QG Rj o,!#P!rx Jm!|^ bX mW!G& ;b!Uq!JT!:E I% Bx!NU @d!un a/!FY u6 /l!i}#1m!:E!wm!Ut Bx L3!~2!|2!PT!u[!>J!Rz IZ!LH C* /?!9L!&a#!_!JC l?!$L!SE +p!K3 Z !+X##- Ig!-R!:E +u!Z&#/@!#= 3(!vL! q 40 6_#+^ {@ ,6!u>!XZ!F>!{1#!$ e2!._#!^ PQ L@ Rj!2c t` u]!'9 7[ Sn!KQ P.!3O )O ^4 QY +B |d#+J 8a IZ Sz!*b $y!pw! *!8| xF 94 3} %l iw N.!lB#/R!Zq#2# mB r-#2h r;!vN Ys!/5#/R!a> J1 $1!us#*D# r vI#4R!l5 zK ;, @X SS Vs ^0 :Z NZ kZ ,N PS!0D ,C q/!K& #a#4P _H#!V!vh NG!b! (S!,V!0A ,6!e< vr!4& vr ?@ =$ ^E Y(!Nj Lk #0 #M 3i `/ V@#5) lF A`!#] ]P X{!.r N.!O5# } ym >V#!) [2!2J Lg O} H` I}!ih!}8![4 Lb IZ HI 9c hz!Dy#-$!+Z C0!kQ!N%!R@#2F #k!/~!-!!2A#3v# ,#+w!1~!R@ JL Gv S> '7!/t#56! ~ Te!w? i3!X[#/u O]!vD#3y!2M S) '?!tb##L kG uH IK",
		"Data Chunk 4: iS HS Va vE &}#46!?~!rY#-!!U~ ,N iM TZ *a X&!*}!WW!ZW!rf mg Iv!tX ~{ lw#/u T| S)!&+!Wp#5T 4z#/U!@j!z_!OW G6#2#!3S #:!{x AF Gu!9<!z_ +$ ;Q `A 0] hn!nr!?( fM ,6#!j!z_ 7P!J. Sn#%6 UD!_X!d} No#6Z Ux!Y[!LE X0#50!A9 W{#0+ tf#6@!{| z !;% e} Gu dM d%#+V#+U Pl#6p I] 1v!iT! o DS a~#6-!d3!4n#6O ^} 4H &_ @K uz kH >N!&L kL!T$!0^ =] SN i0 :: u~!4A .9#(~#%, Y{ !|#6p!:H ]E {A!vL#2A#*{ :K!Yz!;f#60 SQ!_{ d= uX SP!wu 99!}u#7F Rh QP 'L 5M aW vz qK 7P d' @O#!F#7E#)# TT#6Z AL!Ue }M qK!qx ;W eb!>.!k: `Z Hh#6Z T-!.:!^;!&) Tv Di#7/ ^_ [> `* f%!qW T/ :+ y$#7r `/#+? ]6 ^&!kL!Mh!*j Rr 9i!k3 d' _*#$6!$2 R8#4# [j zf Pt P4#+: QY Nc xJ AR! Y!Pc 0]!hw yN tl!|R .9 Nr!s[!Wm!8Q IZ N~ ]W nM <D Qo t= Y2!wW#,% iC#50 j+!Qw!:7 vm#6;!9w!CU!wc [i#8E!g/!k0!(i!%n 0]!wm#!y!AV!8l#8P Z0!!f vm!Yh n6!2$!=O `Z!sl 0]!/)!#& 1R!/O J= =: |y 'h!?u#1u GU#6' !| {(#1i os `` V@!-V!t,!^P LY (/##H#7e!:'!.D!x2!PW#50!0&!lU!oZ qK ,' J= X8!1>!.* IK!^P! ^ y! tx ~6#95 M+ Vo go#8E TA!{%!1[#8r +$ 0] g1 H|!ne gQ Ii!N,!XE!+: rN#5< u4!2j#53!}9 c: Ii!r !&k!FQ U]#0;#9T ?_!xy!3D bd IZ#$? k> -B ,h tC#50 bi#7$!d4!E, Tv!D& &Q#1F!#S Gu#'%!:p Ft!,-!G) IK#!L -{ -T =u#8h#9C!-* zo N[ PA i5!97!&I!KJ /P I%!0 !:O!ha }* m% [x h3#/S 3~ 6*!CT#(s#6O F{!WU jZ#09#(B Rk!K! u| 7s UX#5x!I[!5J 0c iB ig R> q:!+X!X] ;- Rj un!/1 MV X& Bz 5J!=Y $+!?z [a!%1 DS!?Y -_ J$!]` Y$#:V!1<#9E >| F,#7M#6,!XM jK jS T!!:L!I9!mK Ll!-g L-!U]!fG q% 4V EE Em!R<!r  Sx A3 LA!'} ;; |>!47!7~ $u =m!qO#8|!Mb J) Wu sd#.$ ZQ k4 7. ie!-*!-s |-#.x GG XZ _5 k2#*l k~ T!#&p 5i S7##/ f6 j?#9= ||!Lx >. }|!hu B3!n]!3s!Uw C/#4+!:{ =x!K# k4 ~[ _6!mn &r#4K }|#+- rU s) xu Qu!|M ,M!(y!dW ;z .= r8!hQ!2w RD -T %c Ny ;l!$F ]& JT#0$!8) ?5 p_ Kf!Mu ,X FK OB!o) :H 9T!o^!1= p_!^R!rt!6E!$^!=P A- EO s+!7z!3b!?7 T} qp!tS Xk &b ER 8>! V [0 )(!s* Pz -Q!W' Yj 1|!6O#9H E& sS!^f!4F!LB!Q4 8b!9# -R!/( K$#<3!1G {v#2] v} !X!m>!X! ]I!+Y dk J) 2/ ]5 C5!~`!`c s9 -*!eV 3~ BA!*!!zp E&!,+#0D!rA Ow }|!<n 6M!#w `q!h5 re ]q k6#&M 8| Kf ;g wd ,!#;O ?V Jd!~6!'k O9#<p }l -* E& 1S E6!Ra! / Qa!1s ``#%y }7#8+#= !&]!Zl U+!$S Jk!hG!B_!r)!&r!Is#= !B1 vZ /9 1R 25 JT!(3#(t!<= [| }|!/o m< Bw!TY ~r E%#=( Fr!S.!:o ;' -?!]>!(_!-X yv JL#=3 99!A?#7u!Tl GG!G| 2Q #= ~^!#l EO!(?#$X#:<#%. -? po#0V _A NW H4 rr LY!.X!ch!hm!on 5q |[ ?3 9i!+f#=a M2#!T MV! 2 -w!_i!C/ 3. MD Hc $5!0Z#+l!d@![A -w!%p!Ea ?[!}' ?/ Z=#;^ La!7O!!Z )>!>&!B^ -O Ug!qm!IA eb y! kg#7<!)m Vq!!= 9p#0S ?{ .,!4E P[!vl I%!_z .= W) /^ mr =`#9~!l@!gV#0P!gV Yx )> M8!?x (R!l| Jd!9m ry!w@!:J!`} JT!]>!'M 2|!fZ )a OZ!o8 ;N CP!d[#2F 3O!dt $p Ew!4A &Q ^)#/4!2+!`p!gF 1[ Jx CP Or!lU!(Q w#!8v#>< :l JT iF tR# E!RG 8>!U5 LR z{ O*!c* JT u, Gr!O9!z #>g!dX#0Q {D!dC JT iU Ak K#!pl $t!gx!Bw!d5!By#?/ ?/ #a Xn!WC!yX Qb!pO!St =9 <( }d!C# (3!u9 #A wQ#+3 kL!j)#?N #A#?P 'i >c !n wQ! G#?L!Mk ;8#?O#:* 5p!!m#?@#?`#?V oh#?c#?Y!&I 7. 8Q#??#?_ [r!Bx!d3 ;v#?m V. m$ KW!v) NV _r#;:!m9 KR#>$ Z  DB!up WU F~!m7 er ;8 !n +b VE!}N!Rb#?^#@( jX#:< ;8 E% -|#$; ih $ !&l!Rp!WS >t#6e @H#>g!~u `X#$G!hW#?S p  ?E!&> @H ., Z;#(s :C#@:#@1 =6#/L!pc!^*#?Y Oz##K!b+#@;#'d#2O!eX _U @H Jd!gz .y!gj n~ ,a#@2![~!K. jf l) Qu >*#>r! ] Wg#?t 8_#@_#@U V. by L^#?q ]Z!M^!-& @h#@`!MT (} U, g_#>E Zu#?7!mE#@T ?/!V# +R!Ze#=k!$T r[#;E iF#$e#A(!Sa!!M v;!wB Wi cM G| xd!W$ 7. p+ f{ .X AF Qo 82 dC OX!,^#@J#?w b- 6c!XI!lw 82 x&!KK!vk @h .O X1 5f!}m! r Qa [F <D!zu Nz @h 8> R) is <  ;a {b 3<!jf#A/!Y< LO#=J!rn!lI Aa @! 3<#)u Xe!'E!W0#AA!^a!q$!{2 #S ZS X! `` 4R!<^ AF#?? Zz [Z Gl!xg!on Qb U!!`{!c( F, W. 9-!*# >0!w:!!E Qb dh!by!$?!U, JT T4 sN!/A <Z#@'#7[#B2!bd L~ EO j@!}Z DL ;8#;z 7b#@M!lW!<1 &?#B5 w5 9{!`]!hN Qb#77 l3#BH#4(#B5!>4 4P #j f6#BO!%@ Br!j5!m9 }d oP %- Vt#BW#@1 u~ ;E!+1!To /) Gf!#] k~#BM#AV b5 {N!t! AF JT Z6!fr#$a l$#Bn @3 vJ#=K Iv#Bs!.z Kn s8 (e#9~!U' NW!Bl!ml dk#?%!4e '/ m. <Z#?q Bq!Tj ks!?M#=a!4e (#!3{ <Z Jd#C%#=V#?a!O) pE#?0!yT gK!`)!^R#B% ac#@p!X0!at#<( Us 'r!ye!2I#@e!p[ eq!cw!L-#?m qH 0p!IA#BW#>g#%]!^4 tJ Oc C=#@s ~G 7X UC!`^#@F oe!bl `X kG ?{#?Y#B@ &W#2X ;) KB Qb cG#-u `j!G5#?Y!:N ,?!5A#Cn#Bn M2!*Z gN g'#?Y!9C A! uW!QW#@w iR#/@#..#6e ?/ Lo HB }y #j QP#Ac V]!m+!47#BN!f* SE ({!yW#>E ^k!zL#!, %<!:B Bm Z0 /, Z;#Cn#C9 ]Z#2s!`; }_ 8> mI#?s!o$#BC#AV!:T (` -1!CW ~2 .c!G8!^. E7!+[ ,` 3< qU!ai au }d!4^ B' 0' ;a#>#!^w!/B!DI _g#?^!X!!2I -O!_a#A# V.!g$!.)#=7 ,a jG!U9 1m ;e#0S Wd#7[!b<!1r #A!Y4 Q  49 t8!(a!Y,#AH!t|#3i#D~!HZ 2| 1`!_9 hP Wd YK!b/!cA!ks $) m5 0W <| >F!B~ $)!MT 5f!E*!;% L, E%!G6#0L!Hf!YC!-s 4(!bK!D+!VO!GX ,K bC R. ;@!*5!#: $)!B= .S#E> Iq +7 ,K!VA!i* `o# m#9~!S2 fX!Dt#E?#0u#EA!dF R.!-C A3!-g F/ bO v/!I3#=Y !n#2} +G Zw }!# m Qa!sU!%W!fS!=P#(c Qa jq!&x eA! ~ #: =$ X$#>L#Ex!fl K%!XT!%d *H (h!h3!6*!XT js!FS!9K#)H!$* a!#0d 4q!o$ #S S8 ]v YK#Dq S< F; Qa `R!&x 4q!>W AP#9~ +] uU#Ex!n(#$I YT bO!yG!x7 6c#FF f& )m!FT ti E #??#=[ I& p%!^* }d!X? +Z#FI#!c !n!y?#FY s[!^i }d [P Vz#Ex!]H!YP #A!oD +Z */ v4 #j zY 1L!%#!l} UA!Z-#FW#E6!&m#)d!Kk#Fg#:F#Ex!d[ YC#Fm N_ *H#=V :I ?Q 1T!3H#F&#5K#Fb F{!<d ,8!w.!uR 1T GI!D! )j LV#Fb Du (R Lt O7!.m 1L W_!a7 bm ?w#>g u #)' 0H OF#Ei!JT A]#4- C@ ?9#??!]D#)' 0L VJ 8Y 5s LV# d#69!]+ E%![(#)' 6_!nm /*!6S#@p#$s H+ #+!hw#Fo +J 5=#G? 9Q!y3!9$!X4 <z .,!O9#)' &v!kp#FF!RC h;!LO!yy#GE!FR!&m bj!g8#A<#!1!~G!mQ wg!y*#Fm#Ee!yG A| Qc#>x (r!_0 /Y#0i 9>#DZ C{#FB $Q!l+!eu#EL MY 3[ ~S Vs!s_#G% W) z2 &H!fs .,#>] o> &L#3[!e&#GE po#F+ 8t!g8!Sn U/#>o!n&!cj!n(#:.!/o#H@ he!k|#D0#-0!2R K!!J  1S 'z!9N!.> J%!na ?.!ap!c@ +n!t=!mF ^f 1L#FM 9;!m?#+j od!Qx 6|!i@#CC!?{!%W 3| i'!h@#>E!X! *z Uy!Ie K]#F@!xQ J; 'x!jJ#D` pH!p$ D% m<#?g Av 9z :G $4#AK }h!-z M-!N4 ^O yB!]> HQ O[!j>!i$!ap Jx#<A##5 qv +y#Fg!9# Em -6!Xb!k3!ap N/!6,!n&!.Y >C 8> bA!QZ <H!t^!#B ,a!;$#8!!d4 E8 )3#GE!Be!%q#Ch!z<#@e!yM!<=!Z[#/p 8&!/o!eq +m U[ -9#AA!a-!OM!Vh#6i =V#F8 Ln!%0 @l vh CR#F# XL#2B RP!#1 Ig Lz!]v CW `!!y! *n#D~!RC!b0#Hj!TH#<U!Vo Ch ;c#Ch!!I#J(!Y` K: 6C M= SF )Q!YV (#!y7 =V!eA#D~ le!$L l? M= ,' '1 x! 6x aW#*5 ~6 2K B.!Rf#%z!U& gt nO A] 1n!Y) ,=#>g#<t#:= -E jZ!G,#J8!&}# @!~}!r$ (i#F] jG![e r` ;' tz f7!G8 *^ w[#-e#Fs ^V ?$#GB!Al!UJ#GP BN# ` *.##/ c?#Fm!d9!zX!3y ;'!M} !P#)?#Db!>.#(L N5#G%!/H#EI!1e Y?!Sn F2 C} ww C{##y Pt ;H lQ![L!2l!Tl my!!n CN!T> tB Fg#K3!{O#5k $z!{U H  zY A+ B? pe wF#K>#Fb!%0!a) $y!P> H !h5 ad!Xf |r m;#K2#KK xw Pq sC F !_w %d ZJ!Mp L#!tj (J#>9##j D{!yP!~0!X[!Xw |+!To#85 &r A$!<f Ln!dF!mP!A1 G.!^z /P!Vk (J!-g!c!#Kc#Fg aQ# q!6G!Wd a9 #g!e~ (i Rj#'K!qx!fE vc 0P#C;!4y!Vj#&u r7 ev [P |+ Ew!5% f7!P1 :x 1v!]Q#(G!fA#,`!H[ R(!h&#(6#G[!l+!{U MJ Fu R= >-!H5 Nh RL#K2#>g!7= #K!nL!Yc#$T Pt!Z#!;> Qw o^!W^#<b!+P#3B!K|!WO#+o K!#HB#/m OD!YO!ya!.F IP!hk#E= 4V .Q!hN!*. YK!SY T3 A$!6= c?#LE W,!yj!l>##y K^ qf am N; z^#(*#K^ $b#/p +?!P2!Wd!z0!sV!4j!i- jj!ze t_!6P D/#-C '| -8 ?$ K) x/!T~ VC l~#Lz#Kw!Vf#(P!f_!XC!Nj!:C |t!SG }>#K&!oH C- sp!t/ bm!y^ F(!#z!:C p(#/<!7W#%A m` :b {+#=o!6-!kG ($!)? ph!$P!b) MF##m -| %L QC!KV!Z[!Wd!uL #O!J1 4O Ko#!4!C/ jC!t^#A: O+#Ll Em +` sc WD J) gE#&z!|o ,z!Mb#=n#-v!Wd!ka !^!RC o{ +`!P|#72 (> 9e!/y!zB yO <W!#`#-` gW!X0 =a +` yr uw!29!kS L7!tX (>##/!nU ( ##/ kq!)+ dC#0s!qL#$N LA!!y#N= Qo!-~ 'm!!E gR!AH HM!2:#'^ Ce `* gL#%A!un#2u ~) 4]!?` [-#;g q3!ZI!gF!6_#(L#:C Hw!7* G) p~#)K kh!8]#><#$-!lh 'A!Vj WB!IY A]!qm 1J#7.#Bz!_l!QZ qP!T}#'4 L.!Ki#%b Y~ s/!bR )Y EN!we GD!ze >[ Hw ~g!l& 'A!X<#.m L+#!{ 7. |(#%A NS#Mi!Xs QP `D!P<#Cr##M!Y$!@( :@#!B!pI N_ GF K> }<!UT!U1#+*#!W Q$ iX ;q U? %L!Of ge KO!>4 4E#&' g> Ch H4 y_ v; +k #g!Of!.m z<!Y9 hI!93!YI I'!gD C9 ?Q#.( MW!t, /x#-6#2] v<#!I#'L!&U AA#!^ 0s!Yd!I} &b SU!Z8 nL .X#OX!In# m!)X Hv#Og!EJ#3M!AI!4F '& Bg X( {s#:q!{&##>!6a K_!*%!XN!gI!dj W^#:7 zO!Z& 8&#'y A]!Yh!fu m<#4p!6G!ZF (z Ko!d} KQ k~ |t!+4 HM#2w ;S#&r!M( Te '3 Ko C# (M HA#3M K2 Rr 'q!LN!PU dR BG =u Fh!Ko (M 2D! e .x Ko#,W#Mq#-]#H&! J -o Fh!_9 (M i+!PY!Ay S1#@D ov#<|#--!ed */ Fh#33 [?!f+! J ME!hi#GT!~;#&B B7 Yr !}#PE!8R ?<! r 2e Fh fT!'_ ^$ li#Q%#Pk Hx!YC!8R!xE!~m HM!+9!u?#Q##Q1!6b $F!6l!W-#Q6!4j @9 SM#Gg!qX!L[ cy @0 |] {@#Eh 9p!,4 @P!&&!b} li#&A#Q= @0 0p MF#Pm!8R!?K!Z+!l^ Hx!,| v3!)`#QI AS x^ S[#QM {=!y& tR !} q:#AO#&( /Y LV P/ gj!Mb!8R uT#QV!E8#QF!qe!KK!}R 6[!%Y#E9!8R!+9 ys T/ Ga!>4#=*!~N ?o M0!-/#Q~ @* g- := $K!L1!Es#&4#Qz ?o#:B!9z A]![_!{h PS MF iF!<t 45 Q7 ?h +8 .B#R, 9Z!'~ 30!L1!FY!Yz!M^#55 4/ K~ rT#PF ,g xw fB MF!5c!pI!f# n$ ?I!?!!:G#Qs _d!MT!15 HM!<: E< .W#I! $G#RB !r#QA (w $;#KX YI Hx!l; =A!*@!|1#RM ,3#Eh j>! n Zm#8' X~#'[#.y!|< Wr ny#Os cK!Ti i,#Q' N #L: X, Kh +F Co![y Nq ?G A= &2 SZ!]/#(n Z~!Ml!SZ#:B!ka!Z& 69!To!yp#:7!JX#0C JC#0E >##Q|#H.#:q#*b!!e#7l !}!O)!Up!MP!i}#/i!#m!]4 (M )' ay .?#SJ!#.!;F#0Q :/ +k Co#PR iM!G8 ~{#Ra!O)!go (K!{n O(#S]#QA *+!U# XL o6 Xb#AN#OT!Rh %0#S] v;!3v#LS {n!DN!=6!# #(:#1- ay Qw gJ#AJ#((!K; @V A8 FS!]a#:2 <z#Rs J9#S: )=!Gl }` SZ Q;#H` OP#:_!Rt 3i 4]!-O! W .[!PY 4, Rr#5~ vX#CU ;U!aE#Rg!YO (M!|u tP#P~ NB !R hW!tU!qZ #_#Sr ny#RD <c!-* k' YH N_#0i#/Y :/!9T Co!pw (M ft!c* N!!4C c&!U| Xd!y_ Wk#PX#AJ -#!d.!-B#Q9 }z#JM#Tf =;!E{ C~#Os /~!NP @n Sh!cM o# oU PO!y6#S~!q^ .X 0x!v9!t2#Ty!Q*!Y;!jC X4 :?#Rs#9 #U#!NL!e, }& Fh#:*#Gx ft L: Y3#Ne!bd#T_ %E!o4!lU Ko j_#U5!Jk!FC#Th!T}#JR#0{#GI N; &)!:g#UA!,:#Ta Sh w6#R8 %* `+!)^ &l Ko ~.#UL Z' >c g9#Df#UQ %u!em!#o Zk l_#UX!j8 WM!E8!2*!J'!06 $ !sU DE!UF#Ud L,!XT Hw!*a#R8 R+!Z3!B0 Sh!?d B! Ou#Gy lW#P~!sR#Ut *0!_9!`v!I}!r'#T{!+j#UB OU )?#Qk!4R#>C 2] PZ!Cp##l kJ#Uo 7[!tN pz CN#75 ,P O7#.j -k#?z#4D#UB 8/ ~e !}!>&#Pa 'Z!h& 5> M) YV!pl#V@ P& 7I#Tb EE#R8 '| {# Q4 zY y_!Re#Se Ot e.#TK Nh!iH C}!.##Jb!n; #M d@!7S#VY#U|!tk <` 0N#V. &n T8!e{#Mx#CV#Uz e,#U6 5`!CM#Ml @` i> %s W4!h@#4# o} c&#Vg#Vt XT Np Ed#V` -= (+!jc |8!Hs#Tp#R( wd ;n#Um#V9 6.!}%#I2 ^t!&;!=I#/X#R4!nN#NZ!RC KQ Wb!y! 3< gW#8z#T@ i} ;R 1A!>` Q;!B}!}' T #:Z Yf Q$!}+#R? ]r!zu#WG y: O4!// =. ?/!j>!e/!lx Xb#T( ,U!n( 1[ +` 7R!>Z )= wi!,K!mo #@!l% li!tT!ha#V}!xj .X 4:#V2!gE p~#,J#:& )D 8M#Ll oV#OK!%d Nb .I!lR >4 kB MY#SX#PA 1S mr #5 wB M?#T.!h3 F/ y(#(I!R=!GZ!$@ 3^#VV!oZ Ch#<6 '`!,K#NM!nj!8i!^(#28 2% 8Y JW A/!Uw!:h#Q. +]#Wu }z#4O {h!SE!m4 GD!4R Xn!hK BR J9 #$ ks#LF +e#XM %n zI!VT 7_!y/ 2Q H` rI J>!Ot!dO 1A!#@ Hh!Z<!-~ &9#*l!T> gW u; =V#;r ZD#Xf#9H /x!ZI :4#C# 2@!kU 't!U]!Ic#Xr :g lF @B##/!wu!NQ#Xy!DD!+u#(/ q4#Sv ,k!x0 Hh Oc R> C* 2@ 6( O4 J{!5>#3P#I##Nz {]#.  ?V e[ yW kB#>z#6y#L;#3i#23 dz#O) ;L#15!Ok#*I |B#+5 fg!fx!&/ <W `5#$H :1#@B!k< K>![v#>= y  kg h*#2F#XO F( Ak!o$!#  8e kB!$= 4v#YZ!^) 1S#O' |L#.i!,=#Kr#K9 O4 R]#',!&4#%@#Ow!m? ^7 *6 v} /A M)#YX >'!7{!yk .A#O9 ?J!UP!&B l_ ad!I} P{ SU!8*!~x#Z) <W#YJ!UP ]/ g] Lu (  jG!Oh T~!#> MY u1!&p!aT!eR |7 Xp UU )&! n!*&# 1!t$ ,0 @! {G#)* %t!Fl `t p~!p5 wd BF#?,!S^#0p '[ D/ RE!^J ^O ?Q!&;#@r k$ t2 -`!}x d@ s} K# wn EJ#Z[ -t ;q Jp# K /J 8& 8K#ZW *-!Z6 R@ R= d@#MY!XY#?[!UB K>!'f!UP +h!la Gk!v, PY @C f=!N| /& KN $J!:[ 54!S) h6 Q; tb#LG!r~ /&#Xa!oW#(4 <v#25#*2#Um!>7#;: ji#Xk SF!Rm YK!.0#%? $[#RZ!%L#*} ',#@z -`!sE#OY D=!y7!5n -9 gE#U3 {( &P#V)!m? KM PX#)+#[L!*D Bb .{!ll#8(#3r#R> -`#MN y_#L3 %&!RS ,z#S2!=z Dz ,. *Q .8 f6#[d WD 9X!LZ Io#S2 q2 t& sx#A  .K K^ y_ bO!fW *f!L7 r7#Ur!&:#(E z,#1y gW pN 9z *+ =m -9!%.#R<!:-#M&!oE 4u!-g y_!fF 0x mn!,W#Qe!v}!p/ D$! y MY UE#P1 W)!F[!8q -9!!k MF!3f!pV#Yt /g#VJ!bW !# $2!gj <L#S>!!W!rN!Tk#X@ 0y!:B @Q!fF )(!+M KM#Q?#Rn!;+ 0u!a{!n( k`!q1!C{ 0I 0L Qq m.#SJ!!T#P@!;b .'!Yf#]B#X( [~!Yv >L#S2!%g#)w#!: J6 -:!I}!FO!I9!>q 3K >L Sh Q+ vm#1 #(;#]q {b#[#!.s IA :9 `t P !2? OK dT!'y 5- G' JV#!` FX $W Bb!z`#SJ!$,#Qy!_1 ,Z!b>#WI!O} R>#^=#Qe!sl!*6#%Q!yN /n!]= Hw ,9 Z  6( ^C .' HI#SJ )7#+(#7j#^N#Qe Bo# @ }| {] ]2 Bz z$ c^!4l!e~#[  4] ZL ?$ k| Or `t#^&!8=#=y ra#^C 6l nG b]!?z!fB#Xk ,{#SJ RK!3x Gq#^N#]`#(6 G`#])#^$ wQ#]m t%!@x#^s#T>!O# '/#Q'#^U Qh#]a +?!|g -% 8E#SJ!&8!E/ I~!`Q#_( (J#5T!_@ -& HM!cu *V QX!YO!Z# SM!L0#8B!A}!S^ mB#R<!@' *a d;#^U K}#_2 kN!}]!)S mW#_R!}H kZ!Ob#^a!U' o6!Cq!;:!e#!hm 4` P #$|!h1!BU >F!UQ#Ra!;$#AZ Q7!zs!d2#UI!?f ($ YP#^x `.#Ry {z!gW#SY#_p P #K<!&x!+}!y! *@#^c EU g^!m7#39!+- }>!_6#S+!&}!,W Na A8 L|!+p#./!]U!+- S1#GF px 7T#[[ Nw!=6 R]#Lw#F1 -`!,s!X= Zg {v!,c )f Sh pe#S@ fy#9x#^C &: -A!tZ *N F' #K l  %v!w^#-i mK#`@#RG 1Y!k2!=m ]m W| #i#`N#)Y#:u bR#`L RV u##R0!hJ!5= WV :p!$S#D|#`e X| W) Mw!Z?!6_ +L!<f#6b#(.#`2#`o >[ f& $6 M?!N1 ~, <a!_l#HH#IY#`X OD#,D!5e!N< #d `7!z:!B_#Kg!Ba#a' LI#V  mt w& #K!*I M' _##'u Q'#`L MS y,!Nd K~ sp a9 7,!Dn#L #]p -9!LM Mb!NP y(#`s XD!E&!B+!>0#^Y#a= Mb!qE !P!LZ Yp ?M Mc#-O!+>#]q!W[ B]!.2 qa!N$ ?n #* k0!6}!X$!dF Gk#a_#SE V6!u2!Cp *< B< ~|#R{!4G#aS M'!8h T, ,2#^z 2n ~| (L ~~ I;!+- MS#FG#(c#0) JN 4d ?-!Dn!N? (W!?7! `#b(#,d!6b!z=#4K![( ?- rf!oQ#4[ $U!+-!=U!To!j| b{#aH W; N. P' )G!iK#^N -@ OE##p 0m#_i#]/!PQ 1y#RV!.M#]'#b.!^f!AT! r 13#^$ >4 G) h-!uD#87#bE g,#0N 8F#&J#]F CS EC t{ uk =h M8#aj uc oa Ch ;K#4K Gv ?] tU sO#]o j_#bi ?]!y9 IW +W#^= Na e2 {8 cP!>I uQ#bu @<!1< @b!^G =} QX! ] ue#*# >T#`L#ap!'M!o9 ,P#_i#_^ I> u~#*Y (d!{1!+- O5 w& <=!n##_&!W[#.4!== w[!rB#_? 7R #* Zu!jo!wl#^U N; I> bL#- !XN#^C#PP JM!r@ T!!3s hD#c)!~X -j `i#Q. Gk %D M~!gn!=>!qk hD d* X! ER#6c#[< G' Lg!sl!n2 OD!Lh!Z# Lt!`Q pP!0V#^N YI!&C!;_ d* UC =} OA FD#Fi!!?!zZ 'l#ap#ZP Dl!2r#^m!v} ?-!B=!{B!1p i8 Gk @V E}!== %,!0R#c3 QJ#!e kf#*| R3 MY!x0 4&!5+#<R -- Qq!Ut Nx Xb hE xr!LQ R@#cR!-6 2, 0/!(E#bb Tk!J*!w4#O=!ck R@ WB!XT cM PJ!'} .' h}#Ng!Q$#'8 IV#d;#Q? CI#`[ -, uq EJ!tN Em |) pP qJ!i4 ^C OA#G] =( W] rT 6# OA##2 'h#Rd#dm {R |x SQ 8) +'!zr!^k Lt!(_ Y= Ct#/~#39 3g#d~#.=!0 #c$ mJ#Pk!:C L|#Ys!j8!JH PR C !BP!#_!pw!(l LK kJ!j5 0e l% =J vg Uq#F8 is Rr!em >L V= |a OU#)v P^#]@ K} }1!(& y(!j%#)+ MZ!a5 Dk!7,#$Z 4y Wr LZ!(&#K^#[s Hr O1 n5#5T!`p qf O# JY h} qa#^0!MK!8> Cn!=[#]@ OR N7 7H#N# Y' .'!5n#eq!x&!/y!dj ]4 MZ!mf is Gu s8 jz V, dw!a6#53!2p#2o Uc >1#Fq##+ .'!^a 0k!7L#^q#GN 4y M0 KA!-r hO#9i 0_#UU -- V9#=c#<X#e@ U= X7 d`#9H# g -9!_g Uv _T#7]#YY#f@ &W W(!0b!lh <-#f. 5# N5 ZP xV!` #ez!A6 C: y0 V7 <>!L7 N&!vc!&1#QG!=# MY!!8 0k C@#e)!xM#f. QJ 3_ x& 2*!e1#]e!5]#f0!<h!bi!3[!L@ P) Z=!'- P$#fe W;!Fd!<h (Q#4d $I Lu W< g##B] Bt#H= ^O#R0!6R#g  1K!t^ C- NR!G`#([!#0#I[ Xs YB -- cM -b!sU#Im Vx _l#8u#IM#>0 MY $> XR!Bs V! 2B Bb XS M[ ti#P'#,r!W=!Z# Kq!5+!/X!)2#Im!?T 7n =Q!vF Cu y|#^y Uq#:5 2/!+z R  i0!*x#>i [J#^7 xk I@ ]q (?!]/ -9#Df M[!mV#Xq#]3#^n W!!=_ {R (R Bb#bo M[!.o![&#<7 .^ &x#fT Zn!0`!^.#]F#fl#@/!n%!Mw s( .^ Mo Z5 x& -;!:G#dZ LW `N u)#;Q#<f =v#Sr 7T#h/ UQ#_i#et Nb ;3!~<!qX /7!tN c- ]q &/ {+ vg O !L<#7X!GN#fd =v#SU FJ!jM )r#=D#].#h ![t uh#Bf#g( /7 Nh!y, X# O8!_G /g#hJ [R!8^ d8 |G $I I2!vc >1 U?!Bs#]. x^ WJ a #;:#]| ig!vc!op oa Yr#hn Yg H5 ^:#Cf!^s /7 OL#+Z!o&!Z% R@#d3 WJ A:#C| G0 -%!}N!vc Lo!N9!o$#bJ W; WJ!Hj!m+#Zv r7 Ka#c0 fS!;# .'#)W Nb SA#.G#D= /J#fM!Zf!sz 2f#cV ]X#i? <m!aO#i7!YJ W< {m LL!Y) -a Oy >< &s!E*!h&#g$!W[ <{!}C 'k!WC -a up Lu vm |>#b !Qw#i? ff!c8#.! /g Ka#hK!o9#Zw 'f#Za VC _l!ZR 13 Bb#dz WJ!aT#F=#F_ /&#Q, f@#Ge #f!*5#hb NC!KD##y#Jq#_? Ib M[ jG!,' K7#iv Nw f]!M,#/' -L!2a#TF!Rq 0J Qm#]X O[!*> om#.<#Ll!-e NR hk!Lx _w#aH M0 @N!O;#Jq {j ~T#`} d-!&q &t#^0#+F Nq ev!D4 '.#b !F.!vp!<R!h$#]q#!U!zn!t{!F2 /)#39 8A M[ h# :D!}a C4 T/ xE zf!fw#jb Oj ^;!<h !q#<w +y ME A^ Z0!b##bC#H:#i3!#:!;` ,T#_i#]O NC LH E%![X!Dy#hh#h3#)- r,!r< ,q#de#bo hC!g=#2[#jm Yg!Hg Cd#Of jI!tN #T zf#:j#K[ =y <` 7n S  '! R #^O KA f4 /l x@#c8!S^ Om#gz!g# C?#^0!W3 NC!ST!z%!j[#jm#g2 ]Z!5E#ha!2( KA p|!]m ;Q#k'#g2 ]K +P#j9 qf NR -R#;P!!h#8g#jy#g2!lB 'n#h(#f4 *< GZ!B+!Mj!)Q#kT#j% dn *[!#:#h& 2O!LX tJ!.v##X#jy#i9 T7 |J#*l 1a xD!j1!-T VT -j!fl wA P) Z' 6p!{q .K Z4 e0#8u#_J#>`#kj NQ!Hs!Lo!%1 R !}H#kD!h7 7z!W. /n T% ZW CW *V!kA 1a!Gw f4#XW#at!QG#3O MT ?I 5V!f5#lJ#kP!DC!#s r;#hh#l4!xf!]+ .k!L7#fr e0 sS 'M +s!~l ~T Np 11 B.!*X#%s mJ Va#lb [-!$Y!hE#kI#Px 11!!e!$*#jr!(l O[#9Z![3 [/!`= =y P<!z0 wP Nk!d #ly#lV sS#K7#3'#`4!Fd NQ b2 Xn!ny#]F#ln#l{!hD!-m#H:!JW!yS!Dh *d#ds#la#m4#ld#ZL!]: @c O #B`#DW 6`#m2#lz#lW!4F#>v#kI )D W< Pb!Lo '6#l>#`` e0 {!#l7!s[#H:#lt#?Z!PQ!M> mJ YB $s!`a tK!:W#hh#mS!~^ WO Bx I` *]!15 w#!#0#$q#mX#il SQ QN Ih#h2 xD q9 vt#mm! _#H: 6[ _l Rw .R#^J#2o up '1!+<#mb#09 ~T WV av qH :##6~ .K#gV!y2!/# %B##K!S:!-e up!2a!m~#,U mJ .;!7r w;#lM#NR!-e xD#Qu m, )C#l> OL!rK!R& aK#kI#jL!6R Rh!p* Fp!*z!7r ^k!Hy!31#_c#lE#(r ZZ ,|#c3#k>!F<!I=#,E#nU#k>#a4 A- {`#gU Ka#0Z 9k!8*#dm#e` d-!/f '{#_i#nL!7r#3` -5! ,#nj!DN d-!.z +P!L7 m3!7r ^6!o,!0c#H:#`h#03 8B FP =v!?! ?A!37 ,k#;s!o.!_/#k!#?F :D!qG#hh!ch a1!np!AW#6W#jb P6 @9 [O %M#g0!}6!+4!p#!v/ oK#H:#Pd IN qb 3G#^= Mi#!>!3Z r.!=D!GX#gV#G$ 1` /k! S!Z##l( cy s6!9t!(` <7 xE [^ QT#^0 Yh KA ZP#[w!y'#39 ^g M[ }b )n#9:#[V!Gw#oc!mx#.U 65 O> Tl =U sW#ol#kP!;Q#$g!y' /J#Sr#+I!I}#o` K} `{ ]R#mx 8` /J P/ xE qn /F!L7 D(#ob!3}!Gg!j+!MN#p(!VY!ox#oT#_'!;=!`-!g|!pq#iq Ka#o$!n& 4r#_&#QW `{#'n!7F!;-#of#p(#1x U< 'H#d5#k{!;Q#X&#%Q!GX!u%!8f kV '@#_: u| `{!gn!]G >T!p~#i8#k!!?'!e|!WO!Z# O #$d#VZ uC!'; -{#o(!3v!q$ s~#gm#iD#pe#k]#`4 EE#Pa!Pt 89#pA#pd a~#/Y#AO!GX#m8 `} <e !i#d5#kp!Y2 u3!RK 7X!RM <+#de#0S F. 0J#pA#lz!1G O:!Lj#)j#p|#jA!SH RZ M5#gm#`M $s >_#T5 cP!jP 0r (S (M }b!`,!Qw#q: Yg!iZ#b~#WR!mR!",
		"Data Chunk 5:(`#^z ds!z8#ck#cK#l( k0 -^!gc#_c u;#Pn T*#?g#c3#b( $s#er!G@#)S#g$#m{!15 [t!$a#cK#qH ^/#qa!M'!GX#qd m5 -L %2#kP#qj#Ae!S^ HB (M G. YZ#cK#ke#qs!!t#(h#qm up Yh fL#4K#gD#qr t.#qk!ji w4#k!!l5 J<#qh#r'#)i#q}#qb -{#qn Xx!o6#r/ KA#q|#TA#ql!(`#r5!ah!a>#cd#r0 z-#hM!BS#of#Q? +I Rw /P#r8 $s t.#TL!=##rF#q+!9C p~#rK#qI!tT#rO#qm 2O#?T q5!kS#rA#r9#er#rN!'^#rX#r, WK!N& KM#iZ 2R!qK#rD#1B#rc#qw T* K>#rT#qT#ra#rl#r= xD#BE Sr!d}#r^#q_#rj#&( /W#mA ao#qw!4e XR#rq#er#OT!qf#r= Yg#rw :E KM#mM $s >N#kR }*#qm#s+ q+ #? 7! `} Ws Zn#So#&'#s4#r,!0z +Z#]k }0!15!%)!]x#]d#qu#l4 D+ 6; -|#gm#g>!KT {/ =k ^]#s #sI cy 2q!LB 8: Yg#JW#oX!.t#rF#jA!*R 1;!Wo Q# NR#1b#ag!n'#sH#s_ cU#Rf#o'#k{ E8 v>!C4#]K!Pi#SR dv <j#o'!Gw!SH -x#n2!n%#qm#jA `| B%#4K V[#kD#8u#S( `X /J#n)!O<#3C %O#^$#t##l5 y- R_#b[#Za 6l vD ~| $Q#^0 q|#kD#gX %3!%8 ])#g$ VT vD ]y#c_#r@#m-#ob!%)#oo#qu +8 ^J TO rd#f! Mx#ob ]R#p0 ~^#g$#jL#-Z#?S!#~ Qq#G$#ob#7U#3g!Ju#e@!`,#qw Us!Ng Oc#)+#q0#q=#S{#(j 0r#S+#'H Y^!h[#t-#o| il ^!#Az!'  /J 'o KQ }I os#,n#gU#lz Mc#@H#2O 0!#gV!9P Oi Rj!Qt wq#k{ _T#'9 oK#%' KH#RG#m` vt f6!+  KM#jn!ST 4t!t|#n4#aC NI!`m +`#`!!|5 _Q!_^#K*!Rt#[)#de!U9 ``#Mx#'| ]2#t} B?!ee#2]#39#aN <d#s1#NT#]v!6' Ws!y&#CP k3#Z; 69 _S t.#KE#`^#gs KA M8!T!!]-#Z;#k> o;!%M#9~!Pp <L 2O#mv#>J#?j!}^#Z;#W0 Q{#er Ho n~#pn#kp!X, jf#Z_#JZ#P?#ir!F< [, e2#dA#PC :& X8!P=!ff#X% X( 1i d`!s=#ua!+f Ur##>#i*##A D}!?! ]x!mC#PG#r%#iZ!s5#GL Z)![f#39 tO!w7#7.!kU BB#gm T/ F- A/ Tf!v!#vB!l^ 25 `n!|o!rV#Im N;!;P!@q#O<#>2 .A Z4 IL eb!t, E*#g= *< N~ ff!*3#6.#P?#vI!@Q 4e!ct#_i!7~ c/!)1#hY#H;#X% YI!{% dh <k!y~#g$#Pd!`* c&#W`!A1 u# D}#W0 I} eb!G~#hH!i! c/ m! .t!MA Qf#Yj VC eZ#*X >a#^$!q' <r#:* Yz e1 R4 1. P/ eh ^M 5/!#q -9 g  <r wB#s[ `K h* QJ!w##*X!;]#4K!,h!w7#e1!$# G2#wE!7Z S6 fB Q9#_i!;^ <r!:g#>u#.y#Y]!PO!}'!;` Q*#%' !Q 1P!Uw!Kc!.M!Ke#Yj Qw f%!#%!8}!g8 fR <r ei![M R}!Y<#JE [S!-Y /, @x 3L!(% V-!]> H=!^@#LS 1.#d3 yw!`z V'!Z? 0*!2r!`, DZ q4!R' h*#S+#C##7[#KB! F _3 Rm!~ !/J!#f!N~ .z Mo ^d#7. )v#k6 .T#S;#vi!1d ZK#I7 /# <7 XZ!`z <H!Pe )Q!=m#R!!/J#xD#x9 /# -@ n6!=+ qF#X. J? V- q:!nX!zX 1A /U GF!ck!<* f; $4!aI V-!?r!x`!Qm!dj ;H 1P#P#!=. 4+#Xl h6 K2 #c#x[#xE!/o 6* BW#xU )d#Ia YV#xr!Q$ Sq#Xe 1f#fS d_!p6 Rm#>f#qB 1} R]!Hb#d` 1f M> <)#xU#E^ $4 pN K2!Q*#'O#iV Kl 1L!=m#Rh!p6!Bu#y3!DN I} Jx!t<!D}#x^#tw <)#B& %( QR#d<#w#!Qx ?f#Re Xe#w.!WY!;` *r :g#Px I}!8( 83!Qz#9r!PO#E_!=.#ny#Y #vb!M= E< 22#yO a!#y]!2p!MI!_j :g#R0 1} I4!EN#X~#Y- X6 BW `n -F l<!,K!ch!2c#Ro *D!cP#Y-#n; BW eb#yv#33!TJ T~!}|#6X!AW#y}!jQ#xl!,A#yj!;@#=]#xM!PY J| *8#z+ Xe kn!`^#yH <Q!LN!4W V- kJ pB!sP!Qn x?#xw#%*!=.!dq!fs M0 &H!7y w.!_Y#x  Of#_. J= dv &~ 8e!m3#`M IL#zK vr#MK!H> Xe#zI#Cc 99 _e!M?#%6 <r!?~ y: M;#!.!KJ Qh!yJ#xU %U!fO#y/#6*#2g!^g#P)#Xy!=m!45#yj g/#WZ *] c2!#; a'!9W#!V!T>#zu!=_#zw!ay 3L!}?!l*!Hm#Y7!dB 2@ Wr f%#B& Rf!k(#Cp T~!IH#>' ~/ Z)#Xf ME 'L#zR (C CI#I2 `7 N~ N #e2!mF!Y2 W^!1G iw +=! S!ap!PO t+!@F!Q2!J- 2Q#x##M)!;` )5#x'!6=!7r Du#8C!5f#Xf#h  eh#x=!h> {] *s#nf!yZ#{C#Xf#Q, QW#x% *0!pw ua X0 zW#{Z Tf!Rz#xG hM!=. (C#Rk!lg Yg#^T#{N Th!J-#zU#*` Mg!N,!:h!lR!6* Ur!F6#6n#{7 Du!l% u| Tj#xU!0v!3s B(#uF!JC#|)!c6!lE *t!yp!#%#)(#jr!hM#un!MT#!U Z(#|+ 2v#^z dW dh ;t 0E!hg#k{!e~#gM#']!W= 88 [Z#B`!p^ mw!i##qH bC#|L#wZ!l? PJ!`*#vQ &u!Lv!IA#|U#'Z LI#P(#NR Wi#vb CC ^! d$ Jc!kf#ke k!!&&!~k!RM 82 Rm!uU q> Rf#H7 b{#ob G[!I}#zg!hF!3d c/!<s#:_!hY#'L#ob!7y!>m 8<!ie!tN#2; {/ &+!Pp Bm#q$ X~#zL#Y+#l~ QD#c_#3%!3O =! G{#j0 sZ#e% n/#3D 3^ 6l#}, 5z Wk#%t Bm#de!XF )k nX!l> 3^ 'w#}  aE ,L!Qt Bm#pM#yo n> -G!i4#Rk#|g# v t_!DG!h@#u]#yR 'h!Kq!fx#n{ N~#4%!*7!zr Bm#lK#36 SJ SW!SE#hi#vz!n8 .f!u2#}j#lV#Hh 'Y#Hj#}o#RM &2 S' xG nZ!kZ#h]#l)!1d#x8!p? pn#`] cy!W+#)Z 3p#mS#}I!2R qC!.L#Wn!PO!~& <e!TC!j{#px N/#lX!N'!J] N!!yp T*!iH PW!jc#}`#I*!es#LG!g3 WB vx Ta -b t$!h@#RM ._!7y!h8#0-!J]#x/ /K!5M E'#'| pn#un#|(#mV#2^ 2+#v8!|6 ~i!*0!r$ :8#sd p7!zA#6y#t> 3y#v[#S3 +o!'%!LN#Jy#v3 gy 0w!Pa#Xk!fx!uc!9  Rw DW j]!h@#ys!-R!I9#BQ#1~ 9>!Rx K2!!W#&= 2`!mL#|Z!.k!2j#`x z*!S#!VU T~!/A +S 'I#Ws 3^#yV#5X!VC#j` +@!!r Na ^E U)#45 `R#{'#}N fr aN#@g!w{#.@ W^!kc ?2 =( J##&G Q[ _T!J_#[a!!r x^ #k!QD iZ QC &w Xv Tb!3r c_#l  XT @V eu r3!lJ!b+#]# yf [H#n~ mo!tk#mM ~{!l( @6!*5 zq x+ L/!-y!%w##'!u,#P^ 'L!l( `l!   Yu$ u!0&#?W fi#33 K|#w!#qe#0L#I  8@#`} ES!jM#]z!,^!t~$ ] T~#a? %E -C!t8#{@!Kb#<{ B5#;F!tw#ym!3_!)k Y? 8Q 0n!,> qq @'$!=!qk K| Vx 'L!EZ!t~ ] $!F ^!#)^!XB#Vu$!L$!*!M/ P##SU Rk Wt$!S!'k 9>!-6 W^#'C 5r!u|#ys#WV#rC#Pu x)$!K!qS!T' zY#j9#;2!>t tG#q(!qY!Y< J;!2r!3S!Y@!?z$!D#y' tG#&g hU$!` XK#AW#FV [b O7#$I!,> Wt#^A#OV!oG#vb#k# &6 )d!a> ie#|8#^: o!#%_#4E 9.!*; GF#:*!<:#lk!pl#~I$#5#4z!,k#Fk!^+#|8#_P Hu x@!oA!&m!,> d`!ug#?8$#9#v[#I{ }7 Y:!u|#}7$#5#pF#*Z$!` Va ^d TO q-#[B .~ 0+!,> {;!si!9$!rC j?#zu G9 ~e!bX P##`` Rk {;#7P#*}$#! [Z#_f rC ;h P>#vO#NK s_ =j#k<!t_$#t#hv#&u ,f#?>!2r #L dK _V#u! 9.#e, F]!g#!|o#O*#?>#_O$$' bd#+b#IM!e@#}7#=!#!M!}Y!bu#}B$$3#N7 A5!4= hV#S;!& !Dh H4#dY!pl#y/$$> {_!-z!xH!qt!,1 Xx#Xx!Zo P# }0#:@!Em!/y!s8 i' Q[!km b, K~ 8Q XK#1X!AW!!?!w{#fr g7#nM <`#a6 8n#|Z$#z!6o##@#9c 7V CS!<6 U)#if N7 P# Mi$$U#eJ P] hI!sQ#`` 7(!z8#jt!MT!$-#xw!J< CG!ci!Mx 9> zK!0R y@ Sx W] {] 8I$!|#-B L~#M?!S##n{ ?Y TO#qe#bX 7m#UU }: gy!mk!M^$%6 T/ WM#C@!#_$%0 ]x$#&!9#!U<!rO#iN dB!aB#Q^!h3 np x+#VQ#z5#EU 4z WM Kn T)!z8 hz!Vo 8/ X!!Bf Y+ (&#iW (3 h! Y&!iE!~- !P!R- Yu -, 6v!:6#GX!Z3 >c!ti IS KF#=' OF#jc#H. sf!RX#)_!uj X($%R!Q9#;T!Ko 9S Mr#Fc#XK!&@!FC Nw iE#m}!{?!cr D- (- h##5J#5p!hm }: *< zq#m}#-x -8 {< *a!M}!AH!;O#<+$&5 sG g+ Mc 7> k~!_G <R >}#^j#Cg ](#SN!O9 g+ 63!PN#j!!yW M0 1[ x}#Ie!K< :l Wr j? S' mI %@!w.#s9 rr$%z!yA!XB!y6#R0 6E aJ KB!IY!wj#}N :H#7.#=@!]y!y_ R6 `a T*!DO!tF #j ?| 3q C@#t2!uD!y_ W; RJ#C5!*^ 4O >G#fM!H !Q9#6c!`0 79!&_#$:!y8 Xz!+[#~A!Fd!07 V{ )k#SN f) (-!2p Sg 3`!RS ?x$%m!&; ?`#97!a9!Q1!=S#,k!0[#Dx ~F A0#c%#;h bl#Jr <Q Z4 n]!4e!@j!nJ#Fr Vx `a##|!^3 :/ LH$'4 S'!OU =C!w:!nU!Ay iF#*C!6H$'[!s{ XB!Q9 2j!*o kZ#PC!eh!7a#dF#ph kt#W0!M}$%9 eN m`!RG$%C#Ep!rZ!#0#$r!`V$&=#Nr ,6 =e![:#4}!&_!jE#{{#5v#Yt 1} +g N+ U)#SE '6 :I!;!!Ay!;W @F 5K!t1 =#$&= XD#@6 @A!^G cq$%m#YJ!cN )Z#}L L^!>( {: qH 8E (+!xg!Uw$(6#yB *3$%c$&5 .a ko!1G#UV!y8 :I!7]!Ay!%d!ut X: :/!IY ko E8 !}!D:!em Gv$%Y Ya#3r#c $(j ># x^ y$ T*#+- %o :I lx!Fd!ZZ#`V#%- Kh!W[!hM qH!s5!VK!vg#fS!mG!}7#;.#9W!SZ YI +K Y2!dh!l+ NG J_!&+#}U $f k> R6 Je$#^!`e!h& vx Z& TA ;b#JY!*5!+6$).!yb!.0!ME#Fr P/!/o!gn 3n N]!WC ?9 X6#E& TT#EO Aa!-: C)!7E!2F#d,#@J Wk Yf Rw!2L!q:!]{#b( 1_#o* 5$!0o!^v#Fq YC Tl |+ 9c!d} A^ YP!fr#>^ Me#mW!]{!DN uM Rh {`!3L AP#fS#[)!&V#<e!S.#@_$!E!W3$)X 6N!;3!Z+ `7#KR!#Y$&e#s3 jW#Q,!X  YU 4q!%I #:!Qf C)!5+#8g#g(!}:#Px F/ U)!-j!Pi# 9$)!!Rx `W!}P#89 $l#tw!T>$*8 6F!BO #:#]/#Ii U8#^}!HJ!].!s{#sO >K }G#PR yF --#qD!|;!}R#Pd#>s U)!7% |5 Ll!r  ;.!Ws q' oL!|h e2 ^W i8 #$#KN!Mb#$| YC!_6#>0!/$!6~ %'!H]!h0#aV ct!X<#RS 88 ?~ cA#~i![Z#Q? rk S'!Rj DX$*v#b($*x!_K#cO X;!6b CS 5s$%9 2E#q9# @$)D!'c =x!K0#~u![N U.!OL#:] $7! S!Z:!Am!K.$!2!Rg#Q% YB 1T#CT 0:!W] Te#S+ 88 FS#<p#&O#tj Z5$(/!k%$%j 5'$*j$*6!5]!Gh ns#S6!)r$+O#D, nB 2X AF UE YC!yZ ne!Fy!R@ `t G0 !> X< >p T]#F!#``!W3!^e#+x#~G! 2 <7 )Q$(J 1'!?x# m$)|#_r!w'#JX!Zx#+< [l Z6#dc cW!X<#_'#zC#I-!c(!v_#2 !(: >}#J^$%j!!K#E9#tE#F;#=##qJ#:a!ZF WV LP$*8 wN!u2 G) U.#!Y!':!Jj#UM!Xs$)]#)) QB!+j#OZ P< r^ tP#^L!c'!Z- kn!z.$)X rq#j9 -A$(/!dm TV#=5 E]#P* Lc#~A >K +&!Y2 #:!u` --!>&!,Q wf#v~ .X#`} 1g S' mB ^d |T W;!X9#Yj!&r ip!Yd w_#|t!sV _a!Mb!`h$+a Xp#7%#HH!R@!]/ C)$&E tg b~$,a#UU!VS!>a#{O#Yt CL Ne!Gr!sV KJ!h& MF ]g!3*!-n [g#~2 CW LW!!/!4e!O9#WV$,a Nw Yf!#I RW#Rq!Y$#mM ad$(|!-(!r$ o6!Am i !EF!?N!i4 /O#-7#:n!#m 2S!j%#]H$-L!5I V) 6 !Zx!uI &N M]!0;!hf!Jo$)( tz#x+!oH Jp!X[$'J /o Qj S^ [n Ll +b ;.!bd!S]#YN$-i Oj!oK M2 T] &}# s Qw rk TH (1 *p /@#,i ?<!<. _T @- 1|#PR#;&$+g!ZZ!G3!MO#$- Mo#L2 V]!9j!3[ G)$-.##>#vL#_J#5w!l^ wA KP!Uw J(!XU <` 65 B7!fk!R( }n =,!5+!Ch $7#:Z!X= wm#zE#YN$!% E|!)'!y% Mk!0$ u1#OM Nw -0#7U#pO!k(!Y@ N;#)+ K@ Gc e& F(!-+ &e!E?!N2 Sr#L` ($ YI 8:!pu![_#,W#&v U>#Mv #w#gf#M@ P< wq M]!O`#U8#$b -,!_o#qf#z} x###G#Q,#ZN Y^ &W$ 8 'p#Sr Rv x}!cw#oe E| Q=!;i Tl -A eU!d} )/$.~#K#!&Y +<!g}!XC *7!;i!7L!L.#{w!UP#fM qS!%)#bs (3#-X Y`#rw!*1 J3#ZW @V lP Zn$!1!Wc Ee X(#cW V] %~ vl#(c ME lP!<h nH!':#)l#w3#_j!J.#fM |G!U. Y`![# l@#Iq!fB )2!?!!UQ!C[ %t$/g!#B &e y0#=M$/=!Wd S2$/K Zu =a )=#.t$/t lP#?  R2#fJ$/y#}N!UQ!2v#%9#/H w_#ng#[H ws E|!?d!;i!B=!-+ eM!9I!>B$0.!pp$)z IT#Q?#oU#1V 4g!d $/h$/u!-i!>T$#e$01#PP <L SH IN +G!zr!RB$/i Ux!r6 j,#^x GB#RM ]2#Ek %x :p Kt! 4!6M!-i#j|!v_#bt Et$0(#5M#fF#{1#>j iX$0] 6&!<S#>T#Y` x^ ]2 KW KR 3* H_#-7!+P!,j /% oc#.U <>#-7!z`![m#Ay e@ K} ,z 5d!jB!R<!i[!B! |G!KQ!0f fC *N#[h 6&#rO#hB#Y`#``!Z# Ly!*d!J1 ZN!6M 7y$%| o/!W$ +) -,$/p Ll !i!F0#FG!6M 7L#_m#R>!Vj$.<!Ut Q_ Zi!br T2 ,z 7C#-, {m GB Qw!`[ dk ~6 JF#(c WB ,z 7U!l! Ou le GB OR ]4 r* HP dM#/H$1? dO 6/#;R#e= El!tu 6# {(#Fs!FR ;,!6M 5A#$q#?C#Y`#R0 /g qW!-s#ng#*m!rr eD 6/#>`!-U El#l]!-q zC V1#Gg!R;$0O 5t $y aL#@k S0!A4 ^`#KI#xY fC$1c!k> Ra!)!$2'$.< 't!MJ#n;!h}#/) YP ^ !UP$*K!>z$01$0n 1J!MJ#~I#MC ax$/u#E9#5` L+$01 Vx bU!N. Wr#pI H_#63!cb #:#5j!m, 'Z N; AV!N.#Px#;> Y? -@!&/!U] W7!xS#.2#c_ 1/ 9r#ek s0#.|$.~#US!o-!~v IX i; @a!=z 6o g,!i,![b @9 Nf#>&!_r!W=#-) U>#7l :a#`}#+8 '0 M> 6^#^X#p;!:o#.I$/,#(,!$s K>$2~$2U!oz#8h#Kt#fo#.I X6!6_!NG#MG!D& o3#*i uA#1f '2 q(!TM 0/ &K$2p ^t!rj Hu R6 '[ xm#&~#ki#ZK 6* P($3A -Q!IB!:@ c- :B @6#YZ!Lv &u M0 z<!0: ^f!wP *0#h !Cj!!:#P3#my#+;$/E#F|!$s#(N#Ek _i Q`!+.#YM!-1 H}#+: f9!7O pL!)L }z %X 4L oS sO ee 4x$3b Hn#63#d} :a Jk!Qj )H )D ]O!V1$/w#p;!UC#V, :@!N;!)f!PY!3( ,8!Wi#1}!&f$0S *0 X(!QB$2p!Yh#l]!&k 2e t9 |9#0h!KI!U, Wr y) 9T K%!qc uU b7 gC v# 2,#T4 J' BJ c-!*H rL nZ!hq %S!ZX!$, P? u^!U, <`!gN ;;!I*$(i!7&$4= aT$3y#?W#0. YB .U!NG 9P!84#[f 0N XP r| 59 J6 -O#63 70 :a!Oj!?Y!AT ]O!=z!%x$21 IX#;8 FJ rl pL )' G[ ak Z/ <,!|0#0. T/ 9(!N; +2$#R ,< YZ Tb :I!!3$5+$52#N[ :R!?D!Hx#9( Tb#)Y!.? 60#@k 1V /| gh 9T ,7!I] i1$5=$5C#b%!{a$4}##H [{ F>!08!(,!5=$5T!l+#m+ b_!m9 &.$5=!'M #0!eC 2]#~:!Z*!hi#:q!kt r`#6: &: ]O kG Ef 5P#}' C5 Tb @H$4p!Mj#6: *= ]O ]V %o ?;#wX ,? [{#`^#fV!e#$3I!&H$4=!6O!7C$2?!H. )d Tb!6E$!^#&O!TT 5~#^Q G6 Ak!$t J> (S!?, hG!~S#1s#_~!:1 ;i#45 )>#~: 1u!7J!FY p&!d'#]W %^$62!>@ Q_#Sx uQ!s5!?, n #{C!T< ~o {@ mb#g8 le![|#hQ!Q$!@.!HH!S|$4I gT <m#oJ!9# -<$62 _ $-f#w~#}5$#T Z< ?r 2n#cy M= ^K Ed#3f#pE!e%!Sv +F oy Y5 2n +L!Tf#!j t9 uQ#3h!&g `c +T Z. iz =?#Q3!bW C^ ?p IP#Je Z+ MU!Z*!L% =`#^,#N% z  E($!  ~<#6D )v!8E!zQ!Vk CI!%= 0p ZH!3 !ai#c9 *~#fm RK#A6!+( $% ]'!O`!C|#u}#;;#r4 ,8!=< =/$6;#al (X &x ZW zy#ti#jJ [s!.V @C!L. Iy!yM pd J(#bM#m* a? 3;$6Z!s5$7Z Jk!e!!jE!Zf#;|#yp#]3 W  11!~(!2% hA!!e $X!>v x`#YB 8{ 7'!t)#45$7Z!^R!<| ys ** &.!!o!<H$4@!zZ#8V!z0$6! P` H5 Cn 54#wT#8I#:1$!H#?N ]'!1L$7Z Kr#@a bj 5~#ms y]#R3#^B!vg$8.#Ps T8 O6!U~ )d!!^ ur$,L e9#@5 C5 6O T| K^!It!c4# ] uh!rA#~w }z ?I$8F#im 4[ 97!br fx F #^Y!vy#Fk!8f Kb EB!Dq!l) Mv fx ]Z#5'#@I! J!t)!{-!m~!BN [^ /|!IC#+a!w3!C4!YV$8~#'L$7Z G;!ad#?Y fx W#!1|!r~!Xv ]'!dD$7Z 2W O.!GU#[6!}K D]#f'#!V qy!Zf ;z$4R#{( d% ]'#9E#C>#,F#FJ *-!&7 lG %% c. Zu!3_!&7#g*!/y!d[!(I!&7 ^` <-#+s `n ^S!70 i?!}  j+#FB :w#C: S7 $^ Vs di!Zf H:!x_ Et#e@ <O#!^ ~D C!#vQ$8.#DK .F!!L#.#!}R fx zi -|#VT!;E <O#O*!Z+$$5#v+!.2 B>#B@ =m!K9 ue$8W#41$!& =j#_V#+3 B>!7; =O pg qq ^K!&O#%7#*e!!h#<@ fx!yb JS!=& 76$8~ pF TV#*9 lK [|$:2!*P k~ $R!-6 uX ]' u;#TK#Q<!tV#o<$9, F[!,& B}! * Kb!:g H]#WQ _. 8o#t, s'#Ou hj xc 'u Kb k!!jB#Ao kj$8Q y[ Eb -j!,] 0n$:a#Z;$,) }Q Zd <O!,o!:' ED#7n `O!Mf#3E!rL!UG ]u )R!*V M| ^y 2f dn#<R Kb!4$#bZ#S)# C!t)#K !z_ KR!nU r[!:r#y6!-b Ek#~S _r$8F# b#-S!x[#rM$8.#,>#I5!5q#}@ ?V$8Q!x0 ER!)?#QO!3{ Kb M8#n^#FS#DI ]'!9[#@6#!q!z8$8.#7,#eJ#Ao$+@#ts$8W#ui ,u#q. 9r#n2 6G!`4#uC |3$7G!cf#7R!kU#l< Q* **$8O!7<#k% 4V!%n!7k qH!<*!b5 {q /| 6) 3o#P[#qK %<#kO <{!&I#24!Z> r* _i l6 U@ )s#nT u_ ;n#i[$'S!bi!NS# *#h4 3o#|@!#= rT -n!:( ~]$%[!(.$5. Hr @Y y=#fo#c  Qu J? `&!;f j& gX 9Y _R Dx!+_$+(!it sa )w ~R =] @Z :'!Ut WJ!1G!%x IV |t!3O$#1!ga S9 8B :o!ny [2!?~#o8!bS!)  #~![t Es#:y!@J$<Z$6&#$z#[L$2G!<y# + YZ B<!yT!Se#0$ R,$<]!Zb!xl >1 5z 54 HQ$$s E6!eF!4J _9#?Z %g#cZ!Mv o2!C/#i4!.z 7u#Q:!4J$;s!hb k>$+( jH Ra +b!~Q#tB ,` ,7!*p b%!p!!FC$8T#Kf#=B %N!zR!!_!j|$$'!*p ^S$<i#ZQ xe!sv!!_ 0+ f]$ k#`M JF$=D$<V#0g!()#1[#=B$<h$=7!+o#|8 g> '6$<n!ga i!#]c!R?#=B Y  Iy xF#c_$7- 9c /m [2!1<!^s!7n!^u$:B#5D!zI pS Su#3A QI$<V!>x!Ip#u,!2` (w `N!2Y#T2!Fd!g# pd %@#`=#Rp#Z! J( <v c? ;; V$#ok#nD ZO!MT!K1#=K#~w!2` 53 UK#!?#ir!hj$7L#%} XT#ZR 7E Ra ND!RV ^6 qy M? pA 4M qp >##?a!d'!3@ >] K_ X[ T] B@ t%$>5#GQ!N}#DR!Ot PB!#D av#Bt!hb %v r8 _K!XJ #I#El ai!Mm ]o /O!!,!uR#/> .i [k!!1# c!z@# e 9Y$7A OS V.#-$!S_ ?d!8B Fy rN#s(!() QV )r 7n!0h!'3!6P :}#[f C)!-i#tR Hm 9s <v 4&#,x#F4!(i X] -I#[~!:: ?'#,/ PB#;8!zd!um K^ `a$>a$7A$5Z P5#}V $? 0|!?q -I! w $p 5J#1S!dm d- tl#|W#lN #0!<*![ !sG l~ 0] Yq$<' t9 Ow$6L#sR Q8 &b![  Di +E#/=!4B %D Z_ MQ$,e!A2 tA 4j [k#8F!#9!}~ RY$>w#'>#C;!}]#C=!ML 1u W^ vc 7) SN g- ^; yS$5b K9 js 2x!,T m5!AZ MQ 05 **!Bf Z !1(!4V ZG *^!Y !?X R- %9 OM#G;#8b )Z!4V `e BH!#k 1h m+!5a -I lJ *8!!?!EZ nE$@=!K% T` R-#C,!0R#(<#5T Le >%$@=#4=!6Q$9> (z xE!YL!2Q#.H!/B$6>!Fd oe!,) lo 1k 5~$%,!//$5o 7z!4V `O#g-!==!9)#>N#9h w(!|9 AU$9}!n&!4V `] YC#gX 5j#Jy$7r cD eL#oe#[w o% ^S f##-z 5/$$i 07 _O$@k j<#d9 Mc F.#n2$?& aX!F2 :+ O6$@j zW$'f D{ o% a0!<. Rw HI!QP$7r$?+$1g#fp wf!'z &M$4b =, UG JI nm$7r [k!qt h9$'r Tu OE )R$/@ Lv!OT#7(!L. xE#Gg!gK#P4 Rp!]* IN#>/#;8!@s!rQ$A:!Ws#`&!yx$$g$@^ `. HJ$;F Dr ao#jj vc#a1 Db ^k!y: co Mc V- &E#6I >] --!bx!7G!bz U8$=K @p i5 ;p d/ I1 ,E!<!!Z-$@a ~/ >. aC!;i Nr lr (' J+ 54 @p!$7$9[! { K7 [k ^4 [Z )($+F#2v$AL#Q* b  VL U| c*!;t LY x7#B8!6W$@'!ej $k#,F U|$>@!<. M2#_P o? S$$@7!^> +r#f' Oh#d7 IN!&1#wA#A` ZM$6} &e!wV#,$ q(#5G co!C1!h?#2z Js$B:$(c!AK#P' H$$>q 7*$B6 (K kG %L$BE!E?#lC!_r!K2#SE#jo Mk#HB#Xk jD$@G!yh$2%!Wm W:$?+$,V#z' (* Ep!$9$AX!g<!6p a~ Js Vu#3X$B6#M3!Cg!O`!;t Q-$4{!*[!7. [k#g`$C1$7^ XP!?%$BV$C+!(M$C-#N/$C$ w; V- Rf I!#!J -I!w=#i+$C, w1 #5$@j dX V- +P!~X Lu!50 M2#_I!(N!Is$@7#k|#z' +! }% l< cR Mk#+w ZP Ju$@^#y^$27 *f$Ca _R A0$;o#ch Ym!1s$@R V.!#x!bM!Fj$A:#&F!wz Z: ak BH Xx#-4 HI!GU +h!/: xw$'C Lv$A@#8V!<z NC XP LH$AR!/;!@l!xm Lv$=i!Bf#DA#0| V;#_P OM!Ki#M~!.Z Zd$>} *% 9T!QP IS!9. b7$$Z#d8#7^ ki Zd$<b!5H O`!Y2 }4$Ae!OT Q[#Td$8I$${ Zd ^<!Ay#/^ 5j nV$!5$?t `5!M2#1Z#Sp Zd -1 ^;!.o `) 24 TA W^ Vu#zE$8a vK!t$ W<$@'!d.!!|!Ab$BA -! Q[ YX Y!#/f#!S NU ;. e5#oR$B*$Dv!/w Md$-+ ^Q cV#&2!-i GR!ck GF$A##xs$6X iR#9($A{#F9!x[$By ^x!0R J>#dQ#KM [1$7_$B]$&y IR B} Fy$@j!|e!$p!4m!pe NC$C| gL P# Ii$/4!_J xE M8#=d#-P!?u!4v c}#W* -*!2p V2$C$#+O$AT$(_$DV [z!`B#]. }d!?' GF$C$#Z($3x$+X +' !d#nw!N$#LU y@ W^$BE!it#]U$:z#:3 -!$8o#J  H1#Gr$ 4 N>$Ez!JD#Yh mM O# vy Rg =V =@#:N#|P _O#JQ#>= NN kg#:3 Zl!.k =V#a!#&W [L <v#h^#0C$/<#`K Lv$7G!RV Ly!3_ OS Nr )_ d-!UF$44!S-!7} _0![  @d os ?-$FA$5~#m9$F8#e>$FF#8. bZ d- D/!zI Ns LY#M)#tA#gC$)y$>3 Z, %R!/S#+;#o4!hw Am 1u @N vc#2+$FR V]$:`!'&#.2#sC 63 M3$F6#~b$8a$FQ$F_!JY [z$3q )) +8#U.#`~ eX uQ!t! JC$Fw Bz `] $s##m j] ]: Lv$:k ^J!#.$Fj$G%#Ur ];!jE#$H$-( e8#cG#S/ eL$1m$G$#'! gH ?G!s| (J#QW#Zf LI &5!{R!FY$0E!Pb#YQ$F6!m&!]g wm!7? o, e=!hd$GH!QJ!Pn#xz$'&!Y@ QJ!sA!ke$G?!8h$G;!PH X< ,] |O!VJ#K  t9 M2 I5 +I!dF$G_#e? X< ]P!M`!ZU$62#l$ nr ^y!>S$F^#g* qa /|!!O o| b% y3#*I vy#v> Br!j6$GI#N. (c js!)= ZO!4e#^T |O i $Gk$H% ke (c# ,!rV!RV$H+ 'w#'H vc$GS$Gw!la!'& m5$G8 f2 ~G vC!*X$GG$Gv mv ,7# 5 @o ] ![  V~ $K (c k!$H/$GT#.W ^c!G^ Ch$:k!nj qp$Gy#4H$H#$Fv$Gw iS!/}!}C$:k!(I!97#<X#o;#hh$HE m2 ^x 79#Od$62 EB!4r -W!R<$*4!]8!Pz No#9| &^$!E!Rx$;, i`!q#$H#!:}$HQ#^< `B G+ N< Y` |9 SB No fI#g$!]y#If U8$GE i.!eq `7!X, I1$D$!%( Dy#kH!&f!]z -B _( ES }U!JW$05#)L ;= 1T!(`!;x /i S $=K 1:$I>!=m pr$&` `B#:;$&X$IF aX$7G!rz Ch#lt!zQ!Xw `P$Hq$0:#~w sI _K!'}!}C!l^!B' '@ Y  35 gy!d&!SO Ra!9[ e0!1{#m[ Nx D) ,v 9?!tG!J8#`' o% `O sL!eq#Px#1% nR [9!h]!l/$EF!NM y> `{ j_ 4& Bz P4 50 [9 r>!.Y!Qa!/$$@c [9#t* & #Nq#f9!r_ `{#:*$?L#~< 19 ak zU C0$.+ #O!2A$<' m~!Io!dN$6d!#y#n2 it$I1 /P wS#7, `{#~h 1% ,i!%S Xj ** ;$$Ha#='$DY$;5#,f!+c!NL!3c$7_!A!$J> =$#J> :R ^x 1p!$D /) *1!2` ZG#H.!-M 8&$%H p8 1u 6v!?4#Hi!D}$=2$5r!^+$HI#-r$Df!5n _` G=#Em /-$JR BB ._#Jj!mu ,%!0/$@1!#o#y+!HU!fG!1r$6&!`v#Od 0Y#iU Bo#$)!H; z*#wr!2  b% kQ @`$J?#1; 2` /| ;A!Pk 8F#z~!0q %N [q$Ja!3Q qN$I_#E| R`$4b$;( <U JO!]*$IU!'( Y.!G| ._#J@#p%$(  y-$JT!Rm }# *K :B#+< aD$Fi#h6$Fk ]D Gm#bk &  &|!U9 y] <v `a!c&!6H#_z!&~ YZ 5>!{S &|#Zi!*j [G!|e#pz$Db!#h ** @}!YI &|#Xx! G$Jq$4l#Ph m$ lt!(v 1u$ ] }U!dT!:D _r!C7 Q6$;w$A> n~ 7]! n$%; E7!Fv aP!8h!${#&[ ^M ZG 1[!{S!%A M|$41 5a!Re$>z#&)#9; >m!C/$HU ,! F~ >  NI bi#W- L] _9 I:$=! 4& #` wE$4b V+#?9#U{#U6 [x$6& p+$Ja 2r {( 5~ VO!>4#[S#VZ g} b% E&$I1 $y#!' 7c EX i  ip!5(!4q$L.$*e$HU %(!e9 [r#Uy h, @'#pZ Ra 6x Ao#Jd!yG$/C!&k )d R'!>4 ~$$M&$=b >m!H_$L} S_!Ux I:!u` lK 8N$M2 ot$M4 ei!Hq vF#%A$7L!Ge!]E$M< >f#k@ Ao#5i$MD# s$L.!Ao$M$ I,!>=!#= FR!W4$.+!?0 AU$Ki!e~$Lx$M=#lH! | eL 4&!?z :u!cF EX#W,$Lm#%`#Jg Gm!Jn$J3 =D#DY$MN k!#Uo#-#$L. Hr$H",
		"Data Chunk 6:U $^!w: ZV `:#R& {6#JN nC RO Ib$Mu!#J!Rb$Lj#N[#&&#r}!KK$- $Ku$Mt$J3 3f 5= i@ VO!,|#qk!6:!)e$Ms!K5 {W#K,!fO )R V+#JL$%{$>> ?h$M.$9{$J3 Wb R $I_#0B$:W#Kt#T6 _( 3a$LE q{!_9 *R NI!Gl$ T!zu#TZ$Lj# g$HU $c!Pp$2? NI#+O#q>#Ks$%6 )R oV#Od #}!r$$D  #|!HZ })#T) XT$M. |+ CW -]#3z!`h NI wB#a;#&s UV$L{$H> z2#sO#Is 4M 2A#Sz }u!Lk!S^$<' :8$Ha!L2 Jb$LH#2X 3^#q'#S| EJ$Ku$J,#d= jI D/!LH!15!X!!BD!M'#1D ,<$LY!8h$MA .H Kt#7l#mk#0r#Wl#TL!Sj a0#>$$Jy#M3 {+ J( [+$,?#Qn 'r$K~ *V#n2 {:$JV (X!j%$5e ^l#uG#Qb jU!)` I4#[f$&o$No )!$+/ )H nr!oT m/#Ob BU!T<$41 s.$Ob +%#0. ~o!/? hG#AD$Oj!TH$7_ N+$Ha *o!Lh '6$KA!U5 P@ !d#1g!TH 53 @}$Jy )!#*w$3P [+!uL }i#w+!p~ 2X RO!+n$Ml!Ii#+R$JH$9C >U!uh#L!!U&$4I!KG$HU &v!Ko 50$Ko#Ax i%!e$#X4$40$N;$ N Ch -_ 6G#({$D$ nc!_!#SA#e?#Jg aC!KT!-M <E =T Kt!b) `{$-r#p0 kL#Jg `] 3w!-M Dz!s%#.>$Ko!6z!J7 jt$ER!Tl!Y2!15!Ki #e ))!]A 09 JO$J,!v!#{[ fC$J<$+f C9 ,h 2V#-3$4I h! J>#lq#})$1, YZ!o5!)D d$$<o!Ux$I_#As oL!Ho#xQ#MQ$KX!YI -F!/P!Ux _( 9/!Qx#/r K- 0`$KA#7N &6 @= 9x#-3#C, 2T$Jg!Tl#O{ )N 54 ;A @o /' *f$/g <C ?a!J*$JP$(R =J$4S GZ#Jj#Vy -< Ly 96$QQ vp!g2#2s GP ^q!/? Wz &<$G@#)5$I} j_#|5 ng WQ )i _o#vK %f!;P!Ux$PN G4#I|#IZ$3I ;{$N;#tr!}4 'n!*5 L$ _' p($HP!1< uH ^< k/#uM % !f5!ss$R!$Os#!9 m1$/1$?b k/!4R!|2$J/ 'Z &S `m!# $&f {)##G $8 GZ!Be#'U#LM#-`$N;!@3!RZ#Pu!RZ F,$Iq I.! r#]8 s8 SY [+!mu$,W E[ im!Y@$:k!A!!?. -=!BU IT$Pa!lG#]V#)! 4x$.R#HG!#o Cn$A8 LH#&z$R> 2g!*y#68!7n#$N ^S zq$Re 1v!=n#$H$Iq#:Q#bO$9r$<w *:$Ie#HE$=# .S$78 uH a0!rt!GR$9[$!N %L$P+!B=!vv Of#Ko ZV ;$ B?#en#)@$KA$98$=# 4s$Ad#Zj$K;!:&#b, 9[ b2 om$M( Y'!?  Ey#Y0#J>#$)#qZ$*K oZ &t$7L it#K; 6X$5m ;q {R$QW Q-$Bi#<A Cw!qj#WC .  %  1Y A$ K0#kq#B+#8,#$B &  4^ 1p!Aj 7; s0#OM$S##dv$*3!QH#Od$JT#s,!C)#Eq!W-!JA$S^$!R$*' XW &6 $6#m`$SA#9[!XI$9< ;w!v]$:n!B:!//$J<$2Y$SX Qz#EP }!$R?#ma!:V!my MW$Qc!5| Lb#|j#4B!Z&$S.#Ox! 8 r`!n4!9  ^l!@W#5V )!#5. 37$K0$:D#<5!`<!Y< *^ JO ~v# S %*$S  %q$SJ!{k!iJ$BG Kl g+$Q' Ze#AU *r#^x ;.$Jq#OF $A D1!Z9 3s e0!R<$.& )`!Lv!Zy#s0!#( 3b!:0 Lb$Ri!L<#AU 'n .U!ZL$PN#a4!O6 {3 BG v@#lb Kw 'X (i$Mc z'$T=!*R$;I$5J#Q% `e 2T!}@ G?$A  zX `l f; {!#oB!Qn$Gf _'#W= y> +Z s8#t,$Ko m`$?3#4#$7n!)e %R ]+!?  RW m3#4w$LH#@L!/##h*#dS %'$Je!cb B'#4+ 5w >r#K'$QQ ]R 0P#w7 h##R# _r!da!BX pv#.! vD JO!rn!$&$O-!!W ys CE 1:!ZF 6P!hu![;$Ri$P2#C1$8m q|!;e! e 5Q#^' ?I b7 :0 a>!a7$?~!]I )d ES!4R$?;!&^$Mc#g` `P!2p$-[#H~#@_$R> :O!sZ /! MC$Mc!'f #T!J* ~<#.U #T ]w$$a$([ +%$V-$=i 3E!d`$;`!^* td!aI#PO %]!Dd Kk$?b Gt#O&#j>#AP _K#T=!BX$Pd$35 -r$I5 {R#5t .$!v!#@J 4$ #T#U:#g< MC$(4$7_ t=!=~#GX$Rm!^i ~o 3E!Bq$Uq!j%#|E _! wk#uY sw$5z$VI wi!(: +,!y< u; ^r xB#:j#Gd!+N$:k!e4$U| 6X!>s$&m ^D!TD#27!UH$?r -r$Vb jO Lf +,#'|#{_ Dl$5;$%K <($C? <R! %$SY!5H$) $H{!;W$W.#@+$Vx$!4 Te %f$UN#BW$V($#$ =k!UU =k!`7$Vb$?;$W<$VA!]4 n6 ;= lx#up -o!S] ;8!KQ _L!B% q%#G$#Cn _Z 'L#55!G'!|e!zi$Gy#pe!R. (C$RZ#Cn %R ~{!gt#h}#t<!zN$Sy BW A/#e) +=! F#8* Dl w] [v#v@ W}!vg$We!>f B' .P E7 ;% Im$Uz$WA#zA!Fb 5- XZ#<X!T8 .% *y$*! :6 ]w#Lc!E)!*A!D&#D%$Uz Lk$UL Q]!Vf Rk$HS!uN#Nw!W0!>~$W,#Gg A0 8V#j9 }T$I) u#!X4!!f ;8#=D$Hp#K/$UM#0>!a%$Gb 79!X($KD rG ;8 my# 5!A] &n$;c!a%!j$ j$ w*!IV#]3 Dq$WL!?Y E( 6A!kA }T ;=#92!ib!I~#bP *q$HY |G 11#nn$%J z< _! kG$E]#p&!c= ^D!G;!Z+ -q#,z tP$Vx$Jc!;w$=`!<'!bN!j$$.+ @X#|H T? tP$7A J= uA$/S lY 8Q$=K du#F9 Dz$I($&*$X- kG Nk!q+ ow 7~$4b!*X!Ze Jg .Q!l !cK$W, vE$:V$<< 6D!6' zg!d !8E 'B$%h #  _i$(g!#S$3<#qL#VB ^S N~$T} ;p 0K!,| Lw!'&!(B$1R J6 %J i`#)?$Y) I0 2n#W  `4#G}#*8#0O 6f$41!}?!ZW#-@ j` lW 53 ]x W3!r} QX 6U#HG Zm V&!L~!uG#%x$F< r $5V W8$Yc$KW 'b @? 3| =a!>4 C>!{4$W}$31 Xr 5` o; vQ#:Z$?>!W%!6E!Zl ds!m?$FE$I] ls$=i J, Aa!n: l`#v{ ^q ]i Jm#MJ!to#WG vC +_$YA R| XS 2+$Gs#WK$2w!t}!i@ 2X$G?!3s v* (L#=. rg!6t#X|#37#yZ!C# e=! S ?p 'W#~n FV$5r IN Jm#y,#xu!+9!2u$Yr &h!5z#X($G- uT#LQ$K8 T# 1A I2!/S$Y~#]8#j^ QD$Zv!h&!ku$KE!ie$H7!'& @? +< SO!l?$7_!RV!L7#oy JQ!lY!8B |O 9T ?z Y: hT vP `N R $P^#bh 2%#n2!~? ;- )|!K. Yf [z$=+$FF#`J!S-!lY$FN pe :R *g!6n$[F ?G$Y(!lH#[l#Ir 3^$={ ]<!NG -4$O7 i6$)i 5=#pZ$,s#I2$Qn#,w!MJ )|!_6 Wi#xz#H*#Y- m0!V+#{'$D$!zk$2@ %E#3M 82 vy#$I!h@$O! BF!lY 6k IN :o @^$DO 3^$Dd @ !e,$N>#WF!-7#xz$UB#2x 'R#Sz `l @ !cd!B`!6H$[( 6d#]E!)[ )F e[$Qr!7# Ap R1 Yz!d[ *s$Fg!7]$[O '9!Rz$FT S^$*G#k0!6q$Nw [z!dp#BV .H Ny$9d![t#(L!CJ!@;!ie aC!RV$<Z $q!+( <!$[w!l+#u,!ne$]W#*k v7 19!Xg Nj!r  A^!h&$QT#5J$]W$Fg >l$=D '!#Sn$Yp!Wi 73#E(!mF!cu A^ _u!74$GZ#z] )R$<]#_)#Zw#xj }M dH ;; ,/ !#$Os$[e#a+ Q*!D_$]x$@Q [2$5P &d#Y>$]t Y.$]a!D# G{!i9#(a$>a '_!51$M(!}s HC$Uw#{ !<| vD!&z 6.#YP#Y9$[S!IQ!Kc#`/!mF!G0#t5 O` /=$%& 1^$<b#m| i-#D(#|N!/A!4Q$5P &j#1e$ZG Hr!:k$ I ,F ?: ];!q' 9Y $N#Gg#J# ^J rl#ue uk!i/$G'!GT!6` C4 fs$^;$X+#Bp {P$^q$Fg P! 9Y 6e Ny D*!4/ NW$.. eI!i/$GE E( :o$A}$/z 1. _(!:x yv#B'!%d G{ ZV!+a#y3 %E$[E![( ^J I!#Wy >e$1a 7D$G'!OF#Et$_8 Nj!S_$_; O<$LK jG$^: vy!uc!p_ C? e[#$v ^J ?[ {)#)_!lY$EI!Vf!Aa +A!e~!9N$]B!%g#AY!u]#W5$@^$>i )F *g pH$+, eX lo lM$#B 3( vz$?c D/ /9 C? Ny!Au$^m#bM#/e ~q 2% vC @9 Kt#XQ g/ Ny! L#(8#;f!_Y$BR J6 3< [k$-b %E =X u,!g_ eX ]m 'e pk $U 82 w(#.w!QW t6!l? #i A^ ru 'e!v;$`3!$T Z_$Lt '&#R. 2v$6&#is$?? ->$?A$^e w6$`A QR$?w!j,$[G Y]#:v yH#g[#A7$?1#Pf!IG#Xy ];$(' rE rS$7c!G^!<q![a @y 1z ]6 av Ow$%@!79!ly ]P ^R @? 0o 1f$`f#X:!'j wg#Pg$`k$@'#.X @X 7<#Yj$_5$Od#A%!gW$`k Vu#Xj#@i ks X= 6d$Sg#?U$WO#+5$a!$?1!_G!o)!Gl ZJ#*k![S ]g$]J!y!!l%$E=#k !z  !P!yM U9#nl jS#k%!{1 Wi$`)!+h#b(!?Y YQ ];#D$#'P$X0$`` bZ#h. >5 ?] }O$D$!xp 9$ |>#Zv$-A$?1#,+#W0 js ZJ N>#`) 3L ~< I; Yf$`w#Yw#_.#`% g !;[ s}$>b DL 3; DU$?1#)B *]!_6 A+$Ac#Q.#/~$`S 3(!a- c} Kt$2A!c&$?n#%t#DQ!Fb$aW$<O$4] t, f$$H.!;^!;t##m#Zk!f/!fO$A)$ N$`y 'H#=9$ _$b, F(#.S!2F$ay `e [{!zH F^$6@$@p!9[#4,$Wu$75!m3$Gb t9!b+ ;s M8 /S$au >r!uC :x$ay ^<$72 =v$<x e[#k !;t!`]$]>#L-$an$?=!xY Gk (l bC!tx$B4$Vf#e?# 0 3( dM#nl Bb =e 8o$_.$a_!Lv!]8!y5!f~#9(!.5$bk#!M$_!$`l#LP#OG$W#!zB!eu ],$.W#i&!$s$6@ ~o ]O!Mb#v5$a7 /Z$?b B>#bn!&* FS {##nl KD#G7!Iq!f~$B!!7x#^U!'o#X% ZG _h#B|#io!zZ w,$[S#]v!7e!im KH$4I!>^ Cz$7J$^e#e)#ju#_:!'b#3f 5D!50 [E#D(!W0 x?$[w!+u#.@ $%#u[ 6d#6r#@[#C[$cU#{w#,w#4K >P!v? 0_$]X#6K ~r kg x~$cK$Y|#qF$=/ Py KH$ch F>#@y!Bm#yU ],!:C#/2$9^$cr ];$ci#ZF!pq$8b Of$bG#;5 OU 5K#3f$6} vQ!$S!e%#1}!ju$`|!]' g/ q{#=9!;! ]< mM#UA#V[ 1^$cG$'y *J -_$Nn KH$FT#Df$3; }+$:V 5=!Z#$^K#Mm 'C$Hc A.#*k$9@!'8!m_#f{#y3$]%$[x 'm &~$a]!:L ds s'$(^$Xw#wy$7L @ #E9 RL!_i ;y#xz#== UN#]&$!N!z.$[k$+; 7f#(U!rn ds!M!#gq K-!!/ 6d!_y .X#eN#I-$[;!}H UN#/}!)8#Z; +{ @ #Q5 $o$a&$H4 F< rc#i+$$m#t` b%!8t#Et -X$dy#*k#z_!*h$3a#ed!mu$)i A3!tQ#c< A. ],#f%!$|#1,$Ub =y$4b$=| Ll!2($:( ZJ$de Mc!gp$1`#e3!&+$cc$eE VT!9# ;y$^ $#R$0&$cl#39 pe A^$,<!Kh Tq#I-$e!#UP _U#^f!`0 `.$F6$Pp$Wz |v#I-$^;!3d$a5$CN!S^ mE$`; AA ;g$ZQ 1&$F6$!x p5#N8#n4!sU!zx!W-#sO#nB ~T _Z +I K@$SS#|c#e($c&$#` 7O!W[$(]$5Y +I M]$f&#,t!LM de!l+!Ay Yv!$=!e/ ]<$Bs#f2$ed!-: ^J#PE F'#oQ 4y CE$d+$9!$CB#3]!(%$G.#E9$fA$R# x'$d6$%o$*?!i}!(/$]6!Z3$f6 ez mW pd vQ {g$$)#8-!$0$?= c*#F! ]o!U/ qS$c} Nf$@x#CQ M+ rL ^J#._!ec#Da N@$_5#r&#6w$fQ )%$Ek xE!YC!4)$%t ).$>} ds l;#6c!_@ !N$^ $>l#J_$IB$fj$bR#6P Q@$*K!l+ K($f` K8 K2$Uz$E9$[;#qe Q_$SG *k$Md!<q Ll!5]#]< $C$g) D6!=f#z@ &?$az$FU$g;$OS#'+$[e! g#5;$g,#Ll GD$^ !lU#E] _7#'+ 30$dY$DA$g,!{1 |($Fg t_$gQ!aJ#`j$de#<w!p1 )k#[< p. vy!q`#E] wJ n #{($dY$_+$Cz )o fD ]<!y!#xr C% L| tz ds _&$&4 )k *k#$.$[Z AA XL#Q[ %b$AO#]^ n>#ey ,F 9&#xz#6[# @ *-!3{ $n %N zg#=u#,Q$h(#+- ]< {+ c/ <?!7y$DB!{X yv$h3#M%$ZG$c~ nf 4/!4) )3!:( wl fF$f1!zB#zx$gZ#.!#n< (x |)$AQ GZ!!G$T#!v`#4( Wx$dY AF w6$hD$[t$fv#dM#]=!^Y#b- %+$Yp$Cv# @ +m }s$_8$ZM ;M UN %3!w2$hJ pz 6d!!k!Z& ^_ jG DX$f| {R {^ /E$?e I4$^P$Fn#:q g<#5H$Kc#mk#=S$ck#!H$QG$f.$d{$hf gi#1>!2L e=!3D!Fy#|)#2E ak F<!XI#0/ S% *V U?#qO mb!aO!T0 8w$eT$+; Lk$T8 +A p<!{R :o#Fv 0q I4!LX!{R$fx 5#$iD )1$[) Ij#ic#Zw!]U |7$f| fB# m gb!Fs!,h#qO$<.!u+!Sv e]#qO$*v #i$A$ 'D MT$i0 =~#iL$QG$XU ?a$hY N8$3C$6k$ZY _P#@R$f^$i:$R> e0 v;!5]$AG$7^ _W#(d#A_ lg#rW!r`$Zk sZ# m no!4$! 1#*k#?3#;o X-#t2 Jb#-@$GQ!W- NX x, Vz Ma!/e#4Y#>j$ m$j8$[q!+y# m %_$W` +E$HM!;P Hy#|{!%D#bP pY$Fg#SE# m )v -t Vz#|h |O# p$4'#aR#J !im!{4$hY $z!rR (X {4 Dl$7S!,E$Y<!PY!gi >] NI$j5 n3#G; |s$j`!9d#=*!Gl!gi a0 EX$+$ Q5 SH Y: ^c!;^ NW#%8$H} IX!1z$G?#%'$E- /F!!= /9 [z$Tq#?`!}]!_i Vz [[ al$g; (/!-A$7^$jq$'A e/$f]!;$$k+$bG$Km U< )G$j8$G'!s;#cg#f'#[< -<$Fm$;7#46 tq$k< [z#H8#6L!1I!W$ 5k$G3$6s!,&$ju )B!2C#Aa#6x$V`#Is H% +I _u ao$4; 6o$c]!qk$1;!RX Jb lr$kY G6 /T!hq# g$^m Qq$//$[3#J  Lk$f$#:l!;n!Sp$?U#V{#e%#3 !HK$kW$bt!#B ?, ?7!S|!+f dH L3!o9!IW$k~$[)#+:$k| *p$ju#dY$U] J{#N^#zN!Ld#C, ,w UX$hC!hq#mv#tA n $hm T< :v$k~$cG vn$k| (d!S|!Bs$U]!yM#?!#Y[!$)!l@$f$ j6!#f Vz ?<#ju#1e!Y:#VY!S|$gk ,w <M I=!%# +W$Fs #c$_T B6#1($Fa$l?!P:#F0 )/#*k$D[$,* |o j/$lS$Gs#=i bJ!CK$0L$[q#5y$Qw!*4$iV Xj$Fg$ll#=  +s!&x#h1!{' CN$.9#{|$lS$bR!z< UD g%$lz$c7$+2#.##.0!,c Vz wQ$f$ l}#GL$m'$hq#*l#D<!f#$m!$lv!_l ?+!Q_$0L$m($m4$]U#.=$m- _i +_ qW$MX uU!$V$f} A$#K6$ 1$m! ],!1^$(j!|D +Z#Mv$mH#MM#Jq!RM , $`F#g`!Wp 4g!J1!sa#S/!*5!R' ~}$6Y$Zk#Z1!_z$[P$k$ gE$mS#&V$;`$6Y#[f$i%#}_ +G p7!nP$Fg$/Z!3b#Ea Eh$k+$l2!(,#LQ!MH#,f!dR$m_!aT E< @U#2- XL!2u Ly!@s$QB!$)#U8 ds#,c!bG!T<!TD!/S Ly#'y )N$mr#-|$m_ rQ$ia$k~$fY f% v. 4b#eU 'D!Qf$mj$g+!Os!Q%$O)$?U!64$d= (t#HK$R $gw zM#k% I; 2| 54 e=#)Y$iS#f^$n,$8!$kY ZM$nQ II!*V$ev!_G -O 3#!?x Vz!T4 ]<!(i#DQ!g1!Lh Vz :f ^J#33 9s 'W$-S$mQ$[}#m-!*p#Dh$n_!rj$fl$15#<6 ,f!&x ,#!zx O< |> 4z 5Y$c,$B8 DL R| 8i uU N&$]z$c>$]w H} L?#,w$a|$T{!M8 +Z$J|#t, J{$V1$n_#[)$[S!kS 5{ (.$.c#_~$fY!=i =V$al Or$lM$eC!~&$oG '%!$6 uU!>@#jM!Vj#K*$hJ =T$a3#.t!{e ?R!.> l $?c$MC#Jq$o& OE$F6!;!$oM 2q$j_!&x!*z#oF v; f.#.z!_@ 6O$nZ$YB *J *b!kx uU#r&!;t!X|#/'$on$n8!:x KD PS!:h!Gl 2k$?+ bA$SO#.<$nR!e( ?G#!R#Is )~!SY#GR$a_#$y!f:!#e$n_$c1!A-#^U +d#HK#8` co!gj$aw#`d JE!uc c}!up 'y p,# w$B:$p<#Rq!hk H}!hB$aY Fc 9X mB#0X$p0$FJ#Ex$kA!a0$?1#:Z Q3$WG +G$`a =, @d#jw )H II ?R$?t#hx )3 #}!DM#&7$p; @d#O$$(E Iv#L'$?1$O{ :~ &^!!=#f-$B@ Ig$pk#z*$pm#l]!<q!aT!'? *f#FM D($pu$oG$pS$pa 4|$p{ v.##K!TH!v}$b7#J=#Ex$o&#-L$po D/!9/#H}##V$Ao$pj#G-$pJ G4 Z_![G! =!6g$ou CE I@ 5`$7?$pa O6$po$FJ 7w!.>!#l$`M |=#Zw!`0#&!$`5 QC#3n$;! uU$gv 8 $^(!DI$mV #{$`)$nb!OI$dK Ke$@Q#*t 9$![2#Y*!TH$OA @9 KD$5Q!1< *H$op Nu!zf#zf#1P!J?$3!$q) @A#HW$bG#FD Uk$a6!]: 6o$:` 8 $15#2F zW *H$Fa$ja$l;!a*#dQ!TH!<P Z_#*l#'p 0m uU ]X d- d<$Wh mh#1P$FZ$aO$oG#2F k! $%$[Y!{7#6e$7U$qZ!*a$?c$a|#/n#H@![b$c2!==!Tv#OI s>$E7$2# *J$Jn!$P#E5!SV Es$M[#=6$qU$qb$Hy$d= !?$p9#+:#t5 @$#W_!A1#J,$D|#/G *S Kf#FM!$r$]j!-u#sQ!vx#J,$7L!vP v.#GU$ps!Z6$)i s5#~F!wK#J, nr!x}$rr K/ SH 0Z vy ig$X^ 8+$Tv$pJ$]i c-$FJ#P+!TT$fv$]C #w!ok!W| Ke$Cm!J[#J=!!c#iy s%$G. rQ#bC$TR$pa$e{ FJ#.I$]!$7P 8b$`[ lo#DH ?'!  #E}$E2!~V#Mz &_#E< Q~ eX ^` UO :,$pT#H8 c} A$!h?!<*#FB$VU [] O3#+W$j1 JE ]> Z_! S#!5#2d uU yF$fl!!o$Ih!A?$pm =>$r- A3$5g J?#H5$`[ lG$10 dF$pm#!` Z_!kS M' -C$ql!tg$[S Bq$+?#)w$sy (]!<q!Mb$*F!yh#Fo$fY#Xo!r@#*e!em$4H$b1!Ko#WY#+U#G^$]d b`#9m$)= %u l~!<q!ze#)W!3k#bd$U] ^X$j/ %R (3!o$$`: ^R#.8$Nh$Y1 I& b7#t, XP#6m ne#6: A-$`b$.e %0#?1$sD!SV!Ax$Ce#Zv##-$`w Or 0Z$:i$r1$tP$od >K#8M!{1 (@!i9 ^R$mI!*^$3C#L8$p* mM$?5#DH$5} ~o!tO$.e :)#N%!%]$^ $_B 9c!=O$3& W<$E|!Lh 8b!.q uU ^  Z_ s+$`J!?Z IX KQ$`w#4l!,}!O)#!A$a##Y; VW$5L#w4$po#(L yF$G} +=$ZX$q< CD#9A#6:$,m$s{$.R 14$hu 2I$B: s8$*b!)9!Q*$M- _($_{$tz :_!3T aO#oF A$!2E#.%$F2 >4$s{$mI!_O!!= Uv$a_!;$$*n#sf#0u!oZ$s{ qN *r YK!vc Vu!a|#6  X,!6n$M-$@d$5!#q-#%m +%$`l$up#eV F9!7-$pv$si$uS$=  !| D/!*l co!Hs#kt!Su M= h}$r- `/ m}$r$#i.$v( =+#%,!Y{$v,$DK!J/ Uk VK!f^#hu$p;# <!r5 j/$uh$tx![| qK &l$Ad!&k!=)$bX#%x#eK$DU!3T |L$u,#8( +D#{M %u!jo!;t!>G$,5#3t$vN$]X!`'$4& /v$v<!B~$C5$,q$0w 4R#0u!#q!:x xF!.<$mr Uv$Ac#ZD$I[#ZG$.@#xz!{7$4-!GD$um!6*!<!$kk `? k# t4#U_$`:!z0 op!<f$ld$uV$B!!<.#Yr#>_!OC M=$gD!_g 9c =$#_#$F2$vI!<.#y{$kw#Ly$vH$t(!.^!.Q!)X$BC +%$B.#[X!^K g3#M4 +%$c,#_#!Ln!y>$o}$7%$qB M+$K !7| M=!q`$eO!CY#-J$pj!&R$uj$JD#y $JF$vH$^1$N, 92!x/$n4$]y$42$wV# %$;?!M $ZM$?E$n` ~_!TN!sl!=4#}w#~L#Z!!M $[M!=_!*V!w< s} M?$c #F*#gq!~x 2X ^S$f:$@V!vb#+t @l$^ $4/!O*!?h$Q< .e$h* PE!*V!vD!TN .*$f?#}'!:; R}$!N!!+$F6$hh$ws!y8#)Y!X=$]6 g]#f?$v{ Kl (@$iR!qE hi!O0$pv#N[$d6#Xf!vm#H1!Ta$jq#}a!Zd H& s}!Qr#S/ {m$A1 L`!&k @x$nU!/f {o$av$J@!'4 |N!_L!#0 M=$do 7]!/f!ym#jr#Ef#*k#dJ!Wn$$n$x4 -i$F6!0T!C* HH#+^ c?$kH uQ#lr#~0$QU P0 vQ!7E H~$x9 JE ;,$Z6!U~$<k!dj!0F vy$pO ih!z/$xt!(S ]i#>c$'6!|s#Fk 0W _W$+h!/B!{&#&/ Ke$eC#U8 /)!1I$x4 8R$^ $KS!LY!z=$pm!N,$[6!P(!1I$y3#N? ?G$Tq!C*!@M$O@!SY |O!yb$55$u*$VI$M# 92 hO#%'!Lr i`#eC#nt VL!`p R.$YR#e6!Ky!z=$O@ kq zg Lo$s' v%$P$$={!!O#r6#)s X{!gv `l &H Zn V@!Y< R.$4I 25$yp!~] KD 6K <v!{%$yv!/y$yx#F/!={!mV!/O ]-$F&!H_!'&#kE$h>$r1 5D DU#?x#9H!6'$z, 54 QW$?B VL 9n#E} 4^#yA!#C Ix!K_$z7 ^c#&? +n#d $QU 0Z$HY!.D!n:!xv JE!Pi!'& }z$$K!K{$s- ]w!4^$:H!y8$pm pF$zP#(L$uZ '8!TT$VD (c =?!@M Ly!jH ^5!2*$D<$@n$sh$7L I[#.8#/0$m]$jX uz!y&#f> If$s[$X'#Ia ^f!6*#_~$`: U !eJ!rM!>0!TT$Wx#M=#+B Q=$z{ i` }!!`>$v5!7;#E}$>} <) s}#r&$6<$4T$Y3$8,#9w$[I#!V $% _0$'-!*?!l3$o,${($Wr i  ws!9?!TH!WR wl$0M!#v$p)${@$i6 ?w$f]##~$P$${/ xh#JI 8J#>c!~)$W, Du##? gP$CC!%1$:`!e4!aT!0T$4`$oP vP 21 B?$CY i3$P$$5r 3E!UC!eN#EM#(6 ^D#Ev#9a$$n$z&$QP g=#+i 6n$ 3$oh$VU ,c!.W$@m$*p$U5$z|!aI#*x!cL#F<!2V$hG#Qi$kU cC$mq Y  :O${w @A#3M#G' ^D#Fh y/$ur!n(!0F No$_d!:u Q@!8h *H$6& ;*$'Y##f${9#aA ^l#TU#*5!)/!fo#Eq#9( i.!*y!=8 k1#J7 53!A_!U8!a`!i,!XT$V4 ~.#9m!G(!Ta$>}!@8#+R!jk!Iv R. ^K ES ff$xa$+)$xW$:` Xw!$P!j^$ss$mq i@ L-!K!#=W ?U$xc ]6 $v e@!j !xQ 8R$Jq!$V#%+!}i j<#1.$J_#,3!:u -g!J1#Pl _'!]>$Sk!~$#0@$Rc#fQ$1h &M!  #DM$I}!O)$t%#Tq!&k |- e0#F*!z< OE$v&$fk#; #1+ ov!6;$6v$H7!$-#jS 1'#aI$}9$<b @n#ZA ~S!]8#0u }&#pC YK#K<$PX$uV bZ!$-#>o$%(#-9$uV$Of$?E Y? 9w!>C!&k#m-#pC!HT!Ql!zX H}#mN$T= K4!b2#VK$vH$6}$JC SU#Ht$wB!&^$Rc O! '0 /,#x? MC pd fP$gu#oM!^h$w1$Pa#r# '0!_;!t^ J( [T Wu Xp#sF$=a$pv$Ho$& #.| 1q!k(!#- JO#pk li$j$!+#$w+$R2$n>$1Z ;/ IP A~$JB!US#%-#[G#`W$w+$=i iE$lX##7$pv$fN il A/!Xt$Wt$v,$K;!R^ 'D eg$pv$NP iz#[@#EI!3n %u!WY#uA$~K!cA$F2#V2 _Q#<F$qD$vB$S3 le +3 2q$v& dO!:Z#q=#id#0j#I&#uA$ju *+#JT FJ$S)!4V$nx$uh$R{!VA![S#%t 4r#9($&8#7R$Uw$q|!Fd JO$3h aR +^#)Y!,* ^l ke!w>$VR i2#JC$Qn Y'#E1 &h#,+ 11$Ko!.:$r@ ;c$x>#JC$6> Y'!$P#h%$R+$Ew ._!1u$^o!k; A~ ]o Y'!$7 &]#)N$:-$OY#ty#C' @K#04$U,$,m$m-#v|!TZ _w$KX#7[$bf!k.!3T JI!:Z!hq 0x$~A#hW$OY G.$^y# 1 M= ar!:Z$k$ &]% i qa$OY Z'$Ul#0j!3~$~p#1( ,D Kt iK$OM yS#@)$fi!&k$Tx$Jr#1( ,n% /$^[ v4 V9#v* [a!&k!7%!{i ev$.W$~5$dY% 1#cH!er#+x M=!fW!{i% E &% h-$QN >] k/$$s$il#0u$nC$%n#2!$K~$QN$GE %J#=B!DI!S: Iw vC 6v$4a#2J Ig ?a$Ko!Ut!Ex#Zw!j8!3( _r#k.$j^ &7!&8#xc!{i#sj$qN#0R !2$S3!_9 yR Z*!%W$~` 6v%!g!F>$qO$7& ^l di#Xp zY#?&%!X%!v MG!IW !U#F' ?p$JT$,m#Is!8B#:* *`$Sc#_Y#>j$ =!i}!.C$Jq!A6$F2 '/!UY )H!MI!{i!!=$n0$P;#[f Y8$p^ Mz!i, #T$N;!d?!1=#io%!t$AQ%!N$r} {O YK wl$P+$K|$ab#0R!:7 GZ#]h AO#Cm!%W `5 _Q!%0 SW D>%#O$Of#y<!Hh!O%%!W$bi zq$9Q$ =!T0 `&% 1!f^ R,!m)$40$L_% 2#}V#49#0R S^ _o!%#!_J!2L!TZ$e{ J; V. Y@!QE%#q$Qc F'$d= %w#+^ 7] _r!%B#zY H<#MJ#0_!i9 A@#L} *'#j9!1& [9#gF f0#KB Uq#0R!]/ ._!J1 fB Av!TZ _A!15$/4 LD#MW!Tx$W4 ._$|b iw#=!%$=%!S!{O!C&$EE%$C$Ud$e]!HB!52% ~ iX!15# [#ve#7%!U& O] ._$3[ .x#C7!%W#>s ^l$L4!Mk#uq!-3 )H$oi -+!<7$<'#,c I^$KA#`)! /!T:$:y%$Y$|R!z<!GF$&7!aT I^$N;$}J#[F Zb% W%#5$HM!o<#*3#Lb%!W vn!15 B}!uO#=A!%J#9:$KX!GR iv${1 ]h kQ d`$_I$mV$VV% v YK!G6#*? FR$Ko#g_ ;U o/%!t$SD ]I%$j#Wf%%&$5~ kQ$UR j<#!F$q|#u1$KX!Gz%!&%%&!yw#{z#.z qu%%6 h&$KX#L} 2q$OW ,w$L( JY$Tu!ol Xy$Jq%$u *S ]G$W4%$=$Rc$y6!-y Ay c4#0R%%2$*s!H[ $Q%!A 1V 6k$Nh!&=$E:#s{!%J#9r$OY$*a {| W@%$=$N}!7=#;P$H$#'!$Ck$K;$3O$3i /H#Yw%$9$L>!uZ ]s#^5!U&$Ik J; SH#ux!$/%#w$KG#J.!c(#*N$,)%&3$K0 ZA Hu Ct!FO%#w$QD#Wd uk$?q%#f!O9$QW!<7!5X#..!0+$L3 `I$*z#+W!U&$sz!/? GI$$G g/$F> dw aD!pu!wW$$A!|m$Gb k/%&6#e& tR!TZ$HG!^+ Us$9g#K+ BM$|v$O~$O| (X$uM!}T#kq$>s#8l#=Y!CT%#Q N  n&%$x!!k#$)!fv$$W%&x!OT >B#S'$on (c [9$2B#;~$z;$qO DC _r$mP$dG H}!57%!v#MP#5I UA#Jg tO%&z#vg II _?%!|$}T$<k$iV ]x%'0!;W$kD%&h$Pa$m)!wn$uO!Uq +6$U>#6v#TK 4o%!o$J< bs!{`!3m!hm!#c$Q'%'O =R fA!%J#y<%!> oJ!{a%'W cq%'0!d  fn!:z%#l%#A#+O!nY#xO#En$PT#<1$1b!* %'^$~+%'T!p>##(%'n% =#H7 f(!%#$QW%!|!ws#5T%'. S? GZ#1G#oE%$x$?;%'` L7$<v%'B!'M GZ C@ /K!*a%#w _f%'u$jI$Rx%'c!5R$R?$v/ wJ%%1$|p%(5!4S!/1#F'#}q _o#s1 '/#$|%&!%!k#K;#5u$$o#BB$Pa s% %5 'r! F Xy%'j$V^#6!%!Q$Go% 1$.h ;|#)B 7]$Q'%(5 `!$u}!r[#BB _R#H.!+b ,?$GL *f$_t%!I${+$A&%(B!?d%$E$7l )0 e.!0s%#L!R}#_a#4 #J[$PT#+<!)h#<<!$P EX%!`!6n#Qm#TY#J[%&) X4$DN$L) *`%#;$h[$?f#H$#0R$ N#mk `q Pt$N,$p~$U>#UE#)G#T{$iV >W%$2!@g H1#X7$40$|v$;R /i$Y$!K=%&U$S.!-[ <O Q$#M+$jg%!v!F6$!%$-t%&U$VU 5a#^X ~6$,.%(j$I_$5;$;'!7o!%W!J/%)! @$#Pd$3,%(j%!C#Io Y/ UP#Z:!r! ~o!M}#<g L.!it 1V$t(!rt$>%%%l$wo BM#9( ;} qN#QW!)J#0:!yw%!Z 60!N@$(F!|m$P< Cx ?d#Nn#G& 25$Qz#IX$KZ s`$Oe Z^ $P $T Hg#]* *S#'L!15 o.$LK!)a%&?$O0#nr#Ei |6!#^$M.!a3!)D#GM%'(!.0#-m#8u#82!Kz Bx `O y$!Mb$.E%'3 pN FR!!x!^R!+f$oG$zb ,w wS#G7#u.$Oe$9G 6V!A|!z}$Op$P<#$?!9M$a6$nR#uR W% Mc!fL$&R$oM#HG ['!$S% V%'($fN!Xe y- #4$np DU I:!fL$8H$N(!vm Iv EG$Lj$P7#V2 T+ v.!m] <d a[!ZP!jg%+ #7c U/!pb#c> v.!_g %2#f9#SL$6)%+-%)l#Z~ X+ +S#-( N~",
		"Data Chunk 7: b+ G4!-] Ad#mn%%&%)x#qI$+]$vD%)_!i9 ^G zC#t&!Vf%$`$NK%)A$+] w`%)_ 5D 65$XQ Ek%(@%'3 ZA EG#n=!^7$]k ^y =9 ~v UN!nL$sI%)B [r#Vq ,g$?w!an!X, :& pu#yC!AX%#a _i$-}!T~ WR% ~!.: a1$iH!F%#]3 oj$Ku!Cd!UJ ,g% / vH [F$?K$=x 3%%+ #!$ EG#?; 44$_Y!%W!3S [F X{#{p z9%#a$gT 4Y a` Zp${1#o;%+n$sk#bf!&L%,* pd 1L W6 hE!_9!/( _p V> vm!' !p}#.U G<$L! b,$#H 4e%$x WO :&#&/$?e FT%,A I:#n0!be ]~%+  :~#gD v+$jz$#f$5d$Ns >m _q#&H$3(%!W$?y ^G O-$#e$1m%,*$t( ;H![1#C !an$db%,m$@f#=L!&W%,q%,Z iF T_$c^!h2$GE%,x#7O#7;$kL$Me%,g#OC )?%!w!%W ?|#gD#{G#7i$8l$QU%$%%,g$M@ %~$$G%-.!]M r>$v*#?k%%z$Ow$>S .  sb$F> Cx%-0!,/$<G$yx Ao$Lj !>$Se &c%,_$6&%-%$eb#+K%-4#7| J,$*m$tY% i!Uw%-F _v#6x$|,%(j$5~ _3!?S -j%,F#t,$gR$(V$D<$| !9c$L!$*= @P V'!kA 1($,x$(V$CY j@%$`$<b$,9!ed #u$}3#t, aV r>%+Y!9Y!U&!z< <d!?Y V[ 5Y D/#t, ^H%-~!%C$^N%+-$Ek F2 A/ B0#BA%-.$Gb!%O$Co$k@ IX%+] )@ |< D, c.$av$c- b6 TR$ y S.$<T#&H$B!!!/![K!35#,W &.!:(%.7 [O$gW%-T%-$!ay#/T 'a#M=!.^ Wg#Tz$<_#O%%%z ZV ;y!jM$1B KD%#g%,a cM$yw%.R =9$Q.$.?!.:!TZ#_#%,a Rw$yT%$`%-P#Kx L5!Sx%!W$Y_$-w 1S b:%-T$@1!%O cU Bw#JH!h~$M(%.y#Ew!!?%!t%.$ <+#v^!'($yZ 7n `s BB#_=#9V#5U%(j +{ 65#fO!jW -8 2F _R!oK$U|%(K$x4$MJ bB T4!l)!pT%!W$}e!oK$)O$=0$<H#&H aq$fB =E /s%$x m3#gD$),#c7!7F%,q a##m/!$V!)Y%/F$:k b* c&$65#-_$40%-P#:Q#E,!zJ%/] b+$m;!qM#1N#18%'s _p!R6 Bp#?*$F> Q=%/S#H:$}O#Bf!U& sZ _S x) g/!#_$d1#p) b6!4j$|. jZ!^5$p~ _(!^k Y(!BO .e!!=$[~%0#$~ $/#!^h%#U `- [q#!s Vg#JT$fZ )@%.t$x&#dl!o. 0I%/^ ;M Q*!#Q$r.$Tb b6#wX#xh$}i!U&!T}##^$:B Va#'3%!o#[f jT#Om$=#!C4$R6%#U aC v2$:B$Ey%!6$ru!Z# In$b[ ui%%L#Df ?A!mV Lw!:C!an {.%/{$Ke!,-!z2!Tx lx ?A#`g!iT$)f%#a NU ]4$7i%+B$E^!%J$wT!L6 Y(#72 3s!TZ$rC 6# J>%+p%*$!4##0&#|h 5z QP#xc%.m _0 k`#3#!#<!H$%$Y ,v AV!tM S)$xh#m# ]B#&Y%/a$y'!;t `S!/5 JS##b$~d pd!c%!Y3#ec%-4$wk )f!g# ^t#&G$~d 6k!bq ^!#9#%1K %N rI#=B 6J#vG%!1$@Q xS%&_!@l!<W )H Ze ^=$>N!gF#X_ %u!C7 ]p zf#8 #?u!%J$OA!VU Xx {W (i$o} u  S4 h#$1_$4f%.w$VU =E$$.!gY!U] @a!{~%%d!jN$,e%+  HB 2& AL!K9$^s %u#2u#/o!/{$IE u8 )H$J| wH!<R#DB%!W!xB >W!:n$,} o=%2( ]P wH%+0!<&% ^%1^$GC#bN#m@%.: s~%2*!iz Qz% /!>j!}?!&z$J[%+| _h )d Y%#t; (L${1#{>!}?$?K#N^ l_%.5!{~!QY qw +f%.c$Un Y~ xm u*$45%,k!8B =E!AH U{%+`$va Y3$;u$Ot$tN% ^$8! =E!p[!kU!an!%| S4!Al It!GM q+%-.$R> Y%!,/!YN%!W$FZ Y3#8( uO$;w%,_ _( Y%#v/ Yo%.)$wO%2r!#a#rk!]A!%W!=i%2*!gn$/r#f9!;X$?b 4?%)V!Uo$81%+ !IY!{D!<R#Fp$/7$[B S4 Eh#he$3`%'=#&W 2& g#$'A!r0%#U$H7 4?$iu#@g#jJ 4r -! ^b!#( /B Or 0I Z~!G6%*f% 4$e*%3F bZ xS!tM!h,!an tU S4$Lt#|M a3!Y)%!1$ ~!@j pE .?!%u%&h%1|%(G#C^$ 0#6d%2. _i 6^!!, }Y#A %0@!!A!qt I1$Uw$on#*R Bh Mg bA$6O%!W!!8%3M f<$i> II!v[ ]~$HT i# >7!Qt%3d!{~ x,!1_!au%4:%/O Q{ FO#$I!Tm%45%2w! * 9Y!DT%4F$Qn dz!4e!/@%3o$HM%36 ?d#;#$tH$aT Q{$vk +H!Pp Ih <v#O! #b%4Z%4Q%4c!4W$}9!)I!an$m.!Sb$qX!Dt$oI%2.#n2!ig$r1!$U% ~ d=!}?#DP#iA!wX$pv!+; S4#?&!k0#|H%,0%2l%$K%!/%4[!5A%1w#>L V{%4l bu#V'#3~#*O%4} _0 .h GI w3%0  Q= <[!0t$Nu IP%!1$<b!ep!%}!'8%.c NB!<F Nc!L8!4x#6:$Xs%2[!<7!&-%$x!Vk!;P!3f!+H 9M$<1%2.$6>!d_#[L#Ay%.c Y_#vV#gX#`>!|r%5I$7L!QB SH )v!uL$~d $< c9#>i yU%5)$R8 '[!r. RA$x: >Y!;P PE$sG$?5%5a%5p#E6 ^q$q= ;.#=V$RZ$)l J`!Wo%!1%4%%%{$d= ?]%2! W !;P Z'$A`!:W$~d$6& Cl%'|!~P$v&!LX!;P%/C$0:! F%6$%2U!x0#Hx#@N$u] !O!=B$.[#_y!ug%5I$GE Cl!1T$t0$F2!*P!=q ]q#ND!tU%5I$5r%6G!3T $c$p|#Xx!>F#g #^5%3.%4}%1G ;H!3T (%$nb!B5#Y=!<~$!~#rt%1F ]`$IC%4j ('$pj#9E%5E#s1%6e#Qc 5T!j)%,  }8 rL%6J $6%5E#r`#Q<%6q Iw%6s E0 R=%2!$h !@C%6z#QT#TN%6} 5~ Cl Ta SP$n4!T}%5E xc%6p% ) 8K ]~#Q7 W1$P)#U_ fq!h)#rj%7'%73$:k y)#s1 u+%4@#{F#Y= e8#fc#rb!3T e6 >W Oz!0*#wx#9[ 5#%5E sf$#+$mV$uS!_4!)  {~#gT%7O$lA#3w$#6#%l#UY%2.#C, )V#!?!d-#,c$T<%5E#*!#=5$MR$W|%4c x:!$U 4'$O{$Aq#Y=!Dn$_l!k!% o$Ek!Cj ]y Wx ??%7. +u!=}!qW#:% 74!l$%1i%2l%!m 5z Cs$nJ +%#7u#D6%7^%):#0u$i/ 9(!tA!/F#+~ KA cS!kq#A_%7=#0j ZY#vJ!b. c;!M=$w1 df {4 t.!!s$Y;%8< &5 F-!Dn 6O >7#)6 Nb cS$0K#^4#:_$3=%6S e{ gh#0d Gb$pv%77 S[%&0!<u$y3 -- cS$P2#Fo$~9$}d g<#Qr!#h$vX#q@% M 1< gh%5,%$g$pv!sl DC b2$L6!PU#JC %6 F-!Tf$os Oc Xl%8m%/p$1< BF%/b +=%%{%8J$q  B~$v& ig#v.%%4$8I!V1#04 Bc z'$s #o=$n4 #e 1i!0&$'f rl%90%8m i,$9^ eM!TN m`%5s `n%,o% c%90 -6 Q`!.>#oS%2!!L<%66!-<#$f!J8#JC %_ F-$3C &%!LX$F2 T]!<F!a(#68#6# %u x'#/V$s  &R#^x (@$/Y GS$S_$k5$qO!wx ?x!16 H.%9@%8C!#R#6e `>#eX%9%!j)$K_%1-!@4$pv S^%9Y%9N%9r$xn!9N b|!qE );%4) ?-%8m#T?$t;$yx!}e%:! qn 'E!Lv!!+%9G%:(%1m$kF%6S ]o!G>$.>$@l%9W &L%9Y cU$|g!6V%9^ ^x!G> `/!!]$tU W? GS%:=$<G$y'$@q%:! dh 'z$/g$Io%:<!Bw %x$1x#04$:` 5O KP!-s K8!!+%7[ Mg$1w! a%6S%54#b_ ;5%9y NF GS ` %:3!Dn#04 Z~%:c$ b +=!KD%9Y _c%:i%:*$y# 5O LQ Q@$v& M5%9Y#B+$|O }I%:U#0&#2T$0L Tv%9y $|%9Y oe$zt lo%:U RA!Ac#/t#{4%;&#=V!K[!pc$ec$xz#kO#/V#G6 [$$o} 8o%;($ H#^f#F'$*` ?V!xB )2 EK$tU +h%9Y!p[%&S#6y#JC!pj Q` m_!lJ$x: O(%:{ ^a$9}#vY%9% 44 F-${n 2,%9K!|U GS K@$C7#C}%:5#=V%.= 9j!UQ%:e cS#,T$Bt$</%8w%;d {m > $Wn$}K!VI!nv$ex$$@%!Q#g9%;B#G&#6R%,F .e%;s!:T q]$$@!T0#d@%;B$mr %a!~,%9W!HC gC X<$tj%8<%91!HG$2a :Y$wj ;n!=}!9l$Cp#0u%:  <[$2N w[$wj $X!=} S>$SG%#. f# EK gr$oh Ky$n4 }&!<F cy$<% >'$iV!wx <[!VA 28$ _$F2 /'%<K Z0$@4!|t%9^ cp nG!i2 MR%<I%8I!4C xc%1U%<9#7u!LT 40 71$wj%<+#Wv!f` $@%90%;s#.= Lw$4<$w1 ,r!<F#=}$y1#b+%<9%8x mc Nr /,!h?$vH eY#^Q!_Q$2G!a^%9%%8V |- cD!=j%8Z 7$#^Q Cn!-a :.%;L%5} v]!3X$hA$VY wJ$Tn!!X!8A%;@#+:%66 oe 9w#M)$w1 4<%=;$4($R`$rL Vh!VI!>s [r!*0%86!*#%<w#lj$&q!KW% 6%9G%5~! |$.K#6: X!%<w$M0#c,#%S#JC %, c9#+>!#p!TN%=P%<c!KH$DT%9/%9^ &x 1i!1u!WJ# *%=D%:1$LU$!s#QH%<O!Au 1i!1G Yh#2u$w1%=* vU%1?$~s (V 1i!*R Yh$?o +% &S%;H ls$YU wg$~}%8P B} Yh e]$w1%=/ 57!@_$A=%<$!zI 1i dX lx {.$w1 $3!=B hG!'x J&$~s ,? 1i!w% e{%:/#PS ?V ~,%8_!>J$A>#{I f+ sc%:| c$$w_ cw t7 Xb$4X }+#_o$vN .;%8s%:r bd%=f eg Hx!7S%8F#TB$v,%:F!!k$M!!7W%8Z 'o#vV$DS$$z$LW$~_ %B DC$V$ @!!a>$P0#=V!}3!<2!,w%=T$vN%<?!da oe <k$]` Am$lA _h!4w$} !eL#{I!OH!da zf$I2%8q%:F#Us%=<##f%!^!0R%8~ >1!:)$Pr Ns!VI$~D i3#9b$xn mE%>v#B+ 8#!RS$tl f$ S[ nx!xl%1b#'V 6x%>v ` #W3%&O .e%>0 fm#_>$xz vH%8s%;) .[$yZ!v3%>;!;1$S&%?Y 1?!%Y `/ 4w!sR%9W (z%'/ n $uD%6_%>F sc `/% :$y9!o$ !d%'/$D&!1I$|D tU%>G!;} 0w$uM!)V#<x v]%<n E?#9[ d^!Ps%?r i~%2!#e6%8s V9#5?%?Y%>@ S[!p[% s!Xb#!A$lA!M`!b;!/y$ya$ L ?V%3x$Wr#ZZ$xF +p%?a%@:$y`%?Y%;' .D ep |U!TN _ %>%!0z!/y$|8$CG%@> J.$g5 Y:$n4 xG 1i!VG$u9%?Y $k%5s ep#kW#6:#))#vV!6E!ki%?Y%-, 3z%:r#km$P@ DE c$$f #,[ ;&$kA#n|%>L ~m# O$nB%@b$h- t7 lQ%@[$}j C^%5P!q5#2=%/:#M`%@t!/l$kK#0j!3S%5P#vE!D0$F2 Bo%66!-*%@f#1#%<|#n7 Hs#Ur$pv!1L%A #FH!!?%;w 7f%66 QZ$Pt%A8%7:$R^#gZ%'V%A) cE%@z Mh !{ Yu%A8 ,. A8!j/%1J#1#!8] S2 xc !O!x!$xW '3!=B$89$B%#f3$U~%@n!E? |L!%b%#2%;M$Mk%0U$9#%0U#1#%@C XB!#2 I*$n4 Ak%5P%(J#9b%<O#t,%@> #a#J>$ao%#2%@y!@^#<B!4<%8`!&+ c9 e*$4I$yr B1%<+#j{!+q!2x f4%8f%8m#>F!>($p<#T]%>L i)$gA!Ot$6v%91#5M!%M k~$v&!nU%=c!T~%?c$6v%;X Ga%(E JX%@B%?J$fo$$b!3J$xz!kq%=n!0b# k$o}!xB%=n!8($9[$9Q N7%BG tG .S$av DE%>{#J)%?n$}d%8C$2Y%&Y%B&$>M%@> i #8v ;&$x@ Ns%9G ]-!%M (.%-p!&p%@S!),!xG%BK%#3 {@%BN q{#+~$|{%>L#?;$5J!|s%;w *7 c9!qW Ct!cu$F&!]*!;P#ES$@4$px#0@ c1 {4#*- RB$sy%>u 3z!;>$9[%7T /K%5s!j~ #} C#!)% EK$T>#F_%A<#0j Tx%C* `  7N$Bz!T6%=$#m-#c~ W8%8` {W#vV!7y%0V!T6!8j S2$rR$9[%;w%CO%@i T^!$c!T6 ,l%6+%#t%C7%CC%Ae `( q]$sy%<]!5<!vG$uO%'W$O2%5] ~G }|%@b 4=#Q_ EF%(!%CC%>5!:T#1x$DC$4H ^8%AI#bl#,s$u: u;%@_$rJ -6%;|#FD!;P#+O$&}$bP#1.%5h {4 d` cN$wu%D( t7#S0$|s$WB#1.%>d#0> ]D#BL%BP%6@ t7#%P$,X%7k!uJ%@> yS!0L$nA!&$%=K!Hs cN%>8#0j!#` 1i%/| |<!<[$xF%Cr!IN$#C$MP#6: dJ%>G!o+!c$$R+$G>%66#_i%2=!)n%AB EK!uf $L!kU$BM!T6 -1%66%13! 9#~S%#2%>d#U! MC y5#;L#SJ%>L#y6!?5#}y%DX%?k ,3!xq#HO%7q#m0#Sy$wb#3C$.k J7%AY CQ!sb#9H%3~ %u%DN#Q4$fj!V6#Cf#Ec%:F!u#!+: U<$0M#Ng%Av }[$6z j-#Ec ), 9`#$_#!=$]k B-%>{$]]$_`$vY$4H%$^ cT%<X!xU%7q#nL DC#Dk$_&$I9#19%?p$y*$L< 5e%=Z%@h n~ ?9#Gc%(c 0W dt 8u!xq R=#i%$uy#=V#2f$Wt!9X!Xu$u*%=b ~L$:B!lw$Yf$}d%<|!QP &u$~]%'L#O7!`*!l5 Om!L4%8q%;^$y< 58#u9!Tl UK!F,$ _#w` ;/%B& f}$gt!._#`c$nG uU >j#/i##_%7p$wu P` &2!7;!z2#=M$P$%6x DX$>N >3%>y MF!F,#e}$7) zR$/m +G!Bs cc!0,% u#3a JE U? c2!`S#J5#N_$r1!rN S? pE eA!3_$F&%=?! =!%P 1* =W%'W qa U%%<F 0F!,6$O4 iw d;%5t%%x!/#${E!ey$nS$=J *6!+h! d (N /q#s;#1B!= $q|#?E C%!ga *H!'|$ze '? d; cy%7u#*/#FB%>$ pL#Dp$tp#.!!.-%Ft%>k%-R `K##g I&%AY$2|!!_ =4 L/$F& Jg c2#8.$Yy%!;$sh!8j#gw%07 !w$xQ%!j C%%D:$`T c5%Fa!4W &2#mO ~h J?#Is%!m!!O!._%'7$iJ$sh%$^$yb!Dh $X#nd$nf%:; J(#B+%@0#1P R,!!O#?F!'?#mv%GP!OH 2X!11$yI%F%!2I$yo!sb%-8#,A Zx C% l< n=!{m%Gm%F=#j^ 2X 4v% #$}V%GL#G,$$c%Gm d. [N#31$Gy#)Y!lP C%!}Z%'U$*c%F%!`Q!!O!0&$P0!Am#J  aW &2!vd$7n$'N%Fy!OU!!O# v b{!Ei$oJ%Fc%,~#^q#4.$q+$/Y$}|!Dh!*q%:Z!#[%F{$|Y#s] s6$r7%-,$7k!Dh d1#J !O9%'d w5%D6$>J$oP!j5%HS Q*$[8 KD!a'$gt iU!`/$[I$qZ%BL J($:B 0b!Wo$oo U%${?$0R!Jv!`! +G [N%H= s/%Au!;%$n) nO%'d!Re$4e$)G$qr%?k MC v5!XS$aq%C) /9 c&#*.$MH$4T%G4!7]!4M %Y%9c 8~ 6s o^!{G!~#$G$$qg%7P 7B!#C (&#df%&r cw 6O!y&$|g$=1$qg$h-#Yb!#C +Y!e/%GP%=m pL#O;#6!$9Q S(%Gt$wr!gu#tr#Is 'G%H+ ~. a%!4<%!^!bt%H+ ]j!G0 FV$_|!FO#S1 F;%Cu$Ov%I:$M5#9Q 1&%H5%@C s>!r.$y&$zH!L.#}|%EB (=%?t 5@%H+#l;%B~#n^!TH L/#S1%Iu$!7 Jb ax &2$as!/b%I} 4$ &2#.= Iw$i:!U] :*#=& |t$)a g2%I}%>u `)%<X -F!NN#J  yW &2 eL%@% 9N$lz%IL$LO!*~ >6$~5 3+ dI!*I!Ex!/y%!^ o{ 1<!t[!-d Q]#**!NI%H+ v]!0c!i>!T<!0X cq _#!Wq s} 4j%JN T] IF#N,!T0 q. c~!i!!;E%,M 33%J`!5+!p% >'%!Q#JU%F{ _# t$$O)%<v!!R!s6$BH#2- sG%JZ dv%4# 'D%Ax!$y#Dg#,F$q| 8~! /%Jg )@$p( dM%F8 Z0#9K!Ip!S|$ 3%J{ aN%K* d.#m[!N3 oY%Jd#.X%K2#9d$n_#$|%F8 qH%&l%#. xb%Jf _# }&$o2!la#}| TO%KA%Jy%>o 2| Q-!zr$k+%5e$qm#8W$<S%Jo!7%%K; DS$n_%Fh%KS!wb%KU%Jy%I#%K($]u%KQ#=& I%$5) g?%Jo o;%KX$q`$k+ ^_ *H#ro#6c%Ki $z%Kk$yr%Km U%$RQ#a~ g?#F' OE%JN%K( N_%Km -6 *H#C5$g #2- y6%KX!Ws%L!%H+ g>$`&%Kz$QU$AK%Jq%#8$kc 9<%L$%C[$BS%L0%L(%KN b-%L4%L##41%L.$?}%JL%L:%K( 6/%L=%L,%L%%L8$lB!HC%L; 0R%LF#}|%LH aL%LB%LK%LD!zZ -<%L5%L?#nI%LA%L9%LS _# E?"
	}
	
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
