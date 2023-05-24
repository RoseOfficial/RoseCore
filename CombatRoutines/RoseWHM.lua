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
    LucidDreaming = {id = 7563, level = 24, name = "Lucid Dreaming", cast = 0, recast = 60, mp = 0, range = 0, radius = 0}
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
    Raise = {id = 3574, level = 18, name = "Raise", cast = 8, recast = 2.5, mp = 2400, range = 30, radius = 0, potency = 200},
    Esuna = {id = 3575, level = 22, name = "Esuna", cast = 1.5, recast = 2.5, mp = 600, range = 30, radius = 0, potency = 0},
}

-- Define Buff ID Table
-- TODO: Add more buffs
local buffIDTable = {
    -- Role Buffs
    Aero = 143,
    AeroII = 144,
    Dia = 1871,
}

-- Set up debug contexts
local debugContexts = {}

-- Define the Debug function
function RoseWHM.Debug(context, message)
    -- Check if the context has been used before
    if debugContexts[context] ~= message then
        -- Print the message
        d(message)
        -- Store the message
        debugContexts[context] = message
    end
end

-- Define a function to check if a table contains a value
function table.contains(table, value)
    -- Loop through the table
    for _, v in pairs(table) do
        -- Check if the value matches
        if v == value then
            -- Return true
            return true
        end
    end
    -- Return false
    return false
end

-- Define a function to get the role by job
function RoseWHM.GetRoleByJob(job)
    -- Define the tank jobs
    local tankJobs = {1, 3, 19, 21, 32, 37}
    -- Check if the job is a tank
    if table.contains(tankJobs, job) then
        -- Return tank
        return "tank"
    end
    -- Define the healer jobs
    local healerJobs = {24, 28, 33, 34, 35, 36}
    -- Check if the job is a healer
    if table.contains(healerJobs, job) then
        -- Return healer
        return "healer"
    end
    -- Define the melee DPS jobs
    local meleeDPSJobs = {4, 5, 6, 7, 29, 30, 31}
    -- Check if the job is a melee DPS
    if table.contains(meleeDPSJobs, job) then
        -- Return melee DPS
        return "melee"
    end
    -- Define the ranged DPS jobs
    local rangedDPSJobs = {2, 22, 23, 38, 39}
    -- Check if the job is a ranged DPS
    if table.contains(rangedDPSJobs, job) then
        -- Return ranged DPS
        return "ranged"
    end
    -- Define the caster DPS jobs
    local casterDPSJobs = {8, 9, 10, 11, 12, 13, 14, 15, 16, 27}
    -- Check if the job is a caster DPS
    if table.contains(casterDPSJobs, job) then
        -- Return caster DPS
        return "caster"
    end
    -- Return none
    return "none"
end

-- Define a function to search for entities
function RoseWHM.SearchForEntities()
    -- Define the entity table
    local entityTable = {}
    -- Define the entity count
    local entityCount = 0
    -- Loop through the entities
    for _, entity in pairs(EntityList("alive,attackable,chartype=4,maxdistance=30")) do
        -- Check if the entity is valid
        if entity and entity.id ~= 0 and entity.distance <= 30 then
            -- Increment the entity count
            entityCount = entityCount + 1
            -- Add the entity to the table
            entityTable[entityCount] = entity
        end
    end
    -- Return the entity table
    return entityTable
end

-- Define a function to check if DoT should be applied
function RoseWHM.ShouldApplyDoT(enemies)
    -- Get the player
    local playerId = Player.id
    -- Get the DoT IDs
    local Aero = buffIDTable.Aero
    local AeroII = buffIDTable.AeroII
    local Dia = buffIDTable.Dia
    -- Check if there are no enemies
    if not enemies then
        return false, nil
    end
    -- Loop through the enemies
    for _, enemy in pairs(enemies) do
        local hasDoTBuff = false
        -- Loop through the enemy buffs
        for _, buff in pairs(enemy.buffs) do
            -- Check if the enemy has the DoT buff
            if (buff.id == Aero or buff.id == AeroII or buff.id == Dia) and tonumber(buff.ownerid) == tonumber(playerId) then
                -- Set the has DoT buff flag
                hasDoTBuff = true
                -- Check if the DoT buff is about to expire
                if buff.duration <= 3 then
                    -- Return true and the enemy
                    return true, enemy
                end
                -- If the enemy has the DoT buff and it's not about to expire, break the loop
                break
            end
        end
        -- Check if the enemy doesn't have the DoT buff
        if not hasDoTBuff then
            return true, enemy
        end
    end
    -- Return false
    return false, nil
end

-- Define a function to check if an action is ready
function RoseWHM.ActionIsReady(id)
    -- Check if the action is ready
    if (MIsLoading() or not ActionList:IsReady()) then
        -- Return false
        return false
    end
    -- Get the action
    local ids = tonumber(id) or 0
    local action = ActionList:Get(1, ids)
    -- Check if the action is valid
    if (table.valid(action)) then
        -- Check if the action is ready
        local isOffCooldown = action.cd <= 0
        local currentMP = Player.mp.current
        local hasEnoughResources = currentMP >= action.cost
        -- Return if the action is ready
        return isOffCooldown and hasEnoughResources
    end
    -- Return false
    return false
end

-- Define a function to cast a spell if it's ready
-- Returns true if the spell was cast
-- Returns false if the spell was not cast
-- Returns nil if the spell is not valid
-- Returns nil if the spell is not ready
function RoseWHM.CastSpellIfReady(spellId, targetId)
    -- Check if the spell is valid
    if not spellId then
        d("Spell is not valid")
        -- Return nil
        return nil
    end
    -- Check if the target is valid
    if not targetId then
        d("Target is not valid")
        -- Set the target to the player
        targetId = Player.id
    end
    -- Check if the spell is ready
    local action = ActionList:Get(1, spellId)
    -- Check if the action is valid
    if action then
        if action.cd == 0 then
            if RoseWHM.ActionIsReady(spellId) then
                -- Cast the spell
                action:Cast(targetId)
                -- Return true
                return true
            end
        end
        -- Return false
        return false
    end
end

-- Define a function to get the best revive target
function RoseWHM.GetBestRevive(party, role)
    -- Check if the party is valid
    party = IsNull(party, false)
    -- Check if the role is valid
    role = role or ""
    -- Get the revive range
    range = 30
    -- Get the entity list
    local el
    -- Check if the party is valid
    if (party) then
        -- Get the party members
        el = MEntityList("myparty,friendly,chartype=4,targetable,dead,maxdistance=" .. tostring(range))
    else
        -- Get the entity list
        el = MEntityList("friendly,dead,chartype=4,targetable,maxdistance=" .. tostring(range))
    end
    -- Check if the entity list is valid
    if (table.valid(el)) then
        -- Get the role table
        local roleTable = GetRoleTable(role)
        -- Loop through the entities
        for _, entity in pairs(el) do
            -- Check if the entity is valid
            if (not HasBuffs(entity, "148") and (not roleTable or roleTable[entity.job])) then
                -- Return the entity
                return entity
            end
        end
    end
    -- Return nil
    return nil
end

-- Define a function to get dead party members
function RoseWHM.GetDeadPartyMembers()
    -- Define the dead members table
    local deadMembers = {}
    -- Get the party members
    local party = EntityList("type=1,chartype=4")
    -- Loop through the party members
    for _, member in pairs(party) do
        -- Check if the member is dead
        if member.hp.percent == 0 then
            -- Add the member to the table
            deadMembers[member.id] = member
        end
    end
    -- Return the dead members table
    return deadMembers
end

-- Define a function to handle raises
function RoseWHM.HandleRaise()
    -- Get the dead party members
    local PartyMembersDead = RoseWHM.GetDeadPartyMembers()
    -- Check if there are dead party members
    if table.valid(PartyMembersDead) and Player.level >= 12 and Player.mp.percent >= 24 then
        -- Get the raise ID
        local raiseId = RoseWHM.gcd.Raise.id
        -- Get the swiftcast ID
        local swiftcastId = RoseWHM.oGCD.Swiftcast.id
        -- Get the best revive target
        local raiseTarget = RoseWHM.GetBestRevive(true, "")
        -- Check if the raise target is valid
        if table.valid(raiseTarget) and MissingBuffs(raiseTarget, "148+1140") then
            -- Get the current time
            local reztime = 0
            -- Check if the player has swiftcast
            if Player.level >= 18 and RoseWHM.CastSpellIfReady(swiftcastId, Player.id) then
                -- Cast swiftcast raise
                return RoseWHM.SwiftcastRaise(raiseTarget)
                -- Check if the player has raise
            elseif RoseWHM.CastSpellIfReady(raiseId, raiseTarget.id) then
                -- Cast raise
                if TimeSince(reztime) > 2000 then
                    -- Set the rez time
                    reztime = Now()
                    -- Cast raise
                    return RoseWHM.CastSpellIfReady(raiseId, raiseTarget.id)
                end
            end
        end
    end
end

-- Define a function to handle swiftcast raise
function RoseWHM.SwiftcastRaise(target)
    -- Check if the target is valid
    if target then
        -- Get the swiftcast ID
        local swiftcastId = RoseWHM.oGCD.SwiftCast.id
        -- Get the raise ID
        local raiseId = RoseWHM.gcd.Raise.id
        -- Cast swiftcast raise
        RoseWHM.CastSpellIfReady(swiftcastId, Player.id)
        -- Wait for swiftcast to apply
        local swiftcastApplied = false
        -- Get the current time
        local startTime = os.clock()
        -- Loop until swiftcast is applied
        while not swiftcastApplied and os.clock() - startTime < 3 do
            -- Check if the player has swiftcast
            local swiftcastBuff = HasBuff(Player,167)
            -- Check if swiftcast is applied
            if swiftcastBuff then
                -- Set swiftcast applied to true
                swiftcastApplied = true
            else
                -- Yield the coroutine
                coroutine.yield()
            end
        end
        -- Check if swiftcast is applied
        if swiftcastApplied then
            -- Cast raise
            RoseWHM.CastSpellIfReady(raiseId, target.id)
        end
    end
end

-- Define a function to check enemies for DoT debuffs
function RoseWHM.CheckEnemiesForDoTDebuffs()
    -- Define the debuff ID table
    local enemiesWithDebuffs = {}
    -- Define the debuff ID table
    if table.valid(RoseWHM.elist) then
        -- Define the debuff ID table
        for _, enemy in pairs(RoseWHM.elist) do
            -- Define the debuff ID table
            for _, buff in pairs(enemy.buffs) do
                -- Define the debuff ID table
                if tonumber(buff.ownerid) == tonumber(Player.id) and buffIDTable[tonumber(buff.id)] then
                    -- Define the debuff ID table
                    table.insert(enemiesWithDebuffs, enemy)
                    -- Define the debuff ID table
                    break
                end
            end
        end
    end
    -- Return the debuff ID table
    return enemiesWithDebuffs
end

-- Define a function to get healable targets
function RoseWHM.GetHealableTargets(range, hp, whitelist, npc)
    local search = ""
    local healables = {}
    if npc then
        search = "alive,targetable,maxdistance=" .. tostring(range)
    else
        search = "alive,friendly,chartype=4,myparty,targetable,maxdistance=" .. tostring(range)
    end
    if (whitelist ~= "") then search = search .. ",contentid=" .. tostring(whitelist) end
    local el = MEntityList(search)
    if (table.valid(el)) then
        for i, entity in pairs(el) do
            if (IsValidHealTarget(entity) and entity.hp.percent <= hp) then
                healables[i] = entity
            end
        end
    end
    if Player.hp.percent <= hp then
        healables[Player.id] = Player
    end
    return healables
end

-- Define a function to get the best party heal target
function RoseWHM.GetBestPartyHealTarget()
    -- Get the party members and trusts
    local party = RoseWHM.GetPartyMembers()
    -- Define the best heal target
    local bestHealTarget
    -- Define the best heal target health
    local bestHealTargetHealth = 100
    -- Loop through the party members
    for _, member in pairs(party) do
        -- Check if the member is a valid heal target
        if IsValidHealTarget(member) then
            -- Check if the member has the lowest health
            if member.hp.percent < bestHealTargetHealth then
                -- Set the best heal target
                bestHealTarget = member
                -- Set the best heal target health
                bestHealTargetHealth = member.hp.percent
            end
        end
    end
    -- Return the best heal target
    return bestHealTarget
end

--Define a function for targeting
local lastTargetCheck = 0
function RoseWHM.Targeting()
    RoseWHM.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    -- Define an entity list for striking dummy
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
function RoseWHM.GetPartyMembers()
    local partyMembers = MEntityList("alive,chartype=4,myparty,targetable,maxdistance=30") or {}
    partyMembers[Player.id] = Player
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

-- This is the function that checks if a spell is ready
function RoseWHM.IsReady(action)
    if action and (action.casttime == 0 or not Player:IsMoving()) and not (Busy() and IsMounting() and IsMounted() and IsDismounting()) then
        if action.cd == nil or action.cd == 0 then
            return true
        end
    end
end

function RoseWHM.Action(action, target)
    if type(action) == "number" then
        action = ActionList:Get(1, action)
    end
    if not target then
        target = Player
    end
    if table.valid(action) and table.valid(target) then
        if target.x and Distance2DT(Player.pos, target) <= action.range then
            return action:Cast(target.x, target.y, target.z)
        else
            if target.distance2d <= action.range then
                return action:Cast(target.id)
            end
        end
    end
end

-- This is the main function
-- It will be called every tick
-- It will return true if the bot should stop
-- It will return false if the bot should continue
-- It will return nil if the bot should do nothing
-- Define the main function
function RoseWHM.Cast()
    -- Check if we are dead
    if RoseWHM.HasBuff(Player, 418) then
        return false
    end
    -- Check if we are mounted or in a cutscene
    if Player.ismounted or Player.incutscene then
        return false
    end
    local target = RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    local shouldApplyDoT, targetforDoTApplication = RoseWHM.ShouldApplyDoT(enemies)
    -- Call the Raise function
    RoseWHM.HandleRaise()
    RoseWHM.UseSprint()
    -- Check if AOEHealing or SingleTargetHealing should be called
    if RoseWHM.AOEHealing(target) then
        return true
    end
    if RoseWHM.SingleTargetHealing(target) then
        return true
    end
    -- Call the DoT application function
    if shouldApplyDoT and targetforDoTApplication then
        RoseWHM.SingleTargetDoT(targetforDoTApplication)
    end
    -- Check if AOEDamage or SingleTargetDamage should be called
    if target then
        RoseWHM.AOEDamage(target)
    end
    if target then
        RoseWHM.SingleTargetDamage(target)
    end
    -- Return false to continue botting
    return false
end

-- Initialize a flag to track if an instant ability has been used
local instantUsed = false

-- Create a function for each spell type: SingleTargetHealing, AOEHealing, SingleTargetDamage, AOEDamage, SingleTargetDoT
-- Make sure it weaves like it should and all spells are weaving properly
-- Define the single target healing function
-- TODO: Refactor this
-- TODO: Fix healing double castings
function RoseWHM.SingleTargetHealing()

    -- search for the lowest HP party member
    local bestHealTarget = nil
    local partyMembers = RoseWHM.GetPartyMembers()
    for _, member in pairs(partyMembers) do
        if member.hp.percent < 100 then
            bestHealTarget = member
        end
    end

    local level = Player.level

    local singleTargetHealOGCD = {
        {spell = RoseWHM.oGCD.Temperance, id = 16536, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Temperance.level},
        {spell = RoseWHM.oGCD.Benediction, id = 140, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Benediction.level},
        {spell = RoseWHM.oGCD.Tetragrammaton, id = 3570, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Tetragrammaton.level},
        {spell = RoseWHM.oGCD.DivineBenison, id = 7432, target = bestHealTarget, condition = level >= RoseWHM.oGCD.DivineBenison.level},
        {spell = RoseWHM.oGCD.Aquaveil, id = 25861, target = bestHealTarget, condition = level >= RoseWHM.oGCD.Aquaveil.level}
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
    for _, spell in ipairs(singleTargetHealOGCD) do
        if instantUsed then
            if spell.spell == RoseWHM.oGCD.Aquaveil and spell.spell.condition and spell.target and spell.target.hp.percent < 60  then
                if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = false
                    return
                end
            end
            if spell.spell == RoseWHM.oGCD.Temperance and spell.spell.condition and spell.target and spell.target.hp.percent < 60 then
                if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = false
                    return
                end
            end
            if spell.spell == RoseWHM.oGCD.DivineBenison and spell.spell.condition and spell.target and spell.target.hp.percent < 60 then
                if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = false
                    return
                end
            end
            if spell.spell == RoseWHM.oGCD.Tetragrammaton and spell.spell.condition and spell.target and spell.target.hp.percent < 60 then
                if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = false
                    return
                end
            end
            if spell.spell == RoseWHM.oGCD.Benediction and spell.spell.condition and spell.target and spell.target.hp.percent < 60 then
                if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = false
                    return
                end
            end
        end
    end
    for _, spell in ipairs(singleTargetHealInstant) do
        if spell.spell == RoseWHM.instant.AfflatusSolace and Player.gauge[2] >= 1 and spell.target and spell.target.hp.percent < 60 then
            if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                d(string.format("Casting spell: %s", spell.spell.name))
                instantUsed = true
                return
            end
        end
        if spell.spell == RoseWHM.instant.Regen and MissingBuffs(bestHealTarget,"158+897+1330") and spell.target and spell.target.hp.percent < 60 then
            if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                d(string.format("Casting spell: %s", spell.spell.name))
                instantUsed = true
                return
            end
        end
    end
    for _, spell in pairs(singleTargetHealGCD) do
        if spell.spell == RoseWHM.gcd.CureII and not Player:IsMoving() and spell.target and spell.target.hp.percent < 60 then
            if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                d(string.format("Casting spell: %s", spell.spell.name))
                instantUsed = false
                return
            end
        end
        if spell.spell == RoseWHM.gcd.Cure and not Player:IsMoving() and spell.target and spell.target.hp.percent < 60 then
            if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                d(string.format("Casting spell: %s", spell.spell.name))
                instantUsed = false
                return
            end
        end
    end
end

-- Define a function for AOE healing
function RoseWHM.AOEHealing()

    local bestHealTarget = nil
    local bestHealTargetHealth = 100
    local partyMembers = RoseWHM.GetPartyMembers()
    for _, member in pairs(partyMembers) do
        if member.hp.percent < bestHealTargetHealth then
            bestHealTarget = member
            bestHealTargetHealth = member.hp.percent
        end
    end

    local party = RoseWHM.GetPartyMembers()
    local partyMembersBelow90Percent = 0
    local halfPartySize = 0
    local totalPartyMembers = 0
    local level = Player.level
    -- count half of the party members
    if table.valid(party) then
        for _, member in pairs(party) do
            if member then
                halfPartySize = halfPartySize + 1
            end
        end
    end
    if table.valid(party) then
        for _, member in pairs(party) do
            if member then
                totalPartyMembers = totalPartyMembers + 1
                if member.hp.percent < 90 then
                    partyMembersBelow90Percent = partyMembersBelow90Percent + 1
                end
            end

            local aoeHealOGCD = {
                {spell = RoseWHM.oGCD.LiturgyOfTheBell, id = 25862, target = Player, condition = level >= RoseWHM.oGCD.LiturgyOfTheBell.level},
                {spell = RoseWHM.oGCD.Asylum, id = 3569, target = Player, condition = level >= RoseWHM.oGCD.Asylum.level}
            }

            local aoeHealInstant = {
                {spell = RoseWHM.instant.AfflatusRapture, id = 16534, target = bestHealTarget, condition = level >= RoseWHM.instant.AfflatusRapture.level},
            }

            local aoeHealGCD = {
                {spell = RoseWHM.gcd.MedicaII, id = 133, target = Player, condition = level >= RoseWHM.gcd.MedicaII.level},
                {spell = RoseWHM.gcd.CureIII, id = 131, target = bestHealTarget, condition = level >= RoseWHM.gcd.CureIII.level},
                {spell = RoseWHM.gcd.Medica, id = 124, target = Player, condition = level >= RoseWHM.gcd.Medica.level}
            }

            -- Try to cast the spells in the order of priority: ogcd, instant, gcd
            for _, spell in ipairs(aoeHealOGCD) do
                if (spell.condition == nil or spell.condition) and instantUsed and partyMembersBelow90Percent >= halfPartySize then
                    if RoseWHM.CastSpellIfReady(spwll.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        return
                    end
                end
            end
            for _, spell in ipairs(aoeHealInstant) do
                if (spell.condition == nil or spell.condition) and instantUsed and partyMembersBelow90Percent >= halfPartySize and Player.gauge[2] >= 1 then
                    if RoseWHM.CastSpellIfReady(spwll.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = true
                        return
                    end
                end
            end
            for _, spell in ipairs(aoeHealGCD) do
                -- TODO: Fix buff condition for Medica II
                if spell == RoseWHM.gcd.MedicaII and (spell.condition == nil or spell.condition) and partyMembersBelow90Percent >= halfPartySize and MissingBuff(Player, 150) and not Player:IsMoving() then
                    if RoseWHM.CastSpellIfReady(spwll.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        return
                    end
                end
                if (spell.condition == nil or spell.condition) and not Player:IsMoving() and partyMembersBelow90Percent >= halfPartySize then
                    if RoseWHM.CastSpellIfReady(spell.spell.id, spell.target.id) then
                        d(string.format("Casting spell: %s", spell.spell.name))
                        instantUsed = false
                        return
                    end
                end
            end
        end
    end
end

-- Define a function for single target damage
function RoseWHM.SingleTargetDamage(target)
    local level = Player.level

    -- Define a table for single target damage oGCD spells
    local singleTargetDamageOGCD = {
        {spell = RoseWHM.oGCD.PresenceOfMind, id = 136, target = Player.id, condition = level >= RoseWHM.oGCD.PresenceOfMind.level},
        {spell = RoseWHM.oGCD.Assize, id = 3571, target = Player.id, condition = level >= RoseWHM.oGCD.Assize.level},
        {spell = RoseWHM.oGCD.LucidDreaming, id = 7561, target = Player.id, condition = level >= RoseWHM.oGCD.LucidDreaming.level},
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

    -- Cast the spells in the order of priority: ogcd, instant, gcd
    -- If oGCD is not ready, try instant, then gcd
    -- oGCDs should only be cast after an instant
    for _, spell in ipairs(singleTargetDamageOGCD) do
        if instantUsed then
            if spell == RoseWHM.oGCD.LucidDreaming and Player.mp.percent >= 75 then
                if (spell.condition == nil or spell.condition) then
                    if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                        instantUsed = false
                        d(string.format("Casting spell: %s", spell.spell.name))
                        return
                    end
                end
            end
            if (spell.condition == nil or spell.condition) then
                if instantUsed then
                    if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                        instantUsed = false
                        d(string.format("Casting spell: %s", spell.spell.name))
                        return
                    end
                end
            end
        end
    end
    for _, spell in ipairs(singleTargetDamageInstant) do
        if (spell.condition == nil or spell.condition) and Player.gauge[3] >= 3 then
            if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                instantUsed = true
                d(string.format("Casting spell: %s", spell.spell.name))
                return
            end
        end
    end
    for _, spell in ipairs(singleTargetDamageGCD) do
        if (spell.condition == nil or spell.condition) then
            if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                instantUsed = false
                d(string.format("Casting spell: %s", spell.spell.name))
                return
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

        -- Cast the spells in the order of priority: ogcd, instant, gcd
        for _, spell in ipairs(aoeDamageOGCD) do
            -- Check if there are enough enemies in range to justify casting the spell
            -- Handle the case where the spell has no radius
            local nearbyEnemies = MEntityList("alive,attackable,maxdistance=30")
            -- Split this up into only one condition per line to make it easier to debug
            if table.valid(nearbyEnemies) then
                if table.size(nearbyEnemies) > 1 then
                    if (spell.condition == nil or spell.condition) then
                        if RoseWHM.CastSpellIfReady(spell.id, target.id) then
                            if instantUsed then
                                instantUsed = false
                            end
                            d(string.format("Casting spell: %s", spell.spell.name))
                            return
                        end
                    end
                end
            end
        end
        if Player.gauge[3] == 3 then
            for _, spell in ipairs(aoeDamageInstant) do
                local nearbyEnemies = MEntityList("alive,attackable,maxdistance=" .. spell.radius)
                if table.valid(nearbyEnemies) and table.size(nearbyEnemies) > 1 and (target.condition == nil or target.condition) and RoseWHM.CastSpellIfReady(spell.id, target.id) then
                    d(string.format("Casting spell: %s", spell.spell.name))
                    instantUsed = true
                    return
                end
            end
        end
        for _, spell in ipairs(aoeDamageGCD) do
            local nearbyEnemies = MEntityList("alive,attackable,maxdistance=" .. spell.radius)
            if table.valid(nearbyEnemies) and table.size(nearbyEnemies) > 1 and (spell.condition == nil or spell.condition) and RoseWHM.CastSpellIfReady(spell.id, target.id) and not Player:IsMoving() then
                d(string.format("Casting spell: %s", spell.spell.name))
                instantUsed = false
                return
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

    -- Return early if the target is not valid or not in combat
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

        -- Check if the spell's level is defined and the player's level is high enough
        if spell and spell.level and level >= spell.level then
            if not RoseWHM.HasBuff(currentTarget, buffId) and RoseWHM.CastSpellIfReady(spell.id, currentTarget.id) then
                d(string.format("Casting spell: %s", spell.name))
                instantUsed = true
                return
            end
        end
    end

    return false
end

-- Define a function to draw the GUI
function RoseWHM.Draw()
    if RoseWHM.GUI.Open and GUI:Begin(RoseWHM.GUI.Name, RoseWHM.GUI.Open) then
        -- Draw the GUI elements here
        GUI:End()
    end
end

-- Define a function to handle starting the ACR
function RoseWHM.OnOpen()
    RoseWHM.GUI.Open = true -- Open the GUI
end

-- This function is called when the module is first loaded. It's typically used to initialize settings or load saved variables.
function RoseWHM.OnLoad()
    -- Load a saved variable from ACR's settings. The saved variable is 'ACRMyProfileMySavedVar'. If it does not exist, it defaults to 'false'.
    ACRMyProfileMySavedVar = ACR.GetSetting("ACRMyProfileMySavedVar",false)
end

-- This function is called when a mouse click event occurs. It receives various parameters about the state of the mouse and keyboard at the time of the click, and the entity (if any) that was clicked.
--[[function RoseWHM.OnClick(mouse,shiftState,controlState,altState,entity)
    -- Handle mouse click events here.
end]]

-- This function is called periodically (usually every frame) to update the state of the module. It's typically used for ongoing updates that need to occur frequently, like moving characters, updating UI, etc.
function RoseWHM.OnUpdate()
    -- Handle updates here.
end

return RoseWHM