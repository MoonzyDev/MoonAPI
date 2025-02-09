## お知らせ: こんにちは、更新が滞っていて申し訳ない！課題や私用で忙しくしています。MAPIのリリースは遅くて夏休みになる予定です。ご容赦ください！

Use MAPI:
```lua
local moonzy, MAPI = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/main.lua")))
```

Example Usage:
```lua
local moonzy, MAPI = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/main.lua")))

print(MAPI["GetPlayerMaxZoomDistance"](game:GetService("Players").LocalPlayer.Name)) --> will be fixed to just being Player[OBJECT] instead of Player.Name[STRING] soon
```

Rubberband Usage:
```lua
local moonzy, MAPI = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/main.lua")))

--> State (true/false), Timed (Rubberbands for x seconds, overrides State), Time (required field if Timed is set to true, how long it should rubberband for.)
MAPI(false, true, 5) --> Uses the "Timed" version as the second boolean is true.
MAPI(true) --> Uses the "State" version as the second boolean is not specified.
MAPI(true, false, 5) --> Still uses the "State" version as the second boolean is set to false.
```

SetPlayerSpeed Usage:
```lua
local moonzy, MAPI = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonzyDev/MoonAPI/refs/heads/main/main.lua")))

--> IsLocalPlayer (Always changes walkspeed on the client if set to true), Walkspeed (value determines what walkspeed will be changed to), Player (if "IsLocalPlayer" is set to false, uses the "Player" string instead.)
MAPI(true, 100) --> Uses the "IsLocalPlayer" version as first boolean is set to true, sets walkspeed to 100.
MAPI(false, 50, "UsernameHere") --> Uses the "Player Name" version instead as "IsLocalPlayer" is set to false. Sets the specified player's walkspeed to 50. 
```
