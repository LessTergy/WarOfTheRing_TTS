function onLoad(save_state)
    self.clearButtons()
    self.createButton({
        click_function = "PlaySoundEffect",
        function_owner = self,
        label = ">",
        position = { -2.5, 0.05, 0.25 },
        rotation = { 0, 180, 0 },
        color = { 0.21, 0.4, 0.18 },
        font_color = { 0.169, 0.141, 0.141 },
        width = 250,
        height = 250,
        font_size = 250,
        tooltip = "Play Rohan horn sound effect"
    })
    self.createButton({
        click_function = "PlaySoundEffect2",
        function_owner = self,
        label = ">",
        position = { -2.5, 0.05, -0.25 },
        rotation = { 0, 180, 0 },
        color = { 0.21, 0.4, 0.18 },
        font_color = { 0.169, 0.141, 0.141 },
        width = 250,
        height = 250,
        font_size = 250,
        tooltip = "Play Rohan music sound effect"
    })
end

function PlaySoundEffect()
    -- rohan horn
    Global.call("PlaySound", { ID = 20 })
end

function PlaySoundEffect2()
    -- riders of rohan
    Global.call("PlaySound", { ID = 2 })
end
