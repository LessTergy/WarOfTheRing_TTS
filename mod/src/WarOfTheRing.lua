require('!/MapController')
require('!/IdController')
require('!/BreakingOfTheFellowshipController')
require('!/FateOfEreborExpansionController')
require('!/KingsExpansionController')

HuntBoxZoneID = "b06145"

GamePanelID = "6158a0"
SoundCubeID = "74cc15"
FellowshipRedZoneID = "458285"
FellowshipYellowZoneID = "652513"

-- Turn info
Round = 0
Turn = 0 -- count of turns
Phase = 0 -- tracks phase of the turn (1-6)
Mute = false -- mute sound?
Guide = ""
GuideLevel = 0
SearchingFellowship = false
CompactMode = false

-- expansions
LordsOfMiddleEarth = false
WarriorsOfMiddleEarth = false
KingsOfMiddleEarth = false
TheBreakingOfTheFellowship = false
TheFateOfErebor = false

-- settings
Scripting = true
RulesWarnings = true

-- boardsize
local BoardX = 36.5
local BoardZ = 25.0

-- victory points
VictoryPoints = { Shadow = 0, FreePeoples = 0 }

-- dice table
Dice = {
    Action = {
        -- Type
        Shadow = {
            -- Side
            Rolling = false,
            RollingTable = {}, -- list of combat dice actively rolling.
            RolledTable = {}, -- list of combat dice finished rolling.
            ResultTable = {}, -- table of roll results.
            ResultText = ""
        },
        -- Shadow
        FreePeoples = {
            -- Player
            Rolling = false,
            RollingTable = {}, -- list of combat dice actively rolling.
            RolledTable = {}, -- list of combat dice finished rolling.
            ResultTable = {}, -- table of roll results.
            ResultText = ""
        }
        -- FreePeoples
    },
    Stats = {
        Combat = {
            FreePeoples = { RollCount = 0, Results = { 0, 0, 0, 0, 0, 0 } },
            Shadow = { RollCount = 0, Results = { 0, 0, 0, 0, 0, 0 } }
        },
        -- Combat
        Action = {
            Shadow = { RollCount = 0, Results = {} },
            -- {Face="",Count=0}
            FreePeoples = { RollCount = 0, Results = {} }
            -- {Face="",Count=0}
        }
        -- Action
    }
    -- Stats
}

Nations = { "Dwarves", "Elves", "Gondor", "North", "Rohan", "Haradrim", "Isengard", "Sauron" }

PoliticalTrack = {
    -- Political Track Levels: 0=AtWar,1-3=AtPeace (1=closest to war)
    Gondor = { ID = "8ab5c1", Active = false, Level = 2, AtWar = false },
    Rohan = { ID = "f5ca1b", Active = false, Level = 3, AtWar = false },
    North = { ID = "07e059", Active = false, Level = 3, AtWar = false },
    Dwarves = { ID = "a55f2c", Active = false, Level = 3, AtWar = false },
    Elves = { ID = "fc2440", Active = true, Level = 3, AtWar = false },
    Sauron = { ID = "75a065", Active = true, Level = 1, AtWar = false },
    Isengard = { ID = "7f39c1", Active = true, Level = 1, AtWar = false },
    Haradrim = { ID = "52aff9", Active = true, Level = 2, AtWar = false }
}

Spots = {
    Compact = {
        CompanionCards = {
            Separated = {
                { -51.5, 0.98, -33 },
                { -56.5, 0.98, -33 },
                { -61.5, 0.98, -33 },
                { -46.5, 0.98, -45 },
                { -51.5, 0.98, -45 },
                { -56.5, 0.98, -45 },
                { -61.5, 0.98, -45 },
                { -66.5, 0.98, -45 },
                { -71.5, 0.98, -45 }
            },
            Searched = {
                { -52, 6, -25 },
                { -47, 6, -25 },
                { -42, 6, -25 },
                { -37, 6, -25 },
                { -32, 6, -25 },
                { -27, 6, -25 },
                { -22, 6, -25 },
                { -57, 6, -25 },
                { -62, 6, -25 }
            }
        }
    },
    CompanionCards = {
        Separated = {
            { 21.5, 0.97, 33 },
            { 26.5, 0.97, 33 },
            { 31.5, 0.97, 33 },
            { 36.5, 0.97, 33 },
            { 41.5, 0.97, 33 },
            { 46.5, 0.97, 33 },
            { 51.5, 0.97, 33 },
            { 16.5, 0.97, 33 },
            { 11.5, 0.97, 33 }
        },
        Searched = {
            { 21.5, 6, 26 },
            { 26.5, 6, 26 },
            { 31.5, 6, 26 },
            { 36.5, 6, 26 },
            { 41.5, 6, 26 },
            { 46.5, 6, 26 },
            { 51.5, 6, 26 },
            { 16.5, 6, 26 },
            { 11.5, 6, 26 }
        }
    }
}

function onLoad()
    if getObjectFromGUID(GamePanelID) == nil then
        Scripting = false
    end

    InitRegions()
    InitGrid()

    getObjectFromGUID(FellowshipRedZoneID).setPosition({ 36.5, -2, 26.5 })
    getObjectFromGUID(FellowshipRedZoneID).setScale({ 35, 1, 1 })
    getObjectFromGUID(FellowshipYellowZoneID).setPosition({ 36.35, -2, 26.5 })
    getObjectFromGUID(FellowshipYellowZoneID).setScale({ 35, 1, 1 })
end

function GetNationFromText(Text)
    for F = 1, #Nations do
        if string.find(Text, Nations[F]) ~= nil then
            return Nations[F]
        end
    end

    if string.find(Text, "Elf;") ~= nil then
        return "Elves"
    end

    if string.find(Text, "Dwarf;") ~= nil then
        return "Dwarves"
    end

    if string.find(Text, "North;") ~= nil then
        return "North"
    end

    if string.find(Text, "Northmen;") ~= nil then
        return "North"
    end

    return ""
end

function GetSideFromText(Text)
    if string.find(Text, "Shadow") ~= nil then
        return "Shadow"
    elseif string.find(Text, "FreePeople") ~= nil then
        return "FreePeoples"
    end

    for F = 1, #Nations do
        if string.find(Text, Nations[F]) ~= nil then
            if F > 5 then
                return "Shadow"
            else
                return "FreePeoples"
            end
        end
    end

    return ""
end

function onObjectEnterZone(zone, enter_object)
    if Scripting then
        if zone.getGUID() == HuntBoxZoneID then
            if enter_object.getName() == "Shadow Action Dice" then
                printToAll("Shadow Action Dice added to the Hunt Box.", { 1, 0.4, 0.4 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Shadow Faction Die)" then
                printToAll("Shadow Faction Die added to the Hunt Box.", { 1, 0.4, 0.4 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Balrog Die)" then
                printToAll("Balrog Die added to the Hunt Box.", { 1, 0.4, 0.4 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Gothmog Die)" then
                printToAll("Gothmog Die added to the Hunt Box.", { 1, 0.4, 0.4 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Free Peoples Action Die)" then
                printToAll("Free Peoples Action Die added to the Hunt Box.", { 0.4, 0.4, 1 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Vilya Action Die)" then
                printToAll("Vilya Action Die added to the Hunt Box.", { 0.4, 0.4, 1 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Nenya Action Die)" then
                printToAll("Nenya Action Die added to the Hunt Box.", { 0.4, 0.4, 1 })
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Narya Action Die)" then
                printToAll("Narya Action Die added to the Hunt Box.", { 0.4, 0.4, 1 })
                enter_object.setGMNotes("HuntBox;")
            end
        elseif zone.getGUID() == "ba2c6e" then -- Shadow side of huntbox
            SetDiceFace({ Dice = enter_object, Value = "Eye" })
        elseif zone.getGUID() == "9aab75" then -- FP side of huntbox
            -- DO NOTHING:SetDiceFace({Dice=enter_object,Value="Character"})
        elseif zone.getGUID() == "822861" then -- red hand
            CheckHandLimit({ HandID = "822861", HandColor = "Red" })
        elseif zone.getGUID() == "63b83a" then -- blue hand
            CheckHandLimit({ HandID = "63b83a", HandColor = "Blue" })
        elseif zone.getGUID() == "71d77a" then -- yellow hand
            CheckHandLimit({ HandID = "71d77a", HandColor = "Yellow" })
        elseif zone.getGUID() == "588435" then -- green hand
            CheckHandLimit({ HandID = "588435", HandColor = "Green" })
        elseif zone.getGUID() == "128335" then -- fellowship card zone
            -- card and companion tag, but not already tagged as fellowship?
            if
                enter_object.type == "Card" and enter_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" and
                string.find(enter_object.getDescription(), "Companion;") ~= nil and
                string.find(enter_object.getDescription(), "Fellowship;") == nil
            then
                enter_object.setDescription(enter_object.getDescription() .. "Fellowship;")
                FellowshipMenu()
            end
        end
    end
end

function onObjectLeaveZone(zone, leave_object)
    if Scripting then
        if zone.getGUID() == HuntBoxZoneID then
            if leave_object.getName() == "Shadow Action Dice" then
                printToAll("Shadow Action Dice removed from the Hunt Box.", { 1, 0.4, 0.4 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Shadow Faction Die)" then
                printToAll("Shadow Faction Die removed from the Hunt Box.", { 1, 0.4, 0.4 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Balrog Die)" then
                printToAll("Balrog Die removed from the Hunt Box.", { 1, 0.4, 0.4 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Gothmog Die)" then
                printToAll("Gothmog Die removed from the Hunt Box.", { 1, 0.4, 0.4 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Free Peoples Action Die)" then
                printToAll("Free Peoples Action Die recovered from the Hunt Box.", { 0.4, 0.4, 1 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Vilya Action Die)" then
                printToAll("Vilya Action Die removed from the Hunt Box.", { 0.4, 0.4, 1 })
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Nenya Action Die)" then
                if leave_object.getRotationValue() == "Character + Remove" then
                    printToAll("Nenya Action Die recovered from the Hunt Box.", { 0.4, 0.4, 1 })
                else
                    printToAll("Nenya Action Die removed from the Hunt Box.", { 0.4, 0.4, 1 })
                end

                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Narya Action Die)" then
                if leave_object.getRotationValue() == "Character" then
                    printToAll("Narya Action Die recovered from the Hunt Box.", { 0.4, 0.4, 1 })
                else
                    printToAll("Narya Action Die removed from the Hunt Box.", { 0.4, 0.4, 1 })
                end

                leave_object.setGMNotes("")
            end
        elseif zone.getGUID() == "822861" then -- red hand
            CheckHandLimit({ HandID = "822861", HandColor = "Red" })
        elseif zone.getGUID() == "63b83a" then -- blue hand
            CheckHandLimit({ HandID = "63b83a", HandColor = "Blue" })
        elseif zone.getGUID() == "71d77a" then -- yellow hand
            CheckHandLimit({ HandID = "71d77a", HandColor = "Yellow" })
        elseif zone.getGUID() == "588435" then -- green hand
            CheckHandLimit({ HandID = "588435", HandColor = "Green" })
        elseif zone.getGUID() == "128335" then -- fellowship card zone
            -- not actively searching the fellowship?
            if not SearchingFellowship then
                -- card and and fellowship tag
                if
                    leave_object.type == "Card" and leave_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" and
                    string.find(leave_object.getDescription(), "Fellowship;") ~= nil
                then
                    leave_object.setDescription(string.gsub(leave_object.getDescription(), "Fellowship;", ""))
                    FellowshipMenu()
                end
            end
        end
    end
end

function onObjectLeaveContainer(Container, Leave_Object)
    if Scripting then
        if
            Container.getGUID() == "8c377e" or Container.getGUID() == "6508fd" or Container.getGUID() == "6d8b6f" or
            Container.getGUID() == "f429d8"
        then -- SP Event Decks
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = { -0.875, 0.2, 1.4 },
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = { 1, 0.5, 0.5 },
                    font_color = { 0, 0, 0 },
                    tooltip = "Discard"
                }
            )
        elseif
            Container.getGUID() == "240819" or Container.getGUID() == "ba06c3" or Container.getGUID() == "992fc5" or
            Container.getGUID() == "d3fdbc"
        then -- FPP Event Decks
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = { -0.875, 0.2, 1.4 },
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = { 0.5, 0.5, 1 },
                    font_color = { 0, 0, 0 },
                    tooltip = "Discard"
                }
            )
        elseif Container.getGUID() == "f8a472" then -- SP Faction Deck
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = { -0.875, 0.2, 1.4 },
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = { 1, 0.5, 0.5 },
                    font_color = { 0, 0, 0 },
                    tooltip = "Discard"
                }
            )
        elseif Container.getGUID() == "6897dc" then -- FPP Faction Deck
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = { -0.875, 0.2, 1.4 },
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = { 0.5, 0.5, 1 },
                    font_color = { 0, 0, 0 },
                    tooltip = "Discard"
                }
            )
        end
    end
end

function onObjectSearchEnd(Object, PlayerColor)
    if Object.getGUID() == "002387" then
        Object.shuffle()
        printToAll("Shuffling Hunt Pool")
    elseif Object.getGUID() == "043c9c" then
        Object.shuffle()
        printToAll("Shuffling Companion Random Pool")
    end
end

-- {Dice=Object,Value="Eye"}
function SetDiceFace(Params)
    -- if object is a die and has the specified face, then rotates to it, otherwise does nothing
    if Params.Dice ~= nil then
        if Params.Dice.type == "Dice" then
            for _, FF in pairs(Params.Dice.getRotationValues()) do
                if string.find(FF.value, Params.Value) ~= nil then
                    if not CompactMode and string.find(Params.Dice.getDescription(), "FreePeoples;") ~= nil then
                        Params.Dice.setRotationSmooth(
                            { FF.rotation[1], FF.rotation[2] + 180, FF.rotation[3] },
                            false,
                            false
                        )
                    else
                        Params.Dice.setRotationSmooth(FF.rotation, false, false)
                    end

                    break
                end
            end
        end
    end
end

-- {HandID="",HandColor=""}
function CheckHandLimit(Params)
    if getObjectFromGUID(GamePanelID) ~= nil then
        local EventLimit = 6
        local FactionLimit = 4
        local EventCount = 0
        local FactionCount = 0
        local AlertText = ""
        if
            (getObjectFromGUID(GamePanelID).getVar("Versus") == "1v2" and
                (Params.HandColor == "Red" or Params.HandColor == "Yellow")) or
            getObjectFromGUID(GamePanelID).getVar("Versus") == "2v2"
        then
            EventLimit = 4
            FactionLimit = 3
        end

        -- check hand limit
        for O, Obj in pairs(getObjectFromGUID(Params.HandID).getObjects()) do
            if Obj.type == "Card" then
                if string.find(Obj.getDescription(), "Event;") ~= nil then
                    EventCount = EventCount + 1
                elseif string.find(Obj.getDescription(), "Faction;") ~= nil then
                    FactionCount = FactionCount + 1
                end
            end
        end

        -- check for alert
        if EventCount > EventLimit then
            AlertText =
                "Discard " ..
                (EventCount - EventLimit) ..
                " Event Card(s) (In Hand: " .. EventCount .. ", Limit: " .. EventLimit .. ")"
        end

        if FactionCount > FactionLimit then
            AlertText =
                AlertText ..
                "\nDiscard " ..
                (FactionCount - FactionLimit) ..
                " Faction Card(s) (In Hand: " .. FactionCount .. ", Limit: " .. FactionLimit .. ")"
        end

        -- display alert?
        getObjectFromGUID(Params.HandID).clearButtons()
        if AlertText ~= "" and RulesWarnings then
            local TextColor = { 1, 1, 0, 0.9 }
            if Params.HandColor == "Red" then
                TextColor = { 1, 0, 0, 0.9 }
            elseif Params.HandColor == "Blue" then
                TextColor = { 0, 0, 1, 0.9 }
            elseif Params.HandColor == "Green" then
                TextColor = { 0, 1, 0, 0.9 }
            end

            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = "HAND LIMIT EXCEEDED!",
                    position = { 0.002, 0, 3.002 },
                    scale = { 0.25, 1, 1 },
                    rotation = { 0, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = { 0, 0, 0, 0.9 }
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = AlertText,
                    position = { 0.002, 0, 2.502 },
                    scale = { 0.25, 1, 1 },
                    rotation = { 0, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 75,
                    font_color = { 0, 0, 0, 0.9 }
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = "HAND LIMIT EXCEEDED!",
                    position = { 0, 0.002, 3 },
                    scale = { 0.25, 1, 1 },
                    rotation = { 0, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = TextColor
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = AlertText,
                    position = { 0, 0.002, 2.5 },
                    scale = { 0.25, 1, 1 },
                    rotation = { 0, 180, 0 },
                    width = 0,
                    height = 0,
                    font_size = 75,
                    font_color = TextColor
                }
            )
        end
    end
end

-- {ID = "", BagID = "", Name = "", Description = ""}
function RemoveObjectFromGame(Params)
    if Params.ID == nil then
        Params.ID = ""
    end

    if Params.BagID == nil then
        Params.BagID = ""
    end

    if Params.Name == nil then
        Params.Name = ""
    end

    if Params.Description == nil then
        Params.Description = ""
    end

    if Params.Logs == nil then
        Params.Logs = false
    end

    local GraveObj = getObjectFromGUID("416864")
    local Obj = getObjectFromGUID(Params.ID)
    if Obj ~= nil then
        if Params.Logs then
            print("Removing Object:", Params.ID, " ", Obj.getName())
        end
        GraveObj.putObject(Obj)
        return
    end

    local bagObj = getObjectFromGUID(Params.BagID)
    if bagObj ~= nil then
        local bagObjects = bagObj.getObjects()
        for _, Item in pairs(bagObjects) do
            if
                (Params.ID == "" or Params.ID == Item.guid) and (Params.Name == "" or Params.Name == Item.name) and
                (Params.Description == "" or string.find(Item.description, Params.Description) ~= nil)
            then
                local FoundObj = bagObj.takeObject({ guid = Item.guid })
                if Params.Logs then
                    print("Removing Item:", Item.guid, " ", Item.name, "/", FoundObj.getGUID(), ":", FoundObj.getName(),
                        " from Container:", bagObj.getGUID())
                end
                GraveObj.putObject(FoundObj)
                return
            end
        end
    end

    for _, Obj in pairs(getAllObjects()) do
        if
            Params.ID == nil and (Params.Name == "" or Obj.getName() == Params.Name) and
            (Params.Description == "" or string.find(Obj.getDescription(), Params.Description) ~= nil)
        then
            if Params.Logs then
                print("Removing Object::", Params.Name, "/", Obj.getGUID(), ":", Obj.getName())
            end
            GraveObj.putObject(Obj)
            return
        end
    end
end

--{Name="",FromLocation="",ToLocation="",Smooth=true,Position={x,y,z},Rotation={x,y,z}}
function PositionUnit(Params)
    local Result = false
    if Params.Smooth == nil then
        Params.Smooth = false
    end

    for O, Obj in pairs(getAllObjects()) do
        if Obj.getName() == Params.Name then
            -- print("Found:",Obj.getName(),";'",Obj.getGMNotes(),"'")
            if Obj.getGMNotes() == "Region:" .. Params.FromLocation .. ";" then
                printToAll(
                    "Moving " .. Params.Name .. " from " .. Params.FromLocation .. " to " .. Params.ToLocation .. "."
                )
                if Params.Smooth then
                    Obj.setPositionSmooth(Params.Position, false, false)
                    if Params.Rotation ~= nil then
                        Obj.setRotationSmooth(Params.Rotation, false, false)
                    end
                else
                    Obj.setPosition(Params.Position)
                    if Params.Rotation ~= nil then
                        Obj.setRotation(Params.Rotation)
                    end
                end

                Obj.setGMNotes("Region:" .. Params.ToLocation .. ";")
                Result = true
                break
            end
        end
    end

    if not Result then
        printToAll(
            "Failed to move " .. Params.Name .. " from " .. Params.FromLocation .. " to " .. Params.ToLocation .. "!",
            { 1, 0.75, 0.5 }
        )
    end

    return Result
end

function MoveUnit(UnitName, ID1, ID2, ID3, ID4, FromLocation, ToLocation, ToPosition)
    local UnitObj = getObjectFromGUID(ID1)
    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID2)
    end

    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID3)
    end

    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID4)
    end

    if UnitObj ~= nil then
        printToAll("Moving " .. UnitName .. " from " .. FromLocation .. " to " .. ToLocation .. ".")
        UnitObj.setPositionSmooth(ToPosition, false, true)
        UnitObj.setGMNotes("Region:" .. ToLocation .. ";")
    else -- uhoh, could not find unit
        printToAll("Failed to move " .. UnitName .. " from " .. FromLocation .. " to " .. ToLocation .. "!")
    end
end

-- player=""
function ShuffleHand(Params)
    if true then
        return true
    end

    -- Code by SuperSpitzi
    function SubShuffle(j)
        for i = #j, 2, -1 do
            local n = math.random(i)
            j[i], j[n] = j[n], j[i]
        end

        return j
    end

    local HandObj = Player[Params.player].getHandObjects()
    if #HandObj > 0 then
        local Card = {}
        for i, j in pairs(HandObj) do
            Card[i] = j.getPosition()
        end

        local shuffledObj = SubShuffle(HandObj)
        local shuffledCard = SubShuffle(Card)
        for i, j in pairs(shuffledObj) do
            j.setPosition(shuffledCard[i])
        end
    end
end

-- {Text="",Var="",Default=""}
function ReadTag(Params)
    -- returns a value read from a line of text:  ex: System:ABCDE; will return ABCDE,or the default value if not found
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

-- {Text="",Tag=""} return the new text string.
function RemoveTag(Params)
    if Params.Text == nil then
        return ""
    end

    local TagString = string.match(Params.Text, Params.Tag .. ":.-;")
    if TagString == nil then
        return Params.Text
    else
        return string.gsub(Params.Text, TagString, "")
    end
end

-- {Text="",Tag="",Value=""}  return the new text string.
function UpdateTag(Params)
    if Params.Tag == nil then
        Params.Tag = Params.Var
    end

    local TagString = string.match(Params.Text, Params.Tag .. ":.-;")
    if TagString == nil then
        return Params.Text .. Params.Tag .. ":" .. Params.Value .. ";"
    else
        return string.gsub(Params.Text, TagString, Params.Tag .. ":" .. Params.Value .. ";")
    end
end

-- {ID=#}
function PlaySound(Params)
    if not Mute and getObjectFromGUID(SoundCubeID) ~= nil then
        getObjectFromGUID(SoundCubeID).AssetBundle.playTriggerEffect(Params.ID)
    end
end

-- {UnitObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function UnitEvent(Params)
    if Scripting then
        local UnitNation = GetNationFromText(Params.UnitObj.getDescription())
        local Side = GetSideFromText(UnitNation)
        if Params.Event == "Load" then
            -- 3D eagles?
            if string.find(Params.UnitObj.getDescription(), "3D;Eagles;") ~= nil then
                Params.UnitObj.setPositionSmooth(
                    {
                        Params.UnitObj.getPosition().x,
                        Params.UnitObj.getPosition().y + 2,
                        Params.UnitObj.getPosition().z,
                        false,
                        true
                    }
                )
            end

            Params.UnitObj.setGMNotes("Region:" .. GetGridRegion({ Position = Params.UnitObj.getPosition() }) .. ";")
        elseif Params.Event == "Pickup" then
            Params.UnitObj.setVar("PickedUp", true)
            Params.UnitObj.setGMNotes("Region:" .. GetGridRegion({ Position = Params.UnitObj.getPosition() }) .. ";")
        elseif Params.Event == "Drop" then
            if Params.UnitObj.getVar("PickedUp") then
                Params.UnitObj.setVar("PickedUp", false)
                -- remove picked up flag.
                local LastRegion =
                    ReadTag({ Text = Params.UnitObj.getGMNotes(), Var = "Region", Default = "out of play" })
                local Region = GetGridRegion({ Position = Params.UnitObj.getPosition() })
                -- if unit changed regions
                if Region ~= LastRegion then
                    -- if dropped into play
                    if
                        Region ~= "" and Params.UnitObj.getPosition().x < BoardX and
                        Params.UnitObj.getPosition().x > -BoardX and
                        Params.UnitObj.getPosition().z < BoardZ and
                        Params.UnitObj.getPosition().z > -BoardZ
                    then
                        -- sound effect?
                        if Params.UnitObj.getName() == "Nazgul" then
                            local Scream = getObjectFromGUID("c35be9").getVar("Scream")
                            if Scream == "Never" then
                                -- do not scream please.
                            elseif Scream == "Always" then
                                -- scream
                                PlaySound({ ID = 8 })
                            elseif Region ~= "Nazgul Reinforcements" and LastRegion == "Nazgul Reinforcements" then
                                PlaySound({ ID = 8 })
                                -- scream
                            end
                        elseif Params.UnitObj.getName() == "The Ring-bearers" and Region == "Mount Doom 1" then
                            PlaySound({ ID = 7 })
                            -- cracks of doom.
                            broadcastToAll("Reminder: Rebuild the Hunt Pool for the Mordor Track.", { 1, 1, 0 })
                        elseif Params.UnitObj.getName() == "The Ring-bearers" and Region == "Crack of Doom" then
                            -- corruption 12?
                            if getObjectFromGUID("abe1b3").getPosition().x < 23.5 then
                                -- ring destroyed!
                                broadcastToAll(
                                    "Free Peoples Victory Detected!\n(The One Ring was destroyed)",
                                    { 1, 1, 0 }
                                )
                                PlaySound({ ID = 39 })
                            else
                                printToAll("The Ring-bearers reached the Crack of Doom, but were Corrupted!")
                            end
                        elseif LastRegion == "" and Region ~= "" then
                            if Params.UnitObj.getName() == "Gandalf the White: Emissary from the West" then
                                -- i've been sent back
                                PlaySound({ ID = 9 })
                            elseif Params.UnitObj.getName() == "Aragorn: Heir to Isildur" then
                                -- stand!
                                PlaySound({ ID = 31 })
                            elseif Params.UnitObj.getName() == "Gollum" then -- "Gollum: Slave of the Ring" then
                                -- gollum
                                PlaySound({ ID = 14 })
                            elseif Params.UnitObj.getName() == "Smeagol" then -- "Smeagol: Tamed Wretch" then
                                -- smeagol
                                PlaySound({ ID = 16 })
                            elseif Params.UnitObj.getName() == "Lady Galadriel: Keeper of Nenya" then
                                -- task
                                PlaySound({ ID = 30 })
                            elseif Params.UnitObj.getName() == "Lord Elrond: Keeper of Vilya" then
                                -- unite
                                PlaySound({ ID = 29 })
                            elseif Params.UnitObj.getName() == "Treebeard: Tree-herd" then
                                -- no curse
                                PlaySound({ ID = 34 })
                            elseif Params.UnitObj.getName() == "Saruman: Corrupted Wizard" then
                                -- A new power
                                PlaySound({ ID = 10 })
                            elseif string.find(Params.UnitObj.getName(), "The Witch") ~= nil then
                                -- break him
                                PlaySound({ ID = 25 })
                            elseif string.find(Params.UnitObj.getName(), "The Mouth of Sauron") ~= nil then
                                -- welcome
                                PlaySound({ ID = 27 })
                            elseif Params.UnitObj.getName() == "Balrog: Evil of the Ancient World" then
                                -- roar!
                                PlaySound({ ID = 28 })
                            elseif Params.UnitObj.getName() == "Gothmog: Lieutenant of Morgul" then
                                -- fear
                                PlaySound({ ID = 26 })
                            elseif Params.UnitObj.getName() == "Ugluk: Chieftain of the Uruk-Hai" then
                                -- ugluk
                                PlaySound({ ID = 54 })
                            elseif Params.UnitObj.getName() == "The Shadow of Mirkwood: Chieftain of the Dark Lord" then
                                -- vampire king
                                PlaySound({ ID = 53 })
                            elseif Params.UnitObj.getName() == "The Black Serpent: Chieftain of the Haradrim" then
                                PlaySound({ ID = 52 })
                                -- black serpent
                            end
                            -- if character from out of play
                        end
                        -- if sound effect?
                        -- companion removed from fellowship?
                        if
                            LastRegion == "Fellowship Box" and
                            string.find(Params.UnitObj.getDescription(), "Companion;") ~= nil
                        then
                            SeparateCompanionFromFellowship(Params.UnitObj.getName())
                        elseif
                            Region == "Fellowship Box" and
                            string.find(Params.UnitObj.getDescription(), "Companion;") ~= nil
                        then
                            -- return companion to fellowship
                            ReturnCompanionToFellowship(Params.UnitObj)
                        end

                        -- Validate Movement depending on unit type: Nazgul, Companion, Minion, Leader or Army Unit
                        function ValidateMoveCoroutine()
                            if Regions[Region].Type == "Region" then
                                local RegionNation = Regions[Region].Nation
                                -- rename to match for comparison.
                                if RegionNation == "Southron/Easterling" then
                                    RegionNation = "Haradrim"
                                end

                                -- tally units in this region
                                local AllyArmyCount = 0
                                local EnemyArmyCount = 0
                                for O, Obj in pairs(getAllObjects()) do
                                    if string.find(Obj.getGMNotes(), "Region:" .. Region .. ";") ~= nil then
                                        if
                                            string.find(Obj.getDescription(), "Regular;") ~= nil or
                                            string.find(Obj.getDescription(), "Elite;") ~= nil
                                        then
                                            if string.find(Obj.getDescription(), Side .. ";") ~= nil then
                                                AllyArmyCount = AllyArmyCount + 1
                                            else
                                                EnemyArmyCount = EnemyArmyCount + 1
                                            end
                                        end
                                    end
                                end

                                coroutine.yield(0)
                                -- what type of unit?
                                if Params.UnitObj.getName() == "Saruman: Corrupted Wizard" then
                                    if Region ~= "Orthanc" then
                                        broadcastToAll("Warning: Saruman can never leave Orthanc.", { 1, 1, 0 })
                                    end
                                elseif
                                    Params.UnitObj.getName() == "Nazgul" or
                                    string.find(Params.UnitObj.getName(), "The Witch-King") ~= nil
                                then
                                    -- Nazgul cannot enter region with a stronghold controlled by FP unless it is besieged
                                    if
                                        Regions[Region].Settlement == "Stronghold" and
                                        Regions[Region].Control == "FreePeoples" and
                                        AllyArmyCount < 1
                                    then
                                        printToAll(
                                            "Reminder: Nazgul cannot enter a Region with a Stronghold controlled by the Free Peoples unless it is besieged.",
                                            { 1, 1, 0 }
                                        )
                                    end
                                elseif string.find(Params.UnitObj.getName(), "Minion;") ~= nil then
                                elseif string.find(Params.UnitObj.getName(), "Companion;") ~= nil then
                                elseif string.find(Params.UnitObj.getName(), "Character;") ~= nil then
                                elseif UnitNation ~= "" and UnitNation ~= nil then
                                    coroutine.yield(0)
                                    -- regular or elite army unit?
                                    if
                                        string.find(Params.UnitObj.getDescription(), "Regular;") ~= nil or
                                        string.find(Params.UnitObj.getDescription(), "Elite;") ~= nil
                                    then
                                        AllyArmyCount = AllyArmyCount + 1 -- include this unit in the stack count.
                                        if Params.Color ~= nil then
                                            printToAll("(Army Stack Count: " .. AllyArmyCount .. ")", Params.Color)
                                        else
                                            printToAll("(Army Stack Count: " .. AllyArmyCount .. ")")
                                        end
                                    end

                                    if AllyArmyCount > 10 then
                                        broadcastToAll(
                                            "Warning: Army stacking limit of 10 exceeded at " .. Region .. ".",
                                            { 1, 1, 0 }
                                        )
                                    end

                                    -- crossed into another nation?
                                    if RegionNation ~= UnitNation and RegionNation ~= "" then
                                        -- entered a different nation, and not at war?
                                        if not PoliticalTrack[UnitNation].AtWar then
                                            broadcastToAll(
                                                "Warning: A " ..
                                                UnitNation ..
                                                " Unit entered another nation (" ..
                                                RegionNation .. "), but is not yet At War.",
                                                { 1, 1, 0 }
                                            )
                                        elseif not PoliticalTrack[RegionNation].Active then
                                            if
                                                (UnitNation == "Haradrim" or UnitNation == "Isengard" or
                                                    UnitNation == "Sauron") and
                                                Regions[Region].Side == "FreePeoples" or
                                                (UnitNation == "Elves" or UnitNation == "Dwarves" or
                                                    UnitNation == "North" or
                                                    UnitNation == "Rohan" or
                                                    UnitNation == "Gondor") and
                                                Regions[Region].Side == "Shadow"
                                            then
                                                broadcastToAll(
                                                    "Reminder: Entering an opposing Nation's border usually Activates them.",
                                                    { 1, 1, 0 }
                                                )
                                            end
                                        end
                                    end
                                end
                            end
                            -- if (dropped into Region)
                            coroutine.yield(0)
                            return 1
                        end

                        if RulesWarnings and Regions[Region] ~= nil then
                            startLuaCoroutine(Global, "ValidateMoveCoroutine")
                        end
                    else -- dropped out of play
                        if Params.UnitObj.getName() == "Gandalf the Grey" then
                            PlaySound({ ID = 6 })
                            -- sorrow
                        end
                    end
                    -- if dropped into play
                end
                -- if Region ~= LastRegion
                if LastRegion == "" then
                    LastRegion = "out of play"
                end

                if Region == "" then
                    Region = "out of play"
                end

                -- update notes
                Params.UnitObj.setGMNotes("Region:" .. Region .. ";")
                if Params.Color ~= nil then
                    printToAll(
                        "\n" ..
                        Params.Color ..
                        " Player moved " ..
                        Params.UnitObj.getName() .. " from " .. LastRegion .. " to " .. Region .. ".",
                        Params.Color
                    )
                else
                    printToAll(
                        "\n" .. Params.UnitObj.getName() .. " moved from " .. LastRegion .. " to " .. Region .. "."
                    )
                end
            end
        elseif Params.Event == "Collide" then
        elseif Params.Event == "Destroy" then
        end
    end
end

-- {ArmyObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function ArmyEvent(Params)
    if Scripting then
        local UnitNation = GetNationFromText(Params.ArmyObj.getDescription())
        local Side = GetSideFromText(UnitNation)
        if Params.Event == "Load" then
            Params.ArmyObj.setGMNotes("Region:" .. GetGridRegion({ Position = Params.ArmyObj.getPosition() }) .. ";")
        elseif Params.Event == "Pickup" then
            Params.ArmyObj.setVar("PickedUp", true)
            Params.ArmyObj.setGMNotes("Region:" .. GetGridRegion({ Position = Params.ArmyObj.getPosition() }) .. ";")
        elseif Params.Event == "Drop" then
            if Params.ArmyObj.getVar("PickedUp") then
                Params.ArmyObj.setVar("PickedUp", false)
                -- remove picked up flag.
                local LastRegion =
                    ReadTag({ Text = Params.ArmyObj.getGMNotes(), Var = "Region", Default = "out of play" })
                local Region = GetGridRegion({ Position = Params.ArmyObj.getPosition() })
                -- if unit changed regions
                if Region ~= LastRegion then
                    -- if dropped into play
                    if
                        Region ~= "" and Params.ArmyObj.getPosition().x < BoardX and
                        Params.ArmyObj.getPosition().x > -BoardX and
                        Params.ArmyObj.getPosition().z < BoardZ and
                        Params.ArmyObj.getPosition().z > -BoardZ
                    then
                        -- allies in this region?
                    end
                    -- if dropped into play
                end

                if LastRegion == "" then
                    LastRegion = "out of play"
                end

                if Region == "" then
                    Region = "out of play"
                end

                -- update notes
                Params.ArmyObj.setGMNotes("Region:" .. Region .. ";")
                if Params.Color ~= nil then
                    printToAll(
                        "\n" ..
                        Params.Color ..
                        " Player moved " ..
                        Params.ArmyObj.getName() .. " from " .. LastRegion .. " to " .. Region .. ".",
                        Params.Color
                    )
                else
                    printToAll(
                        "\n" .. Params.ArmyObj.getName() .. " moved from " .. LastRegion .. " to " .. Region .. "."
                    )
                end
            end
        elseif Params.Event == "Collide" then
        elseif Params.Event == "Destroy" then
        end
    end
end

-- {MarkerObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function SettlementControlMarkerEvent(Params)
    if not Scripting then
        return
    end

    local Region = GetGridRegion({ Position = Params.MarkerObj.getPosition() })
    local Control = ReadTag({ Text = Params.MarkerObj.getGMNotes(), Var = "Control", Default = "" })

    if Region == "" then
        return
    end

    Params.MarkerObj.setName(Region)
    Params.MarkerObj.setDescription(
        "SettlementControlMarker;" .. Regions[Region].Settlement .. ";" .. Regions[Region].Side .. ";"
    )
    Regions[Region].Control = GetControlMarkerSide(Params.MarkerObj)

    -- what type of event?
    if Params.Event == "Load" then

    elseif Params.Event == "Pickup" then
        Params.MarkerObj.setVar("PickedUp", true)
    elseif Params.Event == "Drop" then
        if Params.MarkerObj.getVar("PickedUp") then
            -- remove picked up flag
            Params.MarkerObj.setVar("PickedUp", false)
        end
    elseif Params.Event == "Collide" then
        -- control changed?
        if Control ~= Regions[Region].Control then
            -- unconquered?
            if Regions[Region].Control == Regions[Region].Side then
                printToAll(
                    "\n" .. Region .. " is under " .. Regions[Region].Control .. " control (Unconquered)."
                )
            else
                printToAll("\n" .. Region .. " is under " .. Regions[Region].Control .. " control (Conquered).")
            end

            UpdateHelmsDeepControl(Region)

            -- re-calc victory points
            CalculateVictoryPoints()
        end
    elseif Params.Event == "Destroy" then
    end

    Params.MarkerObj.setGMNotes("Region:" .. Region .. ";Control:" .. Regions[Region].Control .. ";")
end

function GetControlMarkerSide(ControlMarkerObject)
    local rotation = ControlMarkerObject.getRotation().z
    if rotation > 90 and rotation < 270 then
        return "Shadow"
    else
        return "FreePeoples"
    end
end

function CalculateVictoryPoints()
    -- calculate victory points for both sides
    VictoryPoints.FreePeoples = 0
    VictoryPoints.Shadow = 0
    for SCM, SCMObj in pairs(getAllObjects()) do
        if string.find(SCMObj.getDescription(), "SettlementControlMarker;") ~= nil then
            -- if under shadow control
            if Regions[SCMObj.getName()].Control == "Shadow" then
                if Regions[SCMObj.getName()].Control == "Shadow" and Regions[SCMObj.getName()].Side == "FreePeoples" then
                    VictoryPoints.Shadow = VictoryPoints.Shadow + Regions[SCMObj.getName()].Points
                end
            else -- must be FreePeoples controlled
                if Regions[SCMObj.getName()].Control == "FreePeoples" and Regions[SCMObj.getName()].Side == "Shadow" then
                    VictoryPoints.FreePeoples = VictoryPoints.FreePeoples + Regions[SCMObj.getName()].Points
                end
            end
        end
    end

    if VictoryPoints.FreePeoples == 0 then
        getObjectFromGUID("d0b340").setPositionSmooth({ -25.58, 1.01, -22.65 }, false, false)
    elseif VictoryPoints.FreePeoples >= 10 then
        getObjectFromGUID("d0b340").setPositionSmooth({ -7.2, 1.01, -22.65 }, false, false)
    else
        -- free peoples victory marker.
        getObjectFromGUID("d0b340").setPositionSmooth(
            { -23 + VictoryPoints.FreePeoples * 1.58, 1.01, -22.65 },
            false,
            false
        )
    end

    if VictoryPoints.Shadow == 0 then
        getObjectFromGUID("976dbc").setPositionSmooth({ -25.58, 1.01, -23.65 }, false, false)
    elseif VictoryPoints.Shadow >= 10 then
        getObjectFromGUID("976dbc").setPositionSmooth({ -7.2, 1.01, -23.65 }, false, false)
    else
        -- shadow victory marker.
        getObjectFromGUID("976dbc").setPositionSmooth({ -23 + VictoryPoints.Shadow * 1.58, 1.01, -23.65 }, false, false)
    end
end

-- {TokenObj=Obj,Event="Load"}  Load|Pickup|Drop|Collide|Destroy
function PoliticalTokenEvent(Params)
    if Scripting then
        local Nation = GetNationFromText(Params.TokenObj.getDescription())
        local Side = GetSideFromText(Nation)
        local Level = PoliticalTrack[Nation].Level
        local Active = PoliticalTrack[Nation].Active
        local Color = { 1, 0.5, 0.5 }
        if Side == "FreePeoples" then
            Color = { 0.5, 0.5, 1 }
        end

        if Params.Event == "Load" then
            for P, PI in pairs(PoliticalTrack) do
                if Params.TokenObj.getGUID() == PI.ID then
                    -- Active?
                    if Params.TokenObj.getRotation().z > 90 and Params.TokenObj.getRotation().z < 270 then
                        -- printToAll(Nation..": Active on the Political Track.",Color)
                        PoliticalTrack[Nation].Active = true
                    else
                        -- printToAll(Nation..": not Active on the Political Track.")
                        PoliticalTrack[Nation].Active = false
                    end

                    -- where on the track?
                    if Params.TokenObj.getPosition().z >= 2.5 then
                        PoliticalTrack[Nation].Level = 3
                        PoliticalTrack[Nation].AtWar = false
                    elseif Params.TokenObj.getPosition().z >= -1.2 then
                        PoliticalTrack[Nation].Level = 2
                        PoliticalTrack[Nation].AtWar = false
                    elseif Params.TokenObj.getPosition().z >= -4.6 then
                        PoliticalTrack[Nation].Level = 1
                        PoliticalTrack[Nation].AtWar = false
                    else
                        PoliticalTrack[Nation].Level = 0
                        PoliticalTrack[Nation].AtWar = true
                        printToAll(Nation .. " is At War on the Political Track.", Color)
                    end
                end
            end
        elseif Params.Event == "Pickup" then
            Params.TokenObj.setVar("PickedUp", true)
            Params.TokenObj.setVar("LastLevel", PoliticalTrack[Nation].Level)
        elseif Params.Event == "Drop" then
            if Params.TokenObj.getVar("PickedUp") then
                Params.TokenObj.setVar("PickedUp", false)
                -- remove picked up flag.
                -- where was it dropped onto the track?
                if Params.TokenObj.getPosition().z >= 2.5 then
                    PoliticalTrack[Nation].Level = 3
                    if Level ~= 3 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 3.")
                    end
                elseif Params.TokenObj.getPosition().z >= -1.2 then
                    PoliticalTrack[Nation].Level = 2
                    if Level ~= 2 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 2.")
                    end
                elseif Params.TokenObj.getPosition().z >= -4.6 then
                    PoliticalTrack[Nation].Level = 1
                    if Level ~= 1 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 1.")
                    end
                else -- token must have been dropped At War: flag and blow horn
                    PoliticalTrack[Nation].Level = 0
                    PoliticalTrack[Nation].AtWar = true
                    printToAll(Nation .. " at War!")
                    if not PoliticalTrack[Nation].Active then
                        broadcastToAll(
                            "Warning: " .. Nation .. " was set to At-War, but was not Active yet.",
                            { 1, 1, 0 }
                        )
                    end

                    -- political level changed?  then sound the alarm!
                    if Params.TokenObj.getVar("LastLevel") ~= PoliticalTrack[Nation].Level then
                        if Nation == "Dwarves" then
                            -- Far Over
                            Global.call("PlaySound", { ID = 24 })
                        elseif Nation == "Elves" then
                            -- Elven Horn
                            Global.call("PlaySound", { ID = 22 })
                        elseif Nation == "Gondor" then
                            -- For Gondor!
                            Global.call("PlaySound", { ID = 21 })
                        elseif Nation == "North" then
                            -- North Horn
                            Global.call("PlaySound", { ID = 23 })
                        elseif Nation == "Rohan" then
                            -- rohan horn
                            Global.call("PlaySound", { ID = 20 })
                        elseif Nation == "Haradrim" then
                            -- haradrim horn
                            Global.call("PlaySound", { ID = 17 })
                        elseif Nation == "Isengard" then
                            -- isengard horn
                            Global.call("PlaySound", { ID = 18 })
                        elseif Nation == "Sauron" then
                            Global.call("PlaySound", { ID = 19 })
                            -- sauron music
                        end
                    end
                end
            end
        elseif Params.Event == "Collide" then
            -- check to see if active status changed
            if Params.TokenObj.getRotation().z > 90 and Params.TokenObj.getRotation().z < 270 and Active then
                printToAll(Nation .. ": no longer Active.")
                PoliticalTrack[Nation].Active = false
            elseif (Params.TokenObj.getRotation().z < 90 or Params.TokenObj.getRotation().z > 270) and not Active then
                printToAll(Nation .. ": Activated!", Color)
                PoliticalTrack[Nation].Active = true
            end
        elseif Params.Event == "Destroy" then
        end
    end
end

-- Params: {ID = "", Name = "", Type = "", Position = {x,y,z}, Rotation = {x,y,z}, Smooth = true}
function MoveObject(Params)
    local Obj = nil
    if getObjectFromGUID(Params.ID) ~= nil then
        Obj = getObjectFromGUID(Params.ID)
    else
        if Params.Name == nil then
            Params.Name = ""
        end

        if Params.Type == nil then
            Params.Type = ""
        end

        for SO, SubObj in pairs(getAllObjects()) do
            if
                Params.Name ~= "" and SubObj.getName() == Params.Name and
                (Params.Type == "" or Params.Type == SubObj.type)
            then
                Obj = SubObj
                break
            end
        end
    end

    -- move the object if it was found
    if Obj ~= nil then
        if Params.Smooth == true then
            Obj.setPositionSmooth(Params.Position, false, false)
            if Params.Rotation ~= nil then
                Obj.setRotationSmooth(Params.Rotation, false, false)
            end
        else -- not smooth
            Obj.setPosition(Params.Position)
            if Params.Rotation ~= nil then
                Obj.setRotation(Params.Rotation)
            end
        end
    end
end

function StrongholdMenu(StrongholdObj)
    StrongholdObj.clearButtons()
    local FuncName = ""
    local ToolTip = ""
    if string.find(StrongholdObj.getDescription(), "Besieged;") ~= nil then
        StrongholdObj.createButton(
            {
                click_function = "StrongholdMenu",
                function_owner = Global,
                label = "Besieged",
                position = { 0, 1.5, 0 },
                rotation = { 270, 0, 0 },
                scale = { 1, 1, 1 },
                width = 0,
                height = 0,
                font_size = 500,
                font_color = { 1, 1, 0, 0.95 }
            }
        )
        FuncName = "EndSiege"
        ButtonLabel = "End Siege: " .. StrongholdObj.getName()
        ToolTip = "End Siege\n(" .. StrongholdObj.getName() .. ")"
    else
        FuncName = "StartSiege"
        ButtonLabel = "Besiege: " .. StrongholdObj.getName()
        ToolTip = "Retreat into Siege\n(" .. StrongholdObj.getName() .. ")"
    end

    StrongholdObj.createButton(
        {
            click_function = FuncName,
            function_owner = Global,
            label = "",
            tooltip = ToolTip,
            position = { 0, 0.2, 0 },
            scale = { 1, 1, 1 },
            width = 1400,
            height = 1400,
            color = { 1, 1, 1, 0 }
        }
    )
    local DstObj = getObjectFromGUID(StrongholdObj.getGMNotes())
    if DstObj ~= nil then
        DstObj.clearButtons()
        DstObj.createButton(
            {
                click_function = FuncName,
                function_owner = Global,
                label = ButtonLabel,
                tooltip = ToolTip,
                position = { 2.1, 0, 0 },
                rotation = { 0, 270, 0 },
                scale = { 1, 1, 1 },
                width = 1800,
                height = 250,
                font_size = 125,
                color = { 1, 1, 1, 0.8 }
            }
        )
        if string.find(DstObj.getDescription(), "Shadow;") ~= nil and StrongholdObj.getName() ~= "Erebor" then
            DstObj.createButton(
                {
                    click_function = "StrongholdMenu",
                    function_owner = Global,
                    label = StrongholdObj.getName(),
                    position = { 0, 0.05, 2.2 },
                    scale = { 1, 1, 1 },
                    width = 0,
                    height = 0,
                    font_size = 250,
                    font_color = { 1, 1, 0 }
                }
            )
        end
    end
end

function StartSiege(StrongholdObject)
    function StartSiegeCoroutine()
        local SiegeSpots = nil
        local OriginObject = nil
        local DestinationObject = nil

        local IsStrongholdBox = string.find(StrongholdObject.getDescription(), "StrongholdBox;") ~= nil

        if IsStrongholdBox then
            OriginObject = getObjectFromGUID(StrongholdObject.getGMNotes())
            DestinationObject = StrongholdObject
        else
            OriginObject = StrongholdObject
            DestinationObject = getObjectFromGUID(StrongholdObject.getGMNotes())

            if DestinationObject == nil then
                -- get first open shadow stronghold dst
                if getObjectFromGUID("f994cb").getGMNotes() == "" then
                    DestinationObject = getObjectFromGUID("f994cb")
                    SiegeSpots = {
                        { -30.8, 1.5, -10.2 },
                        { -32,   1.5, -9.15 },
                        { -30.8, 1.5, -9.15 },
                        { -29.5, 1.5, -9.15 },
                        { -32,   1.5, -10.2 },
                        { -29.5, 1.5, -10.2 },
                        { -32,   1.5, -11.25 },
                        { -30.8, 1.5, -11.25 },
                        { -29.5, 1.5, -11.25 }
                    }
                elseif getObjectFromGUID("f84976").getGMNotes() == "" then
                    DestinationObject = getObjectFromGUID("f84976")
                    SiegeSpots = {
                        { -30.8, 1.5, -14.1 },
                        { -32,   1.5, -13 },
                        { -30.8, 1.5, -13 },
                        { -29.5, 1.5, -13 },
                        { -32,   1.5, -14.1 },
                        { -29.5, 1.5, -14.1 },
                        { -32,   1.5, -15.2 },
                        { -30.8, 1.5, -15.2 },
                        { -29.5, 1.5, -15.2 }
                    }
                else -- none available
                    printToAll("No available Shadow Strongholds.", { 1, 1, 0 })
                end
            end
        end

        if OriginObject ~= nil and DestinationObject ~= nil then
            if SiegeSpots == nil then
                SiegeSpots = OriginObject.getTable("SiegeSpots")
            end

            -- inventory region
            local Side = ""
            local Units = {}
            local ArmyCount = 0

            -- which size controls the stronghold? (look for the matching marker).
            for _, Obj in pairs(getAllObjects()) do
                if
                    Obj.getName() == OriginObject.getName() and
                    string.find(Obj.getDescription(), "SettlementControlMarker;") ~= nil
                then
                    Side = GetControlMarkerSide(Obj)
                    break
                end
            end

            coroutine.yield(0)
            if Side ~= "" then
                -- inventory units in the region
                for _, Obj in pairs(getAllObjects()) do
                    -- is object in the correct region?
                    if
                        string.find(Obj.getGMNotes(), "Region:" .. OriginObject.getName() .. ";") ~= nil or
                        string.find(Obj.getGMNotes(), "Region:" .. OriginObject.getName() .. " Stronghold;") ~= nil
                    then
                        -- is object on the correct side?
                        if string.find(Obj.getDescription(), Side .. ";") ~= nil then
                            -- is it a unit, and if so, which type?  Looking for Regular;Elite;Leader;Character;Minion;
                            if
                                string.find(Obj.getDescription(), "Regular;") ~= nil or
                                string.find(Obj.getDescription(), "Elite;") ~= nil
                            then
                                ArmyCount = ArmyCount + 1
                                table.insert(Units, Obj.getGUID())
                            elseif
                                string.find(Obj.getDescription(), "Leader;") ~= nil or
                                string.find(Obj.getDescription(), "Character;") ~= nil or
                                string.find(Obj.getDescription(), "Minion;") ~= nil
                            then
                                table.insert(Units, Obj.getGUID())
                            end
                        end
                    end
                end

                -- must be 5 or less army units
                if #Units <= 0 then
                    printToAll("There are no Units to Retreat into Siege at " .. OriginObject.getName() .. ".",
                        { 1, 1, 0 })
                elseif ArmyCount <= 5 then
                    local Height = 1.5
                    local Index = 0
                    OriginObject.setDescription("Stronghold;Besieged;")
                    for U = 1, #Units do
                        Index = Index + 1
                        if Index > #SiegeSpots then
                            Index = 1
                            Height = Height + 1.5
                        end

                        getObjectFromGUID(Units[U]).setPositionSmooth(
                            { SiegeSpots[Index][1], Height, SiegeSpots[Index][3] },
                            false,
                            false
                        )
                        getObjectFromGUID(Units[U]).setRotationSmooth({ 0, 90, 0 }, false, true)
                        -- if not already in the Stronghold region square
                        if
                            string.find(
                                getObjectFromGUID(Units[U]).getGMNotes(),
                                "Region:" .. OriginObject.getName() .. " Stronghold;"
                            ) == nil
                        then
                            -- change Region to Stronghold Box and update return info
                            getObjectFromGUID(Units[U]).setGMNotes(
                                "Region:" ..
                                OriginObject.getName() ..
                                " Stronghold;PX:" ..
                                string.format("%.3f", getObjectFromGUID(Units[U]).getPosition().x) ..
                                ";PZ:" ..
                                string.format("%.3f", getObjectFromGUID(Units[U]).getPosition().z) ..
                                ";"
                            )
                        end

                        coroutine.yield(0)
                    end

                    coroutine.yield(0)
                    OriginObject.setGMNotes(DestinationObject.getGUID())
                    DestinationObject.setGMNotes(OriginObject.getGUID())
                else -- too many army units.
                    printToAll(
                        "Cannot Retreat into Siege at " ..
                        OriginObject.getName() .. " because there are more than 5 Army Units (" .. ArmyCount .. ").",
                        { 1, 1, 0 }
                    )
                end
            else -- could not determine which side controls the stronghold
                print("Uhoh! Cannot find the Settlement Control Marker for: " .. OriginObject.getName() .. "!")
            end -- if side?
            StrongholdMenu(OriginObject)
        end

        return 1
    end

    startLuaCoroutine(Global, "StartSiegeCoroutine")
end

function EndSiege(StrongholdObj)
    function EndSiegeCoroutine()
        local SrcObj = nil
        local DstObj = nil
        -- src or dst?
        if string.find(StrongholdObj.getDescription(), "StrongholdBox;") ~= nil then
            SrcObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            DstObj = StrongholdObj
        else -- must be src
            SrcObj = StrongholdObj
            DstObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            if DstObj == nil then
                -- get first open shadow stronghold dst
                if getObjectFromGUID("f994cb").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f994cb")
                    SiegeSpots = {
                        { -30.8, 1.5, -10.2 },
                        { -32,   1.5, -9.15 },
                        { -30.8, 1.5, -9.15 },
                        { -29.5, 1.5, -9.15 },
                        { -32,   1.5, -10.2 },
                        { -29.5, 1.5, -10.2 },
                        { -32,   1.5, -11.25 },
                        { -30.8, 1.5, -11.25 },
                        { -29.5, 1.5, -11.25 }
                    }
                elseif getObjectFromGUID("f84976").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f84976")
                    SiegeSpots = {
                        { -30.8, 1.5, -14.1 },
                        { -32,   1.5, -13 },
                        { -30.8, 1.5, -13 },
                        { -29.5, 1.5, -13 },
                        { -32,   1.5, -14.1 },
                        { -29.5, 1.5, -14.1 },
                        { -32,   1.5, -15.2 },
                        { -30.8, 1.5, -15.2 },
                        { -29.5, 1.5, -15.2 }
                    }
                else -- none available
                    printToAll("Not Sieged.", { 1, 1, 0 })
                end
            end
        end

        if SrcObj ~= nil and DstObj ~= nil then
            -- ok to emerge if no enemy army units occupying
            local Side = ""
            local EnemyUnits = {}
            local SiegedUnits = {}
            -- which size controls the stronghold? (look for the matching marker).
            for O, Obj in pairs(getAllObjects()) do
                -- look for marker and units
                if
                    Obj.getName() == SrcObj.getName() and
                    string.find(Obj.getDescription(), "SettlementControlMarker;") ~= nil
                then
                    if Obj.getRotation().z > 90 and Obj.getRotation().z < 270 then
                        Side = "FreePeoples"
                    else
                        Side = "Shadow"
                    end

                    break
                end
            end

            coroutine.yield(0)
            if Side ~= "" then
                -- inventory units in the region
                for O, Obj in pairs(getAllObjects()) do
                    -- Shadow Stronghold box region?
                    if string.find(Obj.getGMNotes(), "Region:Shadow Stronghold 1;") ~= nil then
                        Obj.setGMNotes(
                            "Region:" ..
                            getObjectFromGUID(getObjectFromGUID("f994cb").getGMNotes()).getName() .. " Stronghold;"
                        )
                    elseif string.find(Obj.getGMNotes(), "Region:Shadow Stronghold 2;") ~= nil then
                        Obj.setGMNotes(
                            "Region:" ..
                            getObjectFromGUID(getObjectFromGUID("f84976").getGMNotes()).getName() .. " Stronghold;"
                        )
                    end

                    -- what is the object's region?
                    if string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. " Stronghold;") ~= nil then
                        -- sieged unit?
                        if
                            string.find(Obj.getDescription(), "Regular;") ~= nil or
                            string.find(Obj.getDescription(), "Elite;") ~= nil or
                            string.find(Obj.getDescription(), "Leader;") ~= nil or
                            string.find(Obj.getDescription(), "Character;") ~= nil or
                            string.find(Obj.getDescription(), "Minion;") ~= nil
                        then
                            table.insert(SiegedUnits, Obj.getGUID())
                        end
                    elseif string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. ";") ~= nil then
                        -- enemy army unit?
                        if
                            string.find(Obj.getDescription(), Side .. ";") == nil and
                            (string.find(Obj.getDescription(), "Regular;") ~= nil or
                                string.find(Obj.getDescription(), "Elite;") ~= nil)
                        then
                            table.insert(EnemyUnits, Obj.getGUID())
                        end
                    end
                end

                -- no sieged units?
                if #SiegedUnits <= 0 then
                    SrcObj.setDescription("Stronghold;")
                elseif #EnemyUnits > 0 then
                    printToAll(
                        "Cannot End Siege of " ..
                        SrcObj.getName() .. ", because Enemy Army Units are still present (" .. #EnemyUnits .. ").",
                        { 1, 1, 0 }
                    )
                else -- move sieged units back to board
                    SrcObj.setDescription("Stronghold;")
                    for U = 1, #SiegedUnits do
                        -- has return position?
                        local PX =
                            ReadTag({ Text = getObjectFromGUID(SiegedUnits[U]).getGMNotes(), Var = "PX", Default = "" })
                        local PZ =
                            ReadTag({ Text = getObjectFromGUID(SiegedUnits[U]).getGMNotes(), Var = "PZ", Default = "" })
                        if PX == "" or PZ == "" then
                            getObjectFromGUID(SiegedUnits[U]).setPositionSmooth(
                                { SrcObj.getPosition().x - 0.7 + U * 0.2, U * 1.5, SrcObj.getPosition().z - 0.7 },
                                false,
                                false
                            )
                        else
                            getObjectFromGUID(SiegedUnits[U]).setPositionSmooth(
                                { tonumber(PX), U * 1.5, tonumber(PZ) },
                                false,
                                false
                            )
                        end

                        getObjectFromGUID(SiegedUnits[U]).setGMNotes("Region:" .. SrcObj.getName() .. ";")
                    end

                    -- shadow stronghold?
                    if string.find(DstObj.getDescription(), "Shadow;") ~= nil and SrcObj.getName() ~= "Erebor" then
                        DstObj.setGMNotes("")
                        SrcObj.setGMNotes("")
                        DstObj.clearButtons()
                    end
                end
            else
                print("Uhoh! Cannot find the Settlement Control Marker for: " .. SrcObj.getName() .. "!")
            end

            coroutine.yield(0)
            StrongholdMenu(SrcObj)
        end

        return 1
    end

    startLuaCoroutine(Global, "EndSiegeCoroutine")
end

function DetectGuide()
    -- the guide should be the top card detected.  If no card is detected, look for a deck and return the top card
    local HighestY = 0
    -- id of the highest detected card.
    local HighestID = ""
    -- highest character level to determine if guide is valid.
    local HighestLevel = 0
    local CardLevel = 0
    -- if a deck is detected, remember it's top card in case we don't find a highest card.
    local TopCardName = ""

    for _, Obj in pairs(
        Physics.cast(
            {
                origin = { 32.9, 1, 20.0 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 1, 10, 1 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if Obj.hit_object.type == "Card" and (string.find(Obj.hit_object.getDescription(), "Companion;") ~= nil) then
            if Obj.hit_object.getPosition().y > HighestY then
                HighestY = Obj.hit_object.getPosition().y
                HighestID = Obj.hit_object.getGUID()
            end

            if getObjectFromGUID(HighestID) ~= nil then
                CardLevel =
                    tonumber(
                        ReadTag({ Text = getObjectFromGUID(HighestID).getDescription(), Var = "Level", Default = "0" })
                    )
            end

            if CardLevel > HighestLevel then
                HighestLevel = CardLevel
            end
        elseif Obj.hit_object.tag == "Deck" then
            -- get the top card
            if Obj.hit_object ~= nil then
                if Obj.hit_object.getQuantity() > 1 then
                    TopCardName = Obj.hit_object.getObjects()[1].name
                    -- go through deck to find the highest level

                    for I, Item in pairs(Obj.hit_object.getObjects()) do
                        CardLevel = tonumber(ReadTag({ Text = Item.description, Var = "Level", Default = "0" }))
                        if CardLevel > HighestLevel then
                            HighestLevel = CardLevel
                        end
                    end
                end
            end
        end
    end

    Guide = ""
    GuildeLevel = 0
    if getObjectFromGUID(HighestID) ~= nil then
        TopCardName = getObjectFromGUID(HighestID).getName()
        if TopCardName ~= "" and TopCardName ~= "The Ring-bearers (Frodo & Samwise)" then
            Guide = TopCardName
            GuideLevel =
                tonumber(ReadTag({ Text = getObjectFromGUID(HighestID).getDescription(), Var = "Level", Default = "0" }))
            -- printToAll("\n"..Guide.." (Level:"..GuideLevel..") is the Fellowship Guide.\n", {1,1,0})
            if Round ~= 0 and Guide ~= "Smeagol: Tamed Wretch" and HighestLevel > GuideLevel and RulesWarnings then
                broadcastToAll(
                    "Warning: There are Companions in the Fellowship with a higher level than the Guide.\n(The Guide should be Level: " ..
                    HighestLevel .. ").",
                    { 1, 1, 0 }
                )
            end
        end
    end

    if Guide == "" and Round > 0 then
        printToAll("Warning: Could not determine the Fellowship Guide!", { 1, 1, 0 })
    end

    return Guide
end

function FellowshipMenu()
    SearchingFellowship = false
    local IDs = GetIDs()
    getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
    if CompactMode then
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = { 0, 0, 2 },
                rotation = { 0, 0, 0 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 0.8, 0.8, 1 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = { -37.5, 0, 16.7 },
                rotation = { 0, 0, 0 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 0.8, 0.8, 1 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
    else
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = { 0, 0, -2 },
                rotation = { 0, 0, 0 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 0.8, 0.8, 1 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
    end

    -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.5,-2,26.5})
    -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.5,-2,26.5})
    -- inventory fellowship by counting figures
    local CompanionCount = 0
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = { 27.6, 1, 20.0 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 3, 5, 9.5 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            (Obj.hit_object.type == "Figurine" or Obj.hit_object.type == "Tileset") and
            string.find(Obj.hit_object.getDescription(), "Character;") ~= nil
        then
            CompanionCount = CompanionCount + 1
        end
    end

    -- no more companions?
    if CompanionCount < 1 then
        MoveObject({ Name = "Gollum", Type = "Figurine", Position = { 27.55, 2, 17.45 }, Rotation = { 0, 0, 0 } })
        MoveObject(
            { Name = "Gollum: Slave of the Ring", Type = "Card", Position = { 32.9, 2, 20.0 }, Rotation = { 0, 180, 0 } }
        )
        Guide = "Gollum: Slave of the Ring"
        GuideLevel = 0
        CompanionCount = 1
    end

    DetectGuide()
    -- getObjectFromGUID(IDs.Cards.RingBearers).createButton({click_function="FellowshipMenu",function_owner=Global,label="Companions: "..CompanionCount,position={-2.4,0,1.9},rotation={0,0,0},scale={0.5,0.5,0.5},font_color={1,1,1},width=0,height=0,font_size=200})
    getObjectFromGUID(IDs.Cards.RingBearers).createButton(
        {
            click_function = "FellowshipMenu",
            function_owner = Global,
            label = tostring(CompanionCount),
            position = { -2.35, 0, -1.3 },
            rotation = { 0, 0, 0 },
            scale = { 0.5, 0.5, 0.5 },
            font_color = { 1, 1, 0.5 },
            width = 0,
            height = 0,
            font_size = 500,
            tooltip = CompanionCount .. " Companions in the Fellowship."
        }
    )
    getObjectFromGUID(IDs.Cards.RingBearers).createButton(
        {
            click_function = "FellowshipMenu",
            function_owner = Global,
            label = Guide,
            position = { 1.4, 0, 0 },
            rotation = { 0, 90, 0 },
            scale = { 0.5, 0.5, 0.5 },
            font_color = { 1, 1, 1 },
            width = 0,
            height = 0,
            font_size = 200
        }
    )
end

function SearchFellowship(ButtonObj, PlayerColor)
    function SearchFellowshipCoroutine()
        SearchingFellowship = true
        local IDs = GetIDs()
        getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
        local Index = 0
        local List = {}
        local Order = { "Gandalf", "Strider", "Boromir", "Legolas", "Gimli", "Meriadoc", "Peregrin", "Smeagol", "Gollum" }
        local Rotation = { 80, 0, 0 }
        if CompactMode then
            -- getObjectFromGUID(FellowshipRedZoneID).setPosition({-36.35,1.6,-25.5})
            -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({-36.35,1.6,-25.5})
            Rotation = { 80, 180, 0 }
        else
            -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.35,1.6,26.5})
            -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.35,1.6,26.5})
        end

        DetectGuide()
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = { 32.9, 1, 20.0 },
                    direction = { 0, 1, 0 },
                    type = 3,
                    size = { 5, 1, 9.5 },
                    orientation = { 0, 0, 0 },
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if Obj.hit_object.type == "Card" and Obj.hit_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" then
                Index = Index + 1
                Obj.hit_object.setHiddenFrom({ "Red", "Yellow" })
                Obj.hit_object.setPositionSmooth(Spots.CompanionCards.Searched[Index], false, true)
                Obj.hit_object.setRotationSmooth(Rotation, false, true)
                Obj.hit_object.setLock(true)
                table.insert(List, Obj.hit_object.getGUID())
                FellowshipCardMenu(Obj.hit_object)
                coroutine.yield(0)
            elseif Obj.hit_object.type == "Deck" then
                for I, Item in pairs(Obj.hit_object.getObjects()) do
                    Index = Index + 1
                    local CardObj =
                        Obj.hit_object.takeObject(
                            { smooth = true, position = Spots.CompanionCards.Searched[Index], rotation = Rotation }
                        )
                    CardObj.setHiddenFrom({ "Red", "Yellow" })
                    CardObj.setLock(true)
                    CardObj.setPositionSmooth(Spots.CompanionCards.Searched[Index], false, true)
                    CardObj.setRotationSmooth(Rotation, false, true)
                    table.insert(List, CardObj.getGUID())
                    FellowshipCardMenu(CardObj)
                end
                coroutine.yield(0)
            end
        end

        Index = 0

        local ButtonPosition = { 0, 0, -2.5 }
        if CompactMode then
            ButtonPosition = { -37.5, 0, 16.7 }
        end

        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "BuildFellowshipDeck",
                function_owner = Global,
                label = "Done",
                position = ButtonPosition,
                rotation = { 0, 0, 0 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 0.8, 0.8, 1 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Build the Fellowship Deck."
            }
        )
        return 1
    end

    if PlayerColor == "Red" then
        printToAll("Sauron cannot search the Fellowship.", { 1, 1, 0 })
    elseif PlayerColor == "Yellow" then
        printToAll("Saruman cannot search the Fellowship.", { 1, 1, 0 })
    else
        startLuaCoroutine(Global, "SearchFellowshipCoroutine")
    end
end

function FellowshipCardMenu(CardObj)
    -- buttons
    CardObj.clearButtons()
    -- guide?
    if Guide == CardObj.getName() then
        CardObj.createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Fellowship Guide",
                position = { 0, 0.2, -1.42 },
                scale = { 0.5, 0.5, 0.5 },
                font_color = { 1, 1, 0 },
                width = 0,
                height = 0,
                font_size = 200
            }
        )
    elseif tonumber(ReadTag({ Text = CardObj.getDescription(), Var = "Level", Default = "0" })) >= GuideLevel then
        CardObj.createButton(
            {
                click_function = "GuideTheFellowship",
                function_owner = Global,
                label = "Become the Guide",
                position = { 0, 0.2, -1.42 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 1, 1, 1, 0.9 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 250,
                font_size = 200,
                tooltip = "Set " .. CardObj.getName() .. " as the New Fellowship Guide."
            }
        )
    else
        CardObj.createButton(
            {
                click_function = "GuideTheFellowship",
                function_owner = Global,
                label = "Become the Guide",
                position = { 0, 0.2, -1.42 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 1, 1, 1, 0.6 },
                font_color = { 0, 0, 0 },
                width = 1800,
                height = 250,
                font_size = 200,
                tooltip = "Set " .. CardObj.getName() .. " as the New Fellowship Guide.\n(Level is too low)."
            }
        )
    end

    if CardObj.getName() ~= "Gollum: Slave of the Ring" then
        CardObj.createButton(
            {
                click_function = "SeparateCardFromFellowship",
                function_owner = Global,
                label = "Separate",
                position = { -0.2, 0.2, 1.1 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 1, 1, 1, 0.9 },
                font_color = { 0, 0, 0 },
                width = 1100,
                height = 250,
                font_size = 200,
                tooltip = "Seperate " .. CardObj.getName() .. " from the Fellowship."
            }
        )
        CardObj.createButton(
            {
                click_function = "ConfirmCompanionDeath",
                function_owner = Global,
                label = "Dead",
                position = { -0.2, 0.2, 1.4 },
                scale = { 0.5, 0.5, 0.5 },
                color = { 1, 1, 1, 0.9 },
                font_color = { 0, 0, 0 },
                width = 1100,
                height = 250,
                font_size = 200,
                tooltip = "Kill " .. CardObj.getName() .. "."
            }
        )
    end
end

function ConfirmCompanionDeath(CardObj)
    -- buttons
    CardObj.clearButtons()
    CardObj.createButton(
        {
            click_function = "ConfirmCompanionDeath",
            function_owner = Global,
            label = "Dead?",
            position = { 0, 0.2, 1.4 },
            scale = { 0.5, 0.5, 0.5 },
            font_color = { 1, 1, 0 },
            width = 0,
            height = 0,
            font_size = 200
        }
    )
    CardObj.createButton(
        {
            click_function = "KillCompanionCard",
            function_owner = Global,
            label = "Yes",
            position = { 0.7, 0.2, 1.4 },
            scale = { 0.5, 0.5, 0.5 },
            color = { 1, 1, 1, 0.9 },
            font_color = { 0, 0, 0 },
            width = 500,
            height = 250,
            font_size = 200,
            tooltip = "YES: " .. CardObj.getName() .. " is dead."
        }
    )
    CardObj.createButton(
        {
            click_function = "FellowshipCardMenu",
            function_owner = Global,
            label = "No",
            position = { -0.7, 0.2, 1.4 },
            scale = { 0.5, 0.5, 0.5 },
            color = { 1, 1, 1, 0.9 },
            font_color = { 0, 0, 0 },
            width = 500,
            height = 250,
            font_size = 200,
            tooltip = "NO: " .. CardObj.getName() .. " is not dead."
        }
    )
end

function KillCompanionCard(CardObj)
    -- Kill this Companion, and remove from the game
    printToAll(CardObj.getName() .. " has died.", { 1, 1, 0 })
    -- guide died?
    if Guide == CardObj.getName() then
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CardObj.getName(), Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    { guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition() }
                )
            )
            break
        end
    end

    -- remove any buttons from card
    CardObj.clearButtons()
    CardObj.setHiddenFrom()
    CardObj.setLock(false)
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
    -- CardObj.setDescription(string.gsub(CardObj.getDescription(),"Dead;","").."Dead;")
    -- try to locate the figure and remove it
    for O, Obj in pairs(getAllObjects()) do
        -- if Obj.getName() == "Boromir" then print(Obj.getName(),":",Obj.getGUID(),":",Obj.type) end
        if Obj.getName() == "Gandalf the Grey" then
            PlaySound({ ID = 6 })
            -- sorrow
        end

        if
            (Obj.type == "Figurine" or Obj.type == "Tileset") and string.find(CardObj.getName(), Obj.getName()) ~= nil and
            string.find(Obj.getDescription(), "Companion;") ~= nil
        then
            getObjectFromGUID("416864").putObject(Obj)
            break
        end
    end

    -- remove the card from the game
    getObjectFromGUID("416864").putObject(CardObj)
    -- refresh fellowship menu?
    if not SearchingFellowship then
        FellowshipMenu()
    end
end

function GuideTheFellowship(CardObj)
    Guide = CardObj.getName()
    GuideLevel = tonumber(ReadTag({ Text = CardObj.getDescription(), Var = "Level", Default = 0 }))
    -- broadcastToAll(Guide.." (Level:"..GuideLevel..") is now the Fellowship Guide.", {1,1,0})

    for O, Obj in pairs(getAllObjects()) do
        if Obj.type == "Card" and string.find(Obj.getDescription(), "Fellowship;") ~= nil then
            -- buttons
            Obj.clearButtons()
            -- guide?
            if Guide == Obj.getName() then
                Obj.createButton(
                    {
                        click_function = "SearchFellowship",
                        function_owner = Global,
                        label = "Fellowship Guide",
                        position = { 0, 0.2, -1.42 },
                        scale = { 0.5, 0.5, 0.5 },
                        font_color = { 1, 1, 0 },
                        width = 0,
                        height = 0,
                        font_size = 200
                    }
                )
            elseif tonumber(ReadTag({ Text = Obj.getDescription(), Var = "Level", Default = "0" })) >= GuideLevel then
                Obj.createButton(
                    {
                        click_function = "GuideTheFellowship",
                        function_owner = Global,
                        label = "Become the Guide",
                        position = { 0, 0.2, -1.42 },
                        scale = { 0.5, 0.5, 0.5 },
                        color = { 1, 1, 1, 0.9 },
                        font_color = { 0, 0, 0 },
                        width = 1800,
                        height = 250,
                        font_size = 200,
                        tooltip = "Set " .. Obj.getName() .. " as the New Fellowship Guide."
                    }
                )
            else
                Obj.createButton(
                    {
                        click_function = "GuideTheFellowship",
                        function_owner = Global,
                        label = "Become the Guide",
                        position = { 0, 0.2, -1.42 },
                        scale = { 0.5, 0.5, 0.5 },
                        color = { 1, 1, 1, 0.6 },
                        font_color = { 0, 0, 0 },
                        width = 1800,
                        height = 250,
                        font_size = 200,
                        tooltip = "Set " .. Obj.getName() .. " as the New Fellowship Guide.\n(Level is too low)."
                    }
                )
            end

            Obj.createButton(
                {
                    click_function = "SeparateCardFromFellowship",
                    function_owner = Global,
                    label = "Separate",
                    position = { -0.2, 0.2, 1.2 },
                    scale = { 0.5, 0.5, 0.5 },
                    color = { 1, 1, 1, 0.9 },
                    font_color = { 0, 0, 0 },
                    width = 1100,
                    height = 250,
                    font_size = 200,
                    tooltip = "Seperate " .. Obj.getName() .. " from the Fellowship."
                }
            )
        end
    end
end

function SeparateCompanionFromFellowship(CompanionName)
    -- describe action to players
    printToAll(CompanionName .. " separated from the Fellowship.", { 0.4, 0.4, 1 })
    if string.find(Guide, CompanionName) ~= nil then
        printToAll(Guide .. " is no longer the Fellowship Guide.", { 1, 1, 0 })
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CompanionName, Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    { guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition() }
                )
            )
            break
        end
    end

    -- locate the card. If it's in the fellowship box or line up, then separate it
    local CardObj = nil
    -- in the fellowship lineup?
    for O, Obj in pairs(getAllObjects()) do
        if
            Obj.type == "Card" and string.find(Obj.getName(), CompanionName) ~= nil and
            string.find(Obj.getDescription(), "Fellowship;") ~= nil
        then
            CardObj = Obj
            break
        end
    end

    -- if not found, then look in the fellowship card stack
    if CardObj == nil then
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = { 32.9, 1, 20.0 },
                    direction = { 0, 1, 0 },
                    type = 3,
                    size = { 5, 1, 9.5 },
                    orientation = { 0, 0, 0 },
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if
                Obj.hit_object.type == "Card" and string.find(Obj.hit_object.getName(), CompanionName) ~= nil and
                string.find(Obj.hit_object.getDescription(), "Companion;") ~= nil
            then
                CardObj = Obj.hit_object
                break
            elseif Obj.hit_object.type == "Deck" then
                for I, Item in pairs(Obj.hit_object.getObjects()) do
                    if string.find(Item.name, CompanionName) ~= nil then
                        CardObj = Obj.hit_object.takeObject({ guid = Item.guid })
                        break
                    end
                end
            end
        end
    end

    if CardObj ~= nil then
        -- get first open companion card spot
        local Open = true -- assume true until proven false.
        local OpenSpot = Spots.CompanionCards.Separated[1]
        for S = 1, #Spots.CompanionCards.Separated do
            Open = true -- assume true until proven false.
            for O, Obj in pairs(
                Physics.cast(
                    {
                        origin = Spots.CompanionCards.Separated[S],
                        direction = { 0, 1, 0 },
                        type = 3,
                        size = { 1, 1, 1 },
                        orientation = { 0, 0, 0 },
                        max_distance = 0,
                        debug = false
                    }
                )
            ) do
                if Obj.hit_object.type == "Card" or Obj.hit_object.type == "Deck" then
                    Open = false
                    break
                end
            end

            if Open then
                OpenSpot = Spots.CompanionCards.Separated[S]
                break
            end
        end

        -- remove any buttons from card
        CardObj.clearButtons()
        CardObj.setHiddenFrom()
        -- move card from fellowship deck (or lineup) to the table face up
        CardObj.setLock(false)
        if CompactMode then
            CardObj.setRotationSmooth({ 0, 180, 0 }, false, false)
        else
            CardObj.setRotationSmooth({ 0, 0, 0 }, false, false)
        end

        -- CardObj.setPositionSmooth(OpenSpot,false,false)
        CardObj.setPosition(OpenSpot)
        -- remove fellowship; tag and add Separated; tag to the card
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", "") .. "Separated;")
    end

    if not SearchingFellowship then
        FellowshipMenu()
    end

    return CardObj
end

function ReturnCompanionToFellowship(CompanionObj)
    -- CompantionObj is a figure dropped into the fellowhip box
    printToAll(CompanionObj.getName() .. " has joined the Fellowship.", { 1, 1, 0 })
    -- does Gollum flee?
    if Guide == "Gollum: Slave of the Ring" then
        printToAll("Gollum flees the Fellowship!")
        MoveObject(
            { Name = "Gollum", Type = "Figurine", Position = { 39.5, 1.1, 20.0 }, Rotation = { 0, 0, 0 }, smooth = true }
        )
        MoveObject(
            {
                Name = "Gollum: Slave of the Ring",
                Type = "Card",
                Position = { 39.5, 0.97, 20.0 },
                Rotation = { 0, 180, 180 },
                smooth = true
            }
        )
        Guide = ""
        GuideLevel = 0
    end

    -- return token to fellowship bag(416864 to 043c9c)
    for I, Item in pairs(getObjectFromGUID("416864").getObjects()) do
        if
            string.find(CompanionObj.getName(), Item.name) ~= nil and
            string.find(Item.description, "Counter;Companion;") ~= nil
        then
            getObjectFromGUID("043c9c").putObject(
                getObjectFromGUID("416864").takeObject(
                    { guid = Item.guid, smooth = true, position = getObjectFromGUID("043c9c").getPosition() }
                )
            )
            break
        end
    end

    -- check for the token on the table if not in the bag
    for O, Obj in pairs(getAllObjects()) do
        if
            string.find(CompanionObj.getName(), Obj.getName()) ~= nil and
            string.find(Obj.getDescription(), "Counter;Companion;") ~= nil
        then
            getObjectFromGUID("043c9c").putObject(Obj)
            break
        end
    end

    -- look for a matching card tagged with seperated; on the table or smeagol card if its him
    local CardObj = nil
    for O, Obj in pairs(getAllObjects()) do
        if
            Obj.type == "Card" and string.find(Obj.getName(), CompanionObj.getName()) ~= nil and
            string.find(Obj.getDescription(), "Separated;") ~= nil
        then
            CardObj = Obj
            break
        elseif Obj.type == "Card" and CompanionObj.getName() == "Smeagol" and Obj.getName() == "Smeagol: Tamed Wretch" then
            Guide = "Smeagol: Tamed Wretch"
            printToAll("Smeagol is now the Fellowship guide.", { 1, 1, 0 })
            CardObj = Obj
            break
        elseif
            Obj.type == "Card" and CompanionObj.getName() == "Gollum" and Obj.getName() == "Gollum: Slave of the Ring"
        then
            CardObj = Obj
            break
        end
    end

    if CardObj ~= nil then
        -- remove separated; tag and add fellowship; tag to the card
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", ""))
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", "") .. "Fellowship;")
        if CardObj.getName() == "Smeagol: Tamed Wretch" then
            BuildFellowshipDeck()
        else
            -- lift up fellowship cards
            for O, Obj in pairs(
                Physics.cast(
                    {
                        origin = { 32.9, 1, 20.0 },
                        direction = { 0, 1, 0 },
                        type = 3,
                        size = { 5, 1, 9.5 },
                        orientation = { 0, 0, 0 },
                        max_distance = 0,
                        debug = false
                    }
                )
            ) do
                if Obj.hit_object.type == "Card" and Obj.hit_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" then
                    Obj.hit_object.setPositionSmooth(
                        {
                            Obj.hit_object.getPosition().x,
                            Obj.hit_object.getPosition().y + 1,
                            Obj.hit_object.getPosition().z
                        },
                        false,
                        false
                    )
                end
            end

            -- place the card back into the fellowship
            CardObj.setPosition({ 32.9, 1.01, 20.0 })
            CardObj.setRotation({ 0, 180, 180 })
            printToAll(CompanionObj.getName() .. "'s Card was placed into the Fellowship card stack.")
        end
    end

    if not SearchingFellowship then
        FellowshipMenu()
    end
end

function SeparateCardFromFellowship(CardObj)
    local IDs = GetIDs()
    local RBObj = getObjectFromGUID(IDs.Companions.TheRingBearers)
    local SeparateRegion = ReadTag({ Text = RBObj.getGMNotes(), Var = "Region", Default = "(Unknown Region)" })
    local FellowshipTrack = math.floor((getObjectFromGUID("6b62ef").getPosition().x - 5.0) / 1.58)
    -- remove buttons from card
    CardObj.clearButtons()
    CardObj.setHiddenFrom()
    -- describe action to players
    printToAll(
        CardObj.getName() ..
        " separated from the Fellowship at " ..
        SeparateRegion .. ".\n(Fellowship Track was at: " .. FellowshipTrack .. ").",
        { 0.4, 0.4, 1 }
    )
    if Guide == CardObj.getName() then
        printToAll(CardObj.getName() .. " is no longer the Fellowship Guide.", { 1, 1, 0 })
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CardObj.getName(), Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    { guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition() }
                )
            )
            break
        end
    end

    -- get first open companion card spot
    local Open = true -- assume true until proven false.
    local OpenSpot = Spots.CompanionCards.Separated[1]
    for S = 1, #Spots.CompanionCards.Separated do
        Open = true -- assume true until proven false.
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = Spots.CompanionCards.Separated[S],
                    direction = { 0, 1, 0 },
                    type = 3,
                    size = { 1, 1, 1 },
                    orientation = { 0, 0, 0 },
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if Obj.hit_object.type == "Card" or Obj.hit_object.type == "Deck" then
                Open = false
                break
            end
        end

        if Open then
            OpenSpot = Spots.CompanionCards.Separated[S]
            break
        end
    end

    -- move card from fellowship deck (or lineup) to the table face up
    CardObj.setLock(false)
    if CompactMode then
        CardObj.setRotationSmooth({ 0, 180, 0 }, false, false)
    else
        CardObj.setRotationSmooth({ 0, 0, 0 }, false, false)
    end

    CardObj.setPositionSmooth(OpenSpot, false, false)
    -- remove fellowship; tag and add Separated; tag to the card
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", "") .. "Separated;")
    -- move and ping matching figurine if it is in the fellowship box
    local FigureObj = nil
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = { 27.6, 1, 20.0 },
                direction = { 0, 1, 0 },
                type = 3,
                size = { 3, 1, 9.5 },
                orientation = { 0, 0, 0 },
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            string.find(CardObj.getName(), Obj.hit_object.getName()) ~= nil and
            (Obj.hit_object.type == "Figurine" or Obj.hit_object.type == "Tileset") and
            string.find(Obj.hit_object.getDescription(), "Character;") ~= nil
        then
            Obj.hit_object.setPositionSmooth({ OpenSpot[1], 1.1, OpenSpot[3] - 5 }, false, false)
            Obj.hit_object.setRotationSmooth({ 0, 0, 0 }, false, false)
            if Player["Blue"].seated then
                Player["Blue"].pingTable({ OpenSpot[1], 1.1, OpenSpot[3] - 5 })
            end

            printToAll("Place " .. CardObj.getName() .. " Figurine on the game board.", { 0.4, 0.4, 1 })
            break
        end
    end
end

function BuildFellowshipDeck()
    local IDs = GetIDs()
    getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
    local Index = 0
    for O, Obj in pairs(getAllObjects()) do
        if Obj.type == "Card" and string.find(Obj.getDescription(), "Fellowship;") ~= nil then
            Index = Index + 1
            Obj.clearButtons()
            Obj.setHiddenFrom()
            if Obj.getName() == Guide then
                Obj.setPositionSmooth({ 32.9, 5, 20.0 }, false, true)
                Obj.setRotation({ 0, 180, 0 })
                Obj.setLock(false)
            else
                Obj.setPositionSmooth({ 32.9, 1 + Index * 0.2, 20.0 }, false, true)
                Obj.setRotation({ 0, 180, 180 })
                Obj.setLock(false)
            end
        end
    end

    -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.5,-2,26.5})
    -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.5,-2,26.5})
    Wait.time(FellowshipMenu, 2)
end

-- {DiceID=""}
function InsertActionRoll(Params)
    -- only insert this dice roll if it did not already roll in this batch
    local Dupe = false
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RolledTable[R] == Params.DiceID then
            Dupe = true
            break
        end
    end

    if not Dupe then
        table.insert(Dice.Action[Side].RollingTable, Params.DiceID)
        table.insert(Dice.Action[Side].RolledTable, Params.DiceID)
        if not Dice.Action[Side].Rolling then
            RollActionDice(Side)
        end
    end
end

-- {DiceID=""}
function DeleteActionRoll(Params)
    -- remove this dice from roll tables
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RollingTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RollingTable, R)
            break
        end
    end

    for R = 1, #Dice.Action[Side].RolledTable do
        if Dice.Action[Side].RolledTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RolledTable, R)
            break
        end
    end
end

-- {DiceID=""}
function ReportActionRoll(Params)
    -- remove this dice from rolling table and report result
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RollingTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RollingTable, R)
            table.insert(Dice.Action[Side].ResultTable, getObjectFromGUID(Params.DiceID).getRotationValue())
            break
        end
    end
end

function RollActionDice(Side)
    function RollingActionDiceCoroutine()
        -- start this coroutine when any of this player's action dice start rolling
        -- signal this player is rolling a batch of their dice
        Dice.Action[Side].Rolling = true
        -- clear results table, we're collecting a new results table now
        Dice.Action[Side].ResultTable = {}
        -- keep looping until all rolling dice come to rest
        while #Dice.Action[Side].RollingTable > 0 do
            coroutine.yield(0)
        end
        -- while
        local SideName = "Shadow"
        if Side == "Shadow" then
            DiceColor = { 1, 0.4, 0.4 }
        else -- assume FPP
            DiceColor = { 0.4, 0.4, 1 }
            SideName = "Free Peoples"
        end

        -- display this batch of dice roll results
        printToAll("-- -- -- ", DiceColor)
        if #Dice.Action[Side].RolledTable == 1 then
            Dice.Action[Side].ResultText =
                SideName ..
                " Player rolled an Action Die: [" ..
                getObjectFromGUID(Dice.Action[Side].RolledTable[1]).getRotationValue() .. "]"
            UpdateDiceStats({ Result = Dice.Action[Side].ResultTable[1], Type = "Action", Side = Side })
        else
            Dice.Action[Side].ResultText =
                SideName .. " Player rolled " .. #Dice.Action[Side].RolledTable .. " Action Dice:\n"
            for R = 1, #Dice.Action[Side].ResultTable do
                Dice.Action[Side].ResultText =
                    Dice.Action[Side].ResultText .. "[" .. Dice.Action[Side].ResultTable[R] .. "]  "
                UpdateDiceStats({ Result = Dice.Action[Side].ResultTable[R], Type = "Action", Side = Side })
            end
        end

        broadcastToAll(Dice.Action[Side].ResultText, DiceColor)
        printToAll("\n")
        -- clear Tables
        Dice.Action[Side].RollingTable = {}
        Dice.Action[Side].RolledTable = {}
        -- signal this player is done rolling this batch of dice
        Dice.Action[Side].Rolling = false
        return 1
    end

    startLuaCoroutine(Global, "RollingActionDiceCoroutine")
end

-- {Result=1|2|3|4|5|6|FaceName",Type="Action|Combat|Faction|Special",Side="FreePeoples|Shadow"}
function UpdateDiceStats(Params)
    if Params.Type == "Action" then
        Dice.Stats[Params.Type][Params.Side].RollCount = Dice.Stats[Params.Type][Params.Side].RollCount + 1
        if Dice.Stats[Params.Type][Params.Side].Results[Params.Result] == nil then
            Dice.Stats[Params.Type][Params.Side].Results[Params.Result] = 1
        else
            Dice.Stats[Params.Type][Params.Side].Results[Params.Result] =
                Dice.Stats[Params.Type][Params.Side].Results[Params.Result] + 1
        end
    elseif Params.Type == "Combat" then
        Dice.Stats[Params.Type][Params.Side].RollCount = Dice.Stats[Params.Type][Params.Side].RollCount + 1
        Dice.Stats[Params.Type][Params.Side].Results[tonumber(Params.Result)] =
            Dice.Stats[Params.Type][Params.Side].Results[tonumber(Params.Result)] + 1
    elseif Params.Type == "Faction" then
    end
end

function DisplayDiceStats(Params)
    -- this function allows calls from other objects.
    ReportDiceStats(nil, Params.PlayerColor)
end

function ReportDiceStats(PanelObj, PlayerColor)
    if not Player[PlayerColor].seated then
        -- this player color is not seated.
        printToAll(PlayerColor .. " Player is not seated.")
    else -- print to player color only
        printToColor("-- -- -- ", PlayerColor, { 0.4, 0.4, 1 })
        printToColor("Free Peoples Combat Dice Stats:", PlayerColor, { 0.4, 0.4, 1 })
        if Dice.Stats.Combat.FreePeoples.RollCount > 0 then
            for I = 1, 6 do
                printToColor(
                    " " ..
                    D ..
                    ": " ..
                    string.format(
                        "%.1f",
                        100 * Dice.Stats.Combat.FreePeoples.Results[I] /
                        Dice.Stats.Combat.FreePeoples.RollCount
                    ) ..
                    "% (" ..
                    Dice.Stats.Combat.FreePeoples.Results[I] ..
                    "/" .. Dice.Stats.Combat.FreePeoples.RollCount .. ")",
                    PlayerColor,
                    { 0.4, 0.4, 1 }
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Combat Rolls).", PlayerColor, { 0.4, 0.4, 1 })
        end

        printToColor("-- -- -- ", PlayerColor, { 1, 0.4, 0.4 })
        printToColor("Shadow Combat Dice Stats:", PlayerColor, { 1, 0.4, 0.4 })
        if Dice.Stats.Combat.Shadow.RollCount > 0 then
            for I = 1, 6 do
                printToColor(
                    " " ..
                    D ..
                    ": " ..
                    string.format(
                        "%.1f",
                        100 * Dice.Stats.Combat.Shadow.Results[I] / Dice.Stats.Combat.Shadow.RollCount
                    ) ..
                    "% (" ..
                    Dice.Stats.Combat.Shadow.Results[I] ..
                    "/" .. Dice.Stats.Combat.Shadow.RollCount .. ")",
                    PlayerColor,
                    { 1, 0.4, 0.4 }
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Combat Rolls).", PlayerColor, { 1, 0.4, 0.4 })
        end

        printToColor("-- -- -- ", PlayerColor, { 0.4, 0.4, 1 })
        printToColor("Free Peoples Action Dice Stats:", PlayerColor, { 0.4, 0.4, 1 })
        if Dice.Stats.Action.FreePeoples.RollCount > 0 then
            for Face, Count in pairs(Dice.Stats.Action.FreePeoples.Results) do
                printToColor(
                    " " ..
                    Face ..
                    ": " ..
                    string.format("%.1f", 100 * Count / Dice.Stats.Action.FreePeoples.RollCount) ..
                    "% (" .. Count .. "/" .. Dice.Stats.Action.FreePeoples.RollCount .. ")",
                    PlayerColor,
                    { 0.4, 0.4, 1 }
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Action Rolls).", PlayerColor, { 0.4, 0.4, 1 })
        end

        printToColor("-- -- -- ", PlayerColor, { 1, 0.4, 0.4 })
        printToColor("Shadow Action Dice Stats:", PlayerColor, { 1, 0.4, 0.4 })
        if Dice.Stats.Action.Shadow.RollCount > 0 then
            for Face, Count in pairs(Dice.Stats.Action.Shadow.Results) do
                printToColor(
                    " " ..
                    Face ..
                    ": " ..
                    string.format("%.1f", 100 * Count / Dice.Stats.Action.Shadow.RollCount) ..
                    "% (" .. Count .. "/" .. Dice.Stats.Action.Shadow.RollCount .. ")",
                    PlayerColor,
                    { 1, 0.4, 0.4 }
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Action Rolls).", PlayerColor, { 1, 0.4, 0.4 })
        end

        -- print blank line for spacing
        printToColor("\n", PlayerColor, { 1, 0.4, 0.4 })
    end
end

function DiscardCard(CardObj)
    local DiscardObj = nil
    if string.find(CardObj.getDescription(), "Shadow;") ~= nil then
        if string.find(CardObj.getDescription(), "Character;") ~= nil then
            DiscardObj = getObjectFromGUID("61c02b")
        elseif string.find(CardObj.getDescription(), "Strategy;") ~= nil then
            DiscardObj = getObjectFromGUID("61c02b")
        elseif string.find(CardObj.getDescription(), "Faction;") ~= nil then
            DiscardObj = getObjectFromGUID("bbab30")
        end
    elseif string.find(CardObj.getDescription(), "FreePeoples;") ~= nil then
        if string.find(CardObj.getDescription(), "Character;") ~= nil then
            DiscardObj = getObjectFromGUID("b18c8a")
        elseif string.find(CardObj.getDescription(), "Strategy;") ~= nil then
            DiscardObj = getObjectFromGUID("b18c8a")
        elseif string.find(CardObj.getDescription(), "Faction;") ~= nil then
            DiscardObj = getObjectFromGUID("2d4c4f")
        end
    end

    if DiscardObj ~= nil then
        -- face up or down?
        if CardObj.getPosition().z < -50 or CardObj.getPosition().z > 50 then
            CardObj.setRotation({ DiscardObj.getRotation().x, DiscardObj.getRotation().y, 180 })
        else -- facedown
            CardObj.setRotation({ DiscardObj.getRotation().x, DiscardObj.getRotation().y, 0 })
        end

        CardObj.setPosition({ CardObj.getPosition().x, 6, CardObj.getPosition().z })
        CardObj.setPositionSmooth({ DiscardObj.getPosition().x, 3, DiscardObj.getPosition().z }, false, false)
    else
        printToAll("Unable to find the Discard Pile for this card.", { 1, 1, 0 })
    end
end

-- ARMY FORMATION SCRIPT v7 ===
-- Gaps between units of the same type and units of different types
local UNIT_SPACING = 0.005
local TYPE_SPACING = 0.05
-- Which type the faction units are grouped with, can be regular, elite, character or leader
local FACTION_UNITS_WITH = "elite"
-- Forces each group to stick to a single row, regardless of the settings
local FORCE_SINGLE_ROW_ENABLED = false
-- Allows for merging leaders and characters with elites when the sum of those is below the set value
local MERGE_ELITE_AND_BACK_ROW_ENABLED = true
local MERGE_ELITE_AND_BACK_ROW_UNIT_COUNT = 4

local MESSAGE_COLOUR = Color.White

-- Elites behind regular settings
local MAX_REG_BEFORE_TWO_ROWS = 6
local MAX_ELITE_BEFORE_TWO_ROWS = 4
local MAX_BACK_BEFORE_TWO_ROWS = 4
local ELITES_BEHIND_REGULARS = true

-- Side by side settings
-- local MAX_REG_BEFORE_TWO_ROWS = 2
-- local MAX_ELITE_BEFORE_TWO_ROWS = 2
-- local MAX_BACK_BEFORE_TWO_ROWS = 5
-- local ELITES_BEHIND_REGULARS = false

PLAYER_SETTINGS = {
    Red = { target_friendly_units = true },
    Yellow = { target_friendly_units = true },
    Green = { target_friendly_units = true },
    Blue = { target_friendly_units = true }
}

local NP_KEY_TO_SPIN_INDEX = { [8] = 0, [9] = 3, [6] = 6, [3] = 9, [2] = 12, [1] = 15, [4] = 18, [7] = 21 }

local function getSide(desc)
    if (string.find(desc, "Shadow;") ~= nil) then
        return "sa"
    else
        return "fp"
    end
end

local function getType(desc)
    if (string.find(desc, "Regular;") ~= nil) then
        return "regular"
    end
    if (string.find(desc, "Elite;") ~= nil) then
        return "elite"
    end
    if (string.find(desc, "Faction;") ~= nil) then
        return FACTION_UNITS_WITH
    end
    if (string.find(desc, "Leader;") ~= nil) then
        return "leader"
    end
    return "character"
end

local function getNation(side, desc)
    if (side == "sa") then
        if (string.find(desc, "Sauron;") ~= nil) then
            return "sauron"
        end
        if (string.find(desc, "Isengard;") ~= nil) then
            return "isengard"
        end
        if (string.find(desc, "Haradrim;") ~= nil) then
            return "haradrim"
        end
        if (string.find(desc, "Spiders;") ~= nil) then
            return "spiders"
        end
        if (string.find(desc, "Dunlending;") ~= nil) then
            return "dunlending"
        end
        if (string.find(desc, "Corsairs;") ~= nil) then
            return "corsairs"
        end
    else
        if (string.find(desc, "North;") ~= nil) then
            return "north"
        end
        if (string.find(desc, "Dwarves;") ~= nil) then
            return "dwarves"
        end
        if (string.find(desc, "Gondor;") ~= nil) then
            return "gondor"
        end
        if (string.find(desc, "Elf;") ~= nil) then
            return "elf"
        end
        if (string.find(desc, "Rohan;") ~= nil) then
            return "rohan"
        end
        if (string.find(desc, "Ents;") ~= nil) then
            return "ents"
        end
        if (string.find(desc, "Eagles;") ~= nil) then
            return "eagles"
        end
        if (string.find(desc, "DeadMen;") ~= nil) then
            return "eagles"
        end
    end
    -- Characters and minions will return 'none'
    return "none"
end

-- Returns an object from the players hand to the board where it was originally picked up
local function returnToBoard(obj, player_color)
    obj.removeFromPlayerSelection(player_color)
    obj.setPosition(obj.pick_up_position)
    obj.setRotation(obj.pick_up_rotation)
    local zero_vector = vector(0, 0, 0)
    obj.setAngularVelocity(zero_vector)
    obj.setVelocity(zero_vector)
    obj.drop()
end

local function returnAllToBoard(player_color)
    local player = Player[player_color]
    local holding = player.getHoldingObjects()
    for _, obj in pairs(holding) do
        returnToBoard(obj, player_color)
    end
end

local function getRowCount(unit_count, max_row_units)
    if (FORCE_SINGLE_ROW_ENABLED) then
        return 1
    elseif (unit_count > max_row_units) then
        return 2
    elseif (unit_count > 0) then
        return 1
    else
        return 0
    end
end

local function compareNationGreater(a, b)
    return a["nation"] > b["nation"]
end

local function compareNationLess(a, b)
    return a["nation"] < b["nation"]
end

local function clamp(val, min, max)
    return math.min(math.max(val, min), max)
end

local function moveUnits(units, count, rows, cols, size, spacing, start_pos, rotation, spin_index)
    local col_spacing = vector(spacing, 0, 0):rotateOver("y", rotation)
    local row_spacing = vector(0, 0, spacing):rotateOver("y", rotation)
    local row_two_offset = vector((count % 2) * size / 2, 0, 0):rotateOver("y", rotation)

    local idx = 0
    for c = 1, cols do
        for r = 1, rows do
            idx = idx + 1
            if (idx <= count) then
                local unit = units[idx]
                unit["obj"].held_position_offset =
                    start_pos + col_spacing * (c - 1) - row_spacing * (r - 1) + row_two_offset * (r - 1)
                unit["obj"].held_spin_index = spin_index
            end
        end
    end
end

local function arrangeHeldUnits(np_key, player_color, holding)
    -- Determines who the player is and which side they are sorting based on key pressed
    local player_is_sa = player_color == "Red" or player_color == "Yellow"
    local sorting_friendly = PLAYER_SETTINGS[player_color]["target_friendly_units"]
    local sorting_sa = sorting_friendly and player_is_sa or not sorting_friendly and not player_is_sa

    local units = { regular = {}, elite = {}, leader = {}, character = {} }
    local max_unit_size = { regular = 0, elite = 0, leader = 0, character = 0 }

    -- Iterates on all held objects
    local unit_count = 0
    for _, obj in pairs(holding) do
        local desc = obj.getDescription()
        local side = getSide(desc)
        local sorting_side = sorting_sa and side == "sa" or not sorting_sa and side == "fp"

        -- Return any units from the wrong side or the fellowship back to the board
        if (not sorting_side or obj.getName() == "The Ring-bearers") then
            returnToBoard(obj, player_color)
        else
            -- Store the unit in a table along with its nation
            local unit = { obj = obj, nation = getNation(side, desc) }
            local type = getType(desc)
            table.insert(units[type], unit)
            -- Determine the size of the unit's base, write the maximum size to a table
            local bounds = obj.getBoundsNormalized()
            local max_bounds = math.max(bounds.size.x, bounds.size.z)
            max_unit_size[type] = math.max(max_unit_size[type], max_bounds)
            unit_count = unit_count + 1
        end
    end

    if (unit_count == 0) then
        if (sorting_friendly) then
            Player[player_color].broadcast(
                "Not holding any friendly units. Press numpad 0 to toggle to enemies",
                MESSAGE_COLOUR
            )
        else
            Player[player_color].broadcast(
                "Not holding any enemy units. Press numpad 0 to toggle to friendlies",
                MESSAGE_COLOUR
            )
        end
        return
    end

    local regular_size = max_unit_size["regular"]
    local elite_size = max_unit_size["elite"]
    local back_size = math.max(max_unit_size["leader"], max_unit_size["character"])

    local regular_count = #units["regular"]
    local elite_count = #units["elite"]
    local back_count = #units["leader"] + #units["character"]

    -- Sort the lists to ensure nations are grouped together
    if (ELITES_BEHIND_REGULARS) then
        table.sort(units["regular"], compareNationGreater)
    else
        table.sort(units["regular"], compareNationLess)
    end
    table.sort(units["elite"], compareNationGreater)
    table.sort(units["leader"], compareNationGreater)

    -- Inject characters in the middle of leaders
    local leader_center_idx = math.ceil(#units["leader"] / 2) + 1
    for i, char in ipairs(units["character"]) do
        table.insert(units["leader"], leader_center_idx + i - 1, char)
    end

    -- Inject characters + leaders into the middle of the elites and swap elites with back if enabled
    if (MERGE_ELITE_AND_BACK_ROW_ENABLED and elite_count + back_count <= MERGE_ELITE_AND_BACK_ROW_UNIT_COUNT) then
        local elite_center_idx = math.ceil(#units["elite"] / 2) + 1
        for i, char in ipairs(units["leader"]) do
            table.insert(units["elite"], elite_center_idx + i - 1, char)
        end
        back_count = back_count + elite_count
        elite_count = 0
        back_size = math.max(elite_size, back_size)
        units["leader"] = units["elite"]
    end

    local regular_rows = getRowCount(regular_count, MAX_REG_BEFORE_TWO_ROWS)
    local elite_rows = getRowCount(elite_count, MAX_ELITE_BEFORE_TWO_ROWS)
    local back_rows = getRowCount(back_count, MAX_BACK_BEFORE_TWO_ROWS)

    local regular_columns = math.ceil(regular_count / regular_rows)
    if (regular_count == 0) then
        regular_columns = 0
    end
    local elite_columns = math.ceil(elite_count / elite_rows)
    if (elite_count == 0) then
        elite_columns = 0
    end
    local back_columns = math.ceil(back_count / back_rows)
    if (back_count == 0) then
        back_columns = 0
    end

    -- Calculate the formation width of each group
    local regular_width = math.max(regular_columns - 1, 0) * (UNIT_SPACING + regular_size)
    local elite_width = math.max(elite_columns - 1, 0) * (UNIT_SPACING + elite_size)
    local back_width = math.max(back_columns - 1, 0) * (UNIT_SPACING + back_size)

    local regular_depth =
        math.max(0, (regular_rows - 0.5) * regular_size + math.floor(regular_rows - 0.5) * UNIT_SPACING)
    local elite_depth = math.max(0, (elite_rows - 0.5) * elite_size + math.floor(elite_rows - 0.5) * UNIT_SPACING)

    local regular_start_x = 0
    local elite_start_x = 0
    local elite_start_z = 0
    local back_start_x = -(back_width / 2)
    local back_start_z = 0
    local front_width = 0
    if (ELITES_BEHIND_REGULARS) then
        regular_start_x = -(regular_width / 2)
        if (regular_count > 0) then
            elite_start_z = -(regular_depth + elite_size / 2 + TYPE_SPACING)
            if (elite_count > 0) then
                back_start_z = elite_start_z - (elite_depth + back_size / 2 + TYPE_SPACING)
            else
                back_start_z = -(regular_depth + back_size / 2 + TYPE_SPACING)
            end
        elseif (elite_count > 0) then
            back_start_z = -(elite_depth + back_size / 2 + TYPE_SPACING)
        end
        elite_start_x = -(elite_width / 2)
    else
        local front_width = regular_width + elite_width
        if (regular_count > 0 and elite_count > 0) then
            front_width = front_width + TYPE_SPACING + (regular_size + elite_size) / 2
        end
        regular_start_x = -(front_width / 2)
        if (regular_count > 0 or elite_count > 0) then
            back_start_z = -(math.max(regular_depth, elite_depth) + back_size / 2 + TYPE_SPACING)
        end
        local center_gap = 0
        if (regular_count > 0) then
            center_gap = regular_width + (regular_size + elite_size + TYPE_SPACING) / 2
        end
        elite_start_x = -(front_width / 2) + center_gap
    end

    -- Move the units
    local spin_index = NP_KEY_TO_SPIN_INDEX[np_key]
    local rotation = spin_index * 15
    if (regular_count > 0) then
        local start_pos = vector(regular_start_x, 0, 0):rotateOver("y", rotation)
        -- The max here is to prevent NaNs when the column count is 1. The spacing value isn't used anyway with a single unit but it will break the calcs
        local spacing = regular_width / math.max(regular_columns - 1, 1)
        moveUnits(
            units["regular"],
            regular_count,
            regular_rows,
            regular_columns,
            regular_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end

    if (elite_count > 0) then
        local start_pos = vector(elite_start_x, 0, elite_start_z):rotateOver("y", rotation)
        local spacing = elite_width / math.max(elite_columns - 1, 1)
        moveUnits(
            units["elite"],
            elite_count,
            elite_rows,
            elite_columns,
            elite_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end

    if (back_count > 0) then
        local start_pos = vector(back_start_x, 0, back_start_z):rotateOver("y", rotation)
        local spacing = back_width / math.max(back_columns - 1, 1)
        moveUnits(
            units["leader"],
            back_count,
            back_rows,
            back_columns,
            back_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end
end

function onScriptingButtonDown(index, player_color)
    -- Bails out if not a player
    if (player_color ~= "Red" and player_color ~= "Yellow" and player_color ~= "Blue" and player_color ~= "Green") then
        return
    end

    local holding = Player[player_color].getHoldingObjects()
    if (index == 5) then
        if (#holding ~= 0) then
            Player[player_color].broadcast("Returning all units to the board", MESSAGE_COLOUR)
            returnAllToBoard(player_color)
        end
    elseif (index == 10) then
        local enabled = not PLAYER_SETTINGS[player_color]["target_friendly_units"]
        PLAYER_SETTINGS[player_color]["target_friendly_units"] = enabled
        if (enabled) then
            Player[player_color].broadcast("Targeting friendly units", MESSAGE_COLOUR)
        else
            Player[player_color].broadcast("Targeting enemy units", MESSAGE_COLOUR)
        end
    else
        if (#holding ~= 0) then
            arrangeHeldUnits(index, player_color, holding)
        end
    end
end

-- END OF ARMY FORMATION SCRIPT v7 =================================================================================================================

-- ARMY COUNTING SCRIPT v2
-- Settings
local FP_COLOUR = { 0.6, 0.6, 1 }
local SA_COLOUR = { 1.0, 0.6, 0.6 }
local NOTES_COLOUR = { 0.9, 0.9, 0.9 }
local WARNING_COLOUR = { 0.9, 0.9, 0.1 }
local USE_SHORT_NOTES = true

addHotkey(
    "Count Selected Units",
    function (player_color, hovered_object, pointer_position, is_key_up)
        countSelectedUnits(player_color)
    end
)

local CHARACTER_DB = {
    ["Aragorn: Heir to Isildur"] = {
        leadership = 2,
        bonus_strength = 1,
        note = "Aragorn: Heir to Isildur - +1 Combat Strength",
        short_note = "Aragorn - +1 Strength"
    },
    ["Boromir"] = {
        lookup_index = 5
    },
    ["Boromir: Son of Denethor"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Boromir: Son of Denethor - +1 Combat Strength",
        short_note = "Boromir - +1 Strength"
    },
    ["Boromir: Captain General of Gondor"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Boromir: Captain General of Gondor - +1? Combat Strength",
        short_note = "Boromir - +1? Strength"
    },
    ["Lord Elrond: Keeper of Vilya"] = {
        leadership = 2,
        note = "Lord Elrond: Keeper of Vilya - Elven Elites are Leaders",
        short_note = "Lord Elrond - Elven Elites are Leaders"
    },
    ["Gandalf the White: Emissary from the West"] = {
        leadership = 1,
        note = "Gandalf the White: Emissary from the West -  May forfeit 1 Leadership to cancel Nazgul Leadership",
        short_note = "Gandalf the White -  Forfeit 1 Leadership to cancel Nazgul Leadership"
    },
    ["Gandalf the Grey"] = {
        lookup_index = 2
    },
    ["Gandalf the Grey: The Grey Wanderer"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Gandalf the Grey: The Grey Wanderer - +1 Combat Strength",
        short_note = "Gandalf the Grey - +1 Strength"
    },
    ["Gandalf the Grey: Keeper of Narya"] = {
        leadership = 1,
        note = "Gandalf the Grey: Keeper of Narya",
        short_note = "Gandalf the Grey"
    },
    ["Gimli"] = {
        lookup_index = 4
    },
    ["Gimli: Son of Gloin"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Gimli: Son of Gloin - +1 Combat Strength",
        short_note = "Gimli - +1 Strength"
    },
    ["Gimli: Dwarven Lord"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Gimli: Dwarven Lord - +1? Combat Strength",
        short_note = "Gimli - +1? Strength"
    },
    ["Gothmog: Lieutenant of Morgul"] = {
        leadership = 1,
        note = "Gothmog: Lieutenant of Morgul",
        short_note = "Gothmog"
    },
    ["Lady Galadriel: Keeper of Nenya"] = {
        leadership = 2,
        note = "Lady Galadriel: Keeper of Nenya",
        short_note = "Lady Galadriel"
    },
    ["Legolas"] = {
        lookup_index = 3
    },
    ["Legolas: Son of Thranduil"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Legolas: Son of Thranduil - +1 Combat Strength",
        short_note = "Legolas - +1 Strength"
    },
    ["Legolas: Elven Prince"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Legolas: Elven Prince - +1? Combat Strength",
        short_note = "Legolas - +1? Strength"
    },
    ["The Mouth of Sauron: Black Numenorean"] = {
        leadership = 2,
        note = "The Mouth of Sauron: Black Numenorean - Extend siege by one turn without reducing an Elite",
        short_note = "The Mouth of Sauron - Extend siege by one turn without reducing an Elite"
    },
    ["Meriadoc"] = {
        lookup_index = 7
    },
    ["Meriadoc Brandybuck: Hobbit Companion"] = {
        leadership = 1,
        note = "Meriadoc Brandybuck: Hobbit Companion",
        short_note = "Meriadoc"
    },
    ["Meriadoc: Hobbit of the Shire"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Meriadoc: Hobbit of the Shire - +1? Combat Strength",
        short_note = "Meriadoc - +1? Strength"
    },
    ["The Mouth of Sauron: Lieutenant of Barad~Dur"] = {
        leadership = 2,
        note = "The Mouth of Sauron: Lieutenant of Barad-Dur",
        short_note = "The Mouth of Sauron"
    },
    ["Peregrin"] = {
        lookup_index = 6
    },
    ["Peregrin Took: Hobbit Companion"] = {
        leadership = 1,
        note = "Peregrin Took: Hobbit Companion",
        short_note = "Peregrin"
    },
    ["Peregrin: Hobbit of the Shire"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Peregrin: Hobbit of the Shire - +1? Combat Strength",
        short_note = "Peregrin - +1? Strength"
    },
    ["Saruman: Corrupted Wizard"] = {
        leadership = 1,
        note = "Saruman: Corrupted Wizard",
        short_note = "Saruman"
    },
    ["Strider"] = {
        lookup_index = 2
    },
    ["Strider: Ranger of the North"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Strider: Ranger of the North - +1 Combat Strength",
        short_note = "Strider - +1 Strength"
    },
    ["Strider: Dunadan"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Strider: Dúnadan - +1 Combat Strength",
        short_note = "Strider - +1 Strength"
    },
    ["Balrog: Evil of the Ancient World"] = {
        leadership = 3,
        bonus_strength = 2,
        note = "Balrog: Evil of the Ancient World - +2 Combat Strength",
        short_note = "Balrog - +2 Strength"
    },
    ["Treebeard: Tree-herd"] = {
        leadership = 0,
        possible_bonus_strength = 1,
        note = "Treebeard: Tree-herd - +1? Combat Strength",
        short_note = "Treebeard - +1? Strength"
    },
    ["The Witch-King: The Black Captain"] = {
        leadership = 2,
        note = "The Witch-King: The Black Captain - If playing first round Combat Card draw a matching card",
        short_note = "The Witch-King: First round Combat Card draws a matching card"
    },
    ["The Witch-King: Chief of the Ring Wraiths"] = {
        leadership = 1,
        note = "The Witch-King: Chief of the Ring Wraiths",
        short_note = "The Witch-King"
    }
}

function countSelectedUnits(player_color)
    local count_friendly = PLAYER_SETTINGS[player_color]["target_friendly_units"]
    local player_is_sa = player_color == "Red" or player_color == "Yellow"
    local side_to_count = "fp"
    if (player_is_sa and count_friendly or not player_is_sa and not count_friendly) then
        side_to_count = "sa"
    end

    local info = {
        total_hp = 0,
        regulars = 0,
        elites = 0,
        leaders = 0,
        nazgul = 0,
        characters = 0,
        leadership = 0,
        bonus_strength = 0,
        possible_bonus_strength = 0,
        faction = {
            dead_men = { qty = 0, note = "Dead Men" },
            ents = { qty = 0, note = "Ents" },
            eagles = { qty = 0, note = "Eagles" },
            spiders = { qty = 0, note = "Spiders" },
            corsairs = { qty = 0, note = "Corsairs" },
            dunlendings = { qty = 0, note = "Dunlendings" }
        },
        has_faction_units = false,
        dead_men = 0,
        ents = 0,
        eagles = 0,
        spiders = 0,
        corsairs = 0,
        dunlendings = 0,
        isengard_elites_and_saruman_in_play = false,
        character_notes = {},
        number_of_locs = 0,
        max_loc_name = "",
        max_loc_count = 0,
        min_loc_name = "",
        min_loc_count = 10000
    }

    -- Copies the CompanionNames off the GamePanel to work out who is play. Unfortunately I don't think this is saved
    -- between sessions?
    local companion_names = getObjectFromGUID(GamePanelID).getVar("CompanionNames")
    local locations = {}

    local selected = Player[player_color].getSelectedObjects()
    for _, obj in pairs(selected) do
        local name = obj.getName()
        local desc = obj.getDescription()
        local side = "fp"
        if (string.find(desc, "Shadow;") ~= nil) then
            side = "sa"
        end

        if (side == side_to_count and string.find(desc, "Card;") == nil) then
            local location = GetGridRegion({ Position = obj.getPosition() })
            if (string.find(desc, "Regular;") ~= nil) then
                table.insert(locations, location)
                info.regulars = info.regulars + 1
                info.total_hp = info.total_hp + 1
            elseif (string.find(desc, "Elite;") ~= nil) then
                table.insert(locations, location)
                info.elites = info.elites + 1
                info.total_hp = info.total_hp + 2
                if
                    (name == "Isengard Elite" and
                        getObjectFromGUID(GamePanelID).call(
                            "InPlay",
                            { Name = "Saruman: Corrupted Wizard", Description = "Minion;" }
                        ))
                then
                    info.leaders = info.leaders + 1
                    info.leadership = info.leadership + 1
                    info.isengard_elites_and_saruman_in_play = true
                end
            elseif (string.find(desc, "Leader;") ~= nil) then
                table.insert(locations, location)
                info.leaders = info.leaders + 1
                info.leadership = info.leadership + 1
                if (string.find(desc, "Nazgul;") ~= nil) then
                    info.nazgul = info.nazgul + 1
                end
            elseif (string.find(desc, "DeadMen;") ~= nil) then
                table.insert(locations, location)
                info.faction.dead_men.qty = info.faction.dead_men.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Ents;") ~= nil) then
                table.insert(locations, location)
                info.faction.ents.qty = info.faction.ents.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Eagles;") ~= nil) then
                table.insert(locations, location)
                info.faction.eagles.qty = info.faction.eagles.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Spiders;") ~= nil) then
                table.insert(locations, location)
                info.faction.spiders.qty = info.faction.spiders.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Corsairs;") ~= nil) then
                table.insert(locations, location)
                info.faction.corsairs.qty = info.faction.corsairs.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Dunlendings;") ~= nil) then
                table.insert(locations, location)
                info.faction.dunlendings.qty = info.faction.dunlendings.qty + 1
                info.has_faction_units = true
            else
                local char = CHARACTER_DB[name]
                if (char ~= nil) then
                    table.insert(locations, location)
                    if (char.lookup_index ~= nil) then
                        -- Ensure we test index 1 and 2 to determine which one is the right one!
                        -- Gandalf and Strider can be swapped
                        if (char.lookup_index == 1 or char.lookup_index == 2) then
                            if (string.find(name, companion_names[1]) ~= nil) then
                                char.lookup_index = 1
                            elseif (string.find(name, companion_names[2]) ~= nil) then
                                char.lookup_index = 2
                            else
                                print("ERROR: Could not find character in table", WARNING_COLOUR)
                            end
                        end
                        char = CHARACTER_DB[companion_names[char.lookup_index]]
                    end
                    if (char.leadership ~= nil) then
                        info.leadership = info.leadership + char.leadership
                    end
                    if (char.bonus_strength ~= nil) then
                        info.bonus_strength = info.bonus_strength + info.bonus_strength
                    end
                    if (char.poss_strength ~= nil) then
                        info.possible_bonus_strength = info.possible_bonus_strength + char.possible_bonus_strength
                    end
                    if (USE_SHORT_NOTES) then
                        table.insert(info.character_notes, char.short_note)
                    else
                        table.insert(info.character_notes, char.note)
                    end
                    info.characters = info.characters + 1
                end
            end
        end
    end

    -- Count up locations of each unit
    local location_counts = {}
    for _, location in ipairs(locations) do
        if location_counts[location] == nil then
            location_counts[location] = 1
            info.number_of_locs = info.number_of_locs + 1
        else
            location_counts[location] = location_counts[location] + 1
        end
    end

    -- Determine location with most units and location with least
    for loc_name, loc_count in pairs(location_counts) do
        if (loc_count > info.max_loc_count) then
            info.max_loc_name = loc_name
            info.max_loc_count = loc_count
        end
        if (loc_count < info.min_loc_count) then
            info.min_loc_name = loc_name
            info.min_loc_count = loc_count
        end
    end

    printArmyInfo(side_to_count, info)
    setDiceRoller(side_to_count, info)
end

function printArmyInfo(side_to_count, info)
    local colour = FP_COLOUR
    if (side_to_count == "sa") then
        colour = SA_COLOUR
    end

    if (info.total_hp == 0 and #info.character_notes == 0 and info.leadership == 0 and not info.has_faction_units) then
        printToAll("No " .. string.upper(side_to_count) .. " Army Found", colour)
        return
    end

    local possible_bonus_strength = ""
    if (info.possible_bonus_strength > 0) then
        possible_bonus_strength = "+"
    end

    printToAll("━━━━  " .. string.upper(side_to_count) .. " ARMY INFO  ━━━━", colour)
    printToAll("Location: " .. info.max_loc_name, colour)
    printToAll(
        "R/E/L: " ..
        info.regulars ..
        "/" .. info.elites .. "/" .. info.leaders .. "      Size: " .. (info.regulars + info.elites) .. "/10",
        colour
    )
    printToAll(
        "Strength: " ..
        (info.regulars + info.elites + info.bonus_strength) ..
        possible_bonus_strength .. "    Leadership: " .. info.leadership,
        colour
    )
    if (side_to_count == "sa") then
        printToAll("Minions: " .. info.characters .. "        Nazgul: " .. info.nazgul, colour)
    else
        printToAll("Companions: " .. info.characters, colour)
    end
    if (info.number_of_locs >= 3) then
        printToAll("Warning: Selection contains units in multiple locations", WARNING_COLOUR)
    elseif (info.max_loc_name ~= info.min_loc_name) then
        printToAll("Warning: Selection also contains units in " .. info.min_loc_name, WARNING_COLOUR)
    end

    -- Fill out notes section
    local notes = ""

    for _, faction in pairs(info.faction) do
        if (faction.qty > 0) then
            if (notes == "") then
                notes = "  ● " .. faction.qty .. " " .. faction.note
            else
                notes = notes .. "\r\n  ● " .. faction.qty .. " " .. faction.note
            end
        end
    end

    if (info.isengard_elites_and_saruman_in_play) then
        table.insert(info.character_notes, "Saruman is in play - Isengard Elites are Leaders")
    end
    for _, note in pairs(info.character_notes) do
        if (notes == "") then
            notes = "  ● " .. note
        else
            notes = notes .. "\r\n  ● " .. note
        end
    end
    if (notes ~= "") then
        printToAll(notes, NOTES_COLOUR)
    end
    -- Small lie below, but it will be!
    printToAll(string.upper(side_to_count) .. " dice roller has been set", colour)
    printToAll("━━━━━━━━━━━━━━━━━━━━\r\n", colour)
end

function setDiceRoller(side_to_count, info)
    local strength = math.min(info.regulars + info.elites + info.bonus_strength, 5)
    local leadership = math.min(info.leadership, 5)
    local roller_guid = "4b6f4c"
    if (side_to_count == "sa") then
        roller_guid = "92a611"
    end
    getObjectFromGUID(roller_guid).call("switchToCombat", { Strength = strength, Leadership = leadership })
end

function SettlementsAreFlat()
    local preferencesPanel = getObjectFromGUID("c35be9")
    local settings = preferencesPanel.getTable("Settings")
    return settings.SettlementsType == "Flat"
end

function SetTokenRotation(Token, IsActive)
    local zRotation = 0
    if not IsActive then
        zRotation = 180
    end
    Token.setRotation({ 0, 135, zRotation })
end

function ShowInformationText(text)
    getObjectFromGUID(GamePanelID).call("ShowInformationText", text)
end
