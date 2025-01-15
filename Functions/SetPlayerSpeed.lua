return function(IsLocalPlayer: boolean, Walkspeed: number, Player: string?)
    if Walkspeed == nil then
        warn('[❌] MAPI requires Walkspeed to be specified in SetPlayerSpeed["Walkspeed"]. Expected </number>, got nil');
        return false, '[❌] MAPI could not find a valid </humanoid> object class in </player> "%s", is the function added correct?';
    end

    local cPlayer;
    if IsLocalPlayer then
        cPlayer = game:GetService("Players")["LocalPlayer"];

        if not cPlayer.CharacterAdded then cPlayer.CharacterAdded:Wait() end
        local character = cPlayer.Character
        local Humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 3);

        if not Humanoid then
            warn(string.format("[❌] MAPI could not find a valid Humanoid in the specified player (%s), did you enter a correct name?", cPlayer));
            return false, string.format('[❌] MAPI could not find a valid </humanoid> object class in </player> "%s", is the function added correct? ', cPlayer);
        end

        Humanoid.WalkSpeed = Walkspeed
        return true, "[✅] MAPI has successfully set the Walkspeed for the player to the walkspeed given by the caller.";
    elseif not IsLocalPlayer then
        if Player == nil then
            warn('[❌] MAPI requires SetPlayerSpeed["Player"] to be a valid string value (expected string, got nil) (check the documentation for help!)');
            return false, '[❌] MAPI requires SetPlayerSpeed[3] ("Player") to be a </string> value, expected </string> on SetPlayerSpeed[3]; got </eof>.';
        end
        cPlayer = game:GetService("Players")[Player] or nil;

        if Player == nil then
            warn(string.format('[❌] MAPI could not find a player named %s specified in the SetPlayerSpeed["Player"] value.', cPlayer))
            return false, string.format('[❌] MAPI could not find a player named %s in the "Players" Service. Expected SetPlayerSpeed[3] "Player" to be a valid username, got </eof>.', cPlayer)
        end
        if not cPlayer.CharacterAdded then cPlayer.CharacterAdded:Wait() end
        local character = cPlayer.Character
        local Humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 3);

        if not Humanoid then
            warn(string.format("[❌] MAPI could not find a valid Humanoid in the specified player (%s), did you enter a correct name?", cPlayer));
            return false, string.format('[❌] MAPI could not find a valid </humanoid> object class in </player> "%s", is the function added correct? ', cPlayer);
        end

        Humanoid.WalkSpeed = Walkspeed
        return true, "[✅] MAPI has successfully set the Walkspeed for the player to the walkspeed given by the caller.";
    else
        warn('[❌] MAPI requires SetPlayerSpeed["IsLocalPlayer"] to be true or false, got nil. (check the documentation for help!)');
        return false, '[❌] MAPI requires SetPlayerSpeed["IsLocalPlayer"] to be a </boolean> value, got </eof>.'
    end
end
