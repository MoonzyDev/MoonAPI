function RubberbandPlayer(Time:number)
    local Player = game:GetService("Players")["LocalPlayer"];
    if not Player.CharacterAdded then Player.CharacterAdded:Wait() end
    local Character = Player.Character
    local Root = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart", 2) or nil;

    if Root == nil then
        warn(string.format("[❌] MAPI could not find HumanoidRootPart inside of %s [Character]. expected </BasePart>, got </eof>", Character.Name));
    end

    local Rubberband = Instance.new("BodyVelocity");
    Rubberband.Name = "Rubberband"
    Rubberband.Velocity = Vector3.new(2^128, 2^64, 2^128);
    Rubberband.MaxForce = Vector3.new(1e100, 1e36^2, 1e100);
    Rubberband.Parent = Root

    task.delay(Time,function()
        Rubberband:Destroy();
    end)
end

return function(State: boolean, Timed: boolean, Time: number)
    if Timed then
        if not Time or typeof(Time) ~= "number" then
            warn(string.format('[❌] MAPI could not find a valid Time number in RubberbandPlayer[3] ("Time") or RubberbandPlayer[3] ("Time") is not a </number> value. Check the documentation for help.'));
            return false, '[❌] MAPI could not find a valid Time number in RubberbandPlayer[3] ("Time") or RubberbandPlayer[3] ("Time") is not a </number> value. Check the documentation for help.'
        end
        RubberbandPlayer(Time);
        return true, string.format('[✅] MAPI successfully rubberbanded the client for %s seconds.', tostring(Time))
    end

    if State then
        RubberbandPlayer(2^64)
        return true, '[✅] MAPI successfully rubberbanded the client until the caller script stops it.'
    elseif not State then
        local Player = game:GetService("Players")["LocalPlayer"];
        if not Player.CharacterAdded then Player.CharacterAdded:Wait() end
        local Character = Player.Character
        local Root = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart", 2) or nil;

        for _,v in pairs(Root:GetChildren()) do
            if v.Name == "Rubberband" and v:IsA("BodyVelocity") then v:Destroy() end
        end
        return true, '[✅] MAPI successfully stopped the rubberbanding of the client.'
    end

    return false, '[❌] MAPI has ran into an unexpected error while running module "RubberbandPlayer", this is probably our mistake so please report it in our Discord'
end
