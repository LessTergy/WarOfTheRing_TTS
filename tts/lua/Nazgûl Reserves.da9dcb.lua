function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="PlaySoundEffect",function_owner=self,label=">",position={-2.9,0.05,0},rotation={0,180,0},color={0,0,0},width=250,height=250,font_size=250,font_color={1,0.5,0.25},tooltip="Scream."})
end--function 

function PlaySoundEffect()
    Global.call("PlaySound",{ID=8})--scream
end--function 