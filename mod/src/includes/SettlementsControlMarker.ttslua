PickedUp = false

function onLoad()
    Global.call("SettlementControlMarkerEvent", { MarkerObj = self, Event = "Load" })
end

function onPickUp(player_color)
    Global.call("SettlementControlMarkerEvent", { MarkerObj = self, Event = "Pickup", Color = player_color })
end

function onDrop(player_color)
    Global.call("SettlementControlMarkerEvent", { MarkerObj = self, Event = "Drop", Color = player_color })
end

function onCollisionEnter(collision_info)
    Global.call("SettlementControlMarkerEvent", { MarkerObj = self, Event = "Collide", Info = collision_info })
end

function onDestroy()
    Global.call("SettlementControlMarkerEvent", { MarkerObj = self, Event = "Destroy" })
end
