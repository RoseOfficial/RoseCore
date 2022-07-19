function RoseWHM.HandleAOEHealing(level, lowPartyHP, totalPlayerCount, lowest, PlayerCountInParty)
    local AOECount = 0
    local count = 0
    local under30 = 0
    for i, e in pairs(lowPartyHP) do
        count = count + 1
        if e.distance2d <= 15 then
            AOECount = AOECount + 1
        end

        if e.hp.percent < 30 then
            under30 = under30 + 1
        end
    end

    if ((AOECount * 100) / count) >= 50 then

        local buffPlenaryIndulgence = RoseCore.Utils.GetBuff(Player, { 1219 }, Player)
        if buffPlenaryIndulgence == nil then
            if Player.gauge[2] > 0 then
                local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("AfflactusRupture")
                if spell ~= nil then
                    local action = ActionList:Get(1, spell.ID)
                    if RoseCore.IsReady(action) then
                        if RoseCore.HealFormula(lowest, spellValue.potency - 100) then
                            RoseWHM.DidAOEHeal = true
                            return RoseCore.Action(action, Player)
                        end
                    end
                end
            end
        end

        local spell = RoseWHM.GetCorrectSpellForCurrentLevel("Assize")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                return RoseCore.Action(action, Player)
            end
        end

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

        if ((under30 * 100) / count) >= 70 then
            local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("CureIII")
            if spell ~= nil then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    if RoseCore.HealFormula(lowest, spellValue.potency + 250) then
                        RoseWHM.DidAOEHeal = true
                        return RoseCore.Action(action, Player)
                    end
                end
            end
        end

        local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("MedicaII")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                if RoseCore.HealFormula(lowest, spellValue.potency + 200) then
                    RoseWHM.DidAOEHeal = true
                    return RoseCore.Action(action, Player)
                end
            end
        end

        local spell, spellValue = RoseWHM.GetCorrectSpellForCurrentLevel("Medica")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                if RoseCore.HealFormula(lowest, spellValue.potency) then
                    RoseWHM.DidAOEHeal = true
                    return RoseCore.Action(action, Player)
                end
            end
        end
    end
end