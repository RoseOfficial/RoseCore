RoseWHM = {}

RoseWHM.Settings = {
    AOE = true,
    Debug = true,
}

RoseWHM.GUI = {
    open = false,
    visible = true,
    name = "RoseWHM",
}

RoseWHM.classes = {
    [FFXIV.JOBS.WHITEMAGE] = true,
}

RoseWHM.BuffID = {

}

-- This is to have a different logic for AOE healing if player is in a donjon or raid
RoseWHM.AOEHealCountForPartySize = {
    [8] = 2,
    [4] = 2,
}

RoseWHM.DidAOEHeal = false
RoseWHM.CurrentDPSTarget = 0
RoseWHM.HasDPSTarget = false
RoseWHM.MainTank = 0
RoseWHM.AlreadyDidAOE = 0
RoseWHM.ActionQueue = {}
RoseWHM.IsInSavage = false
RoseWHM.AlreadyCastedProtectionForAOE = {}

RoseWHM.Spells = {
    Aero = {
        {
            skillID = 16532
        },
        {
            skillID = 132
        },
        {
            skillID = 121
        },
    },
    Stone = {
        {
            skillID = 25859
        },
        {
            skillID = 16533
        },
        {
            skillID = 7431
        },
        {
            skillID = 3568
        },
        {
            skillID = 127
        },
        {
            skillID = 119
        },
    },
    Holy = {
        {
            skillID = 25860
        },
        {
            skillID = 139
        },
    },
    Assize = {
        {
            skillID = 3571
        },
    },
    AfflactusMisery = {
        {
            skillID = 16535
        },
    },
    Cure = {
        {
            skillID = 120,
            potency = 500
        },
    },
    CureII = {
        {
            skillID = 135,
            potency = 800
        },
    },
    Medica = {
        {
            skillID = 124,
            potency = 400
        },
    },
    MedicaII = {
        {
            skillID = 124,
            potency = 250
        },
    },
    CureIII = {
        {
            skillID = 131,
            potency = 600
        },
    },
    Regen = {
        {
            skillID = 137,
            potency = 250
        },
    },
    Benediction = {
        {
            skillID = 140,
            potency = 10 -- Infinite, Bene just set health to 100%
        },
    },
    AfflactusSolace = {
        {
            skillID = 16531,
            potency = 800
        },
    },
    Tetragrammaton = {
        {
            skillID = 3570,
            potency = 700
        },
    },
    DevineBension = {
        {
            skillID = 7432,
        },
    },
    PlenaryIndulgence = {
        {
            skillID = 7433,
            potency = 200
        },
    },
    AfflactusRupture = {
        {
            skillID = 16534,
            potency = 400
        },
    },
    Aquaveil = {
        {
            skillID = 25861,
        },
    },
    Liturgy = {
        {
            skillID = 25862,
        },
    },
    Asylum = {
        {
            skillID = 3569,
        },
    },
    ThinAir = {
        {
            skillID = 7430,
        },
    },
    Temperance = {
        {
            skillID = 16536,
        },
    },
    PresenceOfMind = {
        {
            skillID = 136,
        },
    },
}

function RoseWHM.GetCorrectSpellForCurrentLevel(spell)
    if RoseWHM.Spells[spell] ~= nil then
        for k, v in pairs(RoseWHM.Spells[spell]) do
            local skill = RoseCore.GetSkill(v.skillID)
            if skill ~= nil then
                if Player.level >= skill.level then
                    return skill, v
                end
            else
                RoseCore.log("Error: " .. v.skillID .. " is not a valid skill ID")
            end
        end
    else
        RoseCore.log("Trying to GetCorrectSpellForCurrentLevel on a spell that do not exist: " .. spell)
    end
end

function RoseWHM.DebugPrint(...)
    if RoseWHM.Settings.Debug then
        d("[RoseWHM] " .. ...)
    end
end

function RoseWHM.GetAOECountForPartySize(partySize)
    if RoseWHM.AOEHealCountForPartySize[partySize] then
        return RoseWHM.AOEHealCountForPartySize[partySize]
    end
    return 2 -- Default
end

RoseCore.RegisterSkill(119, true)
RoseCore.RegisterSkill(120, true)
RoseCore.RegisterSkill(121, true)
RoseCore.RegisterSkill(124, true)
RoseCore.RegisterSkill(125, true)
RoseCore.RegisterSkill(127, true)
RoseCore.RegisterSkill(135, true)
RoseCore.RegisterSkill(132, false)
RoseCore.RegisterSkill(133, true)
RoseCore.RegisterSkill(136, true)
RoseCore.RegisterSkill(137, true)
RoseCore.RegisterSkill(131, true)
RoseCore.RegisterSkill(139, true)
RoseCore.RegisterSkill(140, false)
RoseCore.RegisterSkill(16531, true)
RoseCore.RegisterSkill(3569, false)
RoseCore.RegisterSkill(3568, true)
RoseCore.RegisterSkill(3571, false)
RoseCore.RegisterSkill(7430, false)
RoseCore.RegisterSkill(3570, false)
RoseCore.RegisterSkill(7431, true)
RoseCore.RegisterSkill(7432, false)
RoseCore.RegisterSkill(7433, false)
RoseCore.RegisterSkill(16532, true)
RoseCore.RegisterSkill(16533, true)
RoseCore.RegisterSkill(16535, true)
RoseCore.RegisterSkill(16534, true)
RoseCore.RegisterSkill(16536, false)
RoseCore.RegisterSkill(25859, true)
RoseCore.RegisterSkill(25860, true)
RoseCore.RegisterSkill(25861, false)
RoseCore.RegisterSkill(25862, false)

local lastTargetCheck = 0
function RoseWHM.Targeting()
    RoseWHM.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    local target = MGetTarget()
    RoseWHM.PartyMembers = MEntityList("alive,chartype=4,myparty,targetable,maxdistance=30") or {} -- Adding party members to PartyMembers
    if not table.valid(target) then
        local llist = MEntityList("lowesthealth,alive,attackable,maxdistance=30")
        if table.valid(llist) then
            for i, enemy in pairs(llist) do
                if enemy.incombat then
                    -- d("Targeting "..tostring(i))
                    Player:SetTarget(i)
                end
            end
        end
    end
    if table.valid(target) and target.incombat and target.attackable then
        if table.valid(target) then
            if RoseWHM.lastEnemyTargetID ~= target.id and target.attackable then
                RoseWHM.lastEnemyTarget = target
                RoseWHM.lastEnemyTargetID = target.id
            end
            if TimeSince(lastTargetCheck) > 100 then
                lastTargetCheck = Now()
            end
        elseif RoseWHM.lastEnemyTargetID then -- reset if you untarget something to prevent a hard lock with forced targeting
            RoseWHM.lastEnemyTarget = nil
            RoseWHM.lastEnemyTargetID = nil
        end
    end
end

function RoseWHM.AddActionToQueue(actionName, settings)
    table.insert(RoseWHM.ActionQueue, {
        actionName = actionName,
        settings = settings
    })
    RoseWHM.DebugPrint("Adding action to queue: " .. actionName)
end

function RoseWHM.ClearActionQueue()
    RoseWHM.ActionQueue = {}
end

function RoseWHM.Cast()
    WhmHotbarSettings = RoseCore.Settings.WhmEvHotbar
    if RoseCore.Settings.Active then
        if Player:IsMoving() and not Player.ismounted and WhmHotbarSettings.Sprint.bool then
            local sprint = ActionList:Get(1, 3)
            if RoseCore.IsReady(sprint) then
                return RoseCore.Action(sprint, Player)
            end
        end
        RoseWHM.Targeting()
        local HasTarget, target = RoseCore.HasTarget()
        RoseWHM.HasDPSTarget = HasTarget
        if HasTarget or WhmHotbarSettings.HealOutsideOfCombat.bool then
            RoseWHM.CurrentDPSTarget = target
            local level = Player.level

            if WhmHotbarSettings.Heal.bool then
                RoseWHM.DidAOEHeal = false
                local Heal = true
                local elist = RoseWHM.elist
                local lowcount = 0
                local lowPartyHP = {}
                local totalPlayerCount = 0
                local needShieldCount = 0
                local PartyMembers, PartyMembersDead = RoseCore.Utils.GetPartyList()
                local NeedAOEHealing = 0
                local currentTanks = {}

                -- Idk if there is a better way to do this ?
                local PlayerCountInParty = 0
                for k, v in pairs(EntityList.myparty) do
                    PlayerCountInParty = PlayerCountInParty + 1
                end

                local tankSingle, PlayerSingle = RoseCore.GetJobSettings()
                if table.valid(PartyMembers) then
                    for i, member in pairs(PartyMembers) do
                        totalPlayerCount = totalPlayerCount + 1
                        if IsTank(member.job) and member.hp.percent < tankSingle then
                            member.IsTank = true -- We store IsTank value to avoid calling it after
                            if member.hp.percent < PlayerSingle then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            else
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                            table.insert(currentTanks, member)
                            if RoseCore.Utils.HasTankStance(member) then
                                RoseWHM.MainTank = member --TODO: Improve with emnity detection
                            end
                        else
                            member.IsTank = false -- Storing IsTank value for optimisation, I actually don't know the performance impact of calling IsTank again and again, but for sure calling it one time and storing the value for later use is better.
                            if member.hp.percent < PlayerSingle then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                        end

                        if member.hp.percent < 95 then
                            needShieldCount = needShieldCount + 1 -- So dumb atm, I should track if the player is already shielded but idk how to do that yet
                        end
                    end
                end

                if not table.valid(PartyMembers) then
                    if Player.hp.percent <= 90 then
                        lowcount = 1
                    end
                end
                if level >= 14 and Player.mp.percent <= 80 then
                    local lucid = ActionList:Get(1, 7562)
                    if RoseCore.IsReady(lucid) then
                        return RoseCore.Action(lucid, Player)
                    end
                end
                if table.valid(PartyMembersDead) and Player.level >= 12 and Player.mp.percent >= 24 and
                    WhmHotbarSettings.Raise.bool then
                    local raise = ActionList:Get(1, 125)
                    local swiftcast = ActionList:Get(1, 7561)
                    local healers, tanks, raisers, others = {}, {}, {}, {}
                    for i, e in pairs(PartyMembersDead) do
                        if IsHealer(e.job) then
                            healers[i] = e
                        elseif e.IsTank then
                            tanks[i] = e
                        elseif (e.job == 27 and e.level >= 12) or (e.job == 35 and e.level >= 64) then
                            raisers[i] = e
                        else
                            others[i] = e
                        end
                    end
                    local raiseTarget
                    if table.valid(healers) then
                        for i, e in pairs(healers) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(tanks) then
                        for i, e in pairs(tanks) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(raisers) then
                        for i, e in pairs(raisers) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(others) then
                        for i, e in pairs(others) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    end
                    if table.valid(raiseTarget) and MissingBuffs(raiseTarget, "148+1140") then
                        local reztexttime = 0

                        local buffPThinAir = RoseCore.Utils.GetBuff(Player, { 1217 }, Player)
                        if not buffPThinAir then
                            local spell = RoseWHM.GetCorrectSpellForCurrentLevel("ThinAir")
                            if spell ~= nil then
                                local action = ActionList:Get(1, spell.ID)
                                if RoseCore.IsReady(action) then
                                    return RoseCore.Action(action, Player)
                                end
                            end
                        end

                        if level >= 18 and RoseCore.IsReady(swiftcast) then
                            return RoseCore.Action(swiftcast, Player)
                        elseif RoseCore.IsReady(raise) then
                            if TimeSince(reztexttime) > 2000 then
                                SendTextCommand("/e Rezzing <t>")
                                reztexttime = Now()
                            end
                            return RoseCore.Action(raise, raiseTarget)
                        end
                    end
                end

                for k, v in pairs(RoseWHM.ActionQueue) do
                    if v.shouldBeUsed then
                        local spell = RoseWHM.GetCorrectSpellForCurrentLevel(v.actionName)
                        if RoseCore.WasActionUsed(ActionList:Get(1, spell.ID)) then
                            RoseWHM.DebugPrint("Removed " .. v.actionName .. " from the queue")
                            table.remove(RoseWHM.ActionQueue, k)
                        end
                    end
                end

                for k, v in pairs(RoseWHM.ActionQueue) do
                    local spell = RoseWHM.GetCorrectSpellForCurrentLevel(v.actionName)
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            local target
                            if v.settings.target == "self" then
                                target = Player
                            elseif v.settings.target == "MT" then
                                target = RoseWHM.MainTank
                            end

                            RoseWHM.DebugPrint("Executing " .. v.actionName .. " on " .. v.settings.target)
                            v.shouldBeUsed = true
                            return RoseCore.Action(action, target)
                        end
                    else
                        RoseWHM.DebugPrint("Action " ..
                            v.actionName .. " in ActionQueue was not found by GetCorrectSpellForCurrentLevel")
                        table.remove(RoseWHM.ActionQueue, k)
                        break
                    end
                end

                local khpcount = 0
                if table.valid(elist) then
                    for i, e in pairs(elist) do
                        if e.distance2d <= 15 then
                            khpcount = khpcount + 1
                        end
                    end
                end
                if RoseWHM.IsInSavage == false then
                    RoseWHM.HandleAOEProtection(level, khpcount, currentTanks)
                    RoseWHM.HandleTankProtection(khpcount, currentTanks)
                end
                if lowcount > 0 then
                    local lowest = 0
                    local hp = 100
                    local IsTargetATank = false
                    for _, member in pairs(PartyMembers) do
                        RoseCore.UpdateEntityHealthCache(member)
                        if not RoseCore.IsEntityInHealthCache(member) then
                            if member.hp.percent < hp then
                                lowest = member
                                hp = member.hp.percent
                                IsTargetATank = member.IsTank
                            end
                        end
                    end

                    if Heal and lowest ~= 0 then
                        local count = 0

                        for k, v in pairs(EntityList.myparty) do
                            count = count + 1
                            if v.hp.percent > 1 then
                                if v.hp.percent < RoseCore.Settings.WhmEvPartyOverhealAOE then
                                    NeedAOEHealing = NeedAOEHealing + 1
                                end
                            end
                        end

                        if count == 0 then
                            for k, v in pairs(PartyMembers) do
                                if v.hp.percent > 1 then
                                    if v.hp.percent < RoseCore.Settings.WhmEvPartyOverhealAOE then
                                        NeedAOEHealing = NeedAOEHealing + 1
                                    end
                                end
                            end
                        end


                        if NeedAOEHealing >= RoseWHM.GetAOECountForPartySize(PlayerCountInParty) then
                            if RoseWHM.AlreadyDidAOE <= 0 then
                                RoseWHM.HandleAOEHealing(level, lowPartyHP, totalPlayerCount, lowest, PlayerCountInParty)
                                if not RoseWHM.DidAOEHeal then -- Fallback if no AOE heal was done, do a single target heal
                                    RoseWHM.HandleSingleTargetHealing(level, IsTargetATank, lowest)
                                else
                                    for _, member in pairs(lowPartyHP) do
                                        if member.distance2d <= 15 then
                                            RoseCore.AddEntityToHealthCache(member)
                                        end
                                    end
                                    
                                    RoseWHM.AlreadyDidAOE = 15
                                end
                            else
                                RoseWHM.AlreadyDidAOE = RoseWHM.AlreadyDidAOE - 1
                                if RoseWHM.AlreadyDidAOE <= 0 then
                                    RoseWHM.AlreadyDidAOE = 0
                                end
                            end
                        else
                            RoseWHM.HandleSingleTargetHealing(level, IsTargetATank, lowest)
                        end
                    end

                    if table.valid(PartyMembers) and level >= 10 and WhmHotbarSettings.Esuna.bool then
                        for _, member in pairs(PartyMembers) do
                            if (table.valid(member.buffs)) then
                                for _, buff in pairs(member.buffs) do
                                    if (buff.isdebuff and buff.dispellable and buff.duration >= 1) then
                                        local esuna = ActionList:Get(1, 7568)
                                        if RoseCore.IsReady(esuna) then
                                            return RoseCore.Action(esuna, member)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if table.valid(RoseWHM.elist) and WhmHotbarSettings.DPS.bool then
                if HasTarget then
                    RoseWHM.HandleAttack(target, level, RoseWHM.elist)
                end
            end
        end
    end
end

function RoseWHM.ClearAoeCach(currentAOE)
    local AOEToRemove = {}
    for k, v in pairs(RoseWHM.AlreadyCastedProtectionForAOE) do
        local found = false
        for i, j in pairs(currentAOE) do
            if k == j.aoeID then
                found = true
            end
        end
        if not found then
            RoseWHM.DebugPrint("AOE " .. k .. " was removed from the cache")
            table.insert(AOEToRemove, k)
        end
    end

    for k, v in pairs(AOEToRemove) do
        RoseWHM.AlreadyCastedProtectionForAOE[v] = nil
    end
end

function RoseWHM.HandleTankProtection(khpcount, tanks)
    if TensorCore and Argus then
        local CurrentAoEs = Argus.getCurrentAOEs(true)
        for k, v in pairs(tanks) do
            if TensorCore.Avoidance.inUnavoidableAOE(CurrentAoEs, v) then
                local buffDevineBension = RoseCore.Utils.GetBuff(v, { 1218 })
                local buffAquaveil = RoseCore.Utils.GetBuff(v, { 2708 })

                if buffDevineBension == nil and buffAquaveil == nil then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("DevineBension") -- 1218
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, v)
                        end
                    end
                end

                if buffDevineBension == nil then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Aquaveil") -- 2708
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, v)
                        end
                    end
                end
            end

            -- This logic should only happen in donjon and maybe in old raids with bunch of ads ?
            -- Just mass shield / protection
            if khpcount >= 3 then
                local buffDevineBension = RoseCore.Utils.GetBuff(v, { 1218 })

                if buffDevineBension == nil then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("DevineBension") -- 1218
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, v)
                        end
                    end
                end

                if buffDevineBension == nil then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Aquaveil") -- 2708
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, v)
                        end
                    end
                end

                if buffDevineBension == nil and not Player:IsMoving() then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Asylum")
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, v)
                        end
                    end
                end

                if khpcount >= 6 then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Temperance")
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            return RoseCore.Action(action, Player)
                        end
                    end
                end
            end
        end
    end
end

function RoseWHM.HandleAOEProtection(level, khpcount, tanks)
    if TensorCore and Argus then
        local CurrentAoEs = Argus.getCurrentAOEs(true)
        RoseWHM.ClearAoeCach(CurrentAoEs)
        if TensorCore.Avoidance.inUnavoidableAOE(CurrentAoEs, Player) then
            -- This part is to avoid casting a skill right before the AOE goes off as it would result of the
            -- spell being casted AFTER the AOE, so useless.
            -- This part can probably be imporved by just getting the Unavoidable and not the first one on the list only
            -- but I don't know how to do that yet.
            local currentAoeID = 0
            local ShouldCastProtection = true
            local CurrentAoEs = CurrentAoEs
            for k, v in pairs(CurrentAoEs) do
                local ent = TensorCore.mGetEntity(v.entityID)
                local TimeUntilBoom = ent.castinginfo.casttime - ent.castinginfo.channeltime
                if TimeUntilBoom <= 0.7 then -- 0.7s or under, cast are not allowed
                    ShouldCastProtection = false
                end
                currentAoeID = v.aoeID
                break -- Only get the first one on the list, maybe CurrentAoEs[1] could work to avoid a loop ?
            end

            local shieldNeededCount = 0
            for k, v in pairs(EntityList.myparty) do
                if v.hp.percent > 1 and v.shield < 5 then
                    shieldNeededCount = shieldNeededCount + 1
                end
            end

            -- 3003 - 2618
            if ShouldCastProtection and RoseWHM.AlreadyCastedProtectionForAOE[currentAoeID] == nil then
                local buffLiturgy = RoseCore.Utils.GetBuff(Player, { 2709 })
                if buffLiturgy == nil then
                    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Liturgy") -- 2709
                    if spell ~= nil then
                        local action = ActionList:Get(1, spell.ID)
                        if RoseCore.IsReady(action) then
                            RoseWHM.AlreadyCastedProtectionForAOE[currentAoeID] = true
                            RoseWHM.AddActionToQueue("Liturgy", {
                                target = "self"
                            })
                            return
                            --return RoseCore.Action(action, Player)
                        end
                    end
                end

                local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Temperance")
                if spell ~= nil then
                    local action = ActionList:Get(1, spell.ID)
                    if RoseCore.IsReady(action) then
                        RoseWHM.AlreadyCastedProtectionForAOE[currentAoeID] = true
                        RoseWHM.AddActionToQueue("Temperance", {
                            target = "self"
                        })
                        return
                        --return RoseCore.Action(action, Player)
                    end
                end


                local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("PlenaryIndulgence")
                if spell ~= nil then
                    local action = ActionList:Get(1, spell.ID)
                    if RoseCore.IsReady(action) then
                        RoseWHM.AlreadyCastedProtectionForAOE[currentAoeID] = true
                        RoseWHM.AddActionToQueue("PlenaryIndulgence", {
                            target = "self"
                        })
                        return
                        --return RoseCore.Action(action, Player)
                    end
                end

                local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Asylum")
                if spell ~= nil then
                    local action = ActionList:Get(1, spell.ID)
                    if RoseCore.IsReady(action) then
                        RoseWHM.AlreadyCastedProtectionForAOE[currentAoeID] = true
                        RoseWHM.AddActionToQueue("Asylum", {
                            target = "MT"
                        })
                        return
                    end
                end

            end
        end

    end
end

function RoseWHM.Draw()
    if (RoseWHM.GUI.open) then
        RoseWHM.GUI.visible, RoseWHM.GUI.open = GUI:Begin(RoseWHM.GUI.name, RoseWHM.GUI.open)
        if (RoseWHM.GUI.visible) then
            local value, changed = GUI:Checkbox("Debug Output", RoseWHM.Settings.Debug)
            if changed then
                RoseWHM.Settings.Debug = value
            end
        end
        GUI:End()
    end
end

-- Adds a customizable header to the top of the ffxivminion task window.
--[[function RoseWHM.DrawHeader()
 
end]]

-- Adds a customizable footer to the top of the ffxivminion task window.
--[[function RoseWHM.DrawFooter()
 
end]]

function RoseWHM.OnOpen()
    RoseWHM.GUI.open = true
end

function RoseWHM.OnLoad()
    ACR_MyProfile_MySavedVar = ACR.GetSetting("ACR_MyProfile_MySavedVar", false)
end

-- The OnClick function is fired when a user clicks on the ACR party interface.
-- It accepts 5 parameters:
-- mouse /int/ - Possible values are 0 (Left-click), 1 (Right-click), 2 (Middle-click)
-- shiftState /bool/ - Is shift currently pressed?
-- controlState /bool/ - Is control currently pressed?
-- altState /bool/ - Is alt currently pressed?
-- entity /table/ - The entity information for the party member that was clicked on.
--[[function RoseWHM.OnClick(mouse,shiftState,controlState,altState,entity)

end]]

-- The OnUpdate() function is fired on the gameloop, like any other OnUpdate function found in FFXIVMinion code.
--[[function RoseWHM.OnUpdate(event, tickcount)
 
end]]

return RoseWHM
