local RoseSGE = {}

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

-- 
function RoseSGE.DebugPrint(...)
    if RoseSGE.Settings.Debug then
        d("[RoseSGE] ".. ...)
    end
end

function RoseSGE.IsReady(action)
    if action and action.cdmax - action.cd < 0.5 and (action.casttime == 0 or not Player:IsMoving()) and not (Busy() and IsMounting() and IsMounted() and IsDismounting()) then
        return true
    end
end

function RoseSGE.Action(action,target)
    if type(action) == "number" then
        action = ActionList:Get(1,action)
    end
    if not target then
        target = Player
    end
    if table.valid(action) and table.valid(target) then
        if target.x and Distance2DT(Player.pos,target) <= action.range then
            RoseSGE.DebugPrint("Casting: "..action.name)
            return action:Cast(target.x,target.y,target.z)
        else
            if target.distance2d <= action.range then
                RoseSGE.DebugPrint("Casting: "..action.name)
                return action:Cast(target.id)
            end
        end
    end
end

function RoseSGE.HasTankStance(target)
    if table.valid(target) and HasBuffs(target,"34,79,91,392,393,743,1833,2843,3124") then
        return true
    end
end

local lastTargetCheck = 0
function RoseSGE.Targeting()
    RoseSGE.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    local target = MGetTarget()
    RoseSGE.plist = MEntityList("alive,chartype=4,myparty,targetable,maxdistance=30") or {} -- Adding party members to plist
    local plist = RoseSGE.plist
    if target and target.attackable and not target.incombat then
        if Player:GetTarget() and not table.valid(plist) and actionenabled.DPS.bool and actionenabled.Dosis.bool then
            local dosis = ActionList:Get(1, 24283)
            if RoseSGE.IsReady(dosis) then
                return RoseSGE.Action(dosis,target)
            end
        end
    end
    if not table.valid(target) and RoseCore.Settings.SgeEvHotbar.SmartTarget.bool then
        local llist = MEntityList("lowesthealth,alive,attackable,maxdistance=30")
        if table.valid(llist) then
            for i,enemy in pairs(llist) do
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

--[[function RoseSGE.HealFormula(lowest,level)
    d("a")
    if not lowest then
        d("b")
        return false
    end
    local Slider = RoseCore.Settings.SgeEvTankOverhealSingle
    if not IsTank(lowest.job) then
        d("c")
        Slider = RoseCore.Settings.SgeEvPartyOverhealSingle
    end
    if level <= 89 and lowest.hp.percent <= (Slider - 10) then
        d("d")
        return true
    end
    if level <= 89 and lowest.hp.percent >= (Slider - 10) or lowest.hp.percent >= 100 then
        d("e")
        return false
    end
    if lowest.hp.percent <= 99 then
        RoseSGE.PartyBuff = 1
        RoseSGE.HealingMagicPotency1 = Player:GetStats(34)
        RoseSGE.HealingMagicPotency2 = (569 * ((HealingMagicPotency1 * PartyBuff) - 390) / 1522) + 100
        RoseSGE.Potency = 250
        RoseSGE.Determination1 = Player:GetStats(44)
        RoseSGE.Determination2 = (140 * (Determination1 - 390) / 1900 + 1000)
        RoseSGE.Healing1 = (((Potency * HealingMagicPotency2 * Determination2) / 100) / 1000)
        RoseSGE.WeaponDamage1 = Inventory:Get(1000):GetList()[1]:GetStat(12, true)
        RoseSGE.WeaponDamage2 = ((390 * 115 / 1000) + WeaponDamage1)
        RoseSGE.Healing2 = (((((Healing1 * 1000) / 1000) * WeaponDamage2) / 100) * 130) / 100
        RoseSGE.HealingPercent = (Healing2 / lowest.hp.max) * 100
        if (Slider - HealingPercent) >= lowest.hp.percent == true then
            return true
        end
    end
    return false
end]]

function RoseSGE.HealFormula(lowest,potency)
    d("a")
    if not lowest then
        d("b")
        return false
    end
    local Slider = RoseCore.Settings.SgeEvTankOverhealSingle
    if not IsTank(lowest.job) then
        d("c")
        Slider = RoseCore.Settings.SgeEvPartyOverhealSingle
    end
    d(Slider)
    d(lowest.name)
    d(lowest.hp.percent)
    if Player.level <= 89 and lowest.hp.percent <= (Slider - 10) then
        d("d")
        return true
    end
    if Player.level <= 89 and lowest.hp.percent >= (Slider - 10) or lowest.hp.percent >= 100 then
        d("e")
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

function RoseSGE.Cast()
    actionenabled = RoseCore.Settings.SgeEvHotbar
    if RoseCore.Settings.Active then
        if Player:IsMoving() and not Player.ismounted and actionenabled.Sprint.bool then
            local sprint = ActionList:Get(1, 3)
            if RoseSGE.IsReady(sprint) then
                return RoseSGE.Action(sprint,Player)
            end
        end
        RoseSGE.Targeting()
        local HasTarget, target = RoseSGE.HasTarget()
        if HasTarget or actionenabled.HealOutsideOfCombat.bool then
            local level = Player.level
            local elist = RoseSGE.elist
            if actionenabled.Heal.bool then
                local Heal = true
                local plist = RoseSGE.plist
                plist[Player.id] = Player -- Adding Player to plist
                local tlist = MEntityList("alive,targetable,type=2,chartype=9,maxdistance2d=30")
                if table.valid(tlist) then
                    for k,v in pairs(tlist) do plist[k]=v end -- adding Trust to plist
                end
                local nlist = MEntityList("alive,targetable,type=2,chartype=0,maxdistance2d=30")
                if table.valid(nlist) then
                    for k,v in pairs(nlist) do plist[k]=v end -- adding npcs to plist
                end
                RoseSGE.dplist = MEntityList("dead,friendly,chartype=4,myparty,targetable,maxdistance=30") or {} -- Adding party members to plist
                local dplist = RoseSGE.dplist
                local dtlist = MEntityList("dead,targetable,type=2,chartype=9,maxdistance2d=30")
                if table.valid(dtlist) then
                    for k,v in pairs(dtlist) do dplist[k]=v end -- adding Trust to dplist
                end
                local dnlist = MEntityList("dead,targetable,type=2,chartype=0,maxdistance2d=30")
                if table.valid(dnlist) then
                    for k,v in pairs(dnlist) do dplist[k]=v end -- adding npcs to dplist
                end
                local lowcount = 0
                local lowTankHP = {}
                local lowPartyHP = {}
                local needsKardia = {}
                if table.valid(plist) then
                    for i,member in pairs(plist) do
                        if IsTank(member.job) and member.hp.percent < 90 then
                            if member.hp.percent < 50 then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            else
                                lowTankHP[i] = member
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                        else
                            if member.hp.percent < 50 then
                                lowPartyHP[i] = member
                                lowcount = lowcount + 1
                            end
                        end
                        local kardiatime = 0
                        if RoseSGE.HasTankStance(member) and MissingBuff(member, 2605) and TimeSince(kardiatime) > 10000 then
                            kardiatime = Now()
                            needsKardia[i] = member
                        end
                    end
                end
                if not table.valid(plist) then
                    if Player.hp.percent <= 90 then
                        lowcount = 1
                    end
                end
                if level >= 14 and Player.mp.percent <= 75 then
                    local lucid = ActionList:Get(1,7562)
                    if RoseSGE.IsReady(lucid) then
                        return RoseSGE.Action(lucid,Player)
                    end
                end
                if table.valid(dplist) and Player.level >= 12 and Player.mp.percent >= 24 and actionenabled.Egeiro.bool then
                    local egeiro = ActionList:Get(1, 24287)
                    local swiftcast = ActionList:Get(1, 7561)
                    local healers,tanks,raisers,others = {},{},{},{}
                    for i,e in pairs(dplist) do
                        if IsHealer(e.job) then
                            healers[i]=e
                        elseif IsTank(e.job) then
                            tanks[i]=e
                        elseif (e.job == 27 and e.level >= 12) or (e.job == 35 and e.level >= 64) then
                            raisers[i]=e
                        else
                            others[i]=e
                        end
                    end
                    local raiseTarget
                    if table.valid(healers) then
                        for i,e in pairs(healers) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(tanks) then
                        for i,e in pairs(tanks) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(raisers) then
                        for i,e in pairs(raisers) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    elseif table.valid(others) then
                        for i,e in pairs(others) do
                            if not raiseTarget and e.distance2d <= 30 then
                                raiseTarget = e
                            end
                        end
                    end
                    if table.valid(raiseTarget) and MissingBuffs(raiseTarget,"148+1140") then
                        local reztexttime = 0
                        if level >= 18 and RoseSGE.Action(swiftcast) and actionenabled.Swiftcast.bool then
                            return RoseSGE.Action(swiftcast,Player)
                        elseif RoseSGE.IsReady(egeiro) then
                            if TimeSince(reztexttime) > 2000 then
                                SendTextCommand ("/e Rezzing <t>")
                                reztexttime = Now()
                            end
                            return RoseSGE.Action(egeiro,raiseTarget)
                        end
                    end
                end
                if table.valid(plist) and level >= 10 and actionenabled.Esuna.bool then
                    for _, member in pairs(plist) do
                        if (table.valid(member.buffs)) then
                            for _, buff in pairs(member.buffs) do
                                if (buff.isdebuff and buff.dispellable and buff.duration >= 2) then
                                    local esuna = ActionList:Get(1, 7568)
                                    if RoseSGE.IsReady(esuna) then
                                        return RoseSGE.Action(esuna,member)
                                    end
                                end
                            end
                        end
                    end
                end
                if table.valid(needsKardia) and level >= 4 and actionenabled.Kardia.bool then
                    local kardia = ActionList:Get(1, 24285)
                    if RoseSGE.IsReady(kardia) then
                        return RoseSGE.Action(kardia,needsKardia[next(needsKardia)])
                    end
                end
                if Player.gauge[2] <= 1 and level >= 74 and actionenabled.Rhizomata.bool then
                    local rhizomata = ActionList:Get(1, 24309)
                    if RoseSGE.IsReady(rhizomata) then
                        return RoseSGE.Action(rhizomata,Player)
                    end
                end
                local khpcount = 0
                if table.valid(elist) then
                    for i,e in pairs(elist) do
                        if e.distance2d <= 15 then
                            khpcount = khpcount + 1
                        end
                    end
                end
                local prognosistime = 0
                if TimeSince(prognosistime) > 2000 then
                    if level >= 50 then
                        if TensorCore and TensorCore.Avoidance.inUnavoidableAOE(Argus.getCurrentAOEs(), Player) then
                            if level >= 80 and actionenabled.Panhaima.bool then
                                local panhaima = ActionList:Get(1, 24311)
                                if RoseSGE.IsReady(panhaima) then
                                    return RoseSGE.Action(panhaima,Player)
                                end
                            end
                            if level >= 76 and actionenabled.Holos.bool then
                                local holos = ActionList:Get(1, 24310)
                                if RoseSGE.IsReady(holos) then
                                    return RoseSGE.Action(holos,Player)
                                end
                            end
                            if Player.gauge[2] >= 1 and actionenabled.Kerachole.bool then
                                local kerachole = ActionList:Get(1, 24298)
                                if RoseSGE.IsReady(kerachole) then
                                    return RoseSGE.Action(kerachole,Player)
                                end
                            end
                        end
                        if level >= 80 and khpcount >= 5 and actionenabled.Panhaima.bool then
                            local panhaima = ActionList:Get(1, 24311)
                            if RoseSGE.IsReady(panhaima) then
                                return RoseSGE.Action(panhaima,Player)
                            end
                        end
                        if level >= 76 and khpcount >= 5 and actionenabled.Holos.bool then
                            local holos = ActionList:Get(1, 24310)
                            if RoseSGE.IsReady(holos) then
                                return RoseSGE.Action(holos,Player)
                            end
                        end
                        if khpcount >= 5 and Player.gauge[2] >= 1 and actionenabled.Kerachole.bool then
                            local kerachole = ActionList:Get(1, 24298)
                            if RoseSGE.IsReady(kerachole) then
                                return RoseSGE.Action(kerachole,Player)
                            end
                        end
                    end
                    if lowcount > 0 then
                        local lowest = 0
                        local hp = 100
                        for _,member in pairs(plist) do
                            if member.hp.percent < hp then
                                lowest = member
                                hp = member.hp.percent
                            end
                        end
                        RoseSGE.DebugPrint("Lowest HP: "..hp, lowest)
                        if level >= 86 and IsTank(lowest.job) and actionenabled.Krasis.bool then
                            local krasis = ActionList:Get(1, 24317)
                            if RoseSGE.IsReady(krasis) then
                                return RoseSGE.Action(krasis,lowest)
                            end
                        end
                        if level >= 70 and IsTank(lowest.job) and actionenabled.Haima.bool then
                            local haima = ActionList:Get(1, 24305)
                            if RoseSGE.IsReady(haima) then
                                return RoseSGE.Action(haima,lowest)
                            end
                        end
                        if level >= 62 and Player.gauge[2] >= 1 and actionenabled.Taurochole.bool and Heal then
                            local taurochole = ActionList:Get(1, 24303)
                            if RoseSGE.IsReady(taurochole) then
                                if RoseSGE.HealFormula(lowest,700) then
                                    return RoseSGE.Action(taurochole,lowest)
                                end
                            end
                        end
                        if level >= 45 and Player.gauge[2] >= 1 and actionenabled.Druochole.bool and Heal then
                            local druochole = ActionList:Get(1, 24296)
                            if RoseSGE.IsReady(druochole) then
                                if RoseSGE.HealFormula(lowest,600) then
                                    return RoseSGE.Action(druochole,lowest)
                                end
                            end
                        end
                        if level >= 30 and MissingBuff(lowest,2607) and actionenabled.Eukrasia.bool and actionenabled.EukrasianDiagnosis.bool and Heal then
                            if MissingBuff(Player,2606) then
                                local eukrasia = ActionList:Get(1, 24290)
                                if RoseSGE.IsReady(eukrasia) then
                                    if RoseSGE.HealFormula(lowest,400) then
                                        return RoseSGE.Action(eukrasia,Player)
                                    end
                                end
                            end
                            local eukrasiandiagnosis = ActionList:Get(1, 24291)
                            if RoseSGE.IsReady(eukrasiandiagnosis) then
                                if RoseSGE.HealFormula(lowest,300) then
                                    return RoseSGE.Action(eukrasiandiagnosis,lowest)
                                end
                            end
                        end
                        if level >= 2 and actionenabled.Diagnosis.bool and Heal then
                            local diagnosis = ActionList:Get(1, 24284)
                            if RoseSGE.IsReady(diagnosis) then
                                if RoseSGE.HealFormula(lowest,400) then
                                    return RoseSGE.Action(diagnosis,lowest)
                                end
                            end
                        end
                        if lowcount >= 2 then
                            local pepsiscount = 0
                            local aoecount = 0
                            for i,e in pairs(lowPartyHP) do
                                if e.distance2d <= 15 and HasBuffs(e,"2607,2609") then
                                    pepsiscount = pepsiscount + 1
                                end
                                if e.distance2d <= 15 then
                                    aoecount = aoecount + 1
                                end
                            end
                            if pepsiscount >= 2 and level >= 58 and actionenabled.Pepsis.bool and Heal then
                                local pepsis = ActionList:Get(1, 24301)
                                if RoseSGE.IsReady(pepsis) then
                                    if RoseSGE.HealFormula(lowest,450) then
                                        return RoseSGE.Action(pepsis,Player)
                                    end
                                end
                            end
                            local eukrasianprognosiscount = 0
                            for i,e in pairs(lowPartyHP) do
                                if MissingBuff(e,2609) and e.distance2d <= 15 then
                                    eukrasianprognosiscount = eukrasianprognosiscount + 1
                                end
                            end
                            if level >= 60 and aoecount >= 2 and actionenabled.PhysisII.bool and Heal then
                                local physis_ii = ActionList:Get(1, 24302)
                                if RoseSGE.IsReady(physis_ii) then
                                    if RoseSGE.HealFormula(lowest,130) then
                                        return RoseSGE.Action(physis_ii,Player)
                                    end
                                end
                            end
                            if level >= 20 and level <= 59 and aoecount >= 2 and actionenabled.Physis.bool and Heal then
                                local physis = ActionList:Get(1, 24288)
                                if RoseSGE.IsReady(physis) then
                                    if RoseSGE.HealFormula(lowest,100) then
                                        return RoseSGE.Action(physis,Player)
                                    end
                                end
                            end
                            if level >= 52 and Player.gauge[2] >= 1 and aoecount >= 2 and actionenabled.Ixochole.bool and Heal then
                                local ixochole = ActionList:Get(1, 24299)
                                if RoseSGE.IsReady(ixochole) then
                                    if RoseSGE.HealFormula(lowest,400) then
                                        return RoseSGE.Action(ixochole,Player)
                                    end
                                end
                            end
                            if level >= 30 and aoecount >= 2 and eukrasianprognosiscount >= 2 and actionenabled.Eukrasia.bool and actionenabled.EukrasianPrognosis.bool and Heal then
                                if MissingBuff(Player,2606) then
                                    local eukrasia = ActionList:Get(1, 24290)
                                    if RoseSGE.IsReady(eukrasia) then
                                        if RoseSGE.HealFormula(lowest,100) then
                                            return RoseSGE.Action(eukrasia,Player)
                                        end
                                    end
                                end
                                local eukrasianprognosis = ActionList:Get(1, 24292)
                                if RoseSGE.IsReady(eukrasianprognosis) then
                                    if RoseSGE.HealFormula(lowest,100) then
                                        return RoseSGE.Action(eukrasianprognosis,Player)
                                    end
                                end
                            end
                            if level >= 10 and aoecount >= 2 and actionenabled.Prognosis.bool and Heal then
                                local prognosis = ActionList:Get(1, 24286)
                                if RoseSGE.IsReady(prognosis) then
                                    if RoseSGE.HealFormula(lowest,300) then
                                        prognosistime = Now()
                                        return RoseSGE.Action(prognosis,Player)
                                    end
                                end
                            end
                        end
                    end
                end
                if lowcount > 0 then
                    if level >= 35 and MissingBuff(Player,2610) and actionenabled.Soteria.bool then
                        local soteria = ActionList:Get(1, 24294)
                        if RoseSGE.IsReady(soteria) then
                            return RoseSGE.Action(soteria,Player)
                        end
                    end
                end
            end
            local missingDosis = {}
            local allHasBuff = true
            if table.valid(elist) and actionenabled.DPS.bool then
                for i,enemy in pairs(elist) do
                    if MissingBuffs(enemy,"2614+2615+2616") then
                        allHasBuff = false
                        missingDosis[i]=enemy
                    end
                end
                if allHasBuff then
                    local llist = MEntityList("lowesthealth,alive,attackable,aggro,maxdistance2d=30")
                    if table.valid(llist) then
                        for i,enemy in pairs(llist) do
                            -- d("2Targeting "..tostring(i))
                            Player:SetTarget(i)
                        end
                    end
                elseif table.valid(missingDosis) then
                    local id = next(missingDosis)
                    local entity = missingDosis[id]
                    if level >= 30 and actionenabled.Eukrasia.bool then
                        if MissingBuff(Player,2606) then
                            local eukrasia = ActionList:Get(1, 24290)
                            if RoseSGE.IsReady(eukrasia) then
                                return RoseSGE.Action(eukrasia,Player)
                            end
                        end
                        if level >= 82 and actionenabled.EukrasianDosisIII.bool and actionenabled.Eukrasia.bool then
                            local eukrasiandosis_iii = ActionList:Get(1, 24314)
                            if RoseSGE.IsReady(eukrasiandosis_iii) then
                                return RoseSGE.Action(eukrasiandosis_iii,entity)
                            end
                        end
                        if level >= 72 and level <= 81 and actionenabled.EukrasianDosisII.bool and actionenabled.Eukrasia.bool then
                            local eukrasiandosis_ii = ActionList:Get(1, 24308)
                            if RoseSGE.IsReady(eukrasiandosis_ii) then
                                return RoseSGE.Action(eukrasiandosis_ii,entity)
                            end
                        end
                        if level >= 30 and level <= 71 and actionenabled.EukrasianDosis.bool and actionenabled.Eukrasia.bool then
                            local eukrasiandosis = ActionList:Get(1, 24293)
                            if RoseSGE.IsReady(eukrasiandosis) then
                                return RoseSGE.Action(eukrasiandosis,entity)
                            end
                        end
                    end
                end
                if HasTarget then
                    local enemycount = 0
                    local pneumacount = 0
                    for i, e in pairs(elist) do
                        if e.distance2d <= 25 then
                            if e.distance2d <= 5 then
                                enemycount = enemycount + 1
                                pneumacount = pneumacount + 1
                            end
                        end
                    end
                    if pneumacount <= 1 and level >= 90 and actionenabled.Zoe.bool and actionenabled.Pneuma.bool then
                        if MissingBuff(Player, 24300) and level >= 90 then
                            local zoe = ActionList:Get(1, 24300)
                            if RoseSGE.IsReady(zoe) then
                                return RoseSGE.Action(zoe, Player)
                            end
                        end
                        local pneuma = ActionList:Get(1, 24318)
                        if RoseSGE.IsReady(pneuma) then
                            return RoseSGE.Action(pneuma, target)
                        end
                    end
                    if enemycount >= 1 then
                        if level >= 82 and actionenabled.PhlegmaIII.bool then
                            local phlegma_iii = ActionList:Get(1, 24313)
                            if phlegma_iii.cd == 0 or phlegma_iii.cd >= 45 then
                                return RoseSGE.Action(phlegma_iii, target)
                            end
                        end
                        if level >= 72 and level <= 81 and actionenabled.PhlegmaII.bool then
                            local phlegma_ii = ActionList:Get(1, 24307)
                            if phlegma_ii.cd == 0 or phlegma_ii.cd >= 45 then
                                return RoseSGE.Action(phlegma_ii, target)
                            end
                        end
                        if level >= 26 and level <= 71 and actionenabled.Phlegma.bool then
                            local phlegma = ActionList:Get(1, 24289)
                            if phlegma.cd == 0 or phlegma.cd >= 45 then
                                return RoseSGE.Action(phlegma, target)
                            end
                        end
                    end
                    if enemycount >= 2 then
                        if Player.gauge[3] >= 1 then
                            if level >= 82 and actionenabled.ToxikonII.bool then
                                local toxikon_ii = ActionList:Get(1, 24316)
                                if RoseSGE.IsReady(toxikon_ii) then
                                    return RoseSGE.Action(toxikon_ii, target)
                                end
                            end
                            if level >= 66 and level <= 81 and actionenabled.Toxikon.bool then
                                local toxikon = ActionList:Get(1, 24304)
                                if RoseSGE.IsReady(toxikon) then
                                    return RoseSGE.Action(toxikon, target)
                                end
                            end
                        end
                        if level >= 82 and actionenabled.DyskrasiaII.bool then
                            local dyskrasia_ii = ActionList:Get(1, 24315)
                            if RoseSGE.IsReady(dyskrasia_ii) then
                                return RoseSGE.Action(dyskrasia_ii, Player)
                            end
                        end
                        if level >= 46 and level <= 81 and actionenabled.Dyskrasia.bool then
                            local dyskrasia = ActionList:Get(1, 24297)
                            if RoseSGE.IsReady(dyskrasia) then
                                return RoseSGE.Action(dyskrasia, Player)
                            end
                        end
                    end
                    if level >= 82 and actionenabled.DosisIII.bool then
                        local dosis_iii = ActionList:Get(1, 24312)
                        if RoseSGE.IsReady(dosis_iii) then
                            return RoseSGE.Action(dosis_iii, target)
                        end
                    end
                    if level >= 72 and level <= 81 and actionenabled.DosisII.bool then
                        local dosis_ii = ActionList:Get(1, 24306)
                        if RoseSGE.IsReady(dosis_ii) then
                            return RoseSGE.Action(dosis_ii, target)
                        end
                    end
                    if level >= 1 and level <= 71 and actionenabled.Dosis.bool then
                        local dosis = ActionList:Get(1, 24283)
                        if RoseSGE.IsReady(dosis) then
                            return RoseSGE.Action(dosis, target)
                        end
                    end
                end
            end
        end
    end
end

function RoseSGE.Draw()
    if (RoseSGE.GUI.open) then	
	    RoseSGE.GUI.visible, RoseSGE.GUI.open = GUI:Begin(RoseSGE.GUI.name, RoseSGE.GUI.open)
	    if ( RoseSGE.GUI.visible ) then
            local value,changed = GUI:Checkbox("Debug Output", RoseSGE.Settings.Debug)
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
    ACR_MyProfile_MySavedVar = ACR.GetSetting("ACR_MyProfile_MySavedVar",false)
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