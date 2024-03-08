require('!/UnitsController')

local Step = ""
local NextStep = ""
local Versus = "1v1" --1v1, 1v2, 2v2, FvP
local CompactMode = false
local GuideName = "Gandalf the Grey: The Grey Wanderer"
local FreePeoplesVP = 0
local ShadowVP = 0
local CorruptionTrack = 0
local FellowshipTrack = 0
local FreePeoplesHuntDiceCount = 0 --how many free peoples dice were retrieved from the hunt box from last turn.
local ShadowHuntDiceCount = 0
local Round = 0

--expansions
local LoME = false     --Lords of Middle-earth
local WoME = false     --warriors of middle-earth
local KoME = false     --kings of middle-earth
local TFoE = false     --the fate of erebor
local HftR = false     --hunt for the ring
local NewCities = true --the New Cities optional setup from The Fate of Erebor.
local BotF = false     -- the breaking of the fellowship.
local Treebeard = 2    --0:None,1:Original,2:Revised;
local FlagString = ""  --WoME;LoME;KoME;TFoE;BotF;HftR;Compact;

--Bags...
local GraveBagId = "416864"

local PlayersLeader = {
    FreePeoples = "Gondor",
    Shadow = "The Witch-king"
}

local CompanionNames = {
    "Gandalf the Grey: The Grey Wanderer",
    "Strider: Ranger of the North",
    "Legolas: Son of Thranduil",
    "Gimli: Son of Gloin",
    "Boromir: Son of Denethor",
    "Peregrin Took: Hobbit Companion",
    "Meriadoc Brandybuck: Hobbit Companion",
    "The Ring-bearers (Frodo & Samwise)"
}

local FellowshipCount = 8

local Companions = {
    Gandalf = { Title = "The Grey Wanderer", Fellowship = true },
    Strider = { Title = "Ranger of the North", Fellowship = true },
    Legolas = { Title = "Son of Thranduil", Fellowship = true },
    Gimli = { Title = "Son of Gloin", Fellowship = true },
    Boromir = { Title = "Son of Denethor", Fellowship = true },
    Peregrin = { Title = "Hobbit Companion", Fellowship = true },
    Meriadoc = { Title = "Hobbit Companion", Fellowship = true },
    Gollum = { Title = "", Fellowship = false },
    TheRingBearers = { Title = "Frodo & Samwise", Fellowship = true }
}

local ShadowDicePool = {}              --pool of dice rolled
local FreePeoplesDicePool = {}         --pool of dice rolled
local HuntBoxShadowDiceArray = {}      --table of dice ids
local HuntBoxFreePeoplesDiceArray = {} --table of dice ids

IDs = {
    ShadowActionDice = {
        "1bddf0",
        "3e9530",
        "4298d8",
        "a42fec",
        "067ee6",
        "9eb93b",
        "72c888",
        "2def24",
        "245f9e",
        "e7e08d"
    },
    FreePeoplesActionDice = { "e204e9", "008051", "5251fb", "0527bf", "9d66fb", "6b32fb" },
    ShadowFactionDice = "20aa4b",
    FreePeoplesFactionDice = "c3d1a5",
    GothmogDice = "89655f",
    BalrogDice = "b9eda6",
    NaryaDice = "84a4e1",
    NenyaDice = "d24b63",
    VilyaDice = "8bf519",
    ShadowRulerDice = "829a12",
    FreePeoplesRulerDice = "e506d1",
    ShadowDiceBox = "9a56a5",
    FreePeoplesDiceBox = "46d2fc",
    ShadowUsedDiceArea = "9a38bc",
    FreePeoplesUsedDiceArea = "028249",
    FreePeoplesEventDiscardSpot = "b18c8a",
    ShadowEventDiscardSpot = "61c02b",
    Companions = {
        GandalfTheWhite = "0166c2",
        GandalfTheWhiteToken = "94dee9",
        Aragorn = "973bc1",
        AragornToken = "826dfe",
        LadyGaladriel = "0cda50",
        LordElrond = "acd1a0a",
        GandalfTheGrey = "b9d5ca",
        Strider = "4bade2",
        Boromir = "8293ac",
        Legolas = "e07644",
        Gimli = "42db59",
        Meriadoc = "aee334",
        Peregrin = "4762f6",
        TheRingBearers = "e76bc8",
        Gollum = "0df4d4",
        Smeagol = "38461c",
        SmeagolToken = "8b8cf6",
        TreeBeard = "5e36c8",
        Brand = "3d983d",
        Dain = "554922",
        Denethor = "79b781",
        Theoden = "51d8e0",
        Thranduil = "b6ec8b"
    },
    Minions = {
        Saruman = "61bc09",
        TheWitchKing = "762b45",
        TheMouthOfSauron = "97771d",
        TheWitchKingCotR = "665eef",
        TheMouthOfSauronBN = "fc376c",
        TheBalrog = "2c3907",
        Gothmog = "98f596",
        TheBlackSerpent = "c4c009",
        Ugluk = "63d531",
        TheShadowOfMirkwood = "fc67e9"
    },
    Cards = {
        RingBearers = "a456d0"
    },
    --cards
    CompanionCards = { "d760ee", "6098c7", "a0deb9", "78f279", "02f2cc", "fcbc2d", "dd1dde", "a456d0" },
    ElvenRings = { "a37c58", "d67bac", "1cc52c" },
    FreePeoplesCharacterEventDeck = "ba06c3",
    FreePeoplesStrategyEventDeck = "240819",
    ShadowCharacterEventDeck = "8c377e",
    ShadowStrategyEventDeck = "6508fd",
    BalrogOfMoriaCard = "c6b2ab",
    ThereAndBackAgain = "5451db",
    BookOfMazarbul = "fe4ed6",
    DainIronfootsGuard = "7b2a9c",
    KingBrandsMen = "8ce893",
    OrcsMultiplyingAgain = "c55c62",
    MonstersRoused = "e3deb5",
    HuntTileBag = "002387",
    CompanionBag = "043c9c",
    FreePeoplesLeaderToken = "74461e",
    ShadowLeaderToken = "a25766",
    LoME = {
        ElvenRings = { "5e79a3", "08d651", "359ca2" },
        FreePeoplesStrategyEventCards = "f8df2d",
        FreePeoplesCharacterEventCards = "846b48",
        ShadowStrategyEventCards = "b83789",
        ShadowCharacterEventCards = "35ef06",
        SmeagolTiles = { "2d25c5", "07eee5", "7bb73b", "2fff89" },
        ShadowToken1 = "d8b25b", --Move Nazgul and Minions
        ShadowToken2 = "55ee6d"  --Advance a Shadow Nation on the Political Track
    },
    WoME = {
        FreePeoplesFactionDeck = "6897dc",
        ShadowFactionDeck = "f8a472",
        FreePeoplesCallToBattleDeck = "d9956f",
        ShadowCallToBattleDeck = "501b50",
        FreePeoplesEventCards = "cd7757",
        ShadowEventCards = "8abdc7",
        NotOnAnybodysSideCard = "a9fc55",
        DeadMenFactionCard = "43848f",
        EntsFactionCard = "114a7d",
        EaglesFactionCard = "a02da5",
        SpidersFactionCard = "a2b0b2",
        CorsairsFactionCard = "c877f9",
        DunlendingsFactionCard = "de70d2",
        FreePeoplesFactionDiscardSpot = "2d4c4f",
        ShadowEventFactionSpot = "bbab30",
        FreePeoplesCallToBattleSpot = "9fca62",
        ShadowCallToBattleSpot = "9e8059"
    },
    KoME = {
        RulerTokens = { Brand = "754777", Dain = "554922", Denethor = "f6198a", Theoden = "19e479", Thranduil = "518ae6" }
    },
    --KoME
    TFoE = {
        FreePeoplesStrategyEventCards = "4cd7e7",
        FreePeoplesCharacterEventCards = "54d1ce",
        ShadowStrategyEventCards = "a3e82e"
    },
    HftR = {
        ShadowToken1 = "e121d4",      --Advance a Shadow Nation on the Political Track
        ShadowToken2 = "124e70",      --Move Nazgul and Minions
        FreePeoplesToken1 = "7b62e4", --Advance a Shadow Nation on the Political Track
        FreePeoplesToken2 = "e233d5"  --draw event card
    }
}

local Spots = {
    GamePanel = {
        All = { Position = { 54, 13, 0 }, Rotation = { 90, 270, 0 }, Scale = { 7, 1, 7 } },
        FreePeoples = { Position = { 0, 12, 25 }, Rotation = { 90, 0, 0 }, Scale = { 5, 1, 5 } },
        Shadow = { Position = { 0, 12, -25 }, Rotation = { 90, 0, 180 }, Scale = { 5, 1, 5 } },
        Gondor = { Position = { -14, 12, 25 }, Rotation = { 90, 0, 0 }, Scale = { 5, 1, 5 } },
        Rohan = { Position = { 14, 12, 25 }, Rotation = { 90, 0, 0 }, Scale = { 5, 1, 5 } },
        TheWitchKing = { Position = { 14, 12, -25 }, Rotation = { 90, 0, 180 }, Scale = { 5, 1, 5 } },
        Saruman = { Position = { -14, 12, -25 }, Rotation = { 90, 0, 180 }, Scale = { 5, 1, 5 } }
    },
    ElvenRings = { { -17.2, 1.01, 23.50 }, { -19.00, 1.01, 23.50 }, { -20.4, 1.01, 23.50 } },
    FreePeoplesCharacterEventDeck = { -34.00, 1.11, 20.5 },
    ShadowCharacterEventDeck = { 27.95, 1.11, -20.3 },
    FreePeoplesStrategyEventDeck = { -28.35, 1.11, 20.5 },
    ShadowStrategyEventDeck = { 33.45, 1.11, -20.3 },
    FreePeoplesFactionDeck = { -40.65, 1.09, 20.5 },
    ShadowFactionDeck = { 40.10, 1.09, -20.3 },
    LeadingPlayerGondor = { -18, 1.01, 65.6 },
    LeadingPlayerRohan = { 31.5, 1.01, 65.6 },
    LeadingPlayerWitchKing = { 17.5, 1.01, -65.6 },
    ShadowDiceBox = {
        { -52,   1.78, -28.5 },
        { -49.5, 1.78, -28.5 },
        { -47,   1.78, -28.5 },
        { -52,   1.78, -31 },
        { -49.5, 1.78, -31 },
        { -47,   1.78, -31 },
        { -52,   1.78, -33.5 },
        { -49.5, 1.78, -33.5 },
        { -47,   1.78, -33.5 },
        { -52.5, 1.78, -35.5 },
        { -50.5, 1.78, -35.5 },
        { -48.5, 1.78, -35.55 },
        { -46.5, 1.78, -35.5 }
    },
    FreePeoplesDiceBox = {
        { -52,   1.78, 28.5 },
        { -49.5, 1.78, 28.5 },
        { -47,   1.78, 28.5 },
        { -52,   1.78, 31 },
        { -49.5, 1.78, 31 },
        { -47,   1.78, 31 },
        { -52,   1.78, 33.5 },
        { -49.5, 1.78, 33.5 },
        { -47,   1.78, 33.5 },
        { -49.5, 1.78, 32.75 },
        { -47.5, 1.78, 35.75 }
    },
    ShadowDiceOut = {
        { -51.5, 3, -41.75 },
        { -49.5, 3, -41.75 },
        { -47.5, 3, -41.75 },
        { -51.5, 3, -43.75 },
        { -49.5, 3, -43.75 },
        { -47.5, 3, -43.75 },
        { -51.5, 3, -45.75 },
        { -49.5, 3, -45.75 },
        { -47.5, 3, -45.75 },
        { -51.5, 3, -47.75 },
        { -49.5, 3, -47.75 },
        { -47.5, 3, -47.75 },
        { -51.5, 3, -49.75 }
    },
    FreePeoplesDiceOut = {
        { -51.5, 3, 41.75 },
        { -49.5, 3, 41.75 },
        { -47.5, 3, 41.75 },
        { -51.5, 3, 43.75 },
        { -49.5, 3, 43.75 },
        { -47.5, 3, 43.75 },
        { -51.5, 3, 45.75 },
        { -49.5, 3, 45.75 },
        { -47.5, 3, 45.75 },
        { -51.5, 3, 47.75 },
        { -49.5, 3, 47.75 },
        { -47.5, 3, 47.75 },
        { -51.5, 3, 49.75 }
    },
    ShadowHuntBoxDice = {
        { -30.8,  3, -18.3 },
        { -29.45, 3, -18.3 },
        { -28.1,  3, -18.3 },
        { -30.8,  3, -19.7 },
        { -29.45, 3, -19.7 },
        { -28.1,  3, -19.7 },
        { -30.8,  3, -21.1 },
        { -29.45, 3, -21.1 },
        { -28.1,  3, -21.1 },
        { -30.8,  3, -22.5 },
        { -29.45, 3, -22.5 },
        { -28.1,  3, -22.5 },
        { -30.8,  3, -23.85 },
        { -29.45, 3, -23.85 },
        { -28.1,  3, -23.85 },
        { -32.15, 3, -23.85 }
    },
    FreePeoplesHuntBoxDice = {
        { -35.2, 3, -18.3 },
        { -33.8, 3, -18.3 },
        { -32.4, 3, -18.3 },
        { -35.2, 3, -19.7 },
        { -33.8, 3, -19.7 },
        { -32.4, 3, -19.7 },
        { -35.2, 3, -21.1 },
        { -33.8, 3, -21.1 },
        { -32.4, 3, -21.1 }
    },
    CompactFreePeoplesUsedDice = {
        { -7.5, 1.6, -30 },
        { -5,   1.6, -30 },
        { -2.5, 1.6, -30 },
        { -7.5, 1.6, -32 },
        { -5,   1.6, -32 },
        { -2.5, 1.6, -32 },
        { -7.5, 1.6, -34 },
        { -5,   1.6, -34 },
        { -2.5, 1.6, -34 },
        { -7.5, 1.6, -36 }
    },
    CompactFreePeoplesDiceLine = {
        { -9.5,  1.6, -25.6 },
        { -7.75, 1.6, -25.6 },
        { -6,    1.6, -25.6 },
        { -4.2,  1.6, -25.6 },
        { -2.5,  1.6, -25.6 },
        { -9.5,  1.6, -27.35 },
        { -7.75, 1.6, -27.35 },
        { -6,    1.6, -27.35 },
        { -4.25, 1.6, -27.35 },
        { -2.5,  1.6, -27.35 }
    },
    CompactShadowUsedDice = {
        { 1,   1.6, -30 },
        { 3.1, 1.6, -30 },
        { 5.2, 1.6, -30 },
        { 7.3, 1.6, -30 },
        { 1,   1.6, -32 },
        { 3.1, 1.6, -32 },
        { 5.2, 1.6, -32 },
        { 7.3, 1.6, -32 },
        { 1,   1.6, -34 },
        { 3.1, 1.6, -34 },
        { 5.2, 1.6, -34 },
        { 7.3, 1.6, -34 },
        { 7.3, 1.6, -36 }
    },
    CompactShadowDiceLine = {
        { 0.5,  1.6, -25.6 },
        { 2.25, 1.6, -25.6 },
        { 4,    1.6, -25.6 },
        { 5.75, 1.6, -25.6 },
        { 7.5,  1.6, -25.6 },
        { 9.25, 1.6, -25.6 },
        { 11,   1.6, -25.6 },
        { 0.5,  1.6, -27.35 },
        { 2.25, 1.6, -27.35 },
        { 4,    1.6, -27.35 },
        { 5.75, 1.6, -27.35 },
        { 7.5,  1.6, -27.35 },
        { 9.25, 1.6, -27.35 },
        { 11,   1.6, -27.35 }
    }
}

function onLoad()
    if Player.White.seated then
        Player.White.changeColor("Grey")
    end

    --detect round,Phase, and Step...
    Round = ReadTag({ Text = self.getDescription(), Var = "Round", Default = 0 })
    Phase = ReadTag({ Text = self.getDescription(), Var = "Phase", Default = 0 })
    Turn = ReadTag({ Text = self.getDescription(), Var = "Turn", Default = 0 })
    NextStep = ReadTag({ Text = self.getDescription(), Var = "Step", Default = "" })
    Mute = string.find(getObjectFromGUID(Global.getVar("SoundCubeID")).getDescription(), "Muted;") ~= nil

    --detect expansions...
    LoME = string.find(self.getDescription(), "LoME;") ~= nil
    WoME = string.find(self.getDescription(), "WoME;") ~= nil
    KoME = string.find(self.getDescription(), "KoME;") ~= nil
    TFoE = string.find(self.getDescription(), "TFoE;") ~= nil
    BotF = string.find(self.getDescription(), "BotF;") ~= nil
    HftR = string.find(self.getDescription(), "HftR;") ~= nil

    CompactMode = string.find(self.getDescription(), "Compact;") ~= nil
    FlagString = ""

    if LoME then
        FlagString = FlagString .. "LoME;"
    end

    if WoME then
        FlagString = FlagString .. "WoME;"
    end

    if KoME then
        FlagString = FlagString .. "KoME;"
    end

    if TFoE then
        FlagString = FlagString .. "TFoE;"
    end

    if BotF then
        FlagString = FlagString .. "BotF;"
    end

    if HftR then
        FlagString = FlagString .. "HftR;"
    end

    --udpate compactmode data...
    if CompactMode then
        print("Compact Mode: ON")
        local GlobalSpots = Global.getTable("Spots")
        GlobalSpots.CompanionCards.Separated = GlobalSpots.Compact.CompanionCards.Separated
        GlobalSpots.CompanionCards.Searched = GlobalSpots.Compact.CompanionCards.Searched
        Global.setTable("Spots", GlobalSpots)
        Spots.ShadowDiceBox = Spots.CompactShadowUsedDice
        Spots.FreePeoplesDiceBox = Spots.CompactFreePeoplesUsedDice
        FlagString = FlagString .. "Compact;"
    end

    Global.setVar("LoME", LoME)
    Global.setVar("WoME", WoME)
    Global.setVar("TFoE", TFoE)
    Global.setVar("KoME", KoME)
    Global.setVar("BotF", BotF)
    Global.setVar("HftR", HftR)
    Global.setVar("CompactMode", CompactMode)

    --initialize components...
    Global.call("UpdateIDs")
    startLuaCoroutine(self, "MainCoroutine")
end

function onPlayerChangeColor(PlayerColor)
    if Step == "BeginMenu" then
        Step = ""
    end
end

function MainCoroutine()
    repeat
        coroutine.yield(0)
        --is it time to process the next step?...
        if Step == "" then
            startLuaCoroutine(self, "ProcessNextStep")
        end
    until false
    return 1
end

function ProcessNextStep()
    coroutine.yield(0)
    log("ProcessNextStep:" .. NextStep)

    --debug
    Step = NextStep
    self.setDescription(
        "Panel;Round:" .. Round .. ";Phase:" .. Phase .. ";Turn:" .. Turn .. ";Step:" .. Step .. ";" .. FlagString
    )

    --assume new game setup...
    if Step == "" then
        NextStep = "BeginMenu"
        Step = ""
    elseif Step == "BeginMenu" then
        CreateBeginMenu()
    elseif Step == "PlayersMenu" then
        CreatePlayersMenu()
    elseif Step == "ExpansionMenu" then
        CreateExpansionMenu()
    elseif Step == "HuntForTheRingMenu" then
        CreateHuntForTheRingMenu()
    elseif Step == "TFoEMenu" then
        self.clearButtons()
        if TFoE then
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "The Fate of Erebor",
                    position = { 0, 0.1, -1.3 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 1, 1, 1 }
                }
            )
            if NewCities then
                self.createButton(
                    {
                        click_function = "ToggleNewCities",
                        function_owner = self,
                        label = "Included: New Cities",
                        position = { 0, 0.1, 0 },
                        width = 1400,
                        height = 100,
                        color = { 1, 1, 0 },
                        font_size = 100,
                        tooltip =
                        "Click to exclude.\nNew Cities is an optional setup in The Fate of Erebor, that changes the Towns of Ered Luin and South Rhun to Cities."
                    }
                )
            else
                self.createButton(
                    {
                        click_function = "ToggleNewCities",
                        function_owner = self,
                        label = "Excluded: New Cities",
                        position = { 0, 0.1, 0 },
                        width = 1400,
                        height = 100,
                        color = { 1, 1, 1 },
                        font_size = 100,
                        tooltip =
                        "Click to include.\nNew Cities is an optional setup in The Fate of Erebor, that changes the Towns of Ered Luin and South Rhun to Cities."
                    }
                )
            end

            self.createButton(
                {
                    click_function = "Continue",
                    function_owner = self,
                    label = "Continue",
                    position = { 0, 0.1, 1.3 },
                    width = 1800,
                    height = 200,
                    color = { 1, 1, 1 },
                    font_size = 100
                }
            )
            function ToggleNewCities()
                NewCities = not NewCities
                NextStep = "TFoEMenu"
                Step = ""
            end

            function Continue()
                self.clearButtons()
                if not TFoE then
                    NewCities = false
                end

                NextStep = "TreebeardMenu"
                Step = ""
            end
        else
            NextStep = "TreebeardMenu"
            Step = ""
        end
    elseif Step == "TreebeardMenu" then
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Choose Treebeard Content:",
                position = { 0, 0.1, -1.3 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 1 }
            }
        )
        if WoME then
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "(Warriors of Middle-Earth Treebeard)",
                    position = { 0, 0.1, -1 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            if Treebeard == 1 then --original WM...
                self.createButton(
                    {
                        click_function = "SelectTreebeard1",
                        function_owner = self,
                        label = "Selected: Original Treebeard",
                        position = { 0, 0.1, -0.6 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 80,
                        tooltip = "Select the Original Treebeard Character Card from Warriors of Middle-Earth."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard2",
                        function_owner = self,
                        label = "Revised Treebeard",
                        position = { 0, 0.1, -0.3 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip =
                        "Select the Revised Treebeard Character Card from Warriors of Middle-Earth.\n(adds Root and Branch! ability)."
                    }
                )
            elseif Treebeard == 2 then --revised WM...
                self.createButton(
                    {
                        click_function = "SelectTreebeard1",
                        function_owner = self,
                        label = "Original Treebeard",
                        position = { 0, 0.1, -0.6 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip = "Select the Original Treebeard Character Card from Warriors of Middle-Earth."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard2",
                        function_owner = self,
                        label = "Selected: Revised Treebeard",
                        position = { 0, 0.1, -0.3 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 80,
                        tooltip =
                        "Select the Revised Treebeard Character Card from Warriors of Middle-Earth.\n(adds Root and Branch! ability)."
                    }
                )
            end
        else --not WoME...
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "(Promotional Treebeard Card)",
                    position = { 0, 0.1, -1 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            if Treebeard == 0 then --no treebeard...
                self.createButton(
                    {
                        click_function = "SelectTreebeard0",
                        function_owner = self,
                        label = "Selected: No Treebeard",
                        position = { 0, 0.1, -0.6 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 80,
                        tooltip = "Do not include Treebeard Promotional Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard1",
                        function_owner = self,
                        label = "Original Treebeard",
                        position = { 0, 0.1, -0.3 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip = "Select the Original Promotional Treebeard Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard2",
                        function_owner = self,
                        label = "Revised Treebeard",
                        position = { 0, 0.1, 0 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip =
                        "Select the Revised Promotional Treebeard Character Card.\n(adds Root and Branch! ability)."
                    }
                )
            elseif Treebeard == 1 then --original Promo...
                self.createButton(
                    {
                        click_function = "SelectTreebeard0",
                        function_owner = self,
                        label = "No Treebeard",
                        position = { 0, 0.1, -0.6 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip = "Do not include Treebeard Promotional Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard1",
                        function_owner = self,
                        label = "Selected: Original Treebeard",
                        position = { 0, 0.1, -0.3 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 80,
                        tooltip = "Select the Original Promotional Treebeard Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard2",
                        function_owner = self,
                        label = "Revised Treebeard",
                        position = { 0, 0.1, 0 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip =
                        "Select the Revised Promotional Treebeard Character Card.\n(adds Root and Branch! ability)."
                    }
                )
            elseif Treebeard == 2 then --revised Promo...
                self.createButton(
                    {
                        click_function = "SelectTreebeard0",
                        function_owner = self,
                        label = "No Treebeard",
                        position = { 0, 0.1, -0.6 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip = "Do not include Treebeard Promotional Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard1",
                        function_owner = self,
                        label = "Original Treebeard",
                        position = { 0, 0.1, -0.3 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 80,
                        tooltip = "Select the Original Promotional Treebeard Character Card."
                    }
                )
                self.createButton(
                    {
                        click_function = "SelectTreebeard2",
                        function_owner = self,
                        label = "Selected: Revised Treebeard",
                        position = { 0, 0.1, 0 },
                        width = 1800,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 80,
                        tooltip =
                        "Select the Revised Promotional Treebeard Character Card.\n(adds Root and Branch! ability)."
                    }
                )
            end
        end

        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.3 },
                width = 1800,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100,
                tooltip = "Continue Setup with the currently selected Treebeard option."
            }
        )
        function SelectTreebeard0()
            Treebeard = 0
            NextStep = "TreebeardMenu"
            Step = ""
        end

        function SelectTreebeard1()
            Treebeard = 1
            NextStep = "TreebeardMenu"
            Step = ""
        end

        function SelectTreebeard2()
            Treebeard = 2
            NextStep = "TreebeardMenu"
            Step = ""
        end

        function Continue()
            self.clearButtons()
            if LoME then
                NextStep = "StartingGuideMenu"
            else
                NextStep = "SetupExpansions"
            end

            Step = ""
        end
    elseif Step == "StartingGuideMenu" then
        -- If breaking of the fellowship...
        if BotF then
            if LoME then
                printToAll(
                    "\nThe Breaking of the Fellowship skips the Council of Rivendell step from Lords of Middle-Earth.\n"
                )
            end

            CompanionNames[1] = "Gandalf the Grey: The Grey Wanderer"
            CompanionNames[2] = "Strider: Ranger of the North"
            NextStep = "SetupExpansions"
            Step = ""
        else
            MoveGamePanel("FreePeoples")
            --choose Gandalf or Strider as the fellowship guide...
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Free Peoples\nChoose Fellowship Guide:",
                    position = { 0, 0.1, -1.2 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 1, 1, 1 }
                }
            )
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Free Peoples\nare choosing the\nFellowship Guide...",
                    position = { 0, -0.1, -0 },
                    rotation = { 180, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 1, 1, 1 }
                }
            )
            if CompanionNames[1] == "Gandalf the Grey: The Grey Wanderer" then
                self.createButton(
                    {
                        click_function = "ChooseTheGreyWanderer",
                        function_owner = self,
                        label = "Gandalf the Grey: The Grey Wanderer",
                        position = { 0, 0.1, -0.6 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseKeeperOfNarya",
                        function_owner = self,
                        label = "Gandalf the Grey: Keeper of Narya*",
                        position = { 0, 0.1, -0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseRangerOfTheNorth",
                        function_owner = self,
                        label = "Strider: Ranger of the North",
                        position = { 0, 0.1, 0 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseDunadan",
                        function_owner = self,
                        label = "Strider: Dunadan*",
                        position = { 0, 0.1, 0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
            elseif CompanionNames[1] == "Gandalf the Grey: Keeper of Narya*" then
                self.createButton(
                    {
                        click_function = "ChooseTheGreyWanderer",
                        function_owner = self,
                        label = "Gandalf the Grey: The Grey Wanderer",
                        position = { 0, 0.1, -0.6 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseKeeperOfNarya",
                        function_owner = self,
                        label = "Gandalf the Grey: Keeper of Narya*",
                        position = { 0, 0.1, -0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseRangerOfTheNorth",
                        function_owner = self,
                        label = "Strider: Ranger of the North",
                        position = { 0, 0.1, 0 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseDunadan",
                        function_owner = self,
                        label = "Strider: Dunadan*",
                        position = { 0, 0.1, 0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
            elseif CompanionNames[1] == "Strider: Ranger of the North" then
                self.createButton(
                    {
                        click_function = "ChooseTheGreyWanderer",
                        function_owner = self,
                        label = "Gandalf the Grey: The Grey Wanderer",
                        position = { 0, 0.1, -0.6 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseKeeperOfNarya",
                        function_owner = self,
                        label = "Gandalf the Grey: Keeper of Narya*",
                        position = { 0, 0.1, -0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseRangerOfTheNorth",
                        function_owner = self,
                        label = "Strider: Ranger of the North",
                        position = { 0, 0.1, 0 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseDunadan",
                        function_owner = self,
                        label = "Strider: Dunadan*",
                        position = { 0, 0.1, 0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
            elseif CompanionNames[1] == "Strider: Dunadan*" then
                self.createButton(
                    {
                        click_function = "ChooseTheGreyWanderer",
                        function_owner = self,
                        label = "Gandalf the Grey: The Grey Wanderer",
                        position = { 0, 0.1, -0.6 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseKeeperOfNarya",
                        function_owner = self,
                        label = "Gandalf the Grey: Keeper of Narya*",
                        position = { 0, 0.1, -0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseRangerOfTheNorth",
                        function_owner = self,
                        label = "Strider: Ranger of the North",
                        position = { 0, 0.1, 0 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 1 },
                        font_size = 75,
                        tooltip = "(Original Character)"
                    }
                )
                self.createButton(
                    {
                        click_function = "ChooseDunadan",
                        function_owner = self,
                        label = "Strider: Dunadan*",
                        position = { 0, 0.1, 0.3 },
                        width = 1600,
                        height = 150,
                        color = { 1, 1, 0 },
                        font_size = 75,
                        tooltip = "(Lords of Middle-Earth Character)"
                    }
                )
            end

            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "* Lords of Middle Earth Expansion Character.",
                    position = { 0, 0.1, 0.9 },
                    width = 0,
                    height = 0,
                    font_size = 50,
                    font_color = { 1, 1, 0 }
                }
            )
            self.createButton(
                {
                    click_function = "Continue",
                    function_owner = self,
                    label = "Continue",
                    position = { 0, 0.1, 1.2 },
                    width = 1600,
                    height = 200,
                    color = { 1, 1, 1 },
                    font_size = 100
                }
            )
            function ChooseTheGreyWanderer()
                CompanionNames[1] = "Gandalf the Grey: The Grey Wanderer"
                CompanionNames[2] = "Strider: Ranger of the North"
                NextStep = "StartingGuideMenu"
                Step = ""
            end

            function ChooseKeeperOfNarya()
                CompanionNames[1] = "Gandalf the Grey: Keeper of Narya*"
                CompanionNames[2] = "Strider: Ranger of the North"
                NextStep = "StartingGuideMenu"
                Step = ""
            end

            function ChooseRangerOfTheNorth()
                CompanionNames[1] = "Strider: Ranger of the North"
                CompanionNames[2] = "Gandalf the Grey: The Grey Wanderer"
                NextStep = "StartingGuideMenu"
                Step = ""
            end

            function ChooseDunadan()
                CompanionNames[1] = "Strider: Dunadan*"
                CompanionNames[2] = "Gandalf the Grey: The Grey Wanderer"
                NextStep = "StartingGuideMenu"
                Step = ""
            end

            function Continue()
                NextStep = "SetupExpansions"
                Step = ""
            end
        end
    elseif Step == "SetupExpansions" then
        self.clearButtons()
        NextStep = "SetupCompanions"
        local TempObj = nil
        --Included: The Fate of Erebor...
        if TFoE then
            --setup the Fate of Erebor...
            Global.call("SetupTFoE")
            --setup optional new cities?
            if NewCities then
                Global.call("SetupTFoENewCities")
            else
                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("c537fa"))
                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("2df5ce"))
            end

            --replace cards...
            getObjectFromGUID(IDs.ShadowStrategyEventDeck).putObject(
                getObjectFromGUID(IDs.TFoE.ShadowStrategyEventCards)
            )
            coroutine.yield(0)
            getObjectFromGUID(IDs.FreePeoplesCharacterEventDeck).putObject(
                getObjectFromGUID(IDs.TFoE.FreePeoplesCharacterEventCards)
            )
            getObjectFromGUID(IDs.FreePeoplesStrategyEventDeck).putObject(
                getObjectFromGUID(IDs.TFoE.FreePeoplesStrategyEventCards)
            )
            coroutine.yield(0)
            --Remove Free Peoples Strategy Event Card #4, #19, and #22, then remove FP character card #17...
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "There and Back Again", Description = "#17;" }
            )
            coroutine.yield(0)
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Book of Mazarbul", Description = "#4;" }
            )
            coroutine.yield(0)
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "King Brand's Men", Description = "#19;" }
            )
            coroutine.yield(0)
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Dain Ironfoot's Guard", Description = "#22;" }
            )
            coroutine.yield(0)
            --Remove Shadow Event Card #20 and #22 (Orcs Multiplying Again & Monsters Roused)...
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Orcs Multiplying Again", Description = "#20;" }
            )
            coroutine.yield(0)
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Monsters Roused", Description = "#22;" }
            )
            coroutine.yield(0)
            --Remove old Gimli Character Cards...
            if getObjectFromGUID("78f279") ~= nil then
                if getObjectFromGUID("f86853") ~= nil then
                    getObjectFromGUID("f86853").setPositionSmooth(
                        getObjectFromGUID("78f279").getPosition(),
                        false,
                        false
                    )
                end

                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("78f279"))
            end

            if getObjectFromGUID("af7f13") ~= nil then
                if getObjectFromGUID("de958e") ~= nil then
                    getObjectFromGUID("de958e").setPositionSmooth(
                        getObjectFromGUID("af7f13").getPosition(),
                        false,
                        false
                    )
                end

                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("af7f13"))
            end

            -- If KoME+TFoE then remove Dain and Brand from the game...
            if KoME then
                printToAll("The Fate of Erebor removes King Brand and King Dain Ironfoot from the game.", { 1, 1, 0 })
                if getObjectFromGUID(IDs.Companions.Brand) ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.Companions.Brand))
                end

                if getObjectFromGUID(IDs.Companions.Dain) ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.Companions.Dain))
                end

                if getObjectFromGUID("43a6a7") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("43a6a7"))
                end

                if getObjectFromGUID("754777") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("754777"))
                end

                if getObjectFromGUID("a90518") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("a90518"))
                end

                if getObjectFromGUID("d1aa1a") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("d1aa1a"))
                end

                if getObjectFromGUID("55b8d8") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("55b8d8"))
                end

                if getObjectFromGUID("9bdfb0") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID("9bdfb0"))
                end
            end
        else --clean up TFoE components...
            --Clean up TFoE Components...
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Putting away\nThe Fate of Erebor\nMini-Expansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            for _, Obj in pairs(getAllObjects()) do
                if string.find(Obj.getDescription(), "TFoE;") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(Obj)
                end
            end

            --wait for cleanup to finish...
            local Done = true
            repeat
                Done = true --assume true until proven false.
                for _, Obj in pairs(getAllObjects()) do
                    if string.find(Obj.getDescription(), "TFoE;") ~= nil then
                        Done = false
                    end
                end

                coroutine.yield(0)
            until Done
        end

        --Included: Lords of Middle-Earth...
        if LoME then
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Setting up\nLords of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            --change next step to Alternate Companions Menu...
            NextStep = "AlternateCompanionsMenu"
            --Replace Elven Rings...
            for I = 1, 3 do
                getObjectFromGUID(IDs.LoME.ElvenRings[I]).setPositionSmooth(
                    getObjectFromGUID(IDs.ElvenRings[I]).getPosition(),
                    false,
                    false
                )
                getObjectFromGUID(IDs.LoME.ElvenRings[I]).setRotation({ 0, 90, 0 })
                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.ElvenRings[I]))
                coroutine.yield(0)
            end

            --Add New Event Cards...
            getObjectFromGUID(IDs.ShadowCharacterEventDeck).putObject(
                getObjectFromGUID(IDs.LoME.ShadowCharacterEventCards)
            )
            getObjectFromGUID(IDs.ShadowStrategyEventDeck).putObject(
                getObjectFromGUID(IDs.LoME.ShadowStrategyEventCards)
            )
            coroutine.yield(0)
            getObjectFromGUID(IDs.FreePeoplesCharacterEventDeck).putObject(
                getObjectFromGUID(IDs.LoME.FreePeoplesCharacterEventCards)
            )
            getObjectFromGUID(IDs.FreePeoplesStrategyEventDeck).putObject(
                getObjectFromGUID(IDs.LoME.FreePeoplesStrategyEventCards)
            )
            coroutine.yield(0)
            --Remove Shadow Event Card #17 (Balrog of Moria)...
            Global.call(
                "RemoveObjectFromGame",
                {
                    BagID = IDs.ShadowCharacterEventDeck,
                    Name = "Balrog of Moria",
                    Description = "Card;Event;Character;Shadow;"
                }
            )
            --Add 2 Smeagol Tiles (if not using BotF)...
            if not BotF then
                for T = 1, 2 do
                    getObjectFromGUID(IDs.HuntTileBag).putObject(getObjectFromGUID(IDs.LoME.SmeagolTiles[T]))
                    coroutine.yield(0)
                end
            end
        else --Excluded: Lord of Middle-Earth...
            --Clean up LoME Components...
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Putting away\nLords of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            for _, Obj in pairs(getAllObjects()) do
                if string.find(Obj.getDescription(), "LoME;") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(Obj)
                end
            end

            --wait for cleanup to finish...
            local Done = true
            repeat
                Done = true --assume true until proven false.
                for _, Obj in pairs(getAllObjects()) do
                    if string.find(Obj.getDescription(), "LoME;") ~= nil then
                        Done = false
                    end
                end

                coroutine.yield(0)
            until Done
        end

        coroutine.yield(0)
        --Included: Warriors of Middle-Earth...
        if WoME then
            log(" Setting up WoME...")
            --debuggg
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Setting up\nWarriors of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            --Remove FP cards
            log(" Removing FP Event Cards (WoME)...")
            --debuggg
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "Gwaihir the Windlord", Description = "#15;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "The Eagles are Coming!", Description = "#18;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "The Ents Awake: Treebeard", Description = "#19;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "The Ents Awake: Huorns", Description = "#20;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "The Ents Awake: Entmoot", Description = "#21;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "Dead Men of Dunharrow", Description = "#22;" }
            )
            coroutine.yield(0)
            --Remove S cards
            log(" Removing Shadow Event Cards (WoME)...")
            --debuggg
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowCharacterEventDeck, Name = "Shelob's Lair", Description = "#1;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Corsairs of Umbar", Description = "#10;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Rage of the Dunlendings", Description = "#11;" }
            )
            coroutine.yield(0)
            --Add New cards
            log(" Adding FP Event Cards...")
            --debuggg
            TempObj = getObjectFromGUID(IDs.WoME.FreePeoplesEventCards)
            coroutine.yield(0)
            log("  Added:" .. TempObj.getName() .. "(" .. TempObj.getGUID() .. ")")
            getObjectFromGUID(IDs.FreePeoplesCharacterEventDeck).putObject(TempObj)
            repeat
                coroutine.yield(0)
            until TempObj == nil
            log(" Adding S Event Cards...")
            --debuggg
            TempObj = getObjectFromGUID(IDs.WoME.NotOnAnybodysSideCard)
            coroutine.yield(0)
            log("  Added:" .. TempObj.getName() .. "(" .. TempObj.getGUID() .. ")")
            getObjectFromGUID(IDs.ShadowCharacterEventDeck).putObject(TempObj)
            repeat
                coroutine.yield(0)
            until TempObj == nil
            TempObj = getObjectFromGUID(IDs.WoME.ShadowEventCards)
            coroutine.yield(0)
            log("  Added:" .. TempObj.getName() .. "(" .. TempObj.getGUID() .. ")")
            getObjectFromGUID(IDs.ShadowStrategyEventDeck).putObject(TempObj)
            repeat
                coroutine.yield(0)
            until TempObj == nil
        else --Excluded: Warriors of MIddle-Earth...
            --Clean up WoME Components...
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Putting away\nWarriors of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            for _, Obj in pairs(getAllObjects()) do
                if string.find(Obj.getDescription(), "WoME;") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(Obj)
                end
            end

            --Move Event Discard Spots..
            getObjectFromGUID("61c02b").setPosition({ 40.25, 0.92, -20.00 })
            getObjectFromGUID("b18c8a").setPosition({ -40.25, 0.92, 20.00 })
            --wait for cleanup to finish...
            local Done = true
            repeat
                Done = true --assume true until proven false.
                for _, Obj in pairs(getAllObjects()) do
                    if string.find(Obj.getDescription(), "WoME;") ~= nil then
                        Done = false
                    end
                end

                coroutine.yield(0)
            until Done
        end

        coroutine.yield(0)
        if KoME then
            log(" Setting up KoME...")
            --debuggg
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Setting up\nKings of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            --add KoME hunt tiles into hunt pool...
            for O, Obj in pairs(getAllObjects()) do
                if Obj.getName() == "Hunt Tile" and string.find(Obj.getDescription(), "KoME;") ~= nil then
                    getObjectFromGUID(IDs.HuntTileBag).putObject(Obj)
                end
                -- If kome hunt tile
                getObjectFromGUID(IDs.HuntTileBag).shuffle()
            end
            -- for O,Obj
            --Remove Event Cards...
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesCharacterEventDeck, Name = "House of the Stewards", Description = "#23;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Wisdom of Elrond", Description = "#8;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Riders of Theoden", Description = "#16;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Thranduil's Archers", Description = "#24;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Return to Valinor", Description = "#1;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Denethor's Folly", Description = "#3;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Threats and Promises", Description = "#5;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "Stormcrow", Description = "#6;" }
            )
            Global.call(
                "RemoveObjectFromGame",
                { BagID = IDs.ShadowStrategyEventDeck, Name = "The King is Revealed", Description = "#18;" }
            )
            -- If The Fate of Erebot is used then do not swap 2 of the cards (King Brands MEn and Dain Ironfoot's Guard)...
            if TFoE then
                --remove the new cards, we will keep old ones...
                Global.call("RemoveObjectFromGame", { BagID = "890b46", Name = "King Brand's Men", Description = "#19;" })
                Global.call(
                    "RemoveObjectFromGame",
                    { BagID = "890b46", Name = "Dain Ironfoot's Guard", Description = "#22;" }
                )
            else --remove the 2 base cards, they will be replaced with the KoME new cards...
                Global.call(
                    "RemoveObjectFromGame",
                    { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "King Brand's Men", Description = "#19;" }
                )
                Global.call(
                    "RemoveObjectFromGame",
                    { BagID = IDs.FreePeoplesStrategyEventDeck, Name = "Dain Ironfoot's Guard", Description = "#22;" }
                )
            end

            --Add New Event Cards...
            getObjectFromGUID(IDs.ShadowCharacterEventDeck).putObject(getObjectFromGUID("70fc9b"))
            coroutine.yield(0)
            getObjectFromGUID(IDs.ShadowStrategyEventDeck).putObject(getObjectFromGUID("cc76b8"))
            coroutine.yield(0)
            getObjectFromGUID(IDs.FreePeoplesCharacterEventDeck).putObject(getObjectFromGUID("0534ed"))
            coroutine.yield(0)
            getObjectFromGUID(IDs.FreePeoplesStrategyEventDeck).putObject(getObjectFromGUID("890b46"))
            coroutine.yield(0)
        else --Excluded: Kings of MIddle-Earth...
            --Clean up WoME Components...
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Putting away\nKings of Middle-Earth\nExpansion Content...",
                    position = { 0, 0.1, 0 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            for _, Obj in pairs(getAllObjects()) do
                if string.find(Obj.getDescription(), "KoME;") ~= nil then
                    getObjectFromGUID(GraveBagId).putObject(Obj)
                end
            end

            --wait for cleanup to finish...
            local Done = true
            repeat
                Done = true --assume true until proven false.
                for _, Obj in pairs(getAllObjects()) do
                    if string.find(Obj.getDescription(), "KoME;") ~= nil then
                        Done = false
                    end
                end

                coroutine.yield(0)
            until Done
        end

        coroutine.yield(0)
        --setup treebeard content..
        if WoME then
            if Treebeard == 1 then
                --WM1/1R
                getObjectFromGUID("8f8093").setPosition({ -13.5, 0.97, 33 }, false, false)
                getObjectFromGUID("8f8093").setRotation({ 0, 0, 180 }, false, false)
                if getObjectFromGUID("185612") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("185612"))
                end
                --PROMO1
                if getObjectFromGUID("3d93f2") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("3d93f2"))
                end
                --PROMO1R
                if getObjectFromGUID("d7264c") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("d7264c"))
                end
            else
                --PROMO1R
                getObjectFromGUID("d7264c").setPosition({ -13.5, 0.97, 33 }, false, false)
                getObjectFromGUID("d7264c").setRotation({ 0, 0, 180 }, false, false)
                if getObjectFromGUID("8f8093") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("8f8093"))
                end
                --WM1/1
                if getObjectFromGUID("185612") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("185612"))
                end
                --PROMO1
                if getObjectFromGUID("3d93f2") ~= nil then
                    getObjectFromGUID("416864").putObject(getObjectFromGUID("3d93f2"))
                end
            end
        elseif Treebeard == 1 then
            --WM1/1R
            getObjectFromGUID("185612").setPosition({ -13.5, 0.97, 33 }, false, false)
            getObjectFromGUID("185612").setRotation({ 0, 0, 180 }, false, false)
            if getObjectFromGUID("8f8093") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("8f8093"))
            end
            --WM1/1
            if getObjectFromGUID("3d93f2") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("3d93f2"))
            end
            --PROMO1R
            if getObjectFromGUID("d7264c") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("d7264c"))
            end
        elseif Treebeard == 2 then
            --WM1/1R
            getObjectFromGUID("3d93f2").setPosition({ -13.5, 0.97, 33 }, false, false)
            getObjectFromGUID("3d93f2").setRotation({ 0, 0, 180 }, false, false)
            if getObjectFromGUID("8f8093") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("8f8093"))
            end
            --WM1/1
            if getObjectFromGUID("185612") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("185612"))
            end
            --PROMO1
            if getObjectFromGUID("d7264c") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("d7264c"))
            end
        else --no treebeard...
            --WM1/1R
            if getObjectFromGUID("5e36c8") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("5e36c8"))
            end
            --treebeard miniature
            if getObjectFromGUID("e51819") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("e51819"))
            end
            --treebeard miniature
            if getObjectFromGUID("964d05") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("964d05"))
            end
            --treebeard miniature
            if getObjectFromGUID("8f8093") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("8f8093"))
            end
            --WM1/1
            if getObjectFromGUID("185612") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("185612"))
            end
            --PROMO1
            if getObjectFromGUID("3d93f2") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("3d93f2"))
            end
            --PROMO1R
            if getObjectFromGUID("d7264c") ~= nil then
                getObjectFromGUID("416864").putObject(getObjectFromGUID("d7264c"))
            end
        end

        for I = 1, 99 do
            coroutine.yield(0)
        end
        -- for D
        Step = ""
    elseif Step == "AlternateCompanionsMenu" then
        self.clearButtons()
        if BotF then
            NextStep = "SetupCompanions"
            Step = ""
        else --hold Rivendell Council...
            --secretly choose alternate companions...
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Choose Alternate Companions:",
                    position = { 0, 0.1, -1.45 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 0.3, 0.3, 1 }
                }
            )
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Free Peoples Player\nis secretly choosing\nAlternate Companions...",
                    position = { 0, -0.1, -0 },
                    rotation = { 180, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 1, 1, 1 }
                }
            )
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Fellowship Guide: " .. CompanionNames[1],
                    position = { 0, 0.1, -1.2 },
                    width = 0,
                    height = 0,
                    font_size = 75,
                    font_color = { 1, 1, 0 }
                }
            )
            self.createButton(
                {
                    click_function = "ToggleGandalfStrider",
                    function_owner = self,
                    label = CompanionNames[2],
                    position = { 0, 0.1, -0.9 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "ToggleLegolas",
                    function_owner = self,
                    label = CompanionNames[3],
                    position = { 0, 0.1, -0.6 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "ToggleGimli",
                    function_owner = self,
                    label = CompanionNames[4],
                    position = { 0, 0.1, -0.3 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "ToggleBoromir",
                    function_owner = self,
                    label = CompanionNames[5],
                    position = { 0, 0.1, 0 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "TogglePeregrin",
                    function_owner = self,
                    label = CompanionNames[6],
                    position = { 0, 0.1, 0.3 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "ToggleMeriadoc",
                    function_owner = self,
                    label = CompanionNames[7],
                    position = { 0, 0.1, 0.6 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 75,
                    tooltip = "Click to change."
                }
            )
            self.createButton(
                {
                    click_function = "Continue",
                    function_owner = self,
                    label = "Continue",
                    position = { 0, 0.1, 1.2 },
                    width = 1800,
                    height = 200,
                    color = { 1, 1, 1 },
                    font_size = 100
                }
            )
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "* Lords of Middle Earth Expansion Character.",
                    position = { 0, 0.1, 0.9 },
                    width = 0,
                    height = 0,
                    font_size = 50,
                    font_color = { 1, 1, 0 }
                }
            )
        end

        function ToggleGandalfStrider()
            if CompanionNames[2] == "Gandalf the Grey: The Grey Wanderer" then
                CompanionNames[2] = "Gandalf the Grey: Keeper of Narya*"
            elseif CompanionNames[2] == "Gandalf the Grey: Keeper of Narya*" then
                CompanionNames[2] = "Gandalf the Grey: The Grey Wanderer"
            elseif CompanionNames[2] == "Strider: Ranger of the North" then
                CompanionNames[2] = "Strider: Dunadan*"
            else
                CompanionNames[2] = "Strider: Ranger of the North"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function ToggleLegolas()
            if CompanionNames[3] == "Legolas: Son of Thranduil" then
                CompanionNames[3] = "Legolas: Elven Prince*"
            else
                CompanionNames[3] = "Legolas: Son of Thranduil"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function ToggleGimli()
            if CompanionNames[4] == "Gimli: Son of Gloin" then
                CompanionNames[4] = "Gimli: Dwarven Lord*"
            else
                CompanionNames[4] = "Gimli: Son of Gloin"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function ToggleBoromir()
            if CompanionNames[5] == "Boromir: Son of Denethor" then
                CompanionNames[5] = "Boromir: Captain General of Gondor*"
            else
                CompanionNames[5] = "Boromir: Son of Denethor"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function TogglePeregrin()
            if CompanionNames[6] == "Peregrin Took: Hobbit Companion" then
                CompanionNames[6] = "Peregrin: Hobbit of the Shire*"
            else
                CompanionNames[6] = "Peregrin Took: Hobbit Companion"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function ToggleMeriadoc()
            if CompanionNames[7] == "Meriadoc Brandybuck: Hobbit Companion" then
                CompanionNames[7] = "Meriadoc: Hobbit of the Shire*"
            else
                CompanionNames[7] = "Meriadoc Brandybuck: Hobbit Companion"
            end

            NextStep = "AlternateCompanionsMenu"
            Step = ""
        end

        function Continue()
            self.clearButtons()
            --strip off asterisk from names if any...
            for C = 1, #CompanionNames do
                CompanionNames[C] = string.gsub(CompanionNames[C], "*", "")
            end

            MoveGamePanel("All")
            NextStep = "SetupCompanions"
            Step = ""
        end
    elseif Step == "SetupCompanions" then
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Setting up the Fellowship...",
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 1 }
            }
        )
        for I = 1, 99 do
            coroutine.yield(0)
        end
        -- for D
        --flip all companion cards face down...
        for O, Obj in pairs(getAllObjects()) do
            -- If companion card (but not Gollum)...
            if
                Obj.type == "Card" and string.find(Obj.getDescription(), "Companion;") ~= nil and
                string.find(Obj.getName(), "Gollum") == nil and
                string.find(Obj.getName(), "Sméagol") == nil
            then
                for C = 1, #CompanionNames do
                    if Obj.getName() == CompanionNames[C] then
                        IDs.CompanionCards[C] = Obj.getGUID()
                        coroutine.yield(0)
                        break
                    end
                end

                Obj.setRotation({ 0, 0, 180 })
                coroutine.yield(0)
                getObjectFromGUID(GraveBagId).putObject(Obj)
                repeat --waiting for the card to vanish, Entrox Licher
                    coroutine.yield(0)
                until Obj == nil
            end
        end

        for I = 1, 30 do
            coroutine.yield(0)
        end

        --pause 30 frames after all companions are in the grave. Entrox Licher
        --pull back out companion cards face down and place them on the board...
        for C = 2, #IDs.CompanionCards do
            coroutine.yield(0)
            local CardObj =
                getObjectFromGUID(GraveBagId).takeObject(
                    {
                        smooth = true,
                        guid = IDs.CompanionCards[C],
                        rotation = { 0, 180, 180 },
                        position = { 32.9, 3 - 0.2 * C, 20.15 }
                    }
                )
            --ring-bearers?
            if CardObj.getName() == "The Ring-bearers (Frodo & Samwise)" then
                coroutine.yield(0)
                CardObj.setRotation({ 0, 180, 0 })
                CardObj.setPosition({ 32.9, 0.97, 20.15 })
                CardObj.setLock(true)
            else
                CardObj.setDescription(CardObj.getDescription() .. "Fellowship;")
            end
        end

        coroutine.yield(0)
        --drop guide on top of the stack face up...
        local CardObj =
            getObjectFromGUID(GraveBagId).takeObject(
                { smooth = true, guid = IDs.CompanionCards[1], rotation = { 0, 180, 0 }, position = { 32.9, 9, 20.15 } }
            )
        coroutine.yield(0)
        CardObj.setDescription(CardObj.getDescription() .. "Fellowship;")
        --wait for fellowship guide card to exist...
        repeat
            coroutine.yield(0)
        until getObjectFromGUID(IDs.CompanionCards[1]) ~= nil
        --wait for fellowship guide card to reach their destination before continuing...
        local Done = false
        Global.call("PlaySound", { ID = 1 })
        --Music Title
        repeat
            coroutine.yield(0)
            if getObjectFromGUID(IDs.CompanionCards[1]) ~= nil then
                Done =
                    getObjectFromGUID(IDs.CompanionCards[1]).getPosition().x >= 32.8 and
                    getObjectFromGUID(IDs.CompanionCards[1]).getPosition().y <= 1.2 and
                    getObjectFromGUID(IDs.CompanionCards[1]).getPosition().z >= 20.1
            else --card must have merged into deck...
                Done = true
            end
        until Done
        Global.call("FellowshipMenu")
        NextStep = "ValidateArmies"
        --compact mode?
        if Versus == "1v1 Compact Mode" then
            broadcastToAll("Compact Mode 1v1:\nPlacing Players next to each other...")
            Versus = "1v1"
            --update stored locations...
            Spots.ShadowDiceBox = Spots.CompactShadowUsedDice
            Spots.FreePeoplesDiceBox = Spots.CompactFreePeoplesUsedDice
            --relocate Blue hand...
            coroutine.yield(0)
            Global.call("MoveObject", { ID = "63b83a", Position = { -25, 3, -57 }, Rotation = { 0, 0, 0 }, Smooth = false })
            --blue hand
            --swap blue to green, then back to move player to the correct spot...
            coroutine.yield(0)
            Player["Blue"].changeColor("Green")
            coroutine.yield(0)
            Player["Green"].changeColor("Blue")
            --clear and move combat dice...
            for O, Obj in pairs(getAllObjects()) do
                if Obj.getName() == "(Free Peoples Combat Die)" or Obj.getName() == "(Shadow Combat Die)" then
                    Obj.destruct()
                end
            end
            -- for O,Obj
            Global.call(
                "MoveObject",
                { ID = "637507", Position = { -23.75, 1.01, -15.75 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            Global.call(
                "MoveObject",
                { ID = "f50dab", Position = { -23.75, 1.01, -17.25 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            Global.call(
                "MoveObject",
                { ID = "9847f7", Position = { -3, 1.01, -21.5 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            Global.call(
                "MoveObject",
                { ID = "63319b", Position = { -3, 1.01, -23 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            Global.call(
                "MoveObject",
                { ID = "92a611", Position = { -1.9, 1.01, -21.5 }, Rotation = { 0, 0, 0 }, Smooth = false }
            )
            Global.call(
                "MoveObject",
                { ID = "4b6f4c", Position = { -23.7, 1.01, -14.2 }, Rotation = { 0, 0, 0 }, Smooth = false }
            )
            local CombatDiceIndex = 0
            --move shadow objects first...
            for O, Obj in pairs(getAllObjects()) do
                --what side is it on?
                if string.find(Obj.getDescription(), "Shadow;") ~= nil then
                    --which object type is it?
                    if Obj.getName() == "(Shadow Combat Die)" then
                        CombatDiceIndex = CombatDiceIndex + 1
                        Obj.setPosition({ -6 + CombatDiceIndex, 1.5, -22 })
                        coroutine.yield(0)
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;1of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[1])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;2of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[2])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;3of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[3])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;4of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[4])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;5of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[5])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;6of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[6])
                    elseif string.find(Obj.getDescription(), "Dice;Action;Shadow;7of10;") ~= nil then
                        Obj.setPosition(Spots.CompactShadowDiceLine[7])
                    end
                end
            end

            coroutine.yield(0)
            --move FP objects second...
            CombatDiceIndex = 0
            for O, Obj in pairs(getAllObjects()) do
                --what side is it on?
                if string.find(Obj.getDescription(), "FreePeoples;") ~= nil then
                    --which object type is it?
                    if
                        (Obj.type == "Tile" and string.find(Obj.getDescription(), "FactionCard;") ~= nil) or
                        (Obj.type == "Figurine" and string.find(Obj.getDescription(), "Faction;") ~= nil) or
                        string.find(Obj.getDescription(), "Faction;2D;") ~= nil or
                        string.find(Obj.getDescription(), "Faction;3D;") ~= nil
                    then
                        Global.call(
                            "MoveObject",
                            {
                                ID = Obj.getGUID(),
                                Position = { Obj.getPosition().x - 5, Obj.getPosition().y, -Obj.getPosition().z },
                                Rotation = { 0, 180, 0 },
                                Smooth = false
                            }
                        )
                        coroutine.yield(0)
                    elseif Obj.getDescription() == "DeckSpot;CallToBattle;FreePeoples;WoME;" then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = { -3, 0.95, -45 }, Rotation = { 0, 180, 0 }, Smooth = false }
                        )
                    elseif Obj.getDescription() == "Deck;CallToBattle;FreePeoples;WoME;" then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = { -3, 3, -45 }, Rotation = { 0, 180, 180 }, Smooth = false }
                        )
                    elseif Obj.getName() == "(Free Peoples Faction Die)" then
                        Global.call("MoveObject", { ID = Obj.getGUID(), Position = { -8, 1.6, -41.5 }, Smooth = false })
                        coroutine.yield(0)
                    elseif
                        (Obj.getName() == "Gandalf the White: Emissary from the West" and
                            (not BotF or Obj.type ~= "Figurine")) or
                        Obj.getName() == "Aragorn: Heir to Isildur" or
                        ((Obj.getName() == "Gollum: Slave of the Ring" or Obj.getName() == "Gollum") and not BotF) or
                        string.find(Obj.getDescription(), "Dice;Action;FreePeoples;5of6;") ~= nil or
                        string.find(Obj.getDescription(), "Dice;Action;FreePeoples;6of6;") ~= nil or
                        Obj.getName() == "Lady Galadriel: Keeper of Nenya" or
                        Obj.getName() == "Lord Elrond: Keeper of Vilya" or
                        Obj.getName() == "Sméagol: Tamed Wretch" or
                        Obj.getName() == "Sméagol" or
                        Obj.getName() == "(Vilya Action Die)" or
                        Obj.getName() == "(Nenya Action Die)" or
                        Obj.getName() == "Treebeard: Tree-herd" or
                        Obj.getName() == "Sméagol Hunt Tile"
                    then
                        Global.call(
                            "MoveObject",
                            {
                                ID = Obj.getGUID(),
                                Position = { Obj.getPosition().x - 33, Obj.getPosition().y, -Obj.getPosition().z },
                                Rotation = { Obj.getRotation().x, 180, Obj.getRotation().z },
                                Smooth = false
                            }
                        )
                        coroutine.yield(0)
                    elseif Obj.getName() == "(Narya Action Die)" then
                        Global.call("MoveObject", { ID = Obj.getGUID(), Position = { -44.5, 1.6, -39 }, Smooth = false })
                    elseif Obj.getName() == "(Free Peoples Combat Die)" then
                        CombatDiceIndex = CombatDiceIndex + 1
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = { -27 + CombatDiceIndex, 1.5, -15 }, Smooth = false }
                        )
                        coroutine.yield(0)
                    elseif string.find(Obj.getDescription(), "Dice;Action;FreePeoples;1of6;") ~= nil then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = Spots.CompactFreePeoplesDiceLine[1], Smooth = false }
                        )
                    elseif string.find(Obj.getDescription(), "Dice;Action;FreePeoples;2of6;") ~= nil then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = Spots.CompactFreePeoplesDiceLine[2], Smooth = false }
                        )
                    elseif string.find(Obj.getDescription(), "Dice;Action;FreePeoples;3of6;") ~= nil then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = Spots.CompactFreePeoplesDiceLine[3], Smooth = false }
                        )
                    elseif string.find(Obj.getDescription(), "Dice;Action;FreePeoples;4of6;") ~= nil then
                        Global.call(
                            "MoveObject",
                            { ID = Obj.getGUID(), Position = Spots.CompactFreePeoplesDiceLine[4], Smooth = false }
                        )
                    elseif Obj.getName() == "(Free Peoples Ruler Die)" then
                        Global.call("MoveObject", { ID = Obj.getGUID(), Position = { -47.5, 1.6, -39 }, Smooth = false })
                    elseif
                        Obj.type == "Card" and
                        (Obj.getName() == "Brand: King of Dale" or
                            Obj.getName() == "Dain Ironfoot: King Under the Mountain" or
                            Obj.getName() == "Denethor: Lord Steward of Gondor" or
                            Obj.getName() == "Theoden: King of the Riddermark" or
                            Obj.getName() == "Thranduil: King of the Woodland Realm")
                    then
                        Global.call(
                            "MoveObject",
                            {
                                ID = Obj.getGUID(),
                                Position = { Obj.getPosition().x - 9.5, Obj.getPosition().y, -Obj.getPosition().z + 12 },
                                Rotation = { Obj.getRotation().x, 180, Obj.getRotation().z },
                                Smooth = false
                            }
                        )
                    end
                elseif Obj.getDescription() == "Token;Ruler;KoME;" then
                    Global.call(
                        "MoveObject",
                        {
                            ID = Obj.getGUID(),
                            Position = { Obj.getPosition().x - 9.5, Obj.getPosition().y, -Obj.getPosition().z + 0.4 },
                            Rotation = { 0, 90, 0 },
                            Smooth = false
                        }
                    )
                elseif Obj.type == "Card" and string.find(Obj.getName(), "Corrupted Ruler") ~= nil then
                    Global.call(
                        "MoveObject",
                        {
                            ID = Obj.getGUID(),
                            Position = { Obj.getPosition().x - 41.5, Obj.getPosition().y, Obj.getPosition().z },
                            Rotation = Obj.getRotation(),
                            Smooth = false
                        }
                    )
                end
            end

            Global.call("MoveObject", { ID = "9a56a5", Position = { 58, 1.57, -60 }, Smooth = false })
            --Red Action Dice Box.
            Global.call("MoveObject", { ID = "46d2fc", Position = { -58, 1.57, -60 }, Smooth = false })
            --Red Action Dice Box.
            --relocate used dice areas...
            Global.call(
                "MoveObject",
                { ID = "028249", Position = { -5.1, 0.95, -32.75 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            --blue area
            Global.call(
                "MoveObject",
                { ID = "75024a", Position = { 9.9, 0.95, -31.81 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            --blue area
            Global.call(
                "MoveObject",
                { ID = "9a38bc", Position = { 4.3, 0.95, -32.75 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            --red area
            Global.call(
                "MoveObject",
                { ID = "2916b7", Position = { -10.72, 0.95, -31.81 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            --red area
            Global.call(
                "MoveObject",
                { ID = "dcf102", Position = { -10.72, 0.95, -36.48 }, Rotation = { 0, 180, 0 }, Smooth = false }
            )
            --blue area
            --remove certain components...
            Global.call("RemoveObjectFromGame", { ID = "471b96" })
            Global.call("RemoveObjectFromGame", { ID = "28f260" })
            --re-move combat dice panels (they seem to get lag/stuck in certain games)...
            for I = 1, 30 do
                coroutine.yield(0)
            end

            if getObjectFromGUID("637507") ~= nil then
                getObjectFromGUID("637507").setPosition({ -23.75, 1.01, -15.75 })
            end

            if getObjectFromGUID("637507") ~= nil then
                getObjectFromGUID("637507").setRotation({ 0, 180, 0 })
            end

            if getObjectFromGUID("f50dab") ~= nil then
                getObjectFromGUID("f50dab").setPosition({ -23.75, 1.01, -17.25 })
            end

            if getObjectFromGUID("f50dab") ~= nil then
                getObjectFromGUID("f50dab").setRotation({ 0, 180, 0 })
            end

            if getObjectFromGUID("9847f7") ~= nil then
                getObjectFromGUID("9847f7").setPosition({ -3, 1.01, -21.5 })
            end

            if getObjectFromGUID("9847f7") ~= nil then
                getObjectFromGUID("9847f7").setRotation({ 0, 180, 0 })
            end

            if getObjectFromGUID("63319b") ~= nil then
                getObjectFromGUID("63319b").setPosition({ -3, 1.01, -23 })
            end

            if getObjectFromGUID("63319b") ~= nil then
                getObjectFromGUID("63319b").setRotation({ 0, 180, 0 })
            end

            if getObjectFromGUID("92a611") ~= nil then
                getObjectFromGUID("92a611").setPosition({ -1.9, 1.01, -21.5 })
            end

            if getObjectFromGUID("92a611") ~= nil then
                getObjectFromGUID("92a611").setRotation({ 0, 0, 0 })
            end

            if getObjectFromGUID("4b6f4c") ~= nil then
                getObjectFromGUID("4b6f4c").setPosition({ -23.7, 1.01, -14.2 })
            end

            if getObjectFromGUID("4b6f4c") ~= nil then
                getObjectFromGUID("4b6f4c").setRotation({ 0, 0, 0 })
            end
        end

        --Included: The Breaking of the Fellowship...
        if BotF then
            Global.call("SetupBotF")
        else
            Step = ""
        end
    elseif Step == "ValidateArmies" then
        SpawnArmies()
        ValidateArmyStep()
    elseif Step == "SetupCompleteMenu" then
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Choose Scripting Level:",
                position = { 0, 0.1, -1.3 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "FullScripts",
                function_owner = self,
                label = "Full Scripted Turns",
                position = { 0, 0.1, -0.5 },
                width = 1500,
                height = 350,
                color = { 1, 1, 1 },
                font_size = 150,
                tooltip = "Click to play game with full scripting assistance."
            }
        )
        self.createButton(
            {
                click_function = "BasicScripts",
                function_owner = self,
                label = "Basic Scripts Only",
                position = { 0, 0.1, 0.5 },
                width = 1500,
                height = 350,
                color = { 1, 1, 1 },
                font_size = 150,
                tooltip = "Click to play game with minimal scripting assistance."
            }
        )
        function FullScripts()
            self.clearButtons()
            NextStep = "StartTurn"
            Step = ""
        end

        function BasicScripts()
            self.clearButtons()
            NextStep = "BasicMenu"
            Step = ""
        end

        --Shuffle decks and bags...
        getObjectFromGUID(IDs.CompanionBag).shuffle()
        getObjectFromGUID(IDs.HuntTileBag).shuffle()
        getObjectFromGUID(IDs.FreePeoplesCharacterEventDeck).shuffle()
        getObjectFromGUID(IDs.FreePeoplesStrategyEventDeck).shuffle()
        getObjectFromGUID(IDs.ShadowCharacterEventDeck).shuffle()
        getObjectFromGUID(IDs.ShadowStrategyEventDeck).shuffle()
        if WoME then
            getObjectFromGUID(IDs.WoME.FreePeoplesFactionDeck).shuffle()
            getObjectFromGUID(IDs.WoME.ShadowFactionDeck).shuffle()
        end

        coroutine.yield(0)
        broadcastToAll("Setup Complete!")
        Turn = 0
        FlagString = ""
        if LoME then
            FlagString = FlagString .. "LoME;"
        end

        if WoME then
            FlagString = FlagString .. "WoME;"
        end

        if KoME then
            FlagString = FlagString .. "KoME;"
        end

        if TFoE then
            FlagString = FlagString .. "TFoE;"
        end

        if BotF then
            FlagString = FlagString .. "BotF;"
        end

        if CompactMode then
            FlagString = FlagString .. "Compact;"
        end

        Global.setVar("LoME", LoME)
        Global.setVar("WoME", WoME)
        Global.setVar("TFoE", TFoE)
        Global.setVar("KoME", KoME)
        Global.setVar("BotF", BotF)
        Global.setVar("CompactMode", CompactMode)
    elseif Step == "StartTurn" then
        Round = Round + 1
        Turn = Turn + 1
        Phase = 0
        Global.setVar("Round", Round)
        Global.setVar("Phase", Phase)
        Global.setVar("Turn", Turn)
        self.setDescription(
            "Panel;Round:" .. Round .. ";Phase:" .. Phase .. ";Turn:" .. Turn .. ";Step:" .. Step .. ";" .. FlagString
        )
        self.clearButtons()
        self.createButton(
            {
                click_function = "StartTurn",
                function_owner = self,
                label = "Start Turn " .. Turn,
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 400,
                color = { 1, 1, 1 },
                font_size = 250,
                tooltip = "Click to Start Turn " .. Turn
            }
        )
        FellowshipTrack = math.floor((getObjectFromGUID("6b62ef").getPosition().x - 5.0) / 1.58)
        CorruptionTrack = math.floor((getObjectFromGUID("abe1b3").getPosition().x - 5.0) / 1.58)
        ShadowVP = math.floor((getObjectFromGUID("976dbc").getPosition().x + 23.65) / 1.64)
        FreePeoplesVP = math.floor((getObjectFromGUID("d0b340").getPosition().x + 23.65) / 1.64)
        if FellowshipTrack < 0 then
            FellowshipTrack = 0
        elseif FellowshipTrack > 12 then
            FellowshipTrack = 12
        end

        if CorruptionTrack < 0 then
            CorruptionTrack = 0
        elseif CorruptionTrack > 12 then
            CorruptionTrack = 12
        end

        if ShadowVP < 0 then
            ShadowVP = 0
        elseif ShadowVP > 10 then
            ShadowVP = 10
        end

        if FreePeoplesVP < 0 then
            FreePeoplesVP = 0
        elseif FreePeoplesVP > 10 then
            FreePeoplesVP = 10
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Fellowship Track: " ..
                    FellowshipTrack ..
                    "\nCorruption Track: " ..
                    CorruptionTrack ..
                    "\n\nShadow Victory Points: " ..
                    ShadowVP .. " of 10\nFree Peoples Victory Points: " .. FreePeoplesVP .. " of 4",
                position = { 0, 0.1, -0.9 },
                width = 0,
                height = 0,
                font_color = { 0.9, 0.9, 0.9 },
                font_size = 75
            }
        )
        function StartTurn()
            printToAll("Turn " .. Turn .. " has started.")
            --pass leader tokens?...
            if Turn == 1 or Versus == "1v1" then
                PlayersLeader.FreePeoples = "Gondor"
                PlayersLeader.Shadow = "The Witch-king"
            elseif Versus == "1v2" then
                PlayersLeader.FreePeoples = "Gondor"
                if PlayersLeader.Shadow == "The Witch-king" then
                    PlayersLeader.Shadow = "Saruman"
                else
                    PlayersLeader.Shadow = "The Witch-king"
                end
            else
                if PlayersLeader.Shadow == "The Witch-king" then
                    PlayersLeader.Shadow = "Saruman"
                else
                    PlayersLeader.Shadow = "The Witch-king"
                end

                if PlayersLeader.FreePeoples == "Gondor" then
                    PlayersLeader.FreePeoples = "Rohan"
                else
                    PlayersLeader.FreePeoples = "Gondor"
                end
            end

            if PlayersLeader.FreePeoples == "Gondor" and Versus == "2v2" then
                getObjectFromGUID(IDs.FreePeoplesLeaderToken).setPositionSmooth(Spots.LeadingPlayerGondor, false, false)
                printToAll("Gondor Player (Blue) has the Free Peoples Leading Player Token.", Player["Blue"].color)
            elseif Versus == "2v2" then
                getObjectFromGUID(IDs.FreePeoplesLeaderToken).setPositionSmooth(Spots.LeadingPlayerRohan, false, false)
                printToAll("Rohan Player (Green) has the Free Peoples Leading Player Token.", Player["Green"].color)
            end

            if PlayersLeader.Shadow == "The Witch-king" and Versus ~= "1v1" then
                getObjectFromGUID(IDs.ShadowLeaderToken).setPositionSmooth(Spots.LeadingPlayerWitchKing, false, false)
                printToAll("The Witch-king Player (Red) has the Shadow Leading Player Token.", Player["Red"].color)
            elseif Versus ~= "1v1" then
                getObjectFromGUID(IDs.ShadowLeaderToken).setPositionSmooth(Spots.LeadingPlayerSaruman, false, false)
                printToAll("Saruman Player (Yellow) has the Shadow Leading Player Token.", Player["Yellow"].color)
            end
            --look for missing decks...
            IDs.FreePeoplesCharacterEventDeck =
                CheckDeck(
                    {
                        id = IDs.FreePeoplesCharacterEventDeck,
                        position = Spots.FreePeoplesCharacterEventDeck,
                        name = "Free Peoples Character Event Deck",
                        description = "Deck;Event;Character;FreePeoples;"
                    }
                )
            IDs.ShadowCharacterEventDeck =
                CheckDeck(
                    {
                        id = IDs.ShadowCharacterEventDeck,
                        position = Spots.ShadowCharacterEventDeck,
                        name = "Shadow Character Event Deck",
                        description = "Deck;Event;Character;Shadow;"
                    }
                )
            IDs.FreePeoplesStrategyEventDeck =
                CheckDeck(
                    {
                        id = IDs.FreePeoplesStrategyEventDeck,
                        position = Spots.FreePeoplesStrategyEventDeck,
                        name = "Free Peoples Strategy Event Deck",
                        description = "Deck;Event;Strategy;FreePeoples;"
                    }
                )
            IDs.ShadowStrategyEventDeck =
                CheckDeck(
                    {
                        id = IDs.ShadowStrategyEventDeck,
                        position = Spots.ShadowStrategyEventDeck,
                        name = "Shadow Strategy Event Deck",
                        description = "Deck;Event;Strategy;Shadow;"
                    }
                )
            if WoME then
                IDs.WoME.FreePeoplesFactionDeck =
                    CheckDeck(
                        {
                            id = IDs.WoME.FreePeoplesFactionDeck,
                            position = Spots.FreePeoplesFactionDeck,
                            name = "Free Peoples Faction Deck",
                            description = "Deck;Faction;FreePeoples;WoME;"
                        }
                    )
                IDs.WoME.ShadowFactionDeck =
                    CheckDeck(
                        {
                            id = IDs.WoME.ShadowFactionDeck,
                            position = Spots.ShadowFactionDeck,
                            name = "Shadow Faction Deck",
                            description = "Deck;Faction;Shadow;WoME;"
                        }
                    )
            end

            --look for missing dice...
            --...
            --detect fellowship guide...
            GuideName = Global.call("DetectGuide")
            NextStep = "Phase1"
            Step = ""
        end
    elseif Step == "Phase1" then --Recover Action Dice and Draw Event Cards
        Phase = 1
        Global.setVar("Phase", Phase)
        printToAll("Phase 1) Recover Action Dice and Draw Event Cards.")
        --display info on panel...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 1) Recover Action Dice\nand Draw Event Cards",
                position = { 0, 0.1, -1.3 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "PerformPhase1",
                function_owner = self,
                label = "Perform Phase 1:\nRecover Action Dice and\nDraw Event Cards.",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 400,
                color = { 1, 1, 1 },
                font_size = 100,
                tooltip = "Have the script perform all Phase 1 steps for you."
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1.2 },
                font_size = 100,
                tooltip = "Click Continue after all Phase 1 steps are completed."
            }
        )
        function Continue()
            NextStep = "Phase2"
            Step = ""
        end

        function PerformPhase1()
            self.clearButtons()
            --gather action dice...
            startLuaCoroutine(self, "GatherActionDiceCoroutine")
            NextStep = "Phase2"
            --NextStep = "BasicMenu"
            --draw event cards (and faction cards if playing WoME)...
            if Turn == 1 and BotF and Versus ~= "2v2" then
                --players will be prompted what to draw, starting with FreePeoples...
                NextStep = "Phase1_BotF_FreePeoplesDrawMenu"
            elseif Turn == 1 and BotF and Versus == "2v2" then
                --players will be prompted what to draw, starting with Gondor...
                NextStep = "Phase1_BotF_GondorDrawMenu"
            elseif Versus == "1v1" then
                DrawFromDeck(
                    {
                        deckname = "Character Event",
                        deckid = IDs.FreePeoplesCharacterEventDeck,
                        deckspot = Spots.FreePeoplesCharacterEventDeck,
                        count = 1,
                        player = "Blue"
                    }
                )
                DrawFromDeck(
                    {
                        deckname = "Strategy Event",
                        deckid = IDs.FreePeoplesStrategyEventDeck,
                        deckspot = Spots.FreePeoplesStrategyEventDeck,
                        count = 1,
                        player = "Blue"
                    }
                )
                if WoME then
                    DrawFromDeck(
                        {
                            deckname = "Faction",
                            deckid = IDs.WoME.FreePeoplesFactionDeck,
                            deckspot = Spots.FreePeoplesFactionDeck,
                            count = 1,
                            player = "Blue"
                        }
                    )
                end

                DrawFromDeck(
                    {
                        deckname = "Character Event",
                        deckid = IDs.ShadowCharacterEventDeck,
                        deckspot = Spots.ShadowCharacterEventDeck,
                        count = 1,
                        player = "Red"
                    }
                )
                DrawFromDeck(
                    {
                        deckname = "Strategy Event",
                        deckid = IDs.ShadowStrategyEventDeck,
                        deckspot = Spots.ShadowStrategyEventDeck,
                        count = 1,
                        player = "Red"
                    }
                )
                if WoME then
                    DrawFromDeck(
                        {
                            deckname = "Faction",
                            deckid = IDs.WoME.ShadowFactionDeck,
                            deckspot = Spots.ShadowFactionDeck,
                            count = 1,
                            player = "Red"
                        }
                    )
                end
            elseif Versus == "1v2" then
                DrawFromDeck(
                    {
                        deckname = "Character Event",
                        deckid = IDs.FreePeoplesCharacterEventDeck,
                        deckspot = Spots.FreePeoplesCharacterEventDeck,
                        count = 1,
                        player = "Blue"
                    }
                )
                DrawFromDeck(
                    {
                        deckname = "Strategy Event",
                        deckid = IDs.FreePeoplesStrategyEventDeck,
                        deckspot = Spots.FreePeoplesStrategyEventDeck,
                        count = 1,
                        player = "Blue"
                    }
                )
                if WoME then
                    DrawFromDeck(
                        {
                            deckname = "Faction",
                            deckid = IDs.WoME.FreePeoplesFactionDeck,
                            deckspot = Spots.FreePeoplesFactionDeck,
                            count = 1,
                            player = "Blue"
                        }
                    )
                end

                if Turn == 1 then
                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.ShadowCharacterEventDeck,
                            deckspot = Spots.ShadowCharacterEventDeck,
                            count = 1,
                            player = "Red"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.ShadowStrategyEventDeck,
                            deckspot = Spots.ShadowStrategyEventDeck,
                            count = 1,
                            player = "Red"
                        }
                    )
                    if WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Red"
                            }
                        )
                    end

                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.ShadowCharacterEventDeck,
                            deckspot = Spots.ShadowCharacterEventDeck,
                            count = 1,
                            player = "Yellow"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.ShadowStrategyEventDeck,
                            deckspot = Spots.ShadowStrategyEventDeck,
                            count = 1,
                            player = "Yellow"
                        }
                    )
                else
                    --draw a shadow faction card for the leading shadow player...
                    if WoME and PlayersLeader.Shadow == "The Witch-king" then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Red"
                            }
                        )
                    elseif WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Yellow"
                            }
                        )
                    end

                    --set next step to prompt shadow players which deck to draw from...
                    NextStep = "Phase1_TheWitchKingDrawMenu"
                end
            else --2v2
                if Turn == 1 then
                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.FreePeoplesCharacterEventDeck,
                            deckspot = Spots.FreePeoplesCharacterEventDeck,
                            count = 1,
                            player = "Blue"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.FreePeoplesStrategyEventDeck,
                            deckspot = Spots.FreePeoplesStrategyEventDeck,
                            count = 1,
                            player = "Blue"
                        }
                    )
                    if WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.FreePeoplesFactionDeck,
                                deckspot = Spots.FreePeoplesFactionDeck,
                                count = 1,
                                player = "Blue"
                            }
                        )
                    end

                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.FreePeoplesCharacterEventDeck,
                            deckspot = Spots.FreePeoplesCharacterEventDeck,
                            count = 1,
                            player = "Green"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.FreePeoplesStrategyEventDeck,
                            deckspot = Spots.FreePeoplesStrategyEventDeck,
                            count = 1,
                            player = "Green"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.ShadowCharacterEventDeck,
                            deckspot = Spots.ShadowCharacterEventDeck,
                            count = 1,
                            player = "Red"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.ShadowStrategyEventDeck,
                            deckspot = Spots.ShadowStrategyEventDeck,
                            count = 1,
                            player = "Red"
                        }
                    )
                    if WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Red"
                            }
                        )
                    end

                    DrawFromDeck(
                        {
                            deckname = "Character Event",
                            deckid = IDs.ShadowCharacterEventDeck,
                            deckspot = Spots.ShadowCharacterEventDeck,
                            count = 1,
                            player = "Yellow"
                        }
                    )
                    DrawFromDeck(
                        {
                            deckname = "Strategy Event",
                            deckid = IDs.ShadowStrategyEventDeck,
                            deckspot = Spots.ShadowStrategyEventDeck,
                            count = 1,
                            player = "Yellow"
                        }
                    )
                else
                    --draw a faction card for each leading player...
                    if PlayersLeader.FreePeoples == "Gondor" and WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.FreePeoplesFactionDeck,
                                deckspot = Spots.FreePeoplesFactionDeck,
                                count = 1,
                                player = "Blue"
                            }
                        )
                    elseif WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.FreePeoplesFactionDeck,
                                deckspot = Spots.FreePeoplesFactionDeck,
                                count = 1,
                                player = "Green"
                            }
                        )
                    end

                    if PlayersLeader.Shadow == "The Witch-king" and WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Red"
                            }
                        )
                    elseif WoME then
                        DrawFromDeck(
                            {
                                deckname = "Faction",
                                deckid = IDs.WoME.ShadowFactionDeck,
                                deckspot = Spots.ShadowFactionDeck,
                                count = 1,
                                player = "Yellow"
                            }
                        )
                    end

                    --set next step to prompt each player which deck to draw from...
                    NextStep = "Phase1_GondorDrawMenu"
                end
            end

            Step = ""
        end
    elseif Step == "Phase1_BotF_FreePeoplesDrawMenu" then
        MoveGamePanel("FreePeoples")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, -0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 0.5, 0.5, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawC1S3",
                function_owner = self,
                label = "Draw: 1 Character + 3 Strategy",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 3 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC2S2",
                function_owner = self,
                label = "Draw: 2 Character + 2 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 2 Character Event Cards and 2 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC3S1",
                function_owner = self,
                label = "Draw: 3 Character + 1 Strategy",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 3 Character Event Cards and 1 Strategy Event Card."
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Free Peoples player draws four Event Cards.\nAll cards must be drawn before looking at them.\nAt least 1 card from each deck must be drawn.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        if Versus == "1v1" then
            NextStep = "Phase1_BotF_ShadowDrawMenu"
        else
            NextStep = "Phase1_BotF_TheWitchKingDrawMenu"
        end

        function DrawC1S3()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.FreePeoplesCharacterEventDeck,
                    deckspot = Spots.FreePeoplesCharacterEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.FreePeoplesStrategyEventDeck, count = 3, player = "Blue" }
            )
            Step = ""
        end

        function DrawC2S2()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.FreePeoplesCharacterEventDeck, count = 2, player = "Blue" }
            )
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.FreePeoplesStrategyEventDeck, count = 2, player = "Blue" }
            )
            Step = ""
        end

        function DrawC3S1()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.FreePeoplesCharacterEventDeck, count = 3, player = "Blue" }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.FreePeoplesStrategyEventDeck,
                    deckspot = Spots.FreePeoplesStrategyEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            Step = ""
        end
    elseif Step == "Phase1_BotF_ShadowDrawMenu" then
        MoveGamePanel("Shadow")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 0, 0 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, 0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 0.5, 0.5 }
            }
        )
        self.createButton(
            {
                click_function = "DrawC1S5",
                function_owner = self,
                label = "Draw: 1 Character + 5 Strategy",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 5 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC2S4",
                function_owner = self,
                label = "Draw: 2 Character + 4 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                tooltip = "Draw 2 Character Event Cards and 4 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC3S3",
                function_owner = self,
                label = "Draw: 3 Character + 3 Strategy",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                tooltip = "Draw 3 Character Event Cards and 3 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC4S2",
                function_owner = self,
                label = "Draw: 4 Character + 2 Strategy",
                position = { 0, 0.1, 0.3 },
                width = 1600,
                height = 150,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                tooltip = "Draw 4 Character Event Cards and 2 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC5S1",
                function_owner = self,
                label = "Draw: 5 Character + 1 Strategy",
                position = { 0, 0.1, 0.6 },
                width = 1600,
                height = 150,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                tooltip = "Draw 5 Character Event Cards and 1 Strategy Event Card."
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Shadow player draws six Event Cards.\nAll cards must be drawn before looking at them.\nAt least 1 card from each deck must be drawn.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        NextStep = "Phase2"
        function DrawC1S5()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.ShadowCharacterEventDeck,
                    deckspot = Spots.ShadowCharacterEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 5, player = "Red" })
            Step = ""
        end

        function DrawC2S4()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 2, player = "Red" }
            )
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 4, player = "Red" })
            Step = ""
        end

        function DrawC3S3()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 3, player = "Red" }
            )
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 3, player = "Red" })
            Step = ""
        end

        function DrawC4S2()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 4, player = "Red" }
            )
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 2, player = "Red" })
            Step = ""
        end

        function DrawC5S1()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 5, player = "Red" }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.ShadowStrategyEventDeck,
                    deckspot = Spots.ShadowStrategyEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            Step = ""
        end
    elseif Step == "Phase1_BotF_GondorDrawMenu" then
        CharacterCardCount = 0
        StrategyCardCount = 0
        --move game panel to player's spot...
        MoveGamePanel("Gondor")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples: Gondor (Blue) Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples\nGondor (Blue) Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, -0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 0.5, 0.5, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawC2S0",
                function_owner = self,
                label = "Draw: 2 Character",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 2 Character Event Cards and 0 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC1S1",
                function_owner = self,
                label = "Draw: 1 Character + 1 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 1 Strategy Event Card."
            }
        )
        self.createButton(
            {
                click_function = "DrawC0S2",
                function_owner = self,
                label = "Draw: 2 Strategy",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 2 Strategy Event Cards and 0 Character Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Free Peoples players draw two Event Cards each.\nAll cards must be drawn before looking at them.\nAt least 1 card out of the 4 total from each deck.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        NextStep = "Phase1_BotF_RohanDrawMenu"
        function DrawC2S0()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.FreePeoplesCharacterEventDeck, count = 2, player = "Blue" }
            )
            CharacterCardCount = 2
            Step = ""
        end

        function DrawC1S1()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.FreePeoplesCharacterEventDeck,
                    deckspot = Spots.FreePeoplesCharacterEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.FreePeoplesStrategyEventDeck,
                    deckspot = Spots.FreePeoplesStrategyEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            CharacterCardCount = 1
            StrategyCardCount = 1
            Step = ""
        end

        function DrawC0S2()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.FreePeoplesStrategyEventDeck, count = 2, player = "Blue" }
            )
            StrategyCardCount = 2
            Step = ""
        end
    elseif Step == "Phase1_BotF_RohanDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("Rohan")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples: Rohan (Green) Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples\nGRohan (Green) Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, -0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 0.5, 1, 0.5 }
            }
        )
        if StrategyCardCount > 0 then
            self.createButton(
                {
                    click_function = "DrawC2S0",
                    function_owner = self,
                    label = "Draw: 2 Character",
                    position = { 0, 0.1, -0.6 },
                    width = 1600,
                    height = 150,
                    color = { 0.7, 0.7, 1 },
                    font_size = 75,
                    tooltip = "Draw 2 Character Event Card and 0 Strategy Event Cards."
                }
            )
        end

        self.createButton(
            {
                click_function = "DrawC1S1",
                function_owner = self,
                label = "Draw: 1 Character + 1 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 1 Strategy Event Card."
            }
        )
        if CharacterCardCount > 0 then
            self.createButton(
                {
                    click_function = "DrawC0S2",
                    function_owner = self,
                    label = "Draw: 2 Strategy",
                    position = { 0, 0.1, 0 },
                    width = 1600,
                    height = 150,
                    color = { 0.7, 0.7, 1 },
                    font_size = 75,
                    tooltip = "Draw 2 Strategy Event Cards and 0 Character Event Cards."
                }
            )
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Free Peoples players draw two Event Cards each.\nAll cards must be drawn before looking at them.\nAt least 1 card out of the 4 total from each deck.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        NextStep = "Phase1_BotF_TheWitchKingDrawMenu"
        function DrawC2S0()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.FreePeoplesCharacterEventDeck, count = 2, player = "Green" }
            )
            Step = ""
        end

        function DrawC1S1()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.FreePeoplesCharacterEventDeck,
                    deckspot = Spots.FreePeoplesCharacterEventDeck,
                    count = 1,
                    player = "Green"
                }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.FreePeoplesStrategyEventDeck,
                    deckspot = Spots.FreePeoplesStrategyEventDeck,
                    count = 1,
                    player = "Green"
                }
            )
            Step = ""
        end

        function DrawC0S2()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.FreePeoplesStrategyEventDeck, count = 2, player = "Green" }
            )
            Step = ""
        end
    elseif Step == "Phase1_BotF_TheWitchKingDrawMenu" then
        CharacterCardCount = 0
        StrategyCardCount = 0
        --move game panel to player's spot...
        MoveGamePanel("TheWitchKing")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow: The Witch-King (Red) Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples\nThe Witch-King (Red) Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, -0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 0.5, 0.5 }
            }
        )
        self.createButton(
            {
                click_function = "DrawC3S0",
                function_owner = self,
                label = "Draw: 3 Character",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 3 Character Event Cards and 0 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC2S1",
                function_owner = self,
                label = "Draw: 2 Character + 1 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 2 Character Event Cards and 1 Strategy Event Card."
            }
        )
        self.createButton(
            {
                click_function = "DrawC1S2",
                function_owner = self,
                label = "Draw: 1 Character + 2 Strategy",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 2 Strategy Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "DrawC0S3",
                function_owner = self,
                label = "Draw: 3 Strategy",
                position = { 0, 0.1, 0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 3 Strategy Event Cards and 0 Character Event Cards."
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Shadow players draw three Event Cards each.\nAll cards must be drawn before looking at them.\nAt least 1 card out of the 6 total from each deck.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        NextStep = "Phase1_BotF_SarumanDrawMenu"
        function DrawC3S0()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 3, player = "Red" }
            )
            CharacterCardCount = 3
            Step = ""
        end

        function DrawC2S1()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 2, player = "Red" }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.ShadowStrategyEventDeck,
                    deckspot = Spots.ShadowStrategyEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            CharacterCardCount = 2
            StrategyCardCount = 1
            Step = ""
        end

        function DrawC1S2()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.ShadowCharacterEventDeck,
                    deckspot = Spots.ShadowCharacterEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 2, player = "Red" })
            CharacterCardCount = 1
            StrategyCardCount = 2
            Step = ""
        end

        function DrawC0S3()
            self.clearButtons()
            DrawFromDeck({ deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 3, player = "Red" })
            StrategyCardCount = 3
            Step = ""
        end
    elseif Step == "Phase1_BotF_SarumanDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("Saruman")
        --choose which card combination to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow: Saruman (Yellow) Player\nDraw Starting Event Cards:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples\nSaruman (Yellow) Player\nis choosing which\nEvent Cards to Draw...",
                position = { 0, -0.1, -0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 0 }
            }
        )
        if StrategyCardCount > 0 then
            self.createButton(
                {
                    click_function = "DrawC3S0",
                    function_owner = self,
                    label = "Draw: 3 Character",
                    position = { 0, 0.1, -0.6 },
                    width = 1600,
                    height = 150,
                    color = { 0.7, 0.7, 1 },
                    font_size = 75,
                    tooltip = "Draw 3 Character Event Cards and 0 Strategy Event Cards."
                }
            )
        end

        self.createButton(
            {
                click_function = "DrawC2S1",
                function_owner = self,
                label = "Draw: 2 Character + 1 Strategy",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 2 Character Event Cards and 1 Strategy Event Card."
            }
        )
        self.createButton(
            {
                click_function = "DrawC1S2",
                function_owner = self,
                label = "Draw: 1 Character + 2 Strategy",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                tooltip = "Draw 1 Character Event Card and 2 Strategy Event Cards."
            }
        )
        if CharacterCardCount > 0 then
            self.createButton(
                {
                    click_function = "DrawC0S3",
                    function_owner = self,
                    label = "Draw: 3 Strategy",
                    position = { 0, 0.1, 0.3 },
                    width = 1600,
                    height = 150,
                    color = { 0.7, 0.7, 1 },
                    font_size = 75,
                    tooltip = "Draw 3 Strategy Event Cards and 0 Character Event Cards."
                }
            )
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label =
                "The Breaking of the Fellowship (Turn 1 Only)\nThe Shadow players draw three Event Cards each.\nAll cards must be drawn before looking at them.\nAt least 1 card out of the 6 total from each deck.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 0 }
            }
        )
        NextStep = "Phase2"
        function DrawC3S0()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 3, player = "Yellow" }
            )
            CharacterCardCount = 3
            Step = ""
        end

        function DrawC2S1()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.ShadowCharacterEventDeck, count = 2, player = "Yellow" }
            )
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.ShadowStrategyEventDeck,
                    deckspot = Spots.ShadowStrategyEventDeck,
                    count = 1,
                    player = "Yellow"
                }
            )
            CharacterCardCount = 2
            StrategyCardCount = 1
            Step = ""
        end

        function DrawC1S2()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.ShadowCharacterEventDeck,
                    deckspot = Spots.ShadowCharacterEventDeck,
                    count = 1,
                    player = "Yellow"
                }
            )
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 2, player = "Yellow" }
            )
            CharacterCardCount = 1
            StrategyCardCount = 2
            Step = ""
        end

        function DrawC0S3()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Strategy Event", deckid = IDs.ShadowStrategyEventDeck, count = 3, player = "Yellow" }
            )
            StrategyCardCount = 3
            Step = ""
        end
    elseif Step == "Phase1_GondorDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("Gondor")
        --prompt player which card to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples: Gondor (Blue) Player\nChoose which type of Event Card to draw:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 0.5, 0.5, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "The Free Peoples\nGondor (Blue) Player\nis deciding which type\nof event card to draw...",
                position = { 0, -0.1, 0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 0.5, 0.5, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawCharacter",
                function_owner = self,
                label = "Draw\nCharacter\nEvent\nCard",
                position = { -0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawStrategy",
                function_owner = self,
                label = "Draw\nStrategy\nEvent\nCard",
                position = { 0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        function DrawCharacter()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.FreePeoplesCharacterEventDeck,
                    deckspot = Spots.FreePeoplesCharacterEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            NextStep = "Phase1_RohanDrawMenu"
            Step = ""
        end

        function DrawStrategy()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.FreePeoplesStrategyEventDeck,
                    deckspot = Spots.FreePeoplesStrategyEventDeck,
                    count = 1,
                    player = "Blue"
                }
            )
            NextStep = "Phase1_RohanDrawMenu"
            Step = ""
        end
    elseif Step == "Phase1_RohanDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("Rohan")
        --prompt player which card to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples: Rohan (Green) Player\nChoose which type of Event Card to draw:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 0, 1, 0 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "The Free Peoples\nRohan (Green) Player\nis deciding which type\nof event card to draw...",
                position = { 0, -0.1, 0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 0, 1, 0 }
            }
        )
        self.createButton(
            {
                click_function = "DrawCharacter",
                function_owner = self,
                label = "Draw\nCharacter\nEvent\nCard",
                position = { -0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawStrategy",
                function_owner = self,
                label = "Draw\nStrategy\nEvent\nCard",
                position = { 0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 0.7, 0.7, 1 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        function DrawCharacter()
            self.clearButtons()
            DrawFromDeck(
                { deckname = "Character Event", deckid = IDs.FreePeoplesCharacterEventDeck, count = 1, player = "Green" }
            )
            NextStep = "Phase1_TheWitchKingDrawMenu"
            Step = ""
        end

        function DrawStrategy()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.FreePeoplesStrategyEventDeck,
                    deckspot = Spots.FreePeoplesStrategyEventDeck,
                    count = 1,
                    player = "Green"
                }
            )
            NextStep = "Phase1_TheWitchKingDrawMenu"
            Step = ""
        end
    elseif Step == "Phase1_TheWitchKingDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("TheWitchKing")
        --prompt player which card to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow: The Witch-king (Red) Player\nChoose which type of Event Card to draw:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 0, 0 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow\nThe Witch-king (Red) Player\nis deciding which type\nof event card to draw...",
                position = { 0, -0.1, 0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 0, 0 }
            }
        )
        self.createButton(
            {
                click_function = "DrawCharacter",
                function_owner = self,
                label = "Draw\nCharacter\nEvent\nCard",
                position = { -0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawStrategy",
                function_owner = self,
                label = "Draw\nStrategy\nEvent\nCard",
                position = { 0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        function DrawCharacter()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.ShadowCharacterEventDeck,
                    deckspot = Spots.ShadowCharacterEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            NextStep = "Phase1_SarumanDrawMenu"
            Step = ""
        end

        function DrawStrategy()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.ShadowStrategyEventDeck,
                    deckspot = Spots.ShadowStrategyEventDeck,
                    count = 1,
                    player = "Red"
                }
            )
            NextStep = "Phase1_SarumanDrawMenu"
            Step = ""
        end
    elseif Step == "Phase1_SarumanDrawMenu" then
        --move game panel to player's spot...
        MoveGamePanel("Saruman")
        --prompt player which card to draw...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow: Saruman (Yellow) Player\nChoose which type of Event Card to draw:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 0 }
            }
        )
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow\nSaruman (Yellow) Player\nis deciding which type\nof event card to draw...",
                position = { 0, -0.1, 0 },
                rotation = { 180, 180, 0 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 0 }
            }
        )
        self.createButton(
            {
                click_function = "DrawCharacter",
                function_owner = self,
                label = "Draw\nCharacter\nEvent\nCard",
                position = { -0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "DrawStrategy",
                function_owner = self,
                label = "Draw\nStrategy\nEvent\nCard",
                position = { 0.75, 0.1, 0 },
                rotation = { 0, 0, 0 },
                width = 500,
                height = 900,
                color = { 1, 0.5, 0.5 },
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        function DrawCharacter()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Character Event",
                    deckid = IDs.ShadowCharacterEventDeck,
                    deckspot = Spots.ShadowCharacterEventDeck,
                    count = 1,
                    player = "Yellow"
                }
            )
            NextStep = "Phase2"
            Step = ""
        end

        function DrawStrategy()
            self.clearButtons()
            DrawFromDeck(
                {
                    deckname = "Strategy Event",
                    deckid = IDs.ShadowStrategyEventDeck,
                    deckspot = Spots.ShadowStrategyEventDeck,
                    count = 1,
                    player = "Yellow"
                }
            )
            NextStep = "Phase2"
            Step = ""
        end
    elseif Step == "Phase2" then --Fellowship Phase
        Phase = 2
        Global.setVar("Phase", Phase)
        printToAll("Phase 2) Fellowship Phase.")
        Global.call("FellowshipMenu")
        MoveGamePanel("All")
        --display info on panel...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 2) Fellowship Phase",
                position = { 0, 0.1, -1.4 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        local Phase2Text =
        "Free Peoples may now:\n\nDeclare the position of the Fellowship.\nChange the Guide of the Fellowship."
        if BotF then
            Phase2Text =
            "Free Peoples may now:\n\nDeclare the position of the Fellowship.\n\n(The Fellowship is Broken, Gollum is the Guide)."
        elseif Turn == 1 and LoME and not BotF then
            Phase2Text =
                Phase2Text ..
                "\n\nThis turn only (Turn 1), Free Peoples may (if eligible):\n\nDeclare Meriadoc outside the Fellowship (The Shire).\n  Declare Peregrin outside the Fellowship (The Shire).\n  Declare Boromir outside the Fellowship (Minas Tirith).\n  Declare Gimli outside the Fellowship (Erebor).\n  Declare Legolas outside the Fellowship (Woodland Realm)."
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = Phase2Text,
                position = { 0, 0.1, -0.1 },
                width = 0,
                height = 0,
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.2 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1.2 },
                font_size = 100,
                tooltip = "Click Continue when Phase 2 steps are complete."
            }
        )
        function Continue()
            NextStep = "Phase3"
            --Turn 1 with LoME?
            if Turn == 1 and LoME then
                if getObjectFromGUID(IDs.LoME.ShadowToken1) == nil or getObjectFromGUID(IDs.LoME.ShadowToken2) == nil then
                    printToAll("UHOH! Couldn't find the Shadow Tokens!\nNo Shadow Tokens could be assigned.")
                    Step = ""
                elseif BotF then
                    printToAll(
                        "Shadow Tokens from Lords of Middle-Earth are not used in the Breaking of the Fellowship scenario."
                    )
                    Step = ""
                else                    --look for seperated companions...
                    FellowshipCount = 8 --start with 8 in the fellowship.
                    local TokenCount = 0
                    if not InFellowship({ Name = "Meriadoc" }) then
                        TokenCount = TokenCount + 1
                        FellowshipCount = FellowshipCount - 1
                    end

                    if not InFellowship({ Name = "Peregrin" }) then
                        TokenCount = TokenCount + 1
                        FellowshipCount = FellowshipCount - 1
                    end

                    if not InFellowship({ Name = "Boromir" }) then
                        TokenCount = TokenCount + 1
                        FellowshipCount = FellowshipCount - 1
                    end

                    if not InFellowship({ Name = "Gimli" }) then
                        TokenCount = TokenCount + 1
                        FellowshipCount = FellowshipCount - 1
                    end

                    if not InFellowship({ Name = "Legolas" }) then
                        TokenCount = TokenCount + 1
                        FellowshipCount = FellowshipCount - 1
                    end

                    printToAll(TokenCount .. " Companions were found outside the Fellowship Box.")
                    if TokenCount == 0 then
                        printToAll(
                            "The Shadow receive no Shadow Tokens. (There were no Companions declared outside the Fellowship)."
                        )
                        getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.LoME.ShadowToken1))
                        getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.LoME.ShadowToken2))
                        Step = ""
                    elseif TokenCount == 1 then
                        printToAll(
                            "The Shadow chooses 1 Shadow Token. (There was 1 Companion declared outside the Fellowship)."
                        )
                        MoveGamePanel("Shadow")
                        self.clearButtons()
                        self.createButton(
                            {
                                click_function = "Nothing",
                                function_owner = self,
                                label = "Shadow Player: Choose 1 Shadow Token:",
                                position = { 0, 0.1, -1.3 },
                                width = 0,
                                height = 0,
                                font_size = 100,
                                font_color = { 1, 1, 1 }
                            }
                        )
                        self.createButton(
                            {
                                click_function = "Nothing",
                                function_owner = self,
                                label = "Shadow is choosing\na Shadow Token...",
                                position = { 0, -0.1, 0 },
                                rotation = { 180, 180, 0 },
                                width = 0,
                                height = 0,
                                font_size = 150,
                                font_color = { 1, 0.5, 0.5 }
                            }
                        )
                        self.createButton(
                            {
                                click_function = "ChooseShadowToken1",
                                function_owner = self,
                                label = "Move Nazgul and Minions (Shadow Token)",
                                position = { 0, 0.1, -0.3 },
                                width = 1500,
                                height = 250,
                                font_size = 75,
                                color = { 1, 0, 0 },
                                font_color = { 1, 1, 0 },
                                tooltip = "Choose the Shadow Token that can Move Nazgul and Minions."
                            }
                        )
                        self.createButton(
                            {
                                click_function = "ChooseShadowToken2",
                                function_owner = self,
                                label = "Advance a Shadow Nation on the\nPolitical Track (Shadow Token)",
                                position = { 0, 0.1, 0.3 },
                                width = 1500,
                                height = 250,
                                font_size = 75,
                                color = { 1, 0, 0 },
                                font_color = { 1, 1, 0 },
                                tooltip =
                                "Choose the Shadow Token that can Advance a Shadow Nation on the\nPolitical Track."
                            }
                        )
                        function ChooseShadowToken1()
                            self.clearButtons()
                            getObjectFromGUID(IDs.LoME.ShadowToken1).setPositionSmooth({ 12.5, 1.02, -29 }, false, true)
                            getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.LoME.ShadowToken2))
                            Step = ""
                        end

                        function ChooseShadowToken2()
                            self.clearButtons()
                            getObjectFromGUID(IDs.LoME.ShadowToken2).setPositionSmooth({ 12.5, 1.02, -29 }, false, true)
                            getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.LoME.ShadowToken1))
                            Step = ""
                        end
                    else --shadow gets both tokens...
                        printToAll(
                            "The Shadow receive both Shadow Tokens. (There were 2 or more Companions declared outside the Fellowship)."
                        )
                        getObjectFromGUID(IDs.LoME.ShadowToken1).setPositionSmooth({ 12.5, 1.02, -29 }, false, true)
                        getObjectFromGUID(IDs.LoME.ShadowToken2).setPositionSmooth({ 12.5, 1.02, -31 }, false, true)
                        Step = ""
                    end
                end
            else
                Step = ""
            end
        end
    elseif Step == "Phase3" then --Hunt Allocation
        Phase = 3
        Global.setVar("Phase", Phase)
        printToAll("Phase 3) Hunt Allocation.")
        MoveGamePanel("All")
        --display info on panel...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 3) Hunt Allocation.",
                position = { 0, 0.1, -1.4 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        FellowshipCount = #GetFellowshipCompanions()
        local MinimumAllocation = 0
        local MaximumAllocation = FellowshipCount
        if FreePeoplesHuntDiceCount > 0 then
            MinimumAllocation = 1
        end

        if MaximumAllocation < 1 then
            MaximumAllocation = 1
        end

        local Phase3Text =
            "The Shadow may allocate Action Dice to the Hunt Box.\n(Minimum: " ..
            MinimumAllocation .. ", Maximum: " .. MaximumAllocation .. ")\n"
        if FreePeoplesHuntDiceCount > 0 then
            Phase3Text =
                Phase3Text ..
                "FreePeoples recovered " .. FreePeoplesHuntDiceCount .. " Action Dice from the previous turn.\n"
            Phase3Text = Phase3Text .. "so the Shadow must allocate at least 1 in the Hunt Box.\n"
        end

        Phase3Text = Phase3Text .. "\nThere are " .. FellowshipCount .. " Companions in the Fellowship.\n"
        if FellowshipCount < 1 then
            Phase3Text = Phase3Text .. "The Shadow can always place at least 1 die in the Hunt Box."
        else
            Phase3Text =
                Phase3Text .. "The the Shadow cannot allocate more than " .. FellowshipCount .. " in the Hunt Box."
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = Phase3Text,
                position = { 0, 0.1, -0.1 },
                width = 0,
                height = 0,
                font_size = 75,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.2 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1.2 },
                font_size = 100,
                tooltip = "Click Continue when Phase 3 steps are complete."
            }
        )
        HuntBoxShadowDiceArray = {}
        HuntBoxFreePeoplesDiceArray = {}

        if FreePeoplesHuntDiceCount > 0 then
            --allocate the first Shadow dice to the hunt box...
            local shadowDiceId = IDs.ShadowActionDice[1]
            HuntBoxShadowDiceArray = { shadowDiceId }

            local shadowDice = getObjectFromGUID(shadowDiceId)
            shadowDice.setPositionSmooth(Spots.ShadowHuntBoxDice[1], false, false)
            shadowDice.setRotation({ 90, 0, 0 })
        end

        function Continue()
            NextStep = "Phase4"
            Step = ""
        end
    elseif Step == "Phase4" then --Action Roll
        Phase = 4
        Global.setVar("Phase", Phase)
        printToAll("Phase 4) Action Roll.")
        MoveGamePanel("All")
        --display info on panel...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 4) Action Roll.",
                position = { 0, 0.1, -1.4 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "PerformPhase4",
                function_owner = self,
                label = "Perform Phase 4:\nRoll Action Dice.",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 400,
                color = { 1, 1, 1 },
                font_size = 100,
                tooltip = "Click to roll all Action Dice in the Dice Boxes."
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.2 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100
            }
        )
        function PerformPhase4()
            self.clearButtons()
            startLuaCoroutine(self, "RollActionDiceCoroutine")
            --auto advance to next step after 2 seconds...
            NextStep = "Phase5"
            Wait.time(
                function ()
                    Step = ""
                end,
                2
            )
        end

        function Continue()
            NextStep = "Phase5"
            Step = ""
        end
    elseif Step == "Phase5" then --Action Resolution
        Phase = 5
        Global.setVar("Phase", Phase)
        printToAll("Phase 5) Action Resolution.")
        MoveGamePanel("All")
        --display info on panel...
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 5) Action Resolution.",
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.2 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100
            }
        )
        function Continue()
            NextStep = "Phase6"
            Step = ""
        end
    elseif Step == "Phase6" then --Victory Check
        Phase = 6
        Global.setVar("Phase", Phase)
        printToAll("Phase 6) Victory Check.")
        MoveGamePanel("All")
        --display info on panel...
        self.clearButtons()
        FellowshipTrack = math.floor((getObjectFromGUID("6b62ef").getPosition().x - 5.0) / 1.58)
        CorruptionTrack = math.floor((getObjectFromGUID("abe1b3").getPosition().x - 5.0) / 1.58)
        ShadowVP = math.floor((getObjectFromGUID("976dbc").getPosition().x + 23.65) / 1.64)
        FreePeoplesVP = math.floor((getObjectFromGUID("d0b340").getPosition().x + 23.65) / 1.64)
        if FellowshipTrack < 0 then
            FellowshipTrack = 0
        elseif FellowshipTrack > 12 then
            FellowshipTrack = 12
        end

        if CorruptionTrack < 0 then
            CorruptionTrack = 0
        elseif CorruptionTrack > 12 then
            CorruptionTrack = 12
        end

        if ShadowVP < 0 then
            ShadowVP = 0
        elseif ShadowVP > 10 then
            ShadowVP = 10
        end

        if FreePeoplesVP < 0 then
            FreePeoplesVP = 0
        elseif FreePeoplesVP > 10 then
            FreePeoplesVP = 10
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Phase 6) Victory Check.\n\nFellowship Track: " ..
                    FellowshipTrack ..
                    " of 12\nCorruption Track: " ..
                    CorruptionTrack ..
                    " of 12\n\nShadow Victory Points: " ..
                    ShadowVP .. " of 10\nFree Peoples Victory Points: " .. FreePeoplesVP .. " of 4",
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.2 },
                width = 1600,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100
            }
        )
        --check military victory...
        if ShadowVP >= 10 then
            --isengard...
            broadcastToAll("Shadow Military Victory Detected!", { 1, 1, 0 })
            Global.call("PlaySound", { ID = 5 })
        elseif FreePeoplesVP >= 4 then
            broadcastToAll("Free Peoples Military Victory Detected!", { 1, 1, 0 })
            Global.call("PlaySound", { ID = 3 })
            --riders of rohan...
        end

        function Continue()
            NextStep = "EndTurn"
            Step = ""
        end
    elseif Step == "EndTurn" then
        --end of turn stuff here...
        --advance to next step...
        NextStep = "StartTurn"
        Step = ""
    elseif Step == "BasicMenu" then
        self.clearButtons()
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Basic Scripts:",
                position = { 0, 0.1, -1.2 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "BasicGatherActionDice",
                function_owner = self,
                label = "Gather Action Dice",
                position = { 0, 0.1, -0.9 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip = "Gather Action Dice for all players and increment the round count by 1."
            }
        )
        self.createButton(
            {
                click_function = "BasicRollActionDice",
                function_owner = self,
                label = "Roll Action Dice",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip = "Roll Action Dice."
            }
        )
        if CompactMode then
            self.createButton(
                {
                    click_function = "BasicGatherActionDice",
                    function_owner = self,
                    label = "Gather Action Dice",
                    position = { 5.45, 54.5, 1.72 },
                    rotation = { 90, 270, 0 },
                    scale = { 2, 0.5, 0.5 },
                    width = 1000,
                    height = 100,
                    color = { 1, 1, 1 },
                    font_size = 100,
                    tooltip = "Gather Action Dice for all players and increment the round count by 1."
                }
            )
            self.createButton(
                {
                    click_function = "BasicRollActionDice",
                    function_owner = self,
                    label = "Roll Action Dice",
                    position = { 5.65, 54.5, 1.72 },
                    rotation = { 90, 270, 0 },
                    scale = { 2, 0.5, 0.5 },
                    width = 1000,
                    height = 100,
                    color = { 1, 1, 1 },
                    font_size = 100,
                    tooltip = "Roll Action Dice for all players."
                }
            )
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Round: " .. Round,
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "IncRound",
                function_owner = self,
                label = "+",
                position = { 0.75, 0.1, 1 },
                color = { 1, 1, 1 },
                width = 100,
                height = 100,
                font_size = 100,
                font_color = { 0, 0, 0 },
                tooltip =
                "Increment round count by 1.\n(Clicking Gather Action Dice automatically increments the round count)."
            }
        )
        self.createButton(
            {
                click_function = "DecRound",
                function_owner = self,
                label = "-",
                position = { -0.75, 0.1, 1 },
                color = { 1, 1, 1 },
                width = 100,
                height = 100,
                font_size = 100,
                font_color = { 0, 0, 0 },
                tooltip = "Decrement round count by 1."
            }
        )
        function BasicGatherActionDice()
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Gathering Action Dice...",
                    position = { 0, 0.1, -0.5 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            Round = Round + 1
            NextStep = "BasicMenu"
            startLuaCoroutine(self, "GatherActionDiceCoroutine")
            Wait.time(
                function ()
                    Step = ""
                end,
                2
            )
        end

        function BasicRollActionDice()
            self.clearButtons()
            self.createButton(
                {
                    click_function = "Nothing",
                    function_owner = self,
                    label = "Rolling Action Dice...",
                    position = { 0, 0.1, -0.5 },
                    width = 0,
                    height = 0,
                    font_size = 100,
                    font_color = { 1, 1, 1 }
                }
            )
            NextStep = "BasicMenu"
            startLuaCoroutine(self, "RollActionDiceCoroutine")
            Wait.time(
                function ()
                    Step = ""
                end,
                2
            )
        end

        function IncRound()
            Round = Round + 1
            Step = ""
        end

        function DecRound()
            Round = Round - 1
            if Round < 1 then
                Round = 1
            end

            Step = ""
        end
    elseif Step == "KillGamePanel" then
        Global.setVar("Scripting", false)
        printToAll("The Game Panel is deleted.  Scripting is disabled.")
        self.destruct()
    end

    return 1
end

function CreateBeginMenu()
    LoME = false
    WoME = false
    self.clearButtons()
    MoveGamePanel("All")
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Blue Seat\nFree Peoples Player 1 (Gondor)",
            position = { -7.6, 79, 1.7 },
            rotation = { 90, 90, 0 },
            scale = { 4, 1, 1 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 0.4, 0.4, 1 }
        }
    )
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Red Seat\nShadow Player 1 (Witch-King)",
            position = { 7.6, 28, 1.7 },
            rotation = { 90, 270, 0 },
            scale = { 4, 1, 1 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 1, 0, 0 }
        }
    )
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Yellow Seat\nShadow Player 2 (Saruman)",
            position = { 7.6, 79, 1.7 },
            rotation = { 90, 270, 0 },
            scale = { 4, 1, 1 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 1, 1, 0 }
        }
    )
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Green Seat\nFree Peoples Player 2 (Rohan)",
            position = { -7.6, 28, 1.7 },
            rotation = { 90, 90, 0 },
            scale = { 4, 1, 1 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 0, 1, 0 }
        }
    )

    if Player.Red.steam_name ~= nil then
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow (Player 1): " .. Player.Red.steam_name,
                position = { 0, 0.1, -0.6 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 0.4, 0.4 }
            }
        )
    else
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow (Player 1): Choose red seat",
                position = { 0, 0.1, -0.6 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 0.4, 0.4 }
            }
        )
    end

    if Player.Blue.steam_name ~= nil then
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples (Player 2): " .. Player.Blue.steam_name,
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 0.4, 0.4, 1 }
            }
        )
    else
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples (Player 2): Choose blue seat",
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 0.4, 0.4, 1 }
            }
        )
    end

    if Player.Yellow.steam_name ~= nil then
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow (Player 3): " .. Player.Yellow.steam_name,
                position = { 0, 0.1, -0.4 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 0.4 }
            }
        )
    end

    if Player.Green.steam_name ~= nil then
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Free Peoples (Player 4): " .. Player.Green.steam_name,
                position = { 0, 0.1, 0.2 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 0.4, 1, 0.4 }
            }
        )
    end

    self.createButton(
        {
            click_function = "ClickBegin",
            function_owner = self,
            label = "Begin the Journey",
            position = { 0, 0.1, 0.75 },
            width = 1500,
            height = 300,
            font_size = 175,
            color = { 1, 1, 1 },
            tooltip = "Start setting up the game with Scripted assistance."
        }
    )

    self.createButton(
        {
            click_function = "ClickNoScripting",
            function_owner = self,
            label = "No Scripting Please",
            position = { -0.8, 0.1, 1.4 },
            width = 600,
            height = 100,
            font_size = 50,
            color = { 1, 1, 1 },
            tooltip = "Turn off scripting."
        }
    )

    if Global.getVar("Mute") then
        self.createButton(
            {
                click_function = "ToggleMute",
                function_owner = self,
                label = "Sound Effects: OFF",
                position = { 0.8, 0.1, 1.4 },
                width = 600,
                height = 100,
                font_size = 50,
                color = { 1, 1, 1 },
                tooltip = "Click to toggle Sound Effects ON."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleMute",
                function_owner = self,
                label = "Sound Effects: ON",
                position = { 0.8, 0.1, 1.4 },
                width = 600,
                height = 100,
                font_size = 50,
                color = { 1, 1, 0 },
                tooltip = "Click to toggle Sound Effects OFF."
            }
        )
    end

    function ClickBegin()
        self.clearButtons()
        --Music Violin
        Global.call("PlaySound", { ID = 0 })
        NextStep = "PlayersMenu"
        Step = ""
    end

    function ClickNoScripting()
        self.clearButtons()
        NextStep = "KillGamePanel"
        Step = ""
    end

    function ToggleMute()
        self.clearButtons()
        if getObjectFromGUID(Global.getVar("SoundCubeID")) == nil then
            printToAll("Sound Cube is missing so sounds are Muted.")
            Global.setVar("Mute", true)
        else
            if Global.getVar("Mute") then
                Global.setVar("Mute", false)
                getObjectFromGUID(Global.getVar("SoundCubeID")).setDescription("SoundCube;")
            else
                Global.setVar("Mute", true)
                getObjectFromGUID(Global.getVar("SoundCubeID")).setDescription("SoundCube;Muted;")
            end
        end

        getObjectFromGUID(Global.getVar("SoundCubeID")).call("Menu")
        NextStep = "BeginMenu"
        Step = ""
    end
end

function CreatePlayersMenu()
    self.clearButtons()
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "How Many Players?",
            position = { 0, 0.1, -1.2 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 1, 1, 1 }
        }
    )

    if Versus == "1v1" then
        self.createButton(
            {
                click_function = "Choose1v1",
                function_owner = self,
                label = "2-Player (1 vs 1)",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 75,
                tooltip = "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v2",
                function_owner = self,
                label = "3-Player (1 vs 2)",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Witch-king (the Sauron Nation)\nPlayer 3 (Yellow): Saruman & Allies (Isengard and Southron & Easterling Nations)"
            }
        )
        self.createButton(
            {
                click_function = "Choose2v2",
                function_owner = self,
                label = "4-Player (2 vs 2)",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): Gondor (Gondor,Elves)\nPlayer 2 (Green): Rohan (Rohan,North,Dwarves)\n    vs.\nPlayer 3 (Red): The Witch-king (Sauron)\nPlayer 4 (Yellow): Saruman & Allies (Isengard,Southrons & Easterlings)"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v1Compact",
                function_owner = self,
                label = "2-Player (Compact Mode)",
                position = { 0, 0.1, 0.5 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow\n\nCompact Mode: Rearrange the layout the way Mr. Thorpe prefers\n(Players sit next to each other)."
            }
        )
    elseif Versus == "1v2" then
        self.createButton(
            {
                click_function = "Choose1v1",
                function_owner = self,
                label = "2-Player (1 vs 1)",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip = "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v2",
                function_owner = self,
                label = "3-Player (1 vs 2)",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Witch-king (the Sauron Nation)\nPlayer 3 (Yellow): Saruman & Allies (Isengard and Southron & Easterling Nations)"
            }
        )
        self.createButton(
            {
                click_function = "Choose2v2",
                function_owner = self,
                label = "4-Player (2 vs 2)",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): Gondor (Gondor,Elves)\nPlayer 2 (Green): Rohan (Rohan,North,Dwarves)\n    vs.\nPlayer 3 (Red): The Witch-king (Sauron)\nPlayer 4 (Yellow): Saruman & Allies (Isengard,Southrons & Easterlings)"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v1Compact",
                function_owner = self,
                label = "2-Player (Compact Mode)",
                position = { 0, 0.1, 0.5 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow\n\nCompact Mode: Rearrange the layout the way Mr. Thorpe prefers\n(Players sit next to each other)."
            }
        )
    elseif Versus == "2v2" then
        self.createButton(
            {
                click_function = "Choose1v1",
                function_owner = self,
                label = "2-Player (1 vs 1)",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip = "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v2",
                function_owner = self,
                label = "3-Player (1 vs 2)",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Witch-king (the Sauron Nation)\nPlayer 3 (Yellow): Saruman & Allies (Isengard and Southron & Easterling Nations)"
            }
        )
        self.createButton(
            {
                click_function = "Choose2v2",
                function_owner = self,
                label = "4-Player (2 vs 2)",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): Gondor (Gondor,Elves)\nPlayer 2 (Green): Rohan (Rohan,North,Dwarves)\n    vs.\nPlayer 3 (Red): The Witch-king (Sauron)\nPlayer 4 (Yellow): Saruman & Allies (Isengard,Southrons & Easterlings)"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v1Compact",
                function_owner = self,
                label = "2-Player (Compact Mode)",
                position = { 0, 0.1, 0.5 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow\n\nCompact Mode: Rearrange the layout the way Mr. Thorpe prefers\n(Players sit next to each other)."
            }
        )
    elseif Versus == "1v1 Compact Mode" then
        self.createButton(
            {
                click_function = "Choose1v1",
                function_owner = self,
                label = "2-Player (1 vs 1)",
                position = { 0, 0.1, -0.6 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip = "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v2",
                function_owner = self,
                label = "3-Player (1 vs 2)",
                position = { 0, 0.1, -0.3 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Witch-king (the Sauron Nation)\nPlayer 3 (Yellow): Saruman & Allies (Isengard and Southron & Easterling Nations)"
            }
        )
        self.createButton(
            {
                click_function = "Choose2v2",
                function_owner = self,
                label = "4-Player (2 vs 2)",
                position = { 0, 0.1, 0 },
                width = 1600,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): Gondor (Gondor,Elves)\nPlayer 2 (Green): Rohan (Rohan,North,Dwarves)\n    vs.\nPlayer 3 (Red): The Witch-king (Sauron)\nPlayer 4 (Yellow): Saruman & Allies (Isengard,Southrons & Easterlings)"
            }
        )
        self.createButton(
            {
                click_function = "Choose1v1Compact",
                function_owner = self,
                label = "2-Player (Compact Mode)",
                position = { 0, 0.1, 0.5 },
                width = 1600,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 75,
                tooltip =
                "Player 1 (Blue): The Free Peoples\n    vs.\nPlayer 2 (Red): The Shadow\n\nCompact Mode: Rearrange the layout the way Mr. Thorpe prefers\n(Players sit next to each other)."
            }
        )
    end

    self.createButton(
        {
            click_function = "Continue",
            function_owner = self,
            label = "Continue (" .. Versus .. ")",
            position = { 0, 0.1, 1 },
            width = 1600,
            height = 200,
            color = { 1, 1, 1 },
            font_size = 100
        }
    )

    function Choose1v1()
        self.clearButtons()
        Versus = "1v1"
        CompactMode = false
        NextStep = "PlayersMenu"
        Step = ""
    end

    function Choose1v2()
        self.clearButtons()
        Versus = "1v2"
        CompactMode = false
        NextStep = "PlayersMenu"
        Step = ""
    end

    function Choose2v2()
        self.clearButtons()
        Versus = "2v2"
        CompactMode = false
        NextStep = "PlayersMenu"
        Step = ""
    end

    function Choose1v1Compact()
        self.clearButtons()
        Versus = "1v1 Compact Mode"
        CompactMode = true
        NextStep = "PlayersMenu"
        Step = ""
    end

    function Continue()
        self.clearButtons()
        NextStep = "ExpansionMenu"
        CompactMode = Versus == "1v1 Compact Mode"
        Global.setVar("CompactMode", CompactMode)

        --update here so BotF can benefit if it is used...
        if CompactMode then
            local GlobalSpots = Global.getTable("Spots")
            GlobalSpots.CompanionCards.Separated = GlobalSpots.Compact.CompanionCards.Separated
            GlobalSpots.CompanionCards.Searched = GlobalSpots.Compact.CompanionCards.Searched
            Global.setTable("Spots", GlobalSpots)
            Spots.ShadowDiceBox = Spots.CompactShadowUsedDice
            Spots.FreePeoplesDiceBox = Spots.CompactFreePeoplesUsedDice
            FlagString = FlagString .. "Compact;"
        end

        if Versus == "1v1" or Versus == "1v1 Compact Mode" then
            --remove Yellow Label
            --remove Green and Yellow hand zones...
            getObjectFromGUID("588435").destruct()
            --remove green hand
            getObjectFromGUID("71d77a").destruct()
            --remove yellow hand
            getObjectFromGUID("c6a821").destruct()
            --remove Blue Label
            getObjectFromGUID("a3fdbb").destruct()
            --remove Green Label
            getObjectFromGUID("c2de22").destruct()
            --remove Red Label
            getObjectFromGUID("039537").destruct()
        elseif Versus == "1v2" then
            --remove Green hand zone...
            getObjectFromGUID("588435").destruct()
            --remove green hand
            getObjectFromGUID("c6a821").destruct()
            --remove Blue Label
            getObjectFromGUID("a3fdbb").destruct()
            --remove Green Label
        end

        Step = ""
    end
end

function CreateExpansionMenu()
    self.clearButtons()
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Expansion Content?",
            position = { 0, 0.1, -1.3 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 1, 1, 1 }
        }
    )

    if LoME then
        self.createButton(
            {
                click_function = "ToggleLoME",
                function_owner = self,
                label = "Included: Lords of Middle-Earth",
                position = { 0, 0.1, -0.9 },
                width = 1800,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 80,
                tooltip = "Click to exclude."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleLoME",
                function_owner = self,
                label = "Excluded: Lords of Middle-Earth",
                position = { 0, 0.1, -0.9 },
                width = 1800,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 80,
                tooltip = "Click to include."
            }
        )
    end

    if WoME then
        self.createButton(
            {
                click_function = "ToggleWoME",
                function_owner = self,
                label = "Included: Warriors of Middle-Earth",
                position = { 0, 0.1, -0.6 },
                width = 1800,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 80,
                tooltip = "Click to exclude."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleWoME",
                function_owner = self,
                label = "Excluded: Warriors of Middle-Earth",
                position = { 0, 0.1, -0.6 },
                width = 1800,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 80,
                tooltip = "Click to include."
            }
        )
    end

    if KoME then
        self.createButton(
            {
                click_function = "ToggleKoME",
                function_owner = self,
                label = "Included: Kings of Middle-Earth",
                position = { 0, 0.1, -0.3 },
                width = 1800,
                height = 150,
                color = { 1, 1, 0 },
                font_size = 80,
                tooltip = "Click to exclude."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleKoME",
                function_owner = self,
                label = "Excluded: Kings of Middle-Earth",
                position = { 0, 0.1, -0.3 },
                width = 1800,
                height = 150,
                color = { 1, 1, 1 },
                font_size = 80,
                tooltip = "Click to include."
            }
        )
    end

    if BotF then
        self.createButton(
            {
                click_function = "ToggleBotF",
                function_owner = self,
                label = "Included: The Breaking of the Fellowship",
                position = { 0, 0.1, 0.05 },
                width = 1400,
                height = 100,
                color = { 1, 1, 0 },
                font_size = 70,
                tooltip = "Click to exclude: The Breaking of the Fellowship (a mini-expansion)."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleBotF",
                function_owner = self,
                label = "Excluded: The Breaking of the Fellowship",
                position = { 0, 0.1, 0.05 },
                width = 1400,
                height = 100,
                color = { 1, 1, 1 },
                font_size = 70,
                tooltip = "Click to include: The Breaking of the Fellowship (a mini-expansion)."
            }
        )
    end

    if HftR then
        self.createButton(
            {
                click_function = "ToggleHftR",
                function_owner = self,
                label = "Included: The Hunt for the Ring",
                position = { 0, 0.1, 0.35 },
                width = 1400,
                height = 100,
                color = { 1, 1, 0 },
                font_size = 70,
                tooltip = "Click to exclude.\nTThis is a mini-expansion from The Hunt for the Ring."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleHftR",
                function_owner = self,
                label = "Excluded: The Hunt for the Ring",
                position = { 0, 0.1, 0.35 },
                width = 1400,
                height = 100,
                color = { 1, 1, 1 },
                font_size = 70,
                tooltip = "Click to include.\nThis is a mini-expansion from The Hunt for the Ring."
            }
        )
    end

    if TFoE then
        self.createButton(
            {
                click_function = "ToggleTFoE",
                function_owner = self,
                label = "Included: The Fate of Erebor",
                position = { 0, 0.1, 0.65 },
                width = 1400,
                height = 100,
                color = { 1, 1, 0 },
                font_size = 70,
                tooltip = "Click to exclude.\nThe Fate of Erebor is a mini-expansion from the Battle of the Five Armies."
            }
        )
    else
        self.createButton(
            {
                click_function = "ToggleTFoE",
                function_owner = self,
                label = "Excluded: The Fate of Erebor",
                position = { 0, 0.1, 0.65 },
                width = 1400,
                height = 100,
                color = { 1, 1, 1 },
                font_size = 70,
                tooltip = "Click to include.\nThe Fate of Erebor is a mini-expansion from the Battle of the Five Armies."
            }
        )
    end

    self.createButton(
        {
            click_function = "Continue",
            function_owner = self,
            label = "Continue",
            position = { 0, 0.1, 1.3 },
            width = 1800,
            height = 200,
            color = { 1, 1, 1 },
            font_size = 100
        }
    )

    function ToggleLoME()
        LoME = not LoME
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function ToggleWoME()
        WoME = not WoME
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function ToggleKoME()
        KoME = not KoME
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function ToggleBotF()
        BotF = not BotF
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function ToggleTFoE()
        TFoE = not TFoE
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function ToggleHftR()
        HftR = not HftR
        NextStep = "ExpansionMenu"
        Step = ""
    end

    function Continue()
        self.clearButtons()
        NextStep = "HuntForTheRingMenu"
        Step = ""
    end
end

function CreateHuntForTheRingMenu()
    self.clearButtons()
    SPTCount = 0
    FPTCount = 0

    if HftR then
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Hunt for the Ring",
                position = { 0, 0.1, -1.3 },
                width = 0,
                height = 0,
                font_size = 150,
                font_color = { 1, 1, 1 }
            }
        )
        if HftRSPT1 then
            SPTCount = SPTCount + 1
            self.createButton(
                {
                    click_function = "ToggleHftRSPT1",
                    function_owner = self,
                    label = "Included: Shadow Token (Advance political track)",
                    position = { 0, 0.1, -0.8 },
                    width = 1800,
                    height = 150,
                    color = { 1, 0.4, 0.4 },
                    font_color = { 1, 1, 0 },
                    font_size = 70,
                    tooltip = "Click to exclude this token."
                }
            )
        else
            self.createButton(
                {
                    click_function = "ToggleHftRSPT1",
                    function_owner = self,
                    label = "Excluded: Shadow Token (Advance political track)",
                    position = { 0, 0.1, -0.8 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 70,
                    tooltip = "Click to include this token."
                }
            )
        end

        if HftRSPT2 then
            SPTCount = SPTCount + 1
            self.createButton(
                {
                    click_function = "ToggleHftRSPT2",
                    function_owner = self,
                    label = "Included: Shadow Token (Move Nazgul and minions)",
                    position = { 0, 0.1, -0.5 },
                    width = 1800,
                    height = 150,
                    color = { 1, 0.4, 0.4 },
                    font_color = { 1, 1, 0 },
                    font_size = 70,
                    tooltip = "Click to exclude this token."
                }
            )
        else
            self.createButton(
                {
                    click_function = "ToggleHftRSPT2",
                    function_owner = self,
                    label = "Excluded: Shadow Token (Move Nazgul and minions)",
                    position = { 0, 0.1, -0.5 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 70,
                    tooltip = "Click to include this token."
                }
            )
        end

        if HftRFPT1 then
            FPTCount = FPTCount + 1
            self.createButton(
                {
                    click_function = "ToggleHftRFPT1",
                    function_owner = self,
                    label = "Included: Free Peoples Token (Advance political track)",
                    position = { 0, 0.1, 0 },
                    width = 1800,
                    height = 150,
                    color = { 0.4, 0.4, 1 },
                    font_color = { 1, 1, 0 },
                    font_size = 70,
                    tooltip = "Click to exclude this token."
                }
            )
        else
            self.createButton(
                {
                    click_function = "ToggleHftRFPT1",
                    function_owner = self,
                    label = "Excluded: Free Peoples Token (Advance political track)",
                    position = { 0, 0.1, 0 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 70,
                    tooltip = "Click to include this token."
                }
            )
        end

        if HftRFPT2 then
            FPTCount = FPTCount + 1
            self.createButton(
                {
                    click_function = "ToggleHftRFPT2",
                    function_owner = self,
                    label = "Included: Free Peoples Token (Draw event card)",
                    position = { 0, 0.1, 0.3 },
                    width = 1800,
                    height = 150,
                    color = { 0.4, 0.4, 1 },
                    font_color = { 1, 1, 0 },
                    font_size = 70,
                    tooltip = "Click to exclude this token."
                }
            )
        else
            self.createButton(
                {
                    click_function = "ToggleHftRFPT2",
                    function_owner = self,
                    label = "Excluded: Free Peoples Token (Draw event card)",
                    position = { 0, 0.1, 0.3 },
                    width = 1800,
                    height = 150,
                    color = { 1, 1, 1 },
                    font_size = 70,
                    tooltip = "Click to include this token."
                }
            )
        end

        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Shadow has " .. SPTCount .. " tokens. Free Peoples has " .. FPTCount .. " tokens.",
                position = { 0, 0.1, 1 },
                width = 0,
                height = 0,
                font_size = 70,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Continue",
                position = { 0, 0.1, 1.3 },
                width = 1800,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100
            }
        )
        function ToggleHftRSPT1()
            HftRSPT1 = not HftRSPT1
            NextStep = "HuntForTheRingMenu"
            Step = ""
        end

        function ToggleHftRSPT2()
            HftRSPT2 = not HftRSPT2
            NextStep = "HuntForTheRingMenu"
            Step = ""
        end

        function ToggleHftRFPT1()
            HftRFPT1 = not HftRFPT1
            NextStep = "HuntForTheRingMenu"
            Step = ""
        end

        function ToggleHftRFPT2()
            HftRFPT2 = not HftRFPT2
            NextStep = "HuntForTheRingMenu"
            Step = ""
        end

        function Continue()
            self.clearButtons()
            printToAll("The Shadow received " .. SPTCount .. " Action Tokens from The Hunt for the Ring.")
            if HftRSPT1 then
                getObjectFromGUID(IDs.HftR.ShadowToken1).setPositionSmooth({ 12.5, 1.02, -33 }, false, true)
            end

            if HftRSPT2 then
                getObjectFromGUID(IDs.HftR.ShadowToken2).setPositionSmooth({ 12.5, 1.02, -35 }, false, true)
            end

            printToAll("The Free Peoples received " .. FPTCount .. " Action Tokens from The Hunt for the Ring.")
            if CompactMode then
                if HftRFPT1 then
                    getObjectFromGUID(IDs.HftR.FreePeoplesToken1).setPositionSmooth({ -13, 1.02, -33 }, false, true)
                end

                if HftRFPT2 then
                    getObjectFromGUID(IDs.HftR.FreePeoplesToken2).setPositionSmooth({ -13, 1.02, -35 }, false, true)
                end
            else
                if HftRFPT1 then
                    getObjectFromGUID(IDs.HftR.FreePeoplesToken1).setPositionSmooth({ -17, 1.02, 27.5 }, false, true)
                end

                if HftRFPT2 then
                    getObjectFromGUID(IDs.HftR.FreePeoplesToken2).setPositionSmooth({ -19, 1.02, 27.5 }, false, true)
                end
            end

            NextStep = "TFoEMenu"
            Step = ""
        end
    else --proceed...
        Global.call("RemoveObjectFromGame", { Description = "HftR;" })
        NextStep = "TFoEMenu"
        Step = ""
    end
end

function ValidateArmyStep()
    self.clearButtons()
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Army Setup Validation:",
            position = { 0, 0.1, -1.4 },
            width = 0,
            height = 0,
            font_size = 150,
            font_color = { 1, 1, 1 }
        }
    )
    self.createButton(
        {
            click_function = "Nothing",
            function_owner = self,
            label = "Please Wait\nChecking Army Setup...",
            position = { 0, 0.1, -0.5 },
            width = 0,
            height = 0,
            font_size = 100,
            font_color = { 1, 1, 1 }
        }
    )
    for I = 1, 99 do
        coroutine.yield(0)
    end

    local ErrorLog = ""
    local Regions = Global.getTable("Regions")

    for _, Obj in pairs(getAllObjects()) do
        --object is an amry unit?
        if
            string.find(Obj.getDescription(), "Regular;") ~= nil or
            string.find(Obj.getDescription(), "Elite;") ~= nil or
            string.find(Obj.getDescription(), "Leader;") ~= nil
        then
            local RegionName = Global.call("GetGridRegion", { Position = Obj.getPosition() })
            Obj.setGMNotes("Region:" .. RegionName .. ";")

            --object has a region?
            if Regions[RegionName] ~= nil then
                --correct nation?
                local Nation = Regions[RegionName].Nation
                if Nation == "Elves" then
                    Nation = "Elf"
                end

                if Nation == "Dwarves" then
                    Nation = "Dwarf"
                end

                if RegionName == "Osgiliath" then
                    Nation = "Gondor"
                end

                if RegionName == "North Ithilien" then
                    Nation = "Sauron"
                end

                if RegionName == "South Ithilien" then
                    Nation = "Southron/Easterling"
                end

                if RegionName == "West Harondor" then
                    Nation = "Southron/Easterling"
                end

                if RegionName == "Dagorlad" then
                    Nation = "Southron/Easterling"
                end

                if Obj.getName() == Nation .. " Regular" then
                    Regions[RegionName].Detected.R = Regions[RegionName].Detected.R + 1
                elseif Obj.getName() == Nation .. " Elite" then
                    Regions[RegionName].Detected.E = Regions[RegionName].Detected.E + 1
                elseif Obj.getName() == Nation .. " Leader" then
                    Regions[RegionName].Detected.L = Regions[RegionName].Detected.L + 1
                elseif Obj.getName() == "Nazgûl" then
                    Regions[RegionName].Detected.L = Regions[RegionName].Detected.L + 1
                else     --wrong unit faction...
                    print(RegionName, ":'", Obj.getName(), "' ~= '", Nation, " Regular/Elite/Leader'")
                    Regions[RegionName].Detected.X = Regions[RegionName].Detected.X + 1
                end
            end
        end
    end

    --go through each region...
    for I, Region in pairs(Regions) do
        --validate by region...
        if Region.Detected.X > 0 then
            ErrorLog = ErrorLog .. "\n" .. I .. " has " .. Region.Detected.X .. " incorrect Army Unit(s)."
        end

        if Region.Starting.R ~= Region.Detected.R then
            ErrorLog =
                ErrorLog .. "\n" .. I .. " has " .. Region.Detected.R .. " of " .. Region.Starting.R .. " Regular(s)."
        end

        if Region.Starting.E ~= Region.Detected.E then
            ErrorLog = ErrorLog ..
            "\n" .. I .. " has " .. Region.Detected.E .. " of " .. Region.Starting.E .. " Elite(s)."
        end

        if Region.Starting.L ~= Region.Detected.L then
            ErrorLog = ErrorLog ..
            "\n" .. I .. " has " .. Region.Detected.L .. " of " .. Region.Starting.L .. " Leader(s)."
        end
    end

    if ErrorLog == "" then
        printToAll("Army Setup appears correct.", { 0, 1, 0 })
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = "Army Setup appears correct.",
                position = { 0, 0.1, 0.5 },
                width = 0,
                height = 0,
                font_size = 100,
                font_color = { 1, 1, 1 }
            }
        )
        NextStep = "SetupCompleteMenu"
        Step = ""
    else
        broadcastToAll("Problem detected with Army Setup!", { 1, 1, 0 })
        printToAll(ErrorLog, { 1, 1, 0 })
        self.createButton(
            {
                click_function = "Nothing",
                function_owner = self,
                label = ErrorLog,
                position = { 0, 0.1, 0 },
                width = 0,
                height = 0,
                font_size = 50,
                font_color = { 1, 1, 1 }
            }
        )
        self.createButton(
            {
                click_function = "Continue",
                function_owner = self,
                label = "Ignore (Continue)",
                position = { -1, 0.1, 1.4 },
                width = 900,
                height = 200,
                color = { 1, 1, 0 },
                font_size = 100
            }
        )
        self.createButton(
            {
                click_function = "Validate",
                function_owner = self,
                label = "Validate Setup",
                position = { 1, 0.1, 1.4 },
                width = 900,
                height = 200,
                color = { 1, 1, 1 },
                font_size = 100
            }
        )
    end

    function Validate()
        NextStep = "ValidateArmies"
        Step = ""
    end

    function Continue()
        self.clearButtons()
        NextStep = "SetupCompleteMenu"
        Step = ""
    end
end

function GatherActionDiceCoroutine()
    local FR = 180 --FPP Dice Y orientation.
    local SR = 0   --SP Dice Y orientation
    if CompactMode then
        FR = FR + 180
    end

    GuideName = Global.call("DetectGuide")
    --Remove any dice in the Dice Box and Used ActionDice areas, then place them in a staging (out) area...
    local DiceIndex = 0
    ShadowHuntDiceCount = 0
    FreePeoplesHuntDiceCount = 0
    --scan shadow used dice area for action dice...
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = getObjectFromGUID(IDs.ShadowUsedDiceArea).getPosition(),
                direction = { 0, 1, 0 },
                type = 3,
                size = { 9, 5, 9 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if DiceIndex < #Spots.ShadowDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            --does the dice have a remove face and the witch-king is in play?
            if
                string.find(Obj.hit_object.getRotationValue(), "Remove") ~= nil and
                InPlay({ Name = "The Witch", Description = "Minion;" })
            then
                --then eliminate the die...
                printToAll(
                    "Removing " ..
                    Obj.hit_object.getName() ..
                    " from the game. (The Witch-King is in play, and a [Remove](*) was rolled and chosen."
                )
                getObjectFromGUID(GraveBagId).putObject(Obj.hit_object)
            elseif
                InPlay({ Name = "King: The Black Captain", Description = "Minion;" }) and
                Obj.hit_object.getGUID() == IDs.GothmogDice
            then
                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.GothmogDice))
                broadcastToAll(
                    "The Witch-King: The Black Captain has entered play.  Gothmog's die has been eliminated."
                )
            else
                --stage the dice to the outer area...
                DiceIndex = DiceIndex + 1
                Obj.hit_object.setPositionSmooth(Spots.ShadowDiceOut[DiceIndex], false, true)
                Obj.hit_object.setRotation({ 0, SR, 0 })
            end
        end
    end

    coroutine.yield(0)
    --scan huntbox for shadow action dice...
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = { -31.66, 1.02, -20.80 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 9, 5, 7 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            DiceIndex < #Spots.ShadowDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil and
            string.find(Obj.hit_object.getDescription(), "Shadow;") ~= nil
        then
            --does the dice have a remove face and the witch-king is in play?
            if
                string.find(Obj.hit_object.getRotationValue(), "Remove") ~= nil and
                InPlay({ Name = "The Witch", Description = "Minion;" })
            then
                --then eliminate the die...
                printToAll(
                    "Removing " ..
                    Obj.hit_object.getName() ..
                    " from the game. (The Witch-King is in play, and a [Remove](*) was rolled and chosen."
                )
                getObjectFromGUID(GraveBagId).putObject(Obj.hit_object)
            elseif
                InPlay({ Name = "King: The Black Captain", Description = "Minion;" }) and
                Obj.hit_object.getGUID() == IDs.GothmogDice
            then
                getObjectFromGUID(GraveBagId).putObject(getObjectFromGUID(IDs.GothmogDice))
                broadcastToAll(
                    "The Witch-King: The Black Captain has entered play.  Gothmog's die has been eliminated."
                )
            end

            --stage the dice to the outer area...
            DiceIndex = DiceIndex + 1
            ShadowHuntDiceCount = ShadowHuntDiceCount + 1
            Obj.hit_object.setPositionSmooth(Spots.ShadowDiceOut[DiceIndex], false, true)
            Obj.hit_object.setRotation({ 0, SR, 0 })
        end
    end

    coroutine.yield(0)
    --scan board for any remaining shadow action dice...
    for _, Obj in pairs(getAllObjects()) do
        if Obj.getPosition().z >= -25 and Obj.getPosition().z <= 25 then
            if Obj.getPosition().x >= -37 and Obj.getPosition().x <= 37 then
                if string.find(Obj.getDescription(), "Dice;") ~= nil then
                    if
                        DiceIndex < #Spots.ShadowDiceOut and
                        (string.find(Obj.getDescription(), "Action;") ~= nil or
                            string.find(Obj.getDescription(), "Faction;") ~= nil) and
                        string.find(Obj.getDescription(), "Shadow;") ~= nil
                    then
                        if
                            InPlay({ Name = "King: The Black Captain", Description = "Minion;" }) and
                            Obj.getGUID() == IDs.GothmogDice
                        then
                            --do not gather gothmog when the black captain is in play...
                        else
                            DiceIndex = DiceIndex + 1
                            Obj.setPositionSmooth(Spots.ShadowDiceOut[DiceIndex], false, true)
                            Obj.setRotation({ 0, SR, 0 })
                        end
                    end
                end
            end
        end
    end

    coroutine.yield(0)
    if CompactMode then
        --scan Compact dice line dice box for shadow action dice...
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = { 0, 1, -26 },
                    direction = { 0, 1, 0 },
                    type = 3,
                    size = { 27, 3, 3 },
                    orientation = { 0, 0, 0 },
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
                if
                    DiceIndex < #Spots.ShadowDiceOut and
                    (string.find(Obj.hit_object.getDescription(), "Action;") ~= nil or
                        string.find(Obj.hit_object.getDescription(), "Faction;") ~= nil) and
                    string.find(Obj.hit_object.getDescription(), "Shadow;") ~= nil
                then
                    if
                        InPlay({ Name = "King: The Black Captain", Description = "Minion;" }) and
                        Obj.hit_object.getGUID() == IDs.GothmogDice
                    then
                        --do not gather gothmog when the black captain is in play...
                    else
                        DiceIndex = DiceIndex + 1
                        Obj.hit_object.setPositionSmooth(Spots.ShadowDiceOut[DiceIndex], false, true)
                        Obj.hit_object.setRotation({ 0, SR, 0 })
                    end
                end
            end
        end

        coroutine.yield(0)
    end

    --scan shadow dice box for action dice...
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = getObjectFromGUID(IDs.ShadowDiceBox).getPosition(),
                direction = { 0, 1, 0 },
                type = 3,
                size = { 10, 5, 13 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = true
            }
        )
    ) do
        if DiceIndex < #Spots.ShadowDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            if
                InPlay({ Name = "King: The Black Captain", Description = "Minion;" }) and
                Obj.hit_object.getGUID() == IDs.GothmogDice
            then
                --do not gather gothmog when the black captain is in play...
            else
                DiceIndex = DiceIndex + 1
                Obj.hit_object.setPositionSmooth(Spots.ShadowDiceOut[DiceIndex], false, true)
                Obj.hit_object.setRotation({ 0, SR, 0 })
            end
        end
    end

    coroutine.yield(0)
    --scan free peoples used dice area for action dice...
    DiceIndex = 0

    for O, Obj in pairs(
        Physics.cast(
            {
                origin = getObjectFromGUID(IDs.FreePeoplesUsedDiceArea).getPosition(),
                direction = { 0, 1, 0 },
                type = 3,
                size = { 9, 5, 9 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if DiceIndex < #Spots.FreePeoplesDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            --does the dice have a remove face and gandalf the white is in play?
            if
                string.find(Obj.hit_object.getRotationValue(), "Remove") ~= nil and
                InPlay({ Name = "Gandalf the White: Emissary from the West", Description = "Character;" })
            then
                --then eliminate the die...
                printToAll(
                    "Removing " ..
                    Obj.hit_object.getName() ..
                    " from the game. (Gandalf the White is in play, and a [Remove](*) was rolled and chosen."
                )
                getObjectFromGUID(GraveBagId).putObject(Obj.hit_object)
            else
                --stage the dice to the outer area...
                DiceIndex = DiceIndex + 1
                Obj.hit_object.setPositionSmooth(Spots.FreePeoplesDiceOut[DiceIndex], false, true)
                Obj.hit_object.setRotation({ 0, FR, 0 })
            end
        end
    end

    coroutine.yield(0)
    --scan free peoples dice box for action dice...
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = getObjectFromGUID(IDs.FreePeoplesDiceBox).getPosition(),
                direction = { 0, 1, 0 },
                type = 3,
                size = { 10, 5, 13 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if DiceIndex < #Spots.FreePeoplesDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            --stage the dice to the outer area...
            DiceIndex = DiceIndex + 1
            Obj.hit_object.setPositionSmooth(Spots.FreePeoplesDiceOut[DiceIndex], false, true)
            Obj.hit_object.setRotation({ 0, FR, 0 })
        end
    end

    coroutine.yield(0)
    --scan huntbox for free peoples action dice...
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = { -31.66, 1.02, -20.80 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 9, 5, 7 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            DiceIndex < #Spots.FreePeoplesDiceOut and string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil and
            string.find(Obj.hit_object.getDescription(), "FreePeoples;") ~= nil
        then
            --does the dice have a remove face and gandalf the white is in play?
            if
                string.find(Obj.hit_object.getRotationValue(), "Remove") ~= nil and
                InPlay({ Name = "Gandalf the White: Emissary from the West", Description = "Character;" })
            then
                --then eliminate the die...
                printToAll(
                    "Removing " ..
                    Obj.hit_object.getName() ..
                    " from the game. (Gandalf the White is in play, and a [Remove](*) was rolled and chosen."
                )
                getObjectFromGUID(GraveBagId).putObject(Obj.hit_object)
            end

            --stage the dice to the outer area...
            DiceIndex = DiceIndex + 1
            FreePeoplesHuntDiceCount = FreePeoplesHuntDiceCount + 1
            Obj.hit_object.setPositionSmooth(Spots.FreePeoplesDiceOut[DiceIndex], false, true)
            Obj.hit_object.setRotation({ 0, FR, 0 })
        end
    end

    coroutine.yield(0)
    --scan board for any remaining FP action dice...
    for _, Obj in pairs(getAllObjects()) do
        if Obj.getPosition().z >= -25 and Obj.getPosition().z <= 25 then
            if Obj.getPosition().x >= -37 and Obj.getPosition().x <= 37 then
                if string.find(Obj.getDescription(), "Dice;") ~= nil then
                    if
                        DiceIndex < #Spots.FreePeoplesDiceOut and
                        (string.find(Obj.getDescription(), "Action;") ~= nil or
                            string.find(Obj.getDescription(), "Faction;") ~= nil) and
                        string.find(Obj.getDescription(), "FreePeoples;") ~= nil
                    then
                        DiceIndex = DiceIndex + 1
                        Obj.setPositionSmooth(Spots.FreePeoplesDiceOut[DiceIndex], false, true)
                        Obj.setRotation({ 0, FR, 0 })
                    end
                end
            end
        end
    end

    coroutine.yield(0)
    if CompactMode then
        --scan Compact dice line dice box for FP action dice...
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = { 0, 1, -26 },
                    direction = { 0, 1, 0 },
                    type = 3,
                    size = { 27, 3, 3 },
                    orientation = { 0, 0, 0 },
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
                if
                    DiceIndex < #Spots.FreePeoplesDiceOut and
                    (string.find(Obj.hit_object.getDescription(), "Action;") ~= nil or
                        string.find(Obj.hit_object.getDescription(), "Faction;") ~= nil) and
                    string.find(Obj.hit_object.getDescription(), "FreePeoples;") ~= nil
                then
                    DiceIndex = DiceIndex + 1
                    Obj.hit_object.setPositionSmooth(Spots.FreePeoplesDiceOut[DiceIndex], false, true)
                    Obj.hit_object.setRotation({ 0, FR, 0 })
                end
            end
        end

        coroutine.yield(0)
    end

    DiceIndex = 0

    --FP gathers 4 base dice...
    for I = 1, 4 do
        if getObjectFromGUID(IDs.FreePeoplesActionDice[I]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.FreePeoplesActionDice[I]).setPositionSmooth(
                Spots.FreePeoplesDiceBox[DiceIndex],
                false,
                true
            )
        else
            print("Uhoh! Can't find Free Peoples Action Dice #" .. D .. "!")
        end
    end

    coroutine.yield(0)
    --FP gathers +1 extra dice if Gandalf the White is in play...
    if InPlay({ Name = "Gandalf the White: Emissary from the West", Description = "Character;" }) then
        if getObjectFromGUID(IDs.FreePeoplesActionDice[5]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.FreePeoplesActionDice[5]).setPositionSmooth(
                Spots.FreePeoplesDiceBox[DiceIndex],
                false,
                true
            )
        else
            print("Uhoh! Can't find Free Peoples Action Dice #5 (Gandalf the White)!")
        end
    end
    coroutine.yield(0)
    --FP gathers +1 extra dice if Aragorn is in play...
    if InPlay({ Name = "Aragorn: Heir to Isildur", Description = "Character;" }) then
        if getObjectFromGUID(IDs.FreePeoplesActionDice[6]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.FreePeoplesActionDice[6]).setPositionSmooth(
                Spots.FreePeoplesDiceBox[DiceIndex],
                false,
                true
            )
        else
            print("Uhoh! Can't find Free Peoples Action Dice #6 (Aragorn)!")
        end
    end
    coroutine.yield(0)
    --FP gathers Narya action dice if gandalf the gray (keeper of narya) is the guide during the recover action, and there was at least 1 FP dice in the hunt box, and dice is not removed from game (Narya is in the pool if it is round 1 and Gandalf keeper is the guide)...
    if
        GuideName == "Gandalf the Grey: Keeper of Narya" and
        (FreePeoplesHuntDiceCount > 0 and getObjectFromGUID(IDs.NaryaDice) ~= nil or Round == 1)
    then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.NaryaDice).setPositionSmooth(Spots.FreePeoplesDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --FP add the Nenya dice if lady Galadriel is in play, and dice is not removed from game...
    if
        InPlay({ Name = "Lady Galadriel: Keeper of Nenya", Description = "Character;" }) and
        getObjectFromGUID(IDs.NenyaDice) ~= nil
    then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.NenyaDice).setPositionSmooth(Spots.FreePeoplesDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --FP add the Vilya dice if Lord Elrond is in play, and dice is not removed from game...
    if
        InPlay({ Name = "Lord Elrond: Keeper of Vilya", Description = "Character;" }) and
        getObjectFromGUID(IDs.VilyaDice) ~= nil
    then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.VilyaDice).setPositionSmooth(Spots.FreePeoplesDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --FP gathers faction dice if a faction is any FP faction card is flipped over (active)...
    if FactionActive({ Faction = "DeadMen" }) or FactionActive({ Faction = "Ents" }) or FactionActive({ Faction = "Eagles" }) then
        if getObjectFromGUID(IDs.FreePeoplesFactionDice) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.FreePeoplesFactionDice).setPositionSmooth(
                Spots.FreePeoplesDiceBox[DiceIndex],
                false,
                true
            )
        else
            print("Uhoh! Can't find Free Peoples Faction Dice!")
        end
    end

    coroutine.yield(0)
    --FP add the ruler dice if a Awakened Ruler is in play...
    if getObjectFromGUID(IDs.FreePeoplesRulerDice) ~= nil and InPlay({ Name = "(Awakened)", Description = "Ruler;" }) then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.FreePeoplesRulerDice).setPositionSmooth(Spots.FreePeoplesDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --Shadow Peoples gathers 7 base dice...
    DiceIndex = 0
    for I = 1, 7 do
        if getObjectFromGUID(IDs.ShadowActionDice[I]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.ShadowActionDice[I]).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex])
            getObjectFromGUID(IDs.ShadowActionDice[I]).setRotation({ 0, SR, 0 })
        else
            print("Uhoh! Can't find Shadow Action Dice #" .. D .. "!")
        end
    end

    coroutine.yield(0)
    --Shadow add +1 extra dice if Saruman is in play...
    if InPlay({ Name = "Saruman: Corrupted Wizard", Description = "Minion;" }) then
        if getObjectFromGUID(IDs.ShadowActionDice[8]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.ShadowActionDice[8]).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
        else
            print("Uhoh! Can't find Shadow Action Dice #8 (Saruman)!")
        end
    end
    coroutine.yield(0)
    --Shadow add +1 extra dice if a Witch-king minion is in play...
    if InPlay({ Name = "The Witch", Description = "Minion;" }) then
        if getObjectFromGUID(IDs.ShadowActionDice[9]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.ShadowActionDice[9]).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
        else
            print("Uhoh! Can't find Shadow Action Dice #9 (The Witch-King)!")
        end
    end
    coroutine.yield(0)
    --Shadow add +1 extra dice if a Mouth of Sauron minion is in play...
    if InPlay({ Name = "The Mouth of Sauron", Description = "Minion;" }) then
        if getObjectFromGUID(IDs.ShadowActionDice[10]) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.ShadowActionDice[10]).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
        else
            print("Uhoh! Can't find Shadow Action Dice #10 (The Mouth of Sauron)!")
        end
    end
    coroutine.yield(0)
    --Shadow add Balrog dice if Balrog is in play, and dice is not removed from game...
    if
        InPlay({ Name = "Balrog: Evil of the Ancient World", Description = "Minion;" }) and
        getObjectFromGUID(IDs.BalrogDice) ~= nil
    then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.BalrogDice).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --Shadow add Gothmog dice if Gothmog is in play, and dice is not removed from game...
    if
        InPlay({ Name = "Gothmog: Lieutenant of Morgul", Description = "Minion;" }) and
        getObjectFromGUID(IDs.GothmogDice) ~= nil
    then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.GothmogDice).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --Shadow add the ruler dice if an Dark Chieftain Ruler is in play...
    if getObjectFromGUID(IDs.ShadowRulerDice) ~= nil and InPlay({ Description = "DarkChieftain;" }) then
        DiceIndex = DiceIndex + 1
        getObjectFromGUID(IDs.ShadowRulerDice).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
    end

    coroutine.yield(0)
    --FP gathers faction dice if a faction is any FP faction card is flipped over (active)...
    if
        FactionActive({ Faction = "Spiders" }) or FactionActive({ Faction = "Corsairs" }) or
        FactionActive({ Faction = "Dunlendings" })
    then
        if getObjectFromGUID(IDs.ShadowFactionDice) ~= nil then
            DiceIndex = DiceIndex + 1
            getObjectFromGUID(IDs.ShadowFactionDice).setPositionSmooth(Spots.ShadowDiceBox[DiceIndex], false, true)
        else
            print("Uhoh! Can't find Shadow Faction Dice!")
        end
    end

    --always return 1 from a coroutine...
    return 1
end

function RollActionDiceCoroutine()
    local FR = 180 --FPP Dice Y orientation.
    local SR = 0   --SP Dice Y orientation
    if CompactMode then
        FR = FR + 180
    end

    --roll, then organize all dice in the Diceboxes...
    local ShadowRollAreaPosition = getObjectFromGUID(IDs.ShadowDiceBox).getPosition()
    local FreePeoplesRollAreaPosition = getObjectFromGUID(IDs.FreePeoplesDiceBox).getPosition()
    local RollAreaSize = { 10, 5, 13 }
    if CompactMode then
        ShadowRollAreaPosition = getObjectFromGUID(IDs.ShadowUsedDiceArea).getPosition()
        FreePeoplesRollAreaPosition = getObjectFromGUID(IDs.FreePeoplesUsedDiceArea).getPosition()
        RollAreaSize = { 9, 5, 9 }
    end

    --roll shadow action dice...
    ShadowDicePool = {}
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = ShadowRollAreaPosition,
                direction = { 0, 1, 0 },
                type = 3,
                size = RollAreaSize,
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            table.insert(ShadowDicePool, Obj.hit_object.getGUID())
        end
    end

    --scan free peoples dice box for action dice...
    FreePeoplesDicePool = {}
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = FreePeoplesRollAreaPosition,
                direction = { 0, 1, 0 },
                type = 3,
                size = RollAreaSize,
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
            table.insert(FreePeoplesDicePool, Obj.hit_object.getGUID())
        end
    end

    --roll ShadowDice...
    for I = 1, #ShadowDicePool do
        getObjectFromGUID(ShadowDicePool[I]).randomize()
        Wait.time(
            function ()
                getObjectFromGUID(ShadowDicePool[I]).randomize()
            end,
            0.5
        )
    end

    coroutine.yield(0)
    --roll FreePeoplesDice
    for I = 1, #FreePeoplesDicePool do
        getObjectFromGUID(FreePeoplesDicePool[I]).randomize()
        Wait.time(
            function ()
                getObjectFromGUID(FreePeoplesDicePool[I]).randomize()
            end,
            0.5
        )
    end

    --wait for all Dice to finish rolling...
    local Done = true
    repeat
        coroutine.yield(0)
        Done = true --assume true until proven false.
        for I = 1, #ShadowDicePool do
            if not getObjectFromGUID(ShadowDicePool[I]).resting then
                Done = false
                break
            end
        end

        if Done then
            for I = 1, #FreePeoplesDicePool do
                if not getObjectFromGUID(FreePeoplesDicePool[I]).resting then
                    Done = false
                    break
                end
            end
        end
    until Done
    --update huntbox dice tables...
    HuntBoxShadowDiceArray = {}
    HuntBoxFreePeoplesDiceArray = {}
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = { -31.66, 1.02, -20.80 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 9, 1, 7 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil and
            string.find(Obj.hit_object.getDescription(), "Shadow;") ~= nil
        then
            table.insert(HuntBoxShadowDiceArray, Obj.hit_object.getGUID())
        end

        if
            string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil and
            string.find(Obj.hit_object.getDescription(), "FreePeoples;") ~= nil
        then
            table.insert(HuntBoxFreePeoplesDiceArray, Obj.hit_object.getGUID())
        end
    end

    local ResultText = "\nThe Shadow Rolled: "
    --organize shadow action dice...
    for I = 1, #ShadowDicePool do
        getObjectFromGUID(ShadowDicePool[I]).setPosition(Spots.ShadowDiceBox[I])
        ResultText = ResultText .. " [" .. getObjectFromGUID(ShadowDicePool[I]).getRotationValue() .. "]"
        --eye result?
        if string.find(getObjectFromGUID(ShadowDicePool[I]).getRotationValue(), "Eye") ~= nil then
            table.insert(HuntBoxShadowDiceArray, ShadowDicePool[I])
        end
    end

    printToAll(ResultText, { 1, 0.3, 0.3 })
    ResultText = "\nThe Free Peoples Rolled: "
    --organize FP action dice...
    for I = 1, #FreePeoplesDicePool do
        ResultText = ResultText .. " [" .. getObjectFromGUID(FreePeoplesDicePool[I]).getRotationValue() .. "]"
        --eye result?
        if string.find(getObjectFromGUID(FreePeoplesDicePool[I]).getRotationValue(), "Eye") ~= nil then
            table.insert(HuntBoxFreePeoplesDiceArray, FreePeoplesDicePool[I])
        end
    end

    printToAll(ResultText, { 0.3, 0.3, 1 })
    --update huntbox again to pick up newly rolled eyes...
    for I = 1, #HuntBoxShadowDiceArray do
        getObjectFromGUID(HuntBoxShadowDiceArray[I]).setPositionSmooth(Spots.ShadowHuntBoxDice[I], false, true)
        Global.call("SetDiceFace", { Dice = getObjectFromGUID(HuntBoxShadowDiceArray[I]), Value = "Eye" })
    end

    for I = 1, #HuntBoxFreePeoplesDiceArray do
        getObjectFromGUID(HuntBoxFreePeoplesDiceArray[I]).setPositionSmooth(
            Spots.FreePeoplesHuntBoxDice[I],
            false,
            true
        )
        Global.call("SetDiceFace", { Dice = getObjectFromGUID(HuntBoxShadowDiceArray[I]), Value = "Eye" })
    end

    --line up action dice by type...
    local SDI = 0  --shadow dice index
    local FPDI = 0 --FP dice index
    for DF = 1, 6 do
        --line up shadow action dice...
        for I = 1, #ShadowDicePool do
            --ignore eyes and group by face...
            if
                getObjectFromGUID(ShadowDicePool[I]).getValue() == DF and
                string.find(getObjectFromGUID(ShadowDicePool[I]).getRotationValue(), "Eye") == nil
            then
                SDI = SDI + 1
                if CompactMode then
                    getObjectFromGUID(ShadowDicePool[I]).setPosition(Spots.CompactShadowDiceLine[SDI])
                else
                    getObjectFromGUID(ShadowDicePool[I]).setPosition(Spots.ShadowDiceBox[SDI])
                end

                --align Y rotation (don't use set dice face funtion!)
                getObjectFromGUID(ShadowDicePool[I]).setRotationSmooth(
                    {
                        getObjectFromGUID(ShadowDicePool[I]).getRotation().x,
                        SR,
                        getObjectFromGUID(ShadowDicePool[I]).getRotation().z
                    },
                    false,
                    false
                )
            end
        end

        --organize FP action dice...
        for I = 1, #FreePeoplesDicePool do
            --ignore eyes and group by face...
            if
                getObjectFromGUID(FreePeoplesDicePool[I]).getValue() == DF and
                string.find(getObjectFromGUID(FreePeoplesDicePool[I]).getRotationValue(), "Eye") == nil
            then
                FPDI = FPDI + 1
                if CompactMode then
                    getObjectFromGUID(FreePeoplesDicePool[I]).setPosition(Spots.CompactFreePeoplesDiceLine[FPDI])
                else
                    getObjectFromGUID(FreePeoplesDicePool[I]).setPosition(Spots.FreePeoplesDiceBox[FPDI])
                end

                --align Y rotation (don't use set dice face funtion!)
                getObjectFromGUID(FreePeoplesDicePool[I]).setRotationSmooth(
                    {
                        getObjectFromGUID(FreePeoplesDicePool[I]).getRotation().x,
                        FR,
                        getObjectFromGUID(FreePeoplesDicePool[I]).getRotation().z
                    },
                    false,
                    false
                )
            end
        end
    end

    --update dice stats...
    for I = 1, #FreePeoplesDicePool do
        Global.call(
            "UpdateDiceStats",
            {
                Result = getObjectFromGUID(FreePeoplesDicePool[I]).getRotationValue(),
                Type = "Action",
                Side = "FreePeoples"
            }
        )
    end

    for I = 1, #ShadowDicePool do
        Global.call(
            "UpdateDiceStats",
            { Result = getObjectFromGUID(ShadowDicePool[I]).getRotationValue(), Type = "Action", Side = "Shadow" }
        )
    end

    return 1
end

-- Params: {ID="", Name="",Description=""}
function InPlay(Params)
    if Params.ID == nil then
        Params.ID = ""
    end

    if Params.Name == nil then
        Params.Name = ""
    end

    if Params.Description == nil then
        Params.Description = ""
    end

    for O, Obj in pairs(getAllObjects()) do
        --is object on the board?{37, 0.99, -25}{-37, 0.99, 25}
        if Obj.getPosition().z >= -25 and Obj.getPosition().z <= 25 then
            if Obj.getPosition().x >= -37 and Obj.getPosition().x <= 37 then
                if
                    (Params.ID == "" or Obj.getGUID() == Params.ID) and
                    (Params.Name == "" or string.find(Obj.getName(), Params.Name) ~= nil) and
                    (Params.Description == "" or string.find(Obj.getDescription(), Params.Description) ~= nil)
                then
                    return true
                end
            end
        end
    end

    return false
end

-- Params: {Name=""}
function InFellowship(Params)
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = { 27.59, 0.86, 20.04 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 3, 2, 9.5 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if Obj.hit_object.getName() == Params.Name then
            return true
        end
    end

    return false
end

-- returns table of fellowship names
function GetFellowshipCompanions()
    local CompanionList = {}
    for _, Obj in pairs(
        Physics.cast(
            {
                origin = { 27.6, 0.86, 20 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 3, 2, 9.5 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if Obj.hit_object.type == "Figurine" and string.find(Obj.hit_object.getDescription(), "Character;") ~= nil then
            table.insert(CompanionList, Obj.hit_object.getName())
        end
    end

    return CompanionList
end

-- Params: Faction=""  ex: DeadMen, Ents, Eagles, Spiders, Dunlendings, Corsairs
function FactionActive(Params)
    --make sure WoME expansion is in play...
    if WoME == false then
        return false
    end

    --make sure faction card exists...
    if getObjectFromGUID(IDs.WoME[Params.Faction .. "FactionCard"]) == nil then
        return false
    end

    --make sure faction card is flipped over...
    if
        getObjectFromGUID(IDs.WoME[Params.Faction .. "FactionCard"]).getRotation().z >= 90 and
        getObjectFromGUID(IDs.WoME[Params.Faction .. "FactionCard"]).getRotation().z <= 270
    then
        return true
    else
        return false
    end
end

-- Params: id="", position={x,y,z}, name="", description=""
function CheckDeck(Params)
    -- If the deck no longer exists, try to re-detect it at the specified position and return it's ID (or null if none found)...
    if getObjectFromGUID(Params.id) ~= nil then
        return Params.id
    else
        if Params.position ~= nil then
            for _, Obj in pairs(
                Physics.cast(
                    {
                        origin = position,
                        direction = { 0, 1, 0 },
                        type = 2,
                        size = { 1, 1, 1 },
                        orientation = { 0, 0, 0 },
                        max_distance = 0,
                        debug = false
                    }
                )
            ) do
                if Obj.hit_object.tag == "Deck" then
                    if Params.name ~= nil then
                        Obj.hit_object.setName(Params.name)
                    end

                    if Params.description ~= nil then
                        Obj.hit_object.setDescription(Params.description)
                    end

                    return Obj.hit_object.getGUID()
                end
            end
        end
    end

    return ""
end

-- Params: deckid="", count=1, player="", deckname="", deckspot={x,y,z}
function DrawFromDeck(Params)
    if Params.deckname == nil then
        Params.deckname = ""
    end

    local DrawCount = 0
    for C = 1, Params.count do
        if getObjectFromGUID(Params.deckid) ~= nil then --try by guid...
            getObjectFromGUID(Params.deckid).deal(1, Params.player)
            DrawCount = DrawCount + 1
        elseif Params.deckspot ~= nil then
            --try to draw from a deck at that spot...
            local Success = false
            for _, Obj in pairs(
                Physics.cast(
                    {
                        origin = Params.deckspot,
                        direction = { 0, 1, 0 },
                        type = 2,
                        size = { 1, 1, 1 },
                        orientation = { 0, 0, 0 },
                        max_distance = 0,
                        debug = true
                    }
                )
            ) do
                if Obj.hit_object.tag == "Deck" then
                    Obj.hit_object.deal(1, Params.player)
                    DrawCount = DrawCount + 1
                    Success = true
                    break
                end
            end

            --look for 1 last card in the spot...
            if not Success then
                for _, Obj in pairs(
                    Physics.cast(
                        {
                            origin = Params.deckspot,
                            direction = { 0, 1, 0 },
                            type = 2,
                            size = { 1, 1, 1 },
                            orientation = { 0, 0, 0 },
                            max_distance = 0,
                            debug = true
                        }
                    )
                ) do
                    if Obj.hit_object.tag == "Card" then
                        Obj.hit_object.deal(1, Params.player)
                        DrawCount = DrawCount + 1
                        break
                    end
                end
            end
        end
    end

    if Params.deckname == nil then
        Params.deckname = ""
    end

    if DrawCount == 1 then
        Params.deckname = Params.deckname .. " card"
    else
        Params.deckname = Params.deckname .. " cards"
    end

    printToAll(
        Params.player .. " player draws " .. DrawCount .. " " .. Params.deckname .. ".",
        Player[Params.player].color
    )
end

function MoveGamePanel(SpotName)
    self.setPositionSmooth(Spots.GamePanel[SpotName].Position, false, false)
    self.setRotationSmooth(Spots.GamePanel[SpotName].Rotation, false, false)
    self.setScale(Spots.GamePanel[SpotName].Scale)
end

-- Params: {Text="", Var="", Default=""}
function ReadTag(Params)
    -- returns a value read from a line of text:  ex: System:ABCDE; will return ABCDE,or the default value if not found...
    if Params.Default == nil then
        Params.Default = ""
    end

    local VarValue = string.match(Params.Text, Params.Var .. ":.-;")
    if VarValue == nil then
        return Params.Default
    else
        VarValue = string.sub(VarValue, string.len(Params.Var) + 2, -2)
        return VarValue
    end
end
