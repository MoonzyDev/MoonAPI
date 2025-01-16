return function(FOV: number)
    local Camera = game:GetService("Workspace")["CurrentCamera"] or 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL'

    if Camera == 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL' then 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if not v:IsA("Camera") then continue end
            Camera = v;
        end
    end

    if Camera == 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL' then
        warn("[❌] MAPI could not find a valid Camera instance targeted to the local player. Expected </camera>, got </eof>");
        return {false, "[❌] MAPI could not find a valid Camera instance targeted to the local player. Expected </camera>, got </eof>"}
    end

    local cFOV = FOV or tonumber(FOV) or "MAPI-CONVERSION-FAIL"

    if cFOV == "MAPI-CONVERSION-FAIL" then
        warn(string.format('[❌] MAPI has failed to update the clients FOV due to the SetPlayerFOV[1] ("FOV") being a non-number character. Expected </number> or </int>, got </%s>', typeof(FOV)))
        return {false, string.format('[❌] MAPI has failed to update the clients FOV due to the SetPlayerFOV[1] ("FOV") being a non-number character. Expected </number> or </int>, got </%s>', typeof(FOV))}
    end

    local success, failure = pcall(function(...)
        local MAPI_SUCCESS = cFOV - 1
    end)

    if failure then
        warn(string.format('[❌] MAPI has failed to update the clients FOV due to the SetPlayerFOV[1] ("FOV") being a non-number character. Expected </number> or </int>, got </%s>', typeof(FOV)))
        return {false, string.format('[❌] MAPI has failed to update the clients FOV due to the SetPlayerFOV[1] ("FOV") being a non-number character. Expected </number> or </int>, got </%s>', typeof(FOV))}
    end

    Camera.FieldOfView = FOV or tonumber(FOV)

    return {true, "[✅] MAPI has successfully gotten the client's FOV."}
end
