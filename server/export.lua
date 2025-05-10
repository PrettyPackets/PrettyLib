CreateThread(function()
    local resourceName = GetCurrentResourceName()
    local localVersion = GetResourceMetadata(resourceName, 'version', 0)

    local versionUrl = "https://raw.githubusercontent.com/PrettyPackets/PrettyLib/refs/heads/main/version.txt"

    PerformHttpRequest(versionUrl, function(statusCode, responseText, headers)
        if statusCode == 200 then
            local remoteVersion = responseText:match("[^\r\n]+") -- grab first line
            if remoteVersion == localVersion then
                print(("^1[%s]^0 is up to date! (v%s)"):format(resourceName, localVersion))
            else
                print("^6╔══════════════════════════════════════════════╗")
                print("^6║ ^4❗ PrettyLib Outdated ❗^0                     ^6║")
                print("^6║ ^1❗ Please ^6Update ^1Now ❗^0                      ^6║")
                print("^6║                                              ^6║")
                print(("^6║ ^0Current Version: ^1v%s^0                      ^6║"):format(localVersion))
                print(("^6║ ^0Latest Version:  ^2v%s^0                      ^6║"):format(remoteVersion))
                print("^6║                                              ^6║")
                print("^6║ ^4Download the latest version here:^0            ^6║")
                print("^6║ ^5https://github.com/PrettyPackets/PrettyLib^0   ^6║")
                print("^6╚══════════════════════════════════════════════╝")
            end
        else
            print(("^1[%s]^0 Failed to check version! HTTP Status: %s"):format(resourceName, statusCode))
        end
    end, "GET", "", {})
end)


functions = {
    Inventory = {},
    Items = {},
    -- Add more as needed
}


exports("Init", function()
    return functions
end)
