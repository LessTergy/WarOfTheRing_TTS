function onCollisionEnter(collision_info)
    local DiceName = collision_info.collision_object.getName()
    if DiceName == "(Free Peoples Action Die)" or DiceName == "(Free Peoples Faction Die)" or DiceName == "(Vilya Action Die)" or DiceName == "(Nenya Action Die)" or DiceName == "(Narya Action Die)" then
        collision_info.collision_object.setGMNotes("")
    end
end
