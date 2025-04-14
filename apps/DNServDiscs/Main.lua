scriptTitle = "Update DiscNum and DiscsInSet"
scriptAuthor = "DNServ"
scriptVersion = 1
scriptDescription = "Updates the DiscNum and DiscsInSet fields in the ContentItems table."
scriptPermissions = { "sql" }

-- Main entry point to script
function main()
    -- Define the exceptions with corrected TitleId values
    local discsInSet2 = {
        [1112737772] = true, [1112737781] = true, [1161889998] = true, [1161890015] = true,
        [1161890128] = true, [1161890205] = true, [1161890234] = true, [1263405065] = true,
        [1297287135] = true, [1297287162] = true, [1297287629] = true, [1297287642] = true,
        [1313671179] = true, [1397819354] = true, [1397819355] = true, [1397819357] = true,
        [1397819364] = true, [1397819386] = true, [1414793323] = true, [1414793324] = true,
        [1431505070] = true, [1431505078] = true, [1431505090] = true, [1464993828] = true,
        [1161890272] = true, [1431505099] = true
    }

    local discsInSet3 = {
        [1112737772] = true, [1112737781] = true, [1297287135] = true, [1297287162] = true,
        [1397819357] = true, [1397819364] = true, [1414793324] = true
    }

    local discsInSet4 = {
        [1414793324] = true, [1297287162] = true
    }

    local discNum2 = {
        ["75f57396"] = true, ["656b5a2f"] = true, ["61c746d7"] = true, ["5b5505fa"] = true,
        ["2b4e0dea"] = true, ["1d8cbd9d"] = true, ["69a46155"] = true, ["403243ec"] = true,
        ["30402a21"] = true, ["40e764b6"] = true, ["7df010ba"] = true, ["7205c131"] = true,
        ["0c0e80b5"] = true, ["027d8aaf"] = true, ["1fe2bb66"] = true, ["5933d487"] = true,
        ["7569e6ab"] = true, ["1daef270"] = true, ["7f42ed9b"] = true, ["5a8954e9"] = true,
        ["5db3bbbc"] = true, ["58af47d6"] = true, ["7c4137be"] = true, ["5e86f600"] = true,
        ["313953ed"] = true, ["406b586f"] = true
    }

    local discNum3 = {
        ["05c08ac4"] = true, ["0fe8e2f9"] = true, ["7ad3c1c0"] = true, ["6dd59d08"] = true,
        ["513e3495"] = true, ["13bb8e0e"] = true, ["2b9875e1"] = true
    }

    local discNum4 = {
        ["56126c0e"] = true, ["1888be4e"] = true
    }

    -- Retrieve all records from ContentItems table
    local query = "SELECT Id, TitleId, Executable, DiscNum, DiscsInSet FROM ContentItems"
    local records = Sql.ExecuteFetchRows(query)

    -- Update the records based on conditions
    for _, record in pairs(records) do
        local updateQuery = "UPDATE ContentItems SET "
        local updates = {}

        -- Update DiscNum if it's not 0
        if record.DiscNum ~= 0 then
            if discNum2[string.lower(record.Executable)] then
                table.insert(updates, "DiscNum = 2")
            elseif discNum3[string.lower(record.Executable)] then
                table.insert(updates, "DiscNum = 3")
            elseif discNum4[string.lower(record.Executable)] then
                table.insert(updates, "DiscNum = 4")
            else
                table.insert(updates, "DiscNum = 1")
            end
        end

        -- Update DiscsInSet if it's not 0
        if record.DiscsInSet ~= 0 then
            if discsInSet4[record.TitleId] then
                table.insert(updates, "DiscsInSet = 4")
            elseif discsInSet3[record.TitleId] then
                table.insert(updates, "DiscsInSet = 3")
            elseif discsInSet2[record.TitleId] then
                table.insert(updates, "DiscsInSet = 2")
            else
                table.insert(updates, "DiscsInSet = 1")
            end
        end

        -- Execute the update query if there are updates to make
        if #updates > 0 then
            updateQuery = updateQuery .. table.concat(updates, ", ") .. " WHERE Id = " .. record.Id
            local success = Sql.Execute(updateQuery)
            if not success then
                Script.ShowMessageBox(scriptTitle, "Failed to update record Id " .. record.Id, "OK")
            end
        end
    end

    -- Set script status to completed
    Script.SetStatus("Update completed!")
    Script.SetProgress(100)
    Script.ShowMessageBox(scriptTitle, "Database update completed successfully!", "OK")
end