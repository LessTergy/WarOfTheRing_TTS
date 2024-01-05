unitLuaScript = "PickedUp = false\r\n\r\nfunction onLoad()\r\n  Global.call(\"UnitEvent\",{UnitObj=self,Event=\"Load\"})\r\nend--function\r\n\r\nfunction onPickUp(player_color)\r\n  Global.call(\"UnitEvent\",{UnitObj=self,Event=\"Pickup\",Color=player_color})\r\nend--function\r\n\r\nfunction onDrop(player_color)\r\n  Global.call(\"UnitEvent\",{UnitObj=self,Event=\"Drop\",Color=player_color})\r\nend--function\r\n\r\nfunction onCollisionEnter(collision_info)\r\n  Global.call(\"UnitEvent\",{UnitObj=self,Event=\"Collide\",Info=collision_info})\r\nend--if\r\n\r\nfunction onDestroy()\r\n  Global.call(\"UnitEvent\",{UnitObj=self,Event=\"Destroy\"})\r\nend--function"

ArmyUnits = {
    Smeagol = "8b8cf6",
    AragornHeirtoIsildur = "826dfe",
    GandalftheWhiteEmissaryfromtheWest = "94dee9",
    TheRingbearers = "e76bc8",
    AragornHeirtoIsildur = "973bc1",
    GandalftheWhiteEmissaryfromtheWest = "0166c2",
    TreebeardTreeherd = "5e36c8",
    TheMouthofSauronLieutenantofBaradDur = "97771d",
    TheWitchKingTheBlackCaptain = "762b45",
    SarumanCorruptedWizard = "61bc09",
    TheMouthofSauronBlackNumenorean = "fc376c",
    TheWitchKingChiefoftheRingWraiths = "665eef",
    GothmogLieutenantofMorgul = "98f596",
    BalrogEviloftheAncientWorld = "2c3907",
    SauronRegular = "9c0e44",
    SauronRegular = "ed1386",
    SauronRegular = "5593a3",
    SauronRegular = "54c177",
    SauronRegular = "cb8886",
    SauronRegular = "5bcf9f",
    SauronRegular = "fb5cf7",
    SauronRegular = "20e30d",
    SauronRegular = "231412",
    SauronRegular = "de56d0",
    SauronRegular = "81ba6c",
    SauronRegular = "56eaa5",
    SauronRegular = "00b397",
    SauronRegular = "5a38db",
    SauronRegular = "91e79b",
    SauronRegular = "7016ce",
    SauronRegular = "f4abfb",
    SauronRegular = "62e350",
    SauronRegular = "7f5af0",
    SauronRegular = "e9f66c",
    SauronRegular = "a16772",
    SauronRegular = "7ff26b",
    SauronRegular = "65df4c",
    SauronRegular = "72eeba",
    SauronRegular = "1f5f8f",
    SauronRegular = "1668ea",
    SauronRegular = "4d138c",
    SauronRegular = "ad009b",
    SauronRegular = "90e53b",
    SauronRegular = "7d04f1",
    SauronRegular = "2b9f67",
    SauronRegular = "7d5dcb",
    SauronRegular = "0e02f6",
    SauronRegular = "3897a7",
    SauronRegular = "f7720b",
    SauronRegular = "c34189",
    RohanRegular = "de8e94",
    RohanRegular = "3c4e86",
    RohanRegular = "c51fa9",
    RohanRegular = "c92f4c",
    RohanRegular = "762f8f",
    RohanRegular = "448f2c",
    RohanRegular = "8f00bd",
    RohanRegular = "72f7d0",
    RohanRegular = "e99c6b",
    RohanRegular = "2722d8",
    GondorRegular = "9a0f54",
    GondorRegular = "f5fb23",
    GondorRegular = "875299",
    GondorRegular = "c51ece",
    GondorRegular = "9b0ac5",
    GondorRegular = "2c5ed2",
    GondorRegular = "24b493",
    GondorRegular = "e99818",
    GondorRegular = "a1cc6d",
    GondorRegular = "ee95ed",
    GondorRegular = "b12510",
    GondorRegular = "7e0a97",
    GondorRegular = "e14237",
    GondorRegular = "5f16df",
    GondorRegular = "ed081f",
    LadyGaladrielKeeperofNenya = "a222f0",
    TheDeadMenofDunharrow = "5e7f2b",
    TheDeadMenofDunharrow = "386de7",
    TheDeadMenofDunharrow = "567ec5",
    TheDeadMenofDunharrow = "a73726",
    TheDeadMenofDunharrow = "97af3e",
    TheDeadMenofDunharrow = "d61030",
    TheDeadMenofDunharrow = "d608ef",
    TheEaglesoftheMistyMountains = "deb5b7",
    TheEaglesoftheMistyMountains = "49a741",
    TheEaglesoftheMistyMountains = "b61efd",
    TheEaglesoftheMistyMountains = "442f16",
    TheEaglesoftheMistyMountains = "e8c616",
    TheEaglesoftheMistyMountains = "ee1011",
    TheEaglesoftheMistyMountains = "0fe348",
    TheHillmenofDunland = "31f199",
    TheHillmenofDunland = "0e0408",
    TheHillmenofDunland = "1e5b16",
    TheHillmenofDunland = "887364",
    TheHillmenofDunland = "e892a8",
    TheHillmenofDunland = "5e7de8",
    TheHillmenofDunland = "725daa",
    TheHillmenofDunland = "e3403b",
    TheCorsairsofUmbar = "3acc28",
    TheCorsairsofUmbar = "8070cf",
    TheCorsairsofUmbar = "932b3a",
    TheCorsairsofUmbar = "66912b",
    TheCorsairsofUmbar = "7adf0a",
    TheCorsairsofUmbar = "94c817",
    TheCorsairsofUmbar = "351a44",
    TheCorsairsofUmbar = "e8c0fa",
    TheBroodsofShelob = "46c51d",
    TheBroodsofShelob = "f27abe",
    TheBroodsofShelob = "5456a9",
    TheBroodsofShelob = "27f698",
    TheBroodsofShelob = "8b0cfb",
    TheBroodsofShelob = "35d507",
    TheBroodsofShelob = "0a17ee",
    TheBroodsofShelob = "9d9e88",
    Peregrin = "a34d6c",
    Meriadoc = "5642f1",
    Gimli = "f454fb",
    Boromir = "7bfefc",
    Legolas = "a335e0",
    Strider = "e226bf",
    GandalftheGrey = "e1ebc2",
    Gollum = "0df4d4",
    Smeagol = "38461c",
    TheEntsofFangorn = "db68fe",
    TheEntsofFangorn = "468738",
    TheEntsofFangorn = "09751a",
    TheEntsofFangorn = "0965c7",
    TheEntsofFangorn = "43c87f",
    TheEntsofFangorn = "dc0e23",
    TheEntsofFangorn = "8ee682",
    GondorLeader = "e1bb7a",
    GondorLeader = "dbf02c",
    GondorLeader = "d588e0",
    RohanLeader = "559e50",
    GondorElite = "ec3650",
    GondorElite = "37dffe",
    GondorElite = "76c833",
    GondorElite = "0bda00",
    Nazgul = "9fe34b",
    Nazgul = "cb19dc",
    Nazgul = "350321",
    Nazgul = "da05fb",
    Nazgul = "1b28a5",
    Nazgul = "8f8470",
    Nazgul = "4ce1e4",
    Nazgul = "a7e6a3",
    RohanLeader = "f44442",
    RohanLeader = "2d3928",
    RohanElite = "0f948a",
    GondorLeader = "75b0e1",
    GondorElite = "47243e",
    RohanElite = "bc6cf0",
    RohanElite = "ec7f49",
    RohanElite = "0fa2ac",
    RohanElite = "4070b3",
    DwarfLeader = "28e506",
    DwarfLeader = "227595",
    DwarfLeader = "8d26c4",
    DwarfLeader = "1cb2bb",
    DwarfRegular = "e1dc22",
    DwarfElite = "f7a96d",
    DwarfElite = "a8cefc",
    DwarfElite = "5d78f1",
    DwarfElite = "2c3d84",
    DwarfElite = "7aeef6",
    DwarfRegular = "7ad754",
    DwarfRegular = "1c5d25",
    DwarfRegular = "c8c7c3",
    DwarfRegular = "72a79e",
    ElfElite = "564c51",
    ElfLeader = "97754d",
    ElfLeader = "761235",
    ElfLeader = "3d9180",
    ElfElite = "3b7f8d",
    ElfElite = "b48795",
    ElfElite = "7a1401",
    ElfElite = "1e5d01",
    ElfElite = "248a90",
    ElfElite = "aecd0d",
    ElfElite = "88fe66",
    ElfLeader = "2091a5",
    ElfElite = "c14be0",
    ElfElite = "c9178b",
    ElfRegular = "0c4d28",
    ElfRegular = "d55d43",
    ElfRegular = "eb84d3",
    ElfRegular = "d51a23",
    ElfRegular = "2d26c1",
    NorthLeader = "f92f24",
    NorthLeader = "df08a6",
    NorthLeader = "447f42",
    NorthLeader = "867660",
    NorthElite = "e50d59",
    NorthElite = "6cb6dd",
    NorthElite = "2e2672",
    NorthElite = "9fb94e",
    NorthElite = "3382bf",
    RohanLeader = "1966fa",
    NorthRegular = "485362",
    NorthRegular = "3ae72d",
    NorthRegular = "3d2240",
    NorthRegular = "222b9a",
    NorthRegular = "945ed1",
    NorthRegular = "9e917f",
    NorthRegular = "088b53",
    NorthRegular = "0751d0",
    NorthRegular = "ef2e1d",
    NorthRegular = "13e95d",
    SouthronEasterlingRegular = "ee5265",
    SouthronEasterlingRegular = "ebbc7f",
    SouthronEasterlingRegular = "890c02",
    SouthronEasterlingElite = "c610c7",
    SauronElite = "726e29",
    SauronElite = "7b9473",
    SauronElite = "bd3b3e",
    SauronElite = "6fb119",
    SauronElite = "688b07",
    SauronElite = "9a2364",
    IsengardRegular = "4e7a37",
    IsengardRegular = "f39eef",
    IsengardRegular = "6841b2",
    IsengardRegular = "4168c6",
    IsengardRegular = "b1d8ff",
    IsengardRegular = "684bde",
    IsengardRegular = "4554a0",
    IsengardRegular = "063647",
    IsengardRegular = "a7a7df",
    IsengardRegular = "4b1cba",
    IsengardRegular = "ba92de",
    IsengardRegular = "f98180",
    IsengardElite = "ba6a05",
    IsengardElite = "230226",
    IsengardElite = "0b4d72",
    IsengardElite = "c08635",
    IsengardElite = "91bee2",
    IsengardElite = "26d16b",
    TheEntsofFangorn = "8ad06a",
    TheEaglesoftheMistyMountains = "a4f905",
    TheDeadMenofDunharrow = "444804",
    SouthronEasterlingRegular = "c1a791",
    SouthronEasterlingRegular = "c82481",
    SouthronEasterlingRegular = "885576",
    SouthronEasterlingRegular = "0132bf",
    SouthronEasterlingRegular = "86efa9",
    SouthronEasterlingRegular = "938801",
    SouthronEasterlingElite = "9e2776",
    SouthronEasterlingElite = "1996cc",
    SouthronEasterlingElite = "ce6bf9",
    SouthronEasterlingElite = "8aaa87",
    SouthronEasterlingElite = "f0dda4",
    SouthronEasterlingRegular = "084843",
    SouthronEasterlingRegular = "48042e",
    SouthronEasterlingRegular = "c9dfb9",
    SouthronEasterlingRegular = "463845",
    SouthronEasterlingRegular = "9371e2",
    SouthronEasterlingRegular = "3686a8",
    SouthronEasterlingRegular = "ba6127",
    SouthronEasterlingRegular = "9e72fb",
    SouthronEasterlingRegular = "dbe45d",
    SouthronEasterlingRegular = "a49639",
    SouthronEasterlingRegular = "e3914d",
    SouthronEasterlingRegular = "d48ec2",
    SouthronEasterlingRegular = "df5553",
    SouthronEasterlingRegular = "61f323",
    SouthronEasterlingRegular = "d02b72",
    UglukChieftainoftheUrukHai = "63d531",
    TheBlackSerpentChieftainoftheHaradrim = "c4c009",
    TheShadowofMirkwoodChieftainoftheDarkLord = "fc67e9",
    ThranduilKingoftheWoodlandRealm = "b6ec8b",
    BrandKingofDale = "3d983d",
    DainKingUndertheMountain = "554922",
    DenethorLordStewardofGondor = "79b781",
    TheodenKingoftheRiddermark = "51d8e0",
    LordElrondKeeperofVilya = "cd1a0a"
}

function onLoad()
    -- setupUnits()
end

function setupUnits()
    for I, UnitId in pairs(ArmyUnits) do
        unitObj = getObjectFromGUID(UnitId)
        unitObj.setLuaScript(unitLuaScript)
        
        updateStates(unitObj)
    end
end

function updateStates(UnitObj)
    UnitObj.getObjects()
    states = UnitObj.getStates()
    if (states == nil) then
        -- print("states is nil")
        return
    end

    print("states is not nil")

    for _, StateObj in pairs(states) do
        print("test states")
        StateObj.setLuaScript(unitLuaScript)
        lua = StateObj.getLuaScript()
        print(lua)
    end
end

function removeScriptsFromAllUnits()
    for I, UnitId in pairs(ArmyUnits) do
        unitObj = getObjectFromGUID(UnitId)
        unitObj.setLuaScript("")
    end
end

function buildIdString()
    allUnits = getAllUnits()

    clipboardId = "c0347d"
    clipboard = getObjectFromGUID(clipboardId)

    buildString = "ArmyUnits = {"
    
    for I, Obj in pairs(allUnits) do
        line = getUnitLine(Obj)
        buildString = buildString .. line
    end

    clipboard.setLuaScript(buildString)
end

function getUnitLine(Obj)
    returnValue = "\r\n"
    name = Obj.getName()
    -- remove chars
    name = name:gsub('[%p%c%s]', '')
    guid = Obj.getGUID()
    returnValue = name .. " = \"" .. guid .. "\","
end

function getAllUnits()
    arr = {}
    allObjects = getAllObjects()

    for I, Obj in pairs(allObjects) do
        luaScript = Obj.getLuaScript()
        if (luaScript == unitLuaScript) then
            arr[I] = Obj
        end

        states = Obj.getStates()
        for I, StateObj in pairs(states) do
            luaScript = StateObj.luaSc
        end
    end
    return arr
end