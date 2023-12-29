function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="PlaySoundEffect",function_owner=self,label=">",position={-2.3,0.05,0},rotation={0,180,0},color={0.83,0.78,0.21},width=250,height=250,font_size=250,font_color={0,0,0},tooltip="play Isengard Army sound effect."})
    self.createButton({click_function="PlaySoundEffect2",function_owner=self,label=">",position={-2.3,0.05,0.5},rotation={0,180,0},color={0.83,0.78,0.21},width=250,height=250,font_size=250,font_color={0,0,0},tooltip="We have work to do."})
    self.createButton({click_function="PlaySoundEffect3",function_owner=self,label=">",position={-2.3,0.05,-0.5},rotation={0,180,0},color={0.83,0.78,0.21},width=250,height=250,font_size=250,font_color={0,0,0},tooltip="No dawn for men."})
end--function 

function PlaySoundEffect()
    Global.call("PlaySound",{ID=18})--isengard horn
end--function 

function PlaySoundEffect2()
    Global.call("PlaySound",{ID=12})--we have work to do
end--function 

function PlaySoundEffect3()
    Global.call("PlaySound",{ID=11})--no dawn for men
end--function 