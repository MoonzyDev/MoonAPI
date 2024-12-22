return function()
    if getgenv().MAPI.SNAPSHOT == nil or getgenv().MAPI.SNAPSHOT == "Public" then
        return game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/Build");
    elseif getgenv().MAPI.SNAPSHOT == "Nightly" then
        return game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/NightlyBuild");
    else warn("[❌] [ＭＡＰＩ] Unknown version has been given in MAPI.SNAPSHOT (check the documentation for help!)") end
end
