Colliding = true
OldValue = 0

function onLoad()
    Wait.frames(function () Colliding = false end, 2)
end

function onPickUp(player_color)
    OldValue = math.floor((getObjectFromGUID("abe1b3").getPosition().x - 5.0) / 1.58)
    if OldValue < 0 then OldValue = 0 elseif OldValue > 12 then OldValue = 12 end
end

function onDrop(player_color)
    local CorruptionTrack = math.floor((getObjectFromGUID("abe1b3").getPosition().x - 5.0) / 1.58)
    if CorruptionTrack < 0 then CorruptionTrack = 0 elseif CorruptionTrack > 12 then CorruptionTrack = 12 end
    getObjectFromGUID("6158a0").setVar("CorruptionTrack", CorruptionTrack)
    broadcastToAll(
        player_color ..
        " Player moved the Corruption Counter from " .. tostring(OldValue) .. " to " .. tostring(CorruptionTrack) .. ".",
        { 1, 1, 0 })
end

function onDrop(player_color)
    function AnnounceDrop()
        local CorruptionTrack = math.floor((getObjectFromGUID("abe1b3").getPosition().x - 5.0) / 1.58)
        if CorruptionTrack < 0 then CorruptionTrack = 0 elseif CorruptionTrack > 12 then CorruptionTrack = 12 end
        getObjectFromGUID("6158a0").setVar("CorruptionTrack", CorruptionTrack)
        if OldValue ~= CorruptionTrack then
            broadcastToAll(
                player_color ..
                " Player moved the Corruption Counter from " .. tostring(OldValue) .. " to " ..
                tostring(CorruptionTrack) .. ".", { 1, 1, 0 })
        end
    end

    Wait.time(AnnounceDrop, 0.5)
end

function onCollisionEnter(collision_info)
    if not Colliding then
        Colliding = true
        if self.getPosition().x > 23.5 then
            broadcastToAll("Shadow Victory Detected!\n(Corruption of the Ring-bearers)", { 1, 1, 0 })
            Global.call("PlaySound", { ID = 38 }) --the ring is mine!
        end
        Colliding = false
    end
end
