PickedUp = false

function onLoad()
  Global.call("PoliticalTokenEvent",{TokenObj=self,Event="Load"})
end--function

function onPickUp(player_color)
  Global.call("PoliticalTokenEvent",{TokenObj=self,Event="Pickup"})
end--function

function onDrop(player_color)
  Global.call("PoliticalTokenEvent",{TokenObj=self,Event="Drop"})
end--function

function onCollisionEnter(collision_info)
  Global.call("PoliticalTokenEvent",{TokenObj=self,Event="Collide",Info=collision_info})
end--if

function onDestroy()
  Global.call("PoliticalTokenEvent",{TokenObj=self,Event="Destroy"})
end--iftion