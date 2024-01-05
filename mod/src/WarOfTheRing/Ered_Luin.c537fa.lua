function onDrop(player_color)
    if self.getPosition().z < 24 and self.getPosition().z > -24 and self.getPosition().x > -35 and self.getPosition().x < 35 then
      Global.call("SetupTFoENewCities")
    end--if
  end--function
