DiceColor = {0.5,0.5,1}
PipColor = {1,1,1}
Side = ""
SideName = ""
Dice = {}
Rolling = false
RollingTable = {} --list of dice actively rolling.
RolledTable = {} --list of dice finished rolling.
ResultTable = {} --table of roll results.
ResultText = ""
OffsetX = 4.5
OffsetY = 0.5
OffsetZ = -4
Gap = 1.5
Radians = math.pi / 180

function onLoad(save_state)
    if string.find(self.getDescription(),"Shadow;") ~= nil then
        Side = "Shadow"
        SideName = "Shadow"
    else
        Side = "FreePeoples"
        SideName = "Free Peoples"
    end--if
    DisplayButtons()
end--function

function onObjectLeaveContainer(Container,Object)
    if Container.getGUID() == self.getGUID() then
        Object.setName("("..SideName.." Combat Die)")
        Object.setDescription("Dice;Combat;"..Side..";Panel:"..self.getGUID()..";")
        Wait.frames(function() Object.setVar("PanelID",self.getGUID()) end,1)
    end--if
end--function

function ReadTag(Params) --{Text="",Var="",Default=""}
  --returns a value read from a line of text:  ex: System:ABCDE; will return ABCDE,or the default value if not found...
  if Params.Default == nil then Params.Default = "" end--if
  local VarValue=string.match(Params.Text,Params.Var..":.-;")
  if VarValue == nil then
    return Params.Default
  else
    VarValue=string.sub(VarValue,string.len(Params.Var)+2,-2)
    return VarValue
  end--if
end--function

function ResetDice()
    Dice = {}
    Rolling = false
    RollingTable = {}
    RolledTable = {}
    ResultTable = {}
    ResultText = ""
    for D,DD in pairs(getAllObjects()) do
        if DD.getDescription() == "Dice;Combat;"..Side..";Panel:"..self.getGUID()..";" then
            DD.destruct()
        end--if
    end--for D,DD
end--function

function Roll1() RollCombatDice(1) end--function
function Roll2() RollCombatDice(2) end--function
function Roll3() RollCombatDice(3) end--function
function Roll4() RollCombatDice(4) end--function
function Roll5() RollCombatDice(5) end--function

function RollCombatDice(Num)
    ResetDice()
    local P = self.getPosition()
    local Dice = {}
    for D=1,Num do
        local Die = self.takeObject({smooth=false,position=CalcSpot({Spot=self.getPosition(),Offset={OffsetX-D*Gap,OffsetY,OffsetZ},Angle=self.getRotation().y})})
        table.insert(Dice,Die.getGUID())
        Die.randomize()
        Wait.time(function() Die.randomize() end,0.5)
        Wait.time(function() Die.call("Roll") end,1)
    end--for D
end--function

function CalcSpot(Params)     --Spot,Offset,Angle
    return vector(Params.Spot[1]+(Params.Offset[3]*math.sin(Params.Angle*Radians)+Params.Offset[1]*math.cos(Params.Angle*Radians)),Params.Spot[2]+Params.Offset[2],Params.Spot[3]+(Params.Offset[3]*math.cos(Params.Angle*Radians)-Params.Offset[1]*math.sin(Params.Angle*Radians)))
end--function

function DisplayButtons()
    self.clearButtons()
    self.createButton({click_function="ResetDice",function_owner=self,label="x",position={-0.42,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Clear this Panel's Dice."})
    self.createButton({click_function="Roll1",function_owner=self,label="1",position={-0.28,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Roll 1 Combat Dice."})
    self.createButton({click_function="Roll2",function_owner=self,label="2",position={-0.14,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Roll 2 Combat Dice."})
    self.createButton({click_function="Roll3",function_owner=self,label="3",position={0,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Roll 3 Combat Dice."})
    self.createButton({click_function="Roll4",function_owner=self,label="4",position={0.14,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Roll 4 Combat Dice."})
    self.createButton({click_function="Roll5",function_owner=self,label="5",position={0.28,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Roll 5 Combat Dice."})
    self.createButton({click_function="ReportDiceStats",function_owner=Global,label="?",position={0.42,0.5,-0.6},rotation={0,0,0},scale={0.25,0.5,0.5},color=DiceColor,width=290,height=600,font_size=300,font_color=PipColor,tooltip="Display Dice Statistics."})
end--function

function InsertRoll(Params)  --{DiceID=""}
    --only insert this dice roll if it did not already roll in this batch...
    local Dupe = false
    for R = 1,#RolledTable do
        if RolledTable[R] == Params.DiceID then
            Dupe = true
            break
        end--if
    end--for
    if not Dupe then
        table.insert(RollingTable,Params.DiceID)
        table.insert(RolledTable,Params.DiceID)
        if not Rolling then
            startLuaCoroutine(self,"RollingCoroutine")
        end--if
    end--if
end--function

function DeleteRoll(Params)  --{DiceID=""}
    --remove this dice from roll tables...
    for R=1,#RollingTable do
        if RollingTable[R] == Params.DiceID then
            table.remove(RollingTable,R)
            break
        end--if
    end--for
    for R=1,#RolledTable do
        if RolledTable[R] == Params.DiceID then
            table.remove(RolledTable,R)
            break
        end--if
    end--for
end--function

function ReportRoll(Params)  --{DiceID=""}
    --remove this dice from rolling table and report result...
    for R=1,#RollingTable do
        if RollingTable[R] == Params.DiceID then
        table.remove(RollingTable,R)
        table.insert(ResultTable,getObjectFromGUID(Params.DiceID).getValue())
        break
        end--if
    end--for
end--function

function RollingCoroutine()
    --start this coroutine when any of this player's dice start rolling...
    --signal this player is rolling a batch of their dice...
    Rolling = true
    --clear results table, we're collecting a new results table now...
    ResultTable = {}
    --keep looping until all rolling dice come to rest...
    while #RollingTable > 0 do
        coroutine.yield(0)
    end--while
    --display this batch of dice roll results...
    printToAll("-------------------------------------------------",DiceColor)
    if #RolledTable == 1 then
        ResultText = SideName.." Player rolled a Combat Die: ["..getObjectFromGUID(RolledTable[1]).getValue().."]"
        Global.call("UpdateDiceStats",{Result=ResultTable[1],Type="Combat",Side=Side})
    else
        ResultText = SideName.." Player rolled "..#RolledTable.." Combat Dice:\n"
        for R=1,#ResultTable do
        if ResultTable[R] > 0 then
            ResultText = ResultText.."["..ResultTable[R].."]  "
            Global.call("UpdateDiceStats",{Result=ResultTable[R],Type="Combat",Side=Side})
        end--if
      end--for
    end--if
    broadcastToAll(ResultText,DiceColor)
    printToAll("\n")
    --clear Tables...
    RollingTable = {}
    RolledTable = {}
    --signal this player is done rolling this batch of dice...
    Rolling = false
    return 1
end--function
