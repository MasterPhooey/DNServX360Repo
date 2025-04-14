-- main.lua
-- Require additional lua scripts
require("Enums")

-- Set some global settings that we can access later
ScriptVersion = 1.0

-- Define and run the TU Restore script
local function runTURestoreScript()
    print("Starting TU Restore script...")

    -- Define source and destination directories without trailing backslashes
    local srcDir = "Hdd1:\\Cache"
    local dstDir = "Hdd1:\\CacheBak"
    
    -- Check if source directory exists
    if not FileSystem.FileExists(srcDir) then
        if not FileSystem.FileExists("Hdd1:/CacheBak") then
            -- Log instead of showing a message box
            print("Source directory does not exist: " .. srcDir)
            return
        else
            srcDir = "Hdd1:/Cache"
            dstDir = "Hdd1:/CacheBak"
        end
    end

    -- Create destination directory if it doesn't exist
    if not FileSystem.FileExists(dstDir) then
        FileSystem.CreateDirectory(dstDir)
    end

    -- Copy directory from source to destination
    local success = FileSystem.CopyDirectory(srcDir, dstDir, true)
    if not success then
        -- Log instead of showing a message box
        print("Failed to restore TU from " .. srcDir .. " to " .. dstDir)
        return
    end

    -- Set script status to completed
    Script.SetStatus("Copy completed!")
    Script.SetProgress(100)

    -- Log completion message instead of showing a message box
    print("All TU have been restored from " .. srcDir .. " to " .. dstDir)
end

-- Debugging: Print a message before running the TU Restore script
print("About to run TU Restore script...")

-- Run the TU Restore script
runTURestoreScript()

-- Debugging: Print a message after running the TU Restore script
print("TU Restore script has been run")

-- Let us know we are all done (Not needed..)
print(_VERSION)
print("Main.lua done!")
