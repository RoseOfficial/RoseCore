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

-- Define RoseWHM Spells
-- TODO: Add all spells
RoseWHM.Spells = {
    Stone = {id = 119, level = 1, name = "Stone", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 140, gcd = 2.39},
    Cure = {id = 120, level = 2, name = "Cure", cast = 1.5, recast = 2.5, mp = 400, range = 30, radius = 0, potency = 500, gcd = 2.39},
    Aero = {id = 121, level = 4, name = "Aero", cast = 0, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 50, duration = 30, gcd = 2.39},
    Medica = {id = 124, level = 10, name = "Medica", cast = 2, recast = 2.5, mp = 900, range = 0, radius = 15, potency = 400, gcd = 2.39},
    Raise = {id = 125, level = 12, name = "Raise", cast = 8, recast = 2.5, mp = 2400, range = 30, radius = 0, gcd = 2.39},
    SwiftCast = {id = 7561, level = 18, name = "SwiftCast", cast = 0, recast = 60, mp = 0, range = 0, radius = 0, gcd = 0},
    StoneII = {id = 127, level = 18, name = "Stone II", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 190, gcd = 2.39},
    CureII = {id = 135, level = 30, name = "Cure II", cast = 2, recast = 2.5, mp = 1000, range = 30, radius = 0, potency = 800, gcd = 2.39},
    PresenceOfMind = {id = 136, level = 30, name = "Presence of Mind", cast = 0, recast = 120, mp = 0, range = 0, radius = 0, gcd = 0},
    Regen = {id = 137, level = 35, name = "Regen", cast = 0, recast = 2.5, mp = 400, range = 30, radius = 0, potency = 250, duration = 18, gcd = 2.39},
    CureIII = {id = 131, level = 40, name = "Cure III", cast = 2, recast = 2.5, mp = 1500, range = 30, radius = 10, potency = 600, gcd = 2.39},
    Holy = {id = 139, level = 45, name = "Holy", cast = 2.5, recast = 2.5, mp = 400, range = 0, radius = 8, gcd = 2.39},
    AeroII = {id = 132, level = 46, name = "Aero II", cast = 0, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 50, duration = 30, gcd = 2.39},
    MedicaII = {id = 133, level = 50, name = "Medica II", cast = 2, recast = 2.5, mp = 1000, range = 0, radius = 20, potency = 250, duration = 15, gcd = 2.39},
    Benediction = {id = 140, level = 50, name = "Benediction", cast = 0, recast = 180, mp = 0, range = 30, radius = 0, gcd = 0},
    AfflatusSolace = {id = 16531, level = 52, name = "Afflatus Solace", cast = 0, recast = 2.5, mp = 0, range = 30, radius = 0, potency = 800, gcd = 2.39},
    Asylum = {id = 3569, level = 52, name = "Asylum", cast = 0, recast = 90, mp = 0, range = 30, radius = 10, potency = 100, duration = 24, gcd = 0},
    StoneIII = {id = 3568, level = 54, name = "Stone III", cast = 1.5, recast = 2.5, mp = 300, range = 25, radius = 0, potency = 220, gcd = 2.39},
    Assize = {id = 3571, level = 56, name = "Assize", cast = 0, recast = 40, mp = 0, range = 0, radius = 15, gcd = 0},
    ThinAir = {id = 7430, level = 58, name = "Thin Air", cast = 0, recast = 60, mp = 0, range = 0, radius = 0, gcd = 0},
    Tetragrammaton = {id = 3570, level = 60, name = "Tetragrammaton", cast = 0, recast = 60, mp = 0, range = 30, radius = 0, potency = 700, gcd = 0},
    StoneIV = {id = 7431, level = 64, name = "Stone IV", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 260, gcd = 2.39},
    DivineBenison = {id = 7432, level = 66, name = "Divine Benison", cast = 0, recast = 30, mp = 0, range = 30, radius = 0, gcd = 0},
    PlenaryIndulgence = {id = 7433, level = 70, name = "Plenary Indulgence", cast = 0, recast = 60, mp = 0, range = 0, radius = 20, gcd = 0},
    Dia = {id = 16532, level = 72, name = "Dia", cast = 0, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 60, duration = 30, gcd = 2.39},
    Glare = {id = 16533, level = 72, name = "Glare", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 290, gcd = 2.39},
    AfflatusMisery = {id = 16535, level = 74, name = "Afflatus Misery", cast = 0, recast = 2.5, mp = 0, range = 25, radius = 5, potency = 1240, gcd = 2.39},
    AfflatusRapture = {id = 16534, level = 76, name = "Afflatus Rapture", cast = 0, recast = 2.5, mp = 0, range = 0, radius = 20, potency = 400, gcd = 2.39},
    Temperance = {id = 16536, level = 80, name = "Temperance", cast = 0, recast = 120, mp = 0, range = 0, radius = 0, gcd = 0},
    GlareIII = {id = 25859, level = 82, name = "Glare III", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 310, gcd = 2.39},
    HolyIII = {id = 25860, level = 82, name = "Holy III", cast = 2.5, recast = 2.5, mp = 400, range = 0, radius = 8, potency = 150, gcd = 2.39},
    Aquaveil = {id = 25861, level = 86, name = "Aquaveil", cast = 0, recast = 60, mp = 0, range = 30, radius = 0, gcd = 0},
    LiturgyOfTheBell = {id = 25862, level = 90, name = "Liturgy of the Bell", cast = 0, recast = 180, mp = 0, range = 30, radius = 0, potency = 400, duration = 20, gcd = 0}
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
                    -- Return true
                    return true, enemy
                end
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
-- TODO: Add weaving support
function RoseWHM.CastSpellIfReady(spellId, targetId)
    -- Check if the spell is valid
    if not spellId then
        -- Return nil
        return nil
    end
    -- Check if the target is valid
    if not targetId then
        -- Set the target to the player
        targetId = Player.id
    end
    -- Check if the spell is ready
    local action = ActionList:Get(1, spellId)
    -- Check if the action is valid
    if action and action.cd == 0 and RoseWHM.ActionIsReady(spellId) then
        -- Cast the spell
        action:Cast(targetId)
        -- Return true
        return true
    end
    -- Return false
    return false
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
        local raiseId = RoseWHM.Spells.Raise.id
        -- Get the swiftcast ID
        local swiftcastId = RoseWHM.Spells.SwiftCast.id
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
        local swiftcastId = RoseWHM.Spells.SwiftCast.id
        -- Get the raise ID
        local raiseId = RoseWHM.Spells.Raise.id
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
    local range = range or ml_global_information.AttackRange
    local hp = hp or 95
    local whitelist = IsNull(whitelist, "")
    local healables = RoseWHM.GetHealableTargets(range, hp, whitelist, false)
    local lowest
    for _, entity in pairs(healables) do
        if not lowest or entity.hp.percent < lowest.hp.percent then
            lowest = entity
        end
    end
    return lowest
end

--Define a function for targeting
local lastTargetCheck = 0
function RoseWHM.Targeting()
    RoseWHM.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    -- Define an entity list for striking dummy
    RoseWHM.strikingDummy = MEntityList("alive,attackable,contentid=1010375,maxdistance=30")
    -- Add striking dummy to entity list
    if table.valid(RoseWHM.strikingDummy) then
        for i, enemy in pairs(RoseWHM.strikingDummy) do
            RoseWHM.elist[i] = enemy
        end
    end
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

-- Define a function to get the lowest health party member
function RoseWHM.LowestHealthPartyMember(partyMembers)
    local lowest
    local lowestHealthPercentage = 101
    for _, member in pairs(partyMembers) do
        local hpPercentage = member.hp.percent
        if hpPercentage < lowestHealthPercentage then
            lowestHealthPercentage = hpPercentage
            lowest = member
        end
    end
    return lowest
end

-- Define a function to use Sprint
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

-- Define a function to use Lucid Dreaming
function RoseWHM.UseLucidDreaming()
    local lucidDreamingId = 7562
    local lucidDreamingAction = ActionList:Get(1, lucidDreamingId)
    if lucidDreamingAction then
        local lucidDreamingRecastTime = lucidDreamingAction.cd
        if Player.mp.percent < 80 then
            if lucidDreamingRecastTime == 0 and lucidDreamingAction:IsReady() then
                lucidDreamingAction:Cast(Player.id)
                return true
            end
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
    -- Check if we are dead
    if RoseWHM.HasBuff(Player, 418) then
        return false
    end
    -- Check if we are mounted or in a cutscene
    if Player.ismounted or Player.incutscene then
        return false
    end
    local targetingResult = RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    local shouldApplyDoT, targetforDoTApplication = RoseWHM.ShouldApplyDoT(enemies)
    local partyMembers = RoseWHM.GetPartyMembers()
    -- Call the Raise function
    RoseWHM.HandleRaise()
    -- Call the Sprint and Lucid Dreaming functions
    RoseWHM.UseSprint()
    RoseWHM.UseLucidDreaming()
    -- Call the AOE healing and single target healing functions
    RoseWHM.AOEHealing(partyMembers)
    RoseWHM.SingleTargetHealing(targetingResult)
    -- Call the DoT application function
    if shouldApplyDoT and targetforDoTApplication then
        RoseWHM.SingleTargetDoT(targetforDoTApplication)
    end
    -- Call the AOE damage and single target damage functions
    RoseWHM.AOEDamage()
    RoseWHM.SingleTargetDamage(targetingResult)
    -- Return false to continue botting
    return false
end

local lastHealTime = 0
local healDelay = 3

function RoseWHM.SingleTargetHealing(targetingResult)
    local currentTime = os.clock()
    if currentTime - lastHealTime < healDelay then
        RoseWHM.Debug("Exiting early due to heal delay.")
        return
    end

    local level = Player.level
    local divineBenison = RoseWHM.Spells.DivineBenison
    local Spells = RoseWHM.Spells
    local GetRoleByJob = RoseWHM.GetRoleByJob
    local partyMembers = RoseWHM.GetPartyMembers()
    local lowest = RoseWHM.GetBestPartyHealTarget(targetingResult)

    if lowest then
        RoseWHM.Debug(string.format("Lowest HP party member: %s, HP: %d%%", lowest.name, lowest.hp.percent))
    else
        RoseWHM.Debug("No party member with the lowest HP identified.")
    end

    if lowest and lowest.hp.percent < 80 then
        if level >= divineBenison.level and RoseWHM.CastSpellIfReady(divineBenison.id, lowest) then
            RoseWHM.Debug(string.format("Casting spell: %s", divineBenison.name))
            lastHealTime = os.clock()
            return
        end
        for _, member in pairs(partyMembers) do
            if GetRoleByJob(member.job) == 'Tank' and level >= Spells.Aquaveil.level and RoseWHM.CastSpellIfReady(Spells.Aquaveil.id, member.id) then
                RoseWHM.Debug(string.format("Casting spell: %s", Spells.Aquaveil.name))
            end
        end
    end

    local tank
    for _, member in pairs(partyMembers) do
        if GetRoleByJob(member.job) ==
                'Tank' then
            tank = member
            break
        end
    end

    if tank then
        RoseWHM.Debug(string.format("Tank identified: %s, HP: %d%%", tank.name, tank.hp.percent))
    else
        RoseWHM.Debug("No tank identified.")
    end

    local singleTargetHealSpells = {
        {spell = Spells.Temperance, level = Spells.Temperance.level, condition = function() return lowest and lowest.hp.percent <= 50 end},
        {spell = Spells.Benediction, level = Spells.Benediction.level, condition = function() return lowest and lowest.hp.percent < 10 end},
        {spell = Spells.Tetragrammaton, level = Spells.Tetragrammaton.level, condition = function() return ((tank and tank.hp.percent < 60) or (lowest and lowest.hp.percent < 60)) end},
        {spell = Spells.AfflatusSolace, level = Spells.AfflatusSolace.level, condition = function() return Player.gauge[2] >= 1 and ((tank and tank.hp.percent < 60) or (lowest and lowest.hp.percent < 60)) end},
        {spell = Spells.Regen, level = Spells.Regen.level, condition = function() return lowest and not RoseWHM.HasBuff(lowest.id, 158) end},
        {spell = Spells.CureII, level = Spells.CureII.level, condition = function() return ((tank and tank.hp.percent < 60) or (lowest and lowest.hp.percent < 60)) and not Player:IsMoving() end},
        {spell = Spells.Cure, level = Spells.Cure.level, condition = function() return ((tank and tank.hp.percent < 60) or (lowest and lowest.hp.percent < 60)) and not Player:IsMoving() end}
    }

    for _, entry in ipairs(singleTargetHealSpells) do
        local spell = entry.spell
        if level >= spell.level and (entry.condition == nil or entry.condition()) then
            if level >= Spells.ThinAir.level and RoseWHM.CastSpellIfReady(Spells.ThinAir.id, Spells.ThinAir.id) then
                RoseWHM.Debug(string.format("Casting spell: %s", Spells.ThinAir.name))
            end
            if RoseWHM.CastSpellIfReady(spell.id, ((tank and tank.hp.percent < 60) and tank.id) or (lowest and lowest.id or Player.id)) then
                RoseWHM.Debug(string.format("Casting spell: %s", spell.name))
                lastHealTime = os.clock()
                return
            else
                RoseWHM.Debug(string.format("Failed to cast spell: %s", spell.name))
            end
        else
            RoseWHM.Debug(string.format("Conditions not met to cast spell: %s", spell.name))
        end
    end
end

-- Define a function for AOE healing
function RoseWHM.AOEHealing(partyMembers, lowest)
    local currentTime = os.clock()
    if currentTime - lastHealTime < healDelay then
        return
    end
    local partyMembersBelow90Percent = 0
    local totalPartyMembers = 0
    local level = Player.level
    if table.valid(partyMembers) then
        for _, member in pairs(partyMembers) do
            local hpPercentage = member.hp.percent
            if hpPercentage < 90 then
                partyMembersBelow90Percent = partyMembersBelow90Percent + 1
            end
            totalPartyMembers = totalPartyMembers + 1
        end
        local halfPartySize = math.ceil(totalPartyMembers / 2)
        if partyMembersBelow90Percent >= halfPartySize then
            local aoeHealSpells = {
                {spell = RoseWHM.Spells.LiturgyOfTheBell, target = Player.id},
                {spell = RoseWHM.Spells.AfflatusRapture, target = lowest, condition = Player.gauge[2] <= 1},
                {spell = RoseWHM.Spells.Asylum, target = Player.id},
                {spell = RoseWHM.Spells.MedicaII, target = Player.id, condition = MissingBuff(Player,150) and not Player:IsMoving()},
                {spell = RoseWHM.Spells.CureIII, target = lowest, condition = not Player:IsMoving()},
                {spell = RoseWHM.Spells.Medica, target = Player.id, condition = not Player:IsMoving()}
            }
            for _, entry in ipairs(aoeHealSpells) do
                local spell = entry.spell
                if level >= spell.level and (entry.condition == nil or entry.condition) then
                    if level >= RoseWHM.Spells.ThinAir.level and RoseWHM.CastSpellIfReady(RoseWHM.Spells.ThinAir.id, RoseWHM.Spells.ThinAir.id) then
                        -- d(string.format("Casting spell: %s", RoseWHM.Spells.ThinAir.name))
                    end
                    if RoseWHM.CastSpellIfReady(spell.id, entry.target) then
                        -- d(string.format("Casting spell: %s", spell.name))
                        lastHealTime = os.clock()
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
    local stone = RoseWHM.Spells.Stone
    local stoneII = RoseWHM.Spells.StoneII
    local stoneIII = RoseWHM.Spells.StoneIII
    local stoneIV = RoseWHM.Spells.StoneIV
    local glare = RoseWHM.Spells.Glare
    local glareIII = RoseWHM.Spells.GlareIII
    local thinAir = RoseWHM.Spells.ThinAir
    local assize = RoseWHM.Spells.Assize
    local presenceOfMind = RoseWHM.Spells.PresenceOfMind
    local afflatusMisery = RoseWHM.Spells.AfflatusMisery
    if level >= thinAir.level and RoseWHM.CastSpellIfReady(thinAir.id, Player) then
        d("Casting Thin Air")
        return
    end
    if level >= presenceOfMind.level and RoseWHM.CastSpellIfReady(presenceOfMind.id, Player) then
        d("Casting Presence of Mind")
        return
    end
    if level >= assize.level and RoseWHM.CastSpellIfReady(assize.id, Player) then
        d("Casting Assize")
        return
    end
    if level >= afflatusMisery.level and RoseWHM.CastSpellIfReady(afflatusMisery.id, target.id) and Player.gauge[3] >= 3 then
        d("Casting Afflatus Misery")
        return
    end
    if level >= glareIII.level and RoseWHM.CastSpellIfReady(glareIII.id, target.id) then
        d("Casting Glare III")
        return
    end
    if level >= glare.level and RoseWHM.CastSpellIfReady(glare.id, target.id) then
        d("Casting Glare")
        return
    end
    if level >= stoneIV.level and RoseWHM.CastSpellIfReady(stoneIV.id, target.id) then
        d("Casting Stone IV")
        return
    end
    if level >= stoneIII.level and RoseWHM.CastSpellIfReady(stoneIII.id, target.id) then
        d("Casting Stone III")
        return
    end
    if level >= stoneII.level and RoseWHM.CastSpellIfReady(stoneII.id, target.id) then
        d("Casting Stone II")
        return
    end
    if level >= stone.level and RoseWHM.CastSpellIfReady(stone.id, target.id) then
        d("Casting Stone")
        return
    end
end

function RoseWHM.AOEDamage()
    RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    if table.valid(enemies) and table.size(enemies) > 1 then
        local level = Player.level
        local aoeDmgSpells = {
            {spell = RoseWHM.Spells.AfflatusMisery, radius = 5, condition = Player.gauge[3] == 3},
            {spell = RoseWHM.Spells.HolyIII, radius = 8, condition = not Player:IsMoving()},
            {spell = RoseWHM.Spells.Holy, radius = 8, condition = not Player:IsMoving()}
        }
        for _, entry in ipairs(aoeDmgSpells) do
            local spell = entry.spell
            local nearbyEnemies = MEntityList("alive,attackable,maxdistance=" .. entry.radius)
            if table.valid(nearbyEnemies) and table.size(nearbyEnemies) > 1 and level >= spell.level and (entry.condition == nil or entry.condition) and RoseWHM.CastSpellIfReady(spell.id, Player.id) then
                d(string.format("Casting spell: %s", spell.name))
                return true
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
    if currentTarget and currentTarget.incombat then
        local singleTargetDoTSpells = {
            {spell = RoseWHM.Spells.Dia, buffId = 187},
            {spell = RoseWHM.Spells.AeroII, buffId = 143},
            {spell = RoseWHM.Spells.Aero, buffId = 144}
        }
        for _, entry in ipairs(singleTargetDoTSpells) do
            local spell = entry.spell
            local buffId = entry.buffId
            if level >= spell.level and not RoseWHM.HasBuff(currentTarget, buffId) then
                local castSuccess = RoseWHM.CastSpellIfReady(spell.id, currentTarget.id)
                if castSuccess then
                    d(string.format("Casting spell: %s", spell.name))
                    return true
                end
            end
        end
    end
    return false
end

-- This function is called when an event occurs. The specific events that trigger this function will depend on how it's used in the context of MMOMinion and RoseWHM.
function RoseWHM.OnEvent(event, damageEvent)
    -- Check if the event is 'damage_taken'
    if event == "damage_taken" then
        -- If 'damage_taken' event is triggered, update the damage data with the information from 'damageEvent'
        RoseWHM.UpdateDamageData(damageEvent)
    end
    -- Other event handling code can be added here.
end

-- Define a function to draw the GUI
function RoseWHM.Draw()
    if RoseWHM.GUI.Open and GUI:Begin(RoseWHM.GUI.Name, RoseWHM.GUI.Open) then
        RoseWHM.ACRMyProfileMySavedVar = GUI:Checkbox("AOE", RoseWHM.ACRMyProfileMySavedVar)
        GUI:End()
    end
end

-- Define a function to handle starting the ACR
function RoseWHM.OnOpen()
    RoseWHM.GUI.Open = true
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
    -- Update the state of the module here.
end

return RoseWHM
