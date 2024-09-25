Side = "Shadow"
DeckID = ""

function onLoad()
    self.clearButtons()
    self.createButton({ click_function = "Nothing", function_owner = self, label = "Call to\nBattle\nCards", position = { 0, 0.3, -0.9 }, width = 0, height = 0, font_size = 250, font_color = { 1, 1, 1, 0.5 } })
    self.createButton({ click_function = "AddToHand", function_owner = self, label = "Add to Hand", position = { 0, 0.3, 0.7 }, width = 900, height = 300, color = { 1, 1, 1, 0.7 }, font_size = 125 })
    self.createButton({ click_function = "ReturnCards", function_owner = self, label = "Return Cards", position = { 0, 0.3, 1.7 }, width = 900, height = 300, color = { 1, 1, 1, 0.7 }, font_size = 125 })
end

function AddToHand(Obj, Color)
    if Color == "Red" or Color == "Yellow" then
        function AddToHandCoroutine()
            --detect the deck id
            DeckID = GetDeckID()
            if DeckID == nil then
                return 1
            end
            local DeckCount = getObjectFromGUID(DeckID).getQuantity()
            local HandCount = #Player[Color].getHandObjects()
            --deal the cards
            getObjectFromGUID(DeckID).deal(DeckCount, Color)
            repeat
                coroutine.yield(0)
            until #Player[Color].getHandObjects() >= DeckCount + HandCount
            for X = 1, 20 do coroutine.yield(0) end
            Global.call("ShuffleHand", { player = Color })
            --always return 1
            return 1
        end

        startLuaCoroutine(self, "AddToHandCoroutine")
    else
        printToColor("Not your hand.", Color)
    end
end

function ReturnCards(Obj, Color)
    if Color == "Red" or Color == "Yellow" then
        function ReturnCardsCoroutine()
            --search cards
            local HandID = "822861" --assume red
            if Color == "Yellow" then HandID = "71d77a" end
            for _, Obj in pairs(getObjectFromGUID(HandID).getObjects()) do
                if Obj.type == "Card" then
                    if string.find(Obj.getDescription(), "Card;CallToBattle;") ~= nil and string.find(Obj.getDescription(), Side) ~= nil then
                        Obj.setPosition(self.getPosition())
                        Obj.setRotation({ 0, self.getRotation().y, 180 })
                        --coroutine.yield(0)
                        Obj.setPositionSmooth({ self.getPosition().x, self.getPosition().y + 0.2, self.getPosition().z },
                            false, true)
                    end
                end
            end
            for X = 1, 10 do coroutine.yield(0) end
            --wait for deck to form
            repeat
                DeckID = GetDeckID()
                coroutine.yield(0)
            until DeckID ~= nil
            return 1
        end

        startLuaCoroutine(self, "ReturnCardsCoroutine")
    else
        printToColor("Not your hand.", Color)
    end
end

function GetDeckID()
    local IDs = Global.call("GetIDs")

    --detect the deck id
    for _, Obj in pairs(Physics.cast({ origin = self.getPosition(), direction = { 0, 1, 0 }, type = 2, size = { 1, 1, 1 }, orientation = { 0, 0, 0 }, max_distance = 0, debug = false })) do
        if Obj.hit_object.tag == "Deck" then
            Obj.hit_object.setName(Side .. " Call to Battle Cards (WoME)")
            Obj.hit_object.setDescription("Deck;CallToBattle;" .. Side .. ";WoME;")
            IDs.WoME[Side .. "CallToBattleDeck"] = Obj.hit_object.getGUID()
            return Obj.hit_object.getGUID()
        end
    end
end
