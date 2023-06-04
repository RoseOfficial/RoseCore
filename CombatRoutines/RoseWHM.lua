local RoseWHM = {}

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
    PlenaryIndulgence = {id = 7433, level = 70, name = "Plenary Indulgence", cast = 0, recast = 60, mp = 0, range = 0, radius = 20},
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
    StoneII = {id = 127, level = 40, name = "Stone II", cast = 1.5, recast = 2.5, mp = 200, range = 25, radius = 0, potency = 170},
    Stone = {id = 119, level = 1, name = "Stone", cast = 1.5, recast = 2.5, mp = 100, range = 25, radius = 0, potency = 140},
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

local lastTargetCheck = 0
local level = Player.level
local lastSpellWasHeal = false
local instantCast = false

local buffIDTable = {
    Aero = 143,
    AeroII = 144,
    Dia = 1871,
}

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

function RoseWHM.IsReady(spell)
    local spell = ActionList:Get(1, spell.id)
    if spell then
        if spell.cd <= 0 then
            return true
        end
        return false
    end
end

function RoseWHM.Action(action, target)
    if type(action) == "number" then
        action = ActionList:Get(1, action)
    end
    if table.valid(action) and table.valid(target) then
        if target.x and Distance2DT(Player.pos, target) <= action.range then
            d("Casting: " .. action.name)
            return action:Cast(target.x, target.y, target.z)
        else
            if target.distance2d <= action.range then
                d("Casting: " .. action.name)
                return action:Cast(target.id)
            end
        end
    end
end

function RoseWHM.Cast()
    local target = RoseWHM.Targeting()
    local enemies = RoseWHM.elist
    local shouldApplyDoT, targetforDoTApplication = RoseWHM.ShouldApplyDoT(enemies)
    local count = 0
    local inRangeEnemy = 0
    local closeEnemy = 0
    local closestDistance = 100
    local closest = 0
    local party = GetParty()
    local lowest = Player
    local lowestHP = 100
    local AOECount = 0
    local count = 0
    local revive = GetBestRevive(party, role)

    if revive then
        local spell = RoseWHM.oGCD.ThinAir
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, revive)
            end
        end
        local spell = RoseWHM.oGCD.SwiftCast
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, revive)
            end
        end
        local spell = RoseWHM.gcd.Raise
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, revive)
            end
        end
    end

    for i, member in pairs(party) do
        count = count + 1
        if member.hp.percent < 90 then
            AOECount = AOECount + 1
        end
    end

    if Player.mp.percent <= 75 then
        local spell = RoseWHM.oGCD.LucidDreaming
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end
    end

    local spell = RoseWHM.oGCD.Temperance
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, lowest)
        end
    end

    if ((AOECount * 100) / count) >= 50 then
        local spell = RoseWHM.oGCD.LiturgyOfTheBell
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.oGCD.Asylum
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.oGCD.PlenaryIndulgence
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.instant.AfflatusRapture
        if level >= spell.level then
            if Player.gauge[2] >= 1 then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, lowest)
                end
            end
        end

        local spell = RoseWHM.gcd.CureIII
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.gcd.MedicaII
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.gcd.Medica
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end
    end

    if lowestHP <= 75 then
        if lowestHP <= 25 then
            local spell = RoseWHM.oGCD.Benediction
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, lowest)
                end
            end
        end

        local spell = RoseWHM.oGCD.Temperance
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.oGCD.aquaveil
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.oGCD.DivineBenison
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.oGCD.Tetragrammaton
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        if Player.gauge[2] > 0 then
            local spell = RoseWHM.instant.AfflatusSolace
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, lowest)
                end
            end
        end

        if not HasBuff(lowest, 158) then
            local spell = RoseWHM.instant.Regen
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, lowest)
                end
            end
        end

        local spell = RoseWHM.gcd.CureII
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end

        local spell = RoseWHM.gcd.Cure
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, lowest)
            end
        end
    end

    if table.valid(enemies) then
        for i, enemy in pairs(enemies) do
            if enemy.distance2d <= 30 then
                count = count + 1
            end
            if enemy.distance2d <= 5 then
                closeEnemy = closeEnemy + 1
            end
            if enemy.distance2d <= 25 then
                inRangeEnemy = inRangeEnemy + 1
            end
            if enemy.distance2d < closestDistance then
                closestDistance = enemy.distance2d
                closest = i
            end
        end
    end

    if closeEnemy >= 3 then
        local spell = RoseWHM.oGCD.Assize
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, target)
            end
        end

        local spell = RoseWHM.instant.AfflatusMisery
        if level >= spell.level then
            if Player.gauge[3] == 3 then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, target)
                end
            end
        end

        local spell = RoseWHM.gcd.HolyIII
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, Player)
            end
        end

        local spell = RoseWHM.gcd.Holy
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, Player)
            end
        end
    end

    if shouldApplyDoT and targetforDoTApplication then

        if buffIDTable.Aero or buffIDTable.AeroII or buffIDTable.Dia then
            local spell = RoseWHM.instant.Dia
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, targetforDoTApplication)
                end
            end
        end

        if buffIDTable.Aero or buffIDTable.AeroII or buffIDTable.Dia then
            local spell = RoseWHM.instant.AeroII
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, targetforDoTApplication)
                end
            end
        end

        if buffIDTable.Aero or buffIDTable.AeroII or buffIDTable.Dia then
            local spell = RoseWHM.instant.Aero
            if level >= spell.level then
                local action = ActionList:Get(1, spell.id)
                if RoseWHM.IsReady(spell) then
                    return RoseWHM.Action(action, targetforDoTApplication)
                end
            end
        end
        return false
    end

    local spell = RoseWHM.oGCD.PresenceOfMind
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.oGCD.Assize
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    if Player.gauge[3] >= 3 then
        local spell = RoseWHM.instant.AfflatusMisery
        if level >= spell.level then
            local action = ActionList:Get(1, spell.id)
            if RoseWHM.IsReady(spell) then
                return RoseWHM.Action(action, target)
            end
        end
    end

    local spell = RoseWHM.gcd.GlareIII
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.gcd.Glare
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.gcd.StoneIV
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.gcd.StoneIII
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.gcd.StoneII
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
        end
    end

    local spell = RoseWHM.gcd.Stone
    if level >= spell.level then
        local action = ActionList:Get(1, spell.id)
        if RoseWHM.IsReady(spell) then
            return RoseWHM.Action(action, target)
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