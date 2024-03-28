-- Create a RemoteEvent
local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Name = "DisableScriptEvent"
remoteEvent.Parent = game:GetService("ReplicatedStorage")

-- Function to disable the script in Workspace
local function disableScript()
    game.Workspace:FindFirstChild("Script").Disable = true
end

-- Fire the RemoteEvent after it's created
remoteEvent.OnServerEvent:Connect(function(player)
    disableScript()
end)
