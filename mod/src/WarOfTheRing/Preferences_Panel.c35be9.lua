local Settings = {
    FigureScale = "100",
    CharactersType = "3D",
    NazgulsType = "3D",
    ArmiesType = "3D",
    FactionsType = "3D",
    MountDoomType = "3D",
    SettlementsType = "3D",
    DiceType = "Original"
}

local ArmiesSearchConfig = {
    IncludingName = nil,
    ExcludingName = "Nazgûl",
    Patterns = {"Regular;", "Elite;", "Leader;"},
    PositionOffset = 0
}

local CharactersSearchConfig = {
    IncludingName = nil,
    ExcludingName = "Nazgûl",
    Patterns = {"Character;", "Minion;"},
    PositionOffset = 1
}

local FactionsSearchConfig = {
    IncludingName = nil,
    ExcludingName = "Nazgûl",
    Patterns = {"Faction;"},
    PositionOffset = 2
}

local NazgulSearchConfig = {
    IncludingName = "Nazgûl",
    ExcludingName = nil,
    Patterns = {"Leader;"},
    PositionOffset = 3
}

local SettlementsConfigs = {
    Stronghold = {PositionY_3D = 1.16, PositionY_Flat = 0.78, Size = {1.8, 1, 1.8}},
    City = {PositionY_3D = 1.09, PositionY_Flat = 0.85, Size = {1.8, 1, 1.1}},
    Fortification = {PositionY_3D = 1.01, PositionY_Flat = 0.93, Size = {1.8, 1, 1.1}}
}

function onLoad(save_state)
    InitPreferences()
end

function InitPreferences()
    Settings.FigureScale = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Scale", Default = "100"})
    Settings.CharactersType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Characters", Default = "3D"})
    Settings.NazgulsType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Nazgul", Default = "3D"})
    Settings.ArmiesType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Armies", Default = "3D"})
    Settings.FactionsType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Factions", Default = "3D"})
    Settings.MountDoomType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "MtDoom", Default = "3D"})
    Settings.SettlementsType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Settlements", Default = "3D"})
    Settings.DiceType = Global.call("ReadTag", {Text = self.getGMNotes(), Var = "Dice", Default = "Original"})

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
    UpdatePanel()
end

function UpdatePanel()
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
    if Settings.CharactersType == "2D" then
        Characters2DColor = {1, 1, 0}
    elseif Settings.CharactersType == "Square" then
        CharactersSquareColor = {1, 1, 0}
    else
        Characters3DColor = {1, 1, 0}
    end

    if Settings.NazgulsType == "2D" then
        Nazgul2DColor = {1, 1, 0}
    elseif Settings.NazgulsType == "Round" then
        NazgulRoundColor = {1, 1, 0}
    elseif Settings.NazgulsType == "Square" then
        NazgulSquareColor = {1, 1, 0}
    else
        Nazgul3DColor = {1, 1, 0}
    end

    if Settings.ArmiesType == "2D" then
        Armies2DColor = {1, 1, 0}
    elseif Settings.ArmiesType == "Round" then
        ArmiesRoundColor = {1, 1, 0}
    else
        Armies3DColor = {1, 1, 0}
    end

    if Settings.FactionsType == "2D" then
        Factions2DColor = {1, 1, 0}
    elseif Settings.FactionsType == "Round" then
        FactionsRoundColor = {1, 1, 0}
    else
        Factions3DColor = {1, 1, 0}
    end

    if Settings.MountDoomType == "3D" then
        MtDoom3DColor = {1, 1, 0}
    else
        MtDoomFlatColor = {1, 1, 0}
    end

    if Settings.SettlementsType == "3D" then
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

    if Settings.DiceType == "Anniversary" then
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
            label = Settings.FigureScale .. "%",
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
    Settings.FigureScale = Settings.FigureScale + 5
    startLuaCoroutine(self, "ChangeFigureScaleCoroutine")
end

function FigureScaleDown()
    Settings.FigureScale = Settings.FigureScale - 5
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
        Settings.CharactersType = "3D"
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

        UpdatePanel()
    end

    startLuaCoroutine(self, "Characters3DCoroutine")
end

function Characters3D()
    Settings.CharactersType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Characters2D()
    Settings.CharactersType = "2D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function CharactersSquare()
    Settings.CharactersType = "Square"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Nazgul3D()
    Settings.NazgulsType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Nazgul2D()
    Settings.NazgulsType = "2D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function NazgulRound()
    Settings.NazgulsType = "Round"
    ApplySettingsFlag = true
    UpdatePanel()
end

function NazgulSquare()
    Settings.NazgulsType = "Square"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Armies3D()
    Settings.ArmiesType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Armies2D()
    Settings.ArmiesType = "2D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function ArmiesRound()
    Settings.ArmiesType = "Round"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Factions3D()
    Settings.FactionsType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Factions2D()
    Settings.FactionsType = "2D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function FactionsRound()
    Settings.FactionsType = "Round"
    ApplySettingsFlag = true
    UpdatePanel()
end

function MtDoom3D()
    Settings.MountDoomType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function MtDoomFlat()
    Settings.MountDoomType = "Flat"
    ApplySettingsFlag = true
    UpdatePanel()
end

function Settlements3D()
    Settings.SettlementsType = "3D"
    ApplySettingsFlag = true
    UpdatePanel()
end

function SettlementsFlat()
    Settings.SettlementsType = "Flat"
    ApplySettingsFlag = true
    UpdatePanel()
end

function SoundEffectsOn()
    Sound = "On"
    ApplySettingsFlag = true
    UpdatePanel()
end

function SoundEffectsOff()
    Sound = "Off"
    ApplySettingsFlag = true
    UpdatePanel()
end

function ScreamAlways()
    ScreamSettingType = "Always"
    ApplySettingsFlag = true
    UpdatePanel()
end

function ScreamOnce()
    ScreamSettingType = "Once"
    ApplySettingsFlag = true
    UpdatePanel()
end

function ScreamNever()
    ScreamSettingType = "Never"
    ApplySettingsFlag = true
    UpdatePanel()
end

function WarningsOn()
    WarningsSettingType = "On"
    ApplySettingsFlag = true
    UpdatePanel()
end

function WarningsOff()
    WarningsSettingType = "Off"
    ApplySettingsFlag = true
    UpdatePanel()
end

function DiceOriginal()
    Settings.DiceType = "Original"
    ApplySettingsFlag = true
    UpdatePanel()
end

function DiceAnniversary()
    Settings.DiceType = "Anniversary"
    ApplySettingsFlag = true
    UpdatePanel()
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
        UpdateCharacters(ComponentBag, AllObjects)
        UpdateFactions(ComponentBag, AllObjects)
        UpdateNazguls(ComponentBag, AllObjects)

        UpdateSettlements(AllObjects)
        UpdateDices(AllObjects)

        coroutine.yield(0)
        UpdateMountDoom()

        Global.call("InitComponents")
        RecordPreferences()
        coroutine.yield(0)

        ApplySettingsFlag = false
        printToAll("Changes to Preferences Completed.")
        UpdatePanel()
        return 1
    end

    startLuaCoroutine(self, "ApplyPreferencesCoroutine")
end

function ReplaceObjects(ComponentBag, AllObjects, SearchConfig, SettingType)
    coroutine.yield(0)

    local TemplateList = GetObjectsFromComponentBag(ComponentBag, SearchConfig, SettingType)
    coroutine.yield(0)

    for I = 1, #TemplateList do
        local Template = getObjectFromGUID(TemplateList[I])
        printToAll("Updating " .. Template.getName() .. "...")

        --go through all objects and look for those to replace...
        for _, Obj in pairs(AllObjects) do
            local NewObj = nil

            if not ObjectIsFigurineOrTileset(Obj) then
                goto continue
            end

            if Template.getName() ~= Obj.getName() then
                goto continue
            end

            if Template.getDescription() == Obj.getDescription() then
                goto continue
            end

            NewObj = Template.clone({position = Obj.getPosition()})
            NewObj.setLock(false)
            NewObj.setPosition({Obj.getPosition().x, Obj.getPosition().y + 1, Obj.getPosition().z})
            Obj.destruct()

            ::continue::
        end

        ComponentBag.putObject(Template)
        coroutine.yield(0)
    end
end

function GetObjectsFromComponentBag(ComponentBag, SearchConfig, SettingType)
    local SearchList = {}
    local settingPattern = SettingType .. ";"

    for _, Item in pairs(ComponentBag.getObjects()) do
        if SearchConfig.ExcludingName ~= nil and Item.name == SearchConfig.ExcludingName then
            goto continue
        end

        if (SearchConfig.IncludingName ~= nil and SearchConfig.IncludingName) then
            goto continue
        end

        -- same type as setting
        if string.find(Item.description, settingPattern) == nil then
            goto continue
        end

        for _, Pattern in pairs(SearchConfig.Patterns) do
            if string.find(Item.description, Pattern) ~= nil then
                table.insert(SearchList, Item.guid)
                goto continue
            end
        end
        
        ::continue::
    end

    local OffsetX = 80
    local TemplateList = {}

    for _, Item in pairs(SearchList) do
        OffsetX = OffsetX - 1
        local TempObj = ComponentBag.takeObject({
            guid = Item.guid,
            smooth = false,
            position = {OffsetX, -2, -60},
            rotation = {0, 180, 0}
        })

        coroutine.yield(0)
        TempObj.setLock(true)
        local zPosition = -60 - SearchConfig.PositionOffset;
        TempObj.setPosition({OffsetX, -2, zPosition})
        TempObj.setRotation({0, 180, 0})
        table.insert(TemplateList, TempObj.getGUID())
    end

    return TemplateList
end

function UpdateArmies(ComponentBag, AllObjects)
    ReplaceObjects(ComponentBag, AllObjects, ArmiesSearchConfig, Settings.ArmiesType)
end

function UpdateCharacters(ComponentBag, AllObjects)
    ReplaceObjects(ComponentBag, AllObjects, CharactersSearchConfig, Settings.CharactersType)
end

function UpdateFactions(ComponentBag, AllObjects)
    ReplaceObjects(ComponentBag, AllObjects, FactionsSearchConfig, Settings.FactionsType)
end

function UpdateNazguls(ComponentBag, AllObjects)
    ReplaceObjects(ComponentBag, AllObjects, NazgulSearchConfig, Settings.NazgulsType)
end

function UpdateSettlements(AllObjects)
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

function UpdateDices(AllObjects)
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

function UpdateSettlementObject(Obj, Config)
    Obj.setRotationSmooth({0, 180, 0}, false, false)

    if Settings.SettlementsType == "3D" then
        Obj.setPosition({Obj.getPosition().x, Config.PositionY_3D, Obj.getPosition().z})

        local conflictedObjects =
            Physics.cast(
            {
                origin = Obj.getPosition(),
                direction = {0, 1, 0},
                type = 3,
                size = Config.Size,
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
        Obj.setPositionSmooth({Obj.getPosition().x, Config.PositionY_Flat, Obj.getPosition().z}, false, false)
    end
end

function TryUpdateDiceObject(OldDiceObj)
    if ObjectIsUnit(OldDiceObj) then
        return false
    end

    if OldDiceObj.type ~= "Dice" then
        return false
    end

    local description = OldDiceObj.getDescription()

    if string.find(description, "Combat;") ~= nil then
        return false
    end

    local newDiceObj = nil
    local isAnniversaryDiceObject = string.find(description, "Anniversary;") ~= nil
    local isAnniversarySetting = Settings.DiceType == "Anniversary"
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
                    position = OldDiceObj.getPosition(),
                    rotation = OldDiceObj.getRotation(),
                    smooth = true
                }
            )

            coroutine.yield(0)
            Global.call("SetDiceFace", {Dice = newDiceObj, Value = OldDiceObj.getRotationValue()})

            ComponentBag.putObject(OldDiceObj)
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
    if Settings.MountDoomType == "Flat" then
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
    Notes = Notes .. "Characters:" .. Settings.CharactersType .. ";"
    Notes = Notes .. "Nazgul:" .. Settings.NazgulsType .. ";"
    Notes = Notes .. "Armies:" .. Settings.ArmiesType .. ";"
    Notes = Notes .. "Factions:" .. Settings.FactionsType .. ";"
    if ModelLockSetting then
        Notes = Notes .. "ModelLock:1;"
    end
    -- if models locked.
    Notes = Notes .. "MtDoom:" .. Settings.MountDoomType .. ";"
    Notes = Notes .. "Settlements:" .. Settings.SettlementsType .. ";"
    if Sound then
        Notes = Notes .. "Sound:On;"
    else
        Notes = Notes .. "Sound:Off;"
    end

    Notes = Notes .. "Scream:" .. ScreamSettingType .. ";"
    Notes = Notes .. "Warnings:" .. WarningsSettingType .. ";"
    Notes = Notes .. "Dice:" .. Settings.DiceType .. ";"
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
            --Obj.setScale({Obj.getScale().x * ScaleMult, Obj.getScale().y * ScaleMult, Obj.getScale().z * ScaleMult})
        end
    end

    coroutine.yield(0)

    print("FigureScale:", string.format("%.0f", Settings.FigureScale))
    Global.call("UpdateTag", {Text = self.getGMNotes(), Tag = "Scale", Value = string.format("%.0f", Settings.FigureScale)})
    UpdatePanel()
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