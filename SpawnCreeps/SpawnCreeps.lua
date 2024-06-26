local function SpawnCreeps(region, tier)
    local choice = math.random(#camps[tier])
    local creepCamps = camps[tier][choice];

    for i = 1, #creepCamps do
        local tmp_loc = GetRectCenter(region)
        CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), FourCC(creepCamps[i]), tmp_loc, 0)
        RemoveLocation(tmp_loc)
    end
end

function Spawn()
    for i = 1, #regions do
        local tmp_group = GetUnitsInRectMatching(regions[i].place, Condition(function ()
            return IsUnitAliveBJ(GetFilterUnit())
        end))
        if CountUnitsInGroup(tmp_group) == 0 then
            SpawnCreeps(regions[i].place, regions[i].tier)
        end
        DestroyGroup(tmp_group)
    end
end