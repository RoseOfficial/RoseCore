RoseSGE.Utils = {}

function RoseSGE.Utils.GetPartyList()
    local PartyMembersDead = {}
    local PartyMembers = RoseSGE.PartyMembers
    PartyMembers[Player.id] = Player -- Adding Player to PartyMembers
    local EntityList = MEntityList("alive,targetable,type=2,chartype=9,maxdistance2d=30")
    if table.valid(EntityList) then
        for k, v in pairs(EntityList) do -- adding Trust to PartyMembers
            PartyMembers[k] = v
        end
    end
    EntityList = MEntityList("alive,targetable,type=2,chartype=0,maxdistance2d=30")
    if table.valid(EntityList) then
        for k, v in pairs(EntityList) do
            PartyMembers[k] = v
        end -- adding npcs to PartyMembers
    end
    PartyMembersDead = MEntityList("dead,friendly,chartype=4,myparty,targetable,maxdistance=30") or {} -- Adding party members to PartyMembers
    EntityList = MEntityList("dead,targetable,type=2,chartype=9,maxdistance2d=30")
    if table.valid(EntityList) then
        for k, v in pairs(EntityList) do -- adding Trust to PartyMembersDead
            PartyMembersDead[k] = v
        end
    end
    EntityList = MEntityList("dead,targetable,type=2,chartype=0,maxdistance2d=30")
    if table.valid(EntityList) then
        for k, v in pairs(EntityList) do -- adding npcs to PartyMembersDead
            PartyMembersDead[k] = v
        end
    end

    return PartyMembers, PartyMembersDead
end


function RoseSGE.Utils.HasTankStance(target)
    if table.valid(target) and HasBuffs(target, "34,79,91,392,393,743,1833,2843,3124") then
        return true
    end
end

function RoseSGE.Utils.GetBuff(target, buffIDTable, owner)
    if (table.valid(target.buffs)) then
        for k, v in pairs(buffIDTable) do
            for _, buff in pairs(target.buffs) do
                if tonumber(buff.id) == tonumber(v) then
                    if owner ~= nil then
                        if tonumber(buff.ownerid) == tonumber(owner.id) then
                            return buff
                        end
                    else
                        return buff
                    end
                end
            end
        end
    end
    return nil
end

function RoseSGE.Utils.IsPlayerInRaid()
    local IsInRaid = false

    local PlayerCountInParty = 0
    for k, v in pairs(EntityList.myparty) do
        PlayerCountInParty = PlayerCountInParty + 1
    end

    if PlayerCountInParty > 4 then
        IsInRaid = true
    end

    return IsInRaid
end