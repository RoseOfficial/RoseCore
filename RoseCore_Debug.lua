Rose.Debug = {
    echo = false,
    Console = {
        history = {},
        includeTimestamp = true,
        includeModule = true,
        autoScroll = true,
    },
    options = {
        open = true,
        visible = true
    },
}
local self = Rose.Debug

self.Colours = {
    info = {0.0, 0.8, 0.8, 1.0},
    warning = {0.8, 0.8, 0.0, 1.0},
    error = {0.8, 0.0, 0.0, 1.0},
    success = {0.0, 0.8, 0.0, 1.0},
    default = {0.8, 0.8, 0.8, 1.0},
}

function self.time(clean)
    if not (type(clean) == "boolean") then
        clean = true
    end
    local ioHandle = io.popen("echo %time%")
    local time = ioHandle:read("*a")
    ioHandle:close()
    local cleanTable = {
        ["\n"] = "",
        [":"] = "",
        ["."] = "",
        [" "] = "",
    }
    if (clean) then
        time = time.gsub(time, "[%p\n.(%s+)]", cleanTable)
    end
    return time
end

function self.Console.clear()
    self.Console.history = {}
end

function self.Console.add(item)
    local message = item.message
    if(self.Console.includeTimestamp) then
        message = "[" .. item.time .. "]" .. message
    end
    if(self.Console.includeModule) then
        if(item.module ~= nil) then
            message = "[" .. item.module .. "]" .. message
        end
    end
    if(self.echo) then
        d('[Rose.Debug:'.. item.type .. '] ' .. message)
    end
    table.insert(self.Console.history, item)
end

function self.Console.info(message, module)
    local item = {type = 'info', message = message, time = self.time()}
    if(module ~= nil) then
        item.module = module
    end
    self.Console.add(item)
end

function self.Console.warning(message, module)
    local item = {type = 'warning', message = message, time = self.time()}
    if(module ~= nil) then
        item.module = module
    end
    self.Console.add(item)
end

function self.Console.error(message, module)
    local item = {type = 'error', message = message, time = self.time()}
    if(module ~= nil) then
        item.module = module
    end
    self.Console.add(item)
end

function self.Console.success(message, module)
    local item = {type = 'success', message = message, time = self.time()}
    if(module ~= nil) then
        item.module = module
    end
    self.Console.add(item)
end

local function splitMessages(messageTable, separator)
    if(separator == nil) then
        separator = "\n"
    end
    local messages = ""
    for i = 1, #messageTable do
        local message = messageTable[i]
        if(not type(message) == "table") then
            -- splitMessages only supports tables of strings
            messages = messages .. separator .. message
        end
    end
    return messages
end

function self.Console.log(message, module)
    if(type(message) == "table") then
        message = splitMessages(message)
    end
    if(module == nil) then
        module = "Rose"
    end

    self.Console.info(message, module)
end

function self.Console.parse(messageTable)
    local argCount = messageTable.n
    if(argCount == nil) then
        argCount = #messageTable
        self.Console.error("Rose.Debug.Console.parse: messageTable.n is nil, seems like parse is being misused.\nThis is made for catching the `arg` magic arugment off of a function's '...' field")
    end
    if(argCount == 1) then
        if(type(messageTable[1]) == "table") then
            if(messageTable[1].n ~= nil and argCount > 0) then
                return splitMessages(messageTable[1])
            end
        end
        if(type(messageTable[1]) == "string") then
            return messageTable[1]
        end
    else
        error("Rose.Debug.Console.parse currently only accepts one argument.")
    end
end

function self.Console.Tests()
    if(GUI:BeginMenu("Tests")) then
        if(GUI:MenuItem("All Log Types")) then
            self.Console.info("Info Log")
            self.Console.warning("Warning Log")
            self.Console.error("Error Log")
            self.Console.success("Success Log")
        end
        if(GUI:BeginMenu("Single Log Types")) then
            if(GUI:MenuItem("Test Info")) then
                self.Console.info("Info Log")
            end
            if(GUI:MenuItem("Test Warning")) then
                self.Console.warning("Warning Log")
            end
            if(GUI:MenuItem("Test Error")) then
                self.Console.error("Error Log")
            end
            if(GUI:MenuItem("Test Success")) then
                self.Console.success("Success Log")
            end
            GUI:EndMenu()
        end
        GUI:EndMenu()
    end
    if(GUI:BeginMenu("Debug Options")) then
        if(GUI:MenuItem("Echo to Minion Console", "", self.echo)) then
            self.echo = not self.echo
        end
        if(GUI:MenuItem("Auto-scroll Console", "", self.Console.autoScroll)) then
            self.Console.autoScroll = not self.Console.autoScroll
        end
        if(GUI:MenuItem("Include Timestamp", "", self.Console.includeTimestamp)) then
            self.Console.includeTimestamp = not self.Console.includeTimestamp
        end
        if(GUI:MenuItem("Include Module", "", self.Console.includeModule)) then
            self.Console.includeModule = not self.Console.includeModule
        end
        if(GUI:MenuItem("Open IMGUI Example Window")) then
            ml_gui.showtestwindow = true
        end
        GUI:EndMenu()
    end
    if(GUI:MenuItem("Clear Log")) then
        self.Console.clear()
    end
end

function self.Console.Elements()
    GUI:BeginChild("##RoseDebug_Console", 0, 0, false)
        GUI:BeginChild("##RoseDebug_Console_History", 0, 0, true)
        for _, v in pairs(self.Console.history) do
            local function message()
                local msg = v.message
                if(self.Console.includeTimestamp) then
                    msg = '[' .. v.time .. '] ' .. msg

                end
                if(self.Console.includeModule) then
                    if(v.module ~= nil) then
                        msg = '[' .. v.module .. '] ' .. msg
                    end
                end
                return msg
            end
            if(v.type == 'info') then
                GUI:TextColored(1,1,1,1,message())
            elseif(v.type == 'warning') then
                GUI:TextColored(1,1,0,1,message())
            elseif(v.type == 'error') then
                GUI:TextColored(1,0,0,1,message())
            elseif(v.type == 'success') then
                GUI:TextColored(0,1,0,1,message())
            end
            if(self.Console.autoScroll) then
                GUI:SetScrollHere(1.0)
            end
        end
        GUI:EndChild()
    GUI:EndChild()
end

function self.onInitialize()
    ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##MENU_RoseDebug", name = "RoseDebug", onClick = function() self.options.open = not self.options.open end, tooltip = "Rose Debug"},"FFXIVMINION##MENU_HEADER")
end

function self.onDraw(_, ...)
    if(self.options.open) then
        GUI:SetNextWindowSize(500, 500, GUI.SetCond_FirstUseEver)
        self.options.visible, self.options.open = GUI:Begin("Rose Debug", self.options.open, GUI.WindowFlags_MenuBar)
            if(GUI:BeginMenuBar()) then
                self.Console.Tests()
                GUI:EndMenuBar()
            end
            self.Console.Elements()
        GUI:End()
    end
end

RegisterEventHandler("Module.Initalize", self.onInitialize, "Rose.Debug.onInitialize")
RegisterEventHandler("Gameloop.Draw", self.onDraw, "Rose.Debug.onDraw")