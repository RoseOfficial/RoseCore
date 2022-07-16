function RoseSGE.HandleSingleTargetHealing(level, IsTargetATank, lowest)
    -- Switched this in first position to make it a priority healing
    -- It helps with mana regen and was reported in analysis
    -- having it first avoid caping Addersgall
    if level >= RoseSGE.GetSkill(24296).level and Player.gauge[2] >= 1 and SageHotbarSettings.Druochole.bool then
        local druochole = ActionList:Get(1, 24296)
        if RoseSGE.IsReady(druochole) then
            if RoseSGE.HealFormula(lowest, 600) then
                return RoseSGE.Action(druochole, lowest)
            end
        end
    end

    if level >= 90 and SageHotbarSettings.Pneuma.bool and RoseSGE.HasDPSTarget then
        local pneuma = ActionList:Get(1, 24318)
        if RoseSGE.IsReady(pneuma) then
            if RoseSGE.HealFormula(lowest, 600) then
                return RoseSGE.Action(pneuma, RoseSGE.CurrentDPSTarget)
            end
        end
    end

    if level >= 62 and Player.gauge[2] >= 1 and SageHotbarSettings.Taurochole.bool then
        local taurochole = ActionList:Get(1, 24303)
        if RoseSGE.IsReady(taurochole) then
            if RoseSGE.HealFormula(lowest, 700) then
                return RoseSGE.Action(taurochole, lowest)
            end
        end
    end

    if level >= 86 and IsTargetATank and SageHotbarSettings.Krasis.bool then
        local krasis = ActionList:Get(1, 24317)
        if RoseSGE.IsReady(krasis) then
            return RoseSGE.Action(krasis, lowest)
        end
    end

    if level >= 70 and IsTargetATank and SageHotbarSettings.Haima.bool then
        local haima = ActionList:Get(1, 24305)
        if RoseSGE.IsReady(haima) then
            return RoseSGE.Action(haima, lowest)
        end
    end

    if level >= 30 and MissingBuff(lowest, 2607) and SageHotbarSettings.Eukrasia.bool and
        SageHotbarSettings.EukrasianDiagnosis.bool then
        if MissingBuff(Player, 2606) then
            local eukrasia = ActionList:Get(1, 24290)
            if RoseSGE.IsReady(eukrasia) then
                if RoseSGE.HealFormula(lowest, 400) then
                    return RoseSGE.Action(eukrasia, Player)
                end
            end
        end
        local eukrasiandiagnosis = ActionList:Get(1, 24291)
        if RoseSGE.IsReady(eukrasiandiagnosis) then
            if RoseSGE.HealFormula(lowest, 300) then
                return RoseSGE.Action(eukrasiandiagnosis, lowest)
            end
        end
    end

    if level >= 2 and SageHotbarSettings.Diagnosis.bool then
        local diagnosis = ActionList:Get(1, 24284)
        if RoseSGE.IsReady(diagnosis) then
            if RoseSGE.HealFormula(lowest, 400) then
                return RoseSGE.Action(diagnosis, lowest)
            end
        end
    end
end