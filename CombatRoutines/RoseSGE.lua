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

RoseSGE.Skills = {}
RoseSGE.PrognosisTime = 0
RoseSGE.DidAOEHeal = false
RoseSGE.CurrentDPSTarget = 0
RoseSGE.HasDPSTarget = false

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

function RoseSGE.GetSkill(SkillID)
    if not SkillID then
        return nil
    end
    if not RoseSGE.Skills[SkillID] then
        RoseSGE.DebugPrint("Skill not found: " .. tostring(SkillID))
    else
        return RoseSGE.Skills[SkillID]
    end
end

-- Need to make that on RoseCore so it can be used for all ACR, will change that later on
-- This utils function register a skill and save some data so we don't have to request it everytime
function RoseSGE.RegisterSkill(SkillID, isGCD)
    local action = ActionList:Get(1, SkillID)
    if action then
        RoseSGE.Skills[SkillID] = {
            Name = action.name,
            ID = SkillID,
            IsGCD = isGCD,
            level = action.level,
            range = action.range,
            radius = action.radius,
        }
        RoseSGE.DebugPrint("Registered Skill: " .. action.name .. " (" .. SkillID .. ")")
    else
        RoseSGE.DebugPrint("Action with ID " .. SkillID .. " could not be find, is it valid ? Report to a dev.")
    end
end

RoseSGE.RegisterSkill(24283, true)
RoseSGE.RegisterSkill(7562, false)
RoseSGE.RegisterSkill(24285, false)
RoseSGE.RegisterSkill(24286, true)
RoseSGE.RegisterSkill(24287, true)
RoseSGE.RegisterSkill(24288, false)
RoseSGE.RegisterSkill(24289, true)
RoseSGE.RegisterSkill(24290, true)
RoseSGE.RegisterSkill(24294, false)
RoseSGE.RegisterSkill(24295, false)
RoseSGE.RegisterSkill(24296, false)
RoseSGE.RegisterSkill(24297, true)
RoseSGE.RegisterSkill(24298, false)
RoseSGE.RegisterSkill(24299, false)
RoseSGE.RegisterSkill(24300, false)
RoseSGE.RegisterSkill(24301, false)
RoseSGE.RegisterSkill(24302, false)
RoseSGE.RegisterSkill(24303, false)
RoseSGE.RegisterSkill(24304, true)
RoseSGE.RegisterSkill(24305, false)
RoseSGE.RegisterSkill(24306, true)
RoseSGE.RegisterSkill(24307, true)
RoseSGE.RegisterSkill(24309, false)
RoseSGE.RegisterSkill(24310, false)
RoseSGE.RegisterSkill(24311, false)
RoseSGE.RegisterSkill(24312, true)
RoseSGE.RegisterSkill(24313, true)
RoseSGE.RegisterSkill(24315, true)
RoseSGE.RegisterSkill(24316, true)
RoseSGE.RegisterSkill(24317, false)
RoseSGE.RegisterSkill(24318, true)
RoseSGE.RegisterSkill(24291, true)
RoseSGE.RegisterSkill(24292, true)
RoseSGE.RegisterSkill(24293, true)
RoseSGE.RegisterSkill(24308, true)
RoseSGE.RegisterSkill(24314, true)
RoseSGE.RegisterSkill(4, false) -- sprint

-- I'm using 24283 (Dosis) as a reference for CD, it's the same for all spells, so it's safe to use it
-- So yeah this is the Weaving logic, working great for me, but I'm not sure if it's the best way to do it.
function RoseSGE.CanUseOGCD()
    local BaseAction = ActionList:Get(1, 24283)
    if BaseAction then
        if BaseAction.cd ~= nil or BaseAction.cd ~= 0 then
            local cdOn100 = (BaseAction.cd * 100) / BaseAction.cdmax
            if cdOn100 <= 40 then -- 40% of the CD is left
                return true
            else
                return false
            end
        else
            return false
        end
    else
        -- How ??
    end
end

function RoseSGE.IsSkillGDC(SkillID)
    if SkillID == nil then
        return false
    end
    if RoseSGE.Skills[SkillID] == nil then
        return true -- GCD by default
    end
    if RoseSGE.Skills[SkillID].IsGCD then
        return true
    end
    return false
end

function RoseSGE.IsReady(action)
    if action and (action.casttime == 0 or not Player:IsMoving()) and
        not (Busy() and IsMounting() and IsMounted() and IsDismounting()) then
        local CanUseOGCD = RoseSGE.CanUseOGCD()
        if RoseSGE.IsSkillGDC(action.id) then -- GCD
            if not CanUseOGCD then
                if action.cd == nil or action.cd == 0 then
                    return true
                end
            end
        else -- OGCD
            if CanUseOGCD then
                if action.cd == nil or action.cd == 0 then
                    return true
                end
            end
        end
    end
end

function RoseSGE.Action(action, target)
    if type(action) == "number" then
        action = ActionList:Get(1, action)
    end
    if not target then
        target = Player
    end
    if table.valid(action) and table.valid(target) then
        if target.x and Distance2DT(Player.pos, target) <= action.range then
            RoseSGE.DebugPrint("Casting: " .. action.name)
            return action:Cast(target.x, target.y, target.z)
        else
            if target.distance2d <= action.range then
                RoseSGE.DebugPrint("Casting: " .. action.name)
                return action:Cast(target.id)
            end
        end
    end
end


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

function RoseSGE.HealFormula(lowest, potency)
    --RoseSGE.DebugPrint("Entering healing formula")
    if not lowest then
        --RoseSGE.DebugPrint("Not lowest")
        return false
    end
    local Slider = RoseCore.Settings.SgeEvTankOverhealSingle
    if not IsTank(lowest.job) then
        --RoseSGE.DebugPrint("Target to heal is not a tank, using RoseCore.Settings.SgeEvPartyOverhealSingle")
        Slider = RoseCore.Settings.SgeEvPartyOverhealSingle
    end
    --RoseSGE.DebugPrint("Healing value: ".. Slider)
    --RoseSGE.DebugPrint("Healing target name: ".. lowest.name)
    --RoseSGE.DebugPrint("Healing target HP: ".. lowest.hp.percent)
    if Player.level <= 89 and lowest.hp.percent <= (Slider - 10) then
        --RoseSGE.DebugPrint("Healing target HP is below ".. Slider - 10 .."%, returning true")
        return true
    end
    if Player.level <= 89 and lowest.hp.percent >= (Slider - 10) or lowest.hp.percent >= 100 then
        --RoseSGE.DebugPrint("Healing target HP is above ".. Slider - 10 .."% or HP is 100%, returning false")
        return false
    end
    if lowest.hp.percent <= 99 then
        RoseSGE.PartyBuff = 1
        RoseSGE.HealingMagicPotency1 = Player:GetStats(34)
        RoseSGE.HealingMagicPotency2 = (569 * ((RoseSGE.HealingMagicPotency1 * RoseSGE.PartyBuff) - 390) / 1522) + 100
        RoseSGE.Determination1 = Player:GetStats(44)
        RoseSGE.Determination2 = (140 * (RoseSGE.Determination1 - 390) / 1900 + 1000)
        RoseSGE.Healing1 = (((potency * RoseSGE.HealingMagicPotency2 * RoseSGE.Determination2) / 100) / 1000)
        RoseSGE.WeaponDamage1 = Inventory:Get(1000):GetList()[1]:GetStat(12, true)
        RoseSGE.WeaponDamage2 = ((390 * 115 / 1000) + RoseSGE.WeaponDamage1)
        RoseSGE.Healing2 = (((((RoseSGE.Healing1 * 1000) / 1000) * RoseSGE.WeaponDamage2) / 100) * 130) / 100
        RoseSGE.HealingPercent = (RoseSGE.Healing2 / lowest.hp.max) * 100
        if (Slider - RoseSGE.HealingPercent) >= lowest.hp.percent == true then
            return true
        end
    end
    return false
end

function RoseSGE.HasTarget()
    local target = MGetTarget()
    if table.valid(target) and target.incombat then
        return true, target
    else
        return false, target
    end
end

function RoseSGE.Cast()
    SageHotbarSettings = RoseCore.Settings.SgeEvHotbar
    if RoseCore.Settings.Active then
        if Player:IsMoving() and not Player.ismounted and SageHotbarSettings.Sprint.bool then
            local sprint = ActionList:Get(1, 3)
            if RoseSGE.IsReady(sprint) then
                return RoseSGE.Action(sprint, Player)
            end
        end
        RoseSGE.Targeting()
        local HasTarget, target = RoseSGE.HasTarget()
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
                local shouldCastProtectionDueToCount = false -- xD longer next time
                local PartyMembers, PartyMembersDead = RoseSGE.Utils.GetPartyList()
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
                        if member.IsTank and RoseSGE.Utils.HasTankStance(member) and MissingBuff(member, 2605) and
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

                -- This is to check if at least 30% of the party is below 95% HP, if so, we should cast protection or AOE
                -- This is to avoid casting protection when it's not needed, but it's not 100% accurate
                -- For now there is no way (As far as I know) to check player shield (not buff, actual shield),
                -- Will have to make our own logic for that to improve this
                -- For now this logic is OFF until I find a real way to check entity shield
                --if (needShieldCount * 100) / PlayerCountInParty > 30 then
                shouldCastProtectionDueToCount = true
                --end

                if not table.valid(PartyMembers) then
                    if Player.hp.percent <= 90 then
                        lowcount = 1
                    end
                end
                if level >= 14 and Player.mp.percent <= 80 then
                    local lucid = ActionList:Get(1, 7562)
                    if RoseSGE.IsReady(lucid) then
                        return RoseSGE.Action(lucid, Player)
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
                        if level >= 18 and RoseSGE.Action(swiftcast) and SageHotbarSettings.Swiftcast.bool then
                            return RoseSGE.Action(swiftcast, Player)
                        elseif RoseSGE.IsReady(egeiro) then
                            if TimeSince(reztexttime) > 2000 then
                                SendTextCommand("/e Rezzing <t>")
                                reztexttime = Now()
                            end
                            return RoseSGE.Action(egeiro, raiseTarget)
                        end
                    end
                end

                if table.valid(needsKardia) and level >= 4 and SageHotbarSettings.Kardia.bool then
                    local kardia = ActionList:Get(1, 24285)
                    if RoseSGE.IsReady(kardia) then
                        return RoseSGE.Action(kardia, needsKardia[next(needsKardia)])
                    end
                end
                if Player.gauge[2] <= 1 and level >= 74 and SageHotbarSettings.Rhizomata.bool then
                    local rhizomata = ActionList:Get(1, 24309)
                    if RoseSGE.IsReady(rhizomata) then
                        return RoseSGE.Action(rhizomata, Player)
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
                    if level >= 50 and shouldCastProtectionDueToCount then
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
                                if RoseSGE.IsReady(zoe) then
                                    return RoseSGE.Action(zoe, Player)
                                end
                            end
                        end

                        if level >= 35 and MissingBuff(Player, 2610) and SageHotbarSettings.Soteria.bool then
                            local soteria = ActionList:Get(1, 24294)
                            if RoseSGE.IsReady(soteria) then
                                return RoseSGE.Action(soteria, Player)
                            end
                        end

                        if Heal then
                            for k, v in pairs(EntityList.myparty) do
                                if v.hp.percent > 1 then
                                    if v.hp.percent + v.shield < RoseCore.Settings.SgeEvPartyOverhealAOE then
                                        NeedAOEHealing = NeedAOEHealing + 1
                                    end
                                end
                            end
                            if NeedAOEHealing >= RoseSGE.GetAOECountForPartySize(PlayerCountInParty) then
                                RoseSGE.HandleAOEHealing(level, lowPartyHP, totalPlayerCount, lowest, PlayerCountInParty)
                                if not RoseSGE.DidAOEHeal then -- Fallback if no AOE heal was done, do a single target heal
                                    RoseSGE.HandleSingleTargetHealing(level, IsTargetATank, lowest)
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
                                            if RoseSGE.IsReady(esuna) then
                                                return RoseSGE.Action(esuna, member)
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
                if RoseSGE.IsReady(panhaima) then
                    return RoseSGE.Action(panhaima, Player)
                end
            end
            if level >= 76 and SageHotbarSettings.Holos.bool then
                -- Check if player don't already have the buff, can happen on normal raids with double sage.
                local IsPlayerAlreadyBuffed = RoseSGE.Utils.GetBuff(Player, { 3003 })
                local holos = ActionList:Get(1, 24310)
                if RoseSGE.IsReady(holos) and IsPlayerAlreadyBuffed == nil then
                    return RoseSGE.Action(holos, Player)
                end
            end
            if Player.gauge[2] >= 1 and SageHotbarSettings.Kerachole.bool then
                -- Check if player don't already have the buff, can happen on normal raids with double sage.
                local IsPlayerAlreadyBuffed = RoseSGE.Utils.GetBuff(Player, { 2618 })
                local kerachole = ActionList:Get(1, 24298)
                if RoseSGE.IsReady(kerachole) and IsPlayerAlreadyBuffed == nil then
                    return RoseSGE.Action(kerachole, Player)
                end
            end

            if level >= 30 then
                -- Will check if player already have holos / kerachole / or Eukrasian Prognosis
                local IsPlayerAlreadyBuffed = RoseSGE.Utils.GetBuff(Player, { 3003, 2618, 2609 })
                if IsPlayerAlreadyBuffed == nil then
                    local eukrasiaBuff = RoseSGE.Utils.GetBuff(Player, { 2606 }, Player)
                    if eukrasiaBuff == nil then
                        local eukrasia = ActionList:Get(1, 24290)
                        if RoseSGE.IsReady(eukrasia) then
                            return RoseSGE.Action(eukrasia, Player)
                        end
                    else
                        RoseSGE.DebugPrint("Casting protection EukrasianPrognosis")
                        local EukrasianPrognosis = ActionList:Get(1, 24292)
                        if RoseSGE.IsReady(EukrasianPrognosis) then
                            return RoseSGE.Action(EukrasianPrognosis, Player)
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
            if RoseSGE.IsReady(panhaima) then
                return RoseSGE.Action(panhaima, Player)
            end
        end
        if level >= 76 and SageHotbarSettings.Holos.bool then
            local holos = ActionList:Get(1, 24310)
            if RoseSGE.IsReady(holos) then
                return RoseSGE.Action(holos, Player)
            end
        end
        if Player.gauge[2] >= 1 and SageHotbarSettings.Kerachole.bool then
            local kerachole = ActionList:Get(1, 24298)
            if RoseSGE.IsReady(kerachole) then
                return RoseSGE.Action(kerachole, Player)
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