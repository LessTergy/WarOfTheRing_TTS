function onLoad(save_state)
    self.clearButtons()
    self.createButton({
        click_function = "DrawHuntTile",
        function_owner = self,
        label = "Draw Tile",
        position = { 0, 0.3, 2 },
        color = { 0, 0, 0 },
        font_color = { 1, 1, 1 },
        width = 1000,
        height = 300,
        font_size = 150,
        tooltip = "Shuffle the bag and draw a hunt tile."
    })
    self.createButton({
        click_function = "GetOffTheRoad",
        function_owner = self,
        label = ">",
        position = { 1.4, 0.3, 2 },
        color = { 0, 0, 0 },
        font_color = { 1, 1, 1 },
        width = 300,
        height = 300,
        font_size = 300,
        tooltip = "Get off the road!"
    })
end

function DrawHuntTile(Object, PlayerColor)
    self.clearButtons()

    function DrawHuntTileCoroutine()
        if self.getQuantity() < 1 then
            printToAll("Hunt Pool is empty.")
        else
            printToAll("\nShuffling " .. self.getQuantity() .. " Tiles in the Hunt Pool...")
            self.shuffle()

            printToAll("Drawing a Hunt Tile from the Hunt Pool...")
            self.takeObject({ smooth = true, position = { -37.5, 3, -18 } })
            for D = 1, 10 do coroutine.yield(0) end
            Player[PlayerColor].pingTable({ -37.5, 2, -18 })

            --nazgul scream?
            local Scream = getObjectFromGUID("c35be9").getVar("Scream")
            if Scream == "Always" then
                Global.call("PlaySound", { ID = 8 })
            end
        end

        CreateButtons()
        return 1
    end

    startLuaCoroutine(self, "DrawHuntTileCoroutine")
end

function CreateButtons()
    self.createButton({
        click_function = "DrawHuntTile",
        function_owner = self,
        label = "Draw Tile",
        position = { 0, 0.3, 2 },
        color = { 0, 0, 0 },
        font_color = { 1, 1, 1 },
        width = 1000,
        height = 300,
        font_size = 150,
        tooltip = "Shuffle the bag and draw a hunt tile."
    })

    self.createButton({
        click_function = "GetOffTheRoad",
        function_owner = self,
        label = ">",
        position = { 1.4, 0.3, 2 },
        color = { 0, 0, 0 },
        font_color = { 1, 1, 1 },
        width = 300,
        height = 300,
        font_size = 300,
        tooltip = "Get off the road!"
    })
end

function GetOffTheRoad()
    Global.call("PlaySound", { ID = 37 })
end
