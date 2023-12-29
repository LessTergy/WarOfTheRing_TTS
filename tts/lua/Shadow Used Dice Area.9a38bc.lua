
function onCollisionEnter(collision_info)
    local DiceName = collision_info.collision_object.getName()
    if DiceName == "Shadow Action Dice" or DiceName == "(Shadow Faction Die)" or DiceName == "(Balrog Die)" or DiceName == "(Gothmog Die)" then
        if Global.getVar("Phase") == 5 then
            if string.find(collision_info.collision_object.getGMNotes(),"Played;") == nil then
                collision_info.collision_object.setGMNotes("Played;")
                printToAll("\nShadow played: "..collision_info.collision_object.getRotationValue().." "..DiceName..".",{1,0.4,0.4})
            end--if
        else 
            collision_info.collision_object.setGMNotes("")
        end--if
    end--if
end--function 