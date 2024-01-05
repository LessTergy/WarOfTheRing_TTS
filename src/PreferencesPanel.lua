function onLoad(save_state)
    InitPreferences()
end

function InitPreferences()
    FigureScale = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Scale", Default = "100"})
    --100
    Characters = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Characters", Default = "3D"})
    --3D,2D,Square
    Nazgul = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Nazgul", Default = "3D"})
    --3D,2D,Round,Square
    Armies = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Armies", Default = "3D"})
    --3D,2D,Round
    Factions = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Factions", Default = "3D"})
    --3D,2D,Round
    Mountains = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Mountains", Default = "3D"})
    --Flat,3D
    MtDoom = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "MtDoom", Default = "3D"})
    --Flat,3D
    Settlements = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Settlements", Default = "3D"})
    --Flat,3D
    Dice = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Dice", Default = "Original"})
    --Original,Anniversary
    if getObjectFromGUID("4b6f4c") == nil then
        DicePanels = "Strips"
    else
        DicePanels = "Sic"
    end

    ModelLock = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "ModelLock", Default = "0"}) == "1"
    if Global.getVar("Mute") then
        Sound = "Off"
    else
        Sound = "On"
    end
    Scream = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Scream", Default = "Once"})
    --Always,Once,Never
    Warnings = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Warnings", Default = "On"})
    --On,Off
    Global.setVar("RulesWarnings", Warnings == "On")
    Apply = false
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
    local MountainsFlatColor = {1, 1, 1}
    local Mountains3DColor = {1, 1, 1}
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
    if Characters == "2D" then
        Characters2DColor = {1, 1, 0}
    elseif Characters == "Square" then
        CharactersSquareColor = {1, 1, 0}
    else
        Characters3DColor = {1, 1, 0}
    end

    if Nazgul == "2D" then
        Nazgul2DColor = {1, 1, 0}
    elseif Nazgul == "Round" then
        NazgulRoundColor = {1, 1, 0}
    elseif Nazgul == "Square" then
        NazgulSquareColor = {1, 1, 0}
    else
        Nazgul3DColor = {1, 1, 0}
    end

    if Armies == "2D" then
        Armies2DColor = {1, 1, 0}
    elseif Armies == "Round" then
        ArmiesRoundColor = {1, 1, 0}
    else
        Armies3DColor = {1, 1, 0}
    end

    if Factions == "2D" then
        Factions2DColor = {1, 1, 0}
    elseif Factions == "Round" then
        FactionsRoundColor = {1, 1, 0}
    else
        Factions3DColor = {1, 1, 0}
    end

    if Mountains == "3D" then
        Mountains3DColor = {1, 1, 0}
    else
        MountainsFlatColor = {1, 1, 0}
    end

    if MtDoom == "3D" then
        MtDoom3DColor = {1, 1, 0}
    else
        MtDoomFlatColor = {1, 1, 0}
    end

    if Settlements == "3D" then
        Settlements3DColor = {1, 1, 0}
    else
        SettlementsFlatColor = {1, 1, 0}
    end

    if Scream == "Always" then
        ScreamAlwaysColor = {1, 1, 0}
    elseif Scream == "Once" then
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

    if Warnings == "On" then
        WarningsOnColor = {1, 1, 0}
    else
        WarningsOffColor = {1, 1, 0}
    end

    if Dice == "Anniversary" then
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
    --mountains buttons...
    self.createButton(
        {
            click_function = "Mountains3D",
            function_owner = self,
            label = "3D",
            position = {-0.4, 0.1, -0.2},
            scale = {0.5, 0.5, 0.5},
            color = Mountains3DColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Use 3D Mountain Borders."
        }
    )
    self.createButton(
        {
            click_function = "MountainsFlat",
            function_owner = self,
            label = "Flat",
            position = {0.3, 0.1, -0.2},
            scale = {0.5, 0.5, 0.5},
            color = MountainsFlatColor,
            font_color = {0, 0, 0},
            width = 650,
            height = 150,
            font_size = 100,
            tooltip = "Do not use 3D Mountain Borders."
        }
    )
    if Mountains == "3D" then
        self.createButton(
            {
                click_function = "MountainsColorGrey",
                function_owner = self,
                label = "",
                position = {0.8, 0.1, -0.2},
                scale = {0.5, 0.5, 0.5},
                color = {0.6, 0.6, 0.6},
                font_color = {0, 0, 0},
                width = 150,
                height = 150,
                font_size = 100,
                tooltip = "Set 3D Mountain Color to Grey.\n(Applies immediately)."
            }
        )
        self.createButton(
            {
                click_function = "MountainsColorDarkGrey",
                function_owner = self,
                label = "",
                position = {1, 0.1, -0.2},
                scale = {0.5, 0.5, 0.5},
                color = {0.3, 0.3, 0.3},
                font_color = {0, 0, 0},
                width = 150,
                height = 150,
                font_size = 100,
                tooltip = "Set 3D Mountain Color to Dark Grey.\n(Applies immediately)."
            }
        )
        self.createButton(
            {
                click_function = "MountainsColorLightBrown",
                function_owner = self,
                label = "",
                position = {1.2, 0.1, -0.2},
                scale = {0.5, 0.5, 0.5},
                color = {0.63, 0.59, 0.33},
                font_color = {0, 0, 0},
                width = 150,
                height = 150,
                font_size = 100,
                tooltip = "Set 3D Mountain Color to Light Brown.\n(Applies immediately)."
            }
        )
        self.createButton(
            {
                click_function = "MountainsColorDarkBrown",
                function_owner = self,
                label = "",
                position = {1.4, 0.1, -0.2},
                scale = {0.5, 0.5, 0.5},
                color = {0.27, 0.11, 0},
                font_color = {0, 0, 0},
                width = 150,
                height = 150,
                font_size = 100,
                tooltip = "Set 3D Mountain Color to Dark Brown.\n(Applies immediately)."
            }
        )
        self.createButton(
            {
                click_function = "MountainsColorBlack",
                function_owner = self,
                label = "",
                position = {1.6, 0.1, -0.2},
                scale = {0.5, 0.5, 0.5},
                color = {0, 0, 0},
                font_color = {0, 0, 0},
                width = 150,
                height = 150,
                font_size = 100,
                tooltip = "Set 3D Mountain Color to Black.\n(Applies immediately)."
            }
        )
    end

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
    if Apply then
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

function Characters3D()
    Characters = "3D"
    Apply = true
    MainMenu()
end

function Characters2D()
    Characters = "2D"
    Apply = true
    MainMenu()
end

function CharactersSquare()
    Characters = "Square"
    Apply = true
    MainMenu()
end

function Nazgul3D()
    Nazgul = "3D"
    Apply = true
    MainMenu()
end

function Nazgul2D()
    Nazgul = "2D"
    Apply = true
    MainMenu()
end

function NazgulRound()
    Nazgul = "Round"
    Apply = true
    MainMenu()
end

function NazgulSquare()
    Nazgul = "Square"
    Apply = true
    MainMenu()
end

function Armies3D()
    Armies = "3D"
    Apply = true
    MainMenu()
end

function Armies2D()
    Armies = "2D"
    Apply = true
    MainMenu()
end

function ArmiesRound()
    Armies = "Round"
    Apply = true
    MainMenu()
end

function Factions3D()
    Factions = "3D"
    Apply = true
    MainMenu()
end

function Factions2D()
    Factions = "2D"
    Apply = true
    MainMenu()
end

function FactionsRound()
    Factions = "Round"
    Apply = true
    MainMenu()
end

function Mountains3D()
    Mountains = "3D"
    Apply = true
    MainMenu()
end

function MountainsFlat()
    Mountains = "Flat"
    Apply = true
    MainMenu()
end

function MountainsColorBlack()
    SetMountainsColor({0.1, 0.1, 0.1})
end

function MountainsColorLightBrown()
    SetMountainsColor({0.63, 0.59, 0.33})
end

function MountainsColorDarkBrown()
    SetMountainsColor({0.27, 0.11, 0})
end

function MountainsColorDarkGrey()
    SetMountainsColor({0.3, 0.3, 0.3})
end

function MountainsColorGrey()
    SetMountainsColor({0.6, 0.6, 0.6})
end

function SetMountainsColor(MountainColor)
    if getObjectFromGUID("7aaf2c") ~= nil then
        getObjectFromGUID("7aaf2c").setColorTint(MountainColor)
    end

    if getObjectFromGUID("7a1251") ~= nil then
        getObjectFromGUID("7a1251").setColorTint(MountainColor)
    end

    if getObjectFromGUID("0afd38") ~= nil then
        getObjectFromGUID("0afd38").setColorTint(MountainColor)
    end

    if getObjectFromGUID("f0c8c7") ~= nil then
        getObjectFromGUID("f0c8c7").setColorTint(MountainColor)
    end

    if getObjectFromGUID("d263d6") ~= nil then
        getObjectFromGUID("d263d6").setColorTint(MountainColor)
    end

    if getObjectFromGUID("f9b806") ~= nil then
        getObjectFromGUID("f9b806").setColorTint(MountainColor)
    end

    if getObjectFromGUID("f57090") ~= nil then
        getObjectFromGUID("f57090").setColorTint(MountainColor)
    end

    if getObjectFromGUID("ac38bf") ~= nil then
        getObjectFromGUID("ac38bf").setColorTint(MountainColor)
    end

    if getObjectFromGUID("4d1cda") ~= nil then
        getObjectFromGUID("4d1cda").setColorTint(MountainColor)
    end

    if getObjectFromGUID("a50a62") ~= nil then
        getObjectFromGUID("a50a62").setColorTint(MountainColor)
    end

    if getObjectFromGUID("2943f2") ~= nil then
        getObjectFromGUID("2943f2").setColorTint(MountainColor)
    end

    if getObjectFromGUID("0e6df7") ~= nil then
        getObjectFromGUID("0e6df7").setColorTint(MountainColor)
    end

    if getObjectFromGUID("0869e7") ~= nil then
        getObjectFromGUID("0869e7").setColorTint(MountainColor)
    end

    if getObjectFromGUID("bc29d9") ~= nil then
        getObjectFromGUID("bc29d9").setColorTint(MountainColor)
    end
end

function MtDoom3D()
    MtDoom = "3D"
    Apply = true
    MainMenu()
end

function MtDoomFlat()
    MtDoom = "Flat"
    Apply = true
    MainMenu()
end

function Settlements3D()
    Settlements = "3D"
    Apply = true
    MainMenu()
end

function SettlementsFlat()
    Settlements = "Flat"
    Apply = true
    MainMenu()
end

function SoundEffectsOn()
    Sound = "On"
    Apply = true
    MainMenu()
end

function SoundEffectsOff()
    Sound = "Off"
    Apply = true
    MainMenu()
end

function ScreamAlways()
    Scream = "Always"
    Apply = true
    MainMenu()
end

function ScreamOnce()
    Scream = "Once"
    Apply = true
    MainMenu()
end

function ScreamNever()
    Scream = "Never"
    Apply = true
    MainMenu()
end

function WarningsOn()
    Warnings = "On"
    Apply = true
    MainMenu()
end

function WarningsOff()
    Warnings = "Off"
    Apply = true
    MainMenu()
end

function DiceOriginal()
    Dice = "Original"
    Apply = true
    MainMenu()
end

function DiceAnniversary()
    Dice = "Anniversary"
    Apply = true
    MainMenu()
end

function ToggleDicePanels()
    local DPO = nil --dice panel object
    local DPS = {} --dice panel spots
    local DPY = 0 --dice panel fpp y rotation
    local ComponentsBag = getObjectFromGUID("0e5fd1")

    for O, Obj in pairs(getAllObjects()) do
        if Obj.getName() == "(Free Peoples Combat Die)" or Obj.getName() == "(Shadow Combat Die)" then
            Obj.destruct()
        end
    end

    if DicePanels == "Sic" then
        DicePanels = "Strips"
        if getObjectFromGUID("4b6f4c") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("4b6f4c"))
        end

        if getObjectFromGUID("92a611") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("92a611"))
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
            DPO = ComponentsBag.takeObject({guid = "9847f7", position = DPS.Red, rotation = {0, 180, 0}})
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
                ComponentsBag.takeObject({guid = "63319b", position = DPS.Black, rotation = {0, 180, 0}})
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
            DPO = ComponentsBag.takeObject({guid = "637507", position = DPS.Blue, rotation = {0, DPY, 0}})
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
                ComponentsBag.takeObject({guid = "f50dab", position = DPS.White, rotation = {0, DPY, 0}})
        end

        if DPO ~= nil then
            DPO.setPosition(DPS.White)
            DPO.setRotation({0, DPY, 0})
            DPO.setLock(true)
        end
    else --assume was strips..
        DicePanels = "Sic"
        if getObjectFromGUID("637507") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("637507"))
        end

        if getObjectFromGUID("f50dab") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("f50dab"))
        end

        if getObjectFromGUID("9847f7") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("9847f7"))
        end

        if getObjectFromGUID("63319b") ~= nil then
            ComponentsBag.setLock(false)
            ComponentsBag.putObject(getObjectFromGUID("63319b"))
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
            DPO = ComponentsBag.takeObject({guid = "92a611", position = DPS.S, rotation = {0, 0, 0}})
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
            DPO = ComponentsBag.takeObject({guid = "4b6f4c", position = DPS.F, rotation = {0, DPY, 0}})
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
        local ComponentsBag = getObjectFromGUID("0e5fd1")
        local TemplateList = {}
        local TempX = 80
        local ObjectList = getAllObjects()

        --ARMIES (Regular;Elite;Leader;)...
        coroutine.yield(0)
        --get out army templates...
        for I, Item in pairs(ComponentsBag.getObjects()) do
            if
                Item.name ~= "Nazgûl" and
                    (string.find(Item.description, "Regular;") ~= nil or string.find(Item.description, "Elite;") ~= nil or
                        string.find(Item.description, "Leader;") ~= nil)
             then
                --correct state?
                if
                    (Armies == "2D" and string.find(Item.description, "2D;") ~= nil) or
                        (Armies == "3D" and string.find(Item.description, "3D;") ~= nil) or
                        (Armies == "Round" and string.find(Item.description, "Marble;") ~= nil)
                 then
                    TempX = TempX - 1
                    local TempObj =
                        ComponentsBag.takeObject(
                        {guid = Item.guid, smooth = false, position = {TempX, -2, -60}, rotation = {0, 180, 0}}
                    )
                    coroutine.yield(0)
                    TempObj.setLock(true)
                    TempObj.setPosition({TempX, -2, -60})
                    TempObj.setRotation({0, 180, 0})
                    table.insert(TemplateList, TempObj.getGUID())
                end
            -- if correct state?
            end
            -- if item.type
        end

        coroutine.yield(0)
        --go through templatelist and replace matching components...
        for T = 1, #TemplateList do
            local Template = getObjectFromGUID(TemplateList[T])
            printToAll("Updating " .. Template.getName() .. "...")
            --go through all objects and look for those to replace...
            for O, Obj in pairs(ObjectList) do
                if
                    Template.getName() == Obj.getName() and
                        (Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset")
                 then
                    local NewObj = Template.clone({position = Obj.getPosition()})
                    NewObj.setLock(false)
                    NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                    Obj.destruct()
                end
            end

            ComponentsBag.putObject(Template)
            coroutine.yield(0)
        end

        coroutine.yield(0)
        TemplateList = {}
        TempX = 80
        --get out character templates...
        for I, Item in pairs(ComponentsBag.getObjects()) do
            if
                Item.name ~= "Nazgûl" and
                    (string.find(Item.description, "Character;") ~= nil or
                        string.find(Item.description, "Minion;") ~= nil)
             then
                --correct state?
                if
                    (Characters == "2D" and string.find(Item.description, "2D;") ~= nil) or
                        (Characters == "3D" and string.find(Item.description, "3D;") ~= nil) or
                        (Characters == "Square" and string.find(Item.description, "Marble;") ~= nil)
                 then
                    TempX = TempX - 1
                    local TempObj =
                        ComponentsBag.takeObject(
                        {guid = Item.guid, smooth = false, position = {TempX, -2, -61}, rotation = {0, 180, 0}}
                    )
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
        for T = 1, #TemplateList do
            local Template = getObjectFromGUID(TemplateList[T])
            printToAll("Updating " .. Template.getName() .. "...")
            --go through all objects and look for those to replace...
            for O, Obj in pairs(ObjectList) do
                if
                    Template.getName() == Obj.getName() and
                        (Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset")
                 then
                    local NewObj = Template.clone({position = Obj.getPosition()})
                    NewObj.setLock(false)
                    NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                    Obj.destruct()
                end
            end

            ComponentsBag.putObject(Template)
            coroutine.yield(0)
        end

        --Factions...
        coroutine.yield(0)
        TemplateList = {}
        TempX = 80
        --get out faction templates...
        for I, Item in pairs(ComponentsBag.getObjects()) do
            if Item.name ~= "Nazgûl" and (string.find(Item.description, "Faction;") ~= nil) then
                --correct state?
                if
                    (Factions == "2D" and string.find(Item.description, "2D;") ~= nil) or
                        (Factions == "3D" and string.find(Item.description, "3D;") ~= nil) or
                        (Factions == "Round" and string.find(Item.description, "Marble;") ~= nil)
                 then
                    TempX = TempX - 1
                    local TempObj =
                        ComponentsBag.takeObject(
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
            for O, Obj in pairs(ObjectList) do
                if
                    Template.getName() == Obj.getName() and
                        (Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset")
                 then
                    local NewObj = Template.clone({position = Obj.getPosition()})
                    NewObj.setLock(false)
                    NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                    Obj.destruct()
                end
            end

            ComponentsBag.putObject(Template)
            coroutine.yield(0)
        end

        --Nazgul...
        coroutine.yield(0)
        TemplateList = {}
        TempX = 80
        --get out nazgul templates...
        for I, Item in pairs(ComponentsBag.getObjects()) do
            if Item.name == "Nazgûl" and (string.find(Item.description, "Leader;") ~= nil) then
                --correct state?
                if
                    (Nazgul == "2D" and string.find(Item.description, "2D;") ~= nil) or
                        (Nazgul == "3D" and string.find(Item.description, "3D;") ~= nil) or
                        (Nazgul == "Square" and string.find(Item.description, "Square;") ~= nil) or
                        (Nazgul == "Round" and string.find(Item.description, "Round;") ~= nil)
                 then
                    TempX = TempX - 1
                    local TempObj =
                        ComponentsBag.takeObject(
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
            for O, Obj in pairs(ObjectList) do
                if
                    Template.getName() == Obj.getName() and Template.getDescription() ~= Obj.getDescription() and
                        (Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset")
                 then
                    local NewObj = Template.clone({position = Obj.getPosition()})
                    NewObj.setLock(false)
                    NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
                    Obj.destruct()
                end
            end
            ComponentsBag.putObject(Template)
            coroutine.yield(0)
        end

        coroutine.yield(0)
        --go through all objects...
        --change in groups of this number for speed.
        local Group = 10
        --store and move them all together after settlements have moved...
        local MarkerList = {}
        local NewObj = nil
        for O, Obj in pairs(ObjectList) do
            if
                string.find(Obj.getDescription(), "Faction;") == nil and
                    string.find(Obj.getDescription(), "Character;") == nil and
                    string.find(Obj.getDescription(), "Minion;") == nil and
                    string.find(Obj.getDescription(), "Regular;") == nil and
                    string.find(Obj.getDescription(), "Elite;") == nil and
                    string.find(Obj.getDescription(), "Leader;") == nil and
                    string.find(Obj.getDescription(), "Minion;") == nil
             then
                if Obj.type == "Tile" and string.find(Obj.getDescription(), "Stronghold;") ~= nil and Obj.getLock() then
                    Obj.setRotationSmooth({0, 180, 0}, false, false)
                    if Settlements == "3D" then
                        Obj.setPosition({Obj.getPosition().x, 1.16, Obj.getPosition().z})
                        for SO, SubObj in pairs(
                            Physics.cast(
                                {
                                    origin = Obj.getPosition(),
                                    direction = {0, 1, 0},
                                    type = 3,
                                    size = {1.8, 1, 1.8},
                                    orientation = {0, 0, 0},
                                    max_distance = 0,
                                    debug = true
                                }
                            )
                        ) do
                            if SubObj.hit_object.getLock() == false then
                                SubObj.hit_object.translate({0, 1, 0})
                            end
                        end
                    else
                        Obj.setPositionSmooth({Obj.getPosition().x, 0.78, Obj.getPosition().z}, false, false)
                    end

                    coroutine.yield(0)
                elseif Obj.type == "Tile" and string.find(Obj.getDescription(), "City;") ~= nil and Obj.getLock() then
                    Obj.setRotationSmooth({0, 180, 0}, false, false)
                    if Settlements == "3D" then
                        Obj.setPosition({Obj.getPosition().x, 1.09, Obj.getPosition().z})
                        for SO, SubObj in pairs(
                            Physics.cast(
                                {
                                    origin = Obj.getPosition(),
                                    direction = {0, 1, 0},
                                    type = 3,
                                    size = {1.8, 1, 1.1},
                                    orientation = {0, 0, 0},
                                    max_distance = 0,
                                    debug = true
                                }
                            )
                        ) do
                            if SubObj.hit_object.getLock() == false then
                                SubObj.hit_object.translate({0, 1, 0})
                            end
                        end
                    else
                        Obj.setPositionSmooth({Obj.getPosition().x, 0.85, Obj.getPosition().z}, false, false)
                    end

                    coroutine.yield(0)
                elseif Obj.type == "Tile" and Obj.getName() == "Fortification" then
                    Obj.setRotationSmooth({0, 180, 0}, false, false)
                    if Settlements == "3D" then
                        Obj.setPosition({Obj.getPosition().x, 1.01, Obj.getPosition().z})
                        for SO, SubObj in pairs(
                            Physics.cast(
                                {
                                    origin = Obj.getPosition(),
                                    direction = {0, 1, 0},
                                    type = 3,
                                    size = {1.8, 1, 1.1},
                                    orientation = {0, 0, 0},
                                    max_distance = 0,
                                    debug = true
                                }
                            )
                        ) do
                            if SubObj.hit_object.getLock() == false then
                                SubObj.hit_object.translate({0, 1, 0})
                            end
                        end
                    else
                        Obj.setPositionSmooth({Obj.getPosition().x, 0.93, Obj.getPosition().z}, false, false)
                    end

                    coroutine.yield(0)
                elseif Obj.type == "Dice" and string.find(Obj.getDescription(), "Combat;") == nil then
                    local NewObj = nil
                    --need to swap?
                    if
                        (Dice == "Anniversary" and string.find(Obj.getDescription(), "Anniversary;") == nil) or
                            (Dice ~= "Anniversary" and string.find(Obj.getDescription(), "Anniversary;") ~= nil)
                     then
                        --look in dice bag for replacement...
                        for I, Item in pairs(ComponentsBag.getObjects()) do
                            --match? same description (except anniversary tag) and either anniversary or not anniversary...
                            if
                                string.gsub(Obj.getDescription(), "Anniversary;", "") ==
                                    string.gsub(Item.description, "Anniversary;", "") and 
                                    ((Dice == "Anniversary" and string.find(Item.description, "Anniversary;") ~= nil) or
                                    (Dice ~= "Anniversary" and string.find(Item.description, "Anniversary;") == nil))
                             then
                                NewObj = 
                                    ComponentsBag.takeObject(
                                    {
                                        guid = Item.guid,
                                        position = Obj.getPosition(),
                                        rotation = Obj.getRotation(),
                                        smooth = true
                                    }
                                )
                                coroutine.yield(0)
                                Global.call("SetDiceFace", {Dice = NewObj, Value = Obj.getRotationValue()})
                                if NewObj ~= nil then
                                    getObjectFromGUID("0e5fd1").putObject(Obj)
                                    coroutine.yield(0)
                                    local IDs = getObjectFromGUID("6158a0").getTable("IDs")
                                    if
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;1of10;"
                                     then
                                        IDs.ShadowActionDice[1] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;2of10;"
                                     then
                                        IDs.ShadowActionDice[2] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;3of10;"
                                     then
                                        IDs.ShadowActionDice[3] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;4of10;"
                                     then
                                        IDs.ShadowActionDice[4] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;5of10;"
                                     then
                                        IDs.ShadowActionDice[5] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;6of10;"
                                     then
                                        IDs.ShadowActionDice[6] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;7of10;"
                                     then
                                        IDs.ShadowActionDice[7] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;8of10;"
                                     then
                                        IDs.ShadowActionDice[8] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;9of10;"
                                     then
                                        IDs.ShadowActionDice[9] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;Shadow;10of10;"
                                     then
                                        IDs.ShadowActionDice[10] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;1of6;"
                                     then
                                        IDs.FreePeoplesActionDice[1] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;2of6;"
                                     then
                                        IDs.FreePeoplesActionDice[2] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;3of6;"
                                     then
                                        IDs.FreePeoplesActionDice[3] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;4of6;"
                                     then
                                        IDs.FreePeoplesActionDice[4] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;5of6;"
                                     then
                                        IDs.FreePeoplesActionDice[5] = NewObj.getGUID()
                                    elseif
                                        string.gsub(NewObj.getDescription(), "Anniversary;", "") ==
                                            "Dice;Action;FreePeoples;6of6;"
                                     then
                                        IDs.FreePeoplesActionDice[6] = NewObj.getGUID()
                                    end

                                    getObjectFromGUID("6158a0").setTable("IDs", IDs)
                                    break
                                end
                            end
                        end
                    end
                end

                Group = Group - 1
                if Group < 0 then
                    coroutine.yield(0)
                    Group = 10
                end
            end
        end
        coroutine.yield(0)
        --3d Mountains...
        if Mountains == "Flat" then
            if getObjectFromGUID("7aaf2c") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("7aaf2c"))
            end

            if getObjectFromGUID("7a1251") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("7a1251"))
            end

            if getObjectFromGUID("0afd38") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("0afd38"))
            end

            if getObjectFromGUID("f0c8c7") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("f0c8c7"))
            end

            if getObjectFromGUID("d263d6") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("d263d6"))
            end

            if getObjectFromGUID("f9b806") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("f9b806"))
            end

            if getObjectFromGUID("f57090") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("f57090"))
            end

            if getObjectFromGUID("ac38bf") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("ac38bf"))
            end

            if getObjectFromGUID("4d1cda") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("4d1cda"))
            end

            if getObjectFromGUID("a50a62") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("a50a62"))
            end

            if getObjectFromGUID("2943f2") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("2943f2"))
            end

            if getObjectFromGUID("0e6df7") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("0e6df7"))
            end

            if getObjectFromGUID("0869e7") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("0869e7"))
            end

            if getObjectFromGUID("bc29d9") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("bc29d9"))
            end
        else
            if getObjectFromGUID("7aaf2c") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "7aaf2c", position = {-21.07, 0.95, 8.25}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("7aaf2c").setLock(true)
            end

            if getObjectFromGUID("7a1251") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "7a1251", position = {-21.44, 0.95, 18.36}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("7a1251").setLock(true)
            end

            if getObjectFromGUID("0afd38") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "0afd38", position = {5.09, 0.95, 21.30}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("0afd38").setLock(true)
            end

            if getObjectFromGUID("f0c8c7") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "f0c8c7", position = {-0.23, 0.95, 18.21}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("f0c8c7").setLock(true)
            end

            if getObjectFromGUID("d263d6") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "d263d6", position = {2.14, 0.93, 13.14}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("d263d6").setLock(true)
            end

            if getObjectFromGUID("f9b806") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "f9b806", position = {-0.64, 0.96, 4.28}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("f9b806").setLock(true)
            end

            if getObjectFromGUID("f57090") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "f57090", position = {2.90, 0.95, -9.40}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("f57090").setLock(true)
            end

            if getObjectFromGUID("ac38bf") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "ac38bf", position = {27.50, 0.96, -5.26}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("ac38bf").setLock(true)
            end

            if getObjectFromGUID("4d1cda") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "4d1cda", position = {19.46, 0.96, -5.56}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("4d1cda").setLock(true)
            end

            if getObjectFromGUID("a50a62") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "a50a62", position = {21.86, 0.95, -14.34}, rotation = {0, 180, 0}}
                )
                getObjectFromGUID("a50a62").setLock(true)
            end

            if getObjectFromGUID("2943f2") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "2943f2", position = {26.96, 0.95, -15.47}, rotation = {0, 135, 0}}
                )
                getObjectFromGUID("2943f2").setLock(true)
            end

            if getObjectFromGUID("0e6df7") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "0e6df7", position = {29.56, 0.95, -14.98}, rotation = {0, 135, 0}}
                )
                getObjectFromGUID("0e6df7").setLock(true)
            end

            if getObjectFromGUID("0869e7") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "0869e7", position = {32.22, 0.95, -14.71}, rotation = {0, 150, 0}}
                )
                getObjectFromGUID("0869e7").setLock(true)
            end

            if getObjectFromGUID("bc29d9") == nil then
                getObjectFromGUID("416864").takeObject(
                    {smooth = false, guid = "bc29d9", position = {34.88, 0.95, -14.84}, rotation = {0, 150, 0}}
                )
                getObjectFromGUID("bc29d9").setLock(true)
            end
        end

        coroutine.yield(0)
        --Mt Doom...
        if MtDoom == "Flat" then
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

        Global.call("InitComponents")
        RecordPreferences()
        coroutine.yield(0)
        Apply = false
        printToAll("Changes to Preferences Completed.")
        MainMenu()
        return 1
    end

    startLuaCoroutine(self, "ApplyPreferencesCoroutine")
end

function RecordPreferences()
    --record settings...
    Global.setVar("RulesWarnings", Warnings == "On")
    local Notes = "Scale:" .. FigureScale .. ";"
    Notes = Notes .. "Characters:" .. Characters .. ";"
    Notes = Notes .. "Nazgul:" .. Nazgul .. ";"
    Notes = Notes .. "Armies:" .. Armies .. ";"
    Notes = Notes .. "Factions:" .. Factions .. ";"
    if ModelLock then
        Notes = Notes .. "ModelLock:1;"
    end
    -- if models locked.
    Notes = Notes .. "Mountains:" .. Mountains .. ";"
    Notes = Notes .. "MtDoom:" .. MtDoom .. ";"
    Notes = Notes .. "Settlements:" .. Settlements .. ";"
    if Sound then
        Notes = Notes .. "Sound:On;"
    else
        Notes = Notes .. "Sound:Off;"
    end

    Notes = Notes .. "Scream:" .. Scream .. ";"
    Notes = Notes .. "Warnings:" .. Warnings .. ";"
    Notes = Notes .. "Dice:" .. Dice .. ";"
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
    for O, Obj in pairs(getAllObjects()) do
        if
            (Obj.type == "Figurine" or Obj.type == "rpgFigurine" or Obj.type == "Tileset") and
                (string.find(Obj.getDescription(), "Character;") ~= nil or
                    string.find(Obj.getDescription(), "Minion;") ~= nil or
                    string.find(Obj.getDescription(), "Faction;") ~= nil or
                    string.find(Obj.getDescription(), "Regular;") ~= nil or
                    string.find(Obj.getDescription(), "Elite;") ~= nil or
                    string.find(Obj.getDescription(), "Leader;") ~= nil)
         then
            Obj.setScale({Obj.getScale().x * ScaleMult, Obj.getScale().y * ScaleMult, Obj.getScale().z * ScaleMult})
        end
    end
    --for
    coroutine.yield(0)
    print("FigureScale:", string.format("%.0f", FigureScale))
    Global.call("UpdateTag", {Text = self.getGMNotes(), Tag = "Scale", Value = string.format("%.0f", FigureScale)})
    MainMenu()
    return 1
end