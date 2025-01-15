local Version = game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/Version")
local Build = game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/Build")
local HttpService = game:GetService("HttpService")
local MAPI_FUNCTIONS = {}

function init()
    local sT = os.time()
    local url = "https://api.github.com/repos/MoonzyDev/MoonAPI/contents/Functions";
    local response;

    local suc, err = pcall(function() response = game:HttpGet(url) end)

    if not suc then
        warn("[❌] [ＭＡＰＩ] Error fetching functions from the Moon API Repository.");
        warn("  ➡ Report in our Discord Server: discord.gg/example.");
        warn("  ➡ Error: " .. err);
        return
    end

    local files
    local decode, decodeErr = pcall(function()
        files = HttpService:JSONDecode(response)
    end)

    if not decode then
        warn("[❌] [ＭＡＰＩ] Error decoding the JSON response.");
        warn("  ➡ Report in our Discord Server: discord.gg/example.");
        warn("  ➡ Error: " .. err);
        return
    end

    local fA = 0
    for _, file in ipairs(files) do
        if file.type == "file" then
            fA += 1
        end
    end

    print(string.format('[⏹] Loading %s functions from "MAPI.Functions"', fA)) --> Print the amount of functions before loading any.

    for _, file in ipairs(files) do
        if file.type == "file" then
            local fileContent
            local contentSuc, contentErr = pcall(function()
                fileContent = game:HttpGet(file.download_url)
            end)

            if not contentSuc then
                warn("[❌] [ＭＡＰＩ] Error fetching file contents.")
                warn("  ➡ Report in our Discord Server: discord.gg/example.")
                warn("  ➡ Error: " .. err)
                continue
            end

            local func = loadstring(fileContent)
            if func then
                MAPI_FUNCTIONS[file.name:sub(1, -5)] = func() --> removes .lua extension from the file
                print(string.format("[✅] Loaded function %s", file.name:sub(1, -5))) --> success
            else
                warn(string.format("[❌] Failed to load function %s", file.name:sub(1, -5))) --> failure
            end
        end
    end

    local diff = os.time() - sT
    print(string.format("[⏹] Time Taken: %s", diff));
    print(string.format("[⏹] Version %s", Version));
    print(string.format("[⏹] Moon API | %s Build", Build));
    print("[⏹] Made by MoonzyDev (moonzy.dev)");
end

init()
return MAPI_FUNCTIONS
