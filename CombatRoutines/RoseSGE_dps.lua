function RoseSGE.HandleAttack(target, level, elist)

    local targets = {}
    local IsTargetMissingBuff = false

    if not SageHotbarSettings.SmartDot.bool then
        local buff = RoseSGE.Utils.GetBuff(target, { 2614, 2615, 2616 }, Player)
        if buff == nil then
            IsTargetMissingBuff = true
        else
            if buff.duration <= 5 then
                IsTargetMissingBuff = true
            end
        end
        table.insert(targets, target)
    else
        local count = 0
        for _, _ in pairs(elist) do
            count = count + 1
        end

        -- Avoid doing dot logic if there is more than X enemie, it's more DPS to just do mass AOE
        -- enemie count will probably need a tweak, not sure if 3 or 4 is the right one
        -- Allow the dot logic when player is moving like using TensorDrift
        if count <= 3 or Player:IsMoving() then
            for _, target in pairs(elist) do
                if target.distance2d <= 25 then
                    local buff = RoseSGE.Utils.GetBuff(target, { 2614, 2615, 2616 }, Player)
                    if buff == nil then
                        IsTargetMissingBuff = true
                        table.insert(targets, target)
                    else
                        if buff.duration <= 5 then
                            IsTargetMissingBuff = true
                            table.insert(targets, target)
                        end
                    end
                end
            end
        end
    end

    if level >= 30 and SageHotbarSettings.Eukrasia.bool and IsTargetMissingBuff then
        local eukrasiaBuff = RoseSGE.Utils.GetBuff(Player, { 2606 }, Player)
        if eukrasiaBuff == nil then
            local eukrasia = ActionList:Get(1, 24290)
            if RoseSGE.IsReady(eukrasia) then
                return RoseSGE.Action(eukrasia, Player)
            end
        end

        for k, v in pairs(targets) do

            if eukrasiaBuff ~= nil then
                if level >= 82 and SageHotbarSettings.EukrasianDosisIII.bool and SageHotbarSettings.Eukrasia.bool then
                    local eukrasiandosis_iii = ActionList:Get(1, 24314)
                    if RoseSGE.IsReady(eukrasiandosis_iii) then
                        return RoseSGE.Action(eukrasiandosis_iii, v)
                    end
                end

                if level >= 72 and level <= 81 and SageHotbarSettings.EukrasianDosisII.bool and
                    SageHotbarSettings.Eukrasia.bool then
                    local eukrasiandosis_ii = ActionList:Get(1, 24308)
                    if RoseSGE.IsReady(eukrasiandosis_ii) then
                        return RoseSGE.Action(eukrasiandosis_ii, v)
                    end
                end

                if level >= 30 and level <= 71 and SageHotbarSettings.EukrasianDosis.bool and
                    SageHotbarSettings.Eukrasia.bool then
                    local eukrasiandosis = ActionList:Get(1, 24293)
                    if RoseSGE.IsReady(eukrasiandosis) then
                        return RoseSGE.Action(eukrasiandosis, v)
                    end
                end
            end
        end
    end


    local enemycount = 0
    local pneumacount = 0
    for i, e in pairs(elist) do
        if e.distance2d <= 25 then
            if e.distance2d <= 5 then
                enemycount = enemycount + 1
                pneumacount = pneumacount + 1
            end
        end
    end

    if pneumacount >= 1 and level >= 90 and SageHotbarSettings.Zoe.bool and SageHotbarSettings.Pneuma.bool then
        local pneuma = ActionList:Get(1, 24318)
        if RoseSGE.IsReady(pneuma) then
            return RoseSGE.Action(pneuma, target)
        end
    end

    if enemycount >= 1 then
        -- Add Toxikon first as it was being capped and not used, it was a big DPS loss !
        if Player.gauge[3] >= 1 then
            if level >= 82 and SageHotbarSettings.ToxikonII.bool then
                local toxikon_ii = ActionList:Get(1, 24316)
                if RoseSGE.IsReady(toxikon_ii) then
                    return RoseSGE.Action(toxikon_ii, target)
                end
            end

            if level >= 66 and level <= 81 and SageHotbarSettings.Toxikon.bool then
                local toxikon = ActionList:Get(1, 24304)
                if RoseSGE.IsReady(toxikon) then
                    return RoseSGE.Action(toxikon, target)
                end
            end
        end

        if level >= 82 and SageHotbarSettings.PhlegmaIII.bool then
            local phlegma_iii = ActionList:Get(1, 24313)
            if phlegma_iii.cd == 0 or phlegma_iii.cd >= 45 then
                return RoseSGE.Action(phlegma_iii, target)
            end
        end

        if level >= 72 and level <= 81 and SageHotbarSettings.PhlegmaII.bool then
            local phlegma_ii = ActionList:Get(1, 24307)
            if phlegma_ii.cd == 0 or phlegma_ii.cd >= 45 then
                return RoseSGE.Action(phlegma_ii, target)
            end
        end

        if level >= 26 and level <= 71 and SageHotbarSettings.Phlegma.bool then
            local phlegma = ActionList:Get(1, 24289)
            if phlegma.cd == 0 or phlegma.cd >= 45 then
                return RoseSGE.Action(phlegma, target)
            end
        end
    end

    if enemycount >= 2 then
        if level >= 82 and SageHotbarSettings.DyskrasiaII.bool then
            local dyskrasia_ii = ActionList:Get(1, 24315)
            if RoseSGE.IsReady(dyskrasia_ii) then
                return RoseSGE.Action(dyskrasia_ii, Player)
            end
        end

        if level >= 46 and level <= 81 and SageHotbarSettings.Dyskrasia.bool then
            local dyskrasia = ActionList:Get(1, 24297)
            if RoseSGE.IsReady(dyskrasia) then
                return RoseSGE.Action(dyskrasia, Player)
            end
        end
    end

    if level >= 82 and SageHotbarSettings.DosisIII.bool then
        local dosis_iii = ActionList:Get(1, 24312)
        if RoseSGE.IsReady(dosis_iii) then
            return RoseSGE.Action(dosis_iii, target)
        end
    end

    if level >= 72 and level <= 81 and SageHotbarSettings.DosisII.bool then
        local dosis_ii = ActionList:Get(1, 24306)
        if RoseSGE.IsReady(dosis_ii) then
            return RoseSGE.Action(dosis_ii, target)
        end
    end

    if level >= 1 and level <= 71 and SageHotbarSettings.Dosis.bool then
        local dosis = ActionList:Get(1, 24283)
        if RoseSGE.IsReady(dosis) then
            return RoseSGE.Action(dosis, target)
        end
    end
end