function onLoad(save_state)
    self.clearButtons()
    self.createButton({
        click_function = "PlaySoundEffect",
        function_owner = self,
        label = ">",
        position = { -2.5, 0.05, 0 },
        rotation = { 0, 180, 0 },
        color = { 0.345, 0.678, 859 },
        width = 250,
        height = 250,
        font_size = 250,
        font_color = { 0.169, 0.141, 0.141 },
        tooltip = "Play sound effect"
    })
end

function PlaySoundEffect()
    -- north horn
    Global.call("PlaySound", { ID = 23 })
end
