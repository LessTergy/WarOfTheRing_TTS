function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="PlaySoundEffect",function_owner=self,label=">",position={-2.3,0.05,0},rotation={0,180,0},color={1,0.16,0.16},width=250,height=250,font_size=250,font_color={0,0,0},tooltip="Play sound effect."})
end--function 

function PlaySoundEffect()
    Global.call("PlaySound",{ID=19})--nazgul theme
end--function 