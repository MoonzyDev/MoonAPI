--<!strict>
--// MAPI.Modules << DebugHandler @ Build 1002 \\--

local HANDLE_MODULE = {} --> Array

HANDLE_MODULE.InputInfo = function(Messages: {})
    if #Messages == 0 then
        warn(string.format('[❌] %s - MAPI : HANDLE "InputInfo" expects one or more message arguments. Recieved "0" arguments.', os.date("%X", os.time())));
        warn(string.format("[⚠️] %s - MAPI : The error above is most likely a MAPI-based error unless the script you are using is calling the DebugHandler file directly. Please report it in our Discord server or in GitHub Issues.", os.date("%X", os.time())));
    end

    local Thread_Index = -1;
    for _,v in pairs(Messages) do
        local Icon;
        local Format;
        if v.Type == "Success" or v.Type == 2 then
            Icon = "✅";
            Format = 0;
        elseif v.Type == "Failure" or v.Type == "Error" or v.Type == "Fail" or v.Type == 0 then
            Icon = "❌";
            Format = 1;
        elseif v.Type == "Warn" or v.Type == "Warning" or v.Type == 1 then
            Icon = "⚠️";
            Format = 1;
        elseif v.Type == "Info" or v.Type == "Information" or v.Type == 4 then
            Icon = "⏹"
            Format = 0;
        end

        Thread_Index += 1
        if Format == 0 then
            print(string.format("[%s] %s - MAPI : %s (Thread %s)", Icon, os.date("%X", os.time()), v.Message, Thread_Index))
        elseif Format == 1 then
            warn(string.format("[%s] %s - MAPI : %s (Thread %s)", Icon, os.date("%X", os.time()), v.Message, Thread_Index))
        end
    end

    return nil
end

HANDLE_MODULE.InputRConsole = function(Messages: {})
    if not rconsoleinfo or rconsoleinfo == nil then
        warn(string.format('[❌] %s - MAPI : HANDLE "InputRConsole" requires rconsoleinfo(...) support but your executor does not have rconsoleinfo(...) support!', os.date("%X", os.time())));
        return nil
    end

    if #Messages == 0 then
        warn(string.format('[❌] %s - MAPI : HANDLE "InputInfo" expects one or more message arguments. Recieved "0" arguments.', os.date("%X", os.time())));
        warn(string.format("[⚠️] %s - MAPI : The error above is most likely a MAPI-based error unless the script you are using is calling the DebugHandler file directly. Please report it in our Discord server or in GitHub Issues.", os.date("%X", os.time())));
    end

    local Thread_Index = -1;
    for _,v in pairs(Messages) do
        local Icon;
        if v.Type == "Success" or v.Type == 2 then
            Icon = "✅";
        elseif v.Type == "Failure" or v.Type == "Error" or v.Type == "Fail" or v.Type == 0 then
            Icon = "❌";
        elseif v.Type == "Warn" or v.Type == "Warning" or v.Type == 1 then
            Icon = "⚠️";
        elseif v.Type == "Info" or v.Type == "Information" or v.Type == 4 then
            Icon = "⏹"
        end

        Thread_Index += 1
        rconsoleinfo(string.format("[%s] %s - MAPI : %s (Thread %s)", Icon, os.date("%X", os.time()), v.Message, Thread_Index))
    end

    return nil
end

return HANDLE_MODULE
