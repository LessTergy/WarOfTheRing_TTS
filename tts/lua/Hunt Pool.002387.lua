function onLoad(save_state)
    self.clearButtons()
    self.createButton({click_function="DrawHuntTile",function_owner=self,label="Draw Tile",position={0,0.3,2},color={0,0,0},font_color={1,1,1},width=1000,height=300,font_size=150,tooltip="Shuffle the bag and draw a hunt tile."})
    self.createButton({click_function="GetOffTheRoad",function_owner=self,label=">",position={1.4,0.3,2},color={0,0,0},font_color={1,1,1},width=300,height=300,font_size=300,tooltip="Get off the road!"})
end--fundtion 

function DrawHuntTile(Object,PlayerColor)
    self.clearButtons()
    function DrawHuntTileCoroutine()
        --any tiles left?
        if self.getQuantity() < 1 then
            printToAll("Hunt Pool is empty.")
        else--draw a tile... 
            --shuffle the hunt pool...
            printToAll("\nShuffling "..self.getQuantity().." Tiles in the Hunt Pool...")
            self.shuffle()
            for D=1,10 do coroutine.yield(0) end--for D
            --shuffle again for good measure...
            printToAll("Double Shuffling...")
            self.shuffle()
            --shuffle again for good measure...
            printToAll("Triple Shuffling...")
            self.shuffle()
            for D=1,10 do coroutine.yield(0) end--for D
            printToAll("Drawing a Hunt Tile from the Hunt Pool...")
            self.takeObject({smooth=true,position={-37.5,3,-18}})
            for D=1,10 do coroutine.yield(0) end--for D
            Player[PlayerColor].pingTable({-37.5,2,-18}) 
            --nazgul scream?
            local Scream = getObjectFromGUID("c35be9").getVar("Scream")
            if Scream == "Always" then
                Global.call("PlaySound",{ID=8})--scream
            end--if
        end--if
        self.createButton({click_function="DrawHuntTile",function_owner=self,label="Draw Tile",position={0,0.3,2},color={0,0,0},font_color={1,1,1},width=1000,height=300,font_size=150,tooltip="Shuffle the bag and draw a hunt tile."})
        self.createButton({click_function="GetOffTheRoad",function_owner=self,label=">",position={1.4,0.3,2},color={0,0,0},font_color={1,1,1},width=300,height=300,font_size=300,tooltip="Get off the road!"})
        return 1
    end--function 
    startLuaCoroutine(self,"DrawHuntTileCoroutine")
end--function 

function GetOffTheRoad()
    Global.call("PlaySound",{ID=37})--get off the road!
end--function 