PickedUp = false

function onLoad()
  Global.call("UnitEvent",{UnitObj=self,Event="Load"})
end--function

function onPickUp(player_color)
  Global.call("UnitEvent",{UnitObj=self,Event="Pickup",Color=player_color})
end--function

function onDrop(player_color)
  Global.call("UnitEvent",{UnitObj=self,Event="Drop",Color=player_color})
end--function

function onCollisionEnter(collision_info)
  Global.call("UnitEvent",{UnitObj=self,Event="Collide",Info=collision_info})
end--if

function onDestroy()
  Global.call("UnitEvent",{UnitObj=self,Event="Destroy"})
end--function