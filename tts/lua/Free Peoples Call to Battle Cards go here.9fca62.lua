Side = "FreePeoples"
DeckID = ""

function onload()
  ShowButtons()
end--function

function ShowButtons()
  self.clearButtons()
  self.createButton({click_function="Nothing",function_owner=self,label="Call to Battle\n Cards",position={0,0.3,-0.9},width=0,height=0,font_size=175,font_color={1,1,1,0.5}})
  self.createButton({click_function="AddToHand",function_owner=self,label="Add to Hand",position={0,0.3,0.7},width=900,height=300,color={1,1,1,0.7},font_size=125})
  self.createButton({click_function="ReturnCards",function_owner=self,label="Return Cards",position={0,0.3,1.7},width=900,height=300,color={1,1,1,0.7},font_size=125})
end--function

function AddToHand(Obj,Color)
  if Color == "Blue" or Color == "Green" then
    function AddToHandCoroutine()
      --detect the deck id
      DeckID = GetDeckID()
      if DeckID == nil then
        return 1
      end--if
      local DeckCount = getObjectFromGUID(DeckID).getQuantity()
      local HandCount = #Player[Color].getHandObjects()
      --deal the cards...
      getObjectFromGUID(DeckID).deal(DeckCount,Color)
      repeat
        coroutine.yield(0)
      until #Player[Color].getHandObjects() >= DeckCount + HandCount
      for X=1,20 do coroutine.yield(0) end--for
      Global.call("ShuffleHand",{player=Color})
      --always return 1...
      return 1
    end--function
    startLuaCoroutine(self,"AddToHandCoroutine")
  else
    printToColor("Not your hand.",Color)
  end--if
end--function

  function ReturnCards(Obj,Color)
    if Color == "Blue" or Color == "Green" then
      function ReturnCardsCoroutine()
        --search cards...
        local HandID = "63b83a"--assume blue
        if Color == "Green" then HandID = "588435" end--if
        for _,Obj in pairs(getObjectFromGUID(HandID).getObjects()) do
          if Obj.type == "Card" then
            if string.find(Obj.getDescription(),"Card;CallToBattle;") != nil and string.find(Obj.getDescription(),Side) != nil then
              Obj.setPosition(self.getPosition())
              Obj.setRotation({0,self.getRotation().y,180})
              --coroutine.yield(0)
              Obj.setPositionSmooth({self.getPosition().x,self.getPosition().y+0.2,self.getPosition().z}, false,true)
            end--if
          end--if
        end--for
        for X=1,10 do coroutine.yield(0) end--for
        --wait for deck to form...
        repeat
          DeckID = GetDeckID()
          coroutine.yield(0)
        until DeckID != nil
        return 1
      end--function
      startLuaCoroutine(self,"ReturnCardsCoroutine")
    else
      printToColor("Not your hand.",Color)
    end--if
  end--function

function GetDeckID()
  --detect the deck id
  for _,Obj in pairs(Physics.cast({origin=self.getPosition(),direction={0,1,0},type=2,size={1,1,1},orientation={0,0,0},max_distance=0,debug=false})) do
    if Obj.hit_object.tag=="Deck" then
      Obj.hit_object.setName(Side.." Call to Battle Cards (WoME)")
      Obj.hit_object.setDescription("Deck;CallToBattle;"..Side..";WoME;")
      local GamePanelID = Global.getVar("GamePanelID")
      if getObjectFromGUID(GamePanelID) != nil then
        local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
        IDs.WoME[Side.."CallToBattleDeck"] = Obj.hit_object.getGUID()
        getObjectFromGUID(GamePanelID).setTable("IDs",IDs)
      end--if
      return Obj.hit_object.getGUID()
    end
  end--for
end--function