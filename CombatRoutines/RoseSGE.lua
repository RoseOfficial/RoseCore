RoseSGE = {}

RoseSGE.Settings = {
    AOE = true,
    Debug = true,
}

RoseSGE.GUI = {
    open = false,
    visible = true,
    name = "RoseSGE",
}

RoseSGE.classes = {
    [FFXIV.JOBS.SAGE] = true,
}

RoseSGE.BuffID = {
    EukrasianDiagnosis = 2607,
    EukrasianPrognosis = 2609,
}

-- This is to have a different logic for AOE healing if player is in a donjon or raid
RoseSGE.AOEHealCountForPartySize = {
    [8] = 2,
    [4] = 2,
}

RoseSGE.PrognosisTime = 0
RoseSGE.DidAOEHeal = false
RoseSGE.CurrentDPSTarget = 0
RoseSGE.HasDPSTarget = false
RoseSGE.AlreadyDidAOE = 0

function RoseSGE.DebugPrint(...)
    if RoseSGE.Settings.Debug then
        d("[RoseSGE] " .. ...)
    end
end

function RoseSGE.GetAOECountForPartySize(partySize)
    if RoseSGE.AOEHealCountForPartySize[partySize] then
        return RoseSGE.AOEHealCountForPartySize[partySize]
    end
    return 2 -- Default
end

RoseCore.RegisterSkill(24283, true)
RoseCore.RegisterSkill(7562, false)
RoseCore.RegisterSkill(24285, false)
RoseCore.RegisterSkill(24286, true)
RoseCore.RegisterSkill(24287, true)
RoseCore.RegisterSkill(24288, false)
RoseCore.RegisterSkill(24289, true)
RoseCore.RegisterSkill(24290, true)
RoseCore.RegisterSkill(24294, false)
RoseCore.RegisterSkill(24295, false)
RoseCore.RegisterSkill(24296, false)
RoseCore.RegisterSkill(24297, true)
RoseCore.RegisterSkill(24298, false)
RoseCore.RegisterSkill(24299, false)
RoseCore.RegisterSkill(24300, false)
RoseCore.RegisterSkill(24301, false)
RoseCore.RegisterSkill(24302, false)
RoseCore.RegisterSkill(24303, false)
RoseCore.RegisterSkill(24304, true)
RoseCore.RegisterSkill(24305, false)
RoseCore.RegisterSkill(24306, true)
RoseCore.RegisterSkill(24307, true)
RoseCore.RegisterSkill(24309, false)
RoseCore.RegisterSkill(24310, false)
RoseCore.RegisterSkill(24311, false)
RoseCore.RegisterSkill(24312, true)
RoseCore.RegisterSkill(24313, true)
RoseCore.RegisterSkill(24315, true)
RoseCore.RegisterSkill(24316, true)
RoseCore.RegisterSkill(24317, false)
RoseCore.RegisterSkill(24318, true)
RoseCore.RegisterSkill(24291, true)
RoseCore.RegisterSkill(24292, true)
RoseCore.RegisterSkill(24293, true)
RoseCore.RegisterSkill(24308, true)
RoseCore.RegisterSkill(24314, true)
RoseCore.RegisterSkill(4, false) -- sprint

local lastTargetCheck = 0
function RoseSGE.Targeting()
    RoseSGE.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    local target = MGetTarget()
    RoseSGE.PartyMembers = MEntityList("alive,chartype=4,myparty,targetable,maxdistance=30") or {} -- Adding party members to PartyMembers
    if not table.valid(target) and RoseCore.Settings.SgeEvHotbar.SmartTarget.bool then
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
            if RoseSGE.lastEnemyTargetID ~= target.id and target.attackable then
                RoseSGE.lastEnemyTarget = target
                RoseSGE.lastEnemyTargetID = target.id
            end
            if TimeSince(lastTargetCheck) > 100 then
                lastTargetCheck = Now()
            end
        elseif RoseSGE.lastEnemyTargetID then -- reset if you untarget something to prevent a hard lock with forced targeting
            RoseSGE.lastEnemyTarget = nil
            RoseSGE.lastEnemyTargetID = nil
        end
    end
end

function RoseSGE.Cast()
    SageHotbarSettings = RoseCore.Settings.SgeEvHotbar
    if RoseCore.Settings.Active then
        if Player:IsMoving() and not Player.ismounted and SageHotbarSettings.Sprint.bool then
            local sprint = ActionList:Get(1, 3)
            if RoseCore.IsReady(sprint) then
                return RoseCore.Action(sprint, Player)
            end
        end
        RoseSGE.Targeting()
        local HasTarget, target = RoseCore.HasTarget()
        RoseSGE.HasDPSTarget = HasTarget
        if HasTarget or SageHotbarSettings.HealOutsideOfCombat.bool then
            RoseSGE.CurrentDPSTarget = target
            local level = Player.level

            if SageHotbarSettings.Heal.bool then
                RoseSGE.DidAOEHeal = false
                local Heal = true
                local elist = RoseSGE.elist
                local lowcount = 0
                local lowTankHP = {}
                local lowPartyHP = {}
                local needsKardia = {}
                local totalPlayerCount = 0
                local needShieldCount = 0
                local PartyMembers, PartyMembersDead = RoseCore.Utils.GetPartyList()
                local NeedAOEHealing = 0

                -- Idk if there is a better way to do this ?
                local PlayerCountInParty = 0
                for k, v in pairs(EntityList.myparty) do
                    PlayerCountInParty = PlayerCountInParty + 1
                end

                if table.valid(PartyMembers) then
                    for i, member in pairs(PartyMembers) do
                        totalPlayerCount = totalPlayerCount + 1
                        if IsTank(member.job) and member.hp.percent < RoseCore.Settings.SgeEvTankOverhealSingle then
                            member.IsTank = true -- We store IsTank value to avoid calling it after
                            if member.hp.percent < RoseCore.Settings.SgeEvPartyOverhealSingle then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            else
                                lowTankHP[i] = member
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                        else
                            member.IsTank = false -- Storing IsTank value for optimisation, I actually don't know the performance impact of calling IsTank again and again, but for sure calling it one time and storing the value for later use is better.
                            if member.hp.percent < RoseCore.Settings.SgeEvPartyOverhealSingle then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                        end
                        local kardiatime = 0
                        if member.IsTank and RoseCore.Utils.HasTankStance(member) and MissingBuff(member, 2605) and
                            TimeSince(kardiatime) > 10000 then
                            kardiatime = Now()
                            needsKardia[i] = member
                        end

                        if member.hp.percent < 95 then
                            needShieldCount = needShieldCount + 1 -- So dumb atm, I should track if the player is already shielded but idk how to do that yet
                        end

                        -- if member.hp.percent < RoseCore.Settings.SgeEvPartyOverhealAOE then
                        --     NeedAOEHealing = NeedAOEHealing + 1
                        -- end
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
                    SageHotbarSettings.Egeiro.bool then
                    local egeiro = ActionList:Get(1, 24287)
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
                        if level >= 18 and RoseCore.Action(swiftcast) and SageHotbarSettings.Swiftcast.bool then
                            return RoseCore.Action(swiftcast, Player)
                        elseif RoseCore.IsReady(egeiro) then
                            if TimeSince(reztexttime) > 2000 then
                                SendTextCommand("/e Rezzing <t>")
                                reztexttime = Now()
                            end
                            return RoseCore.Action(egeiro, raiseTarget)
                        end
                    end
                end

                if table.valid(needsKardia) and level >= 4 and SageHotbarSettings.Kardia.bool then
                    local kardia = ActionList:Get(1, 24285)
                    if RoseCore.IsReady(kardia) then
                        return RoseCore.Action(kardia, needsKardia[next(needsKardia)])
                    end
                end
                if Player.gauge[2] <= 1 and level >= 74 and SageHotbarSettings.Rhizomata.bool then
                    local rhizomata = ActionList:Get(1, 24309)
                    if RoseCore.IsReady(rhizomata) then
                        return RoseCore.Action(rhizomata, Player)
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
                RoseSGE.PrognosisTime = 0
                if TimeSince(RoseSGE.PrognosisTime) > 2000 then
                    if level >= 50 then
                        RoseSGE.HandleAOEProtection(level, khpcount)
                    end
                    if lowcount > 0 then
                        local lowest = 0
                        local hp = 100
                        local IsTargetATank = false
                        for _, member in pairs(PartyMembers) do
                            if member.hp.percent < hp then
                                lowest = member
                                hp = member.hp.percent
                                IsTargetATank = member.IsTank
                            end
                        end

                        -- If possible, cast Zoe before doing healing as it will boost it
                        -- Also as it only work on 'spells' healing and not Ability, would probably need more checks to
                        -- make sure it's buffing something it can actually buff.
                        -- Anyway, after looking at analysis, this did improve comapred to how it was before
                        if level >= 90 and SageHotbarSettings.Zoe.bool then
                            if MissingBuff(Player, 24300) then
                                local zoe = ActionList:Get(1, 24300)
                                if RoseCore.IsReady(zoe) then
                                    return RoseCore.Action(zoe, Player)
                                end
                            end
                        end

                        if level >= 35 and MissingBuff(Player, 2610) and SageHotbarSettings.Soteria.bool then
                            local soteria = ActionList:Get(1, 24294)
                            if RoseCore.IsReady(soteria) then
                                return RoseCore.Action(soteria, Player)
                            end
                        end

                        if Heal then
                            local count = 0

                            for k, v in pairs(EntityList.myparty) do
                                count = count + 1
                                if v.hp.percent > 1 then
                                    if v.hp.percent < RoseCore.Settings.WhmEvPartyOverhealAOE then
                                        NeedAOEHealing = NeedAOEHealing + 1
                                    end
                                end
                            end

                            -- Fallback if no members, will happen in trust
                            if count == 0 then
                                for k,v in pairs(PartyMembers) do
                                    if v.hp.percent > 1 then
                                        if v.hp.percent < RoseCore.Settings.WhmEvPartyOverhealAOE then
                                            NeedAOEHealing = NeedAOEHealing + 1
                                        end
                                    end 
                                end
                            end

                            if NeedAOEHealing >= RoseSGE.GetAOECountForPartySize(PlayerCountInParty) then
                                if RoseSGE.AlreadyDidAOE <= 0 then
                                    RoseSGE.HandleAOEHealing(level, lowPartyHP, totalPlayerCount, lowest, PlayerCountInParty)
                                    if not RoseSGE.DidAOEHeal then -- Fallback if no AOE heal was done, do a single target heal
                                        RoseSGE.HandleSingleTargetHealing(level, IsTargetATank, lowest)
                                    else
                                        RoseSGE.AlreadyDidAOE = 15
                                    end
                                else
                                    RoseSGE.AlreadyDidAOE = RoseSGE.AlreadyDidAOE - 1
                                    if RoseSGE.AlreadyDidAOE <= 0 then
                                        RoseSGE.AlreadyDidAOE = 0
                                        RoseSGE.DebugPrint("AOE Unlocked again")
                                    end
                                end
                            else
                                RoseSGE.HandleSingleTargetHealing(level, IsTargetATank, lowest)
                            end
                        end

                        if table.valid(PartyMembers) and level >= 10 and SageHotbarSettings.Esuna.bool then
                            for _, member in pairs(PartyMembers) do
                                if (table.valid(member.buffs)) then
                                    for _, buff in pairs(member.buffs) do
                                        if (buff.isdebuff and buff.dispellable and buff.duration >= 2) then
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
            end
            if table.valid(RoseSGE.elist) and SageHotbarSettings.DPS.bool then
                if HasTarget then
                    RoseSGE.HandleAttack(target, level, RoseSGE.elist)
                end
            end
        end
    end
end

function RoseSGE.HandleAOEProtection(level, khpcount)
    if TensorCore and Argus and TensorCore.Avoidance.inUnavoidableAOE(Argus.getCurrentAOEs(), Player) then
        -- This part is to avoid casting a skill right before the AOE goes off as it would result of the
        -- spell being casted AFTER the AOE, so useless.
        -- This part can probably be imporved by just getting the Unavoidable and not the first one on the list only
        -- but I don't know how to do that yet.
        local ShouldCastProtection = true
        local ShouldCastShield = false
        local CurrentAoEs = Argus.getCurrentAOEs(true)
        for k, v in pairs(CurrentAoEs) do
            local ent = TensorCore.mGetEntity(v.entityID)
            local TimeUntilBoom = ent.castinginfo.casttime - ent.castinginfo.channeltime
            if TimeUntilBoom <= 0.7 then -- 0.7s or under, cast are not allowed
                ShouldCastProtection = false
            end
            break -- Only get the first one on the list, maybe CurrentAoEs[1] could work to avoid a loop ?
        end

        local shieldNeededCount = 0
        for k, v in pairs(EntityList.myparty) do
            if v.hp.percent > 1 and v.shield < 5 then
                shieldNeededCount = shieldNeededCount + 1
            end
        end
        if shieldNeededCount > 1 then
            ShouldCastShield = true
        end

        -- 3003 - 2618
        if ShouldCastProtection then
            if level >= 80 and SageHotbarSettings.Panhaima.bool and ShouldCastShield then
                local panhaima = ActionList:Get(1, 24311)
                if RoseCore.IsReady(panhaima) then
                    return RoseCore.Action(panhaima, Player)
                end
            end
            if level >= 76 and SageHotbarSettings.Holos.bool then
                -- Check if player don't already have the buff, can happen on normal raids with double sage.
                local IsPlayerAlreadyBuffed = RoseCore.Utils.GetBuff(Player, { 3003 })
                local holos = ActionList:Get(1, 24310)
                if RoseCore.IsReady(holos) and IsPlayerAlreadyBuffed == nil then
                    return RoseCore.Action(holos, Player)
                end
            end
            if Player.gauge[2] >= 1 and SageHotbarSettings.Kerachole.bool then
                -- Check if player don't already have the buff, can happen on normal raids with double sage.
                local IsPlayerAlreadyBuffed = RoseCore.Utils.GetBuff(Player, { 2618 })
                local kerachole = ActionList:Get(1, 24298)
                if RoseCore.IsReady(kerachole) and IsPlayerAlreadyBuffed == nil then
                    return RoseCore.Action(kerachole, Player)
                end
            end

            if level >= 30 then
                -- Will check if player already have holos / kerachole / or Eukrasian Prognosis
                local IsPlayerAlreadyBuffed = RoseCore.Utils.GetBuff(Player, { 3003, 2618, 2609 })
                if IsPlayerAlreadyBuffed == nil then
                    local eukrasiaBuff = RoseCore.Utils.GetBuff(Player, { 2606 }, Player)
                    if eukrasiaBuff == nil then
                        local eukrasia = ActionList:Get(1, 24290)
                        if RoseCore.IsReady(eukrasia) then
                            return RoseCore.Action(eukrasia, Player)
                        end
                    else
                        RoseSGE.DebugPrint("Casting protection EukrasianPrognosis")
                        local EukrasianPrognosis = ActionList:Get(1, 24292)
                        if RoseCore.IsReady(EukrasianPrognosis) then
                            return RoseCore.Action(EukrasianPrognosis, Player)
                        end
                    end
                end
            end
        end
    end

    -- This logic should only happen in donjon and maybe in old raids with bunch of ads ?
    -- Just mass shield / protection
    if khpcount >= 5 then
        if level >= 80 and SageHotbarSettings.Panhaima.bool then
            local panhaima = ActionList:Get(1, 24311)
            if RoseCore.IsReady(panhaima) then
                return RoseCore.Action(panhaima, Player)
            end
        end
        if level >= 76 and SageHotbarSettings.Holos.bool then
            local holos = ActionList:Get(1, 24310)
            if RoseCore.IsReady(holos) then
                return RoseCore.Action(holos, Player)
            end
        end
        if Player.gauge[2] >= 1 and SageHotbarSettings.Kerachole.bool then
            local kerachole = ActionList:Get(1, 24298)
            if RoseCore.IsReady(kerachole) then
                return RoseCore.Action(kerachole, Player)
            end
        end
    end
end




function RoseSGE.Draw()
    if (RoseSGE.GUI.open) then
        RoseSGE.GUI.visible, RoseSGE.GUI.open = GUI:Begin(RoseSGE.GUI.name, RoseSGE.GUI.open)
        if (RoseSGE.GUI.visible) then
            local value, changed = GUI:Checkbox("Debug Output", RoseSGE.Settings.Debug)
            if changed then
                RoseSGE.Settings.Debug = value
            end
        end
        GUI:End()
    end
end

-- Adds a customizable header to the top of the ffxivminion task window.
--[[function RoseSGE.DrawHeader()
 
end]]

-- Adds a customizable footer to the top of the ffxivminion task window.
--[[function RoseSGE.DrawFooter()
 
end]]

function RoseSGE.OnOpen()
    RoseSGE.GUI.open = true
end

function RoseSGE.OnLoad()
    ACR_MyProfile_MySavedVar = ACR.GetSetting("ACR_MyProfile_MySavedVar", false)
end

-- The OnClick function is fired when a user clicks on the ACR party interface.
-- It accepts 5 parameters:
-- mouse /int/ - Possible values are 0 (Left-click), 1 (Right-click), 2 (Middle-click)
-- shiftState /bool/ - Is shift currently pressed?
-- controlState /bool/ - Is control currently pressed?
-- altState /bool/ - Is alt currently pressed?
-- entity /table/ - The entity information for the party member that was clicked on.
--[[function RoseSGE.OnClick(mouse,shiftState,controlState,altState,entity)

end]]

-- The OnUpdate() function is fired on the gameloop, like any other OnUpdate function found in FFXIVMinion code.
--[[function RoseSGE.OnUpdate(event, tickcount)
 
end]]

return RoseSGE