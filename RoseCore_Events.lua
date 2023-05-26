Rose.Events = {
    moduleName = "Rose.Events",
}
local self = Rose.Events
self.currentACR = "None"

self.options = {
    priorities = {
        low = {
            minimumTickLength = 1000,
        },
        medium = {
            minimumTickLength = 500,
        },
        high = {
            minimumTickLength = 250,
        },
    }
}

self.eventCache = {}

local function log (...)
    local message = Rose.Debug.Console.parse(arg)
    if(message ~= nil) then
        if(message ~= nil and Rose.Debug ~= nil) then
            if(Rose.Debug.Console.log ~= nil) then
                Rose.Debug.Console.log(message, self.moduleName)
            end
        end
    end
end

local function logError(...)
    local message = Rose.Debug.Console.parse(arg)
    if(#message > 0) then
        if(message ~= nil and Rose.Debug ~= nil) then
            if(Rose.Debug.Console.error ~= nil) then
                Rose.Debug.Console.error(message, self.moduleName)
            end
        end
    end
end

local function fire(eventName, eventArguments)
    if(eventArguments ~= nil and #eventArguments > 0) then
        QueueEvent(eventName, unpack(eventArguments))
    else
        QueueEvent(eventName, "")
    end
end


local function validateEventArguments(eventArguments)
    -- check event arguments table values are strings
    local argVal = {}
    for k, v in pairs(eventArguments) do
        if(type(v) == 'string' or type(v) == 'table') then
            argVal[k] = true
        else
            logError('Event arguments must be strings or tables. ' .. type(v) .. ' given.')
            argVal[k] = false
        end
    end
    for _, boolean in pairs(argVal) do
        if(boolean == false) then
            return false
        end
    end
    return true
end

local function transposeToStrings(eventArguments)
    local args = {}
    for k, v in pairs(eventArguments) do
        if(type(v) == 'table') then
            args[k] = json.encode(v)
        else
            args[k] = v
        end
    end
    return args
end

function self.dispatch(eventName, eventArguments, priority)
    if(not validateEventArguments(eventArguments)) then
        return
    end
    local transposedArguments = transposeToStrings(eventArguments)

    if(priority == nil) then
        priority = 'low'
    end

    local priorityTickLength = self.options.priorities[priority].minimumTickLength
    local currentTick = Now()

    if(self.eventCache[eventName] == nil) then
        self.eventCache[eventName] = {
            lastTick = currentTick,
        }

        fire(eventName, transposedArguments)
    else
        local eventCache = self.eventCache[eventName]
        -- Last time this event was fired, was more than the minimum tick length ago
        if(eventCache.lastTick + priorityTickLength < currentTick) then
            eventCache.lastTick = currentTick
            fire(eventName, transposedArguments)
        end
    end
end

function self.onInitialize(_, ...)
    log('onInitialize')
end

function checkCurrentACR()
    local activeACR = gACRSelectedProfiles[Player.job]
    if(self.currentACR ~= activeACR) then
        self.dispatch('Rose.Events.ACRChanged', {self.currentACR, activeACR, 'checkCurrentACR()'}, 'low')
    end
    self.currentACR = activeACR
end

function self.onUpdate(_, ...)
    checkCurrentACR()
end

RegisterEventHandler("Module.Initalize", self.onInitialize, "Rose.Events.onInitialize")
RegisterEventHandler("Gameloop.Update", self.onUpdate, "Rose.Events.onUpdate")