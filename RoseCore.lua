---@class Rose
Rose = {
    moduleName = "Rose.Core",
    paths = {
        mods = GetLuaModsPath(),
        module = GetLuaModsPath() .. [[RoseCore\]],
        image = GetLuaModsPath() .. [[RoseCore\]] .. [[Images\]],
    },
}
---@class Rose.Core
Rose.Core = {
    availableACR = {},
    classAbilities = {},
}
local self = Rose.Core
local dispatch = function(...)
    local callDispatch
    if(callDispatch == nil) then
        if(Rose.Events) then
            if(Rose.Events.dispatch) then
                callDispatch = Rose.Events.dispatch
            end
        end
    end
    if(callDispatch ~= nil) then
        callDispatch(unpack(arg))
    else
        if(Rose.Debug.Console.error ~= nil) then
            Rose.Debug.Console.error('Rose.Events.dispatch not loaded', self.moduleName)
        end
    end
end

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

function self.onInitialize(_)
    log('onInitialize')
end

function self.isInGame()
    return FFXIV.GAMESTATE.INGAME == GetGameState()
end

--- todo: cleanup some inside-core ref (move to helpers?)
function self.filterTable(rawTable, filter)
    local filteredTable = {}
    for key, value in pairs(rawTable) do
        if(filter(value)) then
            filteredTable[key] = value
        end
    end
    return filteredTable
end

function self._filterUnusableAction(action)
    return action.usable
end

function self._getUsableClassAbilities(playerClassID)
    -- 1 = Actions
    -- @todo filter to only the classes we have ACRs for.
    local actionTypeID = 1
    local rawActionList = ActionList:Get(actionTypeID)
    local filteredActionList = {}
    for _, action in pairs(rawActionList) do
        if(action.name ~= nil and action.name ~= "") then
            if(action.usable and action.job == playerClassID) then
                filteredActionList[action.id] = {
                    id = action.id,
                    name = action.name,
                    type = action.type,
                    range = action.range,
                    usable = action.usable,
                    cost = action.cost,
                    castTime = action.casttime,
                    recastTime = action.recasttime,
                    costType = action.primarycosttype
                }
            end
        end
        -- note to self, userdata being used (C memory) so we just have to know the variables.
        --if(action.name ~= nil and action.name ~= "") then
        --    if(action.usable and action.job == FFXIV.JOBS.SAGE) then
        --        d(getmetatable(action))
        --    end
        --    --filteredActionList[action.id] = {
        --    --    id = action.id,
        --    --    name = action.name,
        --    --    type = action.type,
        --    --    range = action.range,
        --    --    usable = action.usable,
        --    --
        --    --}
        --end
    end
    return filteredActionList
end

function self.loadClassAbilities(force)
    log('loadClassAbilities force: ' .. tostring(force))
    if(force == nil) then
        force = false
    end
    local currentClassID = Player.job
    if(currentClassID == nil) then
        log('currentClassID is nil.')
        return
    end
    if(#self.classAbilities[currentClassID] > 0) then
        if(force) then
            log('Reloading class abilities [classID: ' .. currentClassID .. ']')
            self.classAbilities[currentClassID] = self._getUsableClassAbilities(currentClassID)
        else
            log('Class abilities already loaded [classID: ' .. currentClassID .. ']')
        end
    else
        self.classAbilities[currentClassID] = self._getUsableClassAbilities(currentClassID)
    end
end

function self.onACRAvailable(_, ...)
    local acrModuleName = arg[1]
    local tab = json.decode(arg[2])
    local settings = json.decode(arg[3])
    local acrTab = {
        ['moduleName'] = acrModuleName,
        acrName = tab.acrName,
        name = tab.name,
        tooltip = tab.tooltip,
    }

    table.insert(self.availableACR, acrModuleName)

    dispatch('Rose.Events.LoadACR', {'RoseCore', acrTab, settings, 'onACRAvailable()'}, 'low')
end

RegisterEventHandler("Module.Initalize", self.onInitialize, "Rose.Core.onInitialize")
RegisterEventHandler("Gameloop.Update", self.onUpdate, "Rose.Core.onUpdate")
RegisterEventHandler("Rose.Events.ACRAvailable", self.onACRAvailable, "Rose.Core.onACRAvailable")