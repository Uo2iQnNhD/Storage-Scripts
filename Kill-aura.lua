local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local CombatEvent = ReplicatedStorage:WaitForChild("Combat")

-- Спам в консоль при запуске скрипта (заполняет всю панель)
for i = 1, 500 do
    print("script by waityouSkidLOL")
end

-- Твои новые сбалансированные настройки
local MAX_DISTANCE = 14.4 -- Радиус 14.4
local BASE_CD = 0.29
local ATTACK_SPEED = BASE_CD / 1.30 -- Скорость 1.30x (около 0.22 сек)

_G.HandsawAura = true 

task.spawn(function()
    while _G.HandsawAura do
        task.wait(ATTACK_SPEED)
        
        local MyChar = LocalPlayer.Character
        local MySaw = MyChar and MyChar:FindFirstChild("Handsaw")
        local MyHRP = MyChar and MyChar:FindFirstChild("HumanoidRootPart")
        
        -- Скрипт работает только когда Пила (Handsaw) в руках
        if MyChar and MySaw and MyHRP then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local TargetChar = player.Character
                    
                    -- Строго по логу: бьем в Torso
                    local TargetTorso = TargetChar:FindFirstChild("Torso") or TargetChar:FindFirstChild("HumanoidRootPart")
                    local TargetHumanoid = TargetChar:FindFirstChildOfClass("Humanoid")
                    
                    if TargetTorso and TargetHumanoid and TargetHumanoid.Health > 0 then
                        local distance = (MyHRP.Position - TargetTorso.Position).Magnitude
                        
                        -- Проверяем радиус 14.4
                        if distance <= MAX_DISTANCE then
                            pcall(function()
                                -- Оставляем мягкий обход позиции для надежной регистрации урона
                                local originalCFrame = MyHRP.CFrame
                                
                                MyHRP.CFrame = CFrame.new(TargetTorso.Position - (TargetTorso.CFrame.LookVector * 1.8))
                                
                                local args = {
                                    MyChar,
                                    TargetTorso,
                                    MySaw
                                }
                                
                                -- Наносим урон пилой
                                CombatEvent:FireServer(unpack(args))
                                
                                -- Возврат на место
                                MyHRP.CFrame = originalCFrame
                            end)
                            
                            break -- Бьем одного за раз, чтобы не перегружать античит пакетами
                        end
                    end
                end
            end
        end
    end
end)
