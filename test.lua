-- Load the DataStore service
local DataStoreService = game:GetService("DataStoreService")

-- Define the name of your DataStore
local DATASTORE_NAME = "ScriptDataStore"

-- Define the key for storing the script content
local SCRIPT_KEY = "ScriptContent"

-- Load the current script content from the DataStore
local dataStore = DataStoreService:GetDataStore(DATASTORE_NAME)
local oldScript = dataStore:GetAsync(SCRIPT_KEY)

-- Fetch the latest script content from GitHub
local latestScriptURL = "https://raw.githubusercontent.com/nameall/roblox/main/new.lua"
local response = syn.request({
    Url = latestScriptURL,
    Method = "GET"
})

-- Check if the request was successful
if response.Success then
    local newScript = response.Body

    -- Compare the current script with the latest one
    if oldScript ~= newScript then
        -- Update the script content in the DataStore
        dataStore:SetAsync(SCRIPT_KEY, newScript)

        -- Execute the new script using loadstring
        local success, errorMessage = pcall(loadstring(newScript))
        if not success then
            warn("Failed to execute the new script:", errorMessage)
        end
    else
        print("The script content is up to date. No action needed.")
    end
else
    warn("Failed to fetch the latest script from GitHub.")
end
