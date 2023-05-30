-- This is RoseWHM, a White Mage ACR for MMOMinion for FFXIV

-- Define the RoseWHM table
local RoseWHM = {}

-- Set up RoseWHM settings
RoseWHM.Settings = {
    AOE = true,
    Debug = true,
}

-- Set up RoseWHM GUI
RoseWHM.GUI = {
    Open = false,
    Visible = false,
    Name = "RoseWHM",
    Height = 200,
    Width = 200,
}

-- Set up RoseWHM classes
RoseWHM.classes = {
    [FFXIV.JOBS.WHITEMAGE] = true,
    [FFXIV.JOBS.CONJURER] = true,
}

-- Set up RoseWHM ogcd table
RoseWHM.oGCD = {
    PresenceOfMind = {id = 136, level = 30, name = "Presence of Mind", cast = 0, recast = 150, mp = 0, range = 0, radius = 0},
    Assize = {id = 3571, level = 56, name = "Assize", cast = 0, recast = 40, mp = 0, range = 0, radius = 15},
    Benediction = {id = 140, level = 50, name = "Benediction", cast = 0, recast = 180, mp = 0, range = 30, radius = 0},
    Tetragrammaton = {id = 3570, level = 60, name = "Tetragrammaton", cast = 0, recast = 60, mp = 0, range = 30, radius = 0},
    DivineBenison = {id = 7432, level = 66, name = "Divine Benison", cast = 0, recast = 30, mp = 0, range = 30, radius = 0},
    Aquaveil = {id = 25861, level = 86, name = "Aquaveil", cast = 0, recast = 60, mp = 0, range = 30, radius = 0},
    Asylum = {id = 3569, level = 52, name = "Asylum", cast = 0, recast = 90, mp = 0, range = 30, radius = 5},
    PlaneryIndulgence = {id = 7433, level = 70, name = "Plenary Indulgence", cast = 0, recast = 60, mp = 0, range = 0, radius = 20},
    Temperance = {id = 16536, level = 80, name = "Temperance", cast = 0, recast = 120, mp = 0, range = 0, radius = 0},
    LiturgyOfTheBell = {id = 25862, level = 90, name = "Liturgy of the Bell", cast = 0, recast = 180, mp = 0, range = 30, radius = 0},
    ThinAir = {id = 3573, level = 52, name = "Thin Air", cast = 0, recast = 120, mp = 0, range = 0, radius = 0},
    Swiftcast = {id = 7561, level = 18, name = "Swiftcast", cast = 0, recast = 60, mp = 0, range = 0, radius = 0},
    Surecast = {id = 7562, level = 44, name = "Surecast", cast = 0, recast = 30, mp = 0, range = 0, radius = 0},
    LucidDreaming = {id = 7562, level = 24, name = "Lucid Dreaming", cast = 0, recast = 60, mp = 0, range = 0, radius = 0}
}

-- Set up RoseWHM instant table
RoseWHM.instant = {
    Dia = {id = 16532, level = 72, name = "Dia", cast = 0, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 60, duration = 30},
    AeroII = {id = 132, level = 52, name = "Aero II", cast = 0, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 50, duration = 24},
    Aero = {id = 121, level = 46, name = "Aero", cast = 0, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 50, duration = 18},
    AfflatusMisery = {id = 16535, level = 74, name = "Afflatus Misery", cast = 0, recast = 2.5, mp = 0, range = 25, radius = 5, potency = 1240},
    Regen = {id = 137, level = 35, name = "Regen", cast = 0, recast = 2.5, mp = 700, range = 30, radius = 0, potency = 150, duration = 18},
    AfflatusSolace = {id = 16531, level = 72, name = "Afflatus Solace", cast = 0, recast = 2.5, mp = 0, range = 30, radius = 0, potency = 700},
    AfflatusRapture = {id = 16534, level = 76, name = "Afflatus Rapture", cast = 0, recast = 2.5, mp = 0, range = 0, radius = 20, potency = 400},
}

-- Set up RoseWHM gcd table
RoseWHM.gcd = {
    GlareIII = {id = 25859, level = 82, name = "Glare III", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 310},
    Glare = {id = 16533, level = 72, name = "Glare", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 290},
    StoneIV = {id = 7431, level = 64, name = "Stone IV", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 260},
    StoneIII = {id = 3568, level = 54, name = "Stone III", cast = 1.5, recast = 2.5, mp = 300, range = 25, radius = 0, potency = 220},
    StoneII = {id = 3567, level = 40, name = "Stone II", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 170},
    Stone = {id = 3566, level = 1, name = "Stone", cast = 1.5, recast = 2.5, mp = 100, range = 25, radius = 0, potency = 140},
    HolyIII = {id = 25860, level = 82, name = "Holy III", cast = 2.5, recast = 2.5, mp = 400, range = 0, radius = 8, potency = 150},
    Holy = {id = 139, level = 45, name = "Holy", cast = 2.5, recast = 2.5, mp = 200, range = 0, radius = 8, potency = 140},
    CureIII = {id = 131, level = 40, name = "Cure III", cast = 2, recast = 2.5, mp = 800, range = 30, radius = 0, potency = 550},
    CureII = {id = 135, level = 30, name = "Cure II", cast = 2, recast = 2.5, mp = 600, range = 30, radius = 0, potency = 700},
    Cure = {id = 120, level = 2, name = "Cure", cast = 2, recast = 2.5, mp = 400, range = 30, radius = 0, potency = 450},
    MedicaII = {id = 133, level = 50, name = "Medica II", cast = 2.5, recast = 2.5, mp = 1500, range = 30, radius = 15, potency = 200},
    Medica = {id = 124, level = 15, name = "Medica", cast = 2.5, recast = 2.5, mp = 900, range = 30, radius = 15, potency = 300},
    Raise = {id = 125, level = 18, name = "Raise", cast = 8, recast = 2.5, mp = 2400, range = 30, radius = 0, potency = 200},
    Esuna = {id = 3575, level = 22, name = "Esuna", cast = 1.5, recast = 2.5, mp = 600, range = 30, radius = 0, potency = 0},
}

-- Define Buff ID Table
-- TODO: Add more buffs
local buffIDTable = {
    Aero = 143,
    AeroII = 144,
    Dia = 1871,
}

-- Define a function to check if a table contains a value
function table.contains(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Define a function to get the role by job
function RoseWHM.GetRoleByJob(job)
    local tankJobs = {1, 3, 19, 21, 32, 37}
    if table.contains(tankJobs, job) then
        return "tank"
    end
    local healerJobs = {24, 28, 33, 34, 35, 36}
    if table.contains(healerJobs, job) then
        return "healer"
    end
    local meleeDPSJobs = {4, 5, 6, 7, 29, 30, 31}
    if table.contains(meleeDPSJobs, job) then
        return "melee"
    end
    local rangedDPSJobs = {2, 22, 23, 38, 39}
    if table.contains(rangedDPSJobs, job) then
        return "ranged"
    end
    local casterDPSJobs = {8, 9, 10, 11, 12, 13, 14, 15, 16, 27}
    if table.contains(casterDPSJobs, job) then
        return "caster"
    end
    return "none"
end

-- Define a function to check if DoT should be applied
function RoseWHM.ShouldApplyDoT(enemies)
    local playerId = Player.id
    local Aero = buffIDTable.Aero
    local AeroII = buffIDTable.AeroII
    local Dia = buffIDTable.Dia
    if not enemies then
        return false, nil
    end
    for _, enemy in pairs(enemies) do
        local hasDoTBuff = false
        for _, buff in pairs(enemy.buffs) do
            if (buff.id == Aero or buff.id == AeroII or buff.id == Dia) and tonumber(buff.ownerid) == tonumber(playerId) then
                hasDoTBuff = true
                if buff.duration <= 3 then
                    return true, enemy
                end
                break
            end
        end
        if not hasDoTBuff then
            return true, enemy
        end
    end
    return false, nil
end

-- Define a function to check if an action is ready
function RoseWHM.ActionIsReady(id)
    if (MIsLoading() or not ActionList:IsReady()) then
        return false
    end
    local ids = tonumber(id) or 0
    local action = ActionList:Get(1, ids)
    if (table.valid(action)) then
        local isOffCooldown = action.cd <= 0
        local currentMP = Player.mp.current
        local hasEnoughResources = currentMP >= action.cost
        return isOffCooldown and hasEnoughResources
    end
    return false
end

-- Define a function to cast a spell if it's ready
-- Returns true if the spell was cast
-- Returns false if the spell was not cast
-- Returns nil if the spell is not valid
-- Returns nil if the spell is not ready
function RoseWHM.CastSpellIfReady(spellId, targetId)
    if not spellId then
        d("Spell is not valid")
        return nil
    end
    if not targetId then
        d("Target is not valid")
        targetId = Player.id
    end
    local action = ActionList:Get(1, spellId)
    if action then
        if action.cd <= 0 then
            if RoseWHM.ActionIsReady(spellId) then
                if spellId == RoseWHM.oGCD.LiturgyOfTheBell.id or spellId == RoseWHM.oGCD.Asylum.id then
                    d("Casting " .. action.name .. " on " .. targetId .. " at " .. tostring(Player.pos.x) .. ", " .. tostring(Player.pos.y) .. ", " .. tostring(Player.pos.z))
                    return action:Cast(Player.pos.x,Player.pos.y,Player.pos.z)
                else
                    return action:Cast(targetId)
                end
            end
        end
        return false
    end
    return nil
end

-- Define a function to get the best revive target
function RoseWHM.GetBestRevive(party, role)
    party = IsNull(party, false)
    role = role or ""
    range = 30
    local el
    if (party) then
        el = MEntityList("myparty,friendly,chartype=4,targetable,dead,maxdistance=" .. tostring(range))
    else
        el = MEntityList("friendly,dead,chartype=4,targetable,maxdistance=" .. tostring(range))
    end
    if (table.valid(el)) then
        local roleTable = GetRoleTable(role)
        for _, entity in pairs(el) do
            if (not HasBuffs(entity, "148") and (not roleTable or roleTable[entity.job])) then
                return entity
            end
        end
    end
    return nil
end

-- Define a function to get dead party members
function RoseWHM.GetDeadPartyMembers()
    local deadMembers = {}
    local party = EntityList("type=1,chartype=4")
    for _, member in pairs(party) do
        if member.hp.percent == 0 then
            deadMembers[member.id] = member
        end
    end
    return deadMembers
end

-- Define a function to handle raises
-- Cast Swiftcast before Raise
-- Never cast Raise if Swiftcast is on cooldown
-- Never cast Raise if the target is out of range
-- Never cast Raise if the target is not dead
function RoseWHM.HandleRaise()
    local deadMembers = RoseWHM.GetDeadPartyMembers()
    if table.valid(deadMembers) then
        local target = RoseWHM.GetBestRevive(true)
        if target then
            local targetId = target.id
            local raiseId = RoseWHM.gcd.Raise.id
            local swiftcastId = RoseWHM.oGCD.Swiftcast.id
            if target.distance2d <= 30 then
                if RoseWHM.ActionIsReady(swiftcastId) then
                    RoseWHM.CastSpellIfReady(swiftcastId, targetId)
                    local swiftcastApplied = false
                    while not swiftcastApplied do
                        local swiftcastBuff = HasBuff(Player,167)
                        if swiftcastBuff then
                            swiftcastApplied = true
                            RoseWHM.CastSpellIfReady(raiseId, targetId)
                        end
                    end
                else
                    RoseWHM.CastSpellIfReady(raiseId, targetId)
                end
            end
        end
    end
end

local lastTargetCheck = 0

-- Define a function for targeting
function RoseWHM.Targeting()
    RoseWHM.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    RoseWHM.strikingDummy = MEntityList("contentid=541")
    local target = MGetTarget()
    if not table.valid(target) then
        local llist = MEntityList("lowesthealth,alive,attackable,maxdistance=30")
        if table.valid(llist) then
            for i, enemy in pairs(llist) do
                if enemy.incombat then
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
        elseif RoseWHM.lastEnemyTargetID then
            RoseWHM.lastEnemyTarget = nil
            RoseWHM.lastEnemyTargetID = nil
        end
    end
    return target
end

-- Define a function to get the party member list
-- Add a separate list for trusts
-- Insert player into the party member list
-- Only count player once
function RoseWHM.GetPartyMembers()
    local partyMembers = MEntityList("alive,chartype=4,myparty,targetable,maxdistance=30") or {}
    if table.valid(partyMembers) then
        for k, v in pairs(partyMembers) do
            partyMembers[k] = v
        end
    end
    local trusts = MEntityList("alive,targetable,type=2,chartype=9,maxdistance2d=30")
    if table.valid(trusts) then
        for k, v in pairs(trusts) do
            partyMembers[k] = v
        end
    end
    return partyMembers
end

-- Define a function to use Sprint
-- Add this into a function to check if the player is moving
function RoseWHM.UseSprint()
    local sprintId = 3
    local sprintAction = ActionList:Get(1, sprintId)
    local playerIsMoving = Player:IsMoving()
    if sprintAction then
        local sprintRecastTime = sprintAction.cd
        if sprintRecastTime == 0 and sprintAction:IsReady() and playerIsMoving then
            sprintAction:Cast(Player.id)
            return true
        end
    end
    return false
end

-- Define a function to check for buffs
function RoseWHM.HasBuff(target, buffID)
    if target then
        local entity = EntityList:Get(target)
        if entity then
            for _, buff in ipairs(entity.buffs) do
                if buff.id == buffID then
                    return true
                end
            end
        end
    end
    return false
end

-- This is the main function
-- It will be called every tick
-- It will return true if the bot should stop
-- It will return false if the bot should continue
-- It will return nil if the bot should do nothing
-- Define the main function
function RoseWHM.Cast()
    if RoseWHM.HasBuff(Player, 418) then
        return false
    end
    if Player.ismounted or Player.incutscene then
        return false
    end
    local target = RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    local shouldApplyDoT, targetforDoTApplication = RoseWHM.ShouldApplyDoT(enemies)
    RoseWHM.HandleRaise()
    RoseWHM.UseSprint()
    if RoseWHM.AOEHealing(target) then
        return false
    end
    if RoseWHM.SingleTargetHealing(target) then
        return false
    end
    if shouldApplyDoT and targetforDoTApplication then
        RoseWHM.SingleTargetDoT(targetforDoTApplication)
    end
    if target and target.attackable then
        if RoseWHM.AOEDamage(target) then
            return false
        end
        if RoseWHM.SingleTargetDamage(target) then
            return false
        end
    end
    return true
end

-- Initialize a flag to track if an instant ability has been used
local instantUsed = false
local lastInstant = 0
local lastSpellWasHeal = false

-- Create a function for each spell type: SingleTargetHealing, AOEHealing, SingleTargetDamage, AOEDamage, SingleTargetDoT
-- Make sure it weaves like it should and all spells are weaving properly
-- Define the single target healing function
-- Use lastInstant to track the last instant cast
-- TODO: Refactor this function
function RoseWHM.SingleTargetHealing()

    -- Add player to the party members list
    local partyMembers = RoseWHM.GetPartyMembers()
    local bestHealTarget
    if table.valid(partyMembers) then
        for _, member in pairs(partyMembers) do
            if member.hp.percent < 75 then
                bestHealTarget = member
            end
        end
    end

    local level = Player.level

    local singleTargetHealOGCD = {
        {spell = RoseWHM.oGCD.LucidDreaming, id = 7562, target = Player.id, condition = level >= RoseWHM.oGCD.LucidDreaming.level},
        {spell = RoseWHM.oGCD.Aquaveil, id = 25861, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Aquaveil.level},
        {spell = RoseWHM.oGCD.Temperance, id = 16536, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Temperance.level},
        {spell = RoseWHM.oGCD.DivineBenison, id = 7432, target = bestHealTarget, condition = level >= RoseWHM.oGCD.DivineBenison.level},
        {spell = RoseWHM.oGCD.Tetragrammaton, id = 3570, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Tetragrammaton.level},
        {spell = RoseWHM.oGCD.Benediction, id = 140, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Benediction.level}
    }

    local singleTargetHealInstant = {
        {spell = RoseWHM.instant.AfflatusSolace, id = 16531, target = bestHealTarget, condition = level >= RoseWHM.instant.AfflatusSolace.level},
        {spell = RoseWHM.instant.Regen, id = 137, target = bestHealTarget, condition = level >= RoseWHM.instant.Regen.level}
    }

    local singleTargetHealGCD = {
        {spell = RoseWHM.gcd.CureII, id = 135, target = bestHealTarget, condition = level >= RoseWHM.gcd.CureII.level},
        {spell = RoseWHM.gcd.Cure, id = 120, target = bestHealTarget, condition = level >= RoseWHM.gcd.Cure.level}
    }
    -- Try to cast the spells in the order of priority: ogcd, instant, gcd
    if lastSpellWasHeal == false then
        for _, spell in ipairs(singleTargetHealOGCD) do
            if instantUsed then
                if spell.spell == RoseWHM.oGCD.LucidDreaming and Player.mp.percent <= 75 then
                    if level >= RoseWHM.oGCD.LucidDreaming.level then
                        if RoseWHM.CastSpellIfReady(spell.spell.id, Player.id) then
                            instantUsed = false
                            lastSpellWasHeal = true
                            d(string.format("Casting spell: %s", spell.spell.name))
                            return true
                        end
                    end
                end
                if spell.spell == RoseWHM.oGCD.Aquaveil then
                    if level >= RoseWHM.oGCD.Aquaveil.level then
                        if bestHealTarget then
                            if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                                d(string.format("Casting spell: %s", spell.spell.name))
                                instantUsed = false
                                lastSpellWasHeal = true
                                return true
                            end
                        end
                    end
                end
                if spell.spell == RoseWHM.oGCD.Temperance and level >= RoseWHM.oGCD.Temperance.level and bestHealTarget then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell.spell == RoseWHM.oGCD.DivineBenison and level >= RoseWHM.oGCD.DivineBenison.level and bestHealTarget then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell.spell == RoseWHM.oGCD.Tetragrammaton and level >= RoseWHM.oGCD.Tetragrammaton.level and bestHealTarget then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell.spell == RoseWHM.oGCD.Benediction and level >= RoseWHM.oGCD.Benediction.level and bestHealTarget then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
            end
        end
        for _, spell in ipairs(singleTargetHealInstant) do
            if spell.spell == RoseWHM.instant.AfflatusSolace and Player.gauge[2] >= 1 and bestHealTarget and level >= RoseWHM.instant.AfflatusSolace.level then
                if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = true
                    lastInstant = Now()
                    lastSpellWasHeal = true
                    return true
                end
            end
            if spell.spell == RoseWHM.instant.Regen and MissingBuffs(bestHealTarget,"158+897+1330") and bestHealTarget and level >= RoseWHM.instant.Regen.level then
                if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = true
                    lastInstant = Now()
                    lastSpellWasHeal = true
                    return true
                end
            end
        end
        if TimeSince(lastInstant) > 2000 then
            for _, spell in pairs(singleTargetHealGCD) do
                if spell.spell == RoseWHM.gcd.CureII and not Player:IsMoving() and bestHealTarget and level >= RoseWHM.gcd.CureII.level then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell.spell == RoseWHM.gcd.Cure and not Player:IsMoving() and bestHealTarget and level >= RoseWHM.gcd.Cure.level then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
            end
        end
    end
end

-- Define a function for AOE healing
function RoseWHM.AOEHealing()

    local partyMembers = RoseWHM.GetPartyMembers()
    local bestHealTarget
    if table.valid(partyMembers) then
        table.insert(partyMembers, Player)
        for _, member in pairs(partyMembers) do
            if member.hp.percent < 80 then
                if not bestHealTarget then
                    bestHealTarget = member
                end
            end
        end
    end

    local partyMembersBelow80Percent = 0
    local halfPartySize = 0
    local totalPartyMembers = 0
    local level = Player.level

    if table.valid(partyMembers) then
        for _, member in pairs(partyMembers) do
            if member then
                totalPartyMembers = totalPartyMembers + 1
                if member.hp.percent < 80 then
                    partyMembersBelow80Percent = partyMembersBelow80Percent + 1
                end
            end
        end
    end

    if totalPartyMembers > 1 then
        halfPartySize = totalPartyMembers / 2
    end

    local aoeHealOGCD = {
        {spell = RoseWHM.oGCD.LiturgyOfTheBell, id = 25862, target = bestHealTarget, condition = level >= RoseWHM.oGCD.LiturgyOfTheBell.level},
        {spell = RoseWHM.oGCD.Asylum, id = 3569, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Asylum.level}
    }

    local aoeHealInstant = {
        {spell = RoseWHM.instant.AfflatusRapture, id = 16534, target = Player, condition = level >= RoseWHM.instant.AfflatusRapture.level},
    }

    local aoeHealGCD = {
        { spell = RoseWHM.gcd.MedicaII, id = 133, target = Player, condition = level >= RoseWHM.gcd.MedicaII.level },
        { spell = RoseWHM.gcd.CureIII, id = 131, target = bestHealTarget, condition = level >= RoseWHM.gcd.CureIII.level },
        { spell = RoseWHM.gcd.Medica, id = 124, target = Player, condition = level >= RoseWHM.gcd.Medica.level }
    }

    for _, spell in ipairs(aoeHealOGCD) do
        if instantUsed then
            if partyMembersBelow80Percent >= halfPartySize then
                if bestHealTarget then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
            end
        end
    end
    if lastSpellWasHeal == false then
        for _, spell in ipairs(aoeHealInstant) do
            if partyMembersBelow80Percent >= halfPartySize and Player.gauge[2] >= 1 and level >= RoseWHM.instant.AfflatusRapture.level then
                if RoseWHM.CastSpellIfReady(spell.spell.id, Player.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = true
                    lastInstant = Now()
                    lastSpellWasHeal = true
                    return true
                end
            end
        end
        if TimeSince(lastInstant) > 2000 then
            for _, spell in ipairs(aoeHealGCD) do
                if spell == RoseWHM.gcd.CureIII and partyMembersBelow80Percent >= halfPartySize and not Player:IsMoving() then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, bestHealTarget.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell == RoseWHM.gcd.MedicaII and (spell.condition == nil or spell.condition) and partyMembersBelow80Percent >= halfPartySize and MissingBuff(Player, 150) and not Player:IsMoving() then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
                if spell == RoseWHM.gcd.Medica and (spell.condition == nil or spell.condition) and not Player:IsMoving() and partyMembersBelow80Percent >= halfPartySize then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = true
                        return true
                    end
                end
            end
        end
    end
end

-- Define a function for single target damage
-- TODO: Add a condition for the target to be a valid enemy
function RoseWHM.SingleTargetDamage(target)
    local level = Player.level

    local singleTargetDamageOGCD = {
        {spell = RoseWHM.oGCD.PresenceOfMind, id = 136, target = Player.id, condition = level >= RoseWHM.oGCD.PresenceOfMind.level},
        {spell = RoseWHM.oGCD.Assize, id = 3571, target = Player.id, condition = level >= RoseWHM.oGCD.Assize.level}
    }

    local singleTargetDamageInstant = {
        {spell = RoseWHM.instant.AfflatusMisery, id = 16535, target = target, condition = level >= RoseWHM.instant.AfflatusSolace.level},
    }

    local singleTargetDamageGCD = {
        {spell = RoseWHM.gcd.GlareIII, id = 25859, target = target, condition = level >= RoseWHM.gcd.GlareIII.level and not Player:IsMoving()},
        {spell = RoseWHM.gcd.Glare, id = 16533, target = target, condition = level >= RoseWHM.gcd.Glare.level and not Player:IsMoving()},
        {spell = RoseWHM.gcd.StoneIV, id = 7431, target = target, condition = level >= RoseWHM.gcd.StoneIV.level and not Player:IsMoving()},
        {spell = RoseWHM.gcd.StoneIII, id = 3568, target = target, condition = level >= RoseWHM.gcd.StoneIII.level and not Player:IsMoving()},
        {spell = RoseWHM.gcd.StoneII, id = 127, target = target, condition = level >= RoseWHM.gcd.StoneII.level and not Player:IsMoving()},
        {spell = RoseWHM.gcd.Stone, id = 119, target = target, condition = level >= RoseWHM.gcd.Stone.level and not Player:IsMoving()}
    }

    for _, spell in ipairs(singleTargetDamageOGCD) do
        if instantUsed then
            if (spell.condition == nil or spell.condition) then
                if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                    instantUsed = false
                    lastSpellWasHeal = false
                    d(string.format("Casting spell: %s", spell.spell.name))
                    return true
                end
            end
        end
    end
    for _, spell in ipairs(singleTargetDamageInstant) do
        if (spell.condition == nil or spell.condition) and Player.gauge[3] >= 3 then
            if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                instantUsed = true
                lastInstant = Now()
                lastSpellWasHeal = false
                d(string.format("Casting spell: %s", spell.spell.name))
                return true
            end
        end
    end
    if TimeSince(lastInstant) > 2000 then
        for _, spell in ipairs(singleTargetDamageGCD) do
            if (spell.condition == nil or spell.condition) then
                if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                    instantUsed = false
                    lastSpellWasHeal = false
                    d(string.format("Casting spell: %s", spell.spell.name))
                    return true
                end
            end
        end
    end
    return false
end

-- Define a function for AOE damage
function RoseWHM.AOEDamage(target)
    local enemies = RoseWHM.elist
    if table.valid(enemies) and table.size(enemies) > 1 then
        local level = Player.level

        local aoeDamageOGCD = {
            {spell = RoseWHM.oGCD.PresenceOfMind, id = 136, target = Player.id, condition = level >= RoseWHM.oGCD.PresenceOfMind.level},
            {spell = RoseWHM.oGCD.Assize, id = 3571, target = Player.id, condition = level >= RoseWHM.oGCD.Assize.level},
        }

        local aoeDamageInstant = {
            {spell = RoseWHM.instant.AfflatusMisery, id = 16535, target = target, radius = RoseWHM.instant.AfflatusMisery.radius, condition = level >= RoseWHM.instant.AfflatusMisery.level}
        }

        local aoeDamageGCD = {
            {spell = RoseWHM.gcd.HolyIII, id = 25860, target = Player.id, radius = RoseWHM.gcd.HolyIII.radius, condition = level >= RoseWHM.gcd.HolyIII.level},
            {spell = RoseWHM.gcd.Holy, id = 139, target = Player.id, radius = RoseWHM.gcd.Holy.radius, condition = level >= RoseWHM.gcd.Holy.level}
        }

        for _, spell in ipairs(aoeDamageOGCD) do
            local nearbyEnemies = MEntityList("alive,attackable,maxdistance=30")
            if table.valid(nearbyEnemies) then
                if table.size(nearbyEnemies) > 1 then
                    if (spell.condition == nil or spell.condition) then
                        if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                            instantUsed = false
                            lastSpellWasHeal = false
                            d(string.format("Casting spell: %s", spell.spell.name))
                            return true
                        end
                    end
                end
            end
        end
        if Player.gauge[3] == 3 then
            for _, spell in ipairs(aoeDamageInstant) do
                local nearbyEnemies = MEntityList("alive,attackable,maxdistance=" .. spell.radius)
                if table.valid(nearbyEnemies) and table.size(nearbyEnemies) > 1 and (target.condition == nil or target.condition) then
                    if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = true
                        lastInstant = Now()
                        lastSpellWasHeal = false
                        return true
                    end
                end
            end
        end
        if TimeSince(lastInstant) > 2000 then
            for _, spell in ipairs(aoeDamageGCD) do
                local nearbyEnemies = MEntityList("alive,attackable,maxdistance=" .. spell.radius)
                if table.valid(nearbyEnemies) and table.size(nearbyEnemies) > 1 and (spell.condition == nil or spell.condition) and not Player:IsMoving() then
                    if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        lastSpellWasHeal = false
                        return true
                    end
                end
            end
        end
    end
    return false
end

-- Define a function for single target DoT application
function RoseWHM.SingleTargetDoT(targetforDoTApplication)
    RoseWHM.Targeting()
    local currentTarget = targetforDoTApplication or MGetTarget()
    local level = Player.level

    if not currentTarget or not currentTarget.incombat then
        d("Target is not valid or not in combat.")
        return false
    end

    local singleTargetDoTSpells = {
        {spell = RoseWHM.instant.Dia, buffId = buffIDTable.Dia},
        {spell = RoseWHM.instant.AeroII, buffId = buffIDTable.AeroII},
        {spell = RoseWHM.instant.Aero, buffId = buffIDTable.Aero}
    }

    for _, entry in ipairs(singleTargetDoTSpells) do
        local spell = entry.spell
        local buffId = entry.buffId

        if spell and spell.level and level >= spell.level then
            if not RoseWHM.HasBuff(currentTarget, buffId) and RoseWHM.CastSpellIfReady(spell.id, currentTarget.id) then
                d(string.format("Casting spell: %s", spell.name))
                instantUsed = true
                lastInstant = Now()
                lastSpellWasHeal = false
                return true
            end
        end
    end

    return false
end

-- Define a function to draw the GUI
function RoseWHM.Draw()
    if RoseWHM.GUI.Open and GUI:Begin(RoseWHM.GUI.Name, RoseWHM.GUI.Open) then
        GUI:End()
    end
end

-- Define a function to handle starting the ACR
function RoseWHM.OnOpen()
    RoseWHM.GUI.Open = true -- Open the GUI
end

-- This function is called when the module is first loaded. It's typically used to initialize settings or load saved variables.
function RoseWHM.OnLoad()
    ACRMyProfileMySavedVar = ACR.GetSetting("ACRMyProfileMySavedVar",false)
end

--[[ This function is called when a mouse click event occurs. It receives various parameters about the state of the mouse and keyboard at the time of the click, and the entity (if any) that was clicked.
function RoseWHM.OnClick(mouse,shiftState,controlState,altState,entity)
    Handle mouse click events here.
end ]]--

-- This function is called periodically (usually every frame) to update the state of the module. It's typically used for ongoing updates that need to occur frequently, like moving characters, updating UI, etc.
function RoseWHM.OnUpdate()
    -- Handle updates here.
end

return RoseWHM