scriptTitle = "Clear Aurora TitleUpdates Tables and Directory"
scriptAuthor = "DNServ"
scriptVersion = 1
scriptDescription = "Removes all entries from the Aurora TitleUpdates table and deletes the Aurora TitleUpdates directory."
scriptPermissions = { "sql", "filesystem" }

-- Main entry point to script
function main()
    -- SQL query to delete all entries from the TitleUpdates table
    local deleteQuery = "DELETE FROM TitleUpdates"

    -- Execute the delete query
    local success = Sql.Execute(deleteQuery)

    -- Check if the delete operation was successful
    if success then
        Script.ShowMessageBox(scriptTitle, "All entries in the TitleUpdates table have been successfully deleted.", "OK")
    else
        Script.ShowMessageBox(scriptTitle, "Failed to delete entries in the TitleUpdates table.", "OK")
    end

    -- Directory to delete
    local directoryPath = "game:\\Data\\TitleUpdates"

    -- Check if the directory exists and delete it
    if FileSystem.FileExists(directoryPath) then
        local deleteDirSuccess = FileSystem.DeleteDirectory(directoryPath)
        if deleteDirSuccess then
            Script.ShowMessageBox(scriptTitle, "The directory " .. directoryPath .. " has been successfully deleted.", "OK")
        else
            Script.ShowMessageBox(scriptTitle, "Failed to delete the directory " .. directoryPath, "OK")
        end
    else
        Script.ShowMessageBox(scriptTitle, "The directory " .. directoryPath .. " does not exist.", "OK")
    end

    -- Set script status to completed
    Script.SetStatus("Clear operation completed!")
    Script.SetProgress(100)
end