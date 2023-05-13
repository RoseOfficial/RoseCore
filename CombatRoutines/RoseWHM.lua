-- This is RoseWHM, a White Mage ACR for MMOMinion for FFXIV
local RoseWHM = {}

RoseWHM.Settings = {
    AOE = true,
    Debug = true,
}

RoseWHM.GUI = {
    Open = false,
    Visible = false,
    Name = "RoseWHM",
    Height = 200,
    Width = 200
}

RoseWHM.classes = {
    [FFXIV.JOBS.WHITEMAGE] = true,
    [FFXIV.JOBS.CONJURER] = true,
}

RoseWHM.Spells = {
    Stone = {id = 119, level = 1, name = "Stone", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 140},
    Cure = {id = 120, level = 2, name = "Cure", cast = 1.5, recast = 2.5, mp = 400, range = 30, radius = 0, potency = 500},
    Aero = {id = 121, level = 4, name = "Aero", cast = 0, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 50, duration = 30},
    Medica = {id = 124, level = 10, name = "Medica", cast = 2, recast = 2.5, mp = 900, range = 0, radius = 15, potency = 400},
    Raise = {id = 125, level = 12, name = "Raise", cast = 8, recast = 2.5, mp = 2400, range = 30, radius = 0},
    SwiftCast = {id = 7561, level = 18, name = "SwiftCast", cast = 0, recast = 60, mp = 0, range = 0, radius = 0},
    StoneII = {id = 127, level = 18, name = "Stone II", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 190},
    CureII = {id = 135, level = 30, name = "Cure II", cast = 2, recast = 2.5, mp = 1000, range = 30, radius = 0, potency = 800},
    PresenceOfMind = {id = 136, level = 30, name = "Presence of Mind", cast = 0, recast = 120, mp = 0, range = 0, radius = 0},
    Regen = {id = 137, level = 35, name = "Regen", cast = 0, recast = 2.5, mp = 400, range = 30, radius = 0, potency = 250, duration = 18},
    CureIII = {id = 131, level = 40, name = "Cure III", cast = 2, recast = 2.5, mp = 1500, range = 30, radius = 10, potency = 600},
    Holy = {id = 139, level = 45, name = "Holy", cast = 2.5, recast = 2.5, mp = 400, range = 0, radius = 8},
    AeroII = {id = 132, level = 46, name = "Aero II", cast = 0, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 50, duration = 30},
    MedicaII = {id = 133, level = 50, name = "Medica II", cast = 2, recast = 2.5, mp = 1000, range = 0, radius = 20, potency = 250, duration = 15},
    Benediction = {id = 140, level = 50, name = "Benediction", cast = 0, recast = 180, mp = 0, range = 30, radius = 0},
    AfflatusSolace = {id = 16531, level = 52, name = "Afflatus Solace", cast = 0, recast = 2.5, mp = 0, range = 30, radius = 0, potency = 800},
    Asylum = {id = 3569, level = 52, name = "Asylum", cast = 0, recast = 90, mp = 0, range = 30, radius = 10, potency = 100, duration = 24},
    StoneIII = {id = 3568, level = 54, name = "Stone III", cast = 1.5, recast = 2.5, mp = 300, range = 25, radius = 0, potency = 220},
    Assize = {id = 3571, level = 56, name = "Assize", cast = 0, recast = 40, mp = 0, range = 0, radius = 15},
    ThinAir = {id = 7430, level = 58, name = "Thin Air", cast = 0, recast = 60, mp = 0, range = 0, radius = 0},
    Tetragrammaton = {id = 3570, level = 60, name = "Tetragrammaton", cast = 0, recast = 60, mp = 0, range = 30, radius = 0, potency = 700},
    StoneIV = {id = 7431, level = 64, name = "Stone IV", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 260},
    DivineBenison = {id = 7432, level = 66, name = "Divine Benison", cast = 0, recast = 30, mp = 0, range = 30, radius = 0},
    PlenaryIndulgence = {id = 7433, level = 70, name = "Plenary Indulgence", cast = 0, recast = 60, mp = 0, range = 0, radius = 20},
    Dia = {id = 16532, level = 72, name = "Dia", cast = 0, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 60, duration = 30},
    Glare = {id = 16533, level = 72, name = "Glare", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 290},
    AfflatusMisery = {id = 16535, level = 74, name = "Afflatus Misery", cast = 0, recast = 2.5, mp = 0, range = 25, radius = 5, potency = 1240},
    AfflatusRapture = {id = 16534, level = 76, name = "Afflatus Rapture", cast = 0, recast = 2.5, mp = 0, range = 0, radius = 20, potency = 400},
    Temperance = {id = 16536, level = 80, name = "Temperance", cast = 0, recast = 120, mp = 0, range = 0, radius = 0},
    GlareIII = {id = 25859, level = 82, name = "Glare III", cast = 1.5, recast = 2.5, mp = 400, range = 25, radius = 0, potency = 310},
    HolyIII = {id = 25860, level = 82, name = "Holy III", cast = 2.5, recast = 2.5, mp = 400, range = 0, radius = 8, potency = 150},
    Aquaveil = {id = 25861, level = 86, name = "Aquaveil", cast = 0, recast = 60, mp = 0, range = 30, radius = 0},
    LiturgyOfTheBell = {id = 25862, level = 90, name = "Liturgy of the Bell", cast = 0, recast = 180, mp = 0, range = 30, radius = 0, potency = 400, duration = 20}
}

local buffIDTable = {
    Aero = 143,
    AeroII = 144,
    Dia = 1871,
}

local debugContexts = {}

function RoseWHM.Debug(context, message)
    if debugContexts[context] ~= message then
        d(message)
        debugContexts[context] = message
    end
end

function table.contains(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

function RoseWHM.GetRoleByJob(job)
    local tankJobs = {1, 3, 19, 21, 32, 37}
    if table.contains(tankJobs, job) then
        return "tank"
    return nil
end

function RoseWHM.SearchEntities(searchString)
    local el = MEntityList(searchString)
    local validEntities = {}
    if table_valid(el) then
        for i, entity in pairs(el) do
            if (IsValidHealTarget(entity)) then
                validEntities[i] = entity
            end
        end
    end
    return validEntities
end

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
            end
        end
        if not hasDoTBuff then
            return true, enemy
        end
    end
    return false, nil
end

function RoseWHM.ActionIsReady(id)
    if (MIsLoading() or not ActionList:IsReady()) then
        return false
    end
    local id = tonumber(id) or 0
    local action = ActionList:Get(1, id)
    if (table.valid(action)) then
        local isOffCooldown = action.cd <= 0
        local currentMP = Player.mp.current
        local hasEnoughResources = currentMP >= action.cost
        return isOffCooldown and hasEnoughResources
    end
    return false
end

function RoseWHM.CastSpellIfReady(spellId, targetId)
    local action = ActionList:Get(1, spellId)
    if action and action.cd == 0 and action:IsReady(targetId) then
        action:Cast(targetId)
        return true
    end
    return false
end

function RoseWHM.GetBestRevive(party, role)
    party = IsNull(party, false)
    role = role or ""
    range = 30
    local el = nil
    if (party) then
        el = MEntityList("myparty,friendly,chartype=4,targetable,dead,maxdistance=" .. tostring(range))
    else
        el = MEntityList("friendly,dead,chartype=4,targetable,maxdistance=" .. tostring(range))
    end
    if (table.valid(el)) then
        local roleTable = GetRoleTable(role)
        for id, entity in pairs(el) do
            if (not HasBuffs(entity, "148") and (not roleTable or roleTable[entity.job])) then
                d(string.format("Found valid revive target: %s", entity.name))
                return entity
            end
        end
    end
    return nil
end

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

function RoseWHM.HandleRaise()
    local PartyMembersDead = RoseWHM.GetDeadPartyMembers()
    if table.valid(PartyMembersDead) and Player.level >= 12 and Player.mp.percent >= 24 then
        local raiseId = RoseWHM.Spells.Raise.id
        local swiftcastId = RoseWHM.Spells.SwiftCast.id
        local raiseTarget = RoseWHM.GetBestRevive(true, "")

        if table.valid(raiseTarget) and MissingBuffs(raiseTarget, "148+1140") then
            local reztime = 0
            if Player.level >= 18 and RoseWHM.CastSpellIfReady(swiftcastId, Player.id) then
                return RoseWHM.SwiftcastRaise(raiseTarget)
            elseif RoseWHM.CastSpellIfReady(raiseId, raiseTarget.id) then
                if TimeSince(reztime) > 2000 then
                    reztime = Now()
                    return RoseWHM.CastSpellIfReady(raiseId, raiseTarget.id)
                end
            end
        end
    end
end

function RoseWHM.SwiftcastRaise(target)
    if target then
        local swiftcastId = RoseWHM.Spells.SwiftCast.id
        local raiseId = RoseWHM.Spells.Raise.id
        RoseWHM.CastSpellIfReady(swiftcastId, Player.id)
        local swiftcastApplied = false
        local startTime = os.clock()
        while not swiftcastApplied and os.clock() - startTime < 3 do
            local swiftcastBuff = HasBuff(Player,167)
            if swiftcastBuff then
                swiftcastApplied = true
            else
                coroutine.yield()
            end
        end
        if swiftcastApplied then
            RoseWHM.CastSpellIfReady(raiseId, target.id)
        end
    end
end

function RoseWHM.CheckEnemiesForDoTDebuffs()
    local enemiesWithDebuffs = {}
    if table.valid(RoseWHM.elist) then
        for _, enemy in pairs(RoseWHM.elist) do
            for _, buff in pairs(enemy.buffs) do
                if tonumber(buff.ownerid) == tonumber(Player.id) and buffIDTable[tonumber(buff.id)] then
                    table.insert(enemiesWithDebuffs, enemy)
                    break
                end
            end
        end
    end
    return enemiesWithDebuffs
end

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

function RoseWHM.GetBestPartyHealTarget()
    local range = range or ml_global_information.AttackRange
    local hp = hp or 95
    local whitelist = IsNull(whitelist, "")
    local healables = RoseWHM.GetHealableTargets(range, hp, whitelist, false)
    local lowest = nil
    for _, entity in pairs(healables) do
        if not lowest or entity.hp.percent < lowest.hp.percent then
            lowest = entity
        end
    end
    return lowest
end

local lastTargetCheck = 0
function RoseWHM.Targeting()
    RoseWHM.elist = MEntityList("alive,attackable,incombat,maxdistance=30")
    local target = MGetTarget()
    local partyMembers = RoseWHM.GetPartyMembers()
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
end

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

function RoseWHM.LowestHealthPartyMember(partyMembers)
    local lowest = nil
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
    return false
end

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

function RoseWHM.Cast()
    if RoseWHM.HasBuff(Player, 418) then
        return false
    end
    local targetingResult = RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    local shouldApplyDoT, targetforDoTApplication = RoseWHM.ShouldApplyDoT(enemies)
    local partyMembers = RoseWHM.GetPartyMembers()
    RoseWHM.HandleRaise()
    RoseWHM.UseSprint()
    RoseWHM.UseLucidDreaming()
    RoseWHM.AOEHealing(partyMembers)
    RoseWHM.SingleTargetHealing(targetingResult)
    if shouldApplyDoT and targetforDoTApplication then
        RoseWHM.SingleTargetDoT(targetforDoTApplication)
    end
    RoseWHM.AOEDamage()
    RoseWHM.SingleTargetDamage()
    return false
end

local lastHealTime = 0
local healDelay = 3
function RoseWHM.SingleTargetHealing(targetingResult)
    local currentTime = os.clock()
    if currentTime - lastHealTime < healDelay then return end
    local lowest = RoseWHM.GetBestPartyHealTarget(targetingResult)
    local level = Player.level
    local divineBenison = RoseWHM.Spells.DivineBenison
    if lowest and lowest.hp.percent < 80 then
        if level >= divineBenison.level and RoseWHM.CastSpellIfReady(divineBenison.id, lowest) then
            d(string.format("Casting spell: %s", divineBenison.name))
            lastHealTime = os.clock()
            return
        end
        for _, member in pairs(partyMembers) do
            if RoseWHM.GetRoleByJob(member.job) == 'Tank' and level >= RoseWHM.Spells.Aquaveil.level and RoseWHM.CastSpellIfReady(RoseWHM.Spells.Aquaveil.id, member.id) then
                d(string.format("Casting spell: %s", RoseWHM.Spells.Aquaveil.name))
            end
        end
        local singleTargetHealSpells = {
            {spell = RoseWHM.Spells.Temperance, level = RoseWHM.Spells.Temperance.level, condition = lowest.hp.percent <= 50},
            {spell = RoseWHM.Spells.Benediction, level = RoseWHM.Spells.Benediction.level, condition = lowest.hp.percent < 10},
            {spell = RoseWHM.Spells.Tetragrammaton, level = RoseWHM.Spells.Tetragrammaton.level},
            {spell = RoseWHM.Spells.AfflatusSolace, level = RoseWHM.Spells.AfflatusSolace.level, condition = Player.gauge[2] >= 1},
            {spell = RoseWHM.Spells.Regen, level = RoseWHM.Spells.Regen.level, condition = not RoseWHM.HasBuff(lowest.id, 158)},
            {spell = RoseWHM.Spells.CureII, level = RoseWHM.Spells.CureII.level, condition = lowest.hp.percent < 60 and not Player:IsMoving()},
            {spell = RoseWHM.Spells.Cure, level = RoseWHM.Spells.Cure.level, condition = lowest.hp.percent < 60 and not Player:IsMoving()}
        }
        for _, entry in ipairs(singleTargetHealSpells) do
            local spell = entry.spell
            if level >= spell.level and (entry.condition == nil or entry.condition) then
                if level >= thinAir.level and RoseWHM.CastSpellIfReady(thinAir.id, Player.id) then
                    d(string.format("Casting spell: %s", thinAir.name))
                end
                if RoseWHM.CastSpellIfReady(spell.id, entry.target) then
                    d(string.format("Casting spell: %s", spell.name))
                    lastHealTime = os.clock()
                    return
                end
            end
        end
    end
end

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
                    if level >= thinAir.level and RoseWHM.CastSpellIfReady(thinAir.id, Player.id) then
                        d(string.format("Casting spell: %s", thinAir.name))
                    end
                    if RoseWHM.CastSpellIfReady(spell.id, entry.target) then
                        d(string.format("Casting spell: %s", spell.name))
                        lastHealTime = os.clock()
                        return
                    end
                end
            end
        end
    end
end

function RoseWHM.SingleTargetDamage()
    RoseWHM.Targeting()
    local currentTarget = MGetTarget()
    local level = Player.level
    if currentTarget and currentTarget.incombat then
        local presenceOfMind = RoseWHM.Spells.PresenceOfMind
        if level >= presenceOfMind.level and RoseWHM.CastSpellIfReady(presenceOfMind.id, Player.id) then
            d(string.format("Casting spell: %s", presenceOfMind.name))
        end
        local singleTargetDmgSpells = {
            {spell = RoseWHM.Spells.Assize, radius = 15, condition = currentTarget.distance2d <= 15},
            {spell = RoseWHM.Spells.GlareIII, condition = not Player:IsMoving()},
            {spell = RoseWHM.Spells.StoneIV, condition = not Player:IsMoving()},
            {spell = RoseWHM.Spells.StoneIII, condition = not Player:IsMoving()},
            {spell = RoseWHM.Spells.StoneII, condition = not Player:IsMoving()},
            {spell = RoseWHM.Spells.Stone, condition = not Player:IsMoving()}
        }
        for _, entry in ipairs(singleTargetDmgSpells) do
            local spell = entry.spell
            if level >= spell.level and (entry.condition == nil or entry.condition) and RoseWHM.CastSpellIfReady(spell.id, currentTarget.id) then
                d(string.format("Casting spell: %s", spell.name))
                return true
            end
        end
    end
    return false
end

function RoseWHM.AOEDamage()
    RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    if table.valid(enemies) and table.size(enemies) > 1 then
        local level = Player.level
        local aoeDmgSpells = {
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

function RoseWHM.IsCasting()
    local castingInfo = Player.castinginfo
    return castingInfo and castingInfo.iscasting
end

function RoseWHM.OnEvent(event, damageEvent)
    if event == "damage_taken" then
        RoseWHM.UpdateDamageData(damageEvent)
    end
end

function RoseWHM.Draw()
    if RoseWHM.GUI.Open and GUI:Begin(RoseWHM.GUI.Name, RoseWHM.GUI.Open) then
        RoseWHM.ACRMyProfileMySavedVar = GUI:Checkbox("AOE", RoseWHM.ACRMyProfileMySavedVar)
        GUI:End()
    end
end

function RoseWHM.OnOpen()
    RoseWHM.GUI.Open = true
end

function RoseWHM.OnLoad()
    ACRMyProfileMySavedVar = ACR.GetSetting("ACRMyProfileMySavedVar",false)
end

function RoseWHM.OnClick(mouse,shiftState,controlState,altState,entity)
end

function RoseWHM.OnUpdate()
end

return RoseWHM
