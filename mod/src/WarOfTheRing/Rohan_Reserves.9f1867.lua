function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="PlaySoundEffect",function_owner=self,label=">",position={-2.9,0.05,0},rotation={0,180,0},color={0.30,0.45,0.29},width=250,height=250,font_size=250,font_color={1,1,1},tooltip="Play Rohan horn sound effect."})
    self.createButton({click_function="PlaySoundEffect2",function_owner=self,label=">",position={-2.9,0.05,-0.5},rotation={0,180,0},color={0.30,0.45,0.29},width=250,height=250,font_size=250,font_color={1,1,1},tooltip="Play Rohan music sound effect."})
end--function 

function PlaySoundEffect()
    Global.call("PlaySound",{ID=20})--rohan horn
end--function 

function PlaySoundEffect2()
    Global.call("PlaySound",{ID=2})--riders of rohan
end--function 
