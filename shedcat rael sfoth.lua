-- Print the ASCII art and credits
print([[ 
88                                    88888888ba                                    
88                                    88      "8b                 ,d                
88                                    88      ,8P                 88                
88          88       88  8b,     ,d8  88aaaaaa8P'  8b       d8  MM88MMM  ,adPPYba,  
88          88       88   `Y8, ,8P'   88""""""8b,  `8b     d8'    88    a8P_____88  
88          88       88     )888(     88      `8b   `8b   d8'     88    8PP"""""""  
88          "8a,   ,a88   ,d8" "8b,   88      a8P    `8b,d8'      88,   "8b,   ,aa  
88888888888  `"YbbdP'Y8  8P'     `Y8  88888888P"       Y88'       "Y888  `"Ybbd8"'  
                                                       d8'                          
                                                      d8'                           
]])

print("MADE BY LUXBYTE")
print("Discord: luxbyte")

-- Player setup
local player = game.Players.LocalPlayer

-- Function to get character safely
local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

-- Function to fire touch interest on valid tools
local function fireTouch()
    local character = getCharacter()
    local root = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Left Leg") -- R6 & R15 support
    if not root then
        print("No valid touch part found!")
        return
    end

    local regenFolder = workspace:FindFirstChild("Regen") or workspace

    for _, part in ipairs(regenFolder:GetDescendants()) do
        if part:IsA("Part") and part.Name == "Handle" and part.Parent:IsA("Tool") then
            firetouchinterest(root, part, 0)
            task.wait(0.05) -- Prevents instant spam
            firetouchinterest(root, part, 1)
            print("Touched Tool:", part.Parent.Name)
        end
    end
end

-- Credits function
local function sheddacat()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
        "Made By luxbyte | Blue App: luxbyte", "All"
    )
end

-- Chat command system
local prefix = "."

local function onChatted(message)
    if message:sub(1, #prefix) == prefix then
        local command = message:sub(#prefix + 1):lower()
        if command == "shedcat" then
            fireTouch()
        elseif command == "sheddacat" then
            sheddacat()
        end
    end
end

-- Connect chat event
player.Chatted:Connect(onChatted)

-- Notify player of commands
print("Grab all Command: .shedcat")
print("Credits Command: .sheddacat")
