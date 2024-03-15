function onLoad(save_state)
    self.clearButtons()
    self.createButton({
        click_function = "PlaySoundEffect",
        function_owner = self,
        label = ">",
        position = { -2.9, 0.05, 0 },
        rotation = { 0, 180, 0 },
        color = { 0.33, 0.64, 1 },
        width = 250,
        height = 250,
        font_size = 250,
        font_color = { 1, 1, 1 },
        tooltip =
        "Play sound effect."
    })
end

function PlaySoundEffect()
    Global.call("PlaySound", { ID = 23 }) --north horn
end
