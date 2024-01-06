Colliding = true
OldValue = 0

function onLoad()
    Wait.frames(
        function()
            Colliding = false
        end,
        2
    )
end

function onPickUp(player_color)
    OldValue = math.floor((self.getPosition().x - 5.0) / 1.58)
    if OldValue < 0 then
        OldValue = 0
    elseif OldValue > 12 then
        OldValue = 12
    end
end

function onDrop(player_color)
    function AnnounceDrop()
        local FellowshipTrack = math.floor((self.getPosition().x - 5.0) / 1.58)
        if FellowshipTrack < 0 then
            FellowshipTrack = 0
        elseif FellowshipTrack > 12 then
            FellowshipTrack = 12
        end
        print(self.getPosition(), ":", math.floor((self.getPosition().x - 5.0) / 1.58), ":", FellowshipTrack)
        getObjectFromGUID("6158a0").setVar("FellowshipTrack", FellowshipTrack)
        if OldValue ~= FellowshipTrack then
            broadcastToAll(
                player_color ..
                    " Player set the Fellowship Track from " ..
                        tostring(OldValue) .. " to " .. tostring(FellowshipTrack) .. ".",
                {1, 1, 0}
            )
        end
    end
    Wait.time(AnnounceDrop, 0.5)
end

function onCollisionEnter(collision_info)
    if not Colliding then
        Colliding = true
        if self.getRotation().z < 90 or self.getRotation().z > 270 then
            -- I see you!
            Global.call("PlaySound", {ID = 13})
            printToAll("Fellowship is Revealed.", {1, 1, 0})
        else
            printToAll("Fellowship is Hidden.", {1, 1, 0})
        end
        Wait.time(
            function()
                Colliding = false
            end,
            0.5
        )
    end
end