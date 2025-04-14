scriptTitle = "DNServ TU Restore"
scriptAuthor = "DNServ"
scriptVersion = 1
scriptDescription = "Re-add's all Cache TU before launching a game."
scriptPermissions = { "filesystem" }

-- Main entry point to script
function main()
    -- Define source and destination directories without trailing backslashes
    local srcDir = "Hdd1:\\CacheBak";
    local dstDir = "Hdd1:\\Cache";
    
    -- Check if source directory exists
    if not FileSystem.FileExists(srcDir) then
        if not FileSystem.FileExists("Hdd1:/CacheFull") then
            Script.ShowMessageBox(scriptTitle, "Source directory does not exist: " .. srcDir, "OK");
            return;
        else
            srcDir = "Hdd1:/CacheBak";
            dstDir = "Hdd1:/Cache";
        end
    end

    -- Create destination directory if it doesn't exist
    if not FileSystem.FileExists(dstDir) then
        FileSystem.CreateDirectory(dstDir);
    end

    -- Copy directory from source to destination
    local success = FileSystem.CopyDirectory(srcDir, dstDir, true);
    if not success then
        Script.ShowMessageBox(scriptTitle, "Failed to restore TU from " .. srcDir .. " to " .. dstDir, "OK");
        return;
    end

    -- Set script status to completed
    Script.SetStatus("Copy completed!");
    Script.SetProgress(100);

    -- Show completion message
    Script.ShowMessageBox(scriptTitle, "All TU have been restored from " .. srcDir .. " to " .. dstDir, "OK");
end