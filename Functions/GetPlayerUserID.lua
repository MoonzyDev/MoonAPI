--> Usage: MAPI["GetPlayerUserID"]("UsernameHere")[1]
--> Method 2: MAPI["GetPlayerUserID"](game:GetService("Players").UsernameHere)[1]
--> e.g: print(MAPI["GetPlayerUserID"]("LumpJumpTruckLuck")[1]
return function(Player)
    local cPlayer;
    if typeof(Player) == "Instance" then
        cPlayer = Player

        if typeof(Player.UserId) ~= "number" or Player["UserId"] == nil then
            warn("nah")
        end

        return {cPlayer.UserId, '[✅] MAPI has successfully returned the specified data to the caller.'}
    elseif typeof(Player) == "string" then
        cPlayer = game:GetService("Players")[Player] or 'MAPI-FINDING-ERROR'

        if cPlayer == 'MAPI-FINDING-ERROR' then
            warn(string.format('[❌] MAPI could not find a player named "%s" inside of the "Players" service. Did you enter a correct username?', Player))
            return {false, string.format('[❌] MAPI could not find a player named "%s" inside of the "Players" service. Did you enter a correct username?', Player)}
        end

        return {cPlayer.UserId, '[✅] MAPI has successfully returned the specified data to the caller.'}
    else
        warn(string.format('[❌] Player specified inside of GetPlayerUserId[1] ("Player") is required to be a </player> or </string> (player name), instead we got </%s>.', typeof(Player)));
        return {false, string.format('[❌] Player specified inside of GetPlayerUserId[1] ("Player") is required to be a </player> or </string> (player name), instead we got </%s>.', typeof(Player))}
    end
end
