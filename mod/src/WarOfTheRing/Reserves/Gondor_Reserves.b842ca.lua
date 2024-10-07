function onLoad(save_state)
    self.clearButtons()
    self.createButton({
        click_function = "PlaySoundEffect",
        function_owner = self,
        label = ">",
        position = { -2.5, 0.05, 0 },
        rotation = { 0, 180, 0 },
        color = { 0.258, 0.294, 0.415 },
        font_color = { 0.169, 0.141, 0.141 },
        width = 250,
        height = 250,
        font_size = 250,
        tooltip = "Play sound effect"
    })
end

function PlaySoundEffect()
    -- for gondor!
    Global.call("PlaySound", { ID = 21 })
end
