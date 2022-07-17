function RoseSGE.HandleAOEHealing(level, lowPartyHP, totalPlayerCount, lowest, PlayerCountInParty)
    local PepsiCount = 0
    local AOECount = 0
    for i, e in pairs(lowPartyHP) do
        local buff = RoseSGE.Utils.GetBuff(e, { 2607, 2606 }, Player)
        if e.distance2d <= 15 and buff ~= nil then
            PepsiCount = PepsiCount + 1
        end
        if e.distance2d <= 15 then
            AOECount = AOECount + 1
        end
    end

    local eukrasianprognosiscount = 0
    for i, e in pairs(lowPartyHP) do
        if MissingBuff(e, RoseSGE.BuffID.EukrasianPrognosis) and e.distance2d <= 15 then
            eukrasianprognosiscount = eukrasianprognosiscount + 1
        end
    end

    -- I saw lot of time Pepsi was being used for healing, but as player didn't had any buff, it was doing all miss.
    -- So I added a check to see if 50% or more of the party have buff, if yes then use Pepsi.
    -- This make the skill less used, but as it was used in a useless way before not a big deal,
    -- also looking at The Balance tutorial, this skill is not that often used, so it should be alright now.
    local haveBuffOn100 = (PepsiCount * 100) / totalPlayerCount
    RoseSGE.DebugPrint("HaveBuff: " .. PepsiCount .. "/" .. totalPlayerCount .. " | HaveBuffOn100: " .. haveBuffOn100)
    if haveBuffOn100 >= 50 and level >= 58 and SageHotbarSettings.Pepsis.bool then
        local pepsis = ActionList:Get(1, 24301)
        if RoseCore.IsReady(pepsis) then
            if RoseCore.HealFormula(lowest, 450) then
                RoseSGE.DidAOEHeal = true
                return RoseCore.Action(pepsis, Player)
            end
        end
    end

    if AOECount > RoseSGE.GetAOECountForPartySize(PlayerCountInParty) then
        if level >= 90 and SageHotbarSettings.Pneuma.bool and RoseSGE.HasDPSTarget then
            local pneuma = ActionList:Get(1, 24318)
            if RoseCore.IsReady(pneuma) then
                if RoseCore.HealFormula(lowest, 600) then
                    return RoseCore.Action(pneuma, RoseSGE.CurrentDPSTarget)
                end
            end
        end

        -- Same as for druochole, but this is for AOE healing.
        -- Helps with mana regen and was reported in analysis,
        -- having it first avoid caping Addersgall
        if level >= 52 and Player.gauge[2] >= 1 and SageHotbarSettings.Ixochole.bool then
            local ixochole = ActionList:Get(1, 24299)
            if RoseCore.IsReady(ixochole) then
                if RoseCore.HealFormula(lowest, 400) then
                    RoseSGE.DidAOEHeal = true
                    return RoseCore.Action(ixochole, Player)
                end
            end
        end

        if level >= 60 and SageHotbarSettings.PhysisII.bool then
            local physis_ii = ActionList:Get(1, 24302)
            if RoseCore.IsReady(physis_ii) then
                if RoseCore.HealFormula(lowest, 130) then
                    RoseSGE.DidAOEHeal = true
                    return RoseCore.Action(physis_ii, Player)
                end
            end
        end

        if level >= 20 and level <= 59 and SageHotbarSettings.Physis.bool then
            local physis = ActionList:Get(1, 24288)
            if RoseCore.IsReady(physis) then
                if RoseCore.HealFormula(lowest, 100) then
                    RoseSGE.DidAOEHeal = true
                    return RoseCore.Action(physis, Player)
                end
            end
        end


        if level >= 30 and eukrasianprognosiscount >= 2 and SageHotbarSettings.Eukrasia.bool and
            SageHotbarSettings.EukrasianPrognosis.bool then
            if MissingBuff(Player, 2606) then
                local eukrasia = ActionList:Get(1, 24290)
                if RoseCore.IsReady(eukrasia) then
                    if RoseCore.HealFormula(lowest, 100) then
                        RoseSGE.DidAOEHeal = true
                        return RoseCore.Action(eukrasia, Player)
                    end
                end
            end

            local eukrasianprognosis = ActionList:Get(1, 24292)
            if RoseCore.IsReady(eukrasianprognosis) then
                if RoseCore.HealFormula(lowest, 100) then
                    RoseSGE.DidAOEHeal = true
                    return RoseCore.Action(eukrasianprognosis, Player)
                end
            end
        end

        -- GCD Heal
        if level >= 10 and SageHotbarSettings.Prognosis.bool then
            local prognosis = ActionList:Get(1, 24286)
            if RoseCore.IsReady(prognosis) then
                if RoseCore.HealFormula(lowest, 300) then
                    RoseSGE.PrognosisTime = Now()
                    RoseSGE.DidAOEHeal = true
                    return RoseCore.Action(prognosis, Player)
                end
            end
        end
    end
end
