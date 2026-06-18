-- 👟 ระบบเตะคนแบบไม่ต้องเลือกชื่อ (เตะคนที่ใกล้ที่สุดในรัศมี 15 Studs)
KickPlayerBtn.MouseButton1Click:Connect(function()
    local closestPlayer = nil
    local shortestDistance = 15 -- รัศมี 15 Studs
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (p.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = p
                shortestDistance = distance
            end
        end
    end
    
    if closestPlayer then
        KickPlayerBtn.Text = "👟 กำลังเตะ: " .. closestPlayer.Name
        closestPlayer:Kick("โดนระบบ SudlorHub ไล่ออกจ้า!")
        task.wait(1)
        KickPlayerBtn.Text = "👟 เตะคนที่ใกล้ที่สุด (Auto)"
    else
        KickPlayerBtn.Text = "❌ ไม่พบใครในรัศมี!"
        task.wait(1.2)
        KickPlayerBtn.Text = "👟 เตะคนที่ใกล้ที่สุด (Auto)"
    end
end)
