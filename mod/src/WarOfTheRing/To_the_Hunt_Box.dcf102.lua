function onCollisionEnter(collision_info)
    local collisionObject = collision_info.collision_object
    local isDice = string.find(collisionObject.getDescription(), "Dice;") ~= nil

    if not isDice then
        return
    end

    local fellowshipToken = getObjectFromGUID("6b62ef")
    local fellowshipIsHidden = fellowshipToken.getRotation().z < 90 or fellowshipToken.getRotation().z > 270

    if not fellowshipIsHidden then
        broadcastToAll("Warning: Fellowship cannot move while revealed.", { 1, 1, 0 })
        return
    end

    local IDs = Global.call("GetIDs")
    local ringBearersObj = getObjectFromGUID(IDs.Companions.TheRingBearers)

    --if ring-bearers are not on the mordor track
    local isOnMtDoomTrack = string.find(ringBearersObj.getGMNotes(), "Mount Doom") ~= nil
    if not isOnMtDoomTrack then
        local OldValue = math.floor((fellowshipToken.getPosition().x - 5.0) / 1.58)
        if OldValue < 0 then OldValue = 0 elseif OldValue > 12 then OldValue = 12 end
        fellowshipToken.setPositionSmooth(
            { fellowshipToken.getPosition().x + 1.6, 1.01, 23.2 }, false, false)
        broadcastToAll(
            "The Fellowship moved on the Fellowship Track from " ..
            tostring(OldValue) .. " to " .. tostring(OldValue + 1) .. ".", { 1, 1, 0 })

        --if sic shadow panel is in play
        local combatRollPanel = getObjectFromGUID("4b6f4c")
        if combatRollPanel ~= nil then
            local HuntLevel = 0
            local ToHit = 6
            local ReRolls = 0
            for _, Obj in pairs(getObjectFromGUID("b06145").getObjects()) do
                --make sure it's not this new die (ignore if it is)
                if Obj.getGUID() ~= collisionObject.getGUID() then
                    --if eye or shadow die then increment hunt level to max 5
                    if string.find(Obj.getDescription(), "Shadow;") ~= nil or string.find(Obj.getRotationValue(), "Eye") ~= nil then
                        HuntLevel = HuntLevel + 1
                    elseif string.find(Obj.getDescription(), "FreePeoples;") ~= nil then
                        ToHit = ToHit - 1
                    end
                end
            end

            --get RingBearer's region

            local Region = Global.call("ReadTag", { Var = "Region", Text = ringBearersObj.getGMNotes(), Default = "" })
            if Region ~= "" then
                --shadow stronghold?
                local Regions = Global.getTable("Regions")
                if Regions[Region].Control == "Shadow" and Regions[Region].Settlement == "Stronghold" then
                    ReRolls = ReRolls + 1
                    printToAll("The Ring-Bearers are in a Shadow Controlled Stronghold.")
                end
                --nazgul or shadow army unit in the same region?
                local NFlag = 0
                local AFlag = 0
                for _, Obj in pairs(getAllObjects()) do
                    if string.find(Obj.getGMNotes(), Region) ~= nil then
                        --shadow?
                        if string.find(Obj.getDescription(), "Shadow;") ~= nil then
                            --nazgul or shadow army?
                            if string.find(Obj.getDescription(), "Nazgul;") ~= nil or string.find(Obj.getName(), "Witch%-King") ~= nil then
                                NFlag = 1
                            elseif string.find(Obj.getDescription(), "Regular;") or string.find(Obj.getDescription(), "Elite;") then
                                AFlag = 1
                            end
                        end
                    end
                    if NFlag + AFlag == 2 then break end
                end
                if NFlag > 0 then
                    printToAll("A Nazgul is in the same region as The Ring Bearers.")
                    ReRolls = ReRolls + 1
                end
                if AFlag > 0 then
                    printToAll("A shadow Army Unit is in the same region as The Ring Bearers.")
                    ReRolls = ReRolls + 1
                end
            else
                printToAll("Could not determine the Ring-bearer's region.")
            end

            if ReRolls > 3 then ReRolls = 3 end
            if HuntLevel > 5 then HuntLevel = 5 end
            if ToHit < 2 then ToHit = 2 end
            getObjectFromGUID("92a611").call("switchToHunt", {
                HuntLevel = HuntLevel,
                ToHit = ToHit,
                ReRolls =
                    ReRolls
            })
        end
    else
        broadcastToAll("The Fellowship is attempting to move on the Mordor Track.", { 1, 1, 0 })
    end

    local DiceName = collisionObject.getName()
    if DiceName == "(Free Peoples Action Die)" or DiceName == "(Free Peoples Faction Die)" or DiceName == "(Vilya Die)" or DiceName == "(Nenya Die)" or DiceName == "(Narya Die)" then
        if string.find(collisionObject.getGMNotes(), "Played;") == nil then
            collisionObject.setGMNotes("Played;")
            printToAll(
                "\nFree Peoples played: " ..
                collisionObject.getRotationValue() .. " " .. DiceName .. ".", { 0.4, 0.4, 1 })
        end
    end

    --add dice to the freepeoples huntbox table
    local GamePanel = getObjectFromGUID(Global.getVar("GamePanelID"))
    GamePanel.call("AddFreePeopleDiceToHunt", collisionObject)

    local Spots = GamePanel.getTable("Spots")
    local Placed = false

    --get next open spot in the hunt box and place the die there
    for I = 1, #Spots.FreePeoplesHuntBoxDice do
        local OK = true
        for _, Obj in pairs(Physics.cast({ origin = { Spots.FreePeoplesHuntBoxDice[I][1], 1.5, Spots.FreePeoplesHuntBoxDice[I][3] }, direction = { 0, 1, 0 }, size = { 1, 1, 1 }, orientation = { 0, 0, 0 }, type = 3, max_distance = 0, debug = false })) do
            if string.find(Obj.hit_object.getDescription(), "Dice;") ~= nil then
                OK = false
                break
            end
        end
        if OK then
            Placed = true
            collisionObject.setPositionSmooth(Spots.FreePeoplesHuntBoxDice[I], false, true)
            collisionObject.setRotation({ collisionObject.getRotation().x, 0,
                collisionObject.getRotation().z })
            break
        end
    end

    if not Placed then
        --just drop it above the hunt box
        collisionObject.setPositionSmooth({ -34, 5, -22 }, false, false)
    end
end
