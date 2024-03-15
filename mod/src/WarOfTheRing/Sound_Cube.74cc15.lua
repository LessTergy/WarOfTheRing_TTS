function onLoad()
    Menu()
end

function Menu()
    if not Global.getVar("Mute") then
        MenuText = "Sound\nEffects\n(Active)"
        Color = { 0.3, 1, 0.3 }
    else
        MenuText = "Sound\nEffects\n(Muted)"
        Color = { 1, 0.3, 0.3 }
    end
    self.clearButtons()
    self.createButton({
        click_function = "ToggleMute",
        function_owner = self,
        label = MenuText,
        position = { 0, 0.5, 0 },
        width = 400,
        height = 400,
        color =
            Color
    })
end

function ToggleMute()
    if Global.getVar("Mute") then
        Global.setVar("Mute", false)
    else
        --Global.call("PlaySound",{ID=})    --silence.
        Global.setVar("Mute", true)
    end
    Menu()
    --update main board also?
    if string.find(getObjectFromGUID(Global.getVar("GamePanelID")).getDescription(), "Step:BeginMenu;") ~= nil then
        getObjectFromGUID(Global.getVar("GamePanelID")).setVar("NextStep", "BeginMenu")
        getObjectFromGUID(Global.getVar("GamePanelID")).setVar("Step", "")
    end
end
