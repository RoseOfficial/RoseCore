function RoseWHM.HandleAttack(target, level, elist)

    local targets = {}
    local IsTargetMissingBuff = false
    local closest = 0
    local closestDst = 100
    local count = 0
    local closeEnemy = 0
    local inRangeEnemy = 0
    for _, enemy in pairs(elist) do
        count = count + 1
        if enemy.distance2d <= 25 then
            inRangeEnemy = inRangeEnemy + 1
            if enemy.distance2d <= 8 then
                closeEnemy = closeEnemy + 1
            end
        end

        if closestDst > enemy.distance2d then
            closestDst = enemy.distance2d
            closest = enemy
        end
    end

    if inRangeEnemy >= 1 and RoseWHM.HasDPSTarget then
        local spell = RoseWHM.GetCorrectSpellForCurrentLevel("AfflactusMisery")
        if spell ~= nil then
            if Player.gauge[3] == 3 then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, target)
                end
            end
        end
    end

    if not WhmHotbarSettings.SmartDot.bool then
        local buff = RoseCore.Utils.GetBuff(target, { 143, 144, 798, 1871 }, Player)
        if buff == nil then
            IsTargetMissingBuff = true
        else
            if buff.duration <= 5 then
                IsTargetMissingBuff = true
            end
        end
        table.insert(targets, target)
    else

        -- Avoid doing dot logic if there is more than X enemie, it's more DPS to just do mass AOE
        -- enemie count will probably need a tweak, not sure if 3 or 4 is the right one
        -- Allow the dot logic when player is moving like using TensorDrift
        if count <= 3 or Player:IsMoving() then
            for _, target in pairs(elist) do
                if target.distance2d <= 25 then
                    local buff = RoseCore.Utils.GetBuff(target, { 143, 144, 798, 1871 }, Player)
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

    if IsTargetMissingBuff then
        for k, v in pairs(targets) do
            local spell = RoseWHM.GetCorrectSpellForCurrentLevel("Aero")
            if spell ~= nil then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, v)
                end
            end
        end
    end

    if closeEnemy >= 2 and RoseWHM.HasDPSTarget then
        local spell = RoseWHM.GetCorrectSpellForCurrentLevel("AfflactusMisery")
        if spell ~= nil then
            if Player.gauge[3] == 3 then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, target)
                end
            end
        end

        local spell = RoseWHM.GetCorrectSpellForCurrentLevel("Holy")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                return RoseCore.Action(action, Player)
            end
        end
    end

    if inRangeEnemy >= 1 and RoseWHM.HasDPSTarget then

        local spell = RoseWHM.GetCorrectSpellForCurrentLevel("Stone")
        if spell ~= nil then
            local action = ActionList:Get(1, spell.ID)
            if RoseCore.IsReady(action) then
                return RoseCore.Action(action, target)
            end
        end

        if not Player:IsMoving() then
            local spell = RoseWHM.GetCorrectSpellForCurrentLevel("PresenceOfMind")
            if spell ~= nil then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, Player)
                end
            end
        end

        if closestDst <= 15 then
            local spell = RoseWHM.GetCorrectSpellForCurrentLevel("Assize")
            if spell ~= nil then
                local action = ActionList:Get(1, spell.ID)
                if RoseCore.IsReady(action) then
                    return RoseCore.Action(action, Player)
                end
            end
        end
    end
end
