
function onCollisionEnter(collision_info)
    local DiceName = collision_info.collision_object.getName()
    if DiceName == "Shadow Action Dice" or DiceName == "(Shadow Faction Die)" or DiceName == "(Balrog Die)" or DiceName == "(Gothmog Die)" then
        collision_info.collision_object.setGMNotes("")
    end--if
end--function 
