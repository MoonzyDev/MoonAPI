local Version = string.format("%s", game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/Version"));
local Build = string.format("%s", game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/Dependencies/Build"));
local MAPI_FUNCTIONS = {}

function MAPI_FUNCTIONS.test()
	print("Hello!")
end

MAPI_FUNCTIONS.hello = "Hello, world!"

return MAPI_FUNCTIONS
