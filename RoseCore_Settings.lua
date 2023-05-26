Rose.Settings = {
    moduleName = "Rose.Settings",
}
local self = Rose.Settings
local store = {}
local options = {}

local function log (...)
    local message = Rose.Debug.Console.parse(arg)
    if(Rose.Debug ~= nil) then
        if(Rose.Debug.Console.log ~= nil) then
            Rose.Debug.Console.log(message, self.moduleName)
        end
    end
end
local function logWarning(...)
    local message = Rose.Debug.Console.parse(arg)
    if(Rose.Debug ~= nil) then
        if(Rose.Debug.Console.warning ~= nil) then
            Rose.Debug.Console.warning(message, self.moduleName)
        end
    end
end

function self.getSetting(module, key, default)
    if(store[module] == nil) then
        store[module] = {}
    end
    if(store[module][key] == nil and default ~= nil) then
        store[module][key] = default
    end
    return store[module][key]
end

function self.setSetting(module, key, value)
    store[module][key] = value
end

function self.loadOptions(moduleName)
    if(options[moduleName] ~= nil) then
        local moduleOptions = options[moduleName]
        return self.parseOptions(moduleOptions)
    else
        logWarning('Module options not available to be loaded. [moduleName' .. moduleName .. ']')
    end
end

function self.onInitialize(_, ...)
    log('onInitialize')
end

function self.onACROptions(_, acrModuleName, acrOptions)
    options[acrModuleName] = json.decode(acrOptions)
end

RegisterEventHandler("Module.Initalize", self.onInitialize, "Rose.Settings.onInitialize")

-- Custom Events
RegisterEventHandler("Rose.Events.ACROptions", self.onACROptions, "Rose.Settings.onACROptions")