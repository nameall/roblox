print("hey sisters")
-- Find the Workspace.Script object
local scriptObject = game.Workspace:FindFirstChild("Script")

-- Check if the object exists
if scriptObject then
    -- Disable the Script
    scriptObject.Disabled = true
    print("Workspace.Script has been disabled.")
else
    print("Workspace.Script not found.")
end
