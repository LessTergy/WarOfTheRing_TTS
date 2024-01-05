Side = ""
ThisDiceRolling = false

function onLoad()
  if string.find(self.getDescription(),"Shadow;") != nil then
    Side = "Shadow"
  else
    Side = "FreePeoples"
  end--if
  ThisDiceRolling = false
  PanelID = Global.call("ReadTag",{Text=self.getDescription(),Var="Panel",Default=""})
end--function

function onDestroy()
  --remove this die if it was rolling...
  if ThisDiceRolling then
    Global.call("DeleteActionRoll",{DiceID=self.getGUID()})
  end--if
end--function

function onRandomize(player_color)
  if not ThisDiceRolling then
    ThisDiceRolling = true
    Global.call("InsertActionRoll",{DiceID=self.getGUID()})
    Wait.condition(DoneRolling,RollWatcher)
  end--if
end--function

function RollWatcher()
  return self.resting
end--function

function DoneRolling()
  Global.call("ReportActionRoll",{DiceID=self.getGUID()})
  ThisDiceRolling = false
end--function
