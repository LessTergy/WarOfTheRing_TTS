local SettlementsConfigs = {
    Stronghold = {PositionY_3D = 1.16, PositionY_Flat = 0.78, Size = {1.8, 1, 1.8}},
    City = {PositionY_3D = 1.09, PositionY_Flat = 0.85, Size = {1.8, 1, 1.1}},
    Fortification = {PositionY_3D = 1.01, PositionY_Flat = 0.93, Size = {1.8, 1, 1.1}}
}

function onLoad(save_state)
    InitPreferences()
end

function InitPreferences()
    FigureScale = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Scale", Default = "100"})
    --100
    CharactersSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Characters", Default = "3D"})
    --3D,2D,Square
    NazgulSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Nazgul", Default = "3D"})
    --3D,2D,Round,Square
    ArmiesSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Armies", Default = "3D"})
    --3D,2D,Round
    FactionsSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Factions", Default = "3D"})
    --Flat,3D
    MountDoomSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "MtDoom", Default = "3D"})
    --Flat,3D
    SettlementsSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Settlements", Default = "3D"})
    --Flat,3D
    DiceSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Dice", Default = "Original"})

    --Original,Anniversary
    if getObjectFromGUID("4b6f4c") == nil then
        DicePanels = "Strips"
    else
        DicePanels = "Sic"
    end

    ModelLockSetting = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "ModelLock", Default = "0"}) == "1"
    if Global.getVar("Mute") then
        Sound = "Off"
    else
        Sound = "On"
    end

    ScreamSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Scream", Default = "Once"})
    --Always,Once,Never
    WarningsSettingType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Warnings", Default = "On"})
    --On,Off
    Global.setVar("RulesWarnings", WarningsSettingType == "On")
    ApplySettingsFlag = false
    MainMenu()
end

function MainMenu()
    local Characters3DColor = {1, 1, 1}
    local Characters2DColor = {1, 1, 1}
    local CharactersSquareColor = {1, 1, 1}
    local Nazgul3DColor = {1, 1, 1}
    local Nazgul2DColor = {1, 1, 1}
    local NazgulRoundColor = {1, 1, 1}
    local NazgulSquareColor = {1, 1, 1}
    local Armies3DColor = {1, 1, 1}
    local Armies2DColor = {1, 1, 1}
    local ArmiesRoundColor = {1, 1, 1}
    local Factions3DColor = {1, 1, 1}
    local Factions2DColor = {1, 1, 1}
    local FactionsRoundColor = {1, 1, 1}
    local MtDoomFlatColor = {1, 1, 1}
    local MtDoom3DColor = {1, 1, 1}
    local SettlementsFlatColor = {1, 1, 1}
    local Settlements3DColor = {1, 1, 1}
    local SoundOnColor = {1, 1, 1}
    local SoundOffColor = {1, 1, 1}
    local ScreamAlwaysColor = {1, 1, 1}
    local ScreamOnceColor = {1, 1, 1}
    local ScreamNeverColor = {1, 1, 1}
    local WarningsOnColor = {1, 1, 1}
    local WarningsOffColor = {1, 1, 1}
    local DiceOriginalColor = {1, 1, 1}
    local DiceAnniversaryColor = {1, 1, 1}

    --set button colors to match selections...
    if CharactersSettingType == "2D" then
        Characters2DColor = {1, 1, 0}
    elseif CharactersSettingType == "Square" then
        CharactersSquareColor = {1, 1, 0}
    else
        Characters3DColor = {1, 1, 0}
    end

    if NazgulSettingType == "2D" then
        Nazgul2DColor = {1, 1, 0}
    elseif NazgulSettingType == "Round" then
        NazgulRoundColor = {1, 1, 0}
    elseif NazgulSettingType == "Square" then
        NazgulSquareColor = {1, 1, 0}
    else
        Nazgul3DColor = {1, 1, 0}
    end

    if ArmiesSettingType == "2D" then
        Armies2DColor = {1, 1, 0}
    elseif ArmiesSettingType == "Round" then
        ArmiesRoundColor = {1, 1, 0}
    else
        Armies3DColor = {1, 1, 0}
    end

    if FactionsSettingType == "2D" then
        Factions2DColor = {1, 1, 0}
    elseif FactionsSettingType == "Round" then
        FactionsRoundColor = {1, 1, 0}
    else
        Factions3DColor = {1, 1, 0}
    end

    if MountDoomSettingType == "3D" then
        MtDoom3DColor = {1, 1, 0}
    else
        MtDoomFlatColor = {1, 1, 0}
    end

    if SettlementsSettingType == "3D" then
        Settlements3DColor = {1, 1, 0}
    else
        SettlementsFlatColor = {1, 1, 0}
    end

    if ScreamSettingType == "Always" then
        ScreamAlwaysColor = {1, 1, 0}
    elseif ScreamSettingType == "Once" then
        ScreamOnceColor = {1, 1, 0}
    else
        ScreamNeverColor = {1, 1, 0}
    end

    if Sound == "Off" then
        SoundOffColor = {1, 1, 0}
        ScreamAlwaysColor = {0.5, 0.5, 0.5}
        ScreamOnceColor = {0.5, 0.5, 0.5}
        ScreamNeverColor = {0.5, 0.5, 0.5}
    else
        SoundOnColor = {1, 1, 0}
    end

    if WarningsSettingType == "On" then
        WarningsOnColor = {1, 1, 0}
    else
        WarningsOffColor = {1, 1, 0}
    end

    if DiceSettingType == "Anniversary" then
        DiceAnniversaryColor = {1, 1, 0}
    else
        DiceOriginalColor = {1, 1, 0}
    end

    self.clearButtons()
    --figure scale...
    self.createButton(
        {
            click_function = "FigureScaleDown",
            function_owner = self,
            label = "-",
            position = {-1, 0.1, -1.3},
            scale = {0.5, 0.5, 0.5},
            color = {1, 1, 1},
            font_color = {0, 0, 0},
            width = 150,
            height = 150,
            font_size = 150,
            tooltip = "Shrink Figures by -5%.\n(Applies instantly)"
        }
    )
    self.createButton(
        {
            click_function = "FigureScaleUp",
            function_owner = self,
            label = "+",
            position = {-0.5, 0.1, -1.3},
            scale = {0.5, 0.5, 0.5},
            color = {1, 1, 1},
            font_color = {0, 0, 0},
            width = 150,
            height = 150,
            font_size = 150,
            tooltip = "Enlarge Figures by +5%.\n(Applies instantly)\nCaution: This could make a big mess!"
        }
    )
    self.createButton(
        {
            click_function = "FigureScaleUp",
            function_owner = self,
            label = FigureScale .. "%",
            position = {-0.75, 0.1, -1.3},
            scale = {0.5, 0.5, 0.5},
            font_color = {1, 1, 1},
            width = 0,
            height = 0,
            font_size = 100
        }
    )
    --armies model buttons...
    self.createButton(
        {
            click_function = "Armies3D",
            function_owner = self,
            label = "3D Models",
            position = {-0.9, 0.1, -1.1},
            scale = {0.5, 0.5, 0.5},
            color = Armies3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Models for Armies."
        }
    )
    self.createButton(
        {
            click_function = "Armies2D",
            function_owner = self,
            label = "2D Models",
            position = {-0.2, 0.1, -1.1},
            scale = {0.5, 0.5, 0.5},
            color = Armies2DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 2D Stand-Up Models for Armies."
        }
    )
    self.createButton(
        {
            click_function = "ArmiesRound",
            function_owner = self,
            label = "Round",
            position = {0.5, 0.1, -1.1},
            scale = {0.5, 0.5, 0.5},
            color = ArmiesRoundColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use Round Marble Models for Armies."
        }
    )
    --character model buttons...
    self.createButton(
        {
            click_function = "Characters3D",
            function_owner = self,
            label = "3D Models",
            position = {-0.9, 0.1, -0.925},
            scale = {0.5, 0.5, 0.5},
            color = Characters3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Models for Characters."
        }
    )
    self.createButton(
        {
            click_function = "Characters2D",
            function_owner = self,
            label = "2D Models",
            position = {-0.2, 0.1, -0.925},
            scale = {0.5, 0.5, 0.5},
            color = Characters2DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 2D Stand-Up Models for Characters."
        }
    )
    self.createButton(
        {
            click_function = "CharactersSquare",
            function_owner = self,
            label = "Square",
            position = {0.5, 0.1, -0.925},
            scale = {0.5, 0.5, 0.5},
            color = CharactersSquareColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use Square Marble Models for Characters."
        }
    )
    --factions model buttons...
    self.createButton(
        {
            click_function = "Factions3D",
            function_owner = self,
            label = "3D Models",
            position = {-0.9, 0.1, -0.75},
            scale = {0.5, 0.5, 0.5},
            color = Factions3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Models for Factions (Warriors of Middle-Earth)."
        }
    )
    self.createButton(
        {
            click_function = "Factions2D",
            function_owner = self,
            label = "2D Models",
            position = {-0.2, 0.1, -0.75},
            scale = {0.5, 0.5, 0.5},
            color = Factions2DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 2D Stand-Up Models for Factions (Warriors of Middle-Earth)."
        }
    )
    self.createButton(
        {
            click_function = "FactionsRound",
            function_owner = self,
            label = "Round",
            position = {0.5, 0.1, -0.75},
            scale = {0.5, 0.5, 0.5},
            color = FactionsRoundColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use Round Marble Models for Factions (Warriors of Middle-Earth)."
        }
    )
    --nazgul model buttons...
    self.createButton(
        {
            click_function = "Nazgul3D",
            function_owner = self,
            label = "3D Models",
            position = {-0.9, 0.1, -0.575},
            scale = {0.5, 0.5, 0.5},
            color = Nazgul3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Models for Nazgul."
        }
    )
    self.createButton(
        {
            click_function = "Nazgul2D",
            function_owner = self,
            label = "2D Models",
            position = {-0.2, 0.1, -0.575},
            scale = {0.5, 0.5, 0.5},
            color = Nazgul2DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 2D Stand-Up Models for Nazgul."
        }
    )
    self.createButton(
        {
            click_function = "NazgulRound",
            function_owner = self,
            label = "Round",
            position = {0.5, 0.1, -0.575},
            scale = {0.5, 0.5, 0.5},
            color = NazgulRoundColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use Round Marble Models for Nazgul."
        }
    )
    self.createButton(
        {
            click_function = "NazgulSquare",
            function_owner = self,
            label = "Square",
            position = {1.2, 0.1, -0.575},
            scale = {0.5, 0.5, 0.5},
            color = NazgulSquareColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use Square Marble Models for Nazgul."
        }
    )
    --lock models button...

    --mt doom buttons...
    self.createButton(
        {
            click_function = "MtDoom3D",
            function_owner = self,
            label = "3D",
            position = {-0.4, 0.1, -0.025},
            scale = {0.5, 0.5, 0.5},
            color = MtDoom3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Mount Doom Track."
        }
    )
    self.createButton(
        {
            click_function = "MtDoomFlat",
            function_owner = self,
            label = "Flat",
            position = {0.3, 0.1, -0.025},
            scale = {0.5, 0.5, 0.5},
            color = MtDoomFlatColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Do not use 3D Mount Doom Track."
        }
    )
    --settlement buttons...
    self.createButton(
        {
            click_function = "Settlements3D",
            function_owner = self,
            label = "3D",
            position = {-0.4, 0.1, 0.15},
            scale = {0.5, 0.5, 0.5},
            color = Settlements3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Settlements."
        }
    )
    self.createButton(
        {
            click_function = "SettlementsFlat",
            function_owner = self,
            label = "Flat",
            position = {0.3, 0.1, 0.15},
            scale = {0.5, 0.5, 0.5},
            color = SettlementsFlatColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Do not use 3D Settlements."
        }
    )
    --sound effect buttons...
    self.createButton(
        {
            click_function = "SoundEffectsOn",
            function_owner = self,
            label = "On",
            position = {-0.6, 0.1, 0.515},
            scale = {0.5, 0.5, 0.5},
            color = SoundOnColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Play Sound Effects."
        }
    )
    self.createButton(
        {
            click_function = "SoundEffectsOff",
            function_owner = self,
            label = "Off",
            position = {0.1, 0.1, 0.515},
            scale = {0.5, 0.5, 0.5},
            color = SoundOffColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Mute Sound Effects."
        }
    )
    --scream buttons...
    self.createButton(
        {
            click_function = "ScreamAlways",
            function_owner = self,
            label = "Always",
            position = {-0.6, 0.1, 0.695},
            scale = {0.5, 0.5, 0.5},
            color = ScreamAlwaysColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Screaming is awesome! I want to hear it every time they move."
        }
    )
    self.createButton(
        {
            click_function = "ScreamOnce",
            function_owner = self,
            label = "Once",
            position = {0.1, 0.1, 0.695},
            scale = {0.5, 0.5, 0.5},
            color = ScreamOnceColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Only once please!\n(Only when first moved into play)."
        }
    )
    self.createButton(
        {
            click_function = "ScreamNever",
            function_owner = self,
            label = "Never",
            position = {0.8, 0.1, 0.695},
            scale = {0.5, 0.5, 0.5},
            color = ScreamNeverColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Shut Up!"
        }
    )
    --rules warnings buttons...
    self.createButton(
        {
            click_function = "WarningsOn",
            function_owner = self,
            label = "On",
            position = {-0.6, 0.1, 1.05},
            scale = {0.5, 0.5, 0.5},
            color = WarningsOnColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Rule Warnings On: Notifies players when certain rules appear to have been broken."
        }
    )
    self.createButton(
        {
            click_function = "WarningsOff",
            function_owner = self,
            label = "Off",
            position = {0.1, 0.1, 1.05},
            scale = {0.5, 0.5, 0.5},
            color = WarningsOffColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Rule Warnings Off: Will not detect rules violations."
        }
    )
    --dice pack buttons...
    self.createButton(
        {
            click_function = "DiceOriginal",
            function_owner = self,
            label = "Original",
            position = {-1.2, 0.1, 1.33},
            scale = {0.5, 0.5, 0.5},
            color = DiceOriginalColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Original Dice Pack: Play with dice that match the original game."
        }
    )
    self.createButton(
        {
            click_function = "DiceAnniversary",
            function_owner = self,
            label = "Anniversary",
            position = {-0.5, 0.1, 1.33},
            scale = {0.5, 0.5, 0.5},
            color = DiceAnniversaryColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Anniversary Dice Pack: Play with dice that match the Anniversary Edition."
        }
    )
    --roll panel button...
    if DicePanels == "Strips" then
        self.createButton(
            {
                click_function = "ToggleDicePanels",
                function_owner = self,
                label = "Use Sic Dice Panels",
                position = {-0.85, 0.1, 1.5},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1},
                font_color = {0, 0, 0},
                width = 1300,
                height = 150,
                font_size = 100,
                tooltip = "Switch to Sic* dice panels.\n(Applies immediately)."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleDicePanels",
                function_owner = self,
                label = "Use Dice Panel Strips",
                position = {-0.85, 0.1, 1.5},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1},
                font_color = {0, 0, 0},
                width = 1300,
                height = 150,
                font_size = 100,
                tooltip = "Switch to dice panel strips.\n(Applies immediately)."
            }
        )
    end

    --apply...
    if ApplySettingsFlag then
        self.createButton(
            {
                click_function = "ApplyButton",
                function_owner = self,
                label = "Apply",
                position = {1.5, 0.1, 1.4},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 0},
                font_color = {0, 0, 0},
                width = 800,
                height = 250,
                font_size = 150,
                tooltip = "Apply the selected preferences."
            }
        )
        self.createButton(
            {
                click_function = "CancelButton",
                function_owner = self,
                label = "Cancel",
                position = {0.5, 0.1, 1.4},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1},
                font_color = {0, 0, 0},
                width = 800,
                height = 250,
                font_size = 150,
                tooltip = "Cancel any changes."
            }
        )
    end
end

function FigureScaleUp()
    FigureScale = FigureScale + 5
    ScaleMult = 1.05
    startLuaCoroutine(self, "ChangeFigureScaleCoroutine")
end

function FigureScaleDown()
    FigureScale = FigureScale - 5
    ScaleMult = 0.95
    startLuaCoroutine(self, "ChangeFigureScaleCoroutine")
end

function NewCharacters3D()
    function Characters3DCoroutine()
        self.clearButtons()
        self.createButton(
            {
                click_function = "ApplyPreferences",
                function_owner = self,
                label = "Please Wait\nApplying Preferences...",
                position = {0, 0.1, 0},
                width = 0,
                height = 0,
                font_size = 150,
                font_color = {1, 1, 1}
            }
        )
        CharactersSettingType = "3D"
        local ObjList = {}
        for _, Item in pairs(getObjectFromGUID("0e5fd1")).getObjects() do
            if string.find(Item.description, "3D;") ~= nil then
                if string.find(Item.description, "Minion;") ~= nil or string.find(Item.description, "Character;") ~= nil then
                    table.insert(ObjList, Item.guid)
                end
            end
        end
        --for I,Item
        coroutine.yield(0)

        MainMenu()
    end

    startLuaCoroutine(self, "Characters3DCoroutine")
end

function Characters3D()
    CharactersSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function Characters2D()
    CharactersSettingType = "2D"
    ApplySettingsFlag = true
    MainMenu()
end

function CharactersSquare()
    CharactersSettingType = "Square"
    ApplySettingsFlag = true
    MainMenu()
end

function Nazgul3D()
    NazgulSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function Nazgul2D()
    NazgulSettingType = "2D"
    ApplySettingsFlag = true
    MainMenu()
end

function NazgulRound()
    NazgulSettingType = "Round"
    ApplySettingsFlag = true
    MainMenu()
end

function NazgulSquare()
    NazgulSettingType = "Square"
    ApplySettingsFlag = true
    MainMenu()
end

function Armies3D()
    ArmiesSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function Armies2D()
    ArmiesSettingType = "2D"
    ApplySettingsFlag = true
    MainMenu()
end

function ArmiesRound()
    ArmiesSettingType = "Round"
    ApplySettingsFlag = true
    MainMenu()
end

function Factions3D()
    FactionsSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function Factions2D()
    FactionsSettingType = "2D"
    ApplySettingsFlag = true
    MainMenu()
end

function FactionsRound()
    FactionsSettingType = "Round"
    ApplySettingsFlag = true
    MainMenu()
end

function MtDoom3D()
    MountDoomSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function MtDoomFlat()
    MountDoomSettingType = "Flat"
    ApplySettingsFlag = true
    MainMenu()
end

function Settlements3D()
    SettlementsSettingType = "3D"
    ApplySettingsFlag = true
    MainMenu()
end

function SettlementsFlat()
    SettlementsSettingType = "Flat"
    ApplySettingsFlag = true
    MainMenu()
end

function SoundEffectsOn()
    Sound = "On"
    ApplySettingsFlag = true
    MainMenu()
end

function SoundEffectsOff()
    Sound = "Off"
    ApplySettingsFlag = true
    MainMenu()
end

function ScreamAlways()
    ScreamSettingType = "Always"
    ApplySettingsFlag = true
    MainMenu()
end

function ScreamOnce()
    ScreamSettingType = "Once"
    ApplySettingsFlag = true
    MainMenu()
end

function ScreamNever()
    ScreamSettingType = "Never"
    ApplySettingsFlag = true
    MainMenu()
end

function WarningsOn()
    WarningsSettingType = "On"
    ApplySettingsFlag = true
    MainMenu()
end

function WarningsOff()
    WarningsSettingType = "Off"
    ApplySettingsFlag = true
    MainMenu()
end

function DiceOriginal()
    DiceSettingType = "Original"
    ApplySettingsFlag = true
    MainMenu()
end

function DiceAnniversary()
    DiceSettingType = "Anniversary"
    ApplySettingsFlag = true
    MainMenu()
end

function ToggleDicePanels()
    local DPO = nil --dice panel object
    local DPS = {} --dice panel spots
    local DPY = 0 --dice panel fpp y rotation

    for _, Obj in pairs(getAllObjects()) do
        if Obj.getName() == "(Free Peoples Combat Die)" or Obj.getName() == "(Shadow Combat Die)" then
            Obj.destruct()
        end
    end

    if DicePanels == "Sic" then
        DicePanels = "Strips"
        if getObjectFromGUID("4b6f4c") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("4b6f4c"))
        end

        if getObjectFromGUID("92a611") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("92a611"))
        end

        if Global.getVar("CompactMode") then
            DPS = {
                Red = {-3, 1.01, -21.5},
                Black = {-3, 1.01, -23},
                Blue = {-23.75, 1.01, -15.75},
                White = {-23.75, 1.01, -17.25}
            }
            DPY = 180
        else --not compact mode...
            DPS = {
                Red = {-60, 1.14, -35.5},
                Black = {-60, 1.14, -37},
                Blue = {-60, 1.14, 35.5},
                White = {-60, 1.14, 37}
            }
            DPY = 0
        end

        --fetch red strip...
        if getObjectFromGUID("9847f7") ~= nil then
            DPO = getObjectFromGUID("9847f7")
        else
            DPO = getObjectFromGUID("0e5fd1").takeObject({guid = "9847f7", position = DPS.Red, rotation = {0, 180, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.Red)
            DPO.setRotation({0, 180, 0})
            DPO.setLock(true)
        end

        --fetch black strip...
        if getObjectFromGUID("63319b") ~= nil then
            DPO = getObjectFromGUID("63319b")
        else
            DPO =
                getObjectFromGUID("0e5fd1").takeObject({guid = "63319b", position = DPS.Black, rotation = {0, 180, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.Black)
            DPO.setRotation({0, 180, 0})
            DPO.setLock(true)
        end

        --fetch blue strip...
        if getObjectFromGUID("637507") ~= nil then
            DPO = getObjectFromGUID("637507")
        else
            DPO = getObjectFromGUID("0e5fd1").takeObject({guid = "637507", position = DPS.Blue, rotation = {0, DPY, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.Blue)
            DPO.setRotation({0, DPY, 0})
            DPO.setLock(true)
        end

        --fetch white strip...
        if getObjectFromGUID("f50dab") ~= nil then
            DPO = getObjectFromGUID("f50dab")
        else
            DPO =
                getObjectFromGUID("0e5fd1").takeObject({guid = "f50dab", position = DPS.White, rotation = {0, DPY, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.White)
            DPO.setRotation({0, DPY, 0})
            DPO.setLock(true)
        end
    else --assume was strips..
        DicePanels = "Sic"
        if getObjectFromGUID("637507") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("637507"))
        end

        if getObjectFromGUID("f50dab") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("f50dab"))
        end

        if getObjectFromGUID("9847f7") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("9847f7"))
        end

        if getObjectFromGUID("63319b") ~= nil then
            getObjectFromGUID("0e5fd1").setLock(false)
            getObjectFromGUID("0e5fd1").putObject(getObjectFromGUID("63319b"))
        end

        if Global.getVar("CompactMode") then
            DPS = {F = {-23.7, 1.01, -14.2}, S = {-1.9, 1.01, -21.5}}
            DPY = 0
        else --not compact mode...
            DPS = {F = {-60, 1.14, 34}, S = {-60, 1.14, -34}}
            DPY = 180
        end

        --fetch shadow panel...
        if getObjectFromGUID("92a611") ~= nil then
            DPO = getObjectFromGUID("92a611")
        else
            DPO = getObjectFromGUID("0e5fd1").takeObject({guid = "92a611", position = DPS.S, rotation = {0, 0, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.S)
            DPO.setRotation({0, 0, 0})
            DPO.setLock(true)
        end

        --fetch FPP panel...
        if getObjectFromGUID("4b6f4c") ~= nil then
            DPO = getObjectFromGUID("4b6f4c")
        else
            DPO = getObjectFromGUID("0e5fd1").takeObject({guid = "4b6f4c", position = DPS.F, rotation = {0, DPY, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.F)
            DPO.setRotation({0, DPY, 0})
            DPO.setLock(true)
        end
    end
end

function CancelButton()
    InitPreferences()
end

function ApplyButton()
    self.clearButtons()
    self.createButton(
        {
            click_function = "ApplyPreferences",
            function_owner = self,
            label = "Please Wait\nApplying Preferences...",
            position = {0, 0.1, 0},
            width = 0,
            height = 0,
            font_size = 150,
            font_color = {1, 1, 1}
        }
    )

    function ApplyPreferencesCoroutine()
        local SoundCube = getObjectFromGUID("74cc15")
        --Sound
        if SoundCube == nil then
            printToAll("Sound Cube is missing so sounds are Muted.")
            Global.setVar("Mute", true)
            Sound = "Off"
        elseif Sound == "On" then
            Global.setVar("Mute", false)
            SoundCube.setDescription("SoundCube;")
        else
            Sound = "Off"
            Global.setVar("Mute", true)
            SoundCube.setDescription("SoundCube;Muted;")
        end

        SoundCube.call("Menu")
        --sound cube.
        coroutine.yield(0)
        --get out new figurine templates...
        local ComponentBag = getObjectFromGUID("0e5fd1")
        local AllObjects = getAllObjects()

        UpdateArmies(ComponentBag, AllObjects)
        UpdateCharacters()
        UpdateFactions()
        UpdateNazguls()

        UpdateSettlements()
        UpdateDices()

        coroutine.yield(0)
        UpdateMountDoom()

        Global.call("InitComponents")
        RecordPreferences()
        coroutine.yield(0)

        ApplySettingsFlag = false
        printToAll("Changes to Preferences Completed.")
        MainMenu()
        return 1
    end

    startLuaCoroutine(self, "ApplyPreferencesCoroutine")
end

function UpdateArmies(ComponentBag, AllObjects)
    -- Regular;Elite;Leader;
    -- but not Nazgul
    
    coroutine.yield(0)
    local TemplateList = {}
    local TempX = 80

    --get out army templates...
    for _, Item in pairs(ComponentBag.getObjects()) do
        if
            Item.name ~= "Nazgûl" and
                (string.find(Item.description, "Regular;") ~= nil or string.find(Item.description, "Elite;") ~= nil or
                    string.find(Item.description, "Leader;") ~= nil)
         then
            if
                (ArmiesSettingType == "2D" and string.find(Item.description, "2D;") ~= nil) or
                    (ArmiesSettingType == "3D" and string.find(Item.description, "3D;") ~= nil) or
                    (ArmiesSettingType == "Round" and string.find(Item.description, "Marble;") ~= nil)
             then
                TempX = TempX - 1
                local TempObj = ComponentBag.takeObject({
                    guid = Item.guid,
                    smooth = false,
                    position = {TempX, -2, -60},
                    rotation = {0, 180, 0}
                })

                coroutine.yield(0)
                TempObj.setLock(true)
                TempObj.setPosition({TempX, -2, -60})
                TempObj.setRotation({0, 180, 0})
                table.insert(TemplateList, TempObj.getGUID())
            end
        end
    end

    coroutine.yield(0)

    -- replace
    for T = 1, #TemplateList do
        local Template = getObjectFromGUID(TemplateList[T])
        printToAll("Updating " .. Template.getName() .. "...")

        for _, Obj in pairs(AllObjects) do
            if Template.getName() == Obj.getName() and ObjectIsFigurineOrTileset(Obj) then
                local NewObj = Template.clone({position = Obj.getPosition()})
                NewObj.setLock(false)
                NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                Obj.destruct()
            end
        end

        ComponentBag.putObject(Template)
        coroutine.yield(0)
    end
end

function UpdateCharacters()
    --Characters (Characters;Companions;Rulers;Minions;)...
    coroutine.yield(0)
    local TemplateList = {}
    TempX = 80

    --get out character templates...
    for _, Item in pairs(ComponentBag.getObjects()) do
        if
            Item.name ~= "Nazgûl" and
                (string.find(Item.description, "Character;") ~= nil or string.find(Item.description, "Minion;") ~= nil)
         then
            --correct state?
            if
                (CharactersSettingType == "2D" and string.find(Item.description, "2D;") ~= nil) or
                    (CharactersSettingType == "3D" and string.find(Item.description, "3D;") ~= nil) or
                    (CharactersSettingType == "Square" and string.find(Item.description, "Marble;") ~= nil)
             then
                TempX = TempX - 1
                local TempObj = ComponentBag.takeObject({
                    guid = Item.guid,
                    smooth = false,
                    position = {TempX, -2, -61},
                    rotation = {0, 180, 0}
                })
                coroutine.yield(0)
                TempObj.setLock(true)
                TempObj.setPosition({TempX, -2, -61})
                TempObj.setRotation({0, 180, 0})
                table.insert(TemplateList, TempObj.getGUID())
            end
        end
    end

    coroutine.yield(0)

    --go through templatelist and replace matching components...
    for I = 1, #TemplateList do
        local Template = getObjectFromGUID(TemplateList[I])
        printToAll("Updating " .. Template.getName() .. "...")

        --go through all objects and look for those to replace...
        for _, Obj in pairs(AllObjects) do
            if Template.getName() == Obj.getName() and ObjectIsFigurineOrTileset(Obj) then
                local NewObj = Template.clone({position = Obj.getPosition()})
                NewObj.setLock(false)
                NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                Obj.destruct()
            end
        end
        ComponentBag.putObject(Template)
        coroutine.yield(0)
    end
end

function UpdateFactions()
    --Factions...
    coroutine.yield(0)
    TemplateList = {}
    TempX = 80

    --get out faction templates...
    for _, Item in pairs(ComponentBag.getObjects()) do
        if Item.name ~= "Nazgûl" and (string.find(Item.description, "Faction;") ~= nil) then
            --correct state?
            if
                (FactionsSettingType == "2D" and string.find(Item.description, "2D;") ~= nil) or
                    (FactionsSettingType == "3D" and string.find(Item.description, "3D;") ~= nil) or
                    (FactionsSettingType == "Round" and string.find(Item.description, "Marble;") ~= nil)
             then
                TempX = TempX - 1
                local TempObj =
                    ComponentBag.takeObject(
                    {guid = Item.guid, smooth = false, position = {TempX, -2, -62}, rotation = {0, 180, 0}}
                )
                coroutine.yield(0)
                TempObj.setLock(true)
                TempObj.setPosition({TempX, -2, -62})
                TempObj.setRotation({0, 180, 0})
                table.insert(TemplateList, TempObj.getGUID())
            end
        end
    end

    coroutine.yield(0)

    --go through templatelist and replace matching components...
    for T = 1, #TemplateList do
        local Template = getObjectFromGUID(TemplateList[T])
        printToAll("Updating " .. Template.getName() .. "...")

        --go through all objects and look for those to replace...
        for O, Obj in pairs(AllObjects) do
            if Template.getName() == Obj.getName() and ObjectIsFigurineOrTileset(Obj) then
                local NewObj = Template.clone({position = Obj.getPosition()})
                NewObj.setLock(false)
                NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                Obj.destruct()
            end
        end

        ComponentBag.putObject(Template)
        coroutine.yield(0)
    end
end

function UpdateNazguls()
    --Nazgul...
    coroutine.yield(0)
    TemplateList = {}
    TempX = 80

    --get out nazgul templates...
    for _, Item in pairs(ComponentBag.getObjects()) do
        if Item.name == "Nazgûl" and (string.find(Item.description, "Leader;") ~= nil) then
            if
                (NazgulSettingType == "2D" and string.find(Item.description, "2D;") ~= nil) or
                    (NazgulSettingType == "3D" and string.find(Item.description, "3D;") ~= nil) or
                    (NazgulSettingType == "Square" and string.find(Item.description, "Square;") ~= nil) or
                    (NazgulSettingType == "Round" and string.find(Item.description, "Round;") ~= nil)
             then
                TempX = TempX - 1
                local TempObj =
                    ComponentBag.takeObject(
                    {guid = Item.guid, smooth = false, position = {TempX, -2, -63}, rotation = {0, 180, 0}}
                )
                coroutine.yield(0)
                TempObj.setLock(true)
                TempObj.setPosition({TempX, -2, -63})
                TempObj.setRotation({0, 180, 0})
                table.insert(TemplateList, TempObj.getGUID())
            end
        end
    end

    coroutine.yield(0)

    --go through templatelist and replace matching components...
    for T = 1, #TemplateList do
        local Template = getObjectFromGUID(TemplateList[T])
        printToAll("Updating " .. Template.getName() .. "...")

        --go through all objects and look for those to replace...
        for O, Obj in pairs(AllObjects) do
            if
                Template.getName() == Obj.getName() and Template.getDescription() ~= Obj.getDescription() and
                    ObjectIsFigurineOrTileset(Obj)
             then
                local NewObj = Template.clone({position = Obj.getPosition()})
                NewObj.setLock(false)
                NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                Obj.destruct()
            end
        end
        ComponentBag.putObject(Template)
        coroutine.yield(0)
    end

    coroutine.yield(0)
end

function UpdateSettlements()
    local Group = 10

    for _, Obj in pairs(AllObjects) do
        TryUpdateSettlementObject(Obj)
        coroutine.yield(0)

        Group = Group - 1
        if Group < 0 then
            coroutine.yield(0)
            Group = 10
        end
    end
end

function UpdateDices()
    local Group = 10

    for _, Obj in pairs(AllObjects) do
        TryUpdateDiceObject(Obj)
        coroutine.yield(0)

        Group = Group - 1
        if Group < 0 then
            coroutine.yield(0)
            Group = 10
        end
    end
end

function TryUpdateSettlementObject(Obj)
    if ObjectIsUnit(Obj) then
        return false
    end

    if not (Obj.type == "Tile" and Obj.getLock) then
        return false
    end

    local description = Obj.getDescription()

    if string.find(description, "Stronghold;") then
        UpdateSettlementObject(Obj, SettlementsConfigs.Stronghold)
        return true
    elseif string.find(description, "City;") then
        UpdateSettlementObject(Obj, SettlementsConfigs.City)
        return true
    elseif Obj.getName() == "Fortification" then
        UpdateSettlementObject(Obj, SettlementsConfigs.Fortification)
        return true
    end

    return false
end

function UpdateSettlementObject(Obj, config)
    Obj.setRotationSmooth({0, 180, 0}, false, false)

    if SettlementsSettingType == "3D" then
        Obj.setPosition({Obj.getPosition().x, config.PositionY_3D, Obj.getPosition().z})

        local conflictedObjects =
            Physics.cast(
            {
                origin = Obj.getPosition(),
                direction = {0, 1, 0},
                type = 3,
                size = config.Size,
                orientation = {0, 0, 0},
                max_distance = 0,
                debug = true
            }
        )

        for _, SubObj in pairs(conflictedObjects) do
            if SubObj.hit_object.getLock() == false then
                SubObj.hit_object.translate({0, 1, 0})
            end
        end
    else
        Obj.setPositionSmooth({Obj.getPosition().x, config.PositionY_Flat, Obj.getPosition().z}, false, false)
    end
end

function TryUpdateDiceObject(oldDiceObj)
    if ObjectIsUnit(oldDiceObj) then
        return false
    end

    if oldDiceObj.type ~= "Dice" then
        return false
    end

    local description = oldDiceObj.getDescription()

    if string.find(description, "Combat;") ~= nil then
        return false
    end

    local newDiceObj = nil
    local isAnniversaryDiceObject = string.find(description, "Anniversary;") ~= nil
    local isAnniversarySetting = DiceSettingType == "Anniversary"
    local needSwap = isAnniversaryDiceObject ~= isAnniversarySetting

    if not needSwap then
        return false
    end

    --look in dice bag for replacement...
    local ComponentBag = getObjectFromGUID("0e5fd1")
    local GamePanelID = "6158a0"
    local GamePanel = getObjectFromGUID(GamePanelID)
    local IDs = GamePanel.getTable("IDs")

    for _, Item in pairs(ComponentBag.getObjects()) do
        --match? same description (except anniversary tag) and either anniversary or not anniversary...
        local isSameDiceIndex =
            string.gsub(description, "Anniversary;", "") == string.gsub(Item.description, "Anniversary;", "")
        local isAnniversaryDice = string.find(Item.description, "Anniversary;") ~= nil
        local isAnotherDiceType = isAnniversarySetting ~= isAnniversaryDice

        if isSameDiceIndex and isAnotherDiceType then
            newDiceObj = ComponentBag.takeObject(
                {
                    guid = Item.guid,
                    position = oldDiceObj.getPosition(),
                    rotation = oldDiceObj.getRotation(),
                    smooth = true
                }
            )

            coroutine.yield(0)
            Global.call("SetDiceFace", {Dice = newDiceObj, Value = oldDiceObj.getRotationValue()})

            ComponentBag.putObject(oldDiceObj)
            coroutine.yield(0)

            UpdateDiceId(description, newDiceObj, IDs)

            GamePanel.setTable("IDs", IDs)
            break
        end
    end
end

function UpdateDiceId(description, newDiceObj, IDs)
    local isShadowDice = string.find(description, "Shadow;") ~= nil
    local isFreePeopleDice = string.find(description, "FreePeoples;") ~= nil
    local diceArray = {}
    local diceIndex = GetDiceIndex(description)

    if isShadowDice then
        diceArray = IDs.ShadowActionDice
    elseif isFreePeopleDice then
        diceArray = IDs.FreePeoplesActionDice
    end

    diceArray[diceIndex] = newDiceObj.getGUID()
end

function GetDiceIndex(description)
    local pattern = "(%d+)of%d+;"
    local number = string.match(description, pattern)
    return tonumber(number)
end

function UpdateMountDoom()
    if MountDoomSettingType == "Flat" then
        if getObjectFromGUID("76fca0") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("76fca0"))
        end

        coroutine.yield(0)
        if getObjectFromGUID("7b7ed8") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("7b7ed8"))
        end

        coroutine.yield(0)
        if getObjectFromGUID("873d56") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("873d56"))
        end

        coroutine.yield(0)
        if getObjectFromGUID("ec1790") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("ec1790"))
        end

        coroutine.yield(0)
        if getObjectFromGUID("a8c069") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("a8c069"))
        end

        coroutine.yield(0)
        if getObjectFromGUID("03e684") ~= nil then
            getObjectFromGUID("416864").putObject(getObjectFromGUID("03e684"))
        end

        coroutine.yield(0)
    else
        if getObjectFromGUID("03e684") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "03e684", position = {24.8, 1.01, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("03e684").setLock(true)
        end

        coroutine.yield(0)
        if getObjectFromGUID("a8c069") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "a8c069", position = {24.8, 1.11, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("a8c069").setLock(true)
        end

        coroutine.yield(0)
        if getObjectFromGUID("ec1790") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "ec1790", position = {24.8, 1.21, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("ec1790").setLock(true)
        end

        coroutine.yield(0)
        if getObjectFromGUID("873d56") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "873d56", position = {24.8, 1.31, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("873d56").setLock(true)
        end

        coroutine.yield(0)
        if getObjectFromGUID("7b7ed8") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "7b7ed8", position = {24.8, 1.41, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("7b7ed8").setLock(true)
        end

        coroutine.yield(0)
        if getObjectFromGUID("76fca0") == nil then
            getObjectFromGUID("416864").takeObject(
                {smooth = false, guid = "76fca0", position = {24.8, 1.56, -9.85}, rotation = {0, 180, 0}}
            )
            getObjectFromGUID("76fca0").setLock(true)
        end

        coroutine.yield(0)
    end
end

function RecordPreferences()
    --record settings...
    Global.setVar("RulesWarnings", WarningsSettingType == "On")
    local Notes = "Scale:" .. FigureScale .. ";"
    Notes = Notes .. "Characters:" .. CharactersSettingType .. ";"
    Notes = Notes .. "Nazgul:" .. NazgulSettingType .. ";"
    Notes = Notes .. "Armies:" .. ArmiesSettingType .. ";"
    Notes = Notes .. "Factions:" .. FactionsSettingType .. ";"
    if ModelLockSetting then
        Notes = Notes .. "ModelLock:1;"
    end
    -- if models locked.
    Notes = Notes .. "MtDoom:" .. MountDoomSettingType .. ";"
    Notes = Notes .. "Settlements:" .. SettlementsSettingType .. ";"
    if Sound then
        Notes = Notes .. "Sound:On;"
    else
        Notes = Notes .. "Sound:Off;"
    end

    Notes = Notes .. "Scream:" .. ScreamSettingType .. ";"
    Notes = Notes .. "Warnings:" .. WarningsSettingType .. ";"
    Notes = Notes .. "Dice:" .. DiceSettingType .. ";"
    self.setGMNotes(Notes)
end

function ChangeFigureScaleCoroutine()
    self.clearButtons()
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Please Wait...\n\n(Changing Figure Scale)...",
            position = {0, 0.1, 0},
            width = 0,
            height = 0,
            font_size = 100,
            font_color = {1, 1, 1}
        }
    )

    coroutine.yield(0)

    for _, Obj in pairs(getAllObjects()) do
        if ObjectIsFigurineOrTileset(Obj) and ObjectIsUnit(Obj) then
            Obj.setScale({Obj.getScale().x * ScaleMult, Obj.getScale().y * ScaleMult, Obj.getScale().z * ScaleMult})
        end
    end

    coroutine.yield(0)

    print("FigureScale:", string.format("%.0f", FigureScale))
    Global.call("UpdateTag", {Text = self.getGMNotes(), Tag = "Scale", Value = string.format("%.0f", FigureScale)})
    MainMenu()
    return 1
end

function ObjectIsFigurineOrTileset(Obj)
    return Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset"
end

function ObjectIsUnit(Obj)
    local description = Obj.getDescription()
    return string.find(description, "Character;") ~= nil or 
        string.find(description, "Minion;") ~= nil or
        string.find(description, "Faction;") ~= nil or
        string.find(description, "Regular;") ~= nil or
        string.find(description, "Elite;") ~= nil or
        string.find(description, "Leader;") ~= nil
end