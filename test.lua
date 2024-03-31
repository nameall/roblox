local function createAccessory(player)
    -- Create a new accessory
    local accessory = Instance.new("Accessory")
    
    -- Create a part to serve as the handle
    local handle = Instance.new("Part")
    handle.Size = Vector3.new(1, 2, 1) -- Adjust size as needed
    handle.Color = Color3.new(1, 1, 1) -- Set color to white for visibility
    handle.Anchored = false
    handle.CanCollide = false
    handle.Parent = accessory
    
    -- Attach the accessory to the player's character
    accessory.Parent = player.Character
    
    -- Adjust the accessory position
    accessory.AttachmentForward = Vector3.new(0, 0, 1)
    accessory.AttachmentPos = Vector3.new(0, 1, 0)
    accessory.AttachmentUp = Vector3.new(0, 1, 0)
end

-- Function to handle when a player spawns
local function onPlayerSpawn(player)
    player.CharacterAdded:Connect(function(character)
        createAccessory(player)
    end)
end

-- Connect the onPlayerSpawn function to the PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerSpawn)

-- Loop to ensure the script runs forever
while true do
    wait(1)
end

