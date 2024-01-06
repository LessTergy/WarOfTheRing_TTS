GamePanelID = "6158a0"
BrandID = "3d983d"
DainID = "554922"
DenethorID = "79b781"
TheodenID = "51d8e0"
ThranduilID = "b6ec8b"
HuntPoolID = "002387"

BrandStatus = ""
DainStatus = ""
DenethorStatus = ""
TheodenStatus = ""
ThranduilStatus = ""

function onLoad(save_state)
    GamePanelID = Global.getVar("GamePanelID")
    RefreshPanel()
end--function
    
function RefreshPanel()
    self.clearButtons()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    BrandID = IDs.Companions.Brand
    DainID = IDs.Companions.Dain
    DenethorID = IDs.Companions.Denethor
    TheodenID = IDs.Companions.Theoden
    ThranduilID = IDs.Companions.Thranduil
    HuntPoolID = IDs.HuntTileBag
    if getObjectFromGUID(BrandID) ~= nil then
        if getObjectFromGUID(BrandID).getName() == "Brand: King of Dale (Awakened)" then
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Awakened",position={-0.15,0.2,-0.69},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={1,1,1}})
        elseif getObjectFromGUID(BrandID).getName() == "Brand: Corrupted Ruler" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Corrupted",position={-0.15,0.2,-0.53},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={0,0,0}})
        end--if
    end--if
    if getObjectFromGUID(DainID) ~= nil then
        if getObjectFromGUID(DainID).getName() == "Dain: King Under the Mountain (Awakened)" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Awakened",position={-0.15,0.2,-0.37},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={1,1,1}})
        elseif getObjectFromGUID(DainID).getName() == "Dain: Corrupted Ruler" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Corrupted",position={-0.15,0.2,-0.19},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={0,0,0}})
        end--if
    end--if
    if getObjectFromGUID(DenethorID) ~= nil then
        if getObjectFromGUID(DenethorID).getName() == "Denethor: Lord Steward of Gondor (Awakened)" then  
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Awakened",position={-0.15,0.2,-0.02},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={1,1,1}})
        elseif getObjectFromGUID(DenethorID).getName() == "Denethor: Corrupted Ruler" then          
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Corrupted",position={-0.15,0.2,0.13},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={0,0,0}})
        end--if
    end--if
    if getObjectFromGUID(TheodenID) ~= nil then
        if getObjectFromGUID(TheodenID).getName() == "Theoden: King of the Riddermark (Awakened)" then
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Awakened",position={-0.15,0.2,0.32},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={1,1,1}})
        elseif getObjectFromGUID(TheodenID).getName() == "Theoden: Corrupted Ruler" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Corrupted",position={-0.15,0.2,0.47},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={0,0,0}})
        end--if
    end--if
    if getObjectFromGUID(ThranduilID) ~= nil then
        if getObjectFromGUID(ThranduilID).getName() == "Thranduil: King of the Woodland Realm (Awakened)" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Awakened",position={-0.15,0.2,0.65},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={1,1,1}})
        elseif getObjectFromGUID(ThranduilID).getName() == "Thranduil: Corrupted Ruler" then            
            self.createButton({click_function="RefreshPanel",function_owner=self,label="Corrupted",position={-0.15,0.2,0.82},scale={0.2,0.2,0.2},width=0,height=0,font_size=150,font_color={0,0,0}})
        end--if
    end--if
    self.createButton({click_function="GrayBrand",function_owner=self,label="",position={-0.45,0.2,-0.48},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0.5,0.5,0.5},tooltip="This Ruler is neither Awake nor Corrupt."})
    self.createButton({click_function="GrayDain",function_owner=self,label="",position={-0.45,0.2,-0.15},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0.5,0.5,0.5},tooltip="This Ruler is neither Awake nor Corrupt."})
    self.createButton({click_function="GrayDenethor",function_owner=self,label="",position={-0.45,0.2,0.2},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0.5,0.5,0.5},tooltip="This Ruler is neither Awake nor Corrupt."})
    self.createButton({click_function="GrayTheoden",function_owner=self,label="",position={-0.45,0.2,0.53},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0.5,0.5,0.5},tooltip="This Ruler is neither Awake nor Corrupt."})
    self.createButton({click_function="GrayThranduil",function_owner=self,label="",position={-0.45,0.2,0.87},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0.5,0.5,0.5},tooltip="This Ruler is neither Awake nor Corrupt."})
    self.createButton({click_function="WhiteBrand",function_owner=self,label="",position={-0.55,0.2,-0.48},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={1,1,1},tooltip="Awaken this Ruler."})
    self.createButton({click_function="WhiteDain",function_owner=self,label="",position={-0.55,0.2,-0.15},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={1,1,1},tooltip="Awaken this Ruler."})
    self.createButton({click_function="WhiteDenethor",function_owner=self,label="",position={-0.55,0.2,0.2},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={1,1,1},tooltip="Awaken this Ruler."})
    self.createButton({click_function="WhiteTheoden",function_owner=self,label="",position={-0.55,0.2,0.53},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={1,1,1},tooltip="Awaken this Ruler."})
    self.createButton({click_function="WhiteThranduil",function_owner=self,label="",position={-0.55,0.2,0.87},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={1,1,1},tooltip="Awaken this Ruler."})
    self.createButton({click_function="BlackBrand",function_owner=self,label="",position={-0.35,0.2,-0.48},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0,0,0},tooltip="Corrupt this Ruler."})
    self.createButton({click_function="BlackDain",function_owner=self,label="",position={-0.35,0.2,-0.15},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0,0,0},tooltip="Corrupt this Ruler."})
    self.createButton({click_function="BlackDenethor",function_owner=self,label="",position={-0.35,0.2,0.2},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0,0,0},tooltip="Corrupt this Ruler."})
    self.createButton({click_function="BlackTheoden",function_owner=self,label="",position={-0.35,0.2,0.53},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0,0,0},tooltip="Corrupt this Ruler."})
    self.createButton({click_function="BlackThranduil",function_owner=self,label="",position={-0.35,0.2,0.87},scale={0.1,0.1,0.1},width=400,height=400,font_size=100,color={0,0,0},tooltip="Corrupt this Ruler."})
    --draw tile button... 
    self.createButton({click_function="DrawTileCorruption",function_owner=self,label="Draw Tile",position={-0.48,0,1.08},scale={0.2,0.2,0.2},width=1000,height=300,font_size=150,color={0,0,0},font_color={1,1,0},tooltip="Draw a Tile face down and attempt to to corrupt a Sovereign."})
end--funtion 

function DrawTileCorruption(Object,PlayerColor)
    function DrawTileCorruptionCoroutine()
        local HuntPool = getObjectFromGUID(HuntPoolID)
        if HuntPool ~= nil then
            --any tiles left?
            if HuntPool.getQuantity() < 1 then
                printToAll("Hunt Pool is empty.")
            else--draw a tile... 
                --shuffle the hunt pool...
                printToAll("\nShuffling "..HuntPool.getQuantity().." Tiles in the Hunt Pool...")
                HuntPool.shuffle()
                coroutine.yield(0)
                printToAll("Drawing a face down Hunt Tile from the Hunt Pool...")
                local NextSpot = {-50,1.03,-21}
                for X=1,3 do 
                    local Free = true   --spot is free?
                    for O,Obj in pairs(Physics.cast({origin={NextSpot[1]+(X-1)*2,NextSpot[2],NextSpot[3]},direction={0,1,0},type=3,size={1,1,1},orientation={0,0,0},max_distance=0,debug=false})) do
                        if Obj.hit_object.getName() == "Hunt Tile" or Obj.hit_object.getName() == "Sméagol Hunt Tile" then
                            Free = false
                            break
                        end--if
                    end--for O,Obj
                    if Free then 
                        NextSpot = {NextSpot[1]+(X-1)*2,NextSpot[2],NextSpot[3]}
                        break
                    end--if
                end--for X
                local HuntTile = HuntPool.takeObject()
                HuntTile.setRotation({0,180,180})
                HuntTile.setPositionSmooth({NextSpot[1],NextSpot[2]+0.5,NextSpot[3]},false,true)
                coroutine.yield(0)
            end--if
        else
            print("Uhoh! Could not find the Hunt Pool (ID:",HuntPoolID,")")
        end--if
        return 1
    end--function 
    startLuaCoroutine(self,"DrawTileCorruptionCoroutine")
end--function 

function GrayBrand()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    BrandID = IDs.Companions.Brand
    if getObjectFromGUID(BrandID) ~= nil then
        getObjectFromGUID(BrandID).setName("Brand: King of Dale")
        if string.find(getObjectFromGUID(BrandID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(BrandID).setColorTint({0.75,0.75,0.75})
        else
            getObjectFromGUID(BrandID).setColorTint({0.5,0.5,0.5})
        end--if
        RefreshPanel()
    end--if
end--function 

function GrayDain()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DainID = IDs.Companions.Dain
    if getObjectFromGUID(DainID) ~= nil then
        getObjectFromGUID(DainID).setName("Dain: King Under the Mountain")
        if string.find(getObjectFromGUID(DainID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(DainID).setColorTint({0.75,0.75,0.75})
        else
            getObjectFromGUID(DainID).setColorTint({0.5,0.5,0.5})
        end--if
        RefreshPanel()
    end--if
end--function 

function GrayDenethor()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DenethorID = IDs.Companions.Denethor
    if getObjectFromGUID(DenethorID) ~= nil then
        getObjectFromGUID(DenethorID).setName("Denethor: Lord Steward of Gondor")
        if string.find(getObjectFromGUID(DenethorID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(DenethorID).setColorTint({0.75,0.75,0.75})
        else
            getObjectFromGUID(DenethorID).setColorTint({0.5,0.5,0.5})
        end--if
        RefreshPanel()
    end--if
end--function 

function GrayTheoden()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    TheodenID = IDs.Companions.Theoden
    if getObjectFromGUID(TheodenID) ~= nil then
        getObjectFromGUID(TheodenID).setName("Theoden: King of the Riddermark")
        if string.find(getObjectFromGUID(TheodenID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(TheodenID).setColorTint({0.75,0.75,0.75})
        else
            getObjectFromGUID(TheodenID).setColorTint({0.5,0.5,0.5})
        end--if
        RefreshPanel()
    end--if
end--function 

function GrayThranduil()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    ThranduilID = IDs.Companions.Thranduil
    if getObjectFromGUID(ThranduilID) ~= nil then
        getObjectFromGUID(ThranduilID).setName("Thranduil: King of the Woodland Realm")
        if string.find(getObjectFromGUID(ThranduilID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(ThranduilID).setColorTint({0.75,0.75,0.75})
        else
            getObjectFromGUID(ThranduilID).setColorTint({0.5,0.5,0.5})
        end--if
        RefreshPanel()
    end--if
end--function 

function WhiteBrand()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    BrandID = IDs.Companions.Brand
    if getObjectFromGUID(BrandID) ~= nil then
        getObjectFromGUID(BrandID).setName("Brand: King of Dale (Awakened)")
        getObjectFromGUID(BrandID).setColorTint({1,1,1})
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(42)
    RefreshPanel()
    end--if
end--function 

function WhiteDain()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DainID = IDs.Companions.Dain
    if getObjectFromGUID(DainID) ~= nil then
        getObjectFromGUID(DainID).setName("Dain: King Under the Mountain (Awakened)")
        getObjectFromGUID(DainID).setColorTint({1,1,1})
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(44)
        RefreshPanel()
    end--if
end--function 

function WhiteDenethor()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DenethorID = IDs.Companions.Denethor
    if getObjectFromGUID(DenethorID) ~= nil then
        getObjectFromGUID(DenethorID).setName("Denethor: Lord Steward of Gondor (Awakened)")
        getObjectFromGUID(DenethorID).setColorTint({1,1,1})
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(46)
        RefreshPanel()
    end--if
end--function 

function WhiteTheoden()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    TheodenID = IDs.Companions.Theoden
    if getObjectFromGUID(TheodenID) ~= nil then
        getObjectFromGUID(TheodenID).setName("Theoden: King of the Riddermark (Awakened)")
        getObjectFromGUID(TheodenID).setColorTint({1,1,1})
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(48)
        RefreshPanel()
    end--if
end--function 

function WhiteThranduil()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    ThranduilID = IDs.Companions.Thranduil
    if getObjectFromGUID(ThranduilID) ~= nil then
        getObjectFromGUID(ThranduilID).setName("Thranduil: King of the Woodland Realm (Awakened)")
        getObjectFromGUID(ThranduilID).setColorTint({1,1,1})
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(50)
        RefreshPanel()
    end--if
end--function 

    
function BlackBrand()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    BrandID = IDs.Companions.Brand
    if getObjectFromGUID(BrandID) ~= nil then
        getObjectFromGUID(BrandID).setName("Brand: Corrupted Ruler")
        if string.find(getObjectFromGUID(BrandID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(BrandID).setColorTint({0.25,0.25,0.25})
        else
            getObjectFromGUID(BrandID).setColorTint({0,0,0})
        end--if
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(43)
    RefreshPanel()
    end--if
end--function 

function BlackDain()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DainID = IDs.Companions.Dain
    if getObjectFromGUID(DainID) ~= nil then
        getObjectFromGUID(DainID).setName("Dain: Corrupted Ruler")
        if string.find(getObjectFromGUID(DainID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(DainID).setColorTint({0.25,0.25,0.25})
        else
            getObjectFromGUID(DainID).setColorTint({0,0,0})
        end--if
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(45)
        RefreshPanel()
    end--if
end--function 

function BlackDenethor()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    DenethorID = IDs.Companions.Denethor
    if getObjectFromGUID(DenethorID) ~= nil then
        getObjectFromGUID(DenethorID).setName("Denethor: Corrupted Ruler")
        if string.find(getObjectFromGUID(DenethorID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(DenethorID).setColorTint({0.25,0.25,0.25})
        else
            getObjectFromGUID(DenethorID).setColorTint({0,0,0})
        end--if
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(47)
        RefreshPanel()
    end--if
end--function 

function BlackTheoden()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    TheodenID = IDs.Companions.Theoden
    if getObjectFromGUID(TheodenID) ~= nil then
        getObjectFromGUID(TheodenID).setName("Theoden: Corrupted Ruler")
        if string.find(getObjectFromGUID(TheodenID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(TheodenID).setColorTint({0.25,0.25,0.25})
        else
            getObjectFromGUID(TheodenID).setColorTint({0,0,0})
        end--if
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(49)
        RefreshPanel()
    end--if
end--function 

function BlackThranduil()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    ThranduilID = IDs.Companions.Thranduil
    if getObjectFromGUID(ThranduilID) ~= nil then
        getObjectFromGUID(ThranduilID).setName("Thranduil: Corrupted Ruler")
        if string.find(getObjectFromGUID(ThranduilID).getDescription(),"Marble;") ~= nil then
            getObjectFromGUID(ThranduilID).setColorTint({0.25,0.25,0.25})
        else
            getObjectFromGUID(ThranduilID).setColorTint({0,0,0})
        end--if
        getObjectFromGUID("74cc15").AssetBundle.playTriggerEffect(51)
        RefreshPanel()
    end--if
end--function 
