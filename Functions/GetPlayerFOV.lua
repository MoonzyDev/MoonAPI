--> Usage: MAPI["GetPlayerFOV]()
--> e.g: print(MAPI["GetPlayerFOV"]()[1])
return function()
    local Camera = game:GetService("Workspace")["CurrentCamera"] or 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL'

    if Camera == 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL' then 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if not v:IsA("Camera") then continue end
            Camera = v;
        end
    end

    if Camera == 'MAPI_GETCAMERAFOV_CAMERAFINDMETHOD_ONEFAIL' then
        warn("[❌] MAPI could not find a valid Camera instance targeted to the local player. Expected </camera>, got </eof>");
        return {nil, "[❌] MAPI could not find a valid Camera instance targeted to the local player. Expected </camera>, got </eof>"}
    end

    return {Camera.FieldOfView, "[✅] MAPI has successfully gotten the client's FOV."}
end
