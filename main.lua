-- WeroHub Instant Wins - Ultimate Sink & Lock Position
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Tọa độ chuẩn từ ảnh của bạn (trừ 3 đơn vị trục Y để lún sâu hẳn xuống lòng đất/bệ đỡ)
local targetPosition = Vector3.new(-8077.64, 278.79 - 3, 2740.76)

-- Xóa giao diện cũ nếu đã tồn tại
if CoreGui:FindFirstChild("WeroHubUltimate") then
    CoreGui.WeroHubUltimate:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WeroHubUltimate"
ScreenGui.Parent = CoreGui

-- Khung Menu chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 400)
MainFrame.Position = UDim2.new(0.6, -180, 0.25, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
Title.Text = "  coprime Instant Wins"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- Nút đóng khung
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 6)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 1. Nút khóa chặt vị trí lún & chống Tele
local LockSinkBtn = Instance.new("TextButton")
LockSinkBtn.Size = UDim2.new(0.92, 0, 0, 40)
LockSinkBtn.Position = UDim2.new(0.04, 0, 0.13, 0)
LockSinkBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
LockSinkBtn.Text = "OFF - Lock Sink Position"
LockSinkBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
LockSinkBtn.TextSize = 14
LockSinkBtn.Font = Enum.Font.GothamBold
LockSinkBtn.Parent = MainFrame

local LockSinkCorner = Instance.new("UICorner")
LockSinkCorner.CornerRadius = UDim.new(0, 8)
LockSinkCorner.Parent = LockSinkBtn

-- 2. Nút Fly Camera
local FlyCamBtn = Instance.new("TextButton")
FlyCamBtn.Size = UDim2.new(0.92, 0, 0, 40)
FlyCamBtn.Position = UDim2.new(0.04, 0, 0.24, 0)
FlyCamBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
FlyCamBtn.Text = "OFF - Fly Camera Only"
FlyCamBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
FlyCamBtn.TextSize = 14
FlyCamBtn.Font = Enum.Font.GothamBold
FlyCamBtn.Parent = MainFrame

local FlyCamCorner = Instance.new("UICorner")
FlyCamCorner.CornerRadius = UDim.new(0, 8)
FlyCamCorner.Parent = FlyCamBtn

-- 3. Nút Auto Di chuyển Trái/Phải liên tục
local StrafeBtn = Instance.new("TextButton")
StrafeBtn.Size = UDim2.new(0.92, 0, 0, 40)
StrafeBtn.Position = UDim2.new(0.04, 0, 0.35, 0)
StrafeBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
StrafeBtn.Text = "OFF - Auto Left/Right Move"
StrafeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
StrafeBtn.TextSize = 14
StrafeBtn.Font = Enum.Font.GothamBold
StrafeBtn.Parent = MainFrame

local StrafeCorner = Instance.new("UICorner")
StrafeCorner.CornerRadius = UDim.new(0, 8)
StrafeCorner.Parent = StrafeBtn

-- 4. Nút Anti-AFK (Chạy loadstring của bạn)
local AntiAfkBtn = Instance.new("TextButton")
AntiAfkBtn.Size = UDim2.new(0.92, 0, 0, 40)
AntiAfkBtn.Position = UDim2.new(0.04, 0, 0.46, 0)
AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
AntiAfkBtn.Text = "OFF - Anti AFK Script"
AntiAfkBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
AntiAfkBtn.TextSize = 14
AntiAfkBtn.Font = Enum.Font.GothamBold
AntiAfkBtn.Parent = MainFrame

local AntiAfkCorner = Instance.new("UICorner")
AntiAfkCorner.CornerRadius = UDim.new(0, 8)
AntiAfkCorner.Parent = AntiAfkBtn

-- 5. Khung Tốc độ (Speed Section)
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(0.92, 0, 0, 65)
SpeedFrame.Position = UDim2.new(0.04, 0, 0.58, 0)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
SpeedFrame.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.6, 0, 1, 0)
SpeedLabel.Position = UDim2.new(0.05, 0, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Tùy chỉnh tốc độ\nTốc độ tối đa của bạn: 35"
SpeedLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SpeedLabel.TextSize = 13
SpeedLabel.Font = Enum.Font.GothamMedium
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedFrame

-- Ô nhập số chỉnh tốc độ
local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(0, 50, 0, 36)
SpeedBox.Position = UDim2.new(0.58, 0, 0.25, 0)
SpeedBox.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
SpeedBox.Text = "35"
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.TextSize = 14
SpeedBox.Font = Enum.Font.GothamBold
SpeedBox.Parent = SpeedFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = SpeedBox

-- Nút ON/OFF tốc độ
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(0, 50, 0, 36)
SpeedToggle.Position = UDim2.new(0.76, 0, 0.25, 0)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
SpeedToggle.Text = "OFF"
SpeedToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedToggle.TextSize = 13
SpeedToggle.Font = Enum.Font.GothamBold
SpeedToggle.Parent = SpeedFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = SpeedToggle

---------------------------------------------------
-- XỬ LÝ LOGIC TÍNH NĂNG
---------------------------------------------------

-- 1. Logic khóa chặt tuyệt đối vị trí lún & chống tele game khác
_G.WeroLockSink = false
LockSinkBtn.MouseButton1Click:Connect(function()
    _G.WeroLockSink = not _G.WeroLockSink
    if _G.WeroLockSink then
        LockSinkBtn.Text = "ON - Lock Sink Position"
        LockSinkBtn.BackgroundColor3 = Color3.fromRGB(114, 9, 183)
        LockSinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.spawn(function()
            while _G.WeroLockSink do
                if not _G.WeroStrafe then
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local rootPart = char.HumanoidRootPart
                        rootPart.CFrame = CFrame.new(targetPosition)
                        rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        rootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end
                end
                task.wait(0.05) -- Tần suất cực nhanh để chống mọi nỗ lực tele của game
            end
        end)
    else
        LockSinkBtn.Text = "OFF - Lock Sink Position"
        LockSinkBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
        LockSinkBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- 2. Logic Fly Camera
_G.WeroFlyCam = false
local camera = workspace.CurrentCamera
local camConnection
local flySpeed = 50

FlyCamBtn.MouseButton1Click:Connect(function()
    _G.WeroFlyCam = not _G.WeroFlyCam
    if _G.WeroFlyCam then
        FlyCamBtn.Text = "ON - Fly Camera Only"
        FlyCamBtn.BackgroundColor3 = Color3.fromRGB(114, 9, 183)
        FlyCamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        camera.CameraType = Enum.CameraType.Scriptable
        local currentCamCFrame = camera.CFrame
        
        camConnection = RunService.RenderStepped:Connect(function(dt)
            local moveDir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
            
            currentCamCFrame = currentCamCFrame + (moveDir * flySpeed * dt)
            camera.CFrame = currentCamCFrame
        end)
    else
        FlyCamBtn.Text = "OFF - Fly Camera Only"
        FlyCamBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
        FlyCamBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        
        if camConnection then
            camConnection:Disconnect()
        end
        camera.CameraType = Enum.CameraType.Custom
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            camera.CameraSubject = player.Character.Humanoid
        end
    end
end)

-- 3. Logic Auto Di chuyển Trái/Phải liên tục quanh tọa độ
_G.WeroStrafe = false
StrafeBtn.MouseButton1Click:Connect(function()
    _G.WeroStrafe = not _G.WeroStrafe
    if _G.WeroStrafe then
        StrafeBtn.Text = "ON - Auto Left/Right Move"
        StrafeBtn.BackgroundColor3 = Color3.fromRGB(114, 9, 183)
        StrafeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.spawn(function()
            while _G.WeroStrafe do
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local rootPart = char.HumanoidRootPart
                    rootPart.CFrame = CFrame.new(targetPosition + Vector3.new(2, 0, 0))
                    rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    task.wait(0.4)
                    
                    if not _G.WeroStrafe then break end
                    
                    rootPart.CFrame = CFrame.new(targetPosition + Vector3.new(-2, 0, 0))
                    rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    task.wait(0.4)
                else
                    task.wait(0.4)
                end
            end
        end)
    else
        StrafeBtn.Text = "OFF - Auto Left/Right Move"
        StrafeBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
        StrafeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- 4. Logic Anti-AFK (Chạy loadstring của bạn)
_G.WeroAntiAfk = false
AntiAfkBtn.MouseButton1Click:Connect(function()
    _G.WeroAntiAfk = not _G.WeroAntiAfk
    if _G.WeroAntiAfk then
        AntiAfkBtn.Text = "ON - Anti AFK Script"
        AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(114, 9, 183)
        AntiAfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/uubinok1222/Anti-afk/refs/heads/main/By%20chatgpt"))()
        end)
    else
        AntiAfkBtn.Text = "OFF - Anti AFK Script"
        AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 70)
        AntiAfkBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- 5. Logic Tốc độ
_G.WeroSpeed = false
SpeedToggle.MouseButton1Click:Connect(function()
    _G.WeroSpeed = not _G.WeroSpeed
    if _G.WeroSpeed then
        SpeedToggle.Text = "ON"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(76, 201, 240)
        SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        task.spawn(function()
            while _G.WeroSpeed do
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    local speedVal = tonumber(SpeedBox.Text) or 35
                    char.Humanoid.WalkSpeed = speedVal
                end
                task.wait(0.2)
            end
        end)
    else
        SpeedToggle.Text = "OFF"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
        SpeedToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16
        end
    end
end)
