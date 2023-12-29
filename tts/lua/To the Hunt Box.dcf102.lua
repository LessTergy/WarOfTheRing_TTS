function onCollisionEnter(collision_info)
    --is it a dice?
    if string.find(collision_info.collision_object.getDescription(),"Dice;") != nil then
        --fellowship revealed?
        if getObjectFromGUID("6b62ef").getRotation().z < 90 or getObjectFromGUID("6b62ef").getRotation().z > 270 then
            broadcastToAll("Warning: Fellowship cannot move while revealed.", {1,1,0})
        else--fellowship is hidden... 
            --if ring-bearers are not on the mordor track...
            local RBObj = getObjectFromGUID("e76bc8") 
            if RBObj == nil then RBObj =  getObjectFromGUID("d67c12") end--if
            if RBObj == nil then RBObj =  getObjectFromGUID("b98185") end--if
            if string.find(RBObj.getGMNotes(),"Mount Doom") == nil then
                local OldValue = math.floor((getObjectFromGUID("6b62ef").getPosition().x-5.0)/1.58)
                if OldValue < 0 then OldValue = 0 elseif OldValue > 12 then OldValue = 12 end--if
                getObjectFromGUID("6b62ef").setPositionSmooth({getObjectFromGUID("6b62ef").getPosition().x+1.6,1.01,23.2},false,false)
                broadcastToAll("The Fellowship moved on the Fellowship Track from "..tostring(OldValue).." to "..tostring(OldValue+1)..".",{1,1,0})
                --if sic shadow panel is in play... 
                if getObjectFromGUID("4b6f4c") != nil then
                    local HuntLevel = 0
                    local ToHit = 6
                    local ReRolls = 0
                    for O,Obj in pairs(getObjectFromGUID("b06145").getObjects()) do 
                        --make sure it's not this new die (ignore if it is)...
                        if Obj.getGUID() != collision_info.collision_object.getGUID() then
                        --if eye or shadow die then increment hunt level to max 5
                            if string.find(Obj.getDescription(),"Shadow;") != nil or string.find(Obj.getRotationValue(),"Eye") != nil then
                                HuntLevel = HuntLevel + 1
                            elseif string.find(Obj.getDescription(),"FreePeoples;") != nil then
                                ToHit = ToHit - 1
                            end--if
                        end--if
                    end--for O,Obj 
                    --get RingBearer's region... 
                    local RB = getObjectFromGUID("e76bc8")
                    if RB == nil then getObjectFromGUID("d67c12") end--if
                    if RB == nil then getObjectFromGUID("b98185") end--if
                    if RB == nil then
                        printToAll("Could not determine the Ring-bearer's region.")
                    else
                        local Region = Global.call("ReadTag",{Var="Region",Text=RB.getGMNotes(),Default=""})
                        if Region != "" then
                            --shadow stronghold?
                            local Regions = Global.getTable("Regions")
                            if Regions[Region].Control == "Shadow" and Regions[Region].Settlement == "Stronghold" then
                                ReRolls = ReRolls + 1
                                printToAll("The Ring-Bearers are in a Shadow Controlled Stronghold.")
                            end--if
                            --nazgul or shadow army unit in the same region?
                            local NFlag = 0
                            local AFlag = 0
                            for O,Obj in pairs(getAllObjects()) do 
                                if string.find(Obj.getGMNotes(),Region) != nil then
                                    --shadow?
                                    if string.find(Obj.getDescription(),"Shadow;") != nil then 
                                        --nazgul or shadow army?
                                        if string.find(Obj.getDescription(),"Nazgul;") != nil or string.find(Obj.getName(),"Witch%-King") != nil then 
                                            NFlag = 1
                                        elseif string.find(Obj.getDescription(),"Regular;") or string.find(Obj.getDescription(),"Elite;") then
                                            AFlag = 1
                                        end--if
                                    end--if
                                end--if
                                if NFlag + AFlag == 2 then break end--if
                            end--for O,Obj 
                            if NFlag > 0 then
                                printToAll("A Nazgul is in the same region as The Ring Bearers.")
                                ReRolls = ReRolls + 1
                            end--if
                            if AFlag > 0 then
                                printToAll("A shadow Army Unit is in the same region as The Ring Bearers.")
                                ReRolls = ReRolls + 1
                            end--if
                        else 
                            printToAll("Could not determine the Ring-bearer's region.")
                        end--if
                    end--if
                    if ReRolls > 3 then ReRolls = 3 end--if
                    if HuntLevel > 5 then HuntLevel = 5 end--if
                    if ToHit < 2 then ToHit = 2 end--if
                    getObjectFromGUID("92a611").call("switchToHunt",{HuntLevel=HuntLevel,ToHit=ToHit,ReRolls=ReRolls})
                end--if
            else 
                broadcastToAll("The Fellowship is attempting to move on the Mordor Track.",{1,1,0})
            end--if
            local DiceName = collision_info.collision_object.getName()
            if DiceName == "(Free Peoples Action Die)" or DiceName == "(Free Peoples Faction Die)" or DiceName == "(Vilya Die)" or DiceName == "(Nenya Die)" or DiceName == "(Narya Die)" then
                if true or Global.getVar("Phase") == 5 then
                    if string.find(collision_info.collision_object.getGMNotes(),"Played;") == nil then
                        collision_info.collision_object.setGMNotes("Played;")
                        printToAll("\nFree Peoples played: "..collision_info.collision_object.getRotationValue().." "..DiceName..".",{0.4,0.4,1})
                    end--if
                end--if
            end--if
            --add dice to the freepeoples huntbox table...
            local GamePanel = getObjectFromGUID(Global.getVar("GamePanelID"))
            local HuntBoxFreePeoplesDice = GamePanel.getTable("HuntBoxFreePeoplesDice")
            local Spots = GamePanel.getTable("Spots")
            local Placed = false
            table.insert(HuntBoxFreePeoplesDice,collision_info.collision_object.getGUID())
            GamePanel.setTable("HuntBoxFreePeoplesDice",HuntBoxFreePeoplesDice)
            --increment the free peoples hunt dice count...
            GamePanel.setVar("FreePeoplesHuntDiceCount",GamePanel.getVar("FreePeoplesHuntDiceCount")+1)
            --get next open spot in the hunt box and place the die there... 
            for D = 1,#Spots.FreePeoplesHuntBoxDice do
                local OK = true
                for O,Obj in pairs(Physics.cast({origin={Spots.FreePeoplesHuntBoxDice[D][1],1.5,Spots.FreePeoplesHuntBoxDice[D][3]},direction={0,1,0},size={1,1,1},orientation={0,0,0},type=3,max_distance=0,debug=false})) do
                    if string.find(Obj.hit_object.getDescription(),"Dice;") != nil then
                        OK = false
                        break
                    end--if
                end--for
                if OK then
                    Placed = true
                    collision_info.collision_object.setPositionSmooth(Spots.FreePeoplesHuntBoxDice[D],false,true)
                    collision_info.collision_object.setRotation({collision_info.collision_object.getRotation().x,0,collision_info.collision_object.getRotation().z})
                    break
                end--if
            end--for
            if not Placed then
                --just drop it above the hunt box... 
                collision_info.collision_object.setPositionSmooth({-34,5,-22},false,false)
            end--if
        end--if
    end--if
end--function 