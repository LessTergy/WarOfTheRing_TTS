PickedUp = false
Spots = {
    { -30.85, 1.1, 12.9 },
    { -32.1,  1.1, 14.1 },
    { -30.85, 1.1, 14.1 },
    { -29.6,  1.1, 14.1 },
    { -32.1,  1.1, 12.9 },
    { -29.6,  1.1, 12.9 },
    { -32.1,  1.1, 11.7 },
    { -30.85, 1.1, 11.7 },
    { -29.6,  1.1, 11.7 },
    { -31.50, 1.3, 13.5 },
    { -31.50, 1.3, 13.5 },
    { -31.50, 1.3, 12.3 },
    { -31.50, 1.3, 12.3 },
}


function onLoad()
    --Global.call("ArmyEvent",{ArmyObj=self,Event="Load"})
end

function onPickUp(player_color)
    --Global.call("ArmyEvent",{ArmyObj=self,Event="Pickup",Color=player_color})
end

function onDrop(player_color)
    --Global.call("ArmyEvent",{ArmyObj=self,Event="Drop",Color=player_color})
end

function onCollisionEnter(collision_info)
    --Global.call("ArmyEvent",{ArmyObj=self,Event="Collide",Info=collision_info})
end

function onDestroy()
    --Global.call("ArmyEvent",{ArmyObj=self,Event="Destroy"})
end
