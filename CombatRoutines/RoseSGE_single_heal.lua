function RoseSGE.HandleSingleTargetHealing(level, IsTargetATank, lowest)
    -- Switched this in first position to make it a priority healing
    -- It helps with mana regen and was reported in analysis
    -- having it first avoid caping Addersgall
    if level >= RoseCore.GetSkill(24296).level and Player.gauge[2] >= 1 and SageHotbarSettings.Druochole.bool then
        local druochole = ActionList:Get(1, 24296)
        if RoseCore.IsReady(druochole) then
            if RoseCore.HealFormula(lowest, 600) then
                return RoseCore.Action(druochole, lowest)
            end
        end
    end

    if level >= 90 and SageHotbarSettings.Pneuma.bool and RoseSGE.HasDPSTarget then
        local pneuma = ActionList:Get(1, 24318)
        if RoseCore.IsReady(pneuma) then
            if RoseCore.HealFormula(lowest, 600) then
                return RoseCore.Action(pneuma, RoseSGE.CurrentDPSTarget)
            end
        end
    end

    if level >= 62 and Player.gauge[2] >= 1 and SageHotbarSettings.Taurochole.bool then
        local taurochole = ActionList:Get(1, 24303)
        if RoseCore.IsReady(taurochole) then
            if RoseCore.HealFormula(lowest, 700) then
                return RoseCore.Action(taurochole, lowest)
            end
        end
    end

    if level >= 86 and IsTargetATank and SageHotbarSettings.Krasis.bool then
        local krasis = ActionList:Get(1, 24317)
        if RoseCore.IsReady(krasis) then
            return RoseCore.Action(krasis, lowest)
        end
    end

    if level >= 70 and IsTargetATank and SageHotbarSettings.Haima.bool then
        local haima = ActionList:Get(1, 24305)
        if RoseCore.IsReady(haima) then
            return RoseCore.Action(haima, lowest)
        end
    end

    if level >= 30 and MissingBuff(lowest, 2607) and SageHotbarSettings.Eukrasia.bool and
        SageHotbarSettings.EukrasianDiagnosis.bool then
        if MissingBuff(Player, 2606) then
            local eukrasia = ActionList:Get(1, 24290)
            if RoseCore.IsReady(eukrasia) then
                if RoseCore.HealFormula(lowest, 400) then
                    return RoseCore.Action(eukrasia, Player)
                end
            end
        end
        local eukrasiandiagnosis = ActionList:Get(1, 24291)
        if RoseCore.IsReady(eukrasiandiagnosis) then
            if RoseCore.HealFormula(lowest, 300) then
                return RoseCore.Action(eukrasiandiagnosis, lowest)
            end
        end
    end

    if level >= 2 and SageHotbarSettings.Diagnosis.bool then
        local diagnosis = ActionList:Get(1, 24284)
        if RoseCore.IsReady(diagnosis) then
            if RoseCore.HealFormula(lowest, 400) then
                return RoseCore.Action(diagnosis, lowest)
            end
        end
    end
end