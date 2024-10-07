function onLoad(save_state)
    self.clearButtons()

    local buttonSfxArmy = CreateButtonData(-0.5)
    buttonSfxArmy.click_function = "PlaySoundEffect"
    buttonSfxArmy.tooltip = "Isengard Army sound effect"
    self.createButton(buttonSfxArmy)

    local buttonSfxWork = CreateButtonData(0)
    buttonSfxWork.click_function = "PlaySoundEffect2"
    buttonSfxWork.tooltip = "We have work to do"
    self.createButton(buttonSfxWork)

    local buttonSfxDawn = CreateButtonData(0.5)
    buttonSfxDawn.click_function = "PlaySoundEffect3"
    buttonSfxDawn.tooltip = "No dawn for men"
    self.createButton(buttonSfxDawn)
end

function CreateButtonData(PositionZ)
    return {
        click_function = "PlaySoundEffect3",
        function_owner = self,
        label = ">",
        position = { -2.5, 0.05, PositionZ },
        rotation = { 0, 180, 0 },
        color = { 0.925, 0.866, 0.196 },
        font_color = { 0.169, 0.141, 0.141 },
        width = 250,
        height = 250,
        font_size = 250,
    }
end

function PlaySoundEffect()
    -- horn
    Global.call("PlaySound", { ID = 18 })
end

function PlaySoundEffect2()
    -- we have work to do
    Global.call("PlaySound", { ID = 12 })
end

function PlaySoundEffect3()
    -- no dawn for men
    Global.call("PlaySound", { ID = 11 })
end
