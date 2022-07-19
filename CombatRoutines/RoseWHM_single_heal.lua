function RoseWHM.HandleSingleTargetHealing(level, IsTargetATank, lowest)
    if Player.gauge[2] > 0 then
        local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("AfflactusSolace")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                if RoseCore.HealFormula(lowest, spellValue.potency - 300) then
                    return RoseCore.Action(action, lowest)
                end
            end
        end
    end

    if lowest.hp.percent < 10 and not RoseWHM.IsInSavage then
        local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Benediction")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                return RoseCore.Action(action, lowest)
            end
        end
    end

    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Tetragrammaton")
    if spell ~= nil then
        local action = ActionList:Get(1, spell.ID)
        if RoseCore.IsReady(action) then
            if RoseCore.HealFormula(lowest, spellValue.potency) then
                return RoseCore.Action(action, lowest)
            end
        end
    end

    if RoseWHM.HasDPSTarget and RoseWHM.MainTank ~= 0 then
        local regen = RoseCore.Utils.GetBuff(RoseWHM.MainTank, { 158 })
        local IsTargetMissingBuff = false
        if regen == nil then
            IsTargetMissingBuff = true
        else
            if regen.duration <= 5 then
                IsTargetMissingBuff = true
            end
        end
        if IsTargetMissingBuff then
            local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Regen")
            if spell ~= nil then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, RoseWHM.MainTank)
                end
            end
        end
    end

    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("CureII")
    if spell ~= nil then
        local action = ActionList:Get(1, spell.ID)
        if RoseCore.IsReady(action) then
            if RoseCore.HealFormula(lowest, spellValue.potency) then
                return RoseCore.Action(action, lowest)
            end
        end

        local freeCure = RoseCore.Utils.GetBuff(Player, { 155 }, Player)
        if freeCure ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                return RoseCore.Action(action, lowest)
            end
        end
    end

    local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Cure")
    if spell ~= nil then
        local action = ActionList:Get(1, spell.ID)
        if RoseCore.IsReady(action) then
            if RoseCore.HealFormula(lowest, spellValue.potency) then
                return RoseCore.Action(action, lowest)
            end
        end
    end
end
