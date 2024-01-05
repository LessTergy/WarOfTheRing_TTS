
function onCollisionEnter(collision_info)
    local DiceName = collision_info.collision_object.getName()
    if DiceName == "(Free Peoples Action Die)" or DiceName == "(Free Peoples Faction Die)" or DiceName == "(Vilya Action Die)" or DiceName == "(Nenya Action Die)" or DiceName == "(Narya Action Die)" then
        if Global.getVar("Phase") == 5 then
            if string.find(collision_info.collision_object.getGMNotes(),"Played;") == nil then
                collision_info.collision_object.setGMNotes("Played;")
                printToAll("\nFree Peoples played: "..collision_info.collision_object.getRotationValue().." "..DiceName..".",{0.4,0.4,1})
            end--if
        else 
            collision_info.collision_object.setGMNotes("")
        end--if
    end--if
end--function 
