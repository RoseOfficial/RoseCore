Rose.Interface = {
    moduleName = "Rose.Interface",
    open = true,
    visible = true,
    currentTab = 1,
}
local self = Rose.Interface
local core = Rose.Core
self.internal = {
    currentACR = nil,
    settings = {}
}
self.tabs = {
    [1] = {
        name = "General",
        image = {
            path = Rose.paths.image .. "background.png",
            width = 180,
            height = 180,
        },
        tooltip = "General Settings",
        options = {
            {
                label = "Button Options",
                type = "group",
                items = {}
            }
        }
    },
}
self.social = {
    [1] = {
        name = "Discord",
        link = [[https://discord.gg/BM9MBERbA9]],
        icon = {
            path = Rose.paths.image .. "discord.png",
            width = 55,
            height = 55,
        },
        tooltip = "Join the RoseCore Discord",
    },
    [2] = {
        name = "Trello",
        link = [[https://trello.com/b/4Z7Z7Z7Z/rosecore]],
        icon = {
            path = Rose.paths.image .. "trello.png",
            width = 55,
            height = 55,
        },
        tooltip = "View the RoseCore Trello",
    },
    [3] = {
        name = "Ko-fi",
        link = [[https://ko-fi.com/rosecore1000]],
        icon = {
            path = Rose.paths.image .. "kofi.png",
            width = 55,
            height = 60,
        },
        tooltip = "Support RoseCore on Ko-fi",
    },
}
local function getSetting(module, key, default)
    if(Rose.Settings ~= nil) then
        if(Rose.Settings.getSetting ~= nil) then
            return Rose.Settings.getSetting(module, key, default)
        end
    end
end

local function setSetting(module, key, value)
    if(Rose.Settings ~= nil) then
        if(Rose.Settings.getSetting ~= nil) then
            Rose.Settings.setSetting(module, key, value)
        end
    end
end

local function log (...)
    local message = Rose.Debug.Console.parse(arg)
    if(Rose.Debug ~= nil) then
        if(Rose.Debug.Console.log ~= nil) then
            Rose.Debug.Console.log(message, self.moduleName)
        end
    end
end

local function logWarning (...)
    local message = Rose.Debug.Console.parse(arg)
    if(Rose.Debug ~= nil) then
        if(Rose.Debug.Console.warning ~= nil) then
            Rose.Debug.Console.warning(message, self.moduleName)
        end
    end
end

function self.parseOptionCheckbox(checkbox, moduleName)
        local enableOption, changeOption = GUI:Checkbox(checkbox.label, getSetting(moduleName, checkbox.id, checkbox.default))
        if(changeOption) then
            log("Changed [" .. checkbox.id .. "] to " .. tostring(enableOption))
            setSetting(moduleName,checkbox.id, enableOption)
        end
end

function self.parseOptionKeybind(keybind, moduleName)
    if(GUI:TreeNode("Keybind Options")) then
        GUI:BeginGroup()
        local keybindValue = GUI:Keybind(keybind.label, getSetting(moduleName, keybind.id, 0))
        if(keybindValue ~= getSetting(moduleName, keybind.id, 0)) then
            log("Changed [" .. keybind.id .. "] to " .. tostring(keybindValue))
            setSetting(moduleName, keybind.id, keybindValue)
        end
        if(GUI:IsItemHovered()) then
            GUI:SetTooltip("Click then press key to set the keybind")
        end
        GUI:EndGroup()
        GUI:BeginGroup()
        GUI:Text("Modifier Keys")
        local enableShift, changeShift = GUI:Checkbox('Shift', getSetting(moduleName, keybind.id .. [[_shift]], false))
        if(changeShift) then
            log("Changed [" .. keybind.id .. [[_shift]] .. "] to " .. tostring(enableShift))
            setSetting(moduleName,keybind.id .. [[_shift]], enableShift)
        end
        local enableCtrl, changeCtrl = GUI:Checkbox('Ctrl', getSetting(moduleName, keybind.id .. [[_ctrl]], false))
        if(changeCtrl) then
            log("Changed [" .. keybind.id .. [[_ctrl]] .. "] to " .. tostring(enableCtrl))
            setSetting(moduleName,keybind.id .. [[_ctrl]], enableCtrl)
        end
        local enableAlt, changeAlt = GUI:Checkbox('Alt', getSetting(moduleName, keybind.id .. [[_alt]], false))
        if(changeAlt) then
            log("Changed [" .. keybind.id .. [[_alt]] .. "] to " .. tostring(enableAlt))
            setSetting(moduleName,keybind.id .. [[_alt]], enableAlt)
        end
        GUI:EndGroup()
        if(GUI:IsItemHovered()) then
            GUI:SetTooltip([[Use checkboxes to enable modifier keys.
            e.g. Shift + Keybind]])
        end
        GUI:TreePop()
    end
end

function self.parseOptionLabel(label, moduleName)
    if(label.label ~= nil) then
        GUI:Text(label.label)
    end
end

function self.parseOptionBlank(blank, moduleName)
    GUI:Text("")
end

function self.getColumnWidth()
    GUI:Columns(12, "", false)
    local columnWidth = GUI:GetColumnWidth( -1 )
    GUI:Columns(1)
    return columnWidth
end

function self.parseOptionSlider(slider, moduleName)
    local value = getSetting(moduleName, slider.id, slider.default)
    local sliderValue, changeSlider = GUI:SliderInt(value .. '%', value, slider.min, slider.max)
    if(changeSlider) then
        log("Changed [" .. slider.id .. "] to " .. tostring(sliderValue))
        setSetting(moduleName, slider.id, sliderValue)
    end
end

function self.parseOptionRow(row, moduleName)
    local columnWidth = self.getColumnWidth() * 4
    local rowItems = row.items
    if(rowItems ~= nil and #rowItems > 0) then
        local columnCount = #rowItems
        GUI:Columns(columnCount)
        for k, item in pairsByKeys(rowItems) do
            if(item.span ~= nil and type(item.span) == "number") then
                GUI:SetColumnWidth( -1, columnWidth * item.span )
            else
                GUI:SetColumnWidth( -1, columnWidth )
            end
            if(item.type == "checkbox") then
                self.parseOptionCheckbox(item, moduleName)
            end
            if(item.type == "keybind") then
                self.parseOptionKeybind(item, moduleName)
            end
            if(item.type == "label") then
                self.parseOptionLabel(item, moduleName)
            end
            if(item.type == "blank") then
                self.parseOptionBlank(item, moduleName)
            end
            if(item.type == "slider") then
                self.parseOptionSlider(item, moduleName)
            end
            if(columnCount ~= k) then
                GUI:NextColumn()
            else
                GUI:Columns(1)
            end
        end
    end
end

function self.parseOptionGroup(group, moduleName)
    local groupItems = group.items
    if(groupItems ~= nil and #groupItems > 0) then
        if(group.label ~= nil) then
            GUI:Text(group.label)
        end
        for _, item in pairsByKeys(groupItems) do
            if(item.type == "row") then
                self.parseOptionRow(item, moduleName)
            end
        end
    else
        if(group.label ~= nil) then
            GUI:Text(group.label)
        end
    end
end


function self.parseOptions(options, moduleName)
    if(table.valid(options)) then
        for _,optionSet in pairsByKeys(options) do
            if(optionSet.type == "group") then
                self.parseOptionGroup(optionSet, moduleName)
            end
        end
    end
end

function self.onInitialize(_, ...)
    log('onInitialize')
    local icon = Rose.paths.image .. "icon.png"
    ml_gui.ui_mgr:AddMember({
        id = "FFXIVMINION##MENU_RoseCore",
        name = "RoseCore",
        onClick = function()
            self.open = not self.open
        end,
        tooltip = "Complete Healing Reactions",
        texture = icon
    }, "FFXIVMINION##MENU_HEADER")
end

function self.openLink(link, label)
    if(label ~= nil) then
        log("Opening " .. label .. " link: " .. link)
    else
        log("Opening link: " .. link)
    end
    if(link ~= nil) then
        io.popen([[cmd /c start "" "]]..link..[["]]):close()
    end
end

function self.socialIcons()
    for _, social in ipairs(self.social) do
        if(social.icon ~= nil) then
            if(_ ~= 1) then
                GUI:SameLine(0, 5)
            end
            GUI:Image(social.icon.path, social.icon.width, social.icon.height)
            if(social.tooltip ~= nil) then
                if(GUI:IsItemHovered()) then
                    GUI:SetTooltip(social.tooltip)
                end
            end
            if(GUI:IsItemClicked()) then
                self.openLink(social.link, social.name)
            end
        end
    end
end

-- A function that creates a block of GUI:Button
function self.quickToggles(buttonList)
    for _, button in ipairs(buttonList) do
        if(button.icon ~= nil) then
            if(_ ~= 1) then
                GUI:SameLine(0, 5)
            end
            if(GUI:ImageButton("##RoseCore_" .. button.name .. "Button", button.icon.path, button.icon.width, button.icon.height, 0, 0, 1, 1, 0, 0, 0, 0)) then
                if(button.tooltip ~= nil) then
                    if(GUI:IsItemHovered()) then
                        GUI:SetTooltip(button.tooltip)
                    end
                end
                if(button.onClick ~= nil) then
                    button.onClick()
                end
            end
        end
    end
end

function self.onDraw(_, ...)
    if(self.open) then
        GUI:SetNextWindowSize(1050, 450)
        self.visible, self.open = GUI:Begin("Rose Core", self.open, GUI.WindowFlags_NoCollapse)

                GUI:BeginChild("##RoseCore_Tabs", 200, -1, false, GUI.WindowFlags_NoResize)

                    for k, v in ipairs(self.tabs) do
                        if(v.image ~= nil) then
                            GUI:PushStyleColor(GUI.Col_Button, 0,0,0,0)
                            GUI:PushStyleColor(GUI.Col_ButtonHovered, 0,0,0,0.6)
                            GUI:PushStyleColor(GUI.Col_ButtonActive, 0,0,0,0.8)
                            if(GUI:ImageButton("##RoseCore_" .. v.name .. "Button", v.image.path, v.image.width, v.image.height, 0, 0, 1, 1, 0, 0, 0, 0, 0)) then
                                log("Clicked " .. v.name .. " button")
                                self.currentTab = k
                            end
                            GUI:PopStyleColor(3)
                        else
                            if(table.find(core.availableACR, v.moduleName) ~= nil) then
                                local label = v.name
                                if(self.internal.currentACR == v.acrName) then
                                    label = label .. "\n\t[Active]"
                                end
                                if(self.currentTab == k) then
                                    GUI:PushStyleColor(GUI.Col_Button, 1,0.5,0,0.8)
                                    GUI:PushStyleColor(GUI.Col_ButtonHovered, 1,0.5,0,1)
                                    GUI:PushStyleColor(GUI.Col_ButtonActive, 1,0.6,0,0.8)
                                    if(GUI:Button(label, 180, 40)) then
                                        log("Set already set to " .. v.name)
                                    end
                                    GUI:PopStyleColor(3)
                                else
                                    if(GUI:Button(label, 180, 40)) then
                                        self.currentTab = k
                                        log("Tab set to " .. v.name)
                                    end
                                end
                                if(v.tooltip ~= nil) then
                                    if(GUI:IsItemHovered()) then
                                        GUI:SetTooltip(v.tooltip)
                                    end
                                end
                            end
                        end
                    end
                    self.socialIcons()
                GUI:EndChild()
                GUI:SameLine(0, 0)
                GUI:BeginChild("##RoseCore_Options", -1, -1, false, GUI.WindowFlags_AlwaysAutoResize)
                    if(self.currentTab == 1) then
                        GUI:Text("Welcome to RoseCore ~") GUI:SameLine()
                    end
                    for k, tab in ipairs(self.tabs) do
                        if(self.currentTab == k) then
                            GUI:Text(tab.name .. " Settings")
                            GUI:Separator()
                            self.parseOptions(tab.options, tab.moduleName)
                        end
                    end
                GUI:EndChild()

        GUI:End()
    end
end

function self.onACRChanged(_, old, new)
    if(old ~= new) then
        log("ACR Changed from [" .. old .. "] to [" .. new .. "]")
    end
    self.internal.currentACR = new
end

function self.loadACR(_, ...)
    -- arg[1] = sender module name
    local decodedTab = json.decode(arg[2])
    decodedTab.options = json.decode(arg[3])

    table.insert(self.tabs, decodedTab)
end

RegisterEventHandler("Module.Initalize", self.onInitialize, "Rose.Interface.onInitialize")
RegisterEventHandler("Gameloop.Draw", self.onDraw, "Rose.Interface.onDraw")

-- Custom Events
RegisterEventHandler("Rose.Events.LoadACR", self.loadACR, "Rose.Interface.onACRAvailable")
RegisterEventHandler("Rose.Events.ACRChanged", self.onACRChanged, "Rose.Interface.onACRChanged")