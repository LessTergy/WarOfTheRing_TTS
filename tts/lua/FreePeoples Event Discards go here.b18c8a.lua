Side = "FreePeoples"

function onload()
  UpdateText()
end--function

function UpdateText()
  self.clearButtons()
  self.createButton({click_function="Nothing",function_owner=self,label="Event\nDiscard",position={0,0.65,-0.9},width=0,height=0,font_size=250,font_color={1,1,1,0.5}})
end--functionn