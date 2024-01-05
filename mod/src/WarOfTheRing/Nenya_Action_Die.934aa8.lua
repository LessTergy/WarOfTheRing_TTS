Side = ""
ThisDiceRolling = false

function onLoad()
    if string.find(self.getDescription(), "Shadow;") ~= nil then
        Side = "Shadow"
    else
        Side = "FreePeoples"
    end

    ThisDiceRolling = false
    PanelID = Global.call("ReadTag", {Text = self.getDescription(), Var = "Panel", Default = ""})
end

function onDestroy()
    --remove this dice if it was rolling
    if ThisDiceRolling then
        Global.call("DeleteActionRoll", {DiceID = self.getGUID()})
    end
end

function onRandomize(player_color)
    if not ThisDiceRolling then
        ThisDiceRolling = true
        Global.call("InsertActionRoll", {DiceID = self.getGUID()})
        Wait.condition(DoneRolling, RollWatcher)
    end
end

function RollWatcher()
    return self.resting
end

function DoneRolling()
    Global.call("ReportActionRoll", {DiceID = self.getGUID()})
    ThisDiceRolling = false
end