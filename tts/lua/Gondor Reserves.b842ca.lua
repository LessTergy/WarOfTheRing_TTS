function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="PlaySoundEffect",function_owner=self,label=">",position={-2.9,0.05,0},rotation={0,180,0},color={0.32,0,0.51},width=250,height=250,font_size=250,font_color={1,1,1},tooltip="For Gondor!!!."})
end--function 

function PlaySoundEffect()
    Global.call("PlaySound",{ID=21})--for gondor!
end--function 