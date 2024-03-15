PanelID = ""
Side = ""
ThisDiceRolling = false

function onLoad()
    if string.find(self.getDescription(), "Shadow;") ~= nil then
        Side = "Shadow"
    else
        Side = "FreePeoples"
    end
    ThisDiceRolling = false
    PanelID = Global.call("ReadTag", { Text = self.getDescription(), Var = "Panel", Default = "" })
end

function onDestroy()
    --remove this die if it was rolling...
    if ThisDiceRolling and getObjectFromGUID(PanelID) ~= nil then
        getObjectFromGUID(PanelID).call("DeleteRoll", { DiceID = self.getGUID() })
    end
end

function Roll()
    self.roll()
    if not ThisDiceRolling and getObjectFromGUID(PanelID) ~= nil then
        ThisDiceRolling = true
        getObjectFromGUID(PanelID).call("InsertRoll", { DiceID = self.getGUID() })
        Wait.condition(DoneRolling, RollWatcher)
    end
end

function onRandomize(player_color)
    if not ThisDiceRolling and getObjectFromGUID(PanelID) ~= nil then
        ThisDiceRolling = true
        getObjectFromGUID(PanelID).call("InsertRoll", { DiceID = self.getGUID() })
        Wait.condition(DoneRolling, RollWatcher)
    end
end

function RollWatcher()
    return self.resting
end

function DoneRolling()
    if getObjectFromGUID(PanelID) ~= nil then
        getObjectFromGUID(PanelID).call("ReportRoll", { DiceID = self.getGUID() })
    end
    ThisDiceRolling = false
end
