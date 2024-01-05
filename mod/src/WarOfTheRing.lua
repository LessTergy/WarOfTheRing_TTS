-- Bundled by luabundle {"rootModuleName":"Global.-1.lua","version":"1.6.0"}
local __bundle_require, __bundle_loaded, __bundle_register, __bundle_modules = (function(superRequire)
	local loadingPlaceholder = {[{}] = true}

	local register
	local modules = {}

	local require
	local loaded = {}

	register = function(name, body)
		if not modules[name] then
			modules[name] = body
		end
	end

	require = function(name)
		local loadedModule = loaded[name]

		if loadedModule then
			if loadedModule == loadingPlaceholder then
				return nil
			end
		else
			if not modules[name] then
				if not superRequire then
					local identifier = type(name) == 'string' and '\"' .. name .. '\"' or tostring(name)
					error('Tried to require ' .. identifier .. ', but no such module has been registered')
				else
					return superRequire(name)
				end
			end

			loaded[name] = loadingPlaceholder
			loadedModule = modules[name](require, loaded, register, modules)
			loaded[name] = loadedModule
		end

		return loadedModule
	end

	return require, loaded, register, modules
end)(nil)
__bundle_register("Global.-1.lua", function(require, _LOADED, __bundle_register, __bundle_modules)
require("WarOfTheRing")
end)
__bundle_register("WarOfTheRing", function(require, _LOADED, __bundle_register, __bundle_modules)
HuntBoxZoneID = "b06145"
-- old:"077148"
GamePanelID = "6158a0"
SoundCubeID = "74cc15"
TFoERegionOverlayID = "d5aeaa"
TFoEStrongholdOverlayID = "7d50c0"
TFoECity1OverLayID = "c537fa"
TFoECity2OverlayID = "2df5ce"
FellowshipRedZoneID = "458285"
FellowshipYellowZoneID = "652513"
-- Turn info
Round = 0
Turn = 0 -- count of turns
Phase = 0 -- tracks phase of the turn (1-6)
Mute = false -- mute sound?
Guide = ""
GuideLevel = 0
SearchingFellowship = false
CompactMode = false
LoME = false
WoME = false
BotF = false
TFoE = false
KoME = false
Scripting = true
-- boardsize
BoardX = 36.5
BoardZ = 25.0
-- victorypoints...
VictoryPoints = {Shadow = 0, FreePeoples = 0}
-- dice table...
Dice = {
    Action = {
        -- Type
        Shadow = {
            -- Side
            Rolling = false,
            RollingTable = {}, -- list of combat dice actively rolling.
            RolledTable = {}, -- list of combat dice finished rolling.
            ResultTable = {}, -- table of roll results.
            ResultText = ""
        },
        -- Shadow
        FreePeoples = {
            -- Player
            Rolling = false,
            RollingTable = {}, -- list of combat dice actively rolling.
            RolledTable = {}, -- list of combat dice finished rolling.
            ResultTable = {}, -- table of roll results.
            ResultText = ""
        }
        -- FreePeoples
    },
    Stats = {
        Combat = {
            FreePeoples = {RollCount = 0, Results = {0, 0, 0, 0, 0, 0}},
            Shadow = {RollCount = 0, Results = {0, 0, 0, 0, 0, 0}}
        },
        -- Combat
        Action = {
            Shadow = {RollCount = 0, Results = {}},
            -- {Face="",Count=0}
            FreePeoples = {RollCount = 0, Results = {}}
            -- {Face="",Count=0}
        }
        -- Action
    }
    -- Stats
}
-- Dice
Nations = {"Dwarves", "Elves", "Gondor", "North", "Rohan", "Haradrim", "Isengard", "Sauron"}
PoliticalTrack = {
    -- Political Track Levels: 0=AtWar,1-3=AtPeace (1=closest to war)
    Gondor = {ID = "8ab5c1", Active = false, Level = 2, AtWar = false},
    Rohan = {ID = "f5ca1b", Active = false, Level = 3, AtWar = false},
    North = {ID = "07e059", Active = false, Level = 3, AtWar = false},
    Dwarves = {ID = "a55f2c", Active = false, Level = 3, AtWar = false},
    Elves = {ID = "fc2440", Active = true, Level = 3, AtWar = false},
    Sauron = {ID = "75a065", Active = true, Level = 1, AtWar = false},
    Isengard = {ID = "7f39c1", Active = true, Level = 1, AtWar = false},
    Haradrim = {ID = "52aff9", Active = true, Level = 2, AtWar = false}
}
Regions = {}
Grid = {}
RulesWarnings = true
Spots = {
    Compact = {
        CompanionCards = {
            Separated = {
                {-51.5, 0.98, -33},
                {-56.5, 0.98, -33},
                {-61.5, 0.98, -33},
                {-46.5, 0.98, -45},
                {-51.5, 0.98, -45},
                {-56.5, 0.98, -45},
                {-61.5, 0.98, -45},
                {-66.5, 0.98, -45},
                {-71.5, 0.98, -45}
            },
            Searched = {
                {-52, 6, -25},
                {-47, 6, -25},
                {-42, 6, -25},
                {-37, 6, -25},
                {-32, 6, -25},
                {-27, 6, -25},
                {-22, 6, -25},
                {-57, 6, -25},
                {-62, 6, -25}
            }
        },
        Shadow = {
            UsedDiceArea = {4.3, 0.92, -32.75},
            Caracters = {
                {16.5, 0.97, -33},
                {21.5, 0.97, -33},
                {26.5, 0.97, -33},
                {31.5, 0.97, -33},
                {36.5, 0.97, -33},
                {41.5, 0.97, -33},
                {46.5, 0.97, -33},
                {51.5, 0.97, -33}
            },
            Factions = {},
            Dice = {
                Action = {
                    Rolled = {
                        {0.5, 1.56, -26.6},
                        {2.0, 1.56, -26.6},
                        {3.5, 1.56, -26.6},
                        {5.0, 1.56, -26.6},
                        {6.5, 1.56, -26.6},
                        {8.0, 1.56, -26.6},
                        {9.5, 1.56, -26.6},
                        {11.0, 1.56, -26.6},
                        {12.5, 1.56, -26.6},
                        {14.0, 1.56, -26.6}
                    }
                }
            },
            Decks = {
                CallToBattle = {2.50, 0.95, -45.00}
            }
        },
        FreePeoples = {
            Compact = {
                UsedDiceArea = {-5.1, 0.92, -32.75},
                Characters = {
                    {-16.5, 0.97, -33},
                    {-21.5, 0.97, -33},
                    {-26.5, 0.97, -33},
                    {-31.5, 0.97, -33},
                    {-36.5, 0.97, -33},
                    {-41.5, 0.97, -33}
                },
                Factions = {},
                Dice = {
                    Action = {
                        Rolled = {
                            {-0.5, 1.56, -26.6},
                            {-2.0, 1.56, -26.6},
                            {-3.5, 1.56, -26.6},
                            {-5.0, 1.56, -26.6},
                            {-6.5, 1.56, -26.6},
                            {-8.0, 1.56, -26.6},
                            {-9.5, 1.56, -26.6},
                            {-11.0, 1.56, -26.6},
                            {-12.5, 1.56, -26.6},
                            {-14.0, 1.56, -26.6}
                        }
                    }
                },
                Decks = {
                    CallToBattle = {-3.50, 0.95, -45.00}
                }
            }
        }
    },
    CompanionCards = {
        Separated = {
            {21.5, 0.97, 33},
            {26.5, 0.97, 33},
            {31.5, 0.97, 33},
            {36.5, 0.97, 33},
            {41.5, 0.97, 33},
            {46.5, 0.97, 33},
            {51.5, 0.97, 33},
            {16.5, 0.97, 33},
            {11.5, 0.97, 33}
        },
        Searched = {
            {21.5, 6, 26},
            {26.5, 6, 26},
            {31.5, 6, 26},
            {36.5, 6, 26},
            {41.5, 6, 26},
            {46.5, 6, 26},
            {51.5, 6, 26},
            {16.5, 6, 26},
            {11.5, 6, 26}
        }
    },
    Setup = {
        Character = {
            ["The Ring-bearers"] = {-0.94, 1.01, 15.96},
            ["Gandalf the Grey"] = {27.03, 0.89, 16.25},
            ["Strider"] = {28.35, 1.01, 16.15},
            ["Legolas"] = {26.69, 1.01, 17.23},
            ["Boromir"] = {27.75, 1.01, 17.30},
            ["Gimli"] = {28.75, 1.01, 17.31},
            ["Peregrin"] = {27.24, 1.01, 18.43},
            ["Meriadoc"] = {28.32, 1.01, 18.44},
            ["Aragorn: Heir to Isildur"] = {-8.47, 1.01, 27.51},
            ["Gandalf the White: Emissary from the West"] = {-3.56, 1.01, 27.49},
            ["Gollum"] = {1.50, 1.06, 27.50},
            ["Sméagol"] = {6.50, 1.06, 27.50},
            ["Lord Elrond: Keeper of Vilya"] = {11.46, 1.01, 27.50},
            ["Lady Galadriel: Keeper of Nenya"] = {16.48, 1.05, 27.51},
            ["Treebeard: Tree-herd"] = {-13.44, 1.01, 27.54},
            ["Saruman: Corrupted Wizard"] = {16.48, 1.01, -27.30},
            ["The Witch-King: The Black Captain"] = {21.50, 1.01, -27.17},
            ["The Mouth of Sauron: Lieutenant of Barad~Dur"] = {26.43, 1.01, -27.43},
            ["The Witch-King: Chief of the Ring Wraiths"] = {31.44, 1.01, -27.37},
            ["The Mouth of Sauron: Black Númenórean"] = {36.53, 1.01, -27.30},
            ["Gothmog: Lieutenant of Morgul"] = {41.56, 1.01, -27.45},
            ["Balrog: Evil of the Ancient World"] = {46.50, 1.01, -27.56}
        },
        -- character
        Dwarf = {
            Regular = {
                {-42.82, 1, 13.68},
                {-42.74, 1, 12.23},
                -- reserves
                {-19.33, 0.98, 15.50},
                -- ered luin
                {17.79, 0.98, 17.77},
                -- erebor
                {20.09, 0.98, 18.92}
                -- iron hills
            },
            -- regular
            Elite = {
                {-39.83, 1.00, 13.95},
                {-40.50, 1.00, 12.96},
                {-39.76, 1.00, 11.94},
                -- reserves
                {15.98, 1, 18.94},
                {16.88, 1, 18.17}
                -- erebor
            },
            -- elite
            Leader = {
                {-37.74, 1.00, 13.99},
                {-38.49, 1.00, 12.96},
                {-37.70, 1.00, 11.98},
                -- reserves
                {15.44, 1, 20.15}
                -- erebor
            }
            -- leader
        },
        -- dwarf
        Elf = {
            Regular = {
                {15.44, 1, 20.15},
                {-42.70, 1, 8.19},
                -- reserves
                {-21.84, 0.98, 10.80},
                -- grey havens
                {12.16, 0.98, 17.75},
                -- woodland realm
                {4.70, 0.98, 5.38}
                -- lorien
            },
            -- regular
            Elite = {
                {-39.32, 1.00, 10.00},
                {-39.22, 1.00, 7.98},
                {-37.80, 1.00, 9.99},
                {-37.70, 1.00, 7.96},
                -- reserves
                {-21.62, 1, 9.74},
                -- grey havens
                {0.51, 1, 19.32},
                {1.65, 1, 18.97},
                -- rivendell
                {13.48, 1, 17.75},
                -- woodland realm
                {2.47, 1, 7.54},
                {2.29, 1, 6.37}
                -- lorien
            },
            -- elite
            Leader = {
                {-20.58, 1, 10.56},
                -- grey havens
                {2.06, 1, 17.77},
                -- rivendell
                {12.15, 1.00, 15.71},
                -- woodland realm
                {5.50, 1, 6.36}
                -- lorien
            }
            -- leader
        },
        -- elf
        North = {
            Regular = {
                {-43.01, 1, 6.04},
                {-43.01, 1, 4.90},
                {-43.09, 1, 3.85},
                {-42.12, 1, 6.04},
                {-42.09, 1, 4.89},
                {-42.07, 1, 3.90},
                -- reserves
                {-13.64, 0.98, 12.18},
                -- the shire
                {-7.81, 0.98, 16.68},
                -- bree
                {6.98, 0.98, 19.48},
                -- carrock
                {18.97, 0.98, 14.72}
                -- dale
            },
            -- regular
            Elite = {
                {-41.05, 1.00, 6.07},
                {-40.99, 1.00, 3.91},
                {-39.71, 1.00, 6.08},
                {-39.80, 1.00, 3.95},
                -- reserves
                {-11.61, 1, 18.37}
                -- north downs
            },
            -- elite
            Leader = {
                {-37.67, 1.00, 5.91},
                {-38.58, 1.00, 4.98},
                {-37.76, 1.00, 4.00},
                -- reserves
                {19.14, 1, 15.84}
                -- dale
            }
            -- leader
        },
        -- north
        Rohan = {
            Regular = {
                {-43.28, 1.00, 1.92},
                {-43.28, 1.00, 0.92},
                {-43.28, 1.00, -0.08},
                {-42.37, 1.00, 1.93},
                {-42.39, 1.00, 0.92},
                {-42.39, 1.00, -0.13},
                -- reserves
                {-1.68, 1, -4.28},
                {-0.87, 1, -4.07},
                -- fords of isen
                {1.34, 1, -5.12},
                -- helm's deep
                {5.76, 1, -5.15}
                -- edoras
            },
            -- regular
            Elite = {
                {-41.16, 1.00, 1.85},
                {-39.93, 1.00, 1.93},
                {-40.95, 1.00, 0.08},
                {-39.74, 1.00, 0.11},
                -- reserves
                {4.18, 1, -6.35}
                -- edoras
            },
            -- elite
            Leader = {
                {-37.83, 1.00, 1.91},
                {-38.80, 1.00, 0.90},
                {-37.78, 1.00, -0.03},
                -- reserves
                {-4.63, 1, -4.65}
                -- fords of isen
            }
            -- leader
        },
        -- rohan
        Gondor = {
            Regular = {
                {-43.24, 1.00, -2.05},
                {-43.24, 1.00, -3.05},
                {-43.24, 1.00, -4.05},
                {-42.34, 1.00, -2.05},
                {-42.34, 1.00, -3.05},
                {-42.34, 1.00, -4.05},
                -- reserves
                {1.85, 1, -15.81},
                {2.73, 1, -15.87},
                {3.72, 1, -15.85},
                -- dol amroth
                {9.77, 1, -15.74},
                -- pelargir
                {14.26, 1, -12.00},
                {13.84, 1, -12.82},
                -- osgiliath
                {11.24, 1, -11.69},
                {12.05, 1, -11.67},
                {12.87, 1, -11.82}
                -- minas tirith
            },
            -- regular
            Elite = {
                {-41.24, 1.00, -2.06},
                {-41.29, 1.00, -4.01},
                {-39.97, 1.00, -2.03},
                {-40.08, 1.00, -3.99},
                -- reserves
                {13.28, 1, -8.78}
                -- minas tirith
            },
            -- elite
            Leader = {
                {-37.86, 1.00, -2.10},
                {-38.87, 1.00, -3.04},
                {-37.79, 1.00, -4.00},
                -- reserves
                {12.16, 1, -8.07}
                -- minas tirith
            }
            -- leader
        },
        -- gondor
        Isengard = {
            Regular = {
                {42.00, 1, 6.00},
                {43.00, 1, 6.00},
                {42.00, 1, 4.00},
                {43.00, 1, 4.00},
                {42.00, 1, 2.00},
                {43.00, 1, 2.00},
                -- reserves
                {-4.19, 0.98, 6.06},
                -- north dunland
                {-4.87, 0.98, 2.83},
                -- south dunland
                {-4.00, 0.98, -0.94},
                {-4.04, 0.98, -1.73},
                {-4.11, 0.98, -2.57},
                {-3.46, 0.98, -3.17}
                -- orthanc
            },
            -- regular
            Elite = {
                {37.50, 1.00, 6.00},
                {38.50, 1.00, 5.00},
                {37.50, 1.00, 4.00},
                {38.50, 1.00, 3.00},
                {37.50, 1.00, 2.00},
                -- reserves
                {-1.38, 0.99, -2.82}
                -- orthanc
            }
            -- elite
        },
        -- isengard
        Haradrim = {
            Regular = {
                {42.00, 1, 0.00},
                {43.00, 1, 0.00},
                {42.00, 1, -1.00},
                {43.00, 1, -1.00},
                {42.00, 1, -2.00},
                {43.00, 1, -2.00},
                {42.00, 1, -3.00},
                {43.00, 1, -3.00},
                {42.00, 1, -4.00},
                {43.00, 1, -4.00},
                -- reserves
                {25.19, 0.98, 9.95},
                {26.13, 0.98, 9.95},
                -- north rhun
                {29.30, 0.98, 5.03},
                {29.35, 0.98, 4.24},
                {29.37, 0.98, 3.37},
                -- south rhun
                {6.68, 0.98, -23.96},
                {7.65, 0.98, -23.92},
                {8.70, 0.98, -23.87},
                -- umbar
                {14.36, 0.98, -22.16},
                {15.16, 0.98, -21.93},
                {15.94, 0.98, -21.66},
                -- near harad
                {20.02, 0.98, -21.32},
                {20.54, 0.98, -20.53},
                {20.96, 0.98, -21.35}
                -- far harad
            },
            -- regular
            Elite = {
                {38.00, 0.99, 0.00},
                {38.00, 0.99, -2.00},
                {37.97, 0.99, -3.84},
                -- reserves
                {20.96, 0.98, -21.35},
                -- south rhun
                {13.43, 0.98, -22.74},
                -- near harad
                {21.17, 0.98, -19.62}
                -- far harad
            }
            -- elite
        },
        -- haradrim
        Sauron = {
            Regular = {
                {42.88, 1.00, -5.52},
                {41.88, 1.00, -6.02},
                {42.88, 1.00, -6.52},
                {42.88, 1.00, -7.52},
                {42.88, 1.00, -8.52},
                {42.88, 1.00, -9.51},
                {41.88, 1.00, -10.01},
                {42.88, 1.00, -10.51},
                -- reserves
                {-2.49, 0.99, 23.25},
                {-2.55, 0.99, 22.44},
                -- mount gundabad
                {0.37, 0.99, 10.63},
                {0.47, 0.99, 9.84},
                -- moria
                {9.32, 0.99, 5.46},
                {9.95, 0.99, 4.95},
                {10.71, 0.99, 4.73},
                {11.49, 0.99, 4.57},
                {12.28, 0.99, 4.65},
                -- dol guldur
                {19.99, 0.99, -15.46},
                {20.85, 0.99, -15.50},
                -- nurn
                {21.64, 0.99, -13.40},
                {22.89, 0.99, -13.47},
                {24.16, 0.99, -13.26},
                -- gorgoroth
                {18.63, 0.99, -10.06},
                {18.72, 0.99, -10.93},
                {20.10, 0.99, -11.68},
                {21.39, 0.99, -10.45},
                {21.39, 0.99, -10.45},
                -- minas morgul
                {22.97, 0.99, -4.96},
                {22.18, 0.99, -5.22},
                {21.80, 0.99, -6.13},
                {22.60, 0.99, -6.07},
                {22.06, 0.99, -6.95},
                -- morannon
                {25.01, 0.99, -5.01},
                {27.93, 0.99, -4.50},
                {27.77, 0.99, -5.71},
                {28.04, 0.99, -6.64}
                -- barad~dur
            },
            -- regular
            Elite = {
                {37.50, 1.00, -5.80},
                {37.50, 1.00, -7.30},
                {37.50, 1.00, -8.75},
                {37.50, 1.00, -10.20},
                -- reserves
                {9.73, 0.99, 6.46},
                -- dol guldur
                {24.77, 0.99, -6.01}
                -- barad~dur
            },
            -- elite
            Nazgul = {
                {37.57, 1.00, -11.96},
                {38.94, 1.00, -12.04},
                {37.57, 1.00, -13.98},
                {38.90, 1.00, -14.05},
                -- reserves
                {26.78, 1.00, -6.01},
                -- barad~dur
                {19.06, 0.99, -4.48},
                -- morannon
                {19.37, 0.99, -9.06},
                -- minas morgul
                {10.97, 0.99, 8.24}
                -- dol guldur
            }
            -- nazgul
        }
        -- mordor
    }
    -- setup
}
-- Spots

function onload()
    if getObjectFromGUID(GamePanelID) == nil then
        Scripting = false
    end

    InitMap()
    -- startLuaCoroutine(Global,"Test1CR")
    FreezeObjects()
    -- RedActionDice = {"70881c","6c2954","47a70c","7910fe","31cd52","a4ad18","cf8525","5048cd","119c78","96404d"}
    -- -RedDiceHuntBoxSpots = {{ID="",Spot={-30.85,1.56,-18.30}},{ID="",Spot={-29.475,1.56,-18.30}},{ID="",Spot={-28.10,1.56,-18.30}},{ID="",Spot={-30.85,1.56,-19.8}},{ID="",Spot={-29.475,1.56,-19.8}},{ID="",Spot={-28.10,1.56,-19.8}},{ID="",Spot={-30.85,1.56,-21.3}},{ID="",Spot={-29.475,1.56,-21.3}},{ID="",Spot={-28.10,1.56,-21.3}},{ID="",Spot={-30.85,1.56,-22.8}},{ID="",Spot={-29.475,1.56,-22.8}},{ID="",Spot={-28.10,1.56,-22.8}}}
    -- -BlueDiceHuntBoxSpots = {{ID="",Spot={-34.85,1.56,-18.30}},{ID="",Spot={-33.475,1.56,-18.30}},{ID="",Spot={-32.10,1.56,-18.30}},{ID="",Spot={-34.85,1.56,-19.8}},{ID="",Spot={-33.475,1.56,-19.8}},{ID="",Spot={-32.10,1.56,-19.8}},{ID="",Spot={-34.85,1.56,-21.3}},{ID="",Spot={-33.475,1.56,-21.3}},{ID="",Spot={-32.10,1.56,-21.3}},{ID="",Spot={-34.85,1.56,-22.8}},{ID="",Spot={-33.475,1.56,-22.8}},{ID="",Spot={-32.10,1.56,-22.8}}}
    getObjectFromGUID(FellowshipRedZoneID).setPosition({36.5, -2, 26.5})
    getObjectFromGUID(FellowshipRedZoneID).setScale({35, 1, 1})
    getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.35, -2, 26.5})
    getObjectFromGUID(FellowshipYellowZoneID).setScale({35, 1, 1})
end

function InitComponents()
    -- look for all known game components and upate their IDs...
    log("Initializing Components...")
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    for O, Obj in pairs(getAllObjects()) do
        if Obj.type == "Card" then
            -- ignore cards.
            -- DICE
        elseif Obj.getName() == "Shadow Action Dice" then
            if string.find(Obj.getDescription(), "1of10;") ~= nil then
                IDs.ShadowActionDice[1] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "2of10;") ~= nil then
                IDs.ShadowActionDice[2] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "3of10;") ~= nil then
                IDs.ShadowActionDice[3] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "4of10;") ~= nil then
                IDs.ShadowActionDice[4] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "5of10;") ~= nil then
                IDs.ShadowActionDice[5] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "6of10;") ~= nil then
                IDs.ShadowActionDice[6] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "7of10;") ~= nil then
                IDs.ShadowActionDice[7] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "8of10;") ~= nil then
                IDs.ShadowActionDice[8] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "9of10;") ~= nil then
                IDs.ShadowActionDice[9] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "10of10;") ~= nil then
                IDs.ShadowActionDice[10] = Obj.getGUID()
            end
        elseif Obj.getName() == "(Gothmog Die)" then
            IDs.GothmogDice = Obj.getGUID()
        elseif Obj.getName() == "(Balrog Die)" then
            IDs.BalrogDice = Obj.getGUID()
        elseif Obj.getName() == "(Shadow Faction Die)" then
            IDs.ShadowFactionDice = Obj.getGUID()
        elseif Obj.getName() == "(Free Peoples Action Die)" then
            if string.find(Obj.getDescription(), "1of6;") ~= nil then
                IDs.FreePeoplesActionDice[1] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "2of6;") ~= nil then
                IDs.FreePeoplesActionDice[2] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "3of6;") ~= nil then
                IDs.FreePeoplesActionDice[3] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "4of6;") ~= nil then
                IDs.FreePeoplesActionDice[4] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "5of6;") ~= nil then
                IDs.FreePeoplesActionDice[5] = Obj.getGUID()
            elseif string.find(Obj.getDescription(), "6of6;") ~= nil then
                IDs.FreePeoplesActionDice[6] = Obj.getGUID()
            end
        elseif Obj.getName() == "(Narya Action Die)" then
            IDs.NaryaDice = Obj.getGUID()
        elseif Obj.getName() == "(Vilya Action Die)" then
            IDs.VilyaDice = Obj.getGUID()
        elseif Obj.getName() == "(Nenya Action Die)" then
            IDs.NenyaDice = Obj.getGUID()
        elseif Obj.getName() == "(Free Peoples Faction Die)" then
            IDs.FreePeoplesFactionDice = Obj.getGUID()
        elseif Obj.getName() == "(Free Peoples Ruler Die)" then
            IDs.FreePeoplesRulerDice = Obj.getGUID()
        elseif Obj.getName() == "(Shadow Ruler Die)" then
            -- COMPANIONS
            IDs.ShadowRulerDice = Obj.getGUID()
        elseif Obj.getName() == "The Ring-bearers" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.TheRingBearers = Obj.getGUID()
        elseif
            Obj.getName() == "Gandalf the White: Emissary from the West" and
                string.find(Obj.getDescription(), "Character;") ~= nil and
                string.find(Obj.getDescription(), "Token;") == nil
         then
            IDs.Companions.GandalfTheWhite = Obj.getGUID()
        elseif
            Obj.getName() == "Gandalf the White: Emissary from the West" and
                string.find(Obj.getDescription(), "Character;Token;") ~= nil
         then
            IDs.Companions.GandalfTheWhiteToken = Obj.getGUID()
        elseif
            Obj.getName() == "Aragorn: Heir to Isildur" and string.find(Obj.getDescription(), "Character;") ~= nil and
                string.find(Obj.getDescription(), "Token;") == nil
         then
            IDs.Companions.Aragorn = Obj.getGUID()
        elseif
            Obj.getName() == "Aragorn: Heir to Isildur" and string.find(Obj.getDescription(), "Character;Token;") ~= nil
         then
            IDs.Companions.AragornToken = Obj.getGUID()
        elseif
            Obj.getName() == "Lady Galadriel: Keeper of Nenya" and
                string.find(Obj.getDescription(), "Character;") ~= nil
         then
            IDs.Companions.LadyGaladriel = Obj.getGUID()
        elseif
            Obj.getName() == "Lord Elrond: Keeper of Vilya" and string.find(Obj.getDescription(), "Character;") ~= nil
         then
            IDs.Companions.LordElrond = Obj.getGUID()
        elseif Obj.getName() == "Gandalf the Grey" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.GandalfTheGrey = Obj.getGUID()
        elseif Obj.getName() == "Strider" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Strider = Obj.getGUID()
        elseif Obj.getName() == "Boromir" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Boromir = Obj.getGUID()
        elseif Obj.getName() == "Legolas" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Legolas = Obj.getGUID()
        elseif Obj.getName() == "Gimli" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Gimli = Obj.getGUID()
        elseif Obj.getName() == "Meriadoc" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Meriadoc = Obj.getGUID()
        elseif Obj.getName() == "Peregrin" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Peregrin = Obj.getGUID()
        elseif Obj.getName() == "Gollum" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Gollum = Obj.getGUID()
        elseif
            Obj.getName() == "Sméagol" and string.find(Obj.getDescription(), "Character;") ~= nil and
                string.find(Obj.getDescription(), "Counter;") == nil
         then
            IDs.Companions.Smeagol = Obj.getGUID()
        elseif Obj.getName() == "Sméagol" and string.find(Obj.getDescription(), "Counter;Companion;") ~= nil then
            IDs.Companions.SmeagolToken = Obj.getGUID()
        elseif Obj.getName() == "Treebeard: Tree-herd" and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.TreeBeard = Obj.getGUID()
        elseif string.find(Obj.getName(), "Brand:") ~= nil and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Brand = Obj.getGUID()
        elseif string.find(Obj.getName(), "Dain:") ~= nil and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Dain = Obj.getGUID()
        elseif string.find(Obj.getName(), "Denethor:") ~= nil and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Denethor = Obj.getGUID()
        elseif string.find(Obj.getName(), "Theoden:") ~= nil and string.find(Obj.getDescription(), "Character;") ~= nil then
            IDs.Companions.Theoden = Obj.getGUID()
        elseif
            string.find(Obj.getName(), "Thranduil:") ~= nil and string.find(Obj.getDescription(), "Character;") ~= nil
         then
            -- MINIONS
            IDs.Companions.Thranduil = Obj.getGUID()
        elseif Obj.getName() == "Saruman: Corrupted Wizard" and string.find(Obj.getDescription(), "Minion;") ~= nil then
            IDs.Companions.Saruman = Obj.getGUID()
        elseif
            Obj.getName() == "The Witch-King: The Black Captain" and string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheWitchKing = Obj.getGUID()
        elseif
            Obj.getName() == "The Mouth of Sauron: Lieutenant of Barad~Dur" and
                string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheMouthOfSauron = Obj.getGUID()
        elseif
            Obj.getName() == "The Witch-King: Chief of the Ring Wraiths" and
                string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheWitchKingCotR = Obj.getGUID()
        elseif
            Obj.getName() == "The Mouth of Sauron: Black Númenórean" and
                string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheMouthOfSauronBN = Obj.getGUID()
        elseif Obj.getName() == "Gothmog: Lieutenant of Morgul" and string.find(Obj.getDescription(), "Minion;") ~= nil then
            IDs.Minions.Gothmog = Obj.getGUID()
        elseif
            Obj.getName() == "Balrog: Evil of the Ancient World" and string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheBalrog = Obj.getGUID()
        elseif
            Obj.getName() == "The Black Serpent: Chieftain of the Haradrim" and
                string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheBlackSerpent = Obj.getGUID()
        elseif
            Obj.getName() == "The Shadow of Mirkwood: Chieftain of the Dark Lord" and
                string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.TheShadowOfMirkwood = Obj.getGUID()
        elseif
            Obj.getName() == "Ugluk: Chieftain of the Uruk-Hai" and string.find(Obj.getDescription(), "Minion;") ~= nil
         then
            IDs.Minions.Ugluk = Obj.getGUID()
        end
    end

    getObjectFromGUID(GamePanelID).setTable("IDs", IDs)
end

function InitMap()
    Regions["Andrast"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Anfalas"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Angmar"] = {
        Nation = "Sauron",
        Points = 1,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Arnor"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Ash Mountains"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Barad~Dur"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 4, E = 1, L = 1}
    }
    Regions["Bree"] = {
        Nation = "North",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Buchland"] = {
        Nation = "North",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Cardolan"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Carrock"] = {
        Nation = "North",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Crack of Doom"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dagorlad"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dale"] = {
        Nation = "North",
        Points = 1,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 1}
    }
    Regions["Dead Marshes"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dimrill Dale"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dol Amroth"] = {
        Nation = "Gondor",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 0, L = 0}
    }
    Regions["Dol Guldur"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 5, E = 1, L = 1}
    }
    Regions["Druadan Forest"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Druwaith Iaur"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Eagles' Eyrie"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["East Harondor"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["East Rhun"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Eastemnet"] = {
        Nation = "Rohan",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Eastern Brown Lands"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Eastern Emyn Muil"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Eastern Mirkwood"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Edoras"] = {
        Nation = "Rohan",
        Points = 1,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 1, L = 0}
    }
    Regions["Enedwaith"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Erebor"] = {
        Nation = "Dwarves",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 2, L = 1}
    }
    Regions["Erech"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Ered Luin"] = {
        Nation = "Dwarves",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Ettenmoors"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Evendim"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Fangorn"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Far Harad"] = {
        Nation = "Southron/Easterling",
        Points = 1,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 1, L = 0}
    }
    Regions["Folde"] = {
        Nation = "Rohan",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Fords of Bruinen"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Fords of Isen"] = {
        Nation = "Rohan",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Fortification",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 1}
    }
    Regions["Forlindon"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Gap of Rohan"] = {
        Nation = "Isengard",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Gladden Fields"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Goblin's Gate"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Gorgoroth"] = {
        Nation = "Sauron",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 0, L = 0}
    }
    Regions["Grey Havens"] = {
        Nation = "Elves",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 1, L = 1}
    }
    Regions["Harlindon"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Helm's Deep"] = {
        Nation = "Rohan",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["High Pass"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Hollin"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Iron Hills"] = {
        Nation = "Dwarves",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Khand"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Lamedon"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Lorien"] = {
        Nation = "Elves",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 2, L = 1}
    }
    Regions["Lossarnach"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Minas Morgul"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 5, E = 0, L = 1}
    }
    Regions["Minas Tirith"] = {
        Nation = "Gondor",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 1, L = 1}
    }
    Regions["Minbiriath"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Morannon"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 5, E = 0, L = 1}
    }
    Regions["Moria"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 0}
    }
    Regions["Mount Doom 1"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Doom 2"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Doom 3"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Doom 4"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Doom 5"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Track",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Gram"] = {
        Nation = "Sauron",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Mount Gundabad"] = {
        Nation = "Sauron",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 0}
    }
    Regions["Narrows of the Forest"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Near Harad"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 1, L = 0}
    }
    Regions["Noman-Lands"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["North Anduin Vale"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["North Downs"] = {
        Nation = "North",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 1, L = 0}
    }
    Regions["North Dunland"] = {
        Nation = "Isengard",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["North Ered Luin"] = {
        Nation = "Dwarves",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["North Ithilien"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["North Rhun"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 0}
    }
    Regions["Northern Dorwinion"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Northern Mirkwood"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Northern Rhovanion"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Nurn"] = {
        Nation = "Sauron",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 0}
    }
    Regions["Old Ford"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Old Forest"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Old Forest Road"] = {
        Nation = "North",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Orthanc"] = {
        Nation = "Isengard",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 4, E = 1, L = 0}
    }
    Regions["Osgiliath"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "Fortification",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 0, L = 0}
    }
    Regions["Parth Celebrant"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Pelargir"] = {
        Nation = "Gondor",
        Points = 1,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Rhosgobel"] = {
        Nation = "North",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Rivendell"] = {
        Nation = "Elves",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 2, L = 1}
    }
    Regions["South Andium Vale"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["South Downs"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["South Dunland"] = {
        Nation = "Isengard",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["South Ered Luin"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["South Ithilien"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["South Rhun"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 1, L = 0}
    }
    Regions["Southern Dorwinion"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Southern Murkwood"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Southern Rhovanion"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Tharbad"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["The Shire"] = {
        Nation = "North",
        Points = 1,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "City",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 0, L = 0}
    }
    Regions["Tower Hills"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Trollshaws"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Umbar"] = {
        Nation = "Southron/Easterling",
        Points = 2,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "Stronghold",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 3, E = 0, L = 0}
    }
    Regions["Vale of the Carnen"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Vale of the Celduin"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Weather Hills"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["West Harondor"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Westemnet"] = {
        Nation = "Rohan",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "Town",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Western Brown Lands"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Western Emyn Muil"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Western Mirkwood"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Withered Heath"] = {
        Nation = "",
        Points = 0,
        Side = "",
        Control = "",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Woodland Realm"] = {
        Nation = "Elves",
        Points = 2,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Region",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 1, E = 1, L = 1}
    }
    Regions["Army 1 Free Peoples"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Army 1 Shadow"] = {
        Nation = "",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Army 2 Free Peoples"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Army 2 Shadow"] = {
        Nation = "",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Army 3 Free Peoples"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Army 3 Shadow"] = {
        Nation = "",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Army",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dol Amroth Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Erebor Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Grey Havens Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Helm's Deep Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Lorien Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Minas Tirith Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Rivendell Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Woodland Realm Stronghold"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Shadow Stronghold 1"] = {
        Nation = "",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Shadow Stronghold 2"] = {
        Nation = "",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Stronghold",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    Regions["Dwarven Reinforcements"] = {
        Nation = "Dwarves",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 3, L = 3}
    }
    Regions["Elven Reinforcements"] = {
        Nation = "Elves",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 2, E = 4, L = 0}
    }
    Regions["Gondor Reinforcements"] = {
        Nation = "Gondor",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 6, E = 4, L = 3}
    }
    Regions["North Reinforcements"] = {
        Nation = "North",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 6, E = 4, L = 3}
    }
    Regions["Rohan Reinforcements"] = {
        Nation = "Rohan",
        Points = 0,
        Side = "FreePeoples",
        Control = "FreePeoples",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 6, E = 4, L = 3}
    }
    Regions["Haradrim Reinforcements"] = {
        Nation = "Southron/Easterling",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 10, E = 3, L = 0}
    }
    Regions["Isengard Reinforcements"] = {
        Nation = "Isengard",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 6, E = 5, L = 0}
    }
    Regions["Nazgul Reinforcements"] = {
        Nation = "Sauron",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 4}
    }
    Regions["Sauron Reinforcements"] = {
        Nation = "Sauron",
        Points = 0,
        Side = "Shadow",
        Control = "Shadow",
        Settlement = "",
        Type = "Reinforcements",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 8, E = 4, L = 0}
    }
    Regions["Fellowship Box"] = {
        Nation = "",
        Points = 0,
        Side = "FreePeoples",
        Control = "",
        Settlement = "",
        Type = "Box",
        Detected = {X = 0, R = 0, E = 0, L = 0},
        Starting = {R = 0, E = 0, L = 0}
    }
    for X = 0, 157 do
        Grid[X] = {}
        for Z = 0, 107 do
            Grid[X][Z] = {}
        end
    end

    Grid[0][23] = "Dwarven Reinforcements"
    Grid[0][24] = "Dwarven Reinforcements"
    Grid[0][25] = "Dwarven Reinforcements"
    Grid[0][26] = "Dwarven Reinforcements"
    Grid[0][27] = "Dwarven Reinforcements"
    Grid[0][28] = "Dwarven Reinforcements"
    Grid[0][29] = "Dwarven Reinforcements"
    Grid[0][31] = "Elven Reinforcements"
    Grid[0][32] = "Elven Reinforcements"
    Grid[0][33] = "Elven Reinforcements"
    Grid[0][34] = "Elven Reinforcements"
    Grid[0][35] = "Elven Reinforcements"
    Grid[0][36] = "Elven Reinforcements"
    Grid[0][37] = "Elven Reinforcements"
    Grid[0][38] = "Elven Reinforcements"
    Grid[0][39] = "North Reinforcements"
    Grid[0][40] = "North Reinforcements"
    Grid[0][41] = "North Reinforcements"
    Grid[0][42] = "North Reinforcements"
    Grid[0][43] = "North Reinforcements"
    Grid[0][44] = "North Reinforcements"
    Grid[0][45] = "North Reinforcements"
    Grid[0][46] = "North Reinforcements"
    Grid[0][48] = "Rohan Reinforcements"
    Grid[0][49] = "Rohan Reinforcements"
    Grid[0][50] = "Rohan Reinforcements"
    Grid[0][51] = "Rohan Reinforcements"
    Grid[0][52] = "Rohan Reinforcements"
    Grid[0][53] = "Rohan Reinforcements"
    Grid[0][54] = "Rohan Reinforcements"
    Grid[0][56] = "Gondor Reinforcements"
    Grid[0][57] = "Gondor Reinforcements"
    Grid[0][58] = "Gondor Reinforcements"
    Grid[0][59] = "Gondor Reinforcements"
    Grid[0][60] = "Gondor Reinforcements"
    Grid[0][61] = "Gondor Reinforcements"
    Grid[0][62] = "Gondor Reinforcements"
    Grid[1][23] = "Dwarven Reinforcements"
    Grid[1][24] = "Dwarven Reinforcements"
    Grid[1][25] = "Dwarven Reinforcements"
    Grid[1][26] = "Dwarven Reinforcements"
    Grid[1][27] = "Dwarven Reinforcements"
    Grid[1][28] = "Dwarven Reinforcements"
    Grid[1][29] = "Dwarven Reinforcements"
    Grid[1][31] = "Elven Reinforcements"
    Grid[1][32] = "Elven Reinforcements"
    Grid[1][33] = "Elven Reinforcements"
    Grid[1][34] = "Elven Reinforcements"
    Grid[1][35] = "Elven Reinforcements"
    Grid[1][36] = "Elven Reinforcements"
    Grid[1][37] = "Elven Reinforcements"
    Grid[1][38] = "Elven Reinforcements"
    Grid[1][39] = "North Reinforcements"
    Grid[1][40] = "North Reinforcements"
    Grid[1][41] = "North Reinforcements"
    Grid[1][42] = "North Reinforcements"
    Grid[1][43] = "North Reinforcements"
    Grid[1][44] = "North Reinforcements"
    Grid[1][45] = "North Reinforcements"
    Grid[1][46] = "North Reinforcements"
    Grid[1][48] = "Rohan Reinforcements"
    Grid[1][49] = "Rohan Reinforcements"
    Grid[1][50] = "Rohan Reinforcements"
    Grid[1][51] = "Rohan Reinforcements"
    Grid[1][52] = "Rohan Reinforcements"
    Grid[1][53] = "Rohan Reinforcements"
    Grid[1][54] = "Rohan Reinforcements"
    Grid[1][56] = "Gondor Reinforcements"
    Grid[1][57] = "Gondor Reinforcements"
    Grid[1][58] = "Gondor Reinforcements"
    Grid[1][59] = "Gondor Reinforcements"
    Grid[1][60] = "Gondor Reinforcements"
    Grid[1][61] = "Gondor Reinforcements"
    Grid[1][62] = "Gondor Reinforcements"
    Grid[2][23] = "Dwarven Reinforcements"
    Grid[2][24] = "Dwarven Reinforcements"
    Grid[2][25] = "Dwarven Reinforcements"
    Grid[2][26] = "Dwarven Reinforcements"
    Grid[2][27] = "Dwarven Reinforcements"
    Grid[2][28] = "Dwarven Reinforcements"
    Grid[2][29] = "Dwarven Reinforcements"
    Grid[2][31] = "Elven Reinforcements"
    Grid[2][32] = "Elven Reinforcements"
    Grid[2][33] = "Elven Reinforcements"
    Grid[2][34] = "Elven Reinforcements"
    Grid[2][35] = "Elven Reinforcements"
    Grid[2][36] = "Elven Reinforcements"
    Grid[2][37] = "Elven Reinforcements"
    Grid[2][38] = "Elven Reinforcements"
    Grid[2][39] = "North Reinforcements"
    Grid[2][40] = "North Reinforcements"
    Grid[2][41] = "North Reinforcements"
    Grid[2][42] = "North Reinforcements"
    Grid[2][43] = "North Reinforcements"
    Grid[2][44] = "North Reinforcements"
    Grid[2][45] = "North Reinforcements"
    Grid[2][46] = "North Reinforcements"
    Grid[2][48] = "Rohan Reinforcements"
    Grid[2][49] = "Rohan Reinforcements"
    Grid[2][50] = "Rohan Reinforcements"
    Grid[2][51] = "Rohan Reinforcements"
    Grid[2][52] = "Rohan Reinforcements"
    Grid[2][53] = "Rohan Reinforcements"
    Grid[2][54] = "Rohan Reinforcements"
    Grid[2][56] = "Gondor Reinforcements"
    Grid[2][57] = "Gondor Reinforcements"
    Grid[2][58] = "Gondor Reinforcements"
    Grid[2][59] = "Gondor Reinforcements"
    Grid[2][60] = "Gondor Reinforcements"
    Grid[2][61] = "Gondor Reinforcements"
    Grid[2][62] = "Gondor Reinforcements"
    Grid[3][23] = "Dwarven Reinforcements"
    Grid[3][24] = "Dwarven Reinforcements"
    Grid[3][25] = "Dwarven Reinforcements"
    Grid[3][26] = "Dwarven Reinforcements"
    Grid[3][27] = "Dwarven Reinforcements"
    Grid[3][28] = "Dwarven Reinforcements"
    Grid[3][29] = "Dwarven Reinforcements"
    Grid[3][31] = "Elven Reinforcements"
    Grid[3][32] = "Elven Reinforcements"
    Grid[3][33] = "Elven Reinforcements"
    Grid[3][34] = "Elven Reinforcements"
    Grid[3][35] = "Elven Reinforcements"
    Grid[3][36] = "Elven Reinforcements"
    Grid[3][37] = "Elven Reinforcements"
    Grid[3][38] = "Elven Reinforcements"
    Grid[3][39] = "North Reinforcements"
    Grid[3][40] = "North Reinforcements"
    Grid[3][41] = "North Reinforcements"
    Grid[3][42] = "North Reinforcements"
    Grid[3][43] = "North Reinforcements"
    Grid[3][44] = "North Reinforcements"
    Grid[3][45] = "North Reinforcements"
    Grid[3][46] = "North Reinforcements"
    Grid[3][48] = "Rohan Reinforcements"
    Grid[3][49] = "Rohan Reinforcements"
    Grid[3][50] = "Rohan Reinforcements"
    Grid[3][51] = "Rohan Reinforcements"
    Grid[3][52] = "Rohan Reinforcements"
    Grid[3][53] = "Rohan Reinforcements"
    Grid[3][54] = "Rohan Reinforcements"
    Grid[3][56] = "Gondor Reinforcements"
    Grid[3][57] = "Gondor Reinforcements"
    Grid[3][58] = "Gondor Reinforcements"
    Grid[3][59] = "Gondor Reinforcements"
    Grid[3][60] = "Gondor Reinforcements"
    Grid[3][61] = "Gondor Reinforcements"
    Grid[3][62] = "Gondor Reinforcements"
    Grid[4][23] = "Dwarven Reinforcements"
    Grid[4][24] = "Dwarven Reinforcements"
    Grid[4][25] = "Dwarven Reinforcements"
    Grid[4][26] = "Dwarven Reinforcements"
    Grid[4][27] = "Dwarven Reinforcements"
    Grid[4][28] = "Dwarven Reinforcements"
    Grid[4][29] = "Dwarven Reinforcements"
    Grid[4][31] = "Elven Reinforcements"
    Grid[4][32] = "Elven Reinforcements"
    Grid[4][33] = "Elven Reinforcements"
    Grid[4][34] = "Elven Reinforcements"
    Grid[4][35] = "Elven Reinforcements"
    Grid[4][36] = "Elven Reinforcements"
    Grid[4][37] = "Elven Reinforcements"
    Grid[4][38] = "Elven Reinforcements"
    Grid[4][39] = "North Reinforcements"
    Grid[4][40] = "North Reinforcements"
    Grid[4][41] = "North Reinforcements"
    Grid[4][42] = "North Reinforcements"
    Grid[4][43] = "North Reinforcements"
    Grid[4][44] = "North Reinforcements"
    Grid[4][45] = "North Reinforcements"
    Grid[4][46] = "North Reinforcements"
    Grid[4][48] = "Rohan Reinforcements"
    Grid[4][49] = "Rohan Reinforcements"
    Grid[4][50] = "Rohan Reinforcements"
    Grid[4][51] = "Rohan Reinforcements"
    Grid[4][52] = "Rohan Reinforcements"
    Grid[4][53] = "Rohan Reinforcements"
    Grid[4][54] = "Rohan Reinforcements"
    Grid[4][56] = "Gondor Reinforcements"
    Grid[4][57] = "Gondor Reinforcements"
    Grid[4][58] = "Gondor Reinforcements"
    Grid[4][59] = "Gondor Reinforcements"
    Grid[4][60] = "Gondor Reinforcements"
    Grid[4][61] = "Gondor Reinforcements"
    Grid[4][62] = "Gondor Reinforcements"
    Grid[5][23] = "Dwarven Reinforcements"
    Grid[5][24] = "Dwarven Reinforcements"
    Grid[5][25] = "Dwarven Reinforcements"
    Grid[5][26] = "Dwarven Reinforcements"
    Grid[5][27] = "Dwarven Reinforcements"
    Grid[5][28] = "Dwarven Reinforcements"
    Grid[5][29] = "Dwarven Reinforcements"
    Grid[5][31] = "Elven Reinforcements"
    Grid[5][32] = "Elven Reinforcements"
    Grid[5][33] = "Elven Reinforcements"
    Grid[5][34] = "Elven Reinforcements"
    Grid[5][35] = "Elven Reinforcements"
    Grid[5][36] = "Elven Reinforcements"
    Grid[5][37] = "Elven Reinforcements"
    Grid[5][38] = "Elven Reinforcements"
    Grid[5][39] = "North Reinforcements"
    Grid[5][40] = "North Reinforcements"
    Grid[5][41] = "North Reinforcements"
    Grid[5][42] = "North Reinforcements"
    Grid[5][43] = "North Reinforcements"
    Grid[5][44] = "North Reinforcements"
    Grid[5][45] = "North Reinforcements"
    Grid[5][46] = "North Reinforcements"
    Grid[5][48] = "Rohan Reinforcements"
    Grid[5][49] = "Rohan Reinforcements"
    Grid[5][50] = "Rohan Reinforcements"
    Grid[5][51] = "Rohan Reinforcements"
    Grid[5][52] = "Rohan Reinforcements"
    Grid[5][53] = "Rohan Reinforcements"
    Grid[5][54] = "Rohan Reinforcements"
    Grid[5][56] = "Gondor Reinforcements"
    Grid[5][57] = "Gondor Reinforcements"
    Grid[5][58] = "Gondor Reinforcements"
    Grid[5][59] = "Gondor Reinforcements"
    Grid[5][60] = "Gondor Reinforcements"
    Grid[5][61] = "Gondor Reinforcements"
    Grid[5][62] = "Gondor Reinforcements"
    Grid[6][23] = "Dwarven Reinforcements"
    Grid[6][24] = "Dwarven Reinforcements"
    Grid[6][25] = "Dwarven Reinforcements"
    Grid[6][26] = "Dwarven Reinforcements"
    Grid[6][27] = "Dwarven Reinforcements"
    Grid[6][28] = "Dwarven Reinforcements"
    Grid[6][29] = "Dwarven Reinforcements"
    Grid[6][31] = "Elven Reinforcements"
    Grid[6][32] = "Elven Reinforcements"
    Grid[6][33] = "Elven Reinforcements"
    Grid[6][34] = "Elven Reinforcements"
    Grid[6][35] = "Elven Reinforcements"
    Grid[6][36] = "Elven Reinforcements"
    Grid[6][37] = "Elven Reinforcements"
    Grid[6][38] = "Elven Reinforcements"
    Grid[6][39] = "North Reinforcements"
    Grid[6][40] = "North Reinforcements"
    Grid[6][41] = "North Reinforcements"
    Grid[6][42] = "North Reinforcements"
    Grid[6][43] = "North Reinforcements"
    Grid[6][44] = "North Reinforcements"
    Grid[6][45] = "North Reinforcements"
    Grid[6][46] = "North Reinforcements"
    Grid[6][48] = "Rohan Reinforcements"
    Grid[6][49] = "Rohan Reinforcements"
    Grid[6][50] = "Rohan Reinforcements"
    Grid[6][51] = "Rohan Reinforcements"
    Grid[6][52] = "Rohan Reinforcements"
    Grid[6][53] = "Rohan Reinforcements"
    Grid[6][54] = "Rohan Reinforcements"
    Grid[6][56] = "Gondor Reinforcements"
    Grid[6][57] = "Gondor Reinforcements"
    Grid[6][58] = "Gondor Reinforcements"
    Grid[6][59] = "Gondor Reinforcements"
    Grid[6][60] = "Gondor Reinforcements"
    Grid[6][61] = "Gondor Reinforcements"
    Grid[6][62] = "Gondor Reinforcements"
    Grid[7][23] = "Dwarven Reinforcements"
    Grid[7][24] = "Dwarven Reinforcements"
    Grid[7][25] = "Dwarven Reinforcements"
    Grid[7][26] = "Dwarven Reinforcements"
    Grid[7][27] = "Dwarven Reinforcements"
    Grid[7][28] = "Dwarven Reinforcements"
    Grid[7][29] = "Dwarven Reinforcements"
    Grid[7][31] = "Elven Reinforcements"
    Grid[7][32] = "Elven Reinforcements"
    Grid[7][33] = "Elven Reinforcements"
    Grid[7][34] = "Elven Reinforcements"
    Grid[7][35] = "Elven Reinforcements"
    Grid[7][36] = "Elven Reinforcements"
    Grid[7][37] = "Elven Reinforcements"
    Grid[7][38] = "Elven Reinforcements"
    Grid[7][39] = "North Reinforcements"
    Grid[7][40] = "North Reinforcements"
    Grid[7][41] = "North Reinforcements"
    Grid[7][42] = "North Reinforcements"
    Grid[7][43] = "North Reinforcements"
    Grid[7][44] = "North Reinforcements"
    Grid[7][45] = "North Reinforcements"
    Grid[7][46] = "North Reinforcements"
    Grid[7][48] = "Rohan Reinforcements"
    Grid[7][49] = "Rohan Reinforcements"
    Grid[7][50] = "Rohan Reinforcements"
    Grid[7][51] = "Rohan Reinforcements"
    Grid[7][52] = "Rohan Reinforcements"
    Grid[7][53] = "Rohan Reinforcements"
    Grid[7][54] = "Rohan Reinforcements"
    Grid[7][56] = "Gondor Reinforcements"
    Grid[7][57] = "Gondor Reinforcements"
    Grid[7][58] = "Gondor Reinforcements"
    Grid[7][59] = "Gondor Reinforcements"
    Grid[7][60] = "Gondor Reinforcements"
    Grid[7][61] = "Gondor Reinforcements"
    Grid[7][62] = "Gondor Reinforcements"
    Grid[8][23] = "Dwarven Reinforcements"
    Grid[8][24] = "Dwarven Reinforcements"
    Grid[8][25] = "Dwarven Reinforcements"
    Grid[8][26] = "Dwarven Reinforcements"
    Grid[8][27] = "Dwarven Reinforcements"
    Grid[8][28] = "Dwarven Reinforcements"
    Grid[8][29] = "Dwarven Reinforcements"
    Grid[8][31] = "Elven Reinforcements"
    Grid[8][32] = "Elven Reinforcements"
    Grid[8][33] = "Elven Reinforcements"
    Grid[8][34] = "Elven Reinforcements"
    Grid[8][35] = "Elven Reinforcements"
    Grid[8][36] = "Elven Reinforcements"
    Grid[8][37] = "Elven Reinforcements"
    Grid[8][38] = "Elven Reinforcements"
    Grid[8][39] = "North Reinforcements"
    Grid[8][40] = "North Reinforcements"
    Grid[8][41] = "North Reinforcements"
    Grid[8][42] = "North Reinforcements"
    Grid[8][43] = "North Reinforcements"
    Grid[8][44] = "North Reinforcements"
    Grid[8][45] = "North Reinforcements"
    Grid[8][46] = "North Reinforcements"
    Grid[8][48] = "Rohan Reinforcements"
    Grid[8][49] = "Rohan Reinforcements"
    Grid[8][50] = "Rohan Reinforcements"
    Grid[8][51] = "Rohan Reinforcements"
    Grid[8][52] = "Rohan Reinforcements"
    Grid[8][53] = "Rohan Reinforcements"
    Grid[8][54] = "Rohan Reinforcements"
    Grid[8][56] = "Gondor Reinforcements"
    Grid[8][57] = "Gondor Reinforcements"
    Grid[8][58] = "Gondor Reinforcements"
    Grid[8][59] = "Gondor Reinforcements"
    Grid[8][60] = "Gondor Reinforcements"
    Grid[8][61] = "Gondor Reinforcements"
    Grid[8][62] = "Gondor Reinforcements"
    Grid[9][23] = "Dwarven Reinforcements"
    Grid[9][24] = "Dwarven Reinforcements"
    Grid[9][25] = "Dwarven Reinforcements"
    Grid[9][26] = "Dwarven Reinforcements"
    Grid[9][27] = "Dwarven Reinforcements"
    Grid[9][28] = "Dwarven Reinforcements"
    Grid[9][29] = "Dwarven Reinforcements"
    Grid[9][31] = "Elven Reinforcements"
    Grid[9][32] = "Elven Reinforcements"
    Grid[9][33] = "Elven Reinforcements"
    Grid[9][34] = "Elven Reinforcements"
    Grid[9][35] = "Elven Reinforcements"
    Grid[9][36] = "Elven Reinforcements"
    Grid[9][37] = "Elven Reinforcements"
    Grid[9][38] = "Elven Reinforcements"
    Grid[9][39] = "North Reinforcements"
    Grid[9][40] = "North Reinforcements"
    Grid[9][41] = "North Reinforcements"
    Grid[9][42] = "North Reinforcements"
    Grid[9][43] = "North Reinforcements"
    Grid[9][44] = "North Reinforcements"
    Grid[9][45] = "North Reinforcements"
    Grid[9][46] = "North Reinforcements"
    Grid[9][48] = "Rohan Reinforcements"
    Grid[9][49] = "Rohan Reinforcements"
    Grid[9][50] = "Rohan Reinforcements"
    Grid[9][51] = "Rohan Reinforcements"
    Grid[9][52] = "Rohan Reinforcements"
    Grid[9][53] = "Rohan Reinforcements"
    Grid[9][54] = "Rohan Reinforcements"
    Grid[9][56] = "Gondor Reinforcements"
    Grid[9][57] = "Gondor Reinforcements"
    Grid[9][58] = "Gondor Reinforcements"
    Grid[9][59] = "Gondor Reinforcements"
    Grid[9][60] = "Gondor Reinforcements"
    Grid[9][61] = "Gondor Reinforcements"
    Grid[9][62] = "Gondor Reinforcements"
    Grid[10][23] = "Dwarven Reinforcements"
    Grid[10][24] = "Dwarven Reinforcements"
    Grid[10][25] = "Dwarven Reinforcements"
    Grid[10][26] = "Dwarven Reinforcements"
    Grid[10][27] = "Dwarven Reinforcements"
    Grid[10][28] = "Dwarven Reinforcements"
    Grid[10][29] = "Dwarven Reinforcements"
    Grid[10][31] = "Elven Reinforcements"
    Grid[10][32] = "Elven Reinforcements"
    Grid[10][33] = "Elven Reinforcements"
    Grid[10][34] = "Elven Reinforcements"
    Grid[10][35] = "Elven Reinforcements"
    Grid[10][36] = "Elven Reinforcements"
    Grid[10][37] = "Elven Reinforcements"
    Grid[10][38] = "Elven Reinforcements"
    Grid[10][39] = "North Reinforcements"
    Grid[10][40] = "North Reinforcements"
    Grid[10][41] = "North Reinforcements"
    Grid[10][42] = "North Reinforcements"
    Grid[10][43] = "North Reinforcements"
    Grid[10][44] = "North Reinforcements"
    Grid[10][45] = "North Reinforcements"
    Grid[10][46] = "North Reinforcements"
    Grid[10][48] = "Rohan Reinforcements"
    Grid[10][49] = "Rohan Reinforcements"
    Grid[10][50] = "Rohan Reinforcements"
    Grid[10][51] = "Rohan Reinforcements"
    Grid[10][52] = "Rohan Reinforcements"
    Grid[10][53] = "Rohan Reinforcements"
    Grid[10][54] = "Rohan Reinforcements"
    Grid[10][56] = "Gondor Reinforcements"
    Grid[10][57] = "Gondor Reinforcements"
    Grid[10][58] = "Gondor Reinforcements"
    Grid[10][59] = "Gondor Reinforcements"
    Grid[10][60] = "Gondor Reinforcements"
    Grid[10][61] = "Gondor Reinforcements"
    Grid[10][62] = "Gondor Reinforcements"
    Grid[11][23] = "Dwarven Reinforcements"
    Grid[11][24] = "Dwarven Reinforcements"
    Grid[11][25] = "Dwarven Reinforcements"
    Grid[11][26] = "Dwarven Reinforcements"
    Grid[11][27] = "Dwarven Reinforcements"
    Grid[11][28] = "Dwarven Reinforcements"
    Grid[11][29] = "Dwarven Reinforcements"
    Grid[11][31] = "Elven Reinforcements"
    Grid[11][32] = "Elven Reinforcements"
    Grid[11][33] = "Elven Reinforcements"
    Grid[11][34] = "Elven Reinforcements"
    Grid[11][35] = "Elven Reinforcements"
    Grid[11][36] = "Elven Reinforcements"
    Grid[11][37] = "Elven Reinforcements"
    Grid[11][38] = "Elven Reinforcements"
    Grid[11][39] = "North Reinforcements"
    Grid[11][40] = "North Reinforcements"
    Grid[11][41] = "North Reinforcements"
    Grid[11][42] = "North Reinforcements"
    Grid[11][43] = "North Reinforcements"
    Grid[11][44] = "North Reinforcements"
    Grid[11][45] = "North Reinforcements"
    Grid[11][46] = "North Reinforcements"
    Grid[11][48] = "Rohan Reinforcements"
    Grid[11][49] = "Rohan Reinforcements"
    Grid[11][50] = "Rohan Reinforcements"
    Grid[11][51] = "Rohan Reinforcements"
    Grid[11][52] = "Rohan Reinforcements"
    Grid[11][53] = "Rohan Reinforcements"
    Grid[11][54] = "Rohan Reinforcements"
    Grid[11][56] = "Gondor Reinforcements"
    Grid[11][57] = "Gondor Reinforcements"
    Grid[11][58] = "Gondor Reinforcements"
    Grid[11][59] = "Gondor Reinforcements"
    Grid[11][60] = "Gondor Reinforcements"
    Grid[11][61] = "Gondor Reinforcements"
    Grid[11][62] = "Gondor Reinforcements"
    Grid[12][23] = "Dwarven Reinforcements"
    Grid[12][24] = "Dwarven Reinforcements"
    Grid[12][25] = "Dwarven Reinforcements"
    Grid[12][26] = "Dwarven Reinforcements"
    Grid[12][27] = "Dwarven Reinforcements"
    Grid[12][28] = "Dwarven Reinforcements"
    Grid[12][29] = "Dwarven Reinforcements"
    Grid[12][31] = "Elven Reinforcements"
    Grid[12][32] = "Elven Reinforcements"
    Grid[12][33] = "Elven Reinforcements"
    Grid[12][34] = "Elven Reinforcements"
    Grid[12][35] = "Elven Reinforcements"
    Grid[12][36] = "Elven Reinforcements"
    Grid[12][37] = "Elven Reinforcements"
    Grid[12][38] = "Elven Reinforcements"
    Grid[12][39] = "North Reinforcements"
    Grid[12][40] = "North Reinforcements"
    Grid[12][41] = "North Reinforcements"
    Grid[12][42] = "North Reinforcements"
    Grid[12][43] = "North Reinforcements"
    Grid[12][44] = "North Reinforcements"
    Grid[12][45] = "North Reinforcements"
    Grid[12][46] = "North Reinforcements"
    Grid[12][48] = "Rohan Reinforcements"
    Grid[12][49] = "Rohan Reinforcements"
    Grid[12][50] = "Rohan Reinforcements"
    Grid[12][51] = "Rohan Reinforcements"
    Grid[12][52] = "Rohan Reinforcements"
    Grid[12][53] = "Rohan Reinforcements"
    Grid[12][54] = "Rohan Reinforcements"
    Grid[12][56] = "Gondor Reinforcements"
    Grid[12][57] = "Gondor Reinforcements"
    Grid[12][58] = "Gondor Reinforcements"
    Grid[12][59] = "Gondor Reinforcements"
    Grid[12][60] = "Gondor Reinforcements"
    Grid[12][61] = "Gondor Reinforcements"
    Grid[12][62] = "Gondor Reinforcements"
    Grid[13][23] = "Erebor Stronghold"
    Grid[13][24] = "Erebor Stronghold"
    Grid[13][25] = "Erebor Stronghold"
    Grid[13][26] = "Erebor Stronghold"
    Grid[13][27] = "Erebor Stronghold"
    Grid[13][28] = "Erebor Stronghold"
    Grid[13][29] = "Erebor Stronghold"
    Grid[13][31] = "Grey Havens Stronghold"
    Grid[13][32] = "Grey Havens Stronghold"
    Grid[13][33] = "Grey Havens Stronghold"
    Grid[13][34] = "Grey Havens Stronghold"
    Grid[13][35] = "Grey Havens Stronghold"
    Grid[13][36] = "Grey Havens Stronghold"
    Grid[13][37] = "Grey Havens Stronghold"
    Grid[13][39] = "Rivendell Stronghold"
    Grid[13][40] = "Rivendell Stronghold"
    Grid[13][41] = "Rivendell Stronghold"
    Grid[13][42] = "Rivendell Stronghold"
    Grid[13][43] = "Rivendell Stronghold"
    Grid[13][44] = "Rivendell Stronghold"
    Grid[13][45] = "Rivendell Stronghold"
    Grid[13][46] = "Rivendell Stronghold"
    Grid[13][47] = "Woodland Realm Stronghold"
    Grid[13][48] = "Woodland Realm Stronghold"
    Grid[13][49] = "Woodland Realm Stronghold"
    Grid[13][50] = "Woodland Realm Stronghold"
    Grid[13][51] = "Woodland Realm Stronghold"
    Grid[13][52] = "Woodland Realm Stronghold"
    Grid[13][53] = "Woodland Realm Stronghold"
    Grid[13][55] = "Lorien Stronghold"
    Grid[13][56] = "Lorien Stronghold"
    Grid[13][57] = "Lorien Stronghold"
    Grid[13][58] = "Lorien Stronghold"
    Grid[13][59] = "Lorien Stronghold"
    Grid[13][60] = "Lorien Stronghold"
    Grid[13][61] = "Lorien Stronghold"
    Grid[13][62] = "Lorien Stronghold"
    Grid[13][63] = "Helm's Deep Stronghold"
    Grid[13][64] = "Helm's Deep Stronghold"
    Grid[13][65] = "Helm's Deep Stronghold"
    Grid[13][66] = "Helm's Deep Stronghold"
    Grid[13][67] = "Helm's Deep Stronghold"
    Grid[13][68] = "Helm's Deep Stronghold"
    Grid[13][69] = "Helm's Deep Stronghold"
    Grid[13][70] = "Helm's Deep Stronghold"
    Grid[13][71] = "Minas Tirith Stronghold"
    Grid[13][72] = "Minas Tirith Stronghold"
    Grid[13][73] = "Minas Tirith Stronghold"
    Grid[13][74] = "Minas Tirith Stronghold"
    Grid[13][75] = "Minas Tirith Stronghold"
    Grid[13][76] = "Minas Tirith Stronghold"
    Grid[13][77] = "Minas Tirith Stronghold"
    Grid[13][78] = "Minas Tirith Stronghold"
    Grid[13][79] = "Dol Amroth Stronghold"
    Grid[13][80] = "Dol Amroth Stronghold"
    Grid[13][81] = "Dol Amroth Stronghold"
    Grid[13][82] = "Dol Amroth Stronghold"
    Grid[13][83] = "Dol Amroth Stronghold"
    Grid[13][84] = "Dol Amroth Stronghold"
    Grid[13][85] = "Dol Amroth Stronghold"
    Grid[13][86] = "Dol Amroth Stronghold"
    Grid[14][23] = "Erebor Stronghold"
    Grid[14][24] = "Erebor Stronghold"
    Grid[14][25] = "Erebor Stronghold"
    Grid[14][26] = "Erebor Stronghold"
    Grid[14][27] = "Erebor Stronghold"
    Grid[14][28] = "Erebor Stronghold"
    Grid[14][29] = "Erebor Stronghold"
    Grid[14][31] = "Grey Havens Stronghold"
    Grid[14][32] = "Grey Havens Stronghold"
    Grid[14][33] = "Grey Havens Stronghold"
    Grid[14][34] = "Grey Havens Stronghold"
    Grid[14][35] = "Grey Havens Stronghold"
    Grid[14][36] = "Grey Havens Stronghold"
    Grid[14][37] = "Grey Havens Stronghold"
    Grid[14][39] = "Rivendell Stronghold"
    Grid[14][40] = "Rivendell Stronghold"
    Grid[14][41] = "Rivendell Stronghold"
    Grid[14][42] = "Rivendell Stronghold"
    Grid[14][43] = "Rivendell Stronghold"
    Grid[14][44] = "Rivendell Stronghold"
    Grid[14][45] = "Rivendell Stronghold"
    Grid[14][46] = "Rivendell Stronghold"
    Grid[14][47] = "Woodland Realm Stronghold"
    Grid[14][48] = "Woodland Realm Stronghold"
    Grid[14][49] = "Woodland Realm Stronghold"
    Grid[14][50] = "Woodland Realm Stronghold"
    Grid[14][51] = "Woodland Realm Stronghold"
    Grid[14][52] = "Woodland Realm Stronghold"
    Grid[14][53] = "Woodland Realm Stronghold"
    Grid[14][55] = "Lorien Stronghold"
    Grid[14][56] = "Lorien Stronghold"
    Grid[14][57] = "Lorien Stronghold"
    Grid[14][58] = "Lorien Stronghold"
    Grid[14][59] = "Lorien Stronghold"
    Grid[14][60] = "Lorien Stronghold"
    Grid[14][61] = "Lorien Stronghold"
    Grid[14][62] = "Lorien Stronghold"
    Grid[14][63] = "Helm's Deep Stronghold"
    Grid[14][64] = "Helm's Deep Stronghold"
    Grid[14][65] = "Helm's Deep Stronghold"
    Grid[14][66] = "Helm's Deep Stronghold"
    Grid[14][67] = "Helm's Deep Stronghold"
    Grid[14][68] = "Helm's Deep Stronghold"
    Grid[14][69] = "Helm's Deep Stronghold"
    Grid[14][70] = "Helm's Deep Stronghold"
    Grid[14][71] = "Minas Tirith Stronghold"
    Grid[14][72] = "Minas Tirith Stronghold"
    Grid[14][73] = "Minas Tirith Stronghold"
    Grid[14][74] = "Minas Tirith Stronghold"
    Grid[14][75] = "Minas Tirith Stronghold"
    Grid[14][76] = "Minas Tirith Stronghold"
    Grid[14][77] = "Minas Tirith Stronghold"
    Grid[14][78] = "Minas Tirith Stronghold"
    Grid[14][79] = "Dol Amroth Stronghold"
    Grid[14][80] = "Dol Amroth Stronghold"
    Grid[14][81] = "Dol Amroth Stronghold"
    Grid[14][82] = "Dol Amroth Stronghold"
    Grid[14][83] = "Dol Amroth Stronghold"
    Grid[14][84] = "Dol Amroth Stronghold"
    Grid[14][85] = "Dol Amroth Stronghold"
    Grid[14][86] = "Dol Amroth Stronghold"
    Grid[15][23] = "Erebor Stronghold"
    Grid[15][24] = "Erebor Stronghold"
    Grid[15][25] = "Erebor Stronghold"
    Grid[15][26] = "Erebor Stronghold"
    Grid[15][27] = "Erebor Stronghold"
    Grid[15][28] = "Erebor Stronghold"
    Grid[15][29] = "Erebor Stronghold"
    Grid[15][31] = "Grey Havens Stronghold"
    Grid[15][32] = "Grey Havens Stronghold"
    Grid[15][33] = "Grey Havens Stronghold"
    Grid[15][34] = "Grey Havens Stronghold"
    Grid[15][35] = "Grey Havens Stronghold"
    Grid[15][36] = "Grey Havens Stronghold"
    Grid[15][37] = "Grey Havens Stronghold"
    Grid[15][39] = "Rivendell Stronghold"
    Grid[15][40] = "Rivendell Stronghold"
    Grid[15][41] = "Rivendell Stronghold"
    Grid[15][42] = "Rivendell Stronghold"
    Grid[15][43] = "Rivendell Stronghold"
    Grid[15][44] = "Rivendell Stronghold"
    Grid[15][45] = "Rivendell Stronghold"
    Grid[15][46] = "Rivendell Stronghold"
    Grid[15][47] = "Woodland Realm Stronghold"
    Grid[15][48] = "Woodland Realm Stronghold"
    Grid[15][49] = "Woodland Realm Stronghold"
    Grid[15][50] = "Woodland Realm Stronghold"
    Grid[15][51] = "Woodland Realm Stronghold"
    Grid[15][52] = "Woodland Realm Stronghold"
    Grid[15][53] = "Woodland Realm Stronghold"
    Grid[15][55] = "Lorien Stronghold"
    Grid[15][56] = "Lorien Stronghold"
    Grid[15][57] = "Lorien Stronghold"
    Grid[15][58] = "Lorien Stronghold"
    Grid[15][59] = "Lorien Stronghold"
    Grid[15][60] = "Lorien Stronghold"
    Grid[15][61] = "Lorien Stronghold"
    Grid[15][62] = "Lorien Stronghold"
    Grid[15][63] = "Helm's Deep Stronghold"
    Grid[15][64] = "Helm's Deep Stronghold"
    Grid[15][65] = "Helm's Deep Stronghold"
    Grid[15][66] = "Helm's Deep Stronghold"
    Grid[15][67] = "Helm's Deep Stronghold"
    Grid[15][68] = "Helm's Deep Stronghold"
    Grid[15][69] = "Helm's Deep Stronghold"
    Grid[15][70] = "Helm's Deep Stronghold"
    Grid[15][71] = "Minas Tirith Stronghold"
    Grid[15][72] = "Minas Tirith Stronghold"
    Grid[15][73] = "Minas Tirith Stronghold"
    Grid[15][74] = "Minas Tirith Stronghold"
    Grid[15][75] = "Minas Tirith Stronghold"
    Grid[15][76] = "Minas Tirith Stronghold"
    Grid[15][77] = "Minas Tirith Stronghold"
    Grid[15][78] = "Minas Tirith Stronghold"
    Grid[15][79] = "Dol Amroth Stronghold"
    Grid[15][80] = "Dol Amroth Stronghold"
    Grid[15][81] = "Dol Amroth Stronghold"
    Grid[15][82] = "Dol Amroth Stronghold"
    Grid[15][83] = "Dol Amroth Stronghold"
    Grid[15][84] = "Dol Amroth Stronghold"
    Grid[15][85] = "Dol Amroth Stronghold"
    Grid[15][86] = "Dol Amroth Stronghold"
    Grid[16][23] = "Erebor Stronghold"
    Grid[16][24] = "Erebor Stronghold"
    Grid[16][25] = "Erebor Stronghold"
    Grid[16][26] = "Erebor Stronghold"
    Grid[16][27] = "Erebor Stronghold"
    Grid[16][28] = "Erebor Stronghold"
    Grid[16][29] = "Erebor Stronghold"
    Grid[16][31] = "Grey Havens Stronghold"
    Grid[16][32] = "Grey Havens Stronghold"
    Grid[16][33] = "Grey Havens Stronghold"
    Grid[16][34] = "Grey Havens Stronghold"
    Grid[16][35] = "Grey Havens Stronghold"
    Grid[16][36] = "Grey Havens Stronghold"
    Grid[16][37] = "Grey Havens Stronghold"
    Grid[16][39] = "Rivendell Stronghold"
    Grid[16][40] = "Rivendell Stronghold"
    Grid[16][41] = "Rivendell Stronghold"
    Grid[16][42] = "Rivendell Stronghold"
    Grid[16][43] = "Rivendell Stronghold"
    Grid[16][44] = "Rivendell Stronghold"
    Grid[16][45] = "Rivendell Stronghold"
    Grid[16][46] = "Rivendell Stronghold"
    Grid[16][47] = "Woodland Realm Stronghold"
    Grid[16][48] = "Woodland Realm Stronghold"
    Grid[16][49] = "Woodland Realm Stronghold"
    Grid[16][50] = "Woodland Realm Stronghold"
    Grid[16][51] = "Woodland Realm Stronghold"
    Grid[16][52] = "Woodland Realm Stronghold"
    Grid[16][53] = "Woodland Realm Stronghold"
    Grid[16][55] = "Lorien Stronghold"
    Grid[16][56] = "Lorien Stronghold"
    Grid[16][57] = "Lorien Stronghold"
    Grid[16][58] = "Lorien Stronghold"
    Grid[16][59] = "Lorien Stronghold"
    Grid[16][60] = "Lorien Stronghold"
    Grid[16][61] = "Lorien Stronghold"
    Grid[16][62] = "Lorien Stronghold"
    Grid[16][63] = "Helm's Deep Stronghold"
    Grid[16][64] = "Helm's Deep Stronghold"
    Grid[16][65] = "Helm's Deep Stronghold"
    Grid[16][66] = "Helm's Deep Stronghold"
    Grid[16][67] = "Helm's Deep Stronghold"
    Grid[16][68] = "Helm's Deep Stronghold"
    Grid[16][69] = "Helm's Deep Stronghold"
    Grid[16][70] = "Helm's Deep Stronghold"
    Grid[16][71] = "Minas Tirith Stronghold"
    Grid[16][72] = "Minas Tirith Stronghold"
    Grid[16][73] = "Minas Tirith Stronghold"
    Grid[16][74] = "Minas Tirith Stronghold"
    Grid[16][75] = "Minas Tirith Stronghold"
    Grid[16][76] = "Minas Tirith Stronghold"
    Grid[16][77] = "Minas Tirith Stronghold"
    Grid[16][78] = "Minas Tirith Stronghold"
    Grid[16][79] = "Dol Amroth Stronghold"
    Grid[16][80] = "Dol Amroth Stronghold"
    Grid[16][81] = "Dol Amroth Stronghold"
    Grid[16][82] = "Dol Amroth Stronghold"
    Grid[16][83] = "Dol Amroth Stronghold"
    Grid[16][84] = "Dol Amroth Stronghold"
    Grid[16][85] = "Dol Amroth Stronghold"
    Grid[16][86] = "Dol Amroth Stronghold"
    Grid[17][23] = "Erebor Stronghold"
    Grid[17][24] = "Erebor Stronghold"
    Grid[17][25] = "Erebor Stronghold"
    Grid[17][26] = "Erebor Stronghold"
    Grid[17][27] = "Erebor Stronghold"
    Grid[17][28] = "Erebor Stronghold"
    Grid[17][29] = "Erebor Stronghold"
    Grid[17][31] = "Grey Havens Stronghold"
    Grid[17][32] = "Grey Havens Stronghold"
    Grid[17][33] = "Grey Havens Stronghold"
    Grid[17][34] = "Grey Havens Stronghold"
    Grid[17][35] = "Grey Havens Stronghold"
    Grid[17][36] = "Grey Havens Stronghold"
    Grid[17][37] = "Grey Havens Stronghold"
    Grid[17][39] = "Rivendell Stronghold"
    Grid[17][40] = "Rivendell Stronghold"
    Grid[17][41] = "Rivendell Stronghold"
    Grid[17][42] = "Rivendell Stronghold"
    Grid[17][43] = "Rivendell Stronghold"
    Grid[17][44] = "Rivendell Stronghold"
    Grid[17][45] = "Rivendell Stronghold"
    Grid[17][46] = "Rivendell Stronghold"
    Grid[17][47] = "Woodland Realm Stronghold"
    Grid[17][48] = "Woodland Realm Stronghold"
    Grid[17][49] = "Woodland Realm Stronghold"
    Grid[17][50] = "Woodland Realm Stronghold"
    Grid[17][51] = "Woodland Realm Stronghold"
    Grid[17][52] = "Woodland Realm Stronghold"
    Grid[17][53] = "Woodland Realm Stronghold"
    Grid[17][55] = "Lorien Stronghold"
    Grid[17][56] = "Lorien Stronghold"
    Grid[17][57] = "Lorien Stronghold"
    Grid[17][58] = "Lorien Stronghold"
    Grid[17][59] = "Lorien Stronghold"
    Grid[17][60] = "Lorien Stronghold"
    Grid[17][61] = "Lorien Stronghold"
    Grid[17][62] = "Lorien Stronghold"
    Grid[17][63] = "Helm's Deep Stronghold"
    Grid[17][64] = "Helm's Deep Stronghold"
    Grid[17][65] = "Helm's Deep Stronghold"
    Grid[17][66] = "Helm's Deep Stronghold"
    Grid[17][67] = "Helm's Deep Stronghold"
    Grid[17][68] = "Helm's Deep Stronghold"
    Grid[17][69] = "Helm's Deep Stronghold"
    Grid[17][70] = "Helm's Deep Stronghold"
    Grid[17][71] = "Minas Tirith Stronghold"
    Grid[17][72] = "Minas Tirith Stronghold"
    Grid[17][73] = "Minas Tirith Stronghold"
    Grid[17][74] = "Minas Tirith Stronghold"
    Grid[17][75] = "Minas Tirith Stronghold"
    Grid[17][76] = "Minas Tirith Stronghold"
    Grid[17][77] = "Minas Tirith Stronghold"
    Grid[17][78] = "Minas Tirith Stronghold"
    Grid[17][79] = "Dol Amroth Stronghold"
    Grid[17][80] = "Dol Amroth Stronghold"
    Grid[17][81] = "Dol Amroth Stronghold"
    Grid[17][82] = "Dol Amroth Stronghold"
    Grid[17][83] = "Dol Amroth Stronghold"
    Grid[17][84] = "Dol Amroth Stronghold"
    Grid[17][85] = "Dol Amroth Stronghold"
    Grid[17][86] = "Dol Amroth Stronghold"
    Grid[18][23] = "Erebor Stronghold"
    Grid[18][24] = "Erebor Stronghold"
    Grid[18][25] = "Erebor Stronghold"
    Grid[18][26] = "Erebor Stronghold"
    Grid[18][27] = "Erebor Stronghold"
    Grid[18][28] = "Erebor Stronghold"
    Grid[18][29] = "Erebor Stronghold"
    Grid[18][31] = "Grey Havens Stronghold"
    Grid[18][32] = "Grey Havens Stronghold"
    Grid[18][33] = "Grey Havens Stronghold"
    Grid[18][34] = "Grey Havens Stronghold"
    Grid[18][35] = "Grey Havens Stronghold"
    Grid[18][36] = "Grey Havens Stronghold"
    Grid[18][37] = "Grey Havens Stronghold"
    Grid[18][39] = "Rivendell Stronghold"
    Grid[18][40] = "Rivendell Stronghold"
    Grid[18][41] = "Rivendell Stronghold"
    Grid[18][42] = "Rivendell Stronghold"
    Grid[18][43] = "Rivendell Stronghold"
    Grid[18][44] = "Rivendell Stronghold"
    Grid[18][45] = "Rivendell Stronghold"
    Grid[18][46] = "Rivendell Stronghold"
    Grid[18][47] = "Woodland Realm Stronghold"
    Grid[18][48] = "Woodland Realm Stronghold"
    Grid[18][49] = "Woodland Realm Stronghold"
    Grid[18][50] = "Woodland Realm Stronghold"
    Grid[18][51] = "Woodland Realm Stronghold"
    Grid[18][52] = "Woodland Realm Stronghold"
    Grid[18][53] = "Woodland Realm Stronghold"
    Grid[18][55] = "Lorien Stronghold"
    Grid[18][56] = "Lorien Stronghold"
    Grid[18][57] = "Lorien Stronghold"
    Grid[18][58] = "Lorien Stronghold"
    Grid[18][59] = "Lorien Stronghold"
    Grid[18][60] = "Lorien Stronghold"
    Grid[18][61] = "Lorien Stronghold"
    Grid[18][62] = "Lorien Stronghold"
    Grid[18][63] = "Helm's Deep Stronghold"
    Grid[18][64] = "Helm's Deep Stronghold"
    Grid[18][65] = "Helm's Deep Stronghold"
    Grid[18][66] = "Helm's Deep Stronghold"
    Grid[18][67] = "Helm's Deep Stronghold"
    Grid[18][68] = "Helm's Deep Stronghold"
    Grid[18][69] = "Helm's Deep Stronghold"
    Grid[18][70] = "Helm's Deep Stronghold"
    Grid[18][71] = "Minas Tirith Stronghold"
    Grid[18][72] = "Minas Tirith Stronghold"
    Grid[18][73] = "Minas Tirith Stronghold"
    Grid[18][74] = "Minas Tirith Stronghold"
    Grid[18][75] = "Minas Tirith Stronghold"
    Grid[18][76] = "Minas Tirith Stronghold"
    Grid[18][77] = "Minas Tirith Stronghold"
    Grid[18][78] = "Minas Tirith Stronghold"
    Grid[18][79] = "Dol Amroth Stronghold"
    Grid[18][80] = "Dol Amroth Stronghold"
    Grid[18][81] = "Dol Amroth Stronghold"
    Grid[18][82] = "Dol Amroth Stronghold"
    Grid[18][83] = "Dol Amroth Stronghold"
    Grid[18][84] = "Dol Amroth Stronghold"
    Grid[18][85] = "Dol Amroth Stronghold"
    Grid[18][86] = "Dol Amroth Stronghold"
    Grid[19][23] = "Erebor Stronghold"
    Grid[19][24] = "Erebor Stronghold"
    Grid[19][25] = "Erebor Stronghold"
    Grid[19][26] = "Erebor Stronghold"
    Grid[19][27] = "Erebor Stronghold"
    Grid[19][28] = "Erebor Stronghold"
    Grid[19][29] = "Erebor Stronghold"
    Grid[19][31] = "Grey Havens Stronghold"
    Grid[19][32] = "Grey Havens Stronghold"
    Grid[19][33] = "Grey Havens Stronghold"
    Grid[19][34] = "Grey Havens Stronghold"
    Grid[19][35] = "Grey Havens Stronghold"
    Grid[19][36] = "Grey Havens Stronghold"
    Grid[19][37] = "Grey Havens Stronghold"
    Grid[19][39] = "Rivendell Stronghold"
    Grid[19][40] = "Rivendell Stronghold"
    Grid[19][41] = "Rivendell Stronghold"
    Grid[19][42] = "Rivendell Stronghold"
    Grid[19][43] = "Rivendell Stronghold"
    Grid[19][44] = "Rivendell Stronghold"
    Grid[19][45] = "Rivendell Stronghold"
    Grid[19][46] = "Rivendell Stronghold"
    Grid[19][47] = "Woodland Realm Stronghold"
    Grid[19][48] = "Woodland Realm Stronghold"
    Grid[19][49] = "Woodland Realm Stronghold"
    Grid[19][50] = "Woodland Realm Stronghold"
    Grid[19][51] = "Woodland Realm Stronghold"
    Grid[19][52] = "Woodland Realm Stronghold"
    Grid[19][53] = "Woodland Realm Stronghold"
    Grid[19][55] = "Lorien Stronghold"
    Grid[19][56] = "Lorien Stronghold"
    Grid[19][57] = "Lorien Stronghold"
    Grid[19][58] = "Lorien Stronghold"
    Grid[19][59] = "Lorien Stronghold"
    Grid[19][60] = "Lorien Stronghold"
    Grid[19][61] = "Lorien Stronghold"
    Grid[19][62] = "Lorien Stronghold"
    Grid[19][63] = "Helm's Deep Stronghold"
    Grid[19][64] = "Helm's Deep Stronghold"
    Grid[19][65] = "Helm's Deep Stronghold"
    Grid[19][66] = "Helm's Deep Stronghold"
    Grid[19][67] = "Helm's Deep Stronghold"
    Grid[19][68] = "Helm's Deep Stronghold"
    Grid[19][69] = "Helm's Deep Stronghold"
    Grid[19][70] = "Helm's Deep Stronghold"
    Grid[19][71] = "Minas Tirith Stronghold"
    Grid[19][72] = "Minas Tirith Stronghold"
    Grid[19][73] = "Minas Tirith Stronghold"
    Grid[19][74] = "Minas Tirith Stronghold"
    Grid[19][75] = "Minas Tirith Stronghold"
    Grid[19][76] = "Minas Tirith Stronghold"
    Grid[19][77] = "Minas Tirith Stronghold"
    Grid[19][78] = "Minas Tirith Stronghold"
    Grid[19][79] = "Dol Amroth Stronghold"
    Grid[19][80] = "Dol Amroth Stronghold"
    Grid[19][81] = "Dol Amroth Stronghold"
    Grid[19][82] = "Dol Amroth Stronghold"
    Grid[19][83] = "Dol Amroth Stronghold"
    Grid[19][84] = "Dol Amroth Stronghold"
    Grid[19][85] = "Dol Amroth Stronghold"
    Grid[19][86] = "Dol Amroth Stronghold"
    Grid[20][6] = "sss"
    Grid[20][23] = "Army 1 Free Peoples"
    Grid[20][24] = "Army 1 Free Peoples"
    Grid[20][25] = "Army 1 Free Peoples"
    Grid[20][26] = "Army 1 Free Peoples"
    Grid[20][27] = "Army 1 Free Peoples"
    Grid[20][28] = "Army 1 Free Peoples"
    Grid[20][29] = "Army 1 Free Peoples"
    Grid[20][30] = "Army 1 Free Peoples"
    Grid[20][31] = "Army 1 Shadow"
    Grid[20][32] = "Army 1 Shadow"
    Grid[20][33] = "Army 1 Shadow"
    Grid[20][34] = "Army 1 Shadow"
    Grid[20][35] = "Army 1 Shadow"
    Grid[20][36] = "Army 1 Shadow"
    Grid[20][37] = "Army 1 Shadow"
    Grid[20][38] = "Army 1 Shadow"
    Grid[20][39] = "Army 2 Free Peoples"
    Grid[20][40] = "Army 2 Free Peoples"
    Grid[20][41] = "Army 2 Free Peoples"
    Grid[20][42] = "Army 2 Free Peoples"
    Grid[20][43] = "Army 2 Free Peoples"
    Grid[20][44] = "Army 2 Free Peoples"
    Grid[20][45] = "Army 2 Free Peoples"
    Grid[20][46] = "Army 2 Free Peoples"
    Grid[20][47] = "Army 2 Shadow"
    Grid[20][48] = "Army 2 Shadow"
    Grid[20][49] = "Army 2 Shadow"
    Grid[20][50] = "Army 2 Shadow"
    Grid[20][51] = "Army 2 Shadow"
    Grid[20][52] = "Army 2 Shadow"
    Grid[20][53] = "Army 2 Shadow"
    Grid[20][54] = "Army 2 Shadow"
    Grid[20][55] = "Army 3 Free Peoples"
    Grid[20][56] = "Army 3 Free Peoples"
    Grid[20][57] = "Army 3 Free Peoples"
    Grid[20][58] = "Army 3 Free Peoples"
    Grid[20][59] = "Army 3 Free Peoples"
    Grid[20][60] = "Army 3 Free Peoples"
    Grid[20][61] = "Army 3 Free Peoples"
    Grid[20][62] = "Army 3 Free Peoples"
    Grid[20][63] = "Army 3 Shadow"
    Grid[20][64] = "Army 3 Shadow"
    Grid[20][65] = "Army 3 Shadow"
    Grid[20][66] = "Army 3 Shadow"
    Grid[20][67] = "Army 3 Shadow"
    Grid[20][68] = "Army 3 Shadow"
    Grid[20][69] = "Army 3 Shadow"
    Grid[20][70] = "Army 3 Shadow"
    Grid[20][71] = "Shadow Stronghold 1"
    Grid[20][72] = "Shadow Stronghold 1"
    Grid[20][73] = "Shadow Stronghold 1"
    Grid[20][74] = "Shadow Stronghold 1"
    Grid[20][75] = "Shadow Stronghold 1"
    Grid[20][76] = "Shadow Stronghold 1"
    Grid[20][77] = "Shadow Stronghold 1"
    Grid[20][78] = "Shadow Stronghold 1"
    Grid[20][79] = "Shadow Stronghold 2"
    Grid[20][80] = "Shadow Stronghold 2"
    Grid[20][81] = "Shadow Stronghold 2"
    Grid[20][82] = "Shadow Stronghold 2"
    Grid[20][83] = "Shadow Stronghold 2"
    Grid[20][84] = "Shadow Stronghold 2"
    Grid[20][85] = "Shadow Stronghold 2"
    Grid[20][86] = "Shadow Stronghold 2"
    Grid[21][23] = "Army 1 Free Peoples"
    Grid[21][24] = "Army 1 Free Peoples"
    Grid[21][25] = "Army 1 Free Peoples"
    Grid[21][26] = "Army 1 Free Peoples"
    Grid[21][27] = "Army 1 Free Peoples"
    Grid[21][28] = "Army 1 Free Peoples"
    Grid[21][29] = "Army 1 Free Peoples"
    Grid[21][30] = "Army 1 Free Peoples"
    Grid[21][31] = "Army 1 Shadow"
    Grid[21][32] = "Army 1 Shadow"
    Grid[21][33] = "Army 1 Shadow"
    Grid[21][34] = "Army 1 Shadow"
    Grid[21][35] = "Army 1 Shadow"
    Grid[21][36] = "Army 1 Shadow"
    Grid[21][37] = "Army 1 Shadow"
    Grid[21][38] = "Army 1 Shadow"
    Grid[21][39] = "Army 2 Free Peoples"
    Grid[21][40] = "Army 2 Free Peoples"
    Grid[21][41] = "Army 2 Free Peoples"
    Grid[21][42] = "Army 2 Free Peoples"
    Grid[21][43] = "Army 2 Free Peoples"
    Grid[21][44] = "Army 2 Free Peoples"
    Grid[21][45] = "Army 2 Free Peoples"
    Grid[21][46] = "Army 2 Free Peoples"
    Grid[21][47] = "Army 2 Shadow"
    Grid[21][48] = "Army 2 Shadow"
    Grid[21][49] = "Army 2 Shadow"
    Grid[21][50] = "Army 2 Shadow"
    Grid[21][51] = "Army 2 Shadow"
    Grid[21][52] = "Army 2 Shadow"
    Grid[21][53] = "Army 2 Shadow"
    Grid[21][54] = "Army 2 Shadow"
    Grid[21][55] = "Army 3 Free Peoples"
    Grid[21][56] = "Army 3 Free Peoples"
    Grid[21][57] = "Army 3 Free Peoples"
    Grid[21][58] = "Army 3 Free Peoples"
    Grid[21][59] = "Army 3 Free Peoples"
    Grid[21][60] = "Army 3 Free Peoples"
    Grid[21][61] = "Army 3 Free Peoples"
    Grid[21][62] = "Army 3 Free Peoples"
    Grid[21][63] = "Army 3 Shadow"
    Grid[21][64] = "Army 3 Shadow"
    Grid[21][65] = "Army 3 Shadow"
    Grid[21][66] = "Army 3 Shadow"
    Grid[21][67] = "Army 3 Shadow"
    Grid[21][68] = "Army 3 Shadow"
    Grid[21][69] = "Army 3 Shadow"
    Grid[21][70] = "Army 3 Shadow"
    Grid[21][71] = "Shadow Stronghold 1"
    Grid[21][72] = "Shadow Stronghold 1"
    Grid[21][73] = "Shadow Stronghold 1"
    Grid[21][74] = "Shadow Stronghold 1"
    Grid[21][75] = "Shadow Stronghold 1"
    Grid[21][76] = "Shadow Stronghold 1"
    Grid[21][77] = "Shadow Stronghold 1"
    Grid[21][78] = "Shadow Stronghold 1"
    Grid[21][79] = "Shadow Stronghold 2"
    Grid[21][80] = "Shadow Stronghold 2"
    Grid[21][81] = "Shadow Stronghold 2"
    Grid[21][82] = "Shadow Stronghold 2"
    Grid[21][83] = "Shadow Stronghold 2"
    Grid[21][84] = "Shadow Stronghold 2"
    Grid[21][85] = "Shadow Stronghold 2"
    Grid[21][86] = "Shadow Stronghold 2"
    Grid[22][23] = "Army 1 Free Peoples"
    Grid[22][24] = "Army 1 Free Peoples"
    Grid[22][25] = "Army 1 Free Peoples"
    Grid[22][26] = "Army 1 Free Peoples"
    Grid[22][27] = "Army 1 Free Peoples"
    Grid[22][28] = "Army 1 Free Peoples"
    Grid[22][29] = "Army 1 Free Peoples"
    Grid[22][30] = "Army 1 Free Peoples"
    Grid[22][31] = "Army 1 Shadow"
    Grid[22][32] = "Army 1 Shadow"
    Grid[22][33] = "Army 1 Shadow"
    Grid[22][34] = "Army 1 Shadow"
    Grid[22][35] = "Army 1 Shadow"
    Grid[22][36] = "Army 1 Shadow"
    Grid[22][37] = "Army 1 Shadow"
    Grid[22][38] = "Army 1 Shadow"
    Grid[22][39] = "Army 2 Free Peoples"
    Grid[22][40] = "Army 2 Free Peoples"
    Grid[22][41] = "Army 2 Free Peoples"
    Grid[22][42] = "Army 2 Free Peoples"
    Grid[22][43] = "Army 2 Free Peoples"
    Grid[22][44] = "Army 2 Free Peoples"
    Grid[22][45] = "Army 2 Free Peoples"
    Grid[22][46] = "Army 2 Free Peoples"
    Grid[22][47] = "Army 2 Shadow"
    Grid[22][48] = "Army 2 Shadow"
    Grid[22][49] = "Army 2 Shadow"
    Grid[22][50] = "Army 2 Shadow"
    Grid[22][51] = "Army 2 Shadow"
    Grid[22][52] = "Army 2 Shadow"
    Grid[22][53] = "Army 2 Shadow"
    Grid[22][54] = "Army 2 Shadow"
    Grid[22][55] = "Army 3 Free Peoples"
    Grid[22][56] = "Army 3 Free Peoples"
    Grid[22][57] = "Army 3 Free Peoples"
    Grid[22][58] = "Army 3 Free Peoples"
    Grid[22][59] = "Army 3 Free Peoples"
    Grid[22][60] = "Army 3 Free Peoples"
    Grid[22][61] = "Army 3 Free Peoples"
    Grid[22][62] = "Army 3 Free Peoples"
    Grid[22][63] = "Army 3 Shadow"
    Grid[22][64] = "Army 3 Shadow"
    Grid[22][65] = "Army 3 Shadow"
    Grid[22][66] = "Army 3 Shadow"
    Grid[22][67] = "Army 3 Shadow"
    Grid[22][68] = "Army 3 Shadow"
    Grid[22][69] = "Army 3 Shadow"
    Grid[22][70] = "Army 3 Shadow"
    Grid[22][71] = "Shadow Stronghold 1"
    Grid[22][72] = "Shadow Stronghold 1"
    Grid[22][73] = "Shadow Stronghold 1"
    Grid[22][74] = "Shadow Stronghold 1"
    Grid[22][75] = "Shadow Stronghold 1"
    Grid[22][76] = "Shadow Stronghold 1"
    Grid[22][77] = "Shadow Stronghold 1"
    Grid[22][78] = "Shadow Stronghold 1"
    Grid[22][79] = "Shadow Stronghold 2"
    Grid[22][80] = "Shadow Stronghold 2"
    Grid[22][81] = "Shadow Stronghold 2"
    Grid[22][82] = "Shadow Stronghold 2"
    Grid[22][83] = "Shadow Stronghold 2"
    Grid[22][84] = "Shadow Stronghold 2"
    Grid[22][85] = "Shadow Stronghold 2"
    Grid[22][86] = "Shadow Stronghold 2"
    Grid[23][23] = "Army 1 Free Peoples"
    Grid[23][24] = "Army 1 Free Peoples"
    Grid[23][25] = "Army 1 Free Peoples"
    Grid[23][26] = "Army 1 Free Peoples"
    Grid[23][27] = "Army 1 Free Peoples"
    Grid[23][28] = "Army 1 Free Peoples"
    Grid[23][29] = "Army 1 Free Peoples"
    Grid[23][30] = "Army 1 Free Peoples"
    Grid[23][31] = "Army 1 Shadow"
    Grid[23][32] = "Army 1 Shadow"
    Grid[23][33] = "Army 1 Shadow"
    Grid[23][34] = "Army 1 Shadow"
    Grid[23][35] = "Army 1 Shadow"
    Grid[23][36] = "Army 1 Shadow"
    Grid[23][37] = "Army 1 Shadow"
    Grid[23][38] = "Army 1 Shadow"
    Grid[23][39] = "Army 2 Free Peoples"
    Grid[23][40] = "Army 2 Free Peoples"
    Grid[23][41] = "Army 2 Free Peoples"
    Grid[23][42] = "Army 2 Free Peoples"
    Grid[23][43] = "Army 2 Free Peoples"
    Grid[23][44] = "Army 2 Free Peoples"
    Grid[23][45] = "Army 2 Free Peoples"
    Grid[23][46] = "Army 2 Free Peoples"
    Grid[23][47] = "Army 2 Shadow"
    Grid[23][48] = "Army 2 Shadow"
    Grid[23][49] = "Army 2 Shadow"
    Grid[23][50] = "Army 2 Shadow"
    Grid[23][51] = "Army 2 Shadow"
    Grid[23][52] = "Army 2 Shadow"
    Grid[23][53] = "Army 2 Shadow"
    Grid[23][54] = "Army 2 Shadow"
    Grid[23][55] = "Army 3 Free Peoples"
    Grid[23][56] = "Army 3 Free Peoples"
    Grid[23][57] = "Army 3 Free Peoples"
    Grid[23][58] = "Army 3 Free Peoples"
    Grid[23][59] = "Army 3 Free Peoples"
    Grid[23][60] = "Army 3 Free Peoples"
    Grid[23][61] = "Army 3 Free Peoples"
    Grid[23][62] = "Army 3 Free Peoples"
    Grid[23][63] = "Army 3 Shadow"
    Grid[23][64] = "Army 3 Shadow"
    Grid[23][65] = "Army 3 Shadow"
    Grid[23][66] = "Army 3 Shadow"
    Grid[23][67] = "Army 3 Shadow"
    Grid[23][68] = "Army 3 Shadow"
    Grid[23][69] = "Army 3 Shadow"
    Grid[23][70] = "Army 3 Shadow"
    Grid[23][71] = "Shadow Stronghold 1"
    Grid[23][72] = "Shadow Stronghold 1"
    Grid[23][73] = "Shadow Stronghold 1"
    Grid[23][74] = "Shadow Stronghold 1"
    Grid[23][75] = "Shadow Stronghold 1"
    Grid[23][76] = "Shadow Stronghold 1"
    Grid[23][77] = "Shadow Stronghold 1"
    Grid[23][78] = "Shadow Stronghold 1"
    Grid[23][79] = "Shadow Stronghold 2"
    Grid[23][80] = "Shadow Stronghold 2"
    Grid[23][81] = "Shadow Stronghold 2"
    Grid[23][82] = "Shadow Stronghold 2"
    Grid[23][83] = "Shadow Stronghold 2"
    Grid[23][84] = "Shadow Stronghold 2"
    Grid[23][85] = "Shadow Stronghold 2"
    Grid[23][86] = "Shadow Stronghold 2"
    Grid[24][23] = "Army 1 Free Peoples"
    Grid[24][24] = "Army 1 Free Peoples"
    Grid[24][25] = "Army 1 Free Peoples"
    Grid[24][26] = "Army 1 Free Peoples"
    Grid[24][27] = "Army 1 Free Peoples"
    Grid[24][28] = "Army 1 Free Peoples"
    Grid[24][29] = "Army 1 Free Peoples"
    Grid[24][30] = "Army 1 Free Peoples"
    Grid[24][31] = "Army 1 Shadow"
    Grid[24][32] = "Army 1 Shadow"
    Grid[24][33] = "Army 1 Shadow"
    Grid[24][34] = "Army 1 Shadow"
    Grid[24][35] = "Army 1 Shadow"
    Grid[24][36] = "Army 1 Shadow"
    Grid[24][37] = "Army 1 Shadow"
    Grid[24][38] = "Army 1 Shadow"
    Grid[24][39] = "Army 2 Free Peoples"
    Grid[24][40] = "Army 2 Free Peoples"
    Grid[24][41] = "Army 2 Free Peoples"
    Grid[24][42] = "Army 2 Free Peoples"
    Grid[24][43] = "Army 2 Free Peoples"
    Grid[24][44] = "Army 2 Free Peoples"
    Grid[24][45] = "Army 2 Free Peoples"
    Grid[24][46] = "Army 2 Free Peoples"
    Grid[24][47] = "Army 2 Shadow"
    Grid[24][48] = "Army 2 Shadow"
    Grid[24][49] = "Army 2 Shadow"
    Grid[24][50] = "Army 2 Shadow"
    Grid[24][51] = "Army 2 Shadow"
    Grid[24][52] = "Army 2 Shadow"
    Grid[24][53] = "Army 2 Shadow"
    Grid[24][54] = "Army 2 Shadow"
    Grid[24][55] = "Army 3 Free Peoples"
    Grid[24][56] = "Army 3 Free Peoples"
    Grid[24][57] = "Army 3 Free Peoples"
    Grid[24][58] = "Army 3 Free Peoples"
    Grid[24][59] = "Army 3 Free Peoples"
    Grid[24][60] = "Army 3 Free Peoples"
    Grid[24][61] = "Army 3 Free Peoples"
    Grid[24][62] = "Army 3 Free Peoples"
    Grid[24][63] = "Army 3 Shadow"
    Grid[24][64] = "Army 3 Shadow"
    Grid[24][65] = "Army 3 Shadow"
    Grid[24][66] = "Army 3 Shadow"
    Grid[24][67] = "Army 3 Shadow"
    Grid[24][68] = "Army 3 Shadow"
    Grid[24][69] = "Army 3 Shadow"
    Grid[24][70] = "Army 3 Shadow"
    Grid[24][71] = "Shadow Stronghold 1"
    Grid[24][72] = "Shadow Stronghold 1"
    Grid[24][73] = "Shadow Stronghold 1"
    Grid[24][74] = "Shadow Stronghold 1"
    Grid[24][75] = "Shadow Stronghold 1"
    Grid[24][76] = "Shadow Stronghold 1"
    Grid[24][77] = "Shadow Stronghold 1"
    Grid[24][78] = "Shadow Stronghold 1"
    Grid[24][79] = "Shadow Stronghold 2"
    Grid[24][80] = "Shadow Stronghold 2"
    Grid[24][81] = "Shadow Stronghold 2"
    Grid[24][82] = "Shadow Stronghold 2"
    Grid[24][83] = "Shadow Stronghold 2"
    Grid[24][84] = "Shadow Stronghold 2"
    Grid[24][85] = "Shadow Stronghold 2"
    Grid[24][86] = "Shadow Stronghold 2"
    Grid[25][23] = "Army 1 Free Peoples"
    Grid[25][24] = "Army 1 Free Peoples"
    Grid[25][25] = "Army 1 Free Peoples"
    Grid[25][26] = "Army 1 Free Peoples"
    Grid[25][27] = "Army 1 Free Peoples"
    Grid[25][28] = "Army 1 Free Peoples"
    Grid[25][29] = "Army 1 Free Peoples"
    Grid[25][30] = "Army 1 Free Peoples"
    Grid[25][31] = "Army 1 Shadow"
    Grid[25][32] = "Army 1 Shadow"
    Grid[25][33] = "Army 1 Shadow"
    Grid[25][34] = "Army 1 Shadow"
    Grid[25][35] = "Army 1 Shadow"
    Grid[25][36] = "Army 1 Shadow"
    Grid[25][37] = "Army 1 Shadow"
    Grid[25][38] = "Army 1 Shadow"
    Grid[25][39] = "Army 2 Free Peoples"
    Grid[25][40] = "Army 2 Free Peoples"
    Grid[25][41] = "Army 2 Free Peoples"
    Grid[25][42] = "Army 2 Free Peoples"
    Grid[25][43] = "Army 2 Free Peoples"
    Grid[25][44] = "Army 2 Free Peoples"
    Grid[25][45] = "Army 2 Free Peoples"
    Grid[25][46] = "Army 2 Free Peoples"
    Grid[25][47] = "Army 2 Shadow"
    Grid[25][48] = "Army 2 Shadow"
    Grid[25][49] = "Army 2 Shadow"
    Grid[25][50] = "Army 2 Shadow"
    Grid[25][51] = "Army 2 Shadow"
    Grid[25][52] = "Army 2 Shadow"
    Grid[25][53] = "Army 2 Shadow"
    Grid[25][54] = "Army 2 Shadow"
    Grid[25][55] = "Army 3 Free Peoples"
    Grid[25][56] = "Army 3 Free Peoples"
    Grid[25][57] = "Army 3 Free Peoples"
    Grid[25][58] = "Army 3 Free Peoples"
    Grid[25][59] = "Army 3 Free Peoples"
    Grid[25][60] = "Army 3 Free Peoples"
    Grid[25][61] = "Army 3 Free Peoples"
    Grid[25][62] = "Army 3 Free Peoples"
    Grid[25][63] = "Army 3 Shadow"
    Grid[25][64] = "Army 3 Shadow"
    Grid[25][65] = "Army 3 Shadow"
    Grid[25][66] = "Army 3 Shadow"
    Grid[25][67] = "Army 3 Shadow"
    Grid[25][68] = "Army 3 Shadow"
    Grid[25][69] = "Army 3 Shadow"
    Grid[25][70] = "Army 3 Shadow"
    Grid[25][71] = "Shadow Stronghold 1"
    Grid[25][72] = "Shadow Stronghold 1"
    Grid[25][73] = "Shadow Stronghold 1"
    Grid[25][74] = "Shadow Stronghold 1"
    Grid[25][75] = "Shadow Stronghold 1"
    Grid[25][76] = "Shadow Stronghold 1"
    Grid[25][77] = "Shadow Stronghold 1"
    Grid[25][78] = "Shadow Stronghold 1"
    Grid[25][79] = "Shadow Stronghold 2"
    Grid[25][80] = "Shadow Stronghold 2"
    Grid[25][81] = "Shadow Stronghold 2"
    Grid[25][82] = "Shadow Stronghold 2"
    Grid[25][83] = "Shadow Stronghold 2"
    Grid[25][84] = "Shadow Stronghold 2"
    Grid[25][85] = "Shadow Stronghold 2"
    Grid[25][86] = "Shadow Stronghold 2"
    Grid[26][23] = "Army 1 Free Peoples"
    Grid[26][24] = "Army 1 Free Peoples"
    Grid[26][25] = "Army 1 Free Peoples"
    Grid[26][26] = "Army 1 Free Peoples"
    Grid[26][27] = "Army 1 Free Peoples"
    Grid[26][28] = "Army 1 Free Peoples"
    Grid[26][29] = "Army 1 Free Peoples"
    Grid[26][30] = "Army 1 Free Peoples"
    Grid[26][31] = "Army 1 Shadow"
    Grid[26][32] = "Army 1 Shadow"
    Grid[26][33] = "Army 1 Shadow"
    Grid[26][34] = "Army 1 Shadow"
    Grid[26][35] = "Army 1 Shadow"
    Grid[26][36] = "Army 1 Shadow"
    Grid[26][37] = "Army 1 Shadow"
    Grid[26][38] = "Army 1 Shadow"
    Grid[26][39] = "Army 2 Free Peoples"
    Grid[26][40] = "Army 2 Free Peoples"
    Grid[26][41] = "Army 2 Free Peoples"
    Grid[26][42] = "Army 2 Free Peoples"
    Grid[26][43] = "Army 2 Free Peoples"
    Grid[26][44] = "Army 2 Free Peoples"
    Grid[26][45] = "Army 2 Free Peoples"
    Grid[26][46] = "Army 2 Free Peoples"
    Grid[26][47] = "Army 2 Shadow"
    Grid[26][48] = "Army 2 Shadow"
    Grid[26][49] = "Army 2 Shadow"
    Grid[26][50] = "Army 2 Shadow"
    Grid[26][51] = "Army 2 Shadow"
    Grid[26][52] = "Army 2 Shadow"
    Grid[26][53] = "Army 2 Shadow"
    Grid[26][54] = "Army 2 Shadow"
    Grid[26][55] = "Army 3 Free Peoples"
    Grid[26][56] = "Army 3 Free Peoples"
    Grid[26][57] = "Army 3 Free Peoples"
    Grid[26][58] = "Army 3 Free Peoples"
    Grid[26][59] = "Army 3 Free Peoples"
    Grid[26][60] = "Army 3 Free Peoples"
    Grid[26][61] = "Army 3 Free Peoples"
    Grid[26][62] = "Army 3 Free Peoples"
    Grid[26][63] = "Army 3 Shadow"
    Grid[26][64] = "Army 3 Shadow"
    Grid[26][65] = "Army 3 Shadow"
    Grid[26][66] = "Army 3 Shadow"
    Grid[26][67] = "Army 3 Shadow"
    Grid[26][68] = "Army 3 Shadow"
    Grid[26][69] = "Army 3 Shadow"
    Grid[26][70] = "Army 3 Shadow"
    Grid[26][71] = "Shadow Stronghold 1"
    Grid[26][72] = "Shadow Stronghold 1"
    Grid[26][73] = "Shadow Stronghold 1"
    Grid[26][74] = "Shadow Stronghold 1"
    Grid[26][75] = "Shadow Stronghold 1"
    Grid[26][76] = "Shadow Stronghold 1"
    Grid[26][77] = "Shadow Stronghold 1"
    Grid[26][78] = "Shadow Stronghold 1"
    Grid[26][79] = "Shadow Stronghold 2"
    Grid[26][80] = "Shadow Stronghold 2"
    Grid[26][81] = "Shadow Stronghold 2"
    Grid[26][82] = "Shadow Stronghold 2"
    Grid[26][83] = "Shadow Stronghold 2"
    Grid[26][84] = "Shadow Stronghold 2"
    Grid[26][85] = "Shadow Stronghold 2"
    Grid[26][86] = "Shadow Stronghold 2"
    Grid[30][24] = "Forlindon"
    Grid[30][25] = "Forlindon"
    Grid[30][26] = "Forlindon"
    Grid[30][27] = "Forlindon"
    Grid[31][22] = "Forlindon"
    Grid[31][23] = "Forlindon"
    Grid[31][24] = "Forlindon"
    Grid[31][25] = "Forlindon"
    Grid[31][26] = "Forlindon"
    Grid[31][27] = "Forlindon"
    Grid[32][20] = "Forlindon"
    Grid[32][21] = "Forlindon"
    Grid[32][22] = "Forlindon"
    Grid[32][23] = "Forlindon"
    Grid[32][24] = "Forlindon"
    Grid[32][25] = "Forlindon"
    Grid[32][26] = "Forlindon"
    Grid[32][27] = "Forlindon"
    Grid[32][31] = "Harlindon"
    Grid[32][32] = "Harlindon"
    Grid[32][33] = "Harlindon"
    Grid[32][34] = "Harlindon"
    Grid[32][35] = "Harlindon"
    Grid[32][36] = "Harlindon"
    Grid[32][37] = "Harlindon"
    Grid[33][19] = "Forlindon"
    Grid[33][20] = "Forlindon"
    Grid[33][21] = "Forlindon"
    Grid[33][22] = "Forlindon"
    Grid[33][23] = "Forlindon"
    Grid[33][24] = "Forlindon"
    Grid[33][25] = "Forlindon"
    Grid[33][30] = "Harlindon"
    Grid[33][31] = "Harlindon"
    Grid[33][32] = "Harlindon"
    Grid[33][33] = "Harlindon"
    Grid[33][34] = "Harlindon"
    Grid[33][35] = "Harlindon"
    Grid[33][36] = "Harlindon"
    Grid[33][37] = "Harlindon"
    Grid[34][18] = "Forlindon"
    Grid[34][19] = "Forlindon"
    Grid[34][20] = "Forlindon"
    Grid[34][21] = "Forlindon"
    Grid[34][22] = "Forlindon"
    Grid[34][23] = "Forlindon"
    Grid[34][24] = "Forlindon"
    Grid[34][25] = "Forlindon"
    Grid[34][31] = "Harlindon"
    Grid[34][32] = "Harlindon"
    Grid[34][33] = "Harlindon"
    Grid[34][34] = "Harlindon"
    Grid[34][35] = "Harlindon"
    Grid[34][36] = "Harlindon"
    Grid[34][37] = "Harlindon"
    Grid[35][16] = "Forlindon"
    Grid[35][17] = "Forlindon"
    Grid[35][18] = "Forlindon"
    Grid[35][19] = "Forlindon"
    Grid[35][20] = "Forlindon"
    Grid[35][21] = "Forlindon"
    Grid[35][22] = "Forlindon"
    Grid[35][23] = "Forlindon"
    Grid[35][24] = "Forlindon"
    Grid[35][25] = "Forlindon"
    Grid[35][30] = "Harlindon"
    Grid[35][31] = "Harlindon"
    Grid[35][32] = "Harlindon"
    Grid[35][33] = "Harlindon"
    Grid[35][34] = "Harlindon"
    Grid[35][35] = "Harlindon"
    Grid[35][36] = "Harlindon"
    Grid[35][37] = "Harlindon"
    Grid[35][38] = "Harlindon"
    Grid[35][39] = "Harlindon"
    Grid[35][40] = "Harlindon"
    Grid[35][41] = "Harlindon"
    Grid[36][15] = "Forlindon"
    Grid[36][16] = "Forlindon"
    Grid[36][17] = "Forlindon"
    Grid[36][18] = "Forlindon"
    Grid[36][19] = "Forlindon"
    Grid[36][20] = "Forlindon"
    Grid[36][21] = "Forlindon"
    Grid[36][22] = "Grey Havens"
    Grid[36][23] = "Grey Havens"
    Grid[36][24] = "Grey Havens"
    Grid[36][25] = "Grey Havens"
    Grid[36][26] = "Grey Havens"
    Grid[36][30] = "Harlindon"
    Grid[36][31] = "Harlindon"
    Grid[36][32] = "Harlindon"
    Grid[36][33] = "Harlindon"
    Grid[36][34] = "Harlindon"
    Grid[36][35] = "Harlindon"
    Grid[36][36] = "Harlindon"
    Grid[36][37] = "Harlindon"
    Grid[36][38] = "Harlindon"
    Grid[36][39] = "Harlindon"
    Grid[36][40] = "Harlindon"
    Grid[36][41] = "Harlindon"
    Grid[36][42] = "Harlindon"
    Grid[37][15] = "Forlindon"
    Grid[37][16] = "Forlindon"
    Grid[37][17] = "Forlindon"
    Grid[37][18] = "Forlindon"
    Grid[37][19] = "Forlindon"
    Grid[37][20] = "Forlindon"
    Grid[37][21] = "Grey Havens"
    Grid[37][22] = "Grey Havens"
    Grid[37][23] = "Grey Havens"
    Grid[37][24] = "Grey Havens"
    Grid[37][25] = "Grey Havens"
    Grid[37][26] = "Grey Havens"
    Grid[37][30] = "Harlindon"
    Grid[37][31] = "Harlindon"
    Grid[37][32] = "Harlindon"
    Grid[37][33] = "Harlindon"
    Grid[37][34] = "Harlindon"
    Grid[37][35] = "Harlindon"
    Grid[37][36] = "Harlindon"
    Grid[37][37] = "Harlindon"
    Grid[37][38] = "Harlindon"
    Grid[37][39] = "Harlindon"
    Grid[37][40] = "Harlindon"
    Grid[37][41] = "Harlindon"
    Grid[37][42] = "Harlindon"
    Grid[38][13] = "Forlindon"
    Grid[38][14] = "Forlindon"
    Grid[38][15] = "Forlindon"
    Grid[38][16] = "Forlindon"
    Grid[38][17] = "Forlindon"
    Grid[38][18] = "Forlindon"
    Grid[38][19] = "Forlindon"
    Grid[38][20] = "Forlindon"
    Grid[38][21] = "Grey Havens"
    Grid[38][22] = "Grey Havens"
    Grid[38][23] = "Grey Havens"
    Grid[38][24] = "Grey Havens"
    Grid[38][25] = "Grey Havens"
    Grid[38][26] = "Grey Havens"
    Grid[38][29] = "Grey Havens"
    Grid[38][30] = "Grey Havens"
    Grid[38][31] = "Harlindon"
    Grid[38][32] = "Harlindon"
    Grid[38][33] = "Harlindon"
    Grid[38][34] = "Harlindon"
    Grid[38][35] = "Harlindon"
    Grid[38][36] = "Harlindon"
    Grid[38][37] = "Harlindon"
    Grid[38][38] = "Harlindon"
    Grid[38][39] = "Harlindon"
    Grid[38][40] = "Harlindon"
    Grid[38][41] = "Harlindon"
    Grid[38][42] = "Harlindon"
    Grid[39][12] = "Forlindon"
    Grid[39][13] = "Forlindon"
    Grid[39][14] = "Forlindon"
    Grid[39][15] = "Forlindon"
    Grid[39][16] = "Forlindon"
    Grid[39][17] = "Forlindon"
    Grid[39][18] = "Forlindon"
    Grid[39][19] = "Grey Havens"
    Grid[39][20] = "North Ered Luin"
    Grid[39][21] = "Ered Luin"
    Grid[39][22] = "Grey Havens"
    Grid[39][23] = "Grey Havens"
    Grid[39][24] = "Grey Havens"
    Grid[39][25] = "Grey Havens"
    Grid[39][26] = "Grey Havens"
    Grid[39][29] = "Grey Havens"
    Grid[39][30] = "Grey Havens"
    Grid[39][31] = "Grey Havens"
    Grid[39][32] = "Grey Havens"
    Grid[39][33] = "Grey Havens"
    Grid[39][34] = "Grey Havens"
    Grid[39][35] = "Grey Havens"
    Grid[39][36] = "Harlindon"
    Grid[39][37] = "Harlindon"
    Grid[39][38] = "Harlindon"
    Grid[39][39] = "Harlindon"
    Grid[39][40] = "Harlindon"
    Grid[39][41] = "Harlindon"
    Grid[39][42] = "South Ered Luin"
    Grid[40][11] = "Forlindon"
    Grid[40][12] = "Forlindon"
    Grid[40][13] = "Forlindon"
    Grid[40][14] = "Forlindon"
    Grid[40][15] = "Forlindon"
    Grid[40][16] = "Forlindon"
    Grid[40][17] = "Ered Luin"
    Grid[40][18] = "Ered Luin"
    Grid[40][19] = "Ered Luin"
    Grid[40][20] = "Ered Luin"
    Grid[40][21] = "Ered Luin"
    Grid[40][22] = "Grey Havens"
    Grid[40][23] = "Grey Havens"
    Grid[40][24] = "Grey Havens"
    Grid[40][25] = "Grey Havens"
    Grid[40][28] = "Grey Havens"
    Grid[40][29] = "Grey Havens"
    Grid[40][30] = "Grey Havens"
    Grid[40][31] = "Grey Havens"
    Grid[40][32] = "Grey Havens"
    Grid[40][33] = "Grey Havens"
    Grid[40][34] = "Grey Havens"
    Grid[40][35] = "Tower Hills"
    Grid[40][36] = "Harlindon"
    Grid[40][37] = "Harlindon"
    Grid[40][38] = "Harlindon"
    Grid[40][39] = "Harlindon"
    Grid[40][40] = "Harlindon"
    Grid[40][41] = "Harlindon"
    Grid[40][42] = "South Ered Luin"
    Grid[41][11] = "Forlindon"
    Grid[41][12] = "Forlindon"
    Grid[41][13] = "Forlindon"
    Grid[41][14] = "Forlindon"
    Grid[41][15] = "Forlindon"
    Grid[41][16] = "Ered Luin"
    Grid[41][17] = "Grey Havens"
    Grid[41][18] = "Grey Havens"
    Grid[41][19] = "Grey Havens"
    Grid[41][20] = "Ered Luin"
    Grid[41][21] = "Ered Luin"
    Grid[41][22] = "Grey Havens"
    Grid[41][23] = "Grey Havens"
    Grid[41][24] = "Grey Havens"
    Grid[41][25] = "Grey Havens"
    Grid[41][26] = "Grey Havens"
    Grid[41][27] = "Grey Havens"
    Grid[41][28] = "Grey Havens"
    Grid[41][29] = "Grey Havens"
    Grid[41][30] = "Grey Havens"
    Grid[41][31] = "Grey Havens"
    Grid[41][32] = "Grey Havens"
    Grid[41][33] = "Grey Havens"
    Grid[41][34] = "Tower Hills"
    Grid[41][35] = "Tower Hills"
    Grid[41][36] = "Tower Hills"
    Grid[41][37] = "Harlindon"
    Grid[41][38] = "Harlindon"
    Grid[41][39] = "Harlindon"
    Grid[41][40] = "Harlindon"
    Grid[41][41] = "Harlindon"
    Grid[41][42] = "South Ered Luin"
    Grid[41][43] = "South Ered Luin"
    Grid[42][10] = "North Ered Luin"
    Grid[42][11] = "North Ered Luin"
    Grid[42][12] = "North Ered Luin"
    Grid[42][13] = "North Ered Luin"
    Grid[42][14] = "Ered Luin"
    Grid[42][15] = "Ered Luin"
    Grid[42][16] = "Ered Luin"
    Grid[42][17] = "Grey Havens"
    Grid[42][18] = "Grey Havens"
    Grid[42][19] = "Grey Havens"
    Grid[42][20] = "Ered Luin"
    Grid[42][21] = "Ered Luin"
    Grid[42][22] = "Grey Havens"
    Grid[42][23] = "Grey Havens"
    Grid[42][24] = "Grey Havens"
    Grid[42][25] = "Grey Havens"
    Grid[42][26] = "Grey Havens"
    Grid[42][27] = "Grey Havens"
    Grid[42][28] = "Grey Havens"
    Grid[42][29] = "Grey Havens"
    Grid[42][30] = "Grey Havens"
    Grid[42][31] = "Grey Havens"
    Grid[42][32] = "Grey Havens"
    Grid[42][33] = "Tower Hills"
    Grid[42][34] = "Tower Hills"
    Grid[42][35] = "Tower Hills"
    Grid[42][36] = "Tower Hills"
    Grid[42][37] = "Tower Hills"
    Grid[42][38] = "Harlindon"
    Grid[42][39] = "Harlindon"
    Grid[42][40] = "Harlindon"
    Grid[42][41] = "Harlindon"
    Grid[42][42] = "South Ered Luin"
    Grid[42][43] = "South Ered Luin"
    Grid[42][44] = "South Ered Luin"
    Grid[42][45] = "South Ered Luin"
    Grid[43][9] = "North Ered Luin"
    Grid[43][10] = "North Ered Luin"
    Grid[43][11] = "North Ered Luin"
    Grid[43][12] = "North Ered Luin"
    Grid[43][13] = "North Ered Luin"
    Grid[43][14] = "North Ered Luin"
    Grid[43][15] = "Ered Luin"
    Grid[43][16] = "Ered Luin"
    Grid[43][17] = "Ered Luin"
    Grid[43][18] = "Ered Luin"
    Grid[43][19] = "Ered Luin"
    Grid[43][20] = "Ered Luin"
    Grid[43][21] = "Ered Luin"
    Grid[43][22] = "Ered Luin"
    Grid[43][23] = "Grey Havens"
    Grid[43][24] = "Grey Havens"
    Grid[43][25] = "Grey Havens"
    Grid[43][26] = "Grey Havens"
    Grid[43][27] = "Grey Havens"
    Grid[43][28] = "Grey Havens"
    Grid[43][29] = "Grey Havens"
    Grid[43][30] = "Grey Havens"
    Grid[43][31] = "Grey Havens"
    Grid[43][32] = "Tower Hills"
    Grid[43][33] = "Tower Hills"
    Grid[43][34] = "Tower Hills"
    Grid[43][35] = "Tower Hills"
    Grid[43][36] = "Tower Hills"
    Grid[43][37] = "Tower Hills"
    Grid[43][38] = "Tower Hills"
    Grid[43][39] = "South Ered Luin"
    Grid[43][40] = "South Ered Luin"
    Grid[43][41] = "South Ered Luin"
    Grid[43][42] = "South Ered Luin"
    Grid[43][43] = "South Ered Luin"
    Grid[43][44] = "South Ered Luin"
    Grid[43][45] = "South Ered Luin"
    Grid[44][8] = "North Ered Luin"
    Grid[44][9] = "North Ered Luin"
    Grid[44][10] = "North Ered Luin"
    Grid[44][11] = "North Ered Luin"
    Grid[44][12] = "North Ered Luin"
    Grid[44][13] = "North Ered Luin"
    Grid[44][14] = "North Ered Luin"
    Grid[44][15] = "North Ered Luin"
    Grid[44][16] = "North Ered Luin"
    Grid[44][17] = "Ered Luin"
    Grid[44][18] = "Ered Luin"
    Grid[44][19] = "Ered Luin"
    Grid[44][20] = "Ered Luin"
    Grid[44][21] = "Ered Luin"
    Grid[44][22] = "Ered Luin"
    Grid[44][23] = "Grey Havens"
    Grid[44][24] = "Grey Havens"
    Grid[44][25] = "Grey Havens"
    Grid[44][26] = "Grey Havens"
    Grid[44][27] = "Grey Havens"
    Grid[44][28] = "Grey Havens"
    Grid[44][29] = "Grey Havens"
    Grid[44][30] = "Grey Havens"
    Grid[44][31] = "Grey Havens"
    Grid[44][32] = "Tower Hills"
    Grid[44][33] = "Tower Hills"
    Grid[44][34] = "Tower Hills"
    Grid[44][35] = "Tower Hills"
    Grid[44][36] = "Tower Hills"
    Grid[44][37] = "South Ered Luin"
    Grid[44][38] = "South Ered Luin"
    Grid[44][39] = "South Ered Luin"
    Grid[44][40] = "South Ered Luin"
    Grid[44][41] = "South Ered Luin"
    Grid[44][42] = "South Ered Luin"
    Grid[44][43] = "South Ered Luin"
    Grid[44][44] = "South Ered Luin"
    Grid[44][88] = "Andrast"
    Grid[44][89] = "Andrast"
    Grid[44][90] = "Andrast"
    Grid[45][8] = "North Ered Luin"
    Grid[45][9] = "North Ered Luin"
    Grid[45][10] = "North Ered Luin"
    Grid[45][11] = "North Ered Luin"
    Grid[45][12] = "North Ered Luin"
    Grid[45][13] = "North Ered Luin"
    Grid[45][14] = "North Ered Luin"
    Grid[45][15] = "North Ered Luin"
    Grid[45][16] = "North Ered Luin"
    Grid[45][17] = "Ered Luin"
    Grid[45][18] = "Ered Luin"
    Grid[45][19] = "Ered Luin"
    Grid[45][20] = "Ered Luin"
    Grid[45][21] = "Ered Luin"
    Grid[45][22] = "Ered Luin"
    Grid[45][23] = "Grey Havens"
    Grid[45][24] = "Grey Havens"
    Grid[45][25] = "Tower Hills"
    Grid[45][26] = "Tower Hills"
    Grid[45][27] = "Tower Hills"
    Grid[45][28] = "Grey Havens"
    Grid[45][29] = "Grey Havens"
    Grid[45][30] = "Grey Havens"
    Grid[45][31] = "Tower Hills"
    Grid[45][32] = "Tower Hills"
    Grid[45][33] = "Tower Hills"
    Grid[45][34] = "Tower Hills"
    Grid[45][35] = "Tower Hills"
    Grid[45][36] = "Tower Hills"
    Grid[45][37] = "South Ered Luin"
    Grid[45][38] = "South Ered Luin"
    Grid[45][39] = "South Ered Luin"
    Grid[45][40] = "South Ered Luin"
    Grid[45][41] = "South Ered Luin"
    Grid[45][42] = "South Ered Luin"
    Grid[45][43] = "South Ered Luin"
    Grid[45][46] = "Minbiriath"
    Grid[45][47] = "Minbiriath"
    Grid[45][48] = "Minbiriath"
    Grid[45][49] = "Minbiriath"
    Grid[45][50] = "Minbiriath"
    Grid[45][88] = "Andrast"
    Grid[45][89] = "Andrast"
    Grid[45][90] = "Andrast"
    Grid[46][8] = "North Ered Luin"
    Grid[46][9] = "North Ered Luin"
    Grid[46][10] = "North Ered Luin"
    Grid[46][11] = "North Ered Luin"
    Grid[46][12] = "North Ered Luin"
    Grid[46][13] = "North Ered Luin"
    Grid[46][14] = "North Ered Luin"
    Grid[46][15] = "North Ered Luin"
    Grid[46][16] = "North Ered Luin"
    Grid[46][17] = "Ered Luin"
    Grid[46][18] = "Ered Luin"
    Grid[46][19] = "Ered Luin"
    Grid[46][20] = "Ered Luin"
    Grid[46][21] = "Tower Hills"
    Grid[46][22] = "Tower Hills"
    Grid[46][23] = "Tower Hills"
    Grid[46][24] = "Tower Hills"
    Grid[46][25] = "Tower Hills"
    Grid[46][26] = "Tower Hills"
    Grid[46][27] = "Tower Hills"
    Grid[46][28] = "Tower Hills"
    Grid[46][29] = "Tower Hills"
    Grid[46][30] = "Tower Hills"
    Grid[46][31] = "Tower Hills"
    Grid[46][32] = "Tower Hills"
    Grid[46][33] = "Tower Hills"
    Grid[46][34] = "Tower Hills"
    Grid[46][35] = "Tower Hills"
    Grid[46][36] = "South Ered Luin"
    Grid[46][37] = "South Ered Luin"
    Grid[46][38] = "South Ered Luin"
    Grid[46][39] = "South Ered Luin"
    Grid[46][40] = "South Ered Luin"
    Grid[46][41] = "South Ered Luin"
    Grid[46][42] = "Minbiriath"
    Grid[46][43] = "Minbiriath"
    Grid[46][44] = "Minbiriath"
    Grid[46][45] = "Minbiriath"
    Grid[46][46] = "Minbiriath"
    Grid[46][47] = "Minbiriath"
    Grid[46][48] = "Minbiriath"
    Grid[46][49] = "Minbiriath"
    Grid[46][50] = "Minbiriath"
    Grid[46][87] = "Andrast"
    Grid[46][88] = "Andrast"
    Grid[46][89] = "Andrast"
    Grid[46][90] = "Andrast"
    Grid[47][8] = "North Ered Luin"
    Grid[47][9] = "North Ered Luin"
    Grid[47][10] = "North Ered Luin"
    Grid[47][11] = "North Ered Luin"
    Grid[47][12] = "North Ered Luin"
    Grid[47][13] = "North Ered Luin"
    Grid[47][14] = "North Ered Luin"
    Grid[47][15] = "North Ered Luin"
    Grid[47][16] = "North Ered Luin"
    Grid[47][17] = "Ered Luin"
    Grid[47][18] = "Evendim"
    Grid[47][19] = "Evendim"
    Grid[47][20] = "Tower Hills"
    Grid[47][21] = "Tower Hills"
    Grid[47][22] = "Tower Hills"
    Grid[47][23] = "Tower Hills"
    Grid[47][24] = "Tower Hills"
    Grid[47][25] = "Tower Hills"
    Grid[47][26] = "Tower Hills"
    Grid[47][27] = "Tower Hills"
    Grid[47][28] = "Tower Hills"
    Grid[47][29] = "Tower Hills"
    Grid[47][30] = "Tower Hills"
    Grid[47][31] = "Tower Hills"
    Grid[47][32] = "Tower Hills"
    Grid[47][33] = "Tower Hills"
    Grid[47][34] = "Tower Hills"
    Grid[47][35] = "South Ered Luin"
    Grid[47][36] = "South Ered Luin"
    Grid[47][37] = "South Ered Luin"
    Grid[47][38] = "South Ered Luin"
    Grid[47][39] = "Minbiriath"
    Grid[47][40] = "Minbiriath"
    Grid[47][41] = "Minbiriath"
    Grid[47][42] = "Minbiriath"
    Grid[47][43] = "Minbiriath"
    Grid[47][44] = "Minbiriath"
    Grid[47][45] = "Minbiriath"
    Grid[47][46] = "Minbiriath"
    Grid[47][47] = "Minbiriath"
    Grid[47][48] = "Minbiriath"
    Grid[47][86] = "Andrast"
    Grid[47][87] = "Andrast"
    Grid[47][88] = "Andrast"
    Grid[47][89] = "Andrast"
    Grid[47][90] = "Andrast"
    Grid[48][8] = "North Ered Luin"
    Grid[48][9] = "North Ered Luin"
    Grid[48][10] = "North Ered Luin"
    Grid[48][11] = "North Ered Luin"
    Grid[48][12] = "North Ered Luin"
    Grid[48][13] = "North Ered Luin"
    Grid[48][14] = "North Ered Luin"
    Grid[48][15] = "Evendim"
    Grid[48][16] = "Evendim"
    Grid[48][17] = "Evendim"
    Grid[48][18] = "Evendim"
    Grid[48][19] = "Evendim"
    Grid[48][20] = "Evendim"
    Grid[48][21] = "Tower Hills"
    Grid[48][22] = "Tower Hills"
    Grid[48][23] = "Tower Hills"
    Grid[48][24] = "Tower Hills"
    Grid[48][25] = "Tower Hills"
    Grid[48][26] = "Tower Hills"
    Grid[48][27] = "Tower Hills"
    Grid[48][28] = "Tower Hills"
    Grid[48][29] = "Tower Hills"
    Grid[48][30] = "Tower Hills"
    Grid[48][31] = "Tower Hills"
    Grid[48][32] = "Tower Hills"
    Grid[48][33] = "South Ered Luin"
    Grid[48][34] = "South Ered Luin"
    Grid[48][35] = "South Ered Luin"
    Grid[48][36] = "South Ered Luin"
    Grid[48][37] = "South Ered Luin"
    Grid[48][38] = "South Ered Luin"
    Grid[48][39] = "Minbiriath"
    Grid[48][40] = "Minbiriath"
    Grid[48][41] = "Minbiriath"
    Grid[48][42] = "Minbiriath"
    Grid[48][43] = "Minbiriath"
    Grid[48][44] = "Minbiriath"
    Grid[48][45] = "Minbiriath"
    Grid[48][46] = "Minbiriath"
    Grid[48][47] = "Minbiriath"
    Grid[48][52] = "Minbiriath"
    Grid[48][86] = "Andrast"
    Grid[48][87] = "Andrast"
    Grid[48][88] = "Andrast"
    Grid[48][89] = "Andrast"
    Grid[49][1] = "Arnor"
    Grid[49][2] = "Arnor"
    Grid[49][8] = "Evendim"
    Grid[49][9] = "Evendim"
    Grid[49][10] = "Evendim"
    Grid[49][11] = "Evendim"
    Grid[49][12] = "Evendim"
    Grid[49][13] = "Evendim"
    Grid[49][14] = "Evendim"
    Grid[49][15] = "Evendim"
    Grid[49][16] = "Evendim"
    Grid[49][17] = "Evendim"
    Grid[49][18] = "Evendim"
    Grid[49][19] = "Evendim"
    Grid[49][20] = "Evendim"
    Grid[49][21] = "The Shire"
    Grid[49][22] = "Tower Hills"
    Grid[49][23] = "Tower Hills"
    Grid[49][24] = "Tower Hills"
    Grid[49][25] = "Tower Hills"
    Grid[49][26] = "Tower Hills"
    Grid[49][27] = "Tower Hills"
    Grid[49][28] = "Tower Hills"
    Grid[49][29] = "Tower Hills"
    Grid[49][30] = "Tower Hills"
    Grid[49][31] = "Tower Hills"
    Grid[49][32] = "Tower Hills"
    Grid[49][33] = "South Ered Luin"
    Grid[49][34] = "South Ered Luin"
    Grid[49][35] = "South Ered Luin"
    Grid[49][36] = "South Ered Luin"
    Grid[49][37] = "South Ered Luin"
    Grid[49][38] = "South Ered Luin"
    Grid[49][39] = "Minbiriath"
    Grid[49][40] = "Minbiriath"
    Grid[49][41] = "Minbiriath"
    Grid[49][42] = "Minbiriath"
    Grid[49][43] = "Minbiriath"
    Grid[49][44] = "Minbiriath"
    Grid[49][45] = "Minbiriath"
    Grid[49][46] = "Minbiriath"
    Grid[49][47] = "Minbiriath"
    Grid[49][48] = "Minbiriath"
    Grid[49][49] = "Minbiriath"
    Grid[49][50] = "Minbiriath"
    Grid[49][51] = "Minbiriath"
    Grid[49][52] = "Minbiriath"
    Grid[49][53] = "Minbiriath"
    Grid[49][85] = "Andrast"
    Grid[49][86] = "Andrast"
    Grid[49][87] = "Andrast"
    Grid[49][88] = "Andrast"
    Grid[50][1] = "Arnor"
    Grid[50][2] = "Arnor"
    Grid[50][3] = "Arnor"
    Grid[50][4] = "Arnor"
    Grid[50][5] = "Arnor"
    Grid[50][6] = "Evendim"
    Grid[50][7] = "Evendim"
    Grid[50][8] = "Evendim"
    Grid[50][9] = "Evendim"
    Grid[50][10] = "Evendim"
    Grid[50][11] = "Evendim"
    Grid[50][12] = "Evendim"
    Grid[50][13] = "Evendim"
    Grid[50][14] = "Evendim"
    Grid[50][15] = "Evendim"
    Grid[50][16] = "Evendim"
    Grid[50][17] = "Evendim"
    Grid[50][18] = "Evendim"
    Grid[50][19] = "Evendim"
    Grid[50][20] = "Evendim"
    Grid[50][21] = "The Shire"
    Grid[50][22] = "The Shire"
    Grid[50][23] = "The Shire"
    Grid[50][24] = "The Shire"
    Grid[50][25] = "The Shire"
    Grid[50][26] = "The Shire"
    Grid[50][27] = "Tower Hills"
    Grid[50][28] = "Tower Hills"
    Grid[50][29] = "Tower Hills"
    Grid[50][30] = "South Ered Luin"
    Grid[50][31] = "South Ered Luin"
    Grid[50][32] = "South Ered Luin"
    Grid[50][33] = "South Ered Luin"
    Grid[50][34] = "South Ered Luin"
    Grid[50][35] = "South Ered Luin"
    Grid[50][36] = "South Ered Luin"
    Grid[50][37] = "South Ered Luin"
    Grid[50][38] = "South Ered Luin"
    Grid[50][39] = "South Ered Luin"
    Grid[50][40] = "Minbiriath"
    Grid[50][41] = "Minbiriath"
    Grid[50][42] = "Minbiriath"
    Grid[50][43] = "Minbiriath"
    Grid[50][44] = "Minbiriath"
    Grid[50][45] = "Minbiriath"
    Grid[50][46] = "Minbiriath"
    Grid[50][47] = "Minbiriath"
    Grid[50][48] = "Minbiriath"
    Grid[50][49] = "Minbiriath"
    Grid[50][50] = "Minbiriath"
    Grid[50][51] = "Minbiriath"
    Grid[50][52] = "Minbiriath"
    Grid[50][53] = "Minbiriath"
    Grid[50][54] = "Minbiriath"
    Grid[50][55] = "Minbiriath"
    Grid[50][56] = "Minbiriath"
    Grid[50][84] = "Andrast"
    Grid[50][85] = "Andrast"
    Grid[50][86] = "Andrast"
    Grid[50][87] = "Andrast"
    Grid[50][88] = "Andrast"
    Grid[51][1] = "Arnor"
    Grid[51][2] = "Arnor"
    Grid[51][3] = "Arnor"
    Grid[51][4] = "Arnor"
    Grid[51][5] = "Arnor"
    Grid[51][6] = "Arnor"
    Grid[51][7] = "Evendim"
    Grid[51][8] = "Evendim"
    Grid[51][9] = "Evendim"
    Grid[51][10] = "Evendim"
    Grid[51][11] = "Evendim"
    Grid[51][12] = "Evendim"
    Grid[51][13] = "Evendim"
    Grid[51][14] = "Evendim"
    Grid[51][15] = "Evendim"
    Grid[51][16] = "Evendim"
    Grid[51][17] = "Evendim"
    Grid[51][18] = "Evendim"
    Grid[51][19] = "Evendim"
    Grid[51][20] = "Evendim"
    Grid[51][21] = "The Shire"
    Grid[51][22] = "The Shire"
    Grid[51][23] = "The Shire"
    Grid[51][24] = "The Shire"
    Grid[51][25] = "The Shire"
    Grid[51][26] = "The Shire"
    Grid[51][27] = "The Shire"
    Grid[51][28] = "The Shire"
    Grid[51][29] = "The Shire"
    Grid[51][30] = "South Ered Luin"
    Grid[51][31] = "South Ered Luin"
    Grid[51][32] = "South Ered Luin"
    Grid[51][33] = "South Ered Luin"
    Grid[51][34] = "South Ered Luin"
    Grid[51][35] = "South Ered Luin"
    Grid[51][36] = "South Ered Luin"
    Grid[51][37] = "South Ered Luin"
    Grid[51][38] = "South Ered Luin"
    Grid[51][39] = "South Ered Luin"
    Grid[51][40] = "Minbiriath"
    Grid[51][41] = "Minbiriath"
    Grid[51][42] = "Minbiriath"
    Grid[51][43] = "Minbiriath"
    Grid[51][44] = "Minbiriath"
    Grid[51][45] = "Minbiriath"
    Grid[51][46] = "Minbiriath"
    Grid[51][47] = "Minbiriath"
    Grid[51][48] = "Minbiriath"
    Grid[51][49] = "Minbiriath"
    Grid[51][50] = "Minbiriath"
    Grid[51][51] = "Minbiriath"
    Grid[51][52] = "Minbiriath"
    Grid[51][53] = "Minbiriath"
    Grid[51][54] = "Minbiriath"
    Grid[51][55] = "Minbiriath"
    Grid[51][56] = "Minbiriath"
    Grid[51][82] = "Andrast"
    Grid[51][83] = "Andrast"
    Grid[51][84] = "Andrast"
    Grid[51][85] = "Andrast"
    Grid[51][86] = "Andrast"
    Grid[51][87] = "Andrast"
    Grid[52][1] = "Arnor"
    Grid[52][2] = "Arnor"
    Grid[52][3] = "Arnor"
    Grid[52][4] = "Arnor"
    Grid[52][5] = "Arnor"
    Grid[52][6] = "Arnor"
    Grid[52][7] = "Arnor"
    Grid[52][8] = "Arnor"
    Grid[52][9] = "Evendim"
    Grid[52][10] = "Evendim"
    Grid[52][11] = "Evendim"
    Grid[52][12] = "Evendim"
    Grid[52][13] = "Evendim"
    Grid[52][14] = "Evendim"
    Grid[52][15] = "Evendim"
    Grid[52][16] = "Evendim"
    Grid[52][17] = "Evendim"
    Grid[52][19] = "Evendim"
    Grid[52][20] = "Evendim"
    Grid[52][21] = "The Shire"
    Grid[52][22] = "The Shire"
    Grid[52][23] = "The Shire"
    Grid[52][24] = "The Shire"
    Grid[52][25] = "The Shire"
    Grid[52][26] = "The Shire"
    Grid[52][27] = "The Shire"
    Grid[52][28] = "The Shire"
    Grid[52][29] = "The Shire"
    Grid[52][30] = "South Ered Luin"
    Grid[52][31] = "South Ered Luin"
    Grid[52][32] = "South Ered Luin"
    Grid[52][33] = "South Ered Luin"
    Grid[52][34] = "South Ered Luin"
    Grid[52][35] = "South Ered Luin"
    Grid[52][36] = "Minbiriath"
    Grid[52][37] = "Minbiriath"
    Grid[52][38] = "Minbiriath"
    Grid[52][39] = "Minbiriath"
    Grid[52][40] = "Minbiriath"
    Grid[52][41] = "Minbiriath"
    Grid[52][42] = "Minbiriath"
    Grid[52][43] = "Minbiriath"
    Grid[52][44] = "Minbiriath"
    Grid[52][45] = "Minbiriath"
    Grid[52][46] = "Minbiriath"
    Grid[52][47] = "Minbiriath"
    Grid[52][48] = "Minbiriath"
    Grid[52][49] = "Minbiriath"
    Grid[52][50] = "Minbiriath"
    Grid[52][51] = "Minbiriath"
    Grid[52][52] = "Minbiriath"
    Grid[52][53] = "Minbiriath"
    Grid[52][54] = "Minbiriath"
    Grid[52][55] = "Minbiriath"
    Grid[52][81] = "Andrast"
    Grid[52][82] = "Andrast"
    Grid[52][83] = "Andrast"
    Grid[52][84] = "Andrast"
    Grid[52][85] = "Andrast"
    Grid[52][86] = "Andrast"
    Grid[52][87] = "Andrast"
    Grid[53][1] = "Arnor"
    Grid[53][2] = "Arnor"
    Grid[53][3] = "Arnor"
    Grid[53][4] = "Arnor"
    Grid[53][5] = "Arnor"
    Grid[53][6] = "Arnor"
    Grid[53][7] = "Arnor"
    Grid[53][8] = "Arnor"
    Grid[53][9] = "Arnor"
    Grid[53][10] = "Evendim"
    Grid[53][11] = "Evendim"
    Grid[53][12] = "Evendim"
    Grid[53][13] = "Evendim"
    Grid[53][14] = "Evendim"
    Grid[53][15] = "Evendim"
    Grid[53][16] = "Evendim"
    Grid[53][18] = "Evendim"
    Grid[53][19] = "Evendim"
    Grid[53][20] = "Evendim"
    Grid[53][21] = "The Shire"
    Grid[53][22] = "The Shire"
    Grid[53][23] = "The Shire"
    Grid[53][24] = "The Shire"
    Grid[53][25] = "The Shire"
    Grid[53][26] = "The Shire"
    Grid[53][27] = "The Shire"
    Grid[53][28] = "The Shire"
    Grid[53][29] = "The Shire"
    Grid[53][30] = "South Ered Luin"
    Grid[53][31] = "South Ered Luin"
    Grid[53][32] = "South Ered Luin"
    Grid[53][33] = "South Ered Luin"
    Grid[53][34] = "South Ered Luin"
    Grid[53][35] = "South Ered Luin"
    Grid[53][36] = "Minbiriath"
    Grid[53][37] = "Minbiriath"
    Grid[53][38] = "Minbiriath"
    Grid[53][39] = "Minbiriath"
    Grid[53][40] = "Minbiriath"
    Grid[53][41] = "Minbiriath"
    Grid[53][42] = "Minbiriath"
    Grid[53][43] = "Minbiriath"
    Grid[53][44] = "Minbiriath"
    Grid[53][45] = "Minbiriath"
    Grid[53][46] = "Minbiriath"
    Grid[53][47] = "Minbiriath"
    Grid[53][48] = "Minbiriath"
    Grid[53][49] = "Minbiriath"
    Grid[53][50] = "Minbiriath"
    Grid[53][51] = "Minbiriath"
    Grid[53][52] = "Minbiriath"
    Grid[53][53] = "Minbiriath"
    Grid[53][54] = "Minbiriath"
    Grid[53][55] = "Minbiriath"
    Grid[53][74] = "Andrast"
    Grid[53][80] = "Andrast"
    Grid[53][81] = "Andrast"
    Grid[53][82] = "Andrast"
    Grid[53][83] = "Andrast"
    Grid[53][84] = "Andrast"
    Grid[53][85] = "Andrast"
    Grid[53][86] = "Andrast"
    Grid[54][1] = "Arnor"
    Grid[54][2] = "Arnor"
    Grid[54][3] = "Arnor"
    Grid[54][4] = "Arnor"
    Grid[54][5] = "Arnor"
    Grid[54][6] = "Arnor"
    Grid[54][7] = "Arnor"
    Grid[54][8] = "Arnor"
    Grid[54][9] = "Arnor"
    Grid[54][10] = "Arnor"
    Grid[54][11] = "Evendim"
    Grid[54][12] = "Evendim"
    Grid[54][13] = "Evendim"
    Grid[54][14] = "Evendim"
    Grid[54][15] = "North Downs"
    Grid[54][16] = "North Downs"
    Grid[54][18] = "Evendim"
    Grid[54][19] = "Evendim"
    Grid[54][20] = "Evendim"
    Grid[54][21] = "The Shire"
    Grid[54][22] = "The Shire"
    Grid[54][23] = "The Shire"
    Grid[54][24] = "The Shire"
    Grid[54][25] = "The Shire"
    Grid[54][26] = "The Shire"
    Grid[54][27] = "The Shire"
    Grid[54][28] = "The Shire"
    Grid[54][29] = "The Shire"
    Grid[54][30] = "South Ered Luin"
    Grid[54][31] = "South Ered Luin"
    Grid[54][32] = "South Ered Luin"
    Grid[54][33] = "South Ered Luin"
    Grid[54][34] = "South Ered Luin"
    Grid[54][35] = "Cardolan"
    Grid[54][36] = "Cardolan"
    Grid[54][37] = "Minbiriath"
    Grid[54][38] = "Minbiriath"
    Grid[54][39] = "Minbiriath"
    Grid[54][40] = "Minbiriath"
    Grid[54][41] = "Minbiriath"
    Grid[54][42] = "Minbiriath"
    Grid[54][43] = "Minbiriath"
    Grid[54][44] = "Minbiriath"
    Grid[54][45] = "Minbiriath"
    Grid[54][46] = "Minbiriath"
    Grid[54][47] = "Minbiriath"
    Grid[54][48] = "Minbiriath"
    Grid[54][49] = "Minbiriath"
    Grid[54][50] = "Minbiriath"
    Grid[54][51] = "Minbiriath"
    Grid[54][52] = "Minbiriath"
    Grid[54][53] = "Minbiriath"
    Grid[54][54] = "Minbiriath"
    Grid[54][62] = "Enedwaith"
    Grid[54][63] = "Enedwaith"
    Grid[54][64] = "Enedwaith"
    Grid[54][70] = "Druwaith Iaur"
    Grid[54][71] = "Druwaith Iaur"
    Grid[54][72] = "Andrast"
    Grid[54][73] = "Andrast"
    Grid[54][74] = "Andrast"
    Grid[54][75] = "Andrast"
    Grid[54][76] = "Andrast"
    Grid[54][77] = "Andrast"
    Grid[54][78] = "Andrast"
    Grid[54][79] = "Andrast"
    Grid[54][80] = "Andrast"
    Grid[54][81] = "Andrast"
    Grid[54][82] = "Andrast"
    Grid[54][83] = "Andrast"
    Grid[54][84] = "Andrast"
    Grid[54][85] = "Andrast"
    Grid[55][1] = "Arnor"
    Grid[55][2] = "Arnor"
    Grid[55][3] = "Arnor"
    Grid[55][4] = "Arnor"
    Grid[55][5] = "Arnor"
    Grid[55][6] = "Arnor"
    Grid[55][7] = "Arnor"
    Grid[55][8] = "Arnor"
    Grid[55][9] = "Arnor"
    Grid[55][10] = "Arnor"
    Grid[55][11] = "Evendim"
    Grid[55][12] = "Evendim"
    Grid[55][13] = "Evendim"
    Grid[55][14] = "North Downs"
    Grid[55][15] = "North Downs"
    Grid[55][16] = "North Downs"
    Grid[55][17] = "North Downs"
    Grid[55][18] = "Evendim"
    Grid[55][19] = "Evendim"
    Grid[55][20] = "Evendim"
    Grid[55][21] = "The Shire"
    Grid[55][22] = "The Shire"
    Grid[55][23] = "The Shire"
    Grid[55][24] = "The Shire"
    Grid[55][25] = "The Shire"
    Grid[55][26] = "The Shire"
    Grid[55][27] = "The Shire"
    Grid[55][28] = "The Shire"
    Grid[55][29] = "The Shire"
    Grid[55][30] = "South Ered Luin"
    Grid[55][31] = "South Ered Luin"
    Grid[55][32] = "South Ered Luin"
    Grid[55][33] = "South Ered Luin"
    Grid[55][34] = "Cardolan"
    Grid[55][35] = "Cardolan"
    Grid[55][36] = "Cardolan"
    Grid[55][37] = "Cardolan"
    Grid[55][38] = "Minbiriath"
    Grid[55][39] = "Minbiriath"
    Grid[55][40] = "Minbiriath"
    Grid[55][41] = "Minbiriath"
    Grid[55][42] = "Minbiriath"
    Grid[55][43] = "Minbiriath"
    Grid[55][44] = "Minbiriath"
    Grid[55][45] = "Minbiriath"
    Grid[55][46] = "Minbiriath"
    Grid[55][47] = "Minbiriath"
    Grid[55][48] = "Minbiriath"
    Grid[55][49] = "Minbiriath"
    Grid[55][50] = "Minbiriath"
    Grid[55][51] = "Minbiriath"
    Grid[55][52] = "Minbiriath"
    Grid[55][53] = "Minbiriath"
    Grid[55][54] = "Enedwaith"
    Grid[55][55] = "Enedwaith"
    Grid[55][56] = "Enedwaith"
    Grid[55][58] = "Enedwaith"
    Grid[55][59] = "Enedwaith"
    Grid[55][60] = "Enedwaith"
    Grid[55][61] = "Enedwaith"
    Grid[55][62] = "Enedwaith"
    Grid[55][63] = "Enedwaith"
    Grid[55][66] = "Druwaith Iaur"
    Grid[55][67] = "Druwaith Iaur"
    Grid[55][68] = "Druwaith Iaur"
    Grid[55][69] = "Druwaith Iaur"
    Grid[55][70] = "Druwaith Iaur"
    Grid[55][71] = "Druwaith Iaur"
    Grid[55][72] = "Andrast"
    Grid[55][73] = "Andrast"
    Grid[55][74] = "Andrast"
    Grid[55][75] = "Andrast"
    Grid[55][76] = "Andrast"
    Grid[55][77] = "Andrast"
    Grid[55][78] = "Andrast"
    Grid[55][79] = "Andrast"
    Grid[55][80] = "Andrast"
    Grid[55][81] = "Andrast"
    Grid[55][82] = "Andrast"
    Grid[55][83] = "Andrast"
    Grid[55][84] = "Andrast"
    Grid[55][85] = "Andrast"
    Grid[55][86] = "Andrast"
    Grid[56][1] = "Arnor"
    Grid[56][2] = "Arnor"
    Grid[56][3] = "Arnor"
    Grid[56][4] = "Arnor"
    Grid[56][5] = "Arnor"
    Grid[56][6] = "Arnor"
    Grid[56][7] = "Arnor"
    Grid[56][8] = "Arnor"
    Grid[56][9] = "Arnor"
    Grid[56][10] = "Arnor"
    Grid[56][11] = "Evendim"
    Grid[56][12] = "Evendim"
    Grid[56][13] = "Evendim"
    Grid[56][14] = "North Downs"
    Grid[56][15] = "North Downs"
    Grid[56][16] = "North Downs"
    Grid[56][17] = "North Downs"
    Grid[56][18] = "Evendim"
    Grid[56][19] = "Evendim"
    Grid[56][20] = "Buchland"
    Grid[56][21] = "Buchland"
    Grid[56][22] = "Buchland"
    Grid[56][23] = "The Shire"
    Grid[56][24] = "The Shire"
    Grid[56][25] = "The Shire"
    Grid[56][26] = "The Shire"
    Grid[56][27] = "The Shire"
    Grid[56][28] = "The Shire"
    Grid[56][29] = "Old Forest"
    Grid[56][30] = "Old Forest"
    Grid[56][31] = "Old Forest"
    Grid[56][32] = "Old Forest"
    Grid[56][33] = "Cardolan"
    Grid[56][34] = "Cardolan"
    Grid[56][35] = "Cardolan"
    Grid[56][36] = "Cardolan"
    Grid[56][37] = "Cardolan"
    Grid[56][38] = "Cardolan"
    Grid[56][39] = "Minbiriath"
    Grid[56][40] = "Minbiriath"
    Grid[56][41] = "Minbiriath"
    Grid[56][42] = "Minbiriath"
    Grid[56][43] = "Minbiriath"
    Grid[56][44] = "Minbiriath"
    Grid[56][45] = "Minbiriath"
    Grid[56][46] = "Minbiriath"
    Grid[56][47] = "Minbiriath"
    Grid[56][48] = "Minbiriath"
    Grid[56][49] = "Minbiriath"
    Grid[56][50] = "Minbiriath"
    Grid[56][51] = "Enedwaith"
    Grid[56][52] = "Enedwaith"
    Grid[56][53] = "Enedwaith"
    Grid[56][54] = "Enedwaith"
    Grid[56][55] = "Enedwaith"
    Grid[56][56] = "Enedwaith"
    Grid[56][57] = "Enedwaith"
    Grid[56][58] = "Enedwaith"
    Grid[56][59] = "Enedwaith"
    Grid[56][60] = "Enedwaith"
    Grid[56][61] = "Enedwaith"
    Grid[56][62] = "Enedwaith"
    Grid[56][63] = "Enedwaith"
    Grid[56][65] = "Druwaith Iaur"
    Grid[56][66] = "Druwaith Iaur"
    Grid[56][67] = "Druwaith Iaur"
    Grid[56][68] = "Druwaith Iaur"
    Grid[56][69] = "Druwaith Iaur"
    Grid[56][70] = "Druwaith Iaur"
    Grid[56][71] = "Druwaith Iaur"
    Grid[56][72] = "Andrast"
    Grid[56][73] = "Andrast"
    Grid[56][74] = "Andrast"
    Grid[56][75] = "Andrast"
    Grid[56][76] = "Andrast"
    Grid[56][77] = "Andrast"
    Grid[56][78] = "Andrast"
    Grid[56][79] = "Andrast"
    Grid[56][80] = "Andrast"
    Grid[56][81] = "Andrast"
    Grid[56][82] = "Andrast"
    Grid[56][83] = "Andrast"
    Grid[56][84] = "Andrast"
    Grid[56][85] = "Andrast"
    Grid[56][86] = "Andrast"
    Grid[57][1] = "Angmar"
    Grid[57][2] = "Angmar"
    Grid[57][3] = "Angmar"
    Grid[57][4] = "Angmar"
    Grid[57][5] = "Angmar"
    Grid[57][6] = "Angmar"
    Grid[57][7] = "Arnor"
    Grid[57][8] = "Arnor"
    Grid[57][9] = "Arnor"
    Grid[57][10] = "Arnor"
    Grid[57][11] = "Arnor"
    Grid[57][12] = "Evendim"
    Grid[57][13] = "North Downs"
    Grid[57][14] = "North Downs"
    Grid[57][15] = "North Downs"
    Grid[57][16] = "North Downs"
    Grid[57][17] = "North Downs"
    Grid[57][18] = "Buchland"
    Grid[57][19] = "Buchland"
    Grid[57][20] = "Buchland"
    Grid[57][21] = "Buchland"
    Grid[57][22] = "Buchland"
    Grid[57][23] = "Buchland"
    Grid[57][24] = "Buchland"
    Grid[57][25] = "Buchland"
    Grid[57][26] = "Old Forest"
    Grid[57][27] = "Old Forest"
    Grid[57][28] = "Old Forest"
    Grid[57][29] = "Old Forest"
    Grid[57][30] = "Old Forest"
    Grid[57][31] = "Old Forest"
    Grid[57][32] = "Old Forest"
    Grid[57][33] = "Cardolan"
    Grid[57][34] = "Cardolan"
    Grid[57][35] = "Cardolan"
    Grid[57][36] = "Cardolan"
    Grid[57][37] = "Cardolan"
    Grid[57][38] = "Cardolan"
    Grid[57][39] = "Cardolan"
    Grid[57][40] = "Minbiriath"
    Grid[57][41] = "Minbiriath"
    Grid[57][42] = "Minbiriath"
    Grid[57][43] = "Minbiriath"
    Grid[57][44] = "Minbiriath"
    Grid[57][45] = "Minbiriath"
    Grid[57][46] = "Minbiriath"
    Grid[57][47] = "Minbiriath"
    Grid[57][48] = "Minbiriath"
    Grid[57][49] = "Enedwaith"
    Grid[57][50] = "Enedwaith"
    Grid[57][51] = "Enedwaith"
    Grid[57][52] = "Enedwaith"
    Grid[57][53] = "Enedwaith"
    Grid[57][54] = "Enedwaith"
    Grid[57][55] = "Enedwaith"
    Grid[57][56] = "Enedwaith"
    Grid[57][57] = "Enedwaith"
    Grid[57][58] = "Enedwaith"
    Grid[57][59] = "Enedwaith"
    Grid[57][60] = "Enedwaith"
    Grid[57][61] = "Enedwaith"
    Grid[57][62] = "Enedwaith"
    Grid[57][63] = "Enedwaith"
    Grid[57][64] = "Druwaith Iaur"
    Grid[57][65] = "Druwaith Iaur"
    Grid[57][66] = "Druwaith Iaur"
    Grid[57][67] = "Druwaith Iaur"
    Grid[57][68] = "Druwaith Iaur"
    Grid[57][69] = "Druwaith Iaur"
    Grid[57][70] = "Druwaith Iaur"
    Grid[57][71] = "Andrast"
    Grid[57][72] = "Andrast"
    Grid[57][73] = "Andrast"
    Grid[57][74] = "Andrast"
    Grid[57][75] = "Andrast"
    Grid[57][76] = "Andrast"
    Grid[57][77] = "Andrast"
    Grid[57][78] = "Andrast"
    Grid[57][79] = "Andrast"
    Grid[57][80] = "Andrast"
    Grid[57][81] = "Andrast"
    Grid[57][82] = "Andrast"
    Grid[57][83] = "Andrast"
    Grid[57][84] = "Andrast"
    Grid[57][85] = "Andrast"
    Grid[57][86] = "Andrast"
    Grid[57][87] = "Andrast"
    Grid[58][1] = "Angmar"
    Grid[58][2] = "Angmar"
    Grid[58][3] = "Angmar"
    Grid[58][4] = "Angmar"
    Grid[58][5] = "Angmar"
    Grid[58][6] = "Angmar"
    Grid[58][7] = "Arnor"
    Grid[58][8] = "Arnor"
    Grid[58][9] = "Arnor"
    Grid[58][10] = "Arnor"
    Grid[58][11] = "Arnor"
    Grid[58][12] = "North Downs"
    Grid[58][13] = "North Downs"
    Grid[58][14] = "North Downs"
    Grid[58][15] = "North Downs"
    Grid[58][16] = "North Downs"
    Grid[58][17] = "North Downs"
    Grid[58][18] = "Buchland"
    Grid[58][19] = "Buchland"
    Grid[58][20] = "Buchland"
    Grid[58][21] = "Buchland"
    Grid[58][22] = "Buchland"
    Grid[58][23] = "Buchland"
    Grid[58][24] = "Buchland"
    Grid[58][25] = "Buchland"
    Grid[58][26] = "Old Forest"
    Grid[58][27] = "Old Forest"
    Grid[58][28] = "Old Forest"
    Grid[58][29] = "Old Forest"
    Grid[58][30] = "Old Forest"
    Grid[58][31] = "Old Forest"
    Grid[58][32] = "Old Forest"
    Grid[58][33] = "Cardolan"
    Grid[58][34] = "Cardolan"
    Grid[58][35] = "Cardolan"
    Grid[58][36] = "Cardolan"
    Grid[58][37] = "Cardolan"
    Grid[58][38] = "Cardolan"
    Grid[58][39] = "Cardolan"
    Grid[58][40] = "Cardolan"
    Grid[58][41] = "Minbiriath"
    Grid[58][42] = "Minbiriath"
    Grid[58][43] = "Minbiriath"
    Grid[58][44] = "Minbiriath"
    Grid[58][45] = "Minbiriath"
    Grid[58][46] = "Minbiriath"
    Grid[58][47] = "Minbiriath"
    Grid[58][48] = "Tharbad"
    Grid[58][49] = "Enedwaith"
    Grid[58][50] = "Enedwaith"
    Grid[58][51] = "Enedwaith"
    Grid[58][52] = "Enedwaith"
    Grid[58][53] = "Enedwaith"
    Grid[58][54] = "Enedwaith"
    Grid[58][55] = "Enedwaith"
    Grid[58][56] = "Enedwaith"
    Grid[58][57] = "Enedwaith"
    Grid[58][58] = "Enedwaith"
    Grid[58][59] = "Enedwaith"
    Grid[58][60] = "Enedwaith"
    Grid[58][61] = "Enedwaith"
    Grid[58][62] = "Enedwaith"
    Grid[58][63] = "Druwaith Iaur"
    Grid[58][64] = "Druwaith Iaur"
    Grid[58][65] = "Druwaith Iaur"
    Grid[58][66] = "Druwaith Iaur"
    Grid[58][67] = "Druwaith Iaur"
    Grid[58][68] = "Druwaith Iaur"
    Grid[58][69] = "Druwaith Iaur"
    Grid[58][70] = "Andrast"
    Grid[58][71] = "Andrast"
    Grid[58][72] = "Andrast"
    Grid[58][73] = "Andrast"
    Grid[58][74] = "Andrast"
    Grid[58][75] = "Andrast"
    Grid[58][76] = "Andrast"
    Grid[58][77] = "Andrast"
    Grid[58][78] = "Andrast"
    Grid[58][79] = "Andrast"
    Grid[58][80] = "Andrast"
    Grid[58][81] = "Andrast"
    Grid[58][82] = "Andrast"
    Grid[58][83] = "Andrast"
    Grid[58][84] = "Andrast"
    Grid[58][85] = "Andrast"
    Grid[58][86] = "Andrast"
    Grid[58][87] = "Andrast"
    Grid[59][1] = "Angmar"
    Grid[59][2] = "Angmar"
    Grid[59][3] = "Angmar"
    Grid[59][4] = "Angmar"
    Grid[59][5] = "Angmar"
    Grid[59][6] = "Angmar"
    Grid[59][7] = "Angmar"
    Grid[59][8] = "Arnor"
    Grid[59][9] = "Arnor"
    Grid[59][10] = "Arnor"
    Grid[59][11] = "Arnor"
    Grid[59][12] = "North Downs"
    Grid[59][13] = "North Downs"
    Grid[59][14] = "North Downs"
    Grid[59][15] = "North Downs"
    Grid[59][16] = "North Downs"
    Grid[59][17] = "North Downs"
    Grid[59][18] = "Buchland"
    Grid[59][19] = "Buchland"
    Grid[59][20] = "Buchland"
    Grid[59][21] = "Buchland"
    Grid[59][22] = "Buchland"
    Grid[59][23] = "Buchland"
    Grid[59][24] = "Buchland"
    Grid[59][25] = "Buchland"
    Grid[59][26] = "Old Forest"
    Grid[59][27] = "Old Forest"
    Grid[59][28] = "Old Forest"
    Grid[59][29] = "Old Forest"
    Grid[59][30] = "Old Forest"
    Grid[59][31] = "Old Forest"
    Grid[59][32] = "Old Forest"
    Grid[59][33] = "Cardolan"
    Grid[59][34] = "Cardolan"
    Grid[59][35] = "Cardolan"
    Grid[59][36] = "Cardolan"
    Grid[59][37] = "Cardolan"
    Grid[59][38] = "Cardolan"
    Grid[59][39] = "Cardolan"
    Grid[59][40] = "Cardolan"
    Grid[59][41] = "Cardolan"
    Grid[59][42] = "Cardolan"
    Grid[59][43] = "Minbiriath"
    Grid[59][44] = "Minbiriath"
    Grid[59][45] = "Minbiriath"
    Grid[59][46] = "Minbiriath"
    Grid[59][47] = "Tharbad"
    Grid[59][48] = "Tharbad"
    Grid[59][49] = "Tharbad"
    Grid[59][50] = "Enedwaith"
    Grid[59][51] = "Enedwaith"
    Grid[59][52] = "Enedwaith"
    Grid[59][53] = "Enedwaith"
    Grid[59][54] = "Enedwaith"
    Grid[59][55] = "Enedwaith"
    Grid[59][56] = "Enedwaith"
    Grid[59][57] = "Enedwaith"
    Grid[59][58] = "Enedwaith"
    Grid[59][59] = "Enedwaith"
    Grid[59][60] = "Enedwaith"
    Grid[59][61] = "Enedwaith"
    Grid[59][62] = "Druwaith Iaur"
    Grid[59][63] = "Druwaith Iaur"
    Grid[59][64] = "Druwaith Iaur"
    Grid[59][65] = "Druwaith Iaur"
    Grid[59][66] = "Druwaith Iaur"
    Grid[59][67] = "Druwaith Iaur"
    Grid[59][68] = "Druwaith Iaur"
    Grid[59][69] = "Druwaith Iaur"
    Grid[59][70] = "Andrast"
    Grid[59][71] = "Andrast"
    Grid[59][72] = "Andrast"
    Grid[59][73] = "Andrast"
    Grid[59][74] = "Andrast"
    Grid[59][75] = "Andrast"
    Grid[59][76] = "Andrast"
    Grid[59][77] = "Andrast"
    Grid[59][78] = "Andrast"
    Grid[59][79] = "Andrast"
    Grid[59][80] = "Andrast"
    Grid[59][81] = "Andrast"
    Grid[59][82] = "Andrast"
    Grid[59][83] = "Andrast"
    Grid[59][84] = "Andrast"
    Grid[59][85] = "Andrast"
    Grid[59][86] = "Andrast"
    Grid[59][87] = "Andrast"
    Grid[60][1] = "Angmar"
    Grid[60][2] = "Angmar"
    Grid[60][3] = "Angmar"
    Grid[60][4] = "Angmar"
    Grid[60][5] = "Angmar"
    Grid[60][6] = "Angmar"
    Grid[60][7] = "Angmar"
    Grid[60][8] = "Arnor"
    Grid[60][9] = "Arnor"
    Grid[60][10] = "Arnor"
    Grid[60][11] = "Arnor"
    Grid[60][12] = "Arnor"
    Grid[60][13] = "North Downs"
    Grid[60][14] = "North Downs"
    Grid[60][15] = "North Downs"
    Grid[60][16] = "North Downs"
    Grid[60][17] = "North Downs"
    Grid[60][18] = "Bree"
    Grid[60][19] = "Buchland"
    Grid[60][20] = "Buchland"
    Grid[60][21] = "Buchland"
    Grid[60][22] = "Buchland"
    Grid[60][23] = "Buchland"
    Grid[60][24] = "Buchland"
    Grid[60][25] = "Buchland"
    Grid[60][26] = "Old Forest"
    Grid[60][27] = "Old Forest"
    Grid[60][28] = "Old Forest"
    Grid[60][29] = "Old Forest"
    Grid[60][30] = "Old Forest"
    Grid[60][31] = "Old Forest"
    Grid[60][32] = "Old Forest"
    Grid[60][33] = "Cardolan"
    Grid[60][34] = "Cardolan"
    Grid[60][35] = "Cardolan"
    Grid[60][36] = "Cardolan"
    Grid[60][37] = "Cardolan"
    Grid[60][38] = "Cardolan"
    Grid[60][39] = "Cardolan"
    Grid[60][40] = "Cardolan"
    Grid[60][41] = "Cardolan"
    Grid[60][42] = "Cardolan"
    Grid[60][43] = "Cardolan"
    Grid[60][44] = "Minbiriath"
    Grid[60][45] = "Tharbad"
    Grid[60][46] = "Tharbad"
    Grid[60][47] = "Tharbad"
    Grid[60][48] = "Tharbad"
    Grid[60][49] = "Tharbad"
    Grid[60][50] = "Tharbad"
    Grid[60][51] = "Enedwaith"
    Grid[60][52] = "Enedwaith"
    Grid[60][53] = "Enedwaith"
    Grid[60][54] = "Enedwaith"
    Grid[60][55] = "Enedwaith"
    Grid[60][56] = "Enedwaith"
    Grid[60][57] = "Enedwaith"
    Grid[60][58] = "Enedwaith"
    Grid[60][59] = "Enedwaith"
    Grid[60][60] = "Enedwaith"
    Grid[60][61] = "Druwaith Iaur"
    Grid[60][62] = "Druwaith Iaur"
    Grid[60][63] = "Druwaith Iaur"
    Grid[60][64] = "Druwaith Iaur"
    Grid[60][65] = "Druwaith Iaur"
    Grid[60][66] = "Druwaith Iaur"
    Grid[60][67] = "Druwaith Iaur"
    Grid[60][68] = "Druwaith Iaur"
    Grid[60][69] = "Druwaith Iaur"
    Grid[60][70] = "Andrast"
    Grid[60][71] = "Andrast"
    Grid[60][72] = "Andrast"
    Grid[60][73] = "Andrast"
    Grid[60][74] = "Andrast"
    Grid[60][75] = "Andrast"
    Grid[60][76] = "Andrast"
    Grid[60][77] = "Andrast"
    Grid[60][78] = "Andrast"
    Grid[60][79] = "Anfalas"
    Grid[60][80] = "Anfalas"
    Grid[60][81] = "Andrast"
    Grid[60][82] = "Andrast"
    Grid[60][83] = "Andrast"
    Grid[60][84] = "Andrast"
    Grid[60][85] = "Andrast"
    Grid[60][86] = "Andrast"
    Grid[60][87] = "Andrast"
    Grid[61][1] = "Angmar"
    Grid[61][2] = "Angmar"
    Grid[61][3] = "Angmar"
    Grid[61][4] = "Angmar"
    Grid[61][5] = "Angmar"
    Grid[61][6] = "Angmar"
    Grid[61][7] = "Angmar"
    Grid[61][8] = "Arnor"
    Grid[61][9] = "Arnor"
    Grid[61][10] = "Arnor"
    Grid[61][11] = "Arnor"
    Grid[61][12] = "Arnor"
    Grid[61][13] = "North Downs"
    Grid[61][14] = "North Downs"
    Grid[61][15] = "North Downs"
    Grid[61][16] = "Bree"
    Grid[61][17] = "Bree"
    Grid[61][18] = "Bree"
    Grid[61][19] = "Bree"
    Grid[61][20] = "Buchland"
    Grid[61][21] = "Bree"
    Grid[61][22] = "Buchland"
    Grid[61][23] = "Buchland"
    Grid[61][24] = "Buchland"
    Grid[61][25] = "Buchland"
    Grid[61][26] = "Old Forest"
    Grid[61][27] = "Old Forest"
    Grid[61][28] = "Old Forest"
    Grid[61][29] = "Old Forest"
    Grid[61][30] = "Old Forest"
    Grid[61][31] = "Old Forest"
    Grid[61][32] = "Old Forest"
    Grid[61][33] = "Cardolan"
    Grid[61][34] = "Cardolan"
    Grid[61][35] = "Cardolan"
    Grid[61][36] = "Cardolan"
    Grid[61][37] = "Cardolan"
    Grid[61][38] = "Cardolan"
    Grid[61][39] = "Cardolan"
    Grid[61][40] = "Cardolan"
    Grid[61][41] = "Cardolan"
    Grid[61][42] = "Cardolan"
    Grid[61][43] = "Cardolan"
    Grid[61][44] = "Tharbad"
    Grid[61][45] = "Tharbad"
    Grid[61][46] = "Tharbad"
    Grid[61][47] = "Tharbad"
    Grid[61][48] = "Tharbad"
    Grid[61][49] = "Tharbad"
    Grid[61][50] = "Tharbad"
    Grid[61][51] = "Enedwaith"
    Grid[61][52] = "Enedwaith"
    Grid[61][53] = "Enedwaith"
    Grid[61][54] = "Enedwaith"
    Grid[61][55] = "Enedwaith"
    Grid[61][56] = "Enedwaith"
    Grid[61][57] = "Enedwaith"
    Grid[61][58] = "Enedwaith"
    Grid[61][59] = "Enedwaith"
    Grid[61][60] = "Enedwaith"
    Grid[61][61] = "Druwaith Iaur"
    Grid[61][62] = "Druwaith Iaur"
    Grid[61][63] = "Druwaith Iaur"
    Grid[61][64] = "Druwaith Iaur"
    Grid[61][65] = "Druwaith Iaur"
    Grid[61][66] = "Druwaith Iaur"
    Grid[61][67] = "Druwaith Iaur"
    Grid[61][68] = "Druwaith Iaur"
    Grid[61][69] = "Druwaith Iaur"
    Grid[61][70] = "Andrast"
    Grid[61][71] = "Andrast"
    Grid[61][72] = "Andrast"
    Grid[61][73] = "Andrast"
    Grid[61][74] = "Andrast"
    Grid[61][75] = "Andrast"
    Grid[61][76] = "Andrast"
    Grid[61][77] = "Anfalas"
    Grid[61][78] = "Anfalas"
    Grid[61][79] = "Anfalas"
    Grid[61][80] = "Anfalas"
    Grid[61][81] = "Andrast"
    Grid[61][82] = "Andrast"
    Grid[62][1] = "Angmar"
    Grid[62][2] = "Angmar"
    Grid[62][3] = "Angmar"
    Grid[62][4] = "Angmar"
    Grid[62][5] = "Angmar"
    Grid[62][6] = "Angmar"
    Grid[62][7] = "Angmar"
    Grid[62][8] = "Ettenmoors"
    Grid[62][9] = "Ettenmoors"
    Grid[62][10] = "Ettenmoors"
    Grid[62][11] = "Ettenmoors"
    Grid[62][12] = "Ettenmoors"
    Grid[62][13] = "North Downs"
    Grid[62][14] = "North Downs"
    Grid[62][15] = "North Downs"
    Grid[62][16] = "Bree"
    Grid[62][17] = "Bree"
    Grid[62][18] = "Bree"
    Grid[62][19] = "Bree"
    Grid[62][20] = "Bree"
    Grid[62][21] = "Bree"
    Grid[62][22] = "Bree"
    Grid[62][23] = "Buchland"
    Grid[62][24] = "Buchland"
    Grid[62][25] = "Buchland"
    Grid[62][26] = "Cardolan"
    Grid[62][27] = "Cardolan"
    Grid[62][28] = "Old Forest"
    Grid[62][29] = "Old Forest"
    Grid[62][30] = "Old Forest"
    Grid[62][31] = "Old Forest"
    Grid[62][32] = "Cardolan"
    Grid[62][33] = "Cardolan"
    Grid[62][34] = "Cardolan"
    Grid[62][35] = "Cardolan"
    Grid[62][36] = "Cardolan"
    Grid[62][37] = "Cardolan"
    Grid[62][38] = "Cardolan"
    Grid[62][39] = "Cardolan"
    Grid[62][40] = "Cardolan"
    Grid[62][41] = "Cardolan"
    Grid[62][42] = "Tharbad"
    Grid[62][43] = "Tharbad"
    Grid[62][44] = "Tharbad"
    Grid[62][45] = "Tharbad"
    Grid[62][46] = "Tharbad"
    Grid[62][47] = "Tharbad"
    Grid[62][48] = "Tharbad"
    Grid[62][49] = "Tharbad"
    Grid[62][50] = "Tharbad"
    Grid[62][51] = "Tharbad"
    Grid[62][52] = "Enedwaith"
    Grid[62][53] = "Enedwaith"
    Grid[62][54] = "Enedwaith"
    Grid[62][55] = "Enedwaith"
    Grid[62][56] = "Enedwaith"
    Grid[62][57] = "Enedwaith"
    Grid[62][58] = "Enedwaith"
    Grid[62][59] = "Enedwaith"
    Grid[62][60] = "Enedwaith"
    Grid[62][61] = "Enedwaith"
    Grid[62][62] = "Druwaith Iaur"
    Grid[62][63] = "Druwaith Iaur"
    Grid[62][64] = "Druwaith Iaur"
    Grid[62][65] = "Druwaith Iaur"
    Grid[62][66] = "Druwaith Iaur"
    Grid[62][67] = "Druwaith Iaur"
    Grid[62][68] = "Druwaith Iaur"
    Grid[62][69] = "Druwaith Iaur"
    Grid[62][70] = "Druwaith Iaur"
    Grid[62][71] = "Andrast"
    Grid[62][72] = "Andrast"
    Grid[62][73] = "Andrast"
    Grid[62][74] = "Andrast"
    Grid[62][75] = "Anfalas"
    Grid[62][76] = "Anfalas"
    Grid[62][77] = "Anfalas"
    Grid[62][78] = "Anfalas"
    Grid[62][79] = "Anfalas"
    Grid[62][80] = "Anfalas"
    Grid[62][81] = "Anfalas"
    Grid[62][82] = "Anfalas"
    Grid[62][83] = "Anfalas"
    Grid[62][84] = "Anfalas"
    Grid[62][85] = "Anfalas"
    Grid[63][1] = "Angmar"
    Grid[63][2] = "Angmar"
    Grid[63][3] = "Angmar"
    Grid[63][4] = "Angmar"
    Grid[63][5] = "Angmar"
    Grid[63][6] = "Angmar"
    Grid[63][7] = "Angmar"
    Grid[63][8] = "Ettenmoors"
    Grid[63][9] = "Ettenmoors"
    Grid[63][10] = "Ettenmoors"
    Grid[63][11] = "Ettenmoors"
    Grid[63][12] = "Ettenmoors"
    Grid[63][13] = "North Downs"
    Grid[63][14] = "North Downs"
    Grid[63][15] = "North Downs"
    Grid[63][16] = "Bree"
    Grid[63][17] = "Bree"
    Grid[63][18] = "Bree"
    Grid[63][19] = "Bree"
    Grid[63][20] = "Bree"
    Grid[63][21] = "Bree"
    Grid[63][22] = "Bree"
    Grid[63][23] = "South Downs"
    Grid[63][24] = "South Downs"
    Grid[63][25] = "Buchland"
    Grid[63][26] = "Cardolan"
    Grid[63][27] = "Cardolan"
    Grid[63][28] = "Cardolan"
    Grid[63][29] = "Cardolan"
    Grid[63][30] = "Cardolan"
    Grid[63][31] = "Cardolan"
    Grid[63][32] = "Cardolan"
    Grid[63][33] = "Cardolan"
    Grid[63][34] = "Cardolan"
    Grid[63][35] = "Cardolan"
    Grid[63][36] = "Cardolan"
    Grid[63][37] = "Cardolan"
    Grid[63][38] = "Cardolan"
    Grid[63][39] = "Cardolan"
    Grid[63][40] = "Cardolan"
    Grid[63][41] = "Tharbad"
    Grid[63][42] = "Tharbad"
    Grid[63][43] = "Tharbad"
    Grid[63][44] = "Tharbad"
    Grid[63][45] = "Tharbad"
    Grid[63][46] = "Tharbad"
    Grid[63][47] = "Tharbad"
    Grid[63][48] = "Tharbad"
    Grid[63][49] = "Tharbad"
    Grid[63][50] = "Tharbad"
    Grid[63][51] = "Tharbad"
    Grid[63][52] = "Tharbad"
    Grid[63][53] = "South Dunland"
    Grid[63][54] = "Enedwaith"
    Grid[63][55] = "Enedwaith"
    Grid[63][56] = "Enedwaith"
    Grid[63][57] = "Enedwaith"
    Grid[63][58] = "Enedwaith"
    Grid[63][59] = "Enedwaith"
    Grid[63][60] = "Enedwaith"
    Grid[63][61] = "Enedwaith"
    Grid[63][62] = "Druwaith Iaur"
    Grid[63][63] = "Druwaith Iaur"
    Grid[63][64] = "Druwaith Iaur"
    Grid[63][65] = "Druwaith Iaur"
    Grid[63][66] = "Druwaith Iaur"
    Grid[63][67] = "Druwaith Iaur"
    Grid[63][68] = "Druwaith Iaur"
    Grid[63][69] = "Druwaith Iaur"
    Grid[63][70] = "Druwaith Iaur"
    Grid[63][71] = "Andrast"
    Grid[63][72] = "Andrast"
    Grid[63][73] = "Andrast"
    Grid[63][74] = "Anfalas"
    Grid[63][75] = "Anfalas"
    Grid[63][76] = "Anfalas"
    Grid[63][77] = "Anfalas"
    Grid[63][78] = "Anfalas"
    Grid[63][79] = "Anfalas"
    Grid[63][80] = "Anfalas"
    Grid[63][81] = "Anfalas"
    Grid[63][82] = "Anfalas"
    Grid[63][83] = "Anfalas"
    Grid[63][84] = "Anfalas"
    Grid[63][85] = "Anfalas"
    Grid[63][86] = "Anfalas"
    Grid[64][1] = "Angmar"
    Grid[64][2] = "Angmar"
    Grid[64][3] = "Angmar"
    Grid[64][4] = "Angmar"
    Grid[64][5] = "Angmar"
    Grid[64][6] = "Angmar"
    Grid[64][7] = "Angmar"
    Grid[64][8] = "Ettenmoors"
    Grid[64][9] = "Ettenmoors"
    Grid[64][10] = "Ettenmoors"
    Grid[64][11] = "Ettenmoors"
    Grid[64][12] = "Ettenmoors"
    Grid[64][13] = "North Downs"
    Grid[64][14] = "North Downs"
    Grid[64][15] = "Bree"
    Grid[64][16] = "Bree"
    Grid[64][17] = "Bree"
    Grid[64][18] = "Bree"
    Grid[64][19] = "Bree"
    Grid[64][20] = "Bree"
    Grid[64][21] = "Bree"
    Grid[64][22] = "Bree"
    Grid[64][23] = "Bree"
    Grid[64][24] = "South Downs"
    Grid[64][25] = "South Downs"
    Grid[64][26] = "South Downs"
    Grid[64][27] = "Cardolan"
    Grid[64][28] = "Cardolan"
    Grid[64][29] = "Cardolan"
    Grid[64][30] = "Cardolan"
    Grid[64][31] = "Cardolan"
    Grid[64][32] = "Cardolan"
    Grid[64][33] = "Cardolan"
    Grid[64][34] = "Cardolan"
    Grid[64][35] = "Cardolan"
    Grid[64][36] = "Cardolan"
    Grid[64][37] = "Cardolan"
    Grid[64][38] = "Cardolan"
    Grid[64][39] = "Cardolan"
    Grid[64][40] = "Cardolan"
    Grid[64][41] = "Tharbad"
    Grid[64][42] = "Tharbad"
    Grid[64][43] = "Tharbad"
    Grid[64][44] = "Tharbad"
    Grid[64][45] = "Tharbad"
    Grid[64][46] = "Tharbad"
    Grid[64][47] = "Tharbad"
    Grid[64][48] = "Tharbad"
    Grid[64][49] = "Tharbad"
    Grid[64][50] = "Tharbad"
    Grid[64][51] = "Tharbad"
    Grid[64][52] = "South Dunland"
    Grid[64][53] = "South Dunland"
    Grid[64][54] = "Enedwaith"
    Grid[64][55] = "Gap of Rohan"
    Grid[64][56] = "Gap of Rohan"
    Grid[64][57] = "Gap of Rohan"
    Grid[64][58] = "Gap of Rohan"
    Grid[64][59] = "Gap of Rohan"
    Grid[64][60] = "Enedwaith"
    Grid[64][61] = "Enedwaith"
    Grid[64][62] = "Enedwaith"
    Grid[64][63] = "Druwaith Iaur"
    Grid[64][64] = "Druwaith Iaur"
    Grid[64][65] = "Druwaith Iaur"
    Grid[64][66] = "Druwaith Iaur"
    Grid[64][67] = "Druwaith Iaur"
    Grid[64][68] = "Druwaith Iaur"
    Grid[64][69] = "Druwaith Iaur"
    Grid[64][70] = "Andrast"
    Grid[64][71] = "Andrast"
    Grid[64][72] = "Andrast"
    Grid[64][73] = "Andrast"
    Grid[64][74] = "Anfalas"
    Grid[64][75] = "Anfalas"
    Grid[64][76] = "Anfalas"
    Grid[64][77] = "Anfalas"
    Grid[64][78] = "Anfalas"
    Grid[64][79] = "Anfalas"
    Grid[64][80] = "Anfalas"
    Grid[64][81] = "Anfalas"
    Grid[64][82] = "Anfalas"
    Grid[64][83] = "Anfalas"
    Grid[64][84] = "Anfalas"
    Grid[64][85] = "Anfalas"
    Grid[64][86] = "Anfalas"
    Grid[65][1] = "Mount Gram"
    Grid[65][2] = "Mount Gram"
    Grid[65][3] = "Angmar"
    Grid[65][4] = "Angmar"
    Grid[65][5] = "Angmar"
    Grid[65][6] = "Angmar"
    Grid[65][7] = "Angmar"
    Grid[65][8] = "Ettenmoors"
    Grid[65][9] = "Ettenmoors"
    Grid[65][10] = "Ettenmoors"
    Grid[65][11] = "Ettenmoors"
    Grid[65][12] = "Ettenmoors"
    Grid[65][13] = "North Downs"
    Grid[65][14] = "North Downs"
    Grid[65][15] = "Weather Hills"
    Grid[65][16] = "Weather Hills"
    Grid[65][17] = "Weather Hills"
    Grid[65][18] = "Bree"
    Grid[65][19] = "Bree"
    Grid[65][20] = "Bree"
    Grid[65][21] = "Bree"
    Grid[65][22] = "Bree"
    Grid[65][23] = "Bree"
    Grid[65][24] = "South Downs"
    Grid[65][25] = "South Downs"
    Grid[65][26] = "South Downs"
    Grid[65][27] = "South Downs"
    Grid[65][28] = "Cardolan"
    Grid[65][29] = "Cardolan"
    Grid[65][30] = "Cardolan"
    Grid[65][31] = "Cardolan"
    Grid[65][32] = "Cardolan"
    Grid[65][33] = "Cardolan"
    Grid[65][34] = "Cardolan"
    Grid[65][35] = "Cardolan"
    Grid[65][36] = "Cardolan"
    Grid[65][37] = "Cardolan"
    Grid[65][38] = "Cardolan"
    Grid[65][39] = "Cardolan"
    Grid[65][40] = "Tharbad"
    Grid[65][41] = "Tharbad"
    Grid[65][42] = "Tharbad"
    Grid[65][43] = "Tharbad"
    Grid[65][44] = "Tharbad"
    Grid[65][45] = "Tharbad"
    Grid[65][46] = "Tharbad"
    Grid[65][47] = "Tharbad"
    Grid[65][48] = "Tharbad"
    Grid[65][49] = "Tharbad"
    Grid[65][50] = "South Dunland"
    Grid[65][51] = "South Dunland"
    Grid[65][52] = "South Dunland"
    Grid[65][53] = "South Dunland"
    Grid[65][54] = "Gap of Rohan"
    Grid[65][55] = "Gap of Rohan"
    Grid[65][56] = "Gap of Rohan"
    Grid[65][57] = "Gap of Rohan"
    Grid[65][58] = "Gap of Rohan"
    Grid[65][59] = "Gap of Rohan"
    Grid[65][60] = "Gap of Rohan"
    Grid[65][61] = "Gap of Rohan"
    Grid[65][62] = "Gap of Rohan"
    Grid[65][63] = "Druwaith Iaur"
    Grid[65][64] = "Druwaith Iaur"
    Grid[65][65] = "Druwaith Iaur"
    Grid[65][66] = "Druwaith Iaur"
    Grid[65][67] = "Druwaith Iaur"
    Grid[65][68] = "Druwaith Iaur"
    Grid[65][69] = "Andrast"
    Grid[65][70] = "Andrast"
    Grid[65][71] = "Andrast"
    Grid[65][72] = "Andrast"
    Grid[65][73] = "Andrast"
    Grid[65][74] = "Andrast"
    Grid[65][75] = "Anfalas"
    Grid[65][76] = "Anfalas"
    Grid[65][77] = "Anfalas"
    Grid[65][78] = "Anfalas"
    Grid[65][79] = "Anfalas"
    Grid[65][80] = "Anfalas"
    Grid[65][81] = "Anfalas"
    Grid[65][82] = "Anfalas"
    Grid[65][83] = "Anfalas"
    Grid[65][84] = "Anfalas"
    Grid[65][85] = "Anfalas"
    Grid[66][1] = "Mount Gram"
    Grid[66][2] = "Mount Gram"
    Grid[66][3] = "Mount Gram"
    Grid[66][4] = "Mount Gram"
    Grid[66][5] = "Mount Gram"
    Grid[66][6] = "Angmar"
    Grid[66][7] = "Angmar"
    Grid[66][8] = "Ettenmoors"
    Grid[66][9] = "Ettenmoors"
    Grid[66][10] = "Ettenmoors"
    Grid[66][11] = "Ettenmoors"
    Grid[66][12] = "Ettenmoors"
    Grid[66][13] = "Ettenmoors"
    Grid[66][14] = "North Downs"
    Grid[66][15] = "Weather Hills"
    Grid[66][16] = "Weather Hills"
    Grid[66][17] = "Weather Hills"
    Grid[66][18] = "Weather Hills"
    Grid[66][19] = "Weather Hills"
    Grid[66][20] = "Bree"
    Grid[66][21] = "Bree"
    Grid[66][22] = "Bree"
    Grid[66][23] = "South Downs"
    Grid[66][24] = "South Downs"
    Grid[66][25] = "South Downs"
    Grid[66][26] = "South Downs"
    Grid[66][27] = "South Downs"
    Grid[66][28] = "South Downs"
    Grid[66][29] = "South Downs"
    Grid[66][30] = "South Downs"
    Grid[66][31] = "South Downs"
    Grid[66][32] = "South Downs"
    Grid[66][33] = "South Downs"
    Grid[66][34] = "South Downs"
    Grid[66][35] = "South Downs"
    Grid[66][36] = "South Downs"
    Grid[66][37] = "Cardolan"
    Grid[66][38] = "Cardolan"
    Grid[66][39] = "North Dunland"
    Grid[66][40] = "North Dunland"
    Grid[66][41] = "Tharbad"
    Grid[66][42] = "Tharbad"
    Grid[66][43] = "Tharbad"
    Grid[66][44] = "Tharbad"
    Grid[66][45] = "Tharbad"
    Grid[66][46] = "Tharbad"
    Grid[66][47] = "Tharbad"
    Grid[66][48] = "Tharbad"
    Grid[66][49] = "Tharbad"
    Grid[66][50] = "South Dunland"
    Grid[66][51] = "South Dunland"
    Grid[66][52] = "South Dunland"
    Grid[66][53] = "South Dunland"
    Grid[66][54] = "Gap of Rohan"
    Grid[66][55] = "Gap of Rohan"
    Grid[66][56] = "Gap of Rohan"
    Grid[66][57] = "Gap of Rohan"
    Grid[66][58] = "Gap of Rohan"
    Grid[66][59] = "Gap of Rohan"
    Grid[66][60] = "Gap of Rohan"
    Grid[66][61] = "Gap of Rohan"
    Grid[66][62] = "Gap of Rohan"
    Grid[66][63] = "Druwaith Iaur"
    Grid[66][64] = "Druwaith Iaur"
    Grid[66][65] = "Druwaith Iaur"
    Grid[66][66] = "Druwaith Iaur"
    Grid[66][67] = "Druwaith Iaur"
    Grid[66][68] = "Andrast"
    Grid[66][69] = "Andrast"
    Grid[66][70] = "Andrast"
    Grid[66][71] = "Andrast"
    Grid[66][72] = "Andrast"
    Grid[66][73] = "Andrast"
    Grid[66][74] = "Anfalas"
    Grid[66][75] = "Anfalas"
    Grid[66][76] = "Anfalas"
    Grid[66][77] = "Anfalas"
    Grid[66][78] = "Anfalas"
    Grid[66][79] = "Anfalas"
    Grid[66][80] = "Anfalas"
    Grid[66][81] = "Anfalas"
    Grid[66][82] = "Anfalas"
    Grid[66][83] = "Anfalas"
    Grid[67][1] = "Mount Gram"
    Grid[67][2] = "Mount Gram"
    Grid[67][3] = "Mount Gram"
    Grid[67][4] = "Mount Gram"
    Grid[67][5] = "Mount Gram"
    Grid[67][6] = "Mount Gram"
    Grid[67][7] = "Mount Gram"
    Grid[67][8] = "Mount Gram"
    Grid[67][9] = "Ettenmoors"
    Grid[67][10] = "Ettenmoors"
    Grid[67][11] = "Ettenmoors"
    Grid[67][12] = "Ettenmoors"
    Grid[67][13] = "Ettenmoors"
    Grid[67][14] = "Ettenmoors"
    Grid[67][15] = "Weather Hills"
    Grid[67][16] = "Weather Hills"
    Grid[67][17] = "Weather Hills"
    Grid[67][18] = "Weather Hills"
    Grid[67][19] = "Weather Hills"
    Grid[67][20] = "Weather Hills"
    Grid[67][21] = "Weather Hills"
    Grid[67][22] = "Weather Hills"
    Grid[67][23] = "South Downs"
    Grid[67][24] = "South Downs"
    Grid[67][25] = "South Downs"
    Grid[67][26] = "South Downs"
    Grid[67][27] = "South Downs"
    Grid[67][28] = "South Downs"
    Grid[67][29] = "South Downs"
    Grid[67][30] = "South Downs"
    Grid[67][31] = "South Downs"
    Grid[67][32] = "South Downs"
    Grid[67][33] = "South Downs"
    Grid[67][34] = "South Downs"
    Grid[67][35] = "South Downs"
    Grid[67][36] = "South Downs"
    Grid[67][37] = "South Downs"
    Grid[67][38] = "North Dunland"
    Grid[67][39] = "North Dunland"
    Grid[67][40] = "North Dunland"
    Grid[67][41] = "North Dunland"
    Grid[67][42] = "Tharbad"
    Grid[67][43] = "Tharbad"
    Grid[67][44] = "Tharbad"
    Grid[67][45] = "Tharbad"
    Grid[67][46] = "Tharbad"
    Grid[67][47] = "Tharbad"
    Grid[67][48] = "Tharbad"
    Grid[67][49] = "Tharbad"
    Grid[67][50] = "South Dunland"
    Grid[67][51] = "South Dunland"
    Grid[67][52] = "South Dunland"
    Grid[67][53] = "South Dunland"
    Grid[67][54] = "Gap of Rohan"
    Grid[67][55] = "Gap of Rohan"
    Grid[67][56] = "Gap of Rohan"
    Grid[67][57] = "Gap of Rohan"
    Grid[67][58] = "Gap of Rohan"
    Grid[67][59] = "Gap of Rohan"
    Grid[67][60] = "Gap of Rohan"
    Grid[67][61] = "Gap of Rohan"
    Grid[67][62] = "Gap of Rohan"
    Grid[67][63] = "Druwaith Iaur"
    Grid[67][64] = "Druwaith Iaur"
    Grid[67][65] = "Druwaith Iaur"
    Grid[67][66] = "Druwaith Iaur"
    Grid[67][67] = "Druwaith Iaur"
    Grid[67][68] = "Andrast"
    Grid[67][69] = "Andrast"
    Grid[67][70] = "Andrast"
    Grid[67][71] = "Andrast"
    Grid[67][72] = "Andrast"
    Grid[67][73] = "Anfalas"
    Grid[67][74] = "Anfalas"
    Grid[67][75] = "Anfalas"
    Grid[67][76] = "Anfalas"
    Grid[67][77] = "Anfalas"
    Grid[67][78] = "Anfalas"
    Grid[67][79] = "Anfalas"
    Grid[67][80] = "Anfalas"
    Grid[67][81] = "Anfalas"
    Grid[67][82] = "Anfalas"
    Grid[68][1] = "Mount Gram"
    Grid[68][2] = "Mount Gram"
    Grid[68][3] = "Mount Gram"
    Grid[68][4] = "Mount Gram"
    Grid[68][5] = "Mount Gram"
    Grid[68][6] = "Mount Gram"
    Grid[68][7] = "Mount Gram"
    Grid[68][8] = "Mount Gram"
    Grid[68][9] = "Mount Gram"
    Grid[68][10] = "Ettenmoors"
    Grid[68][11] = "Ettenmoors"
    Grid[68][12] = "Ettenmoors"
    Grid[68][13] = "Ettenmoors"
    Grid[68][14] = "Ettenmoors"
    Grid[68][15] = "Weather Hills"
    Grid[68][16] = "Weather Hills"
    Grid[68][17] = "Weather Hills"
    Grid[68][18] = "Weather Hills"
    Grid[68][19] = "Weather Hills"
    Grid[68][20] = "Weather Hills"
    Grid[68][21] = "Weather Hills"
    Grid[68][22] = "Weather Hills"
    Grid[68][23] = "Weather Hills"
    Grid[68][24] = "South Downs"
    Grid[68][25] = "South Downs"
    Grid[68][26] = "South Downs"
    Grid[68][27] = "South Downs"
    Grid[68][28] = "South Downs"
    Grid[68][29] = "South Downs"
    Grid[68][30] = "South Downs"
    Grid[68][31] = "South Downs"
    Grid[68][32] = "South Downs"
    Grid[68][33] = "South Downs"
    Grid[68][34] = "South Downs"
    Grid[68][35] = "South Downs"
    Grid[68][36] = "North Dunland"
    Grid[68][37] = "North Dunland"
    Grid[68][38] = "North Dunland"
    Grid[68][39] = "North Dunland"
    Grid[68][40] = "North Dunland"
    Grid[68][41] = "North Dunland"
    Grid[68][42] = "North Dunland"
    Grid[68][43] = "North Dunland"
    Grid[68][44] = "North Dunland"
    Grid[68][45] = "North Dunland"
    Grid[68][46] = "Tharbad"
    Grid[68][47] = "Tharbad"
    Grid[68][48] = "Tharbad"
    Grid[68][49] = "South Dunland"
    Grid[68][50] = "South Dunland"
    Grid[68][51] = "South Dunland"
    Grid[68][52] = "South Dunland"
    Grid[68][53] = "South Dunland"
    Grid[68][54] = "Gap of Rohan"
    Grid[68][55] = "Gap of Rohan"
    Grid[68][56] = "Gap of Rohan"
    Grid[68][57] = "Gap of Rohan"
    Grid[68][58] = "Gap of Rohan"
    Grid[68][59] = "Gap of Rohan"
    Grid[68][60] = "Gap of Rohan"
    Grid[68][61] = "Gap of Rohan"
    Grid[68][62] = "Fords of Isen"
    Grid[68][63] = "Fords of Isen"
    Grid[68][64] = "Druwaith Iaur"
    Grid[68][65] = "Druwaith Iaur"
    Grid[68][66] = "Druwaith Iaur"
    Grid[68][67] = "Druwaith Iaur"
    Grid[68][68] = "Andrast"
    Grid[68][69] = "Andrast"
    Grid[68][70] = "Andrast"
    Grid[68][71] = "Andrast"
    Grid[68][72] = "Anfalas"
    Grid[68][73] = "Anfalas"
    Grid[68][74] = "Anfalas"
    Grid[68][75] = "Anfalas"
    Grid[68][76] = "Anfalas"
    Grid[68][77] = "Anfalas"
    Grid[68][78] = "Anfalas"
    Grid[68][79] = "Anfalas"
    Grid[68][80] = "Anfalas"
    Grid[68][81] = "Anfalas"
    Grid[68][82] = "Anfalas"
    Grid[69][1] = "Mount Gram"
    Grid[69][2] = "Mount Gram"
    Grid[69][3] = "Mount Gram"
    Grid[69][4] = "Mount Gram"
    Grid[69][5] = "Mount Gram"
    Grid[69][6] = "Mount Gram"
    Grid[69][7] = "Mount Gram"
    Grid[69][8] = "Mount Gram"
    Grid[69][9] = "Mount Gram"
    Grid[69][10] = "Mount Gram"
    Grid[69][11] = "Ettenmoors"
    Grid[69][12] = "Ettenmoors"
    Grid[69][13] = "Ettenmoors"
    Grid[69][14] = "Ettenmoors"
    Grid[69][15] = "Ettenmoors"
    Grid[69][16] = "Weather Hills"
    Grid[69][17] = "Weather Hills"
    Grid[69][18] = "Weather Hills"
    Grid[69][19] = "Weather Hills"
    Grid[69][20] = "Weather Hills"
    Grid[69][21] = "Weather Hills"
    Grid[69][22] = "Weather Hills"
    Grid[69][23] = "Weather Hills"
    Grid[69][24] = "South Downs"
    Grid[69][25] = "South Downs"
    Grid[69][26] = "South Downs"
    Grid[69][27] = "South Downs"
    Grid[69][28] = "South Downs"
    Grid[69][29] = "South Downs"
    Grid[69][30] = "South Downs"
    Grid[69][31] = "South Downs"
    Grid[69][32] = "South Downs"
    Grid[69][33] = "South Downs"
    Grid[69][34] = "South Downs"
    Grid[69][35] = "Hollin"
    Grid[69][36] = "North Dunland"
    Grid[69][37] = "North Dunland"
    Grid[69][38] = "North Dunland"
    Grid[69][39] = "North Dunland"
    Grid[69][40] = "North Dunland"
    Grid[69][41] = "North Dunland"
    Grid[69][42] = "North Dunland"
    Grid[69][43] = "North Dunland"
    Grid[69][44] = "North Dunland"
    Grid[69][45] = "South Dunland"
    Grid[69][46] = "South Dunland"
    Grid[69][47] = "South Dunland"
    Grid[69][48] = "South Dunland"
    Grid[69][49] = "South Dunland"
    Grid[69][50] = "South Dunland"
    Grid[69][51] = "South Dunland"
    Grid[69][52] = "South Dunland"
    Grid[69][53] = "South Dunland"
    Grid[69][54] = "South Dunland"
    Grid[69][55] = "Gap of Rohan"
    Grid[69][56] = "Gap of Rohan"
    Grid[69][57] = "Gap of Rohan"
    Grid[69][58] = "Gap of Rohan"
    Grid[69][59] = "Gap of Rohan"
    Grid[69][60] = "Gap of Rohan"
    Grid[69][61] = "Fords of Isen"
    Grid[69][62] = "Fords of Isen"
    Grid[69][63] = "Fords of Isen"
    Grid[69][64] = "Druwaith Iaur"
    Grid[69][65] = "Druwaith Iaur"
    Grid[69][66] = "Druwaith Iaur"
    Grid[69][67] = "Druwaith Iaur"
    Grid[69][68] = "Andrast"
    Grid[69][69] = "Andrast"
    Grid[69][70] = "Andrast"
    Grid[69][71] = "Anfalas"
    Grid[69][72] = "Anfalas"
    Grid[69][73] = "Anfalas"
    Grid[69][74] = "Anfalas"
    Grid[69][75] = "Anfalas"
    Grid[69][76] = "Anfalas"
    Grid[69][77] = "Anfalas"
    Grid[69][78] = "Anfalas"
    Grid[69][79] = "Anfalas"
    Grid[69][80] = "Anfalas"
    Grid[69][81] = "Anfalas"
    Grid[70][1] = "Mount Gram"
    Grid[70][2] = "Mount Gram"
    Grid[70][3] = "Mount Gram"
    Grid[70][4] = "Mount Gram"
    Grid[70][5] = "Mount Gram"
    Grid[70][6] = "Mount Gram"
    Grid[70][7] = "Mount Gram"
    Grid[70][8] = "Mount Gram"
    Grid[70][9] = "Mount Gram"
    Grid[70][10] = "Mount Gram"
    Grid[70][11] = "Ettenmoors"
    Grid[70][12] = "Ettenmoors"
    Grid[70][13] = "Ettenmoors"
    Grid[70][14] = "Ettenmoors"
    Grid[70][15] = "Ettenmoors"
    Grid[70][16] = "Weather Hills"
    Grid[70][17] = "Weather Hills"
    Grid[70][18] = "Weather Hills"
    Grid[70][19] = "Weather Hills"
    Grid[70][20] = "Weather Hills"
    Grid[70][21] = "Weather Hills"
    Grid[70][22] = "Weather Hills"
    Grid[70][23] = "Weather Hills"
    Grid[70][24] = "Weather Hills"
    Grid[70][25] = "South Downs"
    Grid[70][26] = "South Downs"
    Grid[70][27] = "South Downs"
    Grid[70][28] = "South Downs"
    Grid[70][29] = "South Downs"
    Grid[70][30] = "South Downs"
    Grid[70][31] = "South Downs"
    Grid[70][32] = "South Downs"
    Grid[70][33] = "South Downs"
    Grid[70][34] = "Hollin"
    Grid[70][35] = "Hollin"
    Grid[70][36] = "Hollin"
    Grid[70][37] = "North Dunland"
    Grid[70][38] = "North Dunland"
    Grid[70][39] = "North Dunland"
    Grid[70][40] = "North Dunland"
    Grid[70][41] = "North Dunland"
    Grid[70][42] = "North Dunland"
    Grid[70][43] = "North Dunland"
    Grid[70][44] = "North Dunland"
    Grid[70][45] = "South Dunland"
    Grid[70][46] = "South Dunland"
    Grid[70][47] = "South Dunland"
    Grid[70][48] = "South Dunland"
    Grid[70][49] = "South Dunland"
    Grid[70][50] = "South Dunland"
    Grid[70][51] = "South Dunland"
    Grid[70][52] = "South Dunland"
    Grid[70][53] = "South Dunland"
    Grid[70][54] = "Orthanc"
    Grid[70][55] = "Gap of Rohan"
    Grid[70][56] = "Gap of Rohan"
    Grid[70][57] = "Orthanc"
    Grid[70][58] = "Orthanc"
    Grid[70][59] = "Gap of Rohan"
    Grid[70][60] = "Gap of Rohan"
    Grid[70][61] = "Fords of Isen"
    Grid[70][62] = "Fords of Isen"
    Grid[70][63] = "Fords of Isen"
    Grid[70][64] = "Fords of Isen"
    Grid[70][65] = "Druwaith Iaur"
    Grid[70][66] = "Druwaith Iaur"
    Grid[70][67] = "Druwaith Iaur"
    Grid[70][68] = "Andrast"
    Grid[70][69] = "Andrast"
    Grid[70][70] = "Andrast"
    Grid[70][71] = "Anfalas"
    Grid[70][72] = "Anfalas"
    Grid[70][73] = "Anfalas"
    Grid[70][74] = "Anfalas"
    Grid[70][75] = "Anfalas"
    Grid[70][76] = "Anfalas"
    Grid[70][77] = "Anfalas"
    Grid[70][78] = "Anfalas"
    Grid[70][79] = "Anfalas"
    Grid[70][80] = "Anfalas"
    Grid[70][81] = "Anfalas"
    Grid[71][1] = "Mount Gram"
    Grid[71][2] = "Mount Gram"
    Grid[71][3] = "Mount Gram"
    Grid[71][4] = "Mount Gram"
    Grid[71][5] = "Mount Gram"
    Grid[71][6] = "Mount Gram"
    Grid[71][7] = "Mount Gram"
    Grid[71][8] = "Mount Gram"
    Grid[71][9] = "Mount Gram"
    Grid[71][10] = "Mount Gram"
    Grid[71][11] = "Ettenmoors"
    Grid[71][12] = "Ettenmoors"
    Grid[71][13] = "Ettenmoors"
    Grid[71][14] = "Ettenmoors"
    Grid[71][15] = "Ettenmoors"
    Grid[71][16] = "Weather Hills"
    Grid[71][17] = "Weather Hills"
    Grid[71][18] = "Weather Hills"
    Grid[71][19] = "Weather Hills"
    Grid[71][20] = "Trollshaws"
    Grid[71][21] = "Trollshaws"
    Grid[71][22] = "Trollshaws"
    Grid[71][23] = "Trollshaws"
    Grid[71][24] = "Trollshaws"
    Grid[71][25] = "Trollshaws"
    Grid[71][26] = "South Downs"
    Grid[71][27] = "South Downs"
    Grid[71][28] = "South Downs"
    Grid[71][29] = "South Downs"
    Grid[71][30] = "South Downs"
    Grid[71][31] = "South Downs"
    Grid[71][32] = "South Downs"
    Grid[71][33] = "Hollin"
    Grid[71][34] = "Hollin"
    Grid[71][35] = "Hollin"
    Grid[71][36] = "Hollin"
    Grid[71][37] = "North Dunland"
    Grid[71][38] = "North Dunland"
    Grid[71][39] = "North Dunland"
    Grid[71][40] = "North Dunland"
    Grid[71][41] = "North Dunland"
    Grid[71][42] = "North Dunland"
    Grid[71][43] = "North Dunland"
    Grid[71][44] = "North Dunland"
    Grid[71][45] = "South Dunland"
    Grid[71][46] = "South Dunland"
    Grid[71][47] = "South Dunland"
    Grid[71][48] = "South Dunland"
    Grid[71][49] = "South Dunland"
    Grid[71][50] = "South Dunland"
    Grid[71][51] = "South Dunland"
    Grid[71][52] = "South Dunland"
    Grid[71][53] = "South Dunland"
    Grid[71][54] = "Orthanc"
    Grid[71][55] = "Orthanc"
    Grid[71][56] = "Orthanc"
    Grid[71][57] = "Orthanc"
    Grid[71][58] = "Orthanc"
    Grid[71][59] = "Orthanc"
    Grid[71][60] = "Gap of Rohan"
    Grid[71][61] = "Fords of Isen"
    Grid[71][62] = "Fords of Isen"
    Grid[71][63] = "Fords of Isen"
    Grid[71][64] = "Fords of Isen"
    Grid[71][65] = "Fords of Isen"
    Grid[71][66] = "Druwaith Iaur"
    Grid[71][67] = "Druwaith Iaur"
    Grid[71][68] = "Anfalas"
    Grid[71][69] = "Anfalas"
    Grid[71][70] = "Anfalas"
    Grid[71][71] = "Anfalas"
    Grid[71][72] = "Anfalas"
    Grid[71][73] = "Anfalas"
    Grid[71][74] = "Anfalas"
    Grid[71][75] = "Anfalas"
    Grid[71][76] = "Anfalas"
    Grid[71][77] = "Anfalas"
    Grid[71][78] = "Anfalas"
    Grid[71][79] = "Anfalas"
    Grid[71][80] = "Anfalas"
    Grid[71][81] = "Anfalas"
    Grid[72][1] = "Mount Gram"
    Grid[72][2] = "Mount Gram"
    Grid[72][3] = "Mount Gram"
    Grid[72][4] = "Mount Gram"
    Grid[72][5] = "Mount Gram"
    Grid[72][6] = "Mount Gram"
    Grid[72][7] = "Mount Gram"
    Grid[72][8] = "Mount Gram"
    Grid[72][9] = "Mount Gram"
    Grid[72][10] = "Mount Gram"
    Grid[72][11] = "Ettenmoors"
    Grid[72][12] = "Ettenmoors"
    Grid[72][13] = "Ettenmoors"
    Grid[72][14] = "Ettenmoors"
    Grid[72][15] = "Trollshaws"
    Grid[72][16] = "Trollshaws"
    Grid[72][17] = "Trollshaws"
    Grid[72][18] = "Trollshaws"
    Grid[72][19] = "Trollshaws"
    Grid[72][20] = "Trollshaws"
    Grid[72][21] = "Trollshaws"
    Grid[72][22] = "Trollshaws"
    Grid[72][23] = "Trollshaws"
    Grid[72][24] = "Trollshaws"
    Grid[72][25] = "Trollshaws"
    Grid[72][26] = "Trollshaws"
    Grid[72][27] = "Trollshaws"
    Grid[72][28] = "Trollshaws"
    Grid[72][29] = "Trollshaws"
    Grid[72][30] = "Trollshaws"
    Grid[72][31] = "South Downs"
    Grid[72][32] = "Hollin"
    Grid[72][33] = "Hollin"
    Grid[72][34] = "Hollin"
    Grid[72][35] = "Hollin"
    Grid[72][36] = "Hollin"
    Grid[72][37] = "Hollin"
    Grid[72][38] = "North Dunland"
    Grid[72][39] = "North Dunland"
    Grid[72][40] = "North Dunland"
    Grid[72][41] = "North Dunland"
    Grid[72][42] = "North Dunland"
    Grid[72][43] = "North Dunland"
    Grid[72][44] = "North Dunland"
    Grid[72][45] = "South Dunland"
    Grid[72][46] = "South Dunland"
    Grid[72][47] = "South Dunland"
    Grid[72][48] = "South Dunland"
    Grid[72][49] = "South Dunland"
    Grid[72][50] = "South Dunland"
    Grid[72][51] = "South Dunland"
    Grid[72][52] = "South Dunland"
    Grid[72][53] = "Orthanc"
    Grid[72][54] = "Orthanc"
    Grid[72][55] = "Orthanc"
    Grid[72][56] = "Orthanc"
    Grid[72][57] = "Orthanc"
    Grid[72][58] = "Orthanc"
    Grid[72][59] = "Orthanc"
    Grid[72][60] = "Orthanc"
    Grid[72][61] = "Fords of Isen"
    Grid[72][62] = "Fords of Isen"
    Grid[72][63] = "Fords of Isen"
    Grid[72][64] = "Fords of Isen"
    Grid[72][65] = "Fords of Isen"
    Grid[72][66] = "Fords of Isen"
    Grid[72][67] = "Druwaith Iaur"
    Grid[72][68] = "Anfalas"
    Grid[72][69] = "Anfalas"
    Grid[72][70] = "Anfalas"
    Grid[72][71] = "Anfalas"
    Grid[72][72] = "Anfalas"
    Grid[72][73] = "Anfalas"
    Grid[72][74] = "Anfalas"
    Grid[72][75] = "Anfalas"
    Grid[72][76] = "Anfalas"
    Grid[72][77] = "Anfalas"
    Grid[72][78] = "Anfalas"
    Grid[72][79] = "Anfalas"
    Grid[72][80] = "Anfalas"
    Grid[73][1] = "Mount Gram"
    Grid[73][2] = "Mount Gram"
    Grid[73][3] = "Mount Gram"
    Grid[73][4] = "Mount Gram"
    Grid[73][5] = "Mount Gundabad"
    Grid[73][6] = "Mount Gundabad"
    Grid[73][7] = "Mount Gundabad"
    Grid[73][8] = "Mount Gundabad"
    Grid[73][9] = "Mount Gundabad"
    Grid[73][10] = "Mount Gundabad"
    Grid[73][11] = "Trollshaws"
    Grid[73][12] = "Trollshaws"
    Grid[73][13] = "Trollshaws"
    Grid[73][14] = "Trollshaws"
    Grid[73][15] = "Trollshaws"
    Grid[73][16] = "Trollshaws"
    Grid[73][17] = "Trollshaws"
    Grid[73][18] = "Trollshaws"
    Grid[73][19] = "Trollshaws"
    Grid[73][20] = "Trollshaws"
    Grid[73][21] = "Trollshaws"
    Grid[73][22] = "Trollshaws"
    Grid[73][23] = "Trollshaws"
    Grid[73][24] = "Trollshaws"
    Grid[73][25] = "Trollshaws"
    Grid[73][26] = "Trollshaws"
    Grid[73][27] = "Trollshaws"
    Grid[73][28] = "Trollshaws"
    Grid[73][29] = "Trollshaws"
    Grid[73][30] = "Hollin"
    Grid[73][31] = "Hollin"
    Grid[73][32] = "Hollin"
    Grid[73][33] = "Hollin"
    Grid[73][34] = "Hollin"
    Grid[73][35] = "Hollin"
    Grid[73][36] = "Hollin"
    Grid[73][37] = "Hollin"
    Grid[73][38] = "Hollin"
    Grid[73][39] = "North Dunland"
    Grid[73][40] = "North Dunland"
    Grid[73][41] = "North Dunland"
    Grid[73][42] = "North Dunland"
    Grid[73][43] = "North Dunland"
    Grid[73][44] = "North Dunland"
    Grid[73][45] = "North Dunland"
    Grid[73][46] = "South Dunland"
    Grid[73][47] = "South Dunland"
    Grid[73][48] = "South Dunland"
    Grid[73][49] = "South Dunland"
    Grid[73][50] = "South Dunland"
    Grid[73][51] = "South Dunland"
    Grid[73][52] = "South Dunland"
    Grid[73][53] = "Orthanc"
    Grid[73][54] = "Orthanc"
    Grid[73][55] = "Orthanc"
    Grid[73][56] = "Orthanc"
    Grid[73][57] = "Orthanc"
    Grid[73][58] = "Orthanc"
    Grid[73][59] = "Orthanc"
    Grid[73][60] = "Orthanc"
    Grid[73][61] = "Fords of Isen"
    Grid[73][62] = "Fords of Isen"
    Grid[73][63] = "Fords of Isen"
    Grid[73][64] = "Fords of Isen"
    Grid[73][65] = "Fords of Isen"
    Grid[73][66] = "Fords of Isen"
    Grid[73][67] = "Anfalas"
    Grid[73][68] = "Anfalas"
    Grid[73][69] = "Anfalas"
    Grid[73][70] = "Anfalas"
    Grid[73][71] = "Anfalas"
    Grid[73][72] = "Erech"
    Grid[73][73] = "Erech"
    Grid[73][74] = "Erech"
    Grid[73][75] = "Anfalas"
    Grid[73][76] = "Anfalas"
    Grid[73][77] = "Anfalas"
    Grid[73][78] = "Anfalas"
    Grid[73][79] = "Anfalas"
    Grid[73][80] = "Anfalas"
    Grid[73][81] = "Anfalas"
    Grid[74][1] = "Mount Gundabad"
    Grid[74][2] = "Mount Gundabad"
    Grid[74][3] = "Mount Gundabad"
    Grid[74][4] = "Mount Gundabad"
    Grid[74][5] = "Mount Gundabad"
    Grid[74][6] = "Mount Gundabad"
    Grid[74][7] = "Mount Gundabad"
    Grid[74][8] = "Mount Gundabad"
    Grid[74][9] = "Mount Gundabad"
    Grid[74][10] = "Mount Gundabad"
    Grid[74][11] = "Trollshaws"
    Grid[74][12] = "Trollshaws"
    Grid[74][13] = "Trollshaws"
    Grid[74][14] = "Trollshaws"
    Grid[74][15] = "Trollshaws"
    Grid[74][16] = "Trollshaws"
    Grid[74][17] = "Trollshaws"
    Grid[74][18] = "Trollshaws"
    Grid[74][19] = "Trollshaws"
    Grid[74][20] = "Trollshaws"
    Grid[74][21] = "Trollshaws"
    Grid[74][22] = "Trollshaws"
    Grid[74][23] = "Trollshaws"
    Grid[74][24] = "Trollshaws"
    Grid[74][25] = "Trollshaws"
    Grid[74][26] = "Trollshaws"
    Grid[74][27] = "Trollshaws"
    Grid[74][28] = "Trollshaws"
    Grid[74][29] = "Fords of Bruinen"
    Grid[74][30] = "Hollin"
    Grid[74][31] = "Hollin"
    Grid[74][32] = "Hollin"
    Grid[74][33] = "Hollin"
    Grid[74][34] = "Hollin"
    Grid[74][35] = "Hollin"
    Grid[74][36] = "Hollin"
    Grid[74][37] = "Hollin"
    Grid[74][38] = "North Dunland"
    Grid[74][39] = "North Dunland"
    Grid[74][40] = "North Dunland"
    Grid[74][41] = "North Dunland"
    Grid[74][42] = "North Dunland"
    Grid[74][43] = "North Dunland"
    Grid[74][44] = "North Dunland"
    Grid[74][45] = "North Dunland"
    Grid[74][46] = "South Dunland"
    Grid[74][47] = "South Dunland"
    Grid[74][48] = "South Dunland"
    Grid[74][49] = "South Dunland"
    Grid[74][50] = "South Dunland"
    Grid[74][51] = "South Dunland"
    Grid[74][52] = "South Dunland"
    Grid[74][53] = "Orthanc"
    Grid[74][54] = "Orthanc"
    Grid[74][55] = "Orthanc"
    Grid[74][56] = "Orthanc"
    Grid[74][57] = "Orthanc"
    Grid[74][58] = "Orthanc"
    Grid[74][59] = "Orthanc"
    Grid[74][60] = "Orthanc"
    Grid[74][61] = "Fords of Isen"
    Grid[74][62] = "Fords of Isen"
    Grid[74][63] = "Fords of Isen"
    Grid[74][64] = "Fords of Isen"
    Grid[74][65] = "Fords of Isen"
    Grid[74][66] = "Helm's Deep"
    Grid[74][67] = "Helm's Deep"
    Grid[74][68] = "Anfalas"
    Grid[74][69] = "Anfalas"
    Grid[74][70] = "Anfalas"
    Grid[74][71] = "Anfalas"
    Grid[74][72] = "Erech"
    Grid[74][73] = "Erech"
    Grid[74][74] = "Erech"
    Grid[74][75] = "Anfalas"
    Grid[74][76] = "Anfalas"
    Grid[74][77] = "Anfalas"
    Grid[74][78] = "Anfalas"
    Grid[74][79] = "Anfalas"
    Grid[74][80] = "Anfalas"
    Grid[74][81] = "Anfalas"
    Grid[75][1] = "Mount Gundabad"
    Grid[75][2] = "Mount Gundabad"
    Grid[75][3] = "Mount Gundabad"
    Grid[75][4] = "Mount Gundabad"
    Grid[75][5] = "Mount Gundabad"
    Grid[75][6] = "Mount Gundabad"
    Grid[75][7] = "Mount Gundabad"
    Grid[75][8] = "Mount Gundabad"
    Grid[75][9] = "Mount Gundabad"
    Grid[75][10] = "Mount Gundabad"
    Grid[75][11] = "Trollshaws"
    Grid[75][12] = "Trollshaws"
    Grid[75][13] = "Trollshaws"
    Grid[75][14] = "Trollshaws"
    Grid[75][15] = "Trollshaws"
    Grid[75][16] = "Trollshaws"
    Grid[75][17] = "Trollshaws"
    Grid[75][18] = "Trollshaws"
    Grid[75][19] = "Trollshaws"
    Grid[75][20] = "Trollshaws"
    Grid[75][21] = "Rivendell"
    Grid[75][22] = "Fords of Bruinen"
    Grid[75][23] = "Fords of Bruinen"
    Grid[75][24] = "Fords of Bruinen"
    Grid[75][25] = "Fords of Bruinen"
    Grid[75][26] = "Fords of Bruinen"
    Grid[75][27] = "Fords of Bruinen"
    Grid[75][28] = "Fords of Bruinen"
    Grid[75][29] = "Fords of Bruinen"
    Grid[75][30] = "Fords of Bruinen"
    Grid[75][31] = "Hollin"
    Grid[75][32] = "Hollin"
    Grid[75][33] = "Hollin"
    Grid[75][34] = "Hollin"
    Grid[75][35] = "Hollin"
    Grid[75][36] = "Hollin"
    Grid[75][37] = "Hollin"
    Grid[75][38] = "North Dunland"
    Grid[75][39] = "North Dunland"
    Grid[75][40] = "North Dunland"
    Grid[75][41] = "North Dunland"
    Grid[75][42] = "North Dunland"
    Grid[75][43] = "North Dunland"
    Grid[75][44] = "North Dunland"
    Grid[75][45] = "South Dunland"
    Grid[75][46] = "South Dunland"
    Grid[75][47] = "South Dunland"
    Grid[75][48] = "South Dunland"
    Grid[75][49] = "South Dunland"
    Grid[75][50] = "South Dunland"
    Grid[75][51] = "South Dunland"
    Grid[75][52] = "Orthanc"
    Grid[75][53] = "Orthanc"
    Grid[75][54] = "Orthanc"
    Grid[75][55] = "Orthanc"
    Grid[75][56] = "Orthanc"
    Grid[75][57] = "Orthanc"
    Grid[75][58] = "Orthanc"
    Grid[75][59] = "Orthanc"
    Grid[75][60] = "Orthanc"
    Grid[75][61] = "Fords of Isen"
    Grid[75][62] = "Fords of Isen"
    Grid[75][63] = "Fords of Isen"
    Grid[75][64] = "Helm's Deep"
    Grid[75][65] = "Helm's Deep"
    Grid[75][66] = "Helm's Deep"
    Grid[75][67] = "Helm's Deep"
    Grid[75][68] = "Helm's Deep"
    Grid[75][69] = "Anfalas"
    Grid[75][70] = "Anfalas"
    Grid[75][71] = "Erech"
    Grid[75][72] = "Erech"
    Grid[75][73] = "Erech"
    Grid[75][74] = "Erech"
    Grid[75][75] = "Anfalas"
    Grid[75][76] = "Anfalas"
    Grid[75][77] = "Anfalas"
    Grid[75][78] = "Anfalas"
    Grid[75][79] = "Anfalas"
    Grid[75][80] = "Anfalas"
    Grid[76][1] = "Mount Gundabad"
    Grid[76][2] = "Mount Gundabad"
    Grid[76][3] = "Mount Gundabad"
    Grid[76][4] = "Mount Gundabad"
    Grid[76][5] = "Mount Gundabad"
    Grid[76][6] = "Mount Gundabad"
    Grid[76][7] = "Mount Gundabad"
    Grid[76][8] = "Mount Gundabad"
    Grid[76][9] = "Mount Gundabad"
    Grid[76][10] = "Mount Gundabad"
    Grid[76][11] = "Trollshaws"
    Grid[76][12] = "Trollshaws"
    Grid[76][13] = "Trollshaws"
    Grid[76][14] = "Rivendell"
    Grid[76][15] = "Rivendell"
    Grid[76][16] = "Rivendell"
    Grid[76][17] = "Rivendell"
    Grid[76][18] = "Rivendell"
    Grid[76][19] = "Rivendell"
    Grid[76][20] = "Rivendell"
    Grid[76][21] = "Rivendell"
    Grid[76][22] = "Fords of Bruinen"
    Grid[76][23] = "Fords of Bruinen"
    Grid[76][24] = "Fords of Bruinen"
    Grid[76][25] = "Fords of Bruinen"
    Grid[76][26] = "Fords of Bruinen"
    Grid[76][27] = "Fords of Bruinen"
    Grid[76][28] = "Fords of Bruinen"
    Grid[76][29] = "Fords of Bruinen"
    Grid[76][30] = "Hollin"
    Grid[76][31] = "Hollin"
    Grid[76][32] = "Hollin"
    Grid[76][33] = "Hollin"
    Grid[76][34] = "Hollin"
    Grid[76][35] = "Hollin"
    Grid[76][36] = "Hollin"
    Grid[76][37] = "Hollin"
    Grid[76][38] = "North Dunland"
    Grid[76][39] = "North Dunland"
    Grid[76][40] = "North Dunland"
    Grid[76][41] = "North Dunland"
    Grid[76][42] = "North Dunland"
    Grid[76][43] = "North Dunland"
    Grid[76][44] = "North Dunland"
    Grid[76][45] = "South Dunland"
    Grid[76][46] = "South Dunland"
    Grid[76][47] = "South Dunland"
    Grid[76][48] = "South Dunland"
    Grid[76][49] = "South Dunland"
    Grid[76][50] = "South Dunland"
    Grid[76][51] = "South Dunland"
    Grid[76][52] = "Orthanc"
    Grid[76][53] = "Orthanc"
    Grid[76][54] = "Orthanc"
    Grid[76][55] = "Orthanc"
    Grid[76][56] = "Orthanc"
    Grid[76][57] = "Orthanc"
    Grid[76][58] = "Orthanc"
    Grid[76][59] = "Orthanc"
    Grid[76][60] = "Orthanc"
    Grid[76][61] = "Fords of Isen"
    Grid[76][62] = "Fords of Isen"
    Grid[76][63] = "Fords of Isen"
    Grid[76][64] = "Helm's Deep"
    Grid[76][65] = "Helm's Deep"
    Grid[76][66] = "Helm's Deep"
    Grid[76][67] = "Helm's Deep"
    Grid[76][68] = "Helm's Deep"
    Grid[76][69] = "Helm's Deep"
    Grid[76][70] = "Erech"
    Grid[76][71] = "Erech"
    Grid[76][72] = "Erech"
    Grid[76][73] = "Erech"
    Grid[76][74] = "Erech"
    Grid[76][75] = "Erech"
    Grid[76][76] = "Anfalas"
    Grid[76][77] = "Anfalas"
    Grid[76][78] = "Anfalas"
    Grid[76][79] = "Anfalas"
    Grid[76][80] = "Anfalas"
    Grid[77][1] = "Mount Gundabad"
    Grid[77][2] = "Mount Gundabad"
    Grid[77][3] = "Mount Gundabad"
    Grid[77][4] = "Mount Gundabad"
    Grid[77][5] = "Mount Gundabad"
    Grid[77][6] = "Mount Gundabad"
    Grid[77][7] = "Mount Gundabad"
    Grid[77][8] = "Mount Gundabad"
    Grid[77][9] = "Mount Gundabad"
    Grid[77][10] = "Mount Gundabad"
    Grid[77][11] = "Trollshaws"
    Grid[77][12] = "Trollshaws"
    Grid[77][13] = "Rivendell"
    Grid[77][14] = "Rivendell"
    Grid[77][15] = "Rivendell"
    Grid[77][16] = "Rivendell"
    Grid[77][17] = "Rivendell"
    Grid[77][18] = "Rivendell"
    Grid[77][19] = "Rivendell"
    Grid[77][20] = "Rivendell"
    Grid[77][21] = "Fords of Bruinen"
    Grid[77][22] = "Fords of Bruinen"
    Grid[77][23] = "Fords of Bruinen"
    Grid[77][24] = "Fords of Bruinen"
    Grid[77][25] = "Fords of Bruinen"
    Grid[77][26] = "Fords of Bruinen"
    Grid[77][27] = "Fords of Bruinen"
    Grid[77][28] = "Fords of Bruinen"
    Grid[77][29] = "Fords of Bruinen"
    Grid[77][30] = "Hollin"
    Grid[77][31] = "Hollin"
    Grid[77][32] = "Hollin"
    Grid[77][33] = "Hollin"
    Grid[77][34] = "Hollin"
    Grid[77][35] = "Hollin"
    Grid[77][36] = "Hollin"
    Grid[77][37] = "Moria"
    Grid[77][38] = "North Dunland"
    Grid[77][39] = "North Dunland"
    Grid[77][40] = "North Dunland"
    Grid[77][41] = "North Dunland"
    Grid[77][42] = "North Dunland"
    Grid[77][43] = "North Dunland"
    Grid[77][44] = "North Dunland"
    Grid[77][45] = "South Dunland"
    Grid[77][46] = "South Dunland"
    Grid[77][47] = "South Dunland"
    Grid[77][48] = "South Dunland"
    Grid[77][49] = "South Dunland"
    Grid[77][50] = "Orthanc"
    Grid[77][51] = "Orthanc"
    Grid[77][52] = "Orthanc"
    Grid[77][53] = "Orthanc"
    Grid[77][54] = "Orthanc"
    Grid[77][55] = "Orthanc"
    Grid[77][56] = "Orthanc"
    Grid[77][57] = "Orthanc"
    Grid[77][58] = "Orthanc"
    Grid[77][59] = "Orthanc"
    Grid[77][60] = "Fords of Isen"
    Grid[77][61] = "Fords of Isen"
    Grid[77][62] = "Fords of Isen"
    Grid[77][63] = "Helm's Deep"
    Grid[77][64] = "Helm's Deep"
    Grid[77][65] = "Helm's Deep"
    Grid[77][66] = "Helm's Deep"
    Grid[77][67] = "Helm's Deep"
    Grid[77][68] = "Helm's Deep"
    Grid[77][69] = "Helm's Deep"
    Grid[77][70] = "Erech"
    Grid[77][71] = "Erech"
    Grid[77][72] = "Erech"
    Grid[77][73] = "Erech"
    Grid[77][74] = "Erech"
    Grid[77][75] = "Erech"
    Grid[77][76] = "Anfalas"
    Grid[77][77] = "Anfalas"
    Grid[77][78] = "Anfalas"
    Grid[77][79] = "Anfalas"
    Grid[77][80] = "Anfalas"
    Grid[78][1] = "Mount Gundabad"
    Grid[78][2] = "Mount Gundabad"
    Grid[78][3] = "Mount Gundabad"
    Grid[78][4] = "Mount Gundabad"
    Grid[78][5] = "Mount Gundabad"
    Grid[78][6] = "Mount Gundabad"
    Grid[78][7] = "Mount Gundabad"
    Grid[78][8] = "Mount Gundabad"
    Grid[78][9] = "Mount Gundabad"
    Grid[78][10] = "Mount Gundabad"
    Grid[78][11] = "Rivendell"
    Grid[78][12] = "Rivendell"
    Grid[78][13] = "Rivendell"
    Grid[78][14] = "Rivendell"
    Grid[78][15] = "Rivendell"
    Grid[78][16] = "Rivendell"
    Grid[78][17] = "Rivendell"
    Grid[78][18] = "Rivendell"
    Grid[78][19] = "Rivendell"
    Grid[78][20] = "Rivendell"
    Grid[78][21] = "Fords of Bruinen"
    Grid[78][22] = "Fords of Bruinen"
    Grid[78][23] = "Fords of Bruinen"
    Grid[78][24] = "Fords of Bruinen"
    Grid[78][25] = "Fords of Bruinen"
    Grid[78][26] = "Fords of Bruinen"
    Grid[78][27] = "High Pass"
    Grid[78][28] = "High Pass"
    Grid[78][29] = "Fords of Bruinen"
    Grid[78][30] = "Moria"
    Grid[78][31] = "Moria"
    Grid[78][32] = "Moria"
    Grid[78][33] = "Moria"
    Grid[78][34] = "Moria"
    Grid[78][35] = "Moria"
    Grid[78][36] = "Moria"
    Grid[78][37] = "Moria"
    Grid[78][38] = "North Dunland"
    Grid[78][39] = "North Dunland"
    Grid[78][40] = "North Dunland"
    Grid[78][41] = "North Dunland"
    Grid[78][42] = "North Dunland"
    Grid[78][43] = "North Dunland"
    Grid[78][44] = "Fangorn"
    Grid[78][45] = "Fangorn"
    Grid[78][46] = "Fangorn"
    Grid[78][47] = "Fangorn"
    Grid[78][48] = "Fangorn"
    Grid[78][49] = "Fangorn"
    Grid[78][50] = "Fangorn"
    Grid[78][51] = "Orthanc"
    Grid[78][52] = "Orthanc"
    Grid[78][53] = "Orthanc"
    Grid[78][54] = "Orthanc"
    Grid[78][55] = "Orthanc"
    Grid[78][56] = "Orthanc"
    Grid[78][57] = "Orthanc"
    Grid[78][58] = "Orthanc"
    Grid[78][59] = "Fords of Isen"
    Grid[78][60] = "Fords of Isen"
    Grid[78][61] = "Fords of Isen"
    Grid[78][62] = "Fords of Isen"
    Grid[78][63] = "Helm's Deep"
    Grid[78][64] = "Helm's Deep"
    Grid[78][65] = "Helm's Deep"
    Grid[78][66] = "Helm's Deep"
    Grid[78][67] = "Helm's Deep"
    Grid[78][68] = "Helm's Deep"
    Grid[78][69] = "Helm's Deep"
    Grid[78][70] = "Erech"
    Grid[78][71] = "Erech"
    Grid[78][72] = "Erech"
    Grid[78][73] = "Erech"
    Grid[78][74] = "Erech"
    Grid[78][75] = "Erech"
    Grid[78][76] = "Erech"
    Grid[78][77] = "Anfalas"
    Grid[78][78] = "Anfalas"
    Grid[78][79] = "Anfalas"
    Grid[79][1] = "Mount Gundabad"
    Grid[79][7] = "Mount Gundabad"
    Grid[79][8] = "Mount Gundabad"
    Grid[79][9] = "Mount Gundabad"
    Grid[79][10] = "Mount Gundabad"
    Grid[79][11] = "Mount Gundabad"
    Grid[79][12] = "Rivendell"
    Grid[79][13] = "Rivendell"
    Grid[79][14] = "Rivendell"
    Grid[79][15] = "Rivendell"
    Grid[79][16] = "Rivendell"
    Grid[79][17] = "Rivendell"
    Grid[79][18] = "Rivendell"
    Grid[79][19] = "Rivendell"
    Grid[79][20] = "Rivendell"
    Grid[79][21] = "High Pass"
    Grid[79][22] = "High Pass"
    Grid[79][23] = "High Pass"
    Grid[79][24] = "High Pass"
    Grid[79][25] = "High Pass"
    Grid[79][26] = "High Pass"
    Grid[79][27] = "High Pass"
    Grid[79][28] = "High Pass"
    Grid[79][29] = "Moria"
    Grid[79][30] = "Moria"
    Grid[79][31] = "Moria"
    Grid[79][32] = "Moria"
    Grid[79][33] = "Moria"
    Grid[79][34] = "Moria"
    Grid[79][35] = "Moria"
    Grid[79][36] = "Moria"
    Grid[79][37] = "Moria"
    Grid[79][38] = "North Dunland"
    Grid[79][39] = "North Dunland"
    Grid[79][40] = "North Dunland"
    Grid[79][41] = "North Dunland"
    Grid[79][42] = "North Dunland"
    Grid[79][43] = "Fangorn"
    Grid[79][44] = "Fangorn"
    Grid[79][45] = "Fangorn"
    Grid[79][46] = "Fangorn"
    Grid[79][47] = "Fangorn"
    Grid[79][48] = "Fangorn"
    Grid[79][49] = "Fangorn"
    Grid[79][50] = "Fangorn"
    Grid[79][51] = "Fangorn"
    Grid[79][52] = "Orthanc"
    Grid[79][53] = "Orthanc"
    Grid[79][54] = "Orthanc"
    Grid[79][55] = "Orthanc"
    Grid[79][56] = "Orthanc"
    Grid[79][57] = "Orthanc"
    Grid[79][58] = "Fords of Isen"
    Grid[79][59] = "Fords of Isen"
    Grid[79][60] = "Fords of Isen"
    Grid[79][61] = "Fords of Isen"
    Grid[79][62] = "Fords of Isen"
    Grid[79][63] = "Helm's Deep"
    Grid[79][64] = "Helm's Deep"
    Grid[79][65] = "Helm's Deep"
    Grid[79][66] = "Helm's Deep"
    Grid[79][67] = "Helm's Deep"
    Grid[79][68] = "Helm's Deep"
    Grid[79][69] = "Helm's Deep"
    Grid[79][70] = "Erech"
    Grid[79][71] = "Erech"
    Grid[79][72] = "Erech"
    Grid[79][73] = "Erech"
    Grid[79][74] = "Erech"
    Grid[79][75] = "Erech"
    Grid[79][76] = "Erech"
    Grid[79][77] = "Erech"
    Grid[79][78] = "Anfalas"
    Grid[79][79] = "Dol Amroth"
    Grid[80][1] = "Mount Gundabad"
    Grid[80][8] = "Mount Gundabad"
    Grid[80][9] = "Mount Gundabad"
    Grid[80][10] = "Mount Gundabad"
    Grid[80][11] = "Mount Gundabad"
    Grid[80][12] = "Rivendell"
    Grid[80][13] = "Rivendell"
    Grid[80][14] = "Rivendell"
    Grid[80][15] = "Rivendell"
    Grid[80][16] = "Rivendell"
    Grid[80][17] = "Rivendell"
    Grid[80][18] = "Rivendell"
    Grid[80][19] = "Rivendell"
    Grid[80][20] = "High Pass"
    Grid[80][21] = "High Pass"
    Grid[80][22] = "High Pass"
    Grid[80][23] = "High Pass"
    Grid[80][24] = "High Pass"
    Grid[80][25] = "High Pass"
    Grid[80][26] = "High Pass"
    Grid[80][27] = "Moria"
    Grid[80][28] = "Moria"
    Grid[80][29] = "Moria"
    Grid[80][30] = "Moria"
    Grid[80][31] = "Moria"
    Grid[80][32] = "Moria"
    Grid[80][33] = "Moria"
    Grid[80][34] = "Moria"
    Grid[80][35] = "Moria"
    Grid[80][36] = "Moria"
    Grid[80][37] = "Lorien"
    Grid[80][38] = "North Dunland"
    Grid[80][39] = "North Dunland"
    Grid[80][40] = "North Dunland"
    Grid[80][41] = "North Dunland"
    Grid[80][42] = "Fangorn"
    Grid[80][43] = "Fangorn"
    Grid[80][44] = "Fangorn"
    Grid[80][45] = "Fangorn"
    Grid[80][46] = "Fangorn"
    Grid[80][47] = "Fangorn"
    Grid[80][48] = "Fangorn"
    Grid[80][49] = "Fangorn"
    Grid[80][50] = "Fangorn"
    Grid[80][51] = "Fangorn"
    Grid[80][52] = "Fangorn"
    Grid[80][53] = "Orthanc"
    Grid[80][54] = "Orthanc"
    Grid[80][55] = "Orthanc"
    Grid[80][56] = "Orthanc"
    Grid[80][57] = "Orthanc"
    Grid[80][58] = "Fords of Isen"
    Grid[80][59] = "Fords of Isen"
    Grid[80][60] = "Fords of Isen"
    Grid[80][61] = "Fords of Isen"
    Grid[80][62] = "Fords of Isen"
    Grid[80][63] = "Helm's Deep"
    Grid[80][64] = "Helm's Deep"
    Grid[80][65] = "Helm's Deep"
    Grid[80][66] = "Helm's Deep"
    Grid[80][67] = "Helm's Deep"
    Grid[80][68] = "Helm's Deep"
    Grid[80][69] = "Erech"
    Grid[80][70] = "Erech"
    Grid[80][71] = "Erech"
    Grid[80][72] = "Erech"
    Grid[80][73] = "Erech"
    Grid[80][74] = "Erech"
    Grid[80][75] = "Erech"
    Grid[80][76] = "Erech"
    Grid[80][77] = "Erech"
    Grid[80][78] = "Dol Amroth"
    Grid[80][79] = "Dol Amroth"
    Grid[80][82] = "Dol Amroth"
    Grid[80][83] = "Dol Amroth"
    Grid[80][84] = "Dol Amroth"
    Grid[80][85] = "Dol Amroth"
    Grid[80][86] = "Dol Amroth"
    Grid[81][1] = "Mount Gundabad"
    Grid[81][8] = "Mount Gundabad"
    Grid[81][9] = "Mount Gundabad"
    Grid[81][10] = "Mount Gundabad"
    Grid[81][11] = "Eagles' Eyrie"
    Grid[81][12] = "Rivendell"
    Grid[81][13] = "Rivendell"
    Grid[81][14] = "Rivendell"
    Grid[81][15] = "Rivendell"
    Grid[81][16] = "Rivendell"
    Grid[81][17] = "Rivendell"
    Grid[81][18] = "Rivendell"
    Grid[81][19] = "Rivendell"
    Grid[81][20] = "High Pass"
    Grid[81][21] = "High Pass"
    Grid[81][22] = "High Pass"
    Grid[81][23] = "High Pass"
    Grid[81][24] = "High Pass"
    Grid[81][25] = "Moria"
    Grid[81][26] = "Moria"
    Grid[81][27] = "Moria"
    Grid[81][28] = "Moria"
    Grid[81][29] = "Moria"
    Grid[81][30] = "Moria"
    Grid[81][31] = "Moria"
    Grid[81][32] = "Moria"
    Grid[81][33] = "Moria"
    Grid[81][34] = "Moria"
    Grid[81][35] = "Moria"
    Grid[81][36] = "Moria"
    Grid[81][37] = "Lorien"
    Grid[81][38] = "Lorien"
    Grid[81][39] = "Lorien"
    Grid[81][40] = "Lorien"
    Grid[81][41] = "North Dunland"
    Grid[81][42] = "Parth Celebrant"
    Grid[81][43] = "Fangorn"
    Grid[81][44] = "Fangorn"
    Grid[81][45] = "Fangorn"
    Grid[81][46] = "Fangorn"
    Grid[81][47] = "Fangorn"
    Grid[81][48] = "Fangorn"
    Grid[81][49] = "Fangorn"
    Grid[81][50] = "Fangorn"
    Grid[81][51] = "Fangorn"
    Grid[81][52] = "Fangorn"
    Grid[81][53] = "Fangorn"
    Grid[81][54] = "Fangorn"
    Grid[81][55] = "Fords of Isen"
    Grid[81][56] = "Fords of Isen"
    Grid[81][57] = "Fords of Isen"
    Grid[81][58] = "Fords of Isen"
    Grid[81][59] = "Fords of Isen"
    Grid[81][60] = "Fords of Isen"
    Grid[81][61] = "Fords of Isen"
    Grid[81][62] = "Helm's Deep"
    Grid[81][63] = "Helm's Deep"
    Grid[81][64] = "Helm's Deep"
    Grid[81][65] = "Helm's Deep"
    Grid[81][66] = "Helm's Deep"
    Grid[81][67] = "Helm's Deep"
    Grid[81][68] = "Helm's Deep"
    Grid[81][69] = "Erech"
    Grid[81][70] = "Erech"
    Grid[81][71] = "Erech"
    Grid[81][72] = "Erech"
    Grid[81][73] = "Erech"
    Grid[81][74] = "Erech"
    Grid[81][75] = "Erech"
    Grid[81][76] = "Dol Amroth"
    Grid[81][77] = "Dol Amroth"
    Grid[81][78] = "Dol Amroth"
    Grid[81][79] = "Dol Amroth"
    Grid[81][82] = "Dol Amroth"
    Grid[81][83] = "Dol Amroth"
    Grid[81][84] = "Dol Amroth"
    Grid[81][85] = "Dol Amroth"
    Grid[81][86] = "Dol Amroth"
    Grid[81][87] = "Dol Amroth"
    Grid[81][88] = "Dol Amroth"
    Grid[81][89] = "Dol Amroth"
    Grid[82][1] = "Mount Gundabad"
    Grid[82][8] = "Mount Gundabad"
    Grid[82][9] = "Eagles' Eyrie"
    Grid[82][10] = "Eagles' Eyrie"
    Grid[82][11] = "Eagles' Eyrie"
    Grid[82][12] = "Eagles' Eyrie"
    Grid[82][13] = "Rivendell"
    Grid[82][14] = "Rivendell"
    Grid[82][15] = "Rivendell"
    Grid[82][16] = "Rivendell"
    Grid[82][17] = "Rivendell"
    Grid[82][18] = "Rivendell"
    Grid[82][19] = "Goblin's Gate"
    Grid[82][20] = "High Pass"
    Grid[82][21] = "High Pass"
    Grid[82][22] = "Goblin's Gate"
    Grid[82][23] = "Goblin's Gate"
    Grid[82][24] = "Moria"
    Grid[82][25] = "Moria"
    Grid[82][26] = "Moria"
    Grid[82][27] = "Moria"
    Grid[82][28] = "Moria"
    Grid[82][29] = "Moria"
    Grid[82][30] = "Moria"
    Grid[82][31] = "Moria"
    Grid[82][32] = "Moria"
    Grid[82][33] = "Moria"
    Grid[82][34] = "Moria"
    Grid[82][35] = "Lorien"
    Grid[82][36] = "Lorien"
    Grid[82][37] = "Lorien"
    Grid[82][38] = "Lorien"
    Grid[82][39] = "Lorien"
    Grid[82][40] = "Lorien"
    Grid[82][41] = "Lorien"
    Grid[82][42] = "Parth Celebrant"
    Grid[82][43] = "Parth Celebrant"
    Grid[82][44] = "Parth Celebrant"
    Grid[82][45] = "Parth Celebrant"
    Grid[82][46] = "Fangorn"
    Grid[82][47] = "Fangorn"
    Grid[82][48] = "Fangorn"
    Grid[82][49] = "Fangorn"
    Grid[82][50] = "Fangorn"
    Grid[82][51] = "Fangorn"
    Grid[82][52] = "Fangorn"
    Grid[82][53] = "Fangorn"
    Grid[82][54] = "Fangorn"
    Grid[82][55] = "Fords of Isen"
    Grid[82][56] = "Fords of Isen"
    Grid[82][57] = "Fords of Isen"
    Grid[82][58] = "Fords of Isen"
    Grid[82][59] = "Fords of Isen"
    Grid[82][60] = "Fords of Isen"
    Grid[82][61] = "Fords of Isen"
    Grid[82][62] = "Helm's Deep"
    Grid[82][63] = "Helm's Deep"
    Grid[82][64] = "Helm's Deep"
    Grid[82][65] = "Helm's Deep"
    Grid[82][66] = "Helm's Deep"
    Grid[82][67] = "Helm's Deep"
    Grid[82][68] = "Erech"
    Grid[82][69] = "Erech"
    Grid[82][70] = "Erech"
    Grid[82][71] = "Erech"
    Grid[82][72] = "Erech"
    Grid[82][73] = "Erech"
    Grid[82][74] = "Erech"
    Grid[82][75] = "Dol Amroth"
    Grid[82][76] = "Dol Amroth"
    Grid[82][77] = "Dol Amroth"
    Grid[82][78] = "Dol Amroth"
    Grid[82][79] = "Dol Amroth"
    Grid[82][80] = "Dol Amroth"
    Grid[82][81] = "Dol Amroth"
    Grid[82][82] = "Dol Amroth"
    Grid[82][83] = "Dol Amroth"
    Grid[82][84] = "Dol Amroth"
    Grid[82][85] = "Dol Amroth"
    Grid[82][86] = "Dol Amroth"
    Grid[82][87] = "Dol Amroth"
    Grid[82][88] = "Dol Amroth"
    Grid[82][89] = "Dol Amroth"
    Grid[82][90] = "Dol Amroth"
    Grid[83][1] = "Mount Gundabad"
    Grid[83][8] = "Mount Gundabad"
    Grid[83][9] = "Eagles' Eyrie"
    Grid[83][10] = "Eagles' Eyrie"
    Grid[83][11] = "Eagles' Eyrie"
    Grid[83][12] = "Eagles' Eyrie"
    Grid[83][13] = "Eagles' Eyrie"
    Grid[83][14] = "Eagles' Eyrie"
    Grid[83][15] = "Rivendell"
    Grid[83][16] = "Rivendell"
    Grid[83][17] = "Rivendell"
    Grid[83][18] = "Goblin's Gate"
    Grid[83][19] = "Goblin's Gate"
    Grid[83][20] = "Goblin's Gate"
    Grid[83][21] = "Goblin's Gate"
    Grid[83][22] = "Goblin's Gate"
    Grid[83][23] = "Goblin's Gate"
    Grid[83][24] = "Moria"
    Grid[83][25] = "Gladden Fields"
    Grid[83][26] = "Gladden Fields"
    Grid[83][27] = "Moria"
    Grid[83][28] = "Moria"
    Grid[83][29] = "Moria"
    Grid[83][30] = "Moria"
    Grid[83][31] = "Moria"
    Grid[83][32] = "Moria"
    Grid[83][33] = "Moria"
    Grid[83][34] = "Moria"
    Grid[83][35] = "Lorien"
    Grid[83][36] = "Lorien"
    Grid[83][37] = "Lorien"
    Grid[83][38] = "Lorien"
    Grid[83][39] = "Lorien"
    Grid[83][40] = "Lorien"
    Grid[83][41] = "Lorien"
    Grid[83][42] = "Parth Celebrant"
    Grid[83][43] = "Parth Celebrant"
    Grid[83][44] = "Parth Celebrant"
    Grid[83][45] = "Parth Celebrant"
    Grid[83][46] = "Fangorn"
    Grid[83][47] = "Fangorn"
    Grid[83][48] = "Fangorn"
    Grid[83][49] = "Fangorn"
    Grid[83][50] = "Fangorn"
    Grid[83][51] = "Fangorn"
    Grid[83][52] = "Fangorn"
    Grid[83][53] = "Fangorn"
    Grid[83][54] = "Fangorn"
    Grid[83][55] = "Fords of Isen"
    Grid[83][56] = "Fords of Isen"
    Grid[83][57] = "Fords of Isen"
    Grid[83][58] = "Fords of Isen"
    Grid[83][59] = "Westemnet"
    Grid[83][60] = "Westemnet"
    Grid[83][61] = "Westemnet"
    Grid[83][62] = "Westemnet"
    Grid[83][63] = "Westemnet"
    Grid[83][64] = "Westemnet"
    Grid[83][65] = "Westemnet"
    Grid[83][66] = "Westemnet"
    Grid[83][67] = "Erech"
    Grid[83][68] = "Erech"
    Grid[83][69] = "Erech"
    Grid[83][70] = "Erech"
    Grid[83][71] = "Erech"
    Grid[83][72] = "Erech"
    Grid[83][73] = "Erech"
    Grid[83][74] = "Erech"
    Grid[83][75] = "Dol Amroth"
    Grid[83][76] = "Dol Amroth"
    Grid[83][77] = "Dol Amroth"
    Grid[83][78] = "Dol Amroth"
    Grid[83][79] = "Dol Amroth"
    Grid[83][80] = "Dol Amroth"
    Grid[83][81] = "Dol Amroth"
    Grid[83][82] = "Dol Amroth"
    Grid[83][83] = "Dol Amroth"
    Grid[83][84] = "Dol Amroth"
    Grid[83][85] = "Dol Amroth"
    Grid[83][86] = "Dol Amroth"
    Grid[83][87] = "Dol Amroth"
    Grid[83][88] = "Dol Amroth"
    Grid[83][89] = "Dol Amroth"
    Grid[83][90] = "Dol Amroth"
    Grid[83][91] = "Dol Amroth"
    Grid[83][92] = "Dol Amroth"
    Grid[84][1] = "Mount Gundabad"
    Grid[84][8] = "Mount Gundabad"
    Grid[84][9] = "Mount Gundabad"
    Grid[84][10] = "Eagles' Eyrie"
    Grid[84][11] = "Eagles' Eyrie"
    Grid[84][12] = "Eagles' Eyrie"
    Grid[84][13] = "Eagles' Eyrie"
    Grid[84][14] = "Eagles' Eyrie"
    Grid[84][15] = "Eagles' Eyrie"
    Grid[84][16] = "Eagles' Eyrie"
    Grid[84][17] = "Old Ford"
    Grid[84][18] = "Goblin's Gate"
    Grid[84][19] = "Goblin's Gate"
    Grid[84][20] = "Goblin's Gate"
    Grid[84][21] = "Goblin's Gate"
    Grid[84][22] = "Goblin's Gate"
    Grid[84][23] = "Goblin's Gate"
    Grid[84][24] = "Old Ford"
    Grid[84][25] = "Gladden Fields"
    Grid[84][26] = "Gladden Fields"
    Grid[84][27] = "Gladden Fields"
    Grid[84][28] = "Moria"
    Grid[84][29] = "Moria"
    Grid[84][30] = "Moria"
    Grid[84][31] = "Moria"
    Grid[84][32] = "Moria"
    Grid[84][33] = "Moria"
    Grid[84][34] = "Lorien"
    Grid[84][35] = "Lorien"
    Grid[84][36] = "Lorien"
    Grid[84][37] = "Lorien"
    Grid[84][38] = "Lorien"
    Grid[84][39] = "Lorien"
    Grid[84][40] = "Lorien"
    Grid[84][41] = "Lorien"
    Grid[84][42] = "Parth Celebrant"
    Grid[84][43] = "Parth Celebrant"
    Grid[84][44] = "Parth Celebrant"
    Grid[84][45] = "Parth Celebrant"
    Grid[84][46] = "Fangorn"
    Grid[84][47] = "Fangorn"
    Grid[84][48] = "Fangorn"
    Grid[84][49] = "Fangorn"
    Grid[84][50] = "Fangorn"
    Grid[84][51] = "Fangorn"
    Grid[84][52] = "Fangorn"
    Grid[84][53] = "Fangorn"
    Grid[84][54] = "Fangorn"
    Grid[84][55] = "Westemnet"
    Grid[84][56] = "Westemnet"
    Grid[84][57] = "Westemnet"
    Grid[84][58] = "Westemnet"
    Grid[84][59] = "Westemnet"
    Grid[84][60] = "Westemnet"
    Grid[84][61] = "Westemnet"
    Grid[84][62] = "Westemnet"
    Grid[84][63] = "Westemnet"
    Grid[84][64] = "Westemnet"
    Grid[84][65] = "Westemnet"
    Grid[84][66] = "Westemnet"
    Grid[84][67] = "Erech"
    Grid[84][68] = "Erech"
    Grid[84][69] = "Erech"
    Grid[84][70] = "Erech"
    Grid[84][71] = "Erech"
    Grid[84][72] = "Erech"
    Grid[84][73] = "Lamedon"
    Grid[84][74] = "Lamedon"
    Grid[84][75] = "Dol Amroth"
    Grid[84][76] = "Dol Amroth"
    Grid[84][77] = "Dol Amroth"
    Grid[84][78] = "Dol Amroth"
    Grid[84][79] = "Dol Amroth"
    Grid[84][80] = "Dol Amroth"
    Grid[84][81] = "Dol Amroth"
    Grid[84][82] = "Dol Amroth"
    Grid[84][83] = "Dol Amroth"
    Grid[84][84] = "Dol Amroth"
    Grid[84][85] = "Dol Amroth"
    Grid[84][86] = "Dol Amroth"
    Grid[84][87] = "Dol Amroth"
    Grid[84][88] = "Dol Amroth"
    Grid[84][89] = "Dol Amroth"
    Grid[84][90] = "Dol Amroth"
    Grid[84][91] = "Dol Amroth"
    Grid[84][92] = "Dol Amroth"
    Grid[84][104] = "Umbar"
    Grid[85][1] = "Mount Gundabad"
    Grid[85][8] = "Mount Gundabad"
    Grid[85][9] = "Mount Gundabad"
    Grid[85][10] = "Carrock"
    Grid[85][11] = "Eagles' Eyrie"
    Grid[85][12] = "Eagles' Eyrie"
    Grid[85][13] = "Eagles' Eyrie"
    Grid[85][14] = "Eagles' Eyrie"
    Grid[85][15] = "Eagles' Eyrie"
    Grid[85][16] = "Eagles' Eyrie"
    Grid[85][17] = "Old Ford"
    Grid[85][18] = "Goblin's Gate"
    Grid[85][19] = "Goblin's Gate"
    Grid[85][20] = "Goblin's Gate"
    Grid[85][21] = "Goblin's Gate"
    Grid[85][22] = "Goblin's Gate"
    Grid[85][23] = "Goblin's Gate"
    Grid[85][24] = "Old Ford"
    Grid[85][25] = "Gladden Fields"
    Grid[85][26] = "Gladden Fields"
    Grid[85][27] = "Gladden Fields"
    Grid[85][28] = "Gladden Fields"
    Grid[85][29] = "Moria"
    Grid[85][30] = "Moria"
    Grid[85][31] = "Moria"
    Grid[85][32] = "Dimrill Dale"
    Grid[85][33] = "Dimrill Dale"
    Grid[85][34] = "Lorien"
    Grid[85][35] = "Lorien"
    Grid[85][36] = "Lorien"
    Grid[85][37] = "Lorien"
    Grid[85][38] = "Lorien"
    Grid[85][39] = "Lorien"
    Grid[85][40] = "Lorien"
    Grid[85][41] = "Lorien"
    Grid[85][42] = "Lorien"
    Grid[85][43] = "Parth Celebrant"
    Grid[85][44] = "Parth Celebrant"
    Grid[85][45] = "Parth Celebrant"
    Grid[85][46] = "Parth Celebrant"
    Grid[85][47] = "Fangorn"
    Grid[85][48] = "Fangorn"
    Grid[85][49] = "Fangorn"
    Grid[85][50] = "Fangorn"
    Grid[85][51] = "Fangorn"
    Grid[85][52] = "Fangorn"
    Grid[85][53] = "Fangorn"
    Grid[85][54] = "Fangorn"
    Grid[85][55] = "Westemnet"
    Grid[85][56] = "Westemnet"
    Grid[85][57] = "Westemnet"
    Grid[85][58] = "Westemnet"
    Grid[85][59] = "Westemnet"
    Grid[85][60] = "Westemnet"
    Grid[85][61] = "Westemnet"
    Grid[85][62] = "Westemnet"
    Grid[85][63] = "Westemnet"
    Grid[85][64] = "Westemnet"
    Grid[85][65] = "Edoras"
    Grid[85][66] = "Edoras"
    Grid[85][67] = "Edoras"
    Grid[85][68] = "Erech"
    Grid[85][69] = "Erech"
    Grid[85][70] = "Erech"
    Grid[85][71] = "Lamedon"
    Grid[85][72] = "Lamedon"
    Grid[85][73] = "Lamedon"
    Grid[85][74] = "Lamedon"
    Grid[85][75] = "Lamedon"
    Grid[85][76] = "Dol Amroth"
    Grid[85][77] = "Dol Amroth"
    Grid[85][78] = "Dol Amroth"
    Grid[85][79] = "Dol Amroth"
    Grid[85][80] = "Dol Amroth"
    Grid[85][81] = "Dol Amroth"
    Grid[85][82] = "Dol Amroth"
    Grid[85][83] = "Dol Amroth"
    Grid[85][84] = "Dol Amroth"
    Grid[85][85] = "Dol Amroth"
    Grid[85][86] = "Dol Amroth"
    Grid[85][87] = "Dol Amroth"
    Grid[85][88] = "Dol Amroth"
    Grid[85][89] = "Dol Amroth"
    Grid[85][90] = "Dol Amroth"
    Grid[85][102] = "Umbar"
    Grid[85][103] = "Umbar"
    Grid[85][104] = "Umbar"
    Grid[86][1] = "Mount Gundabad"
    Grid[86][8] = "Mount Gundabad"
    Grid[86][9] = "Mount Gundabad"
    Grid[86][10] = "Carrock"
    Grid[86][11] = "Eagles' Eyrie"
    Grid[86][12] = "Eagles' Eyrie"
    Grid[86][13] = "Eagles' Eyrie"
    Grid[86][14] = "Eagles' Eyrie"
    Grid[86][15] = "Eagles' Eyrie"
    Grid[86][16] = "Old Ford"
    Grid[86][17] = "Old Ford"
    Grid[86][18] = "Goblin's Gate"
    Grid[86][19] = "Goblin's Gate"
    Grid[86][20] = "Goblin's Gate"
    Grid[86][21] = "Goblin's Gate"
    Grid[86][22] = "Goblin's Gate"
    Grid[86][23] = "Old Ford"
    Grid[86][24] = "Old Ford"
    Grid[86][25] = "Gladden Fields"
    Grid[86][26] = "Gladden Fields"
    Grid[86][27] = "Gladden Fields"
    Grid[86][28] = "Gladden Fields"
    Grid[86][29] = "Gladden Fields"
    Grid[86][30] = "Dimrill Dale"
    Grid[86][31] = "Moria"
    Grid[86][32] = "Dimrill Dale"
    Grid[86][33] = "Dimrill Dale"
    Grid[86][34] = "Dimrill Dale"
    Grid[86][35] = "Lorien"
    Grid[86][36] = "Lorien"
    Grid[86][37] = "Lorien"
    Grid[86][38] = "Lorien"
    Grid[86][39] = "Lorien"
    Grid[86][40] = "Lorien"
    Grid[86][41] = "Lorien"
    Grid[86][42] = "Lorien"
    Grid[86][43] = "Parth Celebrant"
    Grid[86][44] = "Parth Celebrant"
    Grid[86][45] = "Parth Celebrant"
    Grid[86][46] = "Parth Celebrant"
    Grid[86][47] = "Parth Celebrant"
    Grid[86][48] = "Fangorn"
    Grid[86][49] = "Fangorn"
    Grid[86][50] = "Fangorn"
    Grid[86][51] = "Fangorn"
    Grid[86][52] = "Fangorn"
    Grid[86][53] = "Fangorn"
    Grid[86][54] = "Westemnet"
    Grid[86][55] = "Westemnet"
    Grid[86][56] = "Westemnet"
    Grid[86][57] = "Westemnet"
    Grid[86][58] = "Westemnet"
    Grid[86][59] = "Westemnet"
    Grid[86][60] = "Westemnet"
    Grid[86][61] = "Westemnet"
    Grid[86][62] = "Westemnet"
    Grid[86][63] = "Westemnet"
    Grid[86][64] = "Edoras"
    Grid[86][65] = "Edoras"
    Grid[86][66] = "Edoras"
    Grid[86][67] = "Edoras"
    Grid[86][68] = "Edoras"
    Grid[86][69] = "Erech"
    Grid[86][70] = "Erech"
    Grid[86][71] = "Lamedon"
    Grid[86][72] = "Lamedon"
    Grid[86][73] = "Lamedon"
    Grid[86][74] = "Lamedon"
    Grid[86][75] = "Lamedon"
    Grid[86][76] = "Lamedon"
    Grid[86][77] = "Lamedon"
    Grid[86][78] = "Dol Amroth"
    Grid[86][79] = "Dol Amroth"
    Grid[86][80] = "Dol Amroth"
    Grid[86][81] = "Dol Amroth"
    Grid[86][82] = "Dol Amroth"
    Grid[86][83] = "Dol Amroth"
    Grid[86][84] = "Dol Amroth"
    Grid[86][85] = "Dol Amroth"
    Grid[86][86] = "Dol Amroth"
    Grid[86][87] = "Dol Amroth"
    Grid[86][88] = "Dol Amroth"
    Grid[86][101] = "Umbar"
    Grid[86][102] = "Umbar"
    Grid[86][103] = "Umbar"
    Grid[86][104] = "Umbar"
    Grid[87][1] = "Mount Gundabad"
    Grid[87][8] = "Mount Gundabad"
    Grid[87][9] = "Carrock"
    Grid[87][10] = "Carrock"
    Grid[87][11] = "Carrock"
    Grid[87][12] = "Eagles' Eyrie"
    Grid[87][13] = "Eagles' Eyrie"
    Grid[87][14] = "Eagles' Eyrie"
    Grid[87][15] = "Eagles' Eyrie"
    Grid[87][16] = "Old Ford"
    Grid[87][17] = "Old Ford"
    Grid[87][18] = "Old Ford"
    Grid[87][19] = "Goblin's Gate"
    Grid[87][20] = "Goblin's Gate"
    Grid[87][21] = "Goblin's Gate"
    Grid[87][22] = "Goblin's Gate"
    Grid[87][23] = "Old Ford"
    Grid[87][24] = "Old Ford"
    Grid[87][25] = "Gladden Fields"
    Grid[87][26] = "Gladden Fields"
    Grid[87][27] = "Gladden Fields"
    Grid[87][28] = "Gladden Fields"
    Grid[87][29] = "Gladden Fields"
    Grid[87][30] = "Dimrill Dale"
    Grid[87][31] = "Dimrill Dale"
    Grid[87][32] = "Dimrill Dale"
    Grid[87][33] = "Dimrill Dale"
    Grid[87][34] = "Dimrill Dale"
    Grid[87][35] = "Dimrill Dale"
    Grid[87][36] = "Lorien"
    Grid[87][37] = "Lorien"
    Grid[87][38] = "Lorien"
    Grid[87][39] = "Lorien"
    Grid[87][40] = "Lorien"
    Grid[87][41] = "Lorien"
    Grid[87][42] = "Lorien"
    Grid[87][43] = "Parth Celebrant"
    Grid[87][44] = "Parth Celebrant"
    Grid[87][45] = "Parth Celebrant"
    Grid[87][46] = "Parth Celebrant"
    Grid[87][47] = "Parth Celebrant"
    Grid[87][48] = "Parth Celebrant"
    Grid[87][49] = "Eastemnet"
    Grid[87][50] = "Eastemnet"
    Grid[87][51] = "Eastemnet"
    Grid[87][52] = "Eastemnet"
    Grid[87][53] = "Eastemnet"
    Grid[87][54] = "Westemnet"
    Grid[87][55] = "Westemnet"
    Grid[87][56] = "Westemnet"
    Grid[87][57] = "Westemnet"
    Grid[87][58] = "Westemnet"
    Grid[87][59] = "Westemnet"
    Grid[87][60] = "Westemnet"
    Grid[87][61] = "Westemnet"
    Grid[87][62] = "Westemnet"
    Grid[87][63] = "Edoras"
    Grid[87][64] = "Edoras"
    Grid[87][65] = "Edoras"
    Grid[87][66] = "Edoras"
    Grid[87][67] = "Edoras"
    Grid[87][68] = "Edoras"
    Grid[87][69] = "Erech"
    Grid[87][70] = "Lamedon"
    Grid[87][71] = "Lamedon"
    Grid[87][72] = "Lamedon"
    Grid[87][73] = "Lamedon"
    Grid[87][74] = "Lamedon"
    Grid[87][75] = "Lamedon"
    Grid[87][76] = "Lamedon"
    Grid[87][77] = "Lamedon"
    Grid[87][78] = "Lamedon"
    Grid[87][79] = "Lamedon"
    Grid[87][80] = "Lamedon"
    Grid[87][81] = "Lamedon"
    Grid[87][82] = "Lamedon"
    Grid[87][83] = "Lamedon"
    Grid[87][84] = "Lamedon"
    Grid[87][85] = "Lamedon"
    Grid[87][86] = "Lamedon"
    Grid[87][87] = "Lamedon"
    Grid[87][88] = "Lamedon"
    Grid[87][100] = "Umbar"
    Grid[87][101] = "Umbar"
    Grid[87][102] = "Umbar"
    Grid[87][103] = "Umbar"
    Grid[87][104] = "Umbar"
    Grid[88][1] = "Mount Gundabad"
    Grid[88][8] = "Mount Gundabad"
    Grid[88][9] = "Carrock"
    Grid[88][10] = "Carrock"
    Grid[88][11] = "Carrock"
    Grid[88][12] = "Eagles' Eyrie"
    Grid[88][13] = "Eagles' Eyrie"
    Grid[88][14] = "Eagles' Eyrie"
    Grid[88][15] = "Eagles' Eyrie"
    Grid[88][16] = "Old Ford"
    Grid[88][17] = "Old Ford"
    Grid[88][18] = "Old Ford"
    Grid[88][19] = "Old Ford"
    Grid[88][20] = "Old Ford"
    Grid[88][21] = "Old Ford"
    Grid[88][22] = "Old Ford"
    Grid[88][23] = "Old Ford"
    Grid[88][24] = "Old Ford"
    Grid[88][25] = "Gladden Fields"
    Grid[88][26] = "Gladden Fields"
    Grid[88][27] = "Gladden Fields"
    Grid[88][28] = "Gladden Fields"
    Grid[88][29] = "Gladden Fields"
    Grid[88][30] = "Dimrill Dale"
    Grid[88][31] = "Dimrill Dale"
    Grid[88][32] = "Dimrill Dale"
    Grid[88][33] = "Dimrill Dale"
    Grid[88][34] = "Dimrill Dale"
    Grid[88][35] = "Dimrill Dale"
    Grid[88][36] = "Dimrill Dale"
    Grid[88][37] = "Dimrill Dale"
    Grid[88][38] = "Dimrill Dale"
    Grid[88][39] = "Lorien"
    Grid[88][40] = "Lorien"
    Grid[88][41] = "Lorien"
    Grid[88][42] = "Lorien"
    Grid[88][43] = "Parth Celebrant"
    Grid[88][44] = "Parth Celebrant"
    Grid[88][45] = "Parth Celebrant"
    Grid[88][46] = "Parth Celebrant"
    Grid[88][47] = "Parth Celebrant"
    Grid[88][48] = "Eastemnet"
    Grid[88][49] = "Eastemnet"
    Grid[88][50] = "Eastemnet"
    Grid[88][51] = "Eastemnet"
    Grid[88][52] = "Eastemnet"
    Grid[88][53] = "Eastemnet"
    Grid[88][54] = "Eastemnet"
    Grid[88][55] = "Eastemnet"
    Grid[88][56] = "Westemnet"
    Grid[88][57] = "Westemnet"
    Grid[88][58] = "Westemnet"
    Grid[88][59] = "Westemnet"
    Grid[88][60] = "Westemnet"
    Grid[88][61] = "Westemnet"
    Grid[88][62] = "Westemnet"
    Grid[88][63] = "Edoras"
    Grid[88][64] = "Edoras"
    Grid[88][65] = "Edoras"
    Grid[88][66] = "Edoras"
    Grid[88][67] = "Edoras"
    Grid[88][68] = "Edoras"
    Grid[88][69] = "Lamedon"
    Grid[88][70] = "Lamedon"
    Grid[88][71] = "Lamedon"
    Grid[88][72] = "Lamedon"
    Grid[88][73] = "Lamedon"
    Grid[88][74] = "Lamedon"
    Grid[88][75] = "Lamedon"
    Grid[88][76] = "Lamedon"
    Grid[88][77] = "Lamedon"
    Grid[88][78] = "Lamedon"
    Grid[88][79] = "Lamedon"
    Grid[88][80] = "Lamedon"
    Grid[88][81] = "Lamedon"
    Grid[88][82] = "Lamedon"
    Grid[88][83] = "Lamedon"
    Grid[88][84] = "Lamedon"
    Grid[88][85] = "Lamedon"
    Grid[88][86] = "Lamedon"
    Grid[88][100] = "Umbar"
    Grid[88][101] = "Umbar"
    Grid[88][102] = "Umbar"
    Grid[88][103] = "Umbar"
    Grid[88][104] = "Umbar"
    Grid[89][1] = "Mount Gundabad"
    Grid[89][8] = "Carrock"
    Grid[89][9] = "Carrock"
    Grid[89][10] = "Carrock"
    Grid[89][11] = "Carrock"
    Grid[89][12] = "Carrock"
    Grid[89][13] = "Eagles' Eyrie"
    Grid[89][14] = "Eagles' Eyrie"
    Grid[89][15] = "Eagles' Eyrie"
    Grid[89][16] = "Eagles' Eyrie"
    Grid[89][17] = "Old Ford"
    Grid[89][18] = "Old Ford"
    Grid[89][19] = "Old Ford"
    Grid[89][20] = "Old Ford"
    Grid[89][21] = "Old Ford"
    Grid[89][22] = "Old Ford"
    Grid[89][23] = "Old Ford"
    Grid[89][24] = "Old Ford"
    Grid[89][25] = "Gladden Fields"
    Grid[89][26] = "Gladden Fields"
    Grid[89][27] = "Gladden Fields"
    Grid[89][28] = "Gladden Fields"
    Grid[89][29] = "Gladden Fields"
    Grid[89][30] = "Dimrill Dale"
    Grid[89][31] = "Dimrill Dale"
    Grid[89][32] = "Dimrill Dale"
    Grid[89][33] = "Dimrill Dale"
    Grid[89][34] = "Dimrill Dale"
    Grid[89][35] = "Dimrill Dale"
    Grid[89][36] = "Dimrill Dale"
    Grid[89][37] = "Dimrill Dale"
    Grid[89][38] = "Dimrill Dale"
    Grid[89][39] = "Dimrill Dale"
    Grid[89][40] = "Dimrill Dale"
    Grid[89][41] = "Dimrill Dale"
    Grid[89][42] = "Dimrill Dale"
    Grid[89][43] = "Parth Celebrant"
    Grid[89][44] = "Parth Celebrant"
    Grid[89][45] = "Parth Celebrant"
    Grid[89][46] = "Parth Celebrant"
    Grid[89][47] = "Parth Celebrant"
    Grid[89][48] = "Eastemnet"
    Grid[89][49] = "Eastemnet"
    Grid[89][50] = "Eastemnet"
    Grid[89][51] = "Eastemnet"
    Grid[89][52] = "Eastemnet"
    Grid[89][53] = "Eastemnet"
    Grid[89][54] = "Eastemnet"
    Grid[89][55] = "Eastemnet"
    Grid[89][56] = "Eastemnet"
    Grid[89][57] = "Westemnet"
    Grid[89][58] = "Westemnet"
    Grid[89][59] = "Westemnet"
    Grid[89][60] = "Westemnet"
    Grid[89][61] = "Westemnet"
    Grid[89][62] = "Westemnet"
    Grid[89][63] = "Edoras"
    Grid[89][64] = "Edoras"
    Grid[89][65] = "Edoras"
    Grid[89][66] = "Edoras"
    Grid[89][67] = "Edoras"
    Grid[89][68] = "Edoras"
    Grid[89][69] = "Edoras"
    Grid[89][70] = "Lamedon"
    Grid[89][71] = "Lamedon"
    Grid[89][72] = "Lamedon"
    Grid[89][73] = "Lamedon"
    Grid[89][74] = "Lamedon"
    Grid[89][75] = "Lamedon"
    Grid[89][76] = "Lamedon"
    Grid[89][77] = "Lamedon"
    Grid[89][78] = "Lamedon"
    Grid[89][79] = "Lamedon"
    Grid[89][80] = "Lamedon"
    Grid[89][81] = "Lamedon"
    Grid[89][82] = "Lamedon"
    Grid[89][83] = "Lamedon"
    Grid[89][84] = "Lamedon"
    Grid[89][85] = "Lamedon"
    Grid[89][86] = "Pelargir"
    Grid[89][87] = "Pelargir"
    Grid[89][93] = "West Harondor"
    Grid[89][94] = "West Harondor"
    Grid[89][95] = "West Harondor"
    Grid[89][96] = "West Harondor"
    Grid[89][97] = "West Harondor"
    Grid[89][100] = "Umbar"
    Grid[89][101] = "Umbar"
    Grid[89][102] = "Umbar"
    Grid[89][103] = "Umbar"
    Grid[89][104] = "Umbar"
    Grid[90][1] = "Mount Gundabad"
    Grid[90][8] = "Carrock"
    Grid[90][9] = "Carrock"
    Grid[90][10] = "Carrock"
    Grid[90][11] = "Carrock"
    Grid[90][12] = "Carrock"
    Grid[90][13] = "Carrock"
    Grid[90][14] = "Carrock"
    Grid[90][15] = "Carrock"
    Grid[90][16] = "Eagles' Eyrie"
    Grid[90][17] = "Carrock"
    Grid[90][18] = "Old Ford"
    Grid[90][19] = "Old Ford"
    Grid[90][20] = "Old Ford"
    Grid[90][21] = "Old Ford"
    Grid[90][22] = "Old Ford"
    Grid[90][23] = "Old Ford"
    Grid[90][24] = "Old Ford"
    Grid[90][25] = "Gladden Fields"
    Grid[90][26] = "Gladden Fields"
    Grid[90][27] = "Gladden Fields"
    Grid[90][28] = "Gladden Fields"
    Grid[90][29] = "Gladden Fields"
    Grid[90][30] = "Dimrill Dale"
    Grid[90][31] = "Dimrill Dale"
    Grid[90][32] = "Dimrill Dale"
    Grid[90][33] = "Dimrill Dale"
    Grid[90][34] = "Dimrill Dale"
    Grid[90][35] = "Dimrill Dale"
    Grid[90][36] = "Dimrill Dale"
    Grid[90][37] = "Dimrill Dale"
    Grid[90][38] = "Dimrill Dale"
    Grid[90][39] = "Dimrill Dale"
    Grid[90][40] = "Dimrill Dale"
    Grid[90][41] = "Dimrill Dale"
    Grid[90][42] = "Dimrill Dale"
    Grid[90][43] = "Parth Celebrant"
    Grid[90][44] = "Parth Celebrant"
    Grid[90][45] = "Parth Celebrant"
    Grid[90][46] = "Parth Celebrant"
    Grid[90][47] = "Parth Celebrant"
    Grid[90][48] = "Parth Celebrant"
    Grid[90][49] = "Eastemnet"
    Grid[90][50] = "Eastemnet"
    Grid[90][51] = "Eastemnet"
    Grid[90][52] = "Eastemnet"
    Grid[90][53] = "Eastemnet"
    Grid[90][54] = "Eastemnet"
    Grid[90][55] = "Eastemnet"
    Grid[90][56] = "Eastemnet"
    Grid[90][57] = "Eastemnet"
    Grid[90][58] = "Eastemnet"
    Grid[90][59] = "Westemnet"
    Grid[90][60] = "Folde"
    Grid[90][61] = "Folde"
    Grid[90][62] = "Folde"
    Grid[90][63] = "Edoras"
    Grid[90][64] = "Edoras"
    Grid[90][65] = "Edoras"
    Grid[90][66] = "Edoras"
    Grid[90][67] = "Edoras"
    Grid[90][68] = "Edoras"
    Grid[90][69] = "Edoras"
    Grid[90][70] = "Lamedon"
    Grid[90][71] = "Lamedon"
    Grid[90][72] = "Lamedon"
    Grid[90][73] = "Lamedon"
    Grid[90][74] = "Lamedon"
    Grid[90][75] = "Lamedon"
    Grid[90][76] = "Lamedon"
    Grid[90][77] = "Lamedon"
    Grid[90][78] = "Lamedon"
    Grid[90][79] = "Lamedon"
    Grid[90][80] = "Lamedon"
    Grid[90][81] = "Lamedon"
    Grid[90][82] = "Lamedon"
    Grid[90][83] = "Lamedon"
    Grid[90][84] = "Lamedon"
    Grid[90][85] = "Pelargir"
    Grid[90][86] = "Pelargir"
    Grid[90][87] = "Pelargir"
    Grid[90][88] = "Pelargir"
    Grid[90][93] = "West Harondor"
    Grid[90][94] = "West Harondor"
    Grid[90][95] = "West Harondor"
    Grid[90][96] = "West Harondor"
    Grid[90][97] = "West Harondor"
    Grid[90][98] = "West Harondor"
    Grid[90][100] = "Umbar"
    Grid[90][101] = "Umbar"
    Grid[90][102] = "Umbar"
    Grid[90][103] = "Umbar"
    Grid[90][104] = "Umbar"
    Grid[91][1] = "Mount Gundabad"
    Grid[91][8] = "Carrock"
    Grid[91][9] = "Carrock"
    Grid[91][10] = "Carrock"
    Grid[91][11] = "Carrock"
    Grid[91][12] = "Carrock"
    Grid[91][13] = "Carrock"
    Grid[91][14] = "Carrock"
    Grid[91][15] = "Carrock"
    Grid[91][16] = "Carrock"
    Grid[91][17] = "Carrock"
    Grid[91][18] = "Carrock"
    Grid[91][19] = "Carrock"
    Grid[91][20] = "Carrock"
    Grid[91][21] = "Carrock"
    Grid[91][22] = "Carrock"
    Grid[91][23] = "Rhosgobel"
    Grid[91][24] = "Rhosgobel"
    Grid[91][25] = "Old Ford"
    Grid[91][26] = "Gladden Fields"
    Grid[91][27] = "Gladden Fields"
    Grid[91][28] = "Gladden Fields"
    Grid[91][29] = "Gladden Fields"
    Grid[91][30] = "North Anduin Vale"
    Grid[91][31] = "North Anduin Vale"
    Grid[91][32] = "North Anduin Vale"
    Grid[91][33] = "Dimrill Dale"
    Grid[91][34] = "Dimrill Dale"
    Grid[91][35] = "North Anduin Vale"
    Grid[91][36] = "South Andium Vale"
    Grid[91][37] = "South Andium Vale"
    Grid[91][38] = "South Andium Vale"
    Grid[91][39] = "South Andium Vale"
    Grid[91][40] = "South Andium Vale"
    Grid[91][41] = "South Andium Vale"
    Grid[91][42] = "South Andium Vale"
    Grid[91][43] = "South Andium Vale"
    Grid[91][44] = "South Andium Vale"
    Grid[91][45] = "Parth Celebrant"
    Grid[91][46] = "Parth Celebrant"
    Grid[91][47] = "Parth Celebrant"
    Grid[91][48] = "Parth Celebrant"
    Grid[91][49] = "Parth Celebrant"
    Grid[91][50] = "Eastemnet"
    Grid[91][51] = "Eastemnet"
    Grid[91][52] = "Eastemnet"
    Grid[91][53] = "Eastemnet"
    Grid[91][54] = "Eastemnet"
    Grid[91][55] = "Eastemnet"
    Grid[91][56] = "Eastemnet"
    Grid[91][57] = "Eastemnet"
    Grid[91][58] = "Eastemnet"
    Grid[91][59] = "Eastemnet"
    Grid[91][60] = "Folde"
    Grid[91][61] = "Folde"
    Grid[91][62] = "Folde"
    Grid[91][63] = "Folde"
    Grid[91][64] = "Folde"
    Grid[91][65] = "Edoras"
    Grid[91][66] = "Edoras"
    Grid[91][67] = "Folde"
    Grid[91][68] = "Folde"
    Grid[91][69] = "Folde"
    Grid[91][70] = "Folde"
    Grid[91][71] = "Lamedon"
    Grid[91][72] = "Lamedon"
    Grid[91][73] = "Lamedon"
    Grid[91][74] = "Lamedon"
    Grid[91][75] = "Lamedon"
    Grid[91][76] = "Lamedon"
    Grid[91][77] = "Lamedon"
    Grid[91][78] = "Lamedon"
    Grid[91][79] = "Lamedon"
    Grid[91][80] = "Lamedon"
    Grid[91][81] = "Lamedon"
    Grid[91][82] = "Pelargir"
    Grid[91][83] = "Pelargir"
    Grid[91][84] = "Pelargir"
    Grid[91][85] = "Pelargir"
    Grid[91][86] = "Pelargir"
    Grid[91][87] = "Pelargir"
    Grid[91][88] = "Pelargir"
    Grid[91][89] = "Pelargir"
    Grid[91][90] = "Pelargir"
    Grid[91][93] = "West Harondor"
    Grid[91][94] = "West Harondor"
    Grid[91][95] = "West Harondor"
    Grid[91][96] = "West Harondor"
    Grid[91][97] = "West Harondor"
    Grid[91][98] = "West Harondor"
    Grid[91][99] = "West Harondor"
    Grid[91][100] = "Umbar"
    Grid[91][101] = "Umbar"
    Grid[91][102] = "Umbar"
    Grid[91][103] = "Umbar"
    Grid[91][104] = "Umbar"
    Grid[92][1] = "Mount Gundabad"
    Grid[92][8] = "Carrock"
    Grid[92][9] = "Carrock"
    Grid[92][10] = "Carrock"
    Grid[92][11] = "Carrock"
    Grid[92][12] = "Carrock"
    Grid[92][13] = "Carrock"
    Grid[92][14] = "Carrock"
    Grid[92][15] = "Carrock"
    Grid[92][16] = "Carrock"
    Grid[92][17] = "Carrock"
    Grid[92][18] = "Carrock"
    Grid[92][19] = "Carrock"
    Grid[92][20] = "Carrock"
    Grid[92][21] = "Carrock"
    Grid[92][22] = "Carrock"
    Grid[92][23] = "Rhosgobel"
    Grid[92][24] = "Rhosgobel"
    Grid[92][25] = "Rhosgobel"
    Grid[92][26] = "Rhosgobel"
    Grid[92][27] = "Rhosgobel"
    Grid[92][28] = "North Anduin Vale"
    Grid[92][29] = "North Anduin Vale"
    Grid[92][30] = "North Anduin Vale"
    Grid[92][31] = "North Anduin Vale"
    Grid[92][32] = "North Anduin Vale"
    Grid[92][33] = "North Anduin Vale"
    Grid[92][34] = "North Anduin Vale"
    Grid[92][35] = "North Anduin Vale"
    Grid[92][36] = "South Andium Vale"
    Grid[92][37] = "South Andium Vale"
    Grid[92][38] = "South Andium Vale"
    Grid[92][39] = "South Andium Vale"
    Grid[92][40] = "South Andium Vale"
    Grid[92][41] = "South Andium Vale"
    Grid[92][42] = "South Andium Vale"
    Grid[92][43] = "South Andium Vale"
    Grid[92][44] = "South Andium Vale"
    Grid[92][45] = "Parth Celebrant"
    Grid[92][46] = "Parth Celebrant"
    Grid[92][47] = "Parth Celebrant"
    Grid[92][48] = "Parth Celebrant"
    Grid[92][49] = "Parth Celebrant"
    Grid[92][50] = "Eastemnet"
    Grid[92][51] = "Eastemnet"
    Grid[92][52] = "Eastemnet"
    Grid[92][53] = "Eastemnet"
    Grid[92][54] = "Eastemnet"
    Grid[92][55] = "Eastemnet"
    Grid[92][56] = "Eastemnet"
    Grid[92][57] = "Eastemnet"
    Grid[92][58] = "Eastemnet"
    Grid[92][59] = "Eastemnet"
    Grid[92][60] = "Folde"
    Grid[92][61] = "Folde"
    Grid[92][62] = "Folde"
    Grid[92][63] = "Folde"
    Grid[92][64] = "Folde"
    Grid[92][65] = "Folde"
    Grid[92][66] = "Folde"
    Grid[92][67] = "Folde"
    Grid[92][68] = "Folde"
    Grid[92][69] = "Folde"
    Grid[92][70] = "Folde"
    Grid[92][71] = "Lamedon"
    Grid[92][72] = "Lamedon"
    Grid[92][73] = "Lamedon"
    Grid[92][74] = "Lamedon"
    Grid[92][75] = "Lamedon"
    Grid[92][76] = "Lamedon"
    Grid[92][77] = "Lamedon"
    Grid[92][78] = "Lamedon"
    Grid[92][79] = "Lamedon"
    Grid[92][80] = "Lamedon"
    Grid[92][81] = "Pelargir"
    Grid[92][82] = "Pelargir"
    Grid[92][83] = "Pelargir"
    Grid[92][84] = "Pelargir"
    Grid[92][85] = "Pelargir"
    Grid[92][86] = "Pelargir"
    Grid[92][87] = "Pelargir"
    Grid[92][88] = "Pelargir"
    Grid[92][89] = "Pelargir"
    Grid[92][90] = "Pelargir"
    Grid[92][93] = "West Harondor"
    Grid[92][94] = "West Harondor"
    Grid[92][95] = "West Harondor"
    Grid[92][96] = "West Harondor"
    Grid[92][97] = "West Harondor"
    Grid[92][98] = "West Harondor"
    Grid[92][99] = "West Harondor"
    Grid[92][100] = "Umbar"
    Grid[92][101] = "Umbar"
    Grid[92][102] = "Umbar"
    Grid[92][103] = "Umbar"
    Grid[92][104] = "Umbar"
    Grid[93][1] = "Mount Gundabad"
    Grid[93][8] = "Northern Mirkwood"
    Grid[93][9] = "Northern Mirkwood"
    Grid[93][10] = "Northern Mirkwood"
    Grid[93][11] = "Northern Mirkwood"
    Grid[93][12] = "Northern Mirkwood"
    Grid[93][13] = "Carrock"
    Grid[93][14] = "Carrock"
    Grid[93][15] = "Carrock"
    Grid[93][16] = "Carrock"
    Grid[93][17] = "Carrock"
    Grid[93][18] = "Carrock"
    Grid[93][19] = "Carrock"
    Grid[93][20] = "Carrock"
    Grid[93][21] = "Carrock"
    Grid[93][22] = "Carrock"
    Grid[93][23] = "Rhosgobel"
    Grid[93][24] = "Rhosgobel"
    Grid[93][25] = "Rhosgobel"
    Grid[93][26] = "Rhosgobel"
    Grid[93][27] = "Rhosgobel"
    Grid[93][28] = "Rhosgobel"
    Grid[93][29] = "North Anduin Vale"
    Grid[93][30] = "North Anduin Vale"
    Grid[93][31] = "North Anduin Vale"
    Grid[93][32] = "North Anduin Vale"
    Grid[93][33] = "North Anduin Vale"
    Grid[93][34] = "North Anduin Vale"
    Grid[93][35] = "North Anduin Vale"
    Grid[93][36] = "North Anduin Vale"
    Grid[93][37] = "South Andium Vale"
    Grid[93][38] = "South Andium Vale"
    Grid[93][39] = "South Andium Vale"
    Grid[93][40] = "South Andium Vale"
    Grid[93][41] = "South Andium Vale"
    Grid[93][42] = "South Andium Vale"
    Grid[93][43] = "South Andium Vale"
    Grid[93][44] = "South Andium Vale"
    Grid[93][45] = "South Andium Vale"
    Grid[93][46] = "Parth Celebrant"
    Grid[93][47] = "Parth Celebrant"
    Grid[93][48] = "Parth Celebrant"
    Grid[93][49] = "Parth Celebrant"
    Grid[93][50] = "Eastemnet"
    Grid[93][51] = "Eastemnet"
    Grid[93][52] = "Eastemnet"
    Grid[93][53] = "Eastemnet"
    Grid[93][54] = "Eastemnet"
    Grid[93][55] = "Eastemnet"
    Grid[93][56] = "Eastemnet"
    Grid[93][57] = "Eastemnet"
    Grid[93][58] = "Eastemnet"
    Grid[93][59] = "Eastemnet"
    Grid[93][60] = "Folde"
    Grid[93][61] = "Folde"
    Grid[93][62] = "Folde"
    Grid[93][63] = "Folde"
    Grid[93][64] = "Folde"
    Grid[93][65] = "Folde"
    Grid[93][66] = "Folde"
    Grid[93][67] = "Folde"
    Grid[93][68] = "Folde"
    Grid[93][69] = "Folde"
    Grid[93][70] = "Folde"
    Grid[93][71] = "Lamedon"
    Grid[93][72] = "Lamedon"
    Grid[93][73] = "Lamedon"
    Grid[93][74] = "Lamedon"
    Grid[93][75] = "Lamedon"
    Grid[93][76] = "Lossarnach"
    Grid[93][77] = "Lossarnach"
    Grid[93][78] = "Lossarnach"
    Grid[93][79] = "Lamedon"
    Grid[93][80] = "Pelargir"
    Grid[93][81] = "Pelargir"
    Grid[93][82] = "Pelargir"
    Grid[93][83] = "Pelargir"
    Grid[93][84] = "Pelargir"
    Grid[93][85] = "Pelargir"
    Grid[93][86] = "Pelargir"
    Grid[93][87] = "Pelargir"
    Grid[93][88] = "Pelargir"
    Grid[93][89] = "Pelargir"
    Grid[93][90] = "Pelargir"
    Grid[93][93] = "West Harondor"
    Grid[93][94] = "West Harondor"
    Grid[93][95] = "West Harondor"
    Grid[93][96] = "West Harondor"
    Grid[93][97] = "West Harondor"
    Grid[93][98] = "West Harondor"
    Grid[93][99] = "West Harondor"
    Grid[93][100] = "Umbar"
    Grid[93][101] = "Umbar"
    Grid[93][102] = "Umbar"
    Grid[93][103] = "Umbar"
    Grid[93][104] = "Umbar"
    Grid[94][1] = "Mount Gundabad"
    Grid[94][8] = "Northern Mirkwood"
    Grid[94][9] = "Northern Mirkwood"
    Grid[94][10] = "Northern Mirkwood"
    Grid[94][11] = "Northern Mirkwood"
    Grid[94][12] = "Northern Mirkwood"
    Grid[94][13] = "Northern Mirkwood"
    Grid[94][14] = "Western Mirkwood"
    Grid[94][15] = "Western Mirkwood"
    Grid[94][16] = "Western Mirkwood"
    Grid[94][17] = "Western Mirkwood"
    Grid[94][18] = "Western Mirkwood"
    Grid[94][19] = "Carrock"
    Grid[94][20] = "Carrock"
    Grid[94][21] = "Carrock"
    Grid[94][22] = "Carrock"
    Grid[94][23] = "Rhosgobel"
    Grid[94][24] = "Rhosgobel"
    Grid[94][25] = "Rhosgobel"
    Grid[94][26] = "Rhosgobel"
    Grid[94][27] = "Rhosgobel"
    Grid[94][28] = "Rhosgobel"
    Grid[94][29] = "North Anduin Vale"
    Grid[94][30] = "North Anduin Vale"
    Grid[94][31] = "North Anduin Vale"
    Grid[94][32] = "North Anduin Vale"
    Grid[94][33] = "North Anduin Vale"
    Grid[94][34] = "North Anduin Vale"
    Grid[94][35] = "North Anduin Vale"
    Grid[94][36] = "North Anduin Vale"
    Grid[94][37] = "South Andium Vale"
    Grid[94][38] = "South Andium Vale"
    Grid[94][39] = "South Andium Vale"
    Grid[94][40] = "Dol Guldur"
    Grid[94][41] = "Dol Guldur"
    Grid[94][42] = "Dol Guldur"
    Grid[94][43] = "South Andium Vale"
    Grid[94][44] = "South Andium Vale"
    Grid[94][45] = "Western Brown Lands"
    Grid[94][46] = "Parth Celebrant"
    Grid[94][47] = "Parth Celebrant"
    Grid[94][48] = "Parth Celebrant"
    Grid[94][49] = "Parth Celebrant"
    Grid[94][50] = "Eastemnet"
    Grid[94][51] = "Eastemnet"
    Grid[94][52] = "Eastemnet"
    Grid[94][53] = "Eastemnet"
    Grid[94][54] = "Eastemnet"
    Grid[94][55] = "Eastemnet"
    Grid[94][56] = "Eastemnet"
    Grid[94][57] = "Eastemnet"
    Grid[94][58] = "Eastemnet"
    Grid[94][59] = "Eastemnet"
    Grid[94][60] = "Folde"
    Grid[94][61] = "Folde"
    Grid[94][62] = "Folde"
    Grid[94][63] = "Folde"
    Grid[94][64] = "Folde"
    Grid[94][65] = "Folde"
    Grid[94][66] = "Folde"
    Grid[94][67] = "Folde"
    Grid[94][68] = "Folde"
    Grid[94][69] = "Folde"
    Grid[94][70] = "Folde"
    Grid[94][71] = "Lamedon"
    Grid[94][72] = "Lamedon"
    Grid[94][73] = "Lamedon"
    Grid[94][74] = "Lossarnach"
    Grid[94][75] = "Lossarnach"
    Grid[94][76] = "Lossarnach"
    Grid[94][77] = "Lossarnach"
    Grid[94][78] = "Lossarnach"
    Grid[94][79] = "Lossarnach"
    Grid[94][80] = "Lossarnach"
    Grid[94][81] = "Pelargir"
    Grid[94][82] = "Pelargir"
    Grid[94][83] = "Pelargir"
    Grid[94][84] = "Pelargir"
    Grid[94][85] = "Pelargir"
    Grid[94][86] = "Pelargir"
    Grid[94][87] = "Pelargir"
    Grid[94][88] = "Pelargir"
    Grid[94][89] = "Pelargir"
    Grid[94][90] = "Pelargir"
    Grid[94][91] = "West Harondor"
    Grid[94][92] = "West Harondor"
    Grid[94][93] = "West Harondor"
    Grid[94][94] = "West Harondor"
    Grid[94][95] = "West Harondor"
    Grid[94][96] = "West Harondor"
    Grid[94][97] = "West Harondor"
    Grid[94][98] = "West Harondor"
    Grid[94][99] = "Umbar"
    Grid[94][100] = "Umbar"
    Grid[94][101] = "Umbar"
    Grid[94][102] = "Umbar"
    Grid[94][103] = "Umbar"
    Grid[94][104] = "Umbar"
    Grid[95][1] = "Mount Gundabad"
    Grid[95][8] = "Northern Mirkwood"
    Grid[95][9] = "Northern Mirkwood"
    Grid[95][10] = "Northern Mirkwood"
    Grid[95][11] = "Northern Mirkwood"
    Grid[95][12] = "Northern Mirkwood"
    Grid[95][13] = "Northern Mirkwood"
    Grid[95][14] = "Northern Mirkwood"
    Grid[95][15] = "Western Mirkwood"
    Grid[95][16] = "Western Mirkwood"
    Grid[95][17] = "Western Mirkwood"
    Grid[95][18] = "Western Mirkwood"
    Grid[95][19] = "Western Mirkwood"
    Grid[95][20] = "Carrock"
    Grid[95][21] = "Carrock"
    Grid[95][22] = "Carrock"
    Grid[95][23] = "Rhosgobel"
    Grid[95][24] = "Rhosgobel"
    Grid[95][25] = "Rhosgobel"
    Grid[95][26] = "Rhosgobel"
    Grid[95][27] = "Rhosgobel"
    Grid[95][28] = "North Anduin Vale"
    Grid[95][29] = "North Anduin Vale"
    Grid[95][30] = "North Anduin Vale"
    Grid[95][31] = "North Anduin Vale"
    Grid[95][32] = "North Anduin Vale"
    Grid[95][33] = "North Anduin Vale"
    Grid[95][34] = "North Anduin Vale"
    Grid[95][35] = "North Anduin Vale"
    Grid[95][36] = "North Anduin Vale"
    Grid[95][37] = "South Andium Vale"
    Grid[95][38] = "Dol Guldur"
    Grid[95][39] = "Dol Guldur"
    Grid[95][40] = "Dol Guldur"
    Grid[95][41] = "Dol Guldur"
    Grid[95][42] = "Dol Guldur"
    Grid[95][43] = "South Andium Vale"
    Grid[95][44] = "Western Brown Lands"
    Grid[95][45] = "Western Brown Lands"
    Grid[95][46] = "Western Brown Lands"
    Grid[95][47] = "Western Brown Lands"
    Grid[95][48] = "Western Brown Lands"
    Grid[95][49] = "Eastemnet"
    Grid[95][50] = "Eastemnet"
    Grid[95][51] = "Eastemnet"
    Grid[95][52] = "Eastemnet"
    Grid[95][53] = "Eastemnet"
    Grid[95][54] = "Western Emyn Muil"
    Grid[95][55] = "Western Emyn Muil"
    Grid[95][56] = "Eastemnet"
    Grid[95][57] = "Eastemnet"
    Grid[95][58] = "Eastemnet"
    Grid[95][59] = "Eastemnet"
    Grid[95][60] = "Druadan Forest"
    Grid[95][61] = "Druadan Forest"
    Grid[95][62] = "Druadan Forest"
    Grid[95][63] = "Druadan Forest"
    Grid[95][64] = "Druadan Forest"
    Grid[95][65] = "Druadan Forest"
    Grid[95][66] = "Druadan Forest"
    Grid[95][67] = "Druadan Forest"
    Grid[95][68] = "Druadan Forest"
    Grid[95][69] = "Druadan Forest"
    Grid[95][70] = "Druadan Forest"
    Grid[95][71] = "Druadan Forest"
    Grid[95][72] = "Lamedon"
    Grid[95][73] = "Minas Tirith"
    Grid[95][74] = "Minas Tirith"
    Grid[95][75] = "Lossarnach"
    Grid[95][76] = "Lossarnach"
    Grid[95][77] = "Lossarnach"
    Grid[95][78] = "Lossarnach"
    Grid[95][79] = "Lossarnach"
    Grid[95][80] = "Lossarnach"
    Grid[95][81] = "Lossarnach"
    Grid[95][82] = "Lossarnach"
    Grid[95][83] = "Pelargir"
    Grid[95][84] = "Pelargir"
    Grid[95][85] = "Pelargir"
    Grid[95][86] = "Pelargir"
    Grid[95][87] = "Pelargir"
    Grid[95][88] = "Pelargir"
    Grid[95][89] = "Pelargir"
    Grid[95][90] = "West Harondor"
    Grid[95][91] = "West Harondor"
    Grid[95][92] = "West Harondor"
    Grid[95][93] = "West Harondor"
    Grid[95][94] = "West Harondor"
    Grid[95][95] = "West Harondor"
    Grid[95][96] = "West Harondor"
    Grid[95][97] = "West Harondor"
    Grid[95][98] = "West Harondor"
    Grid[95][99] = "Umbar"
    Grid[95][100] = "Umbar"
    Grid[95][101] = "Umbar"
    Grid[95][102] = "Umbar"
    Grid[95][103] = "Umbar"
    Grid[95][104] = "Umbar"
    Grid[96][1] = "Mount Gundabad"
    Grid[96][8] = "Northern Mirkwood"
    Grid[96][9] = "Northern Mirkwood"
    Grid[96][10] = "Northern Mirkwood"
    Grid[96][11] = "Northern Mirkwood"
    Grid[96][12] = "Northern Mirkwood"
    Grid[96][13] = "Northern Mirkwood"
    Grid[96][14] = "Northern Mirkwood"
    Grid[96][15] = "Western Mirkwood"
    Grid[96][16] = "Western Mirkwood"
    Grid[96][17] = "Western Mirkwood"
    Grid[96][18] = "Western Mirkwood"
    Grid[96][19] = "Western Mirkwood"
    Grid[96][20] = "Western Mirkwood"
    Grid[96][21] = "Old Forest Road"
    Grid[96][22] = "Old Forest Road"
    Grid[96][23] = "Old Forest Road"
    Grid[96][24] = "Old Forest Road"
    Grid[96][25] = "Old Forest Road"
    Grid[96][26] = "Rhosgobel"
    Grid[96][27] = "Rhosgobel"
    Grid[96][28] = "Rhosgobel"
    Grid[96][29] = "North Anduin Vale"
    Grid[96][30] = "North Anduin Vale"
    Grid[96][31] = "North Anduin Vale"
    Grid[96][32] = "North Anduin Vale"
    Grid[96][33] = "North Anduin Vale"
    Grid[96][34] = "North Anduin Vale"
    Grid[96][35] = "North Anduin Vale"
    Grid[96][36] = "Dol Guldur"
    Grid[96][37] = "Dol Guldur"
    Grid[96][38] = "Dol Guldur"
    Grid[96][39] = "Dol Guldur"
    Grid[96][40] = "Dol Guldur"
    Grid[96][41] = "Dol Guldur"
    Grid[96][42] = "Dol Guldur"
    Grid[96][43] = "Dol Guldur"
    Grid[96][44] = "Western Brown Lands"
    Grid[96][45] = "Western Brown Lands"
    Grid[96][46] = "Western Brown Lands"
    Grid[96][47] = "Western Brown Lands"
    Grid[96][48] = "Western Brown Lands"
    Grid[96][49] = "Eastemnet"
    Grid[96][50] = "Eastemnet"
    Grid[96][51] = "Eastemnet"
    Grid[96][52] = "Western Emyn Muil"
    Grid[96][53] = "Western Emyn Muil"
    Grid[96][54] = "Western Emyn Muil"
    Grid[96][55] = "Western Emyn Muil"
    Grid[96][56] = "Western Emyn Muil"
    Grid[96][57] = "Western Emyn Muil"
    Grid[96][58] = "Western Emyn Muil"
    Grid[96][59] = "Eastemnet"
    Grid[96][60] = "Druadan Forest"
    Grid[96][61] = "Druadan Forest"
    Grid[96][62] = "Druadan Forest"
    Grid[96][63] = "Druadan Forest"
    Grid[96][64] = "Druadan Forest"
    Grid[96][65] = "Druadan Forest"
    Grid[96][66] = "Druadan Forest"
    Grid[96][67] = "Druadan Forest"
    Grid[96][68] = "Druadan Forest"
    Grid[96][69] = "Druadan Forest"
    Grid[96][70] = "Druadan Forest"
    Grid[96][71] = "Druadan Forest"
    Grid[96][72] = "Druadan Forest"
    Grid[96][73] = "Minas Tirith"
    Grid[96][74] = "Minas Tirith"
    Grid[96][75] = "Minas Tirith"
    Grid[96][76] = "Lossarnach"
    Grid[96][77] = "Lossarnach"
    Grid[96][78] = "Lossarnach"
    Grid[96][79] = "Lossarnach"
    Grid[96][80] = "Lossarnach"
    Grid[96][81] = "Lossarnach"
    Grid[96][82] = "Lossarnach"
    Grid[96][83] = "Lossarnach"
    Grid[96][84] = "Pelargir"
    Grid[96][85] = "Pelargir"
    Grid[96][86] = "Pelargir"
    Grid[96][87] = "Pelargir"
    Grid[96][88] = "Pelargir"
    Grid[96][89] = "West Harondor"
    Grid[96][90] = "West Harondor"
    Grid[96][91] = "West Harondor"
    Grid[96][92] = "West Harondor"
    Grid[96][93] = "West Harondor"
    Grid[96][94] = "West Harondor"
    Grid[96][95] = "West Harondor"
    Grid[96][96] = "West Harondor"
    Grid[96][97] = "West Harondor"
    Grid[96][98] = "West Harondor"
    Grid[96][99] = "Umbar"
    Grid[96][100] = "Umbar"
    Grid[96][101] = "Umbar"
    Grid[96][102] = "Umbar"
    Grid[96][103] = "Umbar"
    Grid[96][104] = "Umbar"
    Grid[97][1] = "Mount Gundabad"
    Grid[97][8] = "Northern Mirkwood"
    Grid[97][9] = "Northern Mirkwood"
    Grid[97][10] = "Northern Mirkwood"
    Grid[97][11] = "Northern Mirkwood"
    Grid[97][12] = "Northern Mirkwood"
    Grid[97][13] = "Northern Mirkwood"
    Grid[97][14] = "Northern Mirkwood"
    Grid[97][15] = "Northern Mirkwood"
    Grid[97][16] = "Western Mirkwood"
    Grid[97][17] = "Western Mirkwood"
    Grid[97][18] = "Western Mirkwood"
    Grid[97][19] = "Western Mirkwood"
    Grid[97][20] = "Western Mirkwood"
    Grid[97][21] = "Old Forest Road"
    Grid[97][22] = "Old Forest Road"
    Grid[97][23] = "Old Forest Road"
    Grid[97][24] = "Old Forest Road"
    Grid[97][25] = "Old Forest Road"
    Grid[97][26] = "Narrows of the Forest"
    Grid[97][27] = "Narrows of the Forest"
    Grid[97][28] = "Narrows of the Forest"
    Grid[97][29] = "Narrows of the Forest"
    Grid[97][30] = "North Anduin Vale"
    Grid[97][31] = "North Anduin Vale"
    Grid[97][32] = "North Anduin Vale"
    Grid[97][33] = "North Anduin Vale"
    Grid[97][34] = "North Anduin Vale"
    Grid[97][35] = "Dol Guldur"
    Grid[97][36] = "Dol Guldur"
    Grid[97][37] = "Dol Guldur"
    Grid[97][38] = "Dol Guldur"
    Grid[97][39] = "Dol Guldur"
    Grid[97][40] = "Dol Guldur"
    Grid[97][41] = "Dol Guldur"
    Grid[97][42] = "Dol Guldur"
    Grid[97][43] = "Dol Guldur"
    Grid[97][44] = "Western Brown Lands"
    Grid[97][45] = "Western Brown Lands"
    Grid[97][46] = "Western Brown Lands"
    Grid[97][47] = "Western Brown Lands"
    Grid[97][48] = "Western Brown Lands"
    Grid[97][49] = "Western Brown Lands"
    Grid[97][50] = "Western Brown Lands"
    Grid[97][51] = "Western Brown Lands"
    Grid[97][52] = "Western Emyn Muil"
    Grid[97][53] = "Western Emyn Muil"
    Grid[97][54] = "Western Emyn Muil"
    Grid[97][55] = "Western Emyn Muil"
    Grid[97][56] = "Western Emyn Muil"
    Grid[97][57] = "Western Emyn Muil"
    Grid[97][58] = "Western Emyn Muil"
    Grid[97][59] = "Western Emyn Muil"
    Grid[97][60] = "Western Emyn Muil"
    Grid[97][61] = "Druadan Forest"
    Grid[97][62] = "Druadan Forest"
    Grid[97][63] = "Druadan Forest"
    Grid[97][64] = "Druadan Forest"
    Grid[97][65] = "Druadan Forest"
    Grid[97][66] = "Druadan Forest"
    Grid[97][67] = "Druadan Forest"
    Grid[97][68] = "Druadan Forest"
    Grid[97][69] = "Druadan Forest"
    Grid[97][70] = "Druadan Forest"
    Grid[97][71] = "Druadan Forest"
    Grid[97][72] = "Minas Tirith"
    Grid[97][73] = "Minas Tirith"
    Grid[97][74] = "Minas Tirith"
    Grid[97][75] = "Minas Tirith"
    Grid[97][76] = "Minas Tirith"
    Grid[97][77] = "Lossarnach"
    Grid[97][78] = "Lossarnach"
    Grid[97][79] = "Lossarnach"
    Grid[97][80] = "Lossarnach"
    Grid[97][81] = "Lossarnach"
    Grid[97][82] = "Lossarnach"
    Grid[97][83] = "Lossarnach"
    Grid[97][84] = "Pelargir"
    Grid[97][85] = "Pelargir"
    Grid[97][86] = "Pelargir"
    Grid[97][87] = "Pelargir"
    Grid[97][88] = "Pelargir"
    Grid[97][89] = "West Harondor"
    Grid[97][90] = "West Harondor"
    Grid[97][91] = "West Harondor"
    Grid[97][92] = "West Harondor"
    Grid[97][93] = "West Harondor"
    Grid[97][94] = "West Harondor"
    Grid[97][95] = "West Harondor"
    Grid[97][96] = "West Harondor"
    Grid[97][97] = "West Harondor"
    Grid[97][98] = "Umbar"
    Grid[97][99] = "Umbar"
    Grid[97][100] = "Umbar"
    Grid[97][101] = "Umbar"
    Grid[97][102] = "Umbar"
    Grid[97][103] = "Umbar"
    Grid[97][104] = "Umbar"
    Grid[98][1] = "Mount Gundabad"
    Grid[98][8] = "Northern Mirkwood"
    Grid[98][9] = "Northern Mirkwood"
    Grid[98][10] = "Northern Mirkwood"
    Grid[98][11] = "Northern Mirkwood"
    Grid[98][12] = "Northern Mirkwood"
    Grid[98][13] = "Northern Mirkwood"
    Grid[98][14] = "Northern Mirkwood"
    Grid[98][15] = "Northern Mirkwood"
    Grid[98][16] = "Northern Mirkwood"
    Grid[98][17] = "Western Mirkwood"
    Grid[98][18] = "Western Mirkwood"
    Grid[98][19] = "Western Mirkwood"
    Grid[98][20] = "Western Mirkwood"
    Grid[98][21] = "Old Forest Road"
    Grid[98][22] = "Old Forest Road"
    Grid[98][23] = "Old Forest Road"
    Grid[98][24] = "Old Forest Road"
    Grid[98][25] = "Old Forest Road"
    Grid[98][26] = "Old Forest Road"
    Grid[98][27] = "Narrows of the Forest"
    Grid[98][28] = "Narrows of the Forest"
    Grid[98][29] = "Narrows of the Forest"
    Grid[98][30] = "Narrows of the Forest"
    Grid[98][31] = "Narrows of the Forest"
    Grid[98][32] = "Narrows of the Forest"
    Grid[98][33] = "Narrows of the Forest"
    Grid[98][34] = "Dol Guldur"
    Grid[98][35] = "Dol Guldur"
    Grid[98][36] = "Dol Guldur"
    Grid[98][37] = "Dol Guldur"
    Grid[98][38] = "Dol Guldur"
    Grid[98][39] = "Dol Guldur"
    Grid[98][40] = "Dol Guldur"
    Grid[98][41] = "Dol Guldur"
    Grid[98][42] = "Dol Guldur"
    Grid[98][43] = "Dol Guldur"
    Grid[98][44] = "Dol Guldur"
    Grid[98][45] = "Western Brown Lands"
    Grid[98][46] = "Western Brown Lands"
    Grid[98][47] = "Western Brown Lands"
    Grid[98][48] = "Western Brown Lands"
    Grid[98][49] = "Western Brown Lands"
    Grid[98][50] = "Western Brown Lands"
    Grid[98][51] = "Western Brown Lands"
    Grid[98][52] = "Western Emyn Muil"
    Grid[98][53] = "Western Emyn Muil"
    Grid[98][54] = "Western Emyn Muil"
    Grid[98][55] = "Western Emyn Muil"
    Grid[98][56] = "Western Emyn Muil"
    Grid[98][57] = "Western Emyn Muil"
    Grid[98][58] = "Western Emyn Muil"
    Grid[98][59] = "Western Emyn Muil"
    Grid[98][60] = "Western Emyn Muil"
    Grid[98][61] = "Western Emyn Muil"
    Grid[98][62] = "Druadan Forest"
    Grid[98][63] = "Druadan Forest"
    Grid[98][64] = "Druadan Forest"
    Grid[98][65] = "Druadan Forest"
    Grid[98][66] = "Druadan Forest"
    Grid[98][67] = "Druadan Forest"
    Grid[98][68] = "Druadan Forest"
    Grid[98][69] = "Druadan Forest"
    Grid[98][70] = "Druadan Forest"
    Grid[98][71] = "Minas Tirith"
    Grid[98][72] = "Minas Tirith"
    Grid[98][73] = "Minas Tirith"
    Grid[98][74] = "Minas Tirith"
    Grid[98][75] = "Minas Tirith"
    Grid[98][76] = "Minas Tirith"
    Grid[98][77] = "Minas Tirith"
    Grid[98][78] = "Lossarnach"
    Grid[98][79] = "Lossarnach"
    Grid[98][80] = "Lossarnach"
    Grid[98][81] = "Lossarnach"
    Grid[98][82] = "Lossarnach"
    Grid[98][83] = "Lossarnach"
    Grid[98][84] = "Pelargir"
    Grid[98][85] = "Pelargir"
    Grid[98][86] = "Pelargir"
    Grid[98][87] = "Pelargir"
    Grid[98][88] = "Pelargir"
    Grid[98][89] = "West Harondor"
    Grid[98][90] = "West Harondor"
    Grid[98][91] = "West Harondor"
    Grid[98][92] = "West Harondor"
    Grid[98][93] = "West Harondor"
    Grid[98][94] = "West Harondor"
    Grid[98][95] = "West Harondor"
    Grid[98][96] = "West Harondor"
    Grid[98][97] = "West Harondor"
    Grid[98][98] = "Umbar"
    Grid[98][99] = "Umbar"
    Grid[98][100] = "Umbar"
    Grid[98][101] = "Umbar"
    Grid[98][102] = "Umbar"
    Grid[98][103] = "Umbar"
    Grid[98][104] = "Umbar"
    Grid[99][1] = "Mount Gundabad"
    Grid[99][8] = "Northern Mirkwood"
    Grid[99][9] = "Northern Mirkwood"
    Grid[99][10] = "Northern Mirkwood"
    Grid[99][11] = "Northern Mirkwood"
    Grid[99][12] = "Northern Mirkwood"
    Grid[99][13] = "Northern Mirkwood"
    Grid[99][14] = "Northern Mirkwood"
    Grid[99][15] = "Northern Mirkwood"
    Grid[99][16] = "Northern Mirkwood"
    Grid[99][17] = "Western Mirkwood"
    Grid[99][18] = "Western Mirkwood"
    Grid[99][19] = "Western Mirkwood"
    Grid[99][20] = "Woodland Realm"
    Grid[99][21] = "Woodland Realm"
    Grid[99][22] = "Woodland Realm"
    Grid[99][23] = "Old Forest Road"
    Grid[99][24] = "Old Forest Road"
    Grid[99][25] = "Old Forest Road"
    Grid[99][26] = "Old Forest Road"
    Grid[99][27] = "Narrows of the Forest"
    Grid[99][28] = "Narrows of the Forest"
    Grid[99][29] = "Narrows of the Forest"
    Grid[99][30] = "Narrows of the Forest"
    Grid[99][31] = "Narrows of the Forest"
    Grid[99][32] = "Narrows of the Forest"
    Grid[99][33] = "Narrows of the Forest"
    Grid[99][34] = "Dol Guldur"
    Grid[99][35] = "Dol Guldur"
    Grid[99][36] = "Dol Guldur"
    Grid[99][37] = "Dol Guldur"
    Grid[99][38] = "Dol Guldur"
    Grid[99][39] = "Dol Guldur"
    Grid[99][40] = "Dol Guldur"
    Grid[99][41] = "Dol Guldur"
    Grid[99][42] = "Dol Guldur"
    Grid[99][43] = "Dol Guldur"
    Grid[99][44] = "Dol Guldur"
    Grid[99][45] = "Western Brown Lands"
    Grid[99][46] = "Western Brown Lands"
    Grid[99][47] = "Western Brown Lands"
    Grid[99][48] = "Western Brown Lands"
    Grid[99][49] = "Western Brown Lands"
    Grid[99][50] = "Western Brown Lands"
    Grid[99][51] = "Western Brown Lands"
    Grid[99][52] = "Western Emyn Muil"
    Grid[99][53] = "Western Emyn Muil"
    Grid[99][54] = "Western Emyn Muil"
    Grid[99][55] = "Western Emyn Muil"
    Grid[99][56] = "Western Emyn Muil"
    Grid[99][57] = "Western Emyn Muil"
    Grid[99][58] = "Western Emyn Muil"
    Grid[99][59] = "Western Emyn Muil"
    Grid[99][60] = "Western Emyn Muil"
    Grid[99][61] = "Western Emyn Muil"
    Grid[99][62] = "Dead Marshes"
    Grid[99][63] = "Dead Marshes"
    Grid[99][64] = "Druadan Forest"
    Grid[99][65] = "Druadan Forest"
    Grid[99][66] = "Druadan Forest"
    Grid[99][67] = "Druadan Forest"
    Grid[99][68] = "Druadan Forest"
    Grid[99][69] = "Minas Tirith"
    Grid[99][70] = "Minas Tirith"
    Grid[99][71] = "Minas Tirith"
    Grid[99][72] = "Minas Tirith"
    Grid[99][73] = "Minas Tirith"
    Grid[99][74] = "Minas Tirith"
    Grid[99][75] = "Minas Tirith"
    Grid[99][76] = "Minas Tirith"
    Grid[99][77] = "Minas Tirith"
    Grid[99][78] = "Minas Tirith"
    Grid[99][79] = "Minas Tirith"
    Grid[99][80] = "Osgiliath"
    Grid[99][81] = "Osgiliath"
    Grid[99][82] = "Osgiliath"
    Grid[99][83] = "Osgiliath"
    Grid[99][84] = "Osgiliath"
    Grid[99][85] = "Osgiliath"
    Grid[99][86] = "Pelargir"
    Grid[99][87] = "Pelargir"
    Grid[99][88] = "West Harondor"
    Grid[99][89] = "West Harondor"
    Grid[99][90] = "West Harondor"
    Grid[99][91] = "West Harondor"
    Grid[99][92] = "West Harondor"
    Grid[99][93] = "West Harondor"
    Grid[99][94] = "West Harondor"
    Grid[99][95] = "West Harondor"
    Grid[99][96] = "West Harondor"
    Grid[99][97] = "West Harondor"
    Grid[99][98] = "Umbar"
    Grid[99][99] = "Umbar"
    Grid[99][100] = "Umbar"
    Grid[99][101] = "Umbar"
    Grid[99][102] = "Umbar"
    Grid[99][103] = "Umbar"
    Grid[99][104] = "Umbar"
    Grid[100][1] = "Mount Gundabad"
    Grid[100][8] = "Northern Mirkwood"
    Grid[100][9] = "Northern Mirkwood"
    Grid[100][10] = "Withered Heath"
    Grid[100][11] = "Withered Heath"
    Grid[100][12] = "Withered Heath"
    Grid[100][13] = "Withered Heath"
    Grid[100][14] = "Northern Mirkwood"
    Grid[100][15] = "Woodland Realm"
    Grid[100][16] = "Woodland Realm"
    Grid[100][17] = "Woodland Realm"
    Grid[100][18] = "Woodland Realm"
    Grid[100][19] = "Woodland Realm"
    Grid[100][20] = "Woodland Realm"
    Grid[100][21] = "Woodland Realm"
    Grid[100][22] = "Woodland Realm"
    Grid[100][23] = "Woodland Realm"
    Grid[100][24] = "Old Forest Road"
    Grid[100][25] = "Old Forest Road"
    Grid[100][26] = "Old Forest Road"
    Grid[100][27] = "Narrows of the Forest"
    Grid[100][28] = "Narrows of the Forest"
    Grid[100][29] = "Narrows of the Forest"
    Grid[100][30] = "Narrows of the Forest"
    Grid[100][31] = "Narrows of the Forest"
    Grid[100][32] = "Narrows of the Forest"
    Grid[100][33] = "Narrows of the Forest"
    Grid[100][34] = "Eastern Mirkwood"
    Grid[100][35] = "Dol Guldur"
    Grid[100][36] = "Dol Guldur"
    Grid[100][37] = "Dol Guldur"
    Grid[100][38] = "Dol Guldur"
    Grid[100][39] = "Dol Guldur"
    Grid[100][40] = "Dol Guldur"
    Grid[100][41] = "Dol Guldur"
    Grid[100][42] = "Dol Guldur"
    Grid[100][43] = "Dol Guldur"
    Grid[100][44] = "Dol Guldur"
    Grid[100][45] = "Western Brown Lands"
    Grid[100][46] = "Western Brown Lands"
    Grid[100][47] = "Western Brown Lands"
    Grid[100][48] = "Western Brown Lands"
    Grid[100][49] = "Western Brown Lands"
    Grid[100][50] = "Western Brown Lands"
    Grid[100][51] = "Western Emyn Muil"
    Grid[100][52] = "Western Emyn Muil"
    Grid[100][53] = "Western Emyn Muil"
    Grid[100][54] = "Western Emyn Muil"
    Grid[100][55] = "Western Emyn Muil"
    Grid[100][56] = "Western Emyn Muil"
    Grid[100][57] = "Western Emyn Muil"
    Grid[100][58] = "Western Emyn Muil"
    Grid[100][59] = "Western Emyn Muil"
    Grid[100][60] = "Dead Marshes"
    Grid[100][61] = "Dead Marshes"
    Grid[100][62] = "Dead Marshes"
    Grid[100][63] = "Dead Marshes"
    Grid[100][64] = "Druadan Forest"
    Grid[100][65] = "Osgiliath"
    Grid[100][66] = "Osgiliath"
    Grid[100][67] = "Druadan Forest"
    Grid[100][68] = "Minas Tirith"
    Grid[100][69] = "Minas Tirith"
    Grid[100][70] = "Minas Tirith"
    Grid[100][71] = "Minas Tirith"
    Grid[100][72] = "Minas Tirith"
    Grid[100][73] = "Minas Tirith"
    Grid[100][74] = "Minas Tirith"
    Grid[100][75] = "Minas Tirith"
    Grid[100][76] = "Minas Tirith"
    Grid[100][77] = "Minas Tirith"
    Grid[100][78] = "Minas Tirith"
    Grid[100][79] = "Minas Tirith"
    Grid[100][80] = "Osgiliath"
    Grid[100][81] = "Osgiliath"
    Grid[100][82] = "Osgiliath"
    Grid[100][83] = "Osgiliath"
    Grid[100][84] = "Osgiliath"
    Grid[100][85] = "Osgiliath"
    Grid[100][86] = "Osgiliath"
    Grid[100][87] = "West Harondor"
    Grid[100][88] = "West Harondor"
    Grid[100][89] = "West Harondor"
    Grid[100][90] = "West Harondor"
    Grid[100][91] = "West Harondor"
    Grid[100][92] = "West Harondor"
    Grid[100][93] = "West Harondor"
    Grid[100][94] = "West Harondor"
    Grid[100][95] = "West Harondor"
    Grid[100][96] = "West Harondor"
    Grid[100][97] = "West Harondor"
    Grid[100][98] = "Umbar"
    Grid[100][99] = "Umbar"
    Grid[100][100] = "Umbar"
    Grid[100][101] = "Umbar"
    Grid[100][102] = "Umbar"
    Grid[100][103] = "Umbar"
    Grid[100][104] = "Umbar"
    Grid[101][1] = "Mount Gundabad"
    Grid[101][8] = "Withered Heath"
    Grid[101][9] = "Withered Heath"
    Grid[101][10] = "Withered Heath"
    Grid[101][11] = "Withered Heath"
    Grid[101][12] = "Withered Heath"
    Grid[101][13] = "Withered Heath"
    Grid[101][14] = "Withered Heath"
    Grid[101][15] = "Woodland Realm"
    Grid[101][16] = "Woodland Realm"
    Grid[101][17] = "Woodland Realm"
    Grid[101][18] = "Woodland Realm"
    Grid[101][19] = "Woodland Realm"
    Grid[101][20] = "Woodland Realm"
    Grid[101][21] = "Woodland Realm"
    Grid[101][22] = "Woodland Realm"
    Grid[101][23] = "Woodland Realm"
    Grid[101][24] = "Old Forest Road"
    Grid[101][25] = "Old Forest Road"
    Grid[101][26] = "Old Forest Road"
    Grid[101][27] = "Narrows of the Forest"
    Grid[101][28] = "Narrows of the Forest"
    Grid[101][29] = "Narrows of the Forest"
    Grid[101][30] = "Narrows of the Forest"
    Grid[101][31] = "Narrows of the Forest"
    Grid[101][32] = "Eastern Mirkwood"
    Grid[101][33] = "Eastern Mirkwood"
    Grid[101][34] = "Eastern Mirkwood"
    Grid[101][35] = "Southern Murkwood"
    Grid[101][36] = "Dol Guldur"
    Grid[101][37] = "Dol Guldur"
    Grid[101][38] = "Dol Guldur"
    Grid[101][39] = "Dol Guldur"
    Grid[101][40] = "Dol Guldur"
    Grid[101][41] = "Dol Guldur"
    Grid[101][42] = "Dol Guldur"
    Grid[101][43] = "Dol Guldur"
    Grid[101][44] = "Dol Guldur"
    Grid[101][45] = "Western Brown Lands"
    Grid[101][46] = "Western Brown Lands"
    Grid[101][47] = "Western Brown Lands"
    Grid[101][48] = "Western Brown Lands"
    Grid[101][49] = "Western Brown Lands"
    Grid[101][50] = "Western Brown Lands"
    Grid[101][51] = "Western Emyn Muil"
    Grid[101][52] = "Western Emyn Muil"
    Grid[101][53] = "Western Emyn Muil"
    Grid[101][54] = "Western Emyn Muil"
    Grid[101][55] = "Western Emyn Muil"
    Grid[101][56] = "Western Emyn Muil"
    Grid[101][57] = "Western Emyn Muil"
    Grid[101][58] = "Western Emyn Muil"
    Grid[101][59] = "Dead Marshes"
    Grid[101][60] = "Dead Marshes"
    Grid[101][61] = "Dead Marshes"
    Grid[101][62] = "Dead Marshes"
    Grid[101][63] = "Dead Marshes"
    Grid[101][64] = "Dead Marshes"
    Grid[101][65] = "Osgiliath"
    Grid[101][66] = "Osgiliath"
    Grid[101][67] = "Osgiliath"
    Grid[101][68] = "Minas Tirith"
    Grid[101][69] = "Minas Tirith"
    Grid[101][70] = "Minas Tirith"
    Grid[101][71] = "Minas Tirith"
    Grid[101][72] = "Minas Tirith"
    Grid[101][73] = "Minas Tirith"
    Grid[101][74] = "Minas Tirith"
    Grid[101][75] = "Minas Tirith"
    Grid[101][76] = "Minas Tirith"
    Grid[101][77] = "Minas Tirith"
    Grid[101][78] = "Minas Tirith"
    Grid[101][79] = "Minas Tirith"
    Grid[101][80] = "Osgiliath"
    Grid[101][81] = "Osgiliath"
    Grid[101][82] = "Osgiliath"
    Grid[101][83] = "Osgiliath"
    Grid[101][84] = "Osgiliath"
    Grid[101][85] = "Osgiliath"
    Grid[101][86] = "Osgiliath"
    Grid[101][87] = "West Harondor"
    Grid[101][88] = "West Harondor"
    Grid[101][89] = "West Harondor"
    Grid[101][90] = "West Harondor"
    Grid[101][91] = "West Harondor"
    Grid[101][92] = "West Harondor"
    Grid[101][93] = "West Harondor"
    Grid[101][94] = "West Harondor"
    Grid[101][95] = "West Harondor"
    Grid[101][96] = "West Harondor"
    Grid[101][97] = "West Harondor"
    Grid[101][98] = "Umbar"
    Grid[101][99] = "Umbar"
    Grid[101][100] = "Umbar"
    Grid[101][101] = "Umbar"
    Grid[101][102] = "Umbar"
    Grid[101][103] = "Umbar"
    Grid[101][104] = "Umbar"
    Grid[102][1] = "Mount Gundabad"
    Grid[102][8] = "Withered Heath"
    Grid[102][9] = "Withered Heath"
    Grid[102][10] = "Withered Heath"
    Grid[102][11] = "Withered Heath"
    Grid[102][12] = "Withered Heath"
    Grid[102][13] = "Withered Heath"
    Grid[102][14] = "Withered Heath"
    Grid[102][15] = "Woodland Realm"
    Grid[102][16] = "Woodland Realm"
    Grid[102][17] = "Woodland Realm"
    Grid[102][18] = "Woodland Realm"
    Grid[102][19] = "Woodland Realm"
    Grid[102][20] = "Woodland Realm"
    Grid[102][21] = "Woodland Realm"
    Grid[102][22] = "Woodland Realm"
    Grid[102][23] = "Woodland Realm"
    Grid[102][24] = "Old Forest Road"
    Grid[102][25] = "Old Forest Road"
    Grid[102][26] = "Old Forest Road"
    Grid[102][27] = "Eastern Mirkwood"
    Grid[102][28] = "Eastern Mirkwood"
    Grid[102][29] = "Eastern Mirkwood"
    Grid[102][30] = "Eastern Mirkwood"
    Grid[102][31] = "Eastern Mirkwood"
    Grid[102][32] = "Eastern Mirkwood"
    Grid[102][33] = "Eastern Mirkwood"
    Grid[102][34] = "Eastern Mirkwood"
    Grid[102][35] = "Southern Murkwood"
    Grid[102][36] = "Southern Murkwood"
    Grid[102][37] = "Southern Murkwood"
    Grid[102][38] = "Southern Murkwood"
    Grid[102][39] = "Southern Murkwood"
    Grid[102][40] = "Southern Murkwood"
    Grid[102][41] = "Southern Murkwood"
    Grid[102][42] = "Dol Guldur"
    Grid[102][43] = "Dol Guldur"
    Grid[102][44] = "Eastern Brown Lands"
    Grid[102][45] = "Eastern Brown Lands"
    Grid[102][46] = "Western Brown Lands"
    Grid[102][47] = "Western Brown Lands"
    Grid[102][48] = "Western Brown Lands"
    Grid[102][49] = "Eastern Brown Lands"
    Grid[102][50] = "Western Brown Lands"
    Grid[102][51] = "Western Emyn Muil"
    Grid[102][52] = "Western Emyn Muil"
    Grid[102][53] = "Western Emyn Muil"
    Grid[102][54] = "Western Emyn Muil"
    Grid[102][55] = "Western Emyn Muil"
    Grid[102][56] = "Western Emyn Muil"
    Grid[102][57] = "Western Emyn Muil"
    Grid[102][58] = "Dead Marshes"
    Grid[102][59] = "Dead Marshes"
    Grid[102][60] = "Dead Marshes"
    Grid[102][61] = "Dead Marshes"
    Grid[102][62] = "Dead Marshes"
    Grid[102][63] = "Dead Marshes"
    Grid[102][64] = "Dead Marshes"
    Grid[102][65] = "Dead Marshes"
    Grid[102][66] = "Osgiliath"
    Grid[102][67] = "Osgiliath"
    Grid[102][68] = "Osgiliath"
    Grid[102][69] = "Osgiliath"
    Grid[102][70] = "Minas Tirith"
    Grid[102][71] = "Minas Tirith"
    Grid[102][72] = "Minas Tirith"
    Grid[102][73] = "Minas Tirith"
    Grid[102][74] = "Minas Tirith"
    Grid[102][75] = "Minas Tirith"
    Grid[102][76] = "Minas Tirith"
    Grid[102][77] = "Minas Tirith"
    Grid[102][78] = "Minas Tirith"
    Grid[102][79] = "Osgiliath"
    Grid[102][80] = "Osgiliath"
    Grid[102][81] = "Osgiliath"
    Grid[102][82] = "Osgiliath"
    Grid[102][83] = "Osgiliath"
    Grid[102][84] = "Osgiliath"
    Grid[102][85] = "Osgiliath"
    Grid[102][86] = "West Harondor"
    Grid[102][87] = "West Harondor"
    Grid[102][88] = "West Harondor"
    Grid[102][89] = "West Harondor"
    Grid[102][90] = "West Harondor"
    Grid[102][91] = "West Harondor"
    Grid[102][92] = "West Harondor"
    Grid[102][93] = "West Harondor"
    Grid[102][94] = "West Harondor"
    Grid[102][95] = "West Harondor"
    Grid[102][96] = "West Harondor"
    Grid[102][97] = "West Harondor"
    Grid[102][98] = "West Harondor"
    Grid[102][99] = "Near Harad"
    Grid[102][100] = "Near Harad"
    Grid[102][101] = "Near Harad"
    Grid[102][102] = "Near Harad"
    Grid[102][103] = "Near Harad"
    Grid[102][104] = "Near Harad"
    Grid[103][1] = "Mount Gundabad"
    Grid[103][8] = "Withered Heath"
    Grid[103][9] = "Withered Heath"
    Grid[103][10] = "Withered Heath"
    Grid[103][11] = "Withered Heath"
    Grid[103][12] = "Withered Heath"
    Grid[103][13] = "Withered Heath"
    Grid[103][14] = "Withered Heath"
    Grid[103][15] = "Withered Heath"
    Grid[103][16] = "Woodland Realm"
    Grid[103][17] = "Woodland Realm"
    Grid[103][18] = "Woodland Realm"
    Grid[103][19] = "Woodland Realm"
    Grid[103][20] = "Woodland Realm"
    Grid[103][21] = "Woodland Realm"
    Grid[103][22] = "Woodland Realm"
    Grid[103][23] = "Woodland Realm"
    Grid[103][24] = "Old Forest Road"
    Grid[103][25] = "Old Forest Road"
    Grid[103][26] = "Old Forest Road"
    Grid[103][27] = "Eastern Mirkwood"
    Grid[103][28] = "Eastern Mirkwood"
    Grid[103][29] = "Eastern Mirkwood"
    Grid[103][30] = "Eastern Mirkwood"
    Grid[103][31] = "Eastern Mirkwood"
    Grid[103][32] = "Eastern Mirkwood"
    Grid[103][33] = "Eastern Mirkwood"
    Grid[103][34] = "Northern Rhovanion"
    Grid[103][35] = "Southern Murkwood"
    Grid[103][36] = "Southern Murkwood"
    Grid[103][37] = "Southern Murkwood"
    Grid[103][38] = "Southern Murkwood"
    Grid[103][39] = "Southern Murkwood"
    Grid[103][40] = "Southern Murkwood"
    Grid[103][41] = "Southern Murkwood"
    Grid[103][42] = "Southern Murkwood"
    Grid[103][43] = "Southern Murkwood"
    Grid[103][44] = "Eastern Brown Lands"
    Grid[103][45] = "Eastern Brown Lands"
    Grid[103][46] = "Eastern Brown Lands"
    Grid[103][47] = "Eastern Brown Lands"
    Grid[103][48] = "Eastern Brown Lands"
    Grid[103][49] = "Eastern Brown Lands"
    Grid[103][50] = "Eastern Brown Lands"
    Grid[103][51] = "Western Emyn Muil"
    Grid[103][52] = "Eastern Emyn Muil"
    Grid[103][53] = "Eastern Emyn Muil"
    Grid[103][54] = "Western Emyn Muil"
    Grid[103][55] = "Western Emyn Muil"
    Grid[103][56] = "Western Emyn Muil"
    Grid[103][57] = "Eastern Emyn Muil"
    Grid[103][58] = "Dead Marshes"
    Grid[103][59] = "Dead Marshes"
    Grid[103][60] = "Dead Marshes"
    Grid[103][61] = "Dead Marshes"
    Grid[103][62] = "Dead Marshes"
    Grid[103][63] = "Dead Marshes"
    Grid[103][64] = "Dead Marshes"
    Grid[103][65] = "Dead Marshes"
    Grid[103][66] = "Dead Marshes"
    Grid[103][67] = "Osgiliath"
    Grid[103][68] = "Osgiliath"
    Grid[103][69] = "Osgiliath"
    Grid[103][70] = "Minas Tirith"
    Grid[103][71] = "Minas Tirith"
    Grid[103][72] = "Minas Tirith"
    Grid[103][73] = "Osgiliath"
    Grid[103][74] = "Osgiliath"
    Grid[103][75] = "Osgiliath"
    Grid[103][76] = "Osgiliath"
    Grid[103][77] = "Osgiliath"
    Grid[103][78] = "Osgiliath"
    Grid[103][79] = "Osgiliath"
    Grid[103][80] = "Osgiliath"
    Grid[103][81] = "Osgiliath"
    Grid[103][82] = "Osgiliath"
    Grid[103][83] = "Osgiliath"
    Grid[103][84] = "South Ithilien"
    Grid[103][85] = "South Ithilien"
    Grid[103][86] = "South Ithilien"
    Grid[103][87] = "West Harondor"
    Grid[103][88] = "West Harondor"
    Grid[103][89] = "West Harondor"
    Grid[103][90] = "West Harondor"
    Grid[103][91] = "West Harondor"
    Grid[103][92] = "West Harondor"
    Grid[103][93] = "West Harondor"
    Grid[103][94] = "West Harondor"
    Grid[103][95] = "West Harondor"
    Grid[103][96] = "West Harondor"
    Grid[103][97] = "West Harondor"
    Grid[103][98] = "West Harondor"
    Grid[103][99] = "Near Harad"
    Grid[103][100] = "Near Harad"
    Grid[103][101] = "Near Harad"
    Grid[103][102] = "Near Harad"
    Grid[103][103] = "Near Harad"
    Grid[103][104] = "Near Harad"
    Grid[104][1] = "Mount Gundabad"
    Grid[104][8] = "Withered Heath"
    Grid[104][9] = "Withered Heath"
    Grid[104][10] = "Withered Heath"
    Grid[104][11] = "Withered Heath"
    Grid[104][12] = "Withered Heath"
    Grid[104][13] = "Withered Heath"
    Grid[104][14] = "Withered Heath"
    Grid[104][15] = "Withered Heath"
    Grid[104][16] = "Withered Heath"
    Grid[104][17] = "Woodland Realm"
    Grid[104][18] = "Woodland Realm"
    Grid[104][19] = "Woodland Realm"
    Grid[104][20] = "Woodland Realm"
    Grid[104][21] = "Woodland Realm"
    Grid[104][22] = "Woodland Realm"
    Grid[104][23] = "Woodland Realm"
    Grid[104][24] = "Old Forest Road"
    Grid[104][25] = "Old Forest Road"
    Grid[104][26] = "Old Forest Road"
    Grid[104][27] = "Eastern Mirkwood"
    Grid[104][28] = "Eastern Mirkwood"
    Grid[104][29] = "Eastern Mirkwood"
    Grid[104][30] = "Eastern Mirkwood"
    Grid[104][31] = "Eastern Mirkwood"
    Grid[104][32] = "Eastern Mirkwood"
    Grid[104][33] = "Northern Rhovanion"
    Grid[104][34] = "Northern Rhovanion"
    Grid[104][35] = "Southern Murkwood"
    Grid[104][36] = "Southern Murkwood"
    Grid[104][37] = "Southern Murkwood"
    Grid[104][38] = "Southern Murkwood"
    Grid[104][39] = "Southern Murkwood"
    Grid[104][40] = "Southern Murkwood"
    Grid[104][41] = "Southern Murkwood"
    Grid[104][42] = "Southern Murkwood"
    Grid[104][43] = "Eastern Brown Lands"
    Grid[104][44] = "Eastern Brown Lands"
    Grid[104][45] = "Eastern Brown Lands"
    Grid[104][46] = "Eastern Brown Lands"
    Grid[104][47] = "Eastern Brown Lands"
    Grid[104][48] = "Eastern Brown Lands"
    Grid[104][49] = "Eastern Brown Lands"
    Grid[104][50] = "Eastern Brown Lands"
    Grid[104][51] = "Eastern Emyn Muil"
    Grid[104][52] = "Eastern Emyn Muil"
    Grid[104][53] = "Eastern Emyn Muil"
    Grid[104][54] = "Eastern Emyn Muil"
    Grid[104][55] = "Eastern Emyn Muil"
    Grid[104][56] = "Eastern Emyn Muil"
    Grid[104][57] = "Eastern Emyn Muil"
    Grid[104][58] = "Dead Marshes"
    Grid[104][59] = "Dead Marshes"
    Grid[104][60] = "Dead Marshes"
    Grid[104][61] = "Dead Marshes"
    Grid[104][62] = "Dead Marshes"
    Grid[104][63] = "Dead Marshes"
    Grid[104][64] = "Dead Marshes"
    Grid[104][65] = "Dead Marshes"
    Grid[104][66] = "Dead Marshes"
    Grid[104][67] = "Osgiliath"
    Grid[104][68] = "Osgiliath"
    Grid[104][69] = "Osgiliath"
    Grid[104][70] = "Osgiliath"
    Grid[104][71] = "Osgiliath"
    Grid[104][72] = "Osgiliath"
    Grid[104][73] = "Osgiliath"
    Grid[104][74] = "Osgiliath"
    Grid[104][75] = "Osgiliath"
    Grid[104][76] = "Osgiliath"
    Grid[104][77] = "Osgiliath"
    Grid[104][78] = "Osgiliath"
    Grid[104][79] = "Osgiliath"
    Grid[104][80] = "Osgiliath"
    Grid[104][81] = "Osgiliath"
    Grid[104][82] = "Osgiliath"
    Grid[104][83] = "South Ithilien"
    Grid[104][84] = "South Ithilien"
    Grid[104][85] = "South Ithilien"
    Grid[104][86] = "South Ithilien"
    Grid[104][87] = "South Ithilien"
    Grid[104][88] = "South Ithilien"
    Grid[104][89] = "West Harondor"
    Grid[104][90] = "East Harondor"
    Grid[104][91] = "East Harondor"
    Grid[104][92] = "East Harondor"
    Grid[104][93] = "East Harondor"
    Grid[104][94] = "West Harondor"
    Grid[104][95] = "West Harondor"
    Grid[104][96] = "West Harondor"
    Grid[104][97] = "West Harondor"
    Grid[104][98] = "Near Harad"
    Grid[104][99] = "Near Harad"
    Grid[104][100] = "Near Harad"
    Grid[104][101] = "Near Harad"
    Grid[104][102] = "Near Harad"
    Grid[104][103] = "Near Harad"
    Grid[104][104] = "Near Harad"
    Grid[105][1] = "Mount Gundabad"
    Grid[105][8] = "Withered Heath"
    Grid[105][9] = "Withered Heath"
    Grid[105][10] = "Withered Heath"
    Grid[105][11] = "Erebor"
    Grid[105][12] = "Erebor"
    Grid[105][13] = "Erebor"
    Grid[105][14] = "Erebor"
    Grid[105][15] = "Withered Heath"
    Grid[105][16] = "Withered Heath"
    Grid[105][17] = "Withered Heath"
    Grid[105][18] = "Woodland Realm"
    Grid[105][19] = "Woodland Realm"
    Grid[105][20] = "Woodland Realm"
    Grid[105][21] = "Woodland Realm"
    Grid[105][22] = "Woodland Realm"
    Grid[105][23] = "Woodland Realm"
    Grid[105][24] = "Old Forest Road"
    Grid[105][25] = "Old Forest Road"
    Grid[105][26] = "Old Forest Road"
    Grid[105][27] = "Eastern Mirkwood"
    Grid[105][28] = "Eastern Mirkwood"
    Grid[105][29] = "Eastern Mirkwood"
    Grid[105][30] = "Eastern Mirkwood"
    Grid[105][31] = "Eastern Mirkwood"
    Grid[105][32] = "Eastern Mirkwood"
    Grid[105][33] = "Northern Rhovanion"
    Grid[105][34] = "Northern Rhovanion"
    Grid[105][35] = "Southern Murkwood"
    Grid[105][36] = "Southern Murkwood"
    Grid[105][37] = "Southern Murkwood"
    Grid[105][38] = "Southern Murkwood"
    Grid[105][39] = "Southern Murkwood"
    Grid[105][40] = "Southern Murkwood"
    Grid[105][41] = "Southern Murkwood"
    Grid[105][42] = "Eastern Brown Lands"
    Grid[105][43] = "Eastern Brown Lands"
    Grid[105][44] = "Eastern Brown Lands"
    Grid[105][45] = "Eastern Brown Lands"
    Grid[105][46] = "Eastern Brown Lands"
    Grid[105][47] = "Eastern Brown Lands"
    Grid[105][48] = "Eastern Brown Lands"
    Grid[105][49] = "Eastern Brown Lands"
    Grid[105][50] = "Eastern Emyn Muil"
    Grid[105][51] = "Eastern Emyn Muil"
    Grid[105][52] = "Eastern Emyn Muil"
    Grid[105][53] = "Eastern Emyn Muil"
    Grid[105][54] = "Eastern Emyn Muil"
    Grid[105][55] = "Eastern Emyn Muil"
    Grid[105][56] = "Eastern Emyn Muil"
    Grid[105][57] = "Eastern Emyn Muil"
    Grid[105][58] = "Dead Marshes"
    Grid[105][59] = "Dead Marshes"
    Grid[105][60] = "Dead Marshes"
    Grid[105][61] = "Dead Marshes"
    Grid[105][62] = "Dead Marshes"
    Grid[105][63] = "Dead Marshes"
    Grid[105][64] = "Dead Marshes"
    Grid[105][65] = "North Ithilien"
    Grid[105][66] = "North Ithilien"
    Grid[105][67] = "North Ithilien"
    Grid[105][68] = "Osgiliath"
    Grid[105][69] = "Osgiliath"
    Grid[105][70] = "Osgiliath"
    Grid[105][71] = "Osgiliath"
    Grid[105][72] = "Osgiliath"
    Grid[105][73] = "Osgiliath"
    Grid[105][74] = "Osgiliath"
    Grid[105][75] = "Osgiliath"
    Grid[105][76] = "Osgiliath"
    Grid[105][77] = "Osgiliath"
    Grid[105][78] = "Osgiliath"
    Grid[105][79] = "South Ithilien"
    Grid[105][80] = "South Ithilien"
    Grid[105][81] = "South Ithilien"
    Grid[105][82] = "South Ithilien"
    Grid[105][83] = "South Ithilien"
    Grid[105][84] = "South Ithilien"
    Grid[105][85] = "South Ithilien"
    Grid[105][86] = "South Ithilien"
    Grid[105][87] = "South Ithilien"
    Grid[105][88] = "South Ithilien"
    Grid[105][89] = "East Harondor"
    Grid[105][90] = "East Harondor"
    Grid[105][91] = "East Harondor"
    Grid[105][92] = "East Harondor"
    Grid[105][93] = "East Harondor"
    Grid[105][94] = "East Harondor"
    Grid[105][95] = "East Harondor"
    Grid[105][96] = "West Harondor"
    Grid[105][97] = "Near Harad"
    Grid[105][98] = "Near Harad"
    Grid[105][99] = "Near Harad"
    Grid[105][100] = "Near Harad"
    Grid[105][101] = "Near Harad"
    Grid[105][102] = "Near Harad"
    Grid[105][103] = "Near Harad"
    Grid[105][104] = "Near Harad"
    Grid[106][1] = "Mount Gundabad"
    Grid[106][8] = "Erebor"
    Grid[106][9] = "Erebor"
    Grid[106][10] = "Erebor"
    Grid[106][11] = "Erebor"
    Grid[106][12] = "Erebor"
    Grid[106][13] = "Erebor"
    Grid[106][14] = "Erebor"
    Grid[106][15] = "Erebor"
    Grid[106][16] = "Withered Heath"
    Grid[106][17] = "Withered Heath"
    Grid[106][18] = "Withered Heath"
    Grid[106][19] = "Dale"
    Grid[106][20] = "Dale"
    Grid[106][21] = "Woodland Realm"
    Grid[106][22] = "Woodland Realm"
    Grid[106][23] = "Woodland Realm"
    Grid[106][24] = "Old Forest Road"
    Grid[106][25] = "Old Forest Road"
    Grid[106][26] = "Old Forest Road"
    Grid[106][27] = "Northern Rhovanion"
    Grid[106][28] = "Northern Rhovanion"
    Grid[106][29] = "Northern Rhovanion"
    Grid[106][30] = "Northern Rhovanion"
    Grid[106][31] = "Eastern Mirkwood"
    Grid[106][32] = "Eastern Mirkwood"
    Grid[106][33] = "Northern Rhovanion"
    Grid[106][34] = "Northern Rhovanion"
    Grid[106][35] = "Southern Rhovanion"
    Grid[106][36] = "Southern Murkwood"
    Grid[106][37] = "Southern Murkwood"
    Grid[106][38] = "Southern Murkwood"
    Grid[106][39] = "Southern Murkwood"
    Grid[106][40] = "Southern Murkwood"
    Grid[106][41] = "Eastern Brown Lands"
    Grid[106][42] = "Eastern Brown Lands"
    Grid[106][43] = "Eastern Brown Lands"
    Grid[106][44] = "Eastern Brown Lands"
    Grid[106][45] = "Eastern Brown Lands"
    Grid[106][46] = "Eastern Brown Lands"
    Grid[106][47] = "Eastern Brown Lands"
    Grid[106][48] = "Eastern Brown Lands"
    Grid[106][49] = "Eastern Brown Lands"
    Grid[106][50] = "Eastern Emyn Muil"
    Grid[106][51] = "Eastern Emyn Muil"
    Grid[106][52] = "Eastern Emyn Muil"
    Grid[106][53] = "Eastern Emyn Muil"
    Grid[106][54] = "Eastern Emyn Muil"
    Grid[106][55] = "Eastern Emyn Muil"
    Grid[106][56] = "Eastern Emyn Muil"
    Grid[106][57] = "Dead Marshes"
    Grid[106][58] = "Dead Marshes"
    Grid[106][59] = "Dead Marshes"
    Grid[106][60] = "Dead Marshes"
    Grid[106][61] = "Dead Marshes"
    Grid[106][62] = "Dead Marshes"
    Grid[106][63] = "North Ithilien"
    Grid[106][64] = "North Ithilien"
    Grid[106][65] = "North Ithilien"
    Grid[106][66] = "North Ithilien"
    Grid[106][67] = "North Ithilien"
    Grid[106][68] = "North Ithilien"
    Grid[106][69] = "North Ithilien"
    Grid[106][70] = "Osgiliath"
    Grid[106][71] = "Osgiliath"
    Grid[106][72] = "Osgiliath"
    Grid[106][73] = "Osgiliath"
    Grid[106][74] = "Osgiliath"
    Grid[106][75] = "Osgiliath"
    Grid[106][76] = "South Ithilien"
    Grid[106][77] = "South Ithilien"
    Grid[106][78] = "South Ithilien"
    Grid[106][79] = "South Ithilien"
    Grid[106][80] = "South Ithilien"
    Grid[106][81] = "South Ithilien"
    Grid[106][82] = "South Ithilien"
    Grid[106][83] = "South Ithilien"
    Grid[106][84] = "South Ithilien"
    Grid[106][85] = "South Ithilien"
    Grid[106][86] = "South Ithilien"
    Grid[106][87] = "East Harondor"
    Grid[106][88] = "East Harondor"
    Grid[106][89] = "East Harondor"
    Grid[106][90] = "East Harondor"
    Grid[106][91] = "East Harondor"
    Grid[106][92] = "East Harondor"
    Grid[106][93] = "East Harondor"
    Grid[106][94] = "East Harondor"
    Grid[106][95] = "East Harondor"
    Grid[106][96] = "East Harondor"
    Grid[106][97] = "Near Harad"
    Grid[106][98] = "Near Harad"
    Grid[106][99] = "Near Harad"
    Grid[106][100] = "Near Harad"
    Grid[106][101] = "Near Harad"
    Grid[106][102] = "Near Harad"
    Grid[106][103] = "Near Harad"
    Grid[106][104] = "Near Harad"
    Grid[107][1] = "Mount Gundabad"
    Grid[107][8] = "Erebor"
    Grid[107][9] = "Erebor"
    Grid[107][10] = "Erebor"
    Grid[107][11] = "Erebor"
    Grid[107][12] = "Erebor"
    Grid[107][13] = "Erebor"
    Grid[107][14] = "Erebor"
    Grid[107][15] = "Erebor"
    Grid[107][16] = "Withered Heath"
    Grid[107][17] = "Withered Heath"
    Grid[107][18] = "Withered Heath"
    Grid[107][19] = "Dale"
    Grid[107][20] = "Dale"
    Grid[107][21] = "Dale"
    Grid[107][22] = "Dale"
    Grid[107][23] = "Old Forest Road"
    Grid[107][24] = "Old Forest Road"
    Grid[107][25] = "Northern Rhovanion"
    Grid[107][26] = "Northern Rhovanion"
    Grid[107][27] = "Northern Rhovanion"
    Grid[107][28] = "Northern Rhovanion"
    Grid[107][29] = "Northern Rhovanion"
    Grid[107][30] = "Northern Rhovanion"
    Grid[107][31] = "Northern Rhovanion"
    Grid[107][32] = "Northern Rhovanion"
    Grid[107][33] = "Northern Rhovanion"
    Grid[107][34] = "Northern Rhovanion"
    Grid[107][35] = "Southern Rhovanion"
    Grid[107][36] = "Southern Rhovanion"
    Grid[107][37] = "Southern Murkwood"
    Grid[107][38] = "Southern Murkwood"
    Grid[107][39] = "Southern Rhovanion"
    Grid[107][40] = "Southern Rhovanion"
    Grid[107][41] = "Eastern Brown Lands"
    Grid[107][42] = "Eastern Brown Lands"
    Grid[107][43] = "Eastern Brown Lands"
    Grid[107][44] = "Eastern Brown Lands"
    Grid[107][45] = "Eastern Brown Lands"
    Grid[107][46] = "Eastern Brown Lands"
    Grid[107][47] = "Eastern Brown Lands"
    Grid[107][48] = "Eastern Brown Lands"
    Grid[107][49] = "Eastern Brown Lands"
    Grid[107][50] = "Eastern Emyn Muil"
    Grid[107][51] = "Eastern Emyn Muil"
    Grid[107][52] = "Eastern Emyn Muil"
    Grid[107][53] = "Eastern Emyn Muil"
    Grid[107][54] = "Eastern Emyn Muil"
    Grid[107][55] = "Eastern Emyn Muil"
    Grid[107][56] = "Eastern Emyn Muil"
    Grid[107][57] = "Dead Marshes"
    Grid[107][58] = "Dead Marshes"
    Grid[107][59] = "Dead Marshes"
    Grid[107][60] = "Dead Marshes"
    Grid[107][61] = "North Ithilien"
    Grid[107][62] = "North Ithilien"
    Grid[107][63] = "North Ithilien"
    Grid[107][64] = "North Ithilien"
    Grid[107][65] = "North Ithilien"
    Grid[107][66] = "North Ithilien"
    Grid[107][67] = "North Ithilien"
    Grid[107][68] = "North Ithilien"
    Grid[107][69] = "North Ithilien"
    Grid[107][70] = "North Ithilien"
    Grid[107][71] = "North Ithilien"
    Grid[107][72] = "North Ithilien"
    Grid[107][73] = "South Ithilien"
    Grid[107][74] = "South Ithilien"
    Grid[107][75] = "South Ithilien"
    Grid[107][76] = "South Ithilien"
    Grid[107][77] = "South Ithilien"
    Grid[107][78] = "South Ithilien"
    Grid[107][79] = "South Ithilien"
    Grid[107][80] = "South Ithilien"
    Grid[107][81] = "South Ithilien"
    Grid[107][82] = "South Ithilien"
    Grid[107][83] = "South Ithilien"
    Grid[107][84] = "South Ithilien"
    Grid[107][85] = "South Ithilien"
    Grid[107][86] = "South Ithilien"
    Grid[107][87] = "East Harondor"
    Grid[107][88] = "East Harondor"
    Grid[107][89] = "East Harondor"
    Grid[107][90] = "East Harondor"
    Grid[107][91] = "East Harondor"
    Grid[107][92] = "East Harondor"
    Grid[107][93] = "East Harondor"
    Grid[107][94] = "East Harondor"
    Grid[107][95] = "East Harondor"
    Grid[107][96] = "Near Harad"
    Grid[107][97] = "Near Harad"
    Grid[107][98] = "Near Harad"
    Grid[108][1] = "Mount Gundabad"
    Grid[108][8] = "Erebor"
    Grid[108][9] = "Erebor"
    Grid[108][10] = "Erebor"
    Grid[108][11] = "Erebor"
    Grid[108][12] = "Erebor"
    Grid[108][13] = "Erebor"
    Grid[108][14] = "Erebor"
    Grid[108][15] = "Erebor"
    Grid[108][16] = "Erebor"
    Grid[108][17] = "Withered Heath"
    Grid[108][18] = "Withered Heath"
    Grid[108][19] = "Dale"
    Grid[108][20] = "Dale"
    Grid[108][21] = "Dale"
    Grid[108][22] = "Dale"
    Grid[108][23] = "Dale"
    Grid[108][24] = "Dale"
    Grid[108][25] = "Dale"
    Grid[108][26] = "Northern Rhovanion"
    Grid[108][27] = "Northern Rhovanion"
    Grid[108][28] = "Northern Rhovanion"
    Grid[108][29] = "Northern Rhovanion"
    Grid[108][30] = "Northern Rhovanion"
    Grid[108][31] = "Northern Rhovanion"
    Grid[108][32] = "Northern Rhovanion"
    Grid[108][33] = "Northern Rhovanion"
    Grid[108][34] = "Southern Rhovanion"
    Grid[108][35] = "Southern Rhovanion"
    Grid[108][36] = "Southern Rhovanion"
    Grid[108][37] = "Southern Rhovanion"
    Grid[108][38] = "Southern Rhovanion"
    Grid[108][39] = "Southern Rhovanion"
    Grid[108][40] = "Southern Rhovanion"
    Grid[108][41] = "Southern Rhovanion"
    Grid[108][42] = "Southern Rhovanion"
    Grid[108][43] = "Eastern Brown Lands"
    Grid[108][44] = "Eastern Brown Lands"
    Grid[108][45] = "Eastern Brown Lands"
    Grid[108][46] = "Eastern Brown Lands"
    Grid[108][47] = "Eastern Brown Lands"
    Grid[108][48] = "Eastern Brown Lands"
    Grid[108][49] = "Eastern Brown Lands"
    Grid[108][50] = "Eastern Emyn Muil"
    Grid[108][51] = "Eastern Emyn Muil"
    Grid[108][52] = "Eastern Emyn Muil"
    Grid[108][53] = "Eastern Emyn Muil"
    Grid[108][54] = "Eastern Emyn Muil"
    Grid[108][55] = "Eastern Emyn Muil"
    Grid[108][56] = "North Ithilien"
    Grid[108][57] = "North Ithilien"
    Grid[108][58] = "North Ithilien"
    Grid[108][59] = "North Ithilien"
    Grid[108][60] = "North Ithilien"
    Grid[108][61] = "North Ithilien"
    Grid[108][62] = "North Ithilien"
    Grid[108][63] = "North Ithilien"
    Grid[108][64] = "North Ithilien"
    Grid[108][65] = "North Ithilien"
    Grid[108][66] = "North Ithilien"
    Grid[108][67] = "North Ithilien"
    Grid[108][68] = "North Ithilien"
    Grid[108][69] = "North Ithilien"
    Grid[108][70] = "North Ithilien"
    Grid[108][71] = "North Ithilien"
    Grid[108][72] = "North Ithilien"
    Grid[108][73] = "South Ithilien"
    Grid[108][74] = "South Ithilien"
    Grid[108][75] = "South Ithilien"
    Grid[108][76] = "South Ithilien"
    Grid[108][77] = "South Ithilien"
    Grid[108][78] = "South Ithilien"
    Grid[108][79] = "South Ithilien"
    Grid[108][80] = "South Ithilien"
    Grid[108][81] = "South Ithilien"
    Grid[108][82] = "South Ithilien"
    Grid[108][83] = "South Ithilien"
    Grid[108][84] = "South Ithilien"
    Grid[108][85] = "South Ithilien"
    Grid[108][86] = "South Ithilien"
    Grid[108][87] = "East Harondor"
    Grid[108][88] = "East Harondor"
    Grid[108][89] = "East Harondor"
    Grid[108][90] = "East Harondor"
    Grid[108][91] = "East Harondor"
    Grid[108][92] = "East Harondor"
    Grid[108][93] = "East Harondor"
    Grid[108][94] = "East Harondor"
    Grid[108][95] = "Near Harad"
    Grid[108][96] = "Near Harad"
    Grid[108][97] = "Near Harad"
    Grid[108][98] = "Near Harad"
    Grid[109][1] = "Mount Gundabad"
    Grid[109][8] = "Erebor"
    Grid[109][9] = "Erebor"
    Grid[109][10] = "Erebor"
    Grid[109][11] = "Erebor"
    Grid[109][12] = "Erebor"
    Grid[109][13] = "Erebor"
    Grid[109][14] = "Erebor"
    Grid[109][15] = "Erebor"
    Grid[109][16] = "Erebor"
    Grid[109][17] = "Erebor"
    Grid[109][18] = "Dale"
    Grid[109][19] = "Dale"
    Grid[109][20] = "Dale"
    Grid[109][21] = "Dale"
    Grid[109][22] = "Dale"
    Grid[109][23] = "Dale"
    Grid[109][24] = "Dale"
    Grid[109][25] = "Dale"
    Grid[109][26] = "Northern Rhovanion"
    Grid[109][27] = "Northern Rhovanion"
    Grid[109][28] = "Northern Rhovanion"
    Grid[109][29] = "Northern Rhovanion"
    Grid[109][30] = "Northern Rhovanion"
    Grid[109][31] = "Northern Rhovanion"
    Grid[109][32] = "Northern Rhovanion"
    Grid[109][33] = "Northern Rhovanion"
    Grid[109][34] = "Northern Rhovanion"
    Grid[109][35] = "Southern Rhovanion"
    Grid[109][36] = "Southern Rhovanion"
    Grid[109][37] = "Southern Rhovanion"
    Grid[109][38] = "Southern Rhovanion"
    Grid[109][39] = "Southern Rhovanion"
    Grid[109][40] = "Southern Rhovanion"
    Grid[109][41] = "Southern Rhovanion"
    Grid[109][42] = "Southern Rhovanion"
    Grid[109][43] = "Noman-Lands"
    Grid[109][44] = "Eastern Brown Lands"
    Grid[109][45] = "Eastern Brown Lands"
    Grid[109][46] = "Eastern Brown Lands"
    Grid[109][47] = "Eastern Brown Lands"
    Grid[109][48] = "Eastern Brown Lands"
    Grid[109][49] = "Eastern Brown Lands"
    Grid[109][50] = "Eastern Emyn Muil"
    Grid[109][51] = "Eastern Emyn Muil"
    Grid[109][52] = "Eastern Emyn Muil"
    Grid[109][53] = "Eastern Emyn Muil"
    Grid[109][54] = "Eastern Emyn Muil"
    Grid[109][55] = "Eastern Emyn Muil"
    Grid[109][56] = "North Ithilien"
    Grid[109][57] = "North Ithilien"
    Grid[109][58] = "North Ithilien"
    Grid[109][59] = "North Ithilien"
    Grid[109][60] = "North Ithilien"
    Grid[109][61] = "North Ithilien"
    Grid[109][62] = "North Ithilien"
    Grid[109][63] = "North Ithilien"
    Grid[109][64] = "North Ithilien"
    Grid[109][65] = "North Ithilien"
    Grid[109][66] = "North Ithilien"
    Grid[109][67] = "North Ithilien"
    Grid[109][68] = "North Ithilien"
    Grid[109][69] = "North Ithilien"
    Grid[109][70] = "North Ithilien"
    Grid[109][71] = "North Ithilien"
    Grid[109][72] = "North Ithilien"
    Grid[109][73] = "South Ithilien"
    Grid[109][74] = "South Ithilien"
    Grid[109][75] = "South Ithilien"
    Grid[109][76] = "South Ithilien"
    Grid[109][77] = "South Ithilien"
    Grid[109][78] = "South Ithilien"
    Grid[109][79] = "South Ithilien"
    Grid[109][80] = "South Ithilien"
    Grid[109][81] = "South Ithilien"
    Grid[109][82] = "South Ithilien"
    Grid[109][83] = "South Ithilien"
    Grid[109][84] = "South Ithilien"
    Grid[109][85] = "South Ithilien"
    Grid[109][86] = "South Ithilien"
    Grid[109][87] = "East Harondor"
    Grid[109][88] = "East Harondor"
    Grid[109][89] = "East Harondor"
    Grid[109][90] = "East Harondor"
    Grid[109][91] = "East Harondor"
    Grid[109][92] = "East Harondor"
    Grid[109][93] = "East Harondor"
    Grid[109][94] = "Near Harad"
    Grid[109][95] = "Near Harad"
    Grid[109][96] = "Near Harad"
    Grid[109][97] = "Near Harad"
    Grid[109][98] = "Near Harad"
    Grid[110][1] = "Mount Gundabad"
    Grid[110][8] = "Erebor"
    Grid[110][9] = "Erebor"
    Grid[110][10] = "Erebor"
    Grid[110][11] = "Erebor"
    Grid[110][12] = "Erebor"
    Grid[110][13] = "Erebor"
    Grid[110][14] = "Erebor"
    Grid[110][15] = "Erebor"
    Grid[110][16] = "Erebor"
    Grid[110][17] = "Erebor"
    Grid[110][18] = "Dale"
    Grid[110][19] = "Dale"
    Grid[110][20] = "Dale"
    Grid[110][21] = "Dale"
    Grid[110][22] = "Dale"
    Grid[110][23] = "Dale"
    Grid[110][24] = "Dale"
    Grid[110][25] = "Dale"
    Grid[110][26] = "Vale of the Carnen"
    Grid[110][27] = "Northern Rhovanion"
    Grid[110][28] = "Northern Rhovanion"
    Grid[110][29] = "Northern Rhovanion"
    Grid[110][30] = "Northern Rhovanion"
    Grid[110][31] = "Northern Rhovanion"
    Grid[110][32] = "Northern Rhovanion"
    Grid[110][33] = "Northern Rhovanion"
    Grid[110][34] = "Northern Rhovanion"
    Grid[110][35] = "Southern Rhovanion"
    Grid[110][36] = "Southern Rhovanion"
    Grid[110][37] = "Southern Rhovanion"
    Grid[110][38] = "Southern Rhovanion"
    Grid[110][39] = "Southern Rhovanion"
    Grid[110][40] = "Southern Rhovanion"
    Grid[110][41] = "Southern Rhovanion"
    Grid[110][42] = "Southern Rhovanion"
    Grid[110][43] = "Noman-Lands"
    Grid[110][44] = "Noman-Lands"
    Grid[110][45] = "Noman-Lands"
    Grid[110][46] = "Noman-Lands"
    Grid[110][47] = "Eastern Brown Lands"
    Grid[110][48] = "Eastern Brown Lands"
    Grid[110][49] = "Eastern Brown Lands"
    Grid[110][50] = "Eastern Emyn Muil"
    Grid[110][51] = "Eastern Emyn Muil"
    Grid[110][52] = "Eastern Emyn Muil"
    Grid[110][53] = "Eastern Emyn Muil"
    Grid[110][54] = "Eastern Emyn Muil"
    Grid[110][55] = "Eastern Emyn Muil"
    Grid[110][56] = "North Ithilien"
    Grid[110][57] = "North Ithilien"
    Grid[110][58] = "North Ithilien"
    Grid[110][59] = "North Ithilien"
    Grid[110][60] = "North Ithilien"
    Grid[110][61] = "North Ithilien"
    Grid[110][62] = "North Ithilien"
    Grid[110][63] = "North Ithilien"
    Grid[110][64] = "North Ithilien"
    Grid[110][65] = "North Ithilien"
    Grid[110][66] = "North Ithilien"
    Grid[110][67] = "North Ithilien"
    Grid[110][68] = "North Ithilien"
    Grid[110][69] = "North Ithilien"
    Grid[110][70] = "North Ithilien"
    Grid[110][71] = "North Ithilien"
    Grid[110][72] = "North Ithilien"
    Grid[110][73] = "South Ithilien"
    Grid[110][74] = "South Ithilien"
    Grid[110][75] = "South Ithilien"
    Grid[110][76] = "South Ithilien"
    Grid[110][77] = "South Ithilien"
    Grid[110][78] = "South Ithilien"
    Grid[110][79] = "South Ithilien"
    Grid[110][80] = "South Ithilien"
    Grid[110][81] = "South Ithilien"
    Grid[110][82] = "South Ithilien"
    Grid[110][83] = "South Ithilien"
    Grid[110][84] = "South Ithilien"
    Grid[110][85] = "South Ithilien"
    Grid[110][86] = "South Ithilien"
    Grid[110][87] = "South Ithilien"
    Grid[110][88] = "East Harondor"
    Grid[110][89] = "East Harondor"
    Grid[110][90] = "East Harondor"
    Grid[110][91] = "East Harondor"
    Grid[110][92] = "East Harondor"
    Grid[110][93] = "Near Harad"
    Grid[110][94] = "Near Harad"
    Grid[110][95] = "Near Harad"
    Grid[110][96] = "Near Harad"
    Grid[110][97] = "Near Harad"
    Grid[110][98] = "Near Harad"
    Grid[111][1] = "Mount Gundabad"
    Grid[111][8] = "Erebor"
    Grid[111][9] = "Erebor"
    Grid[111][10] = "Erebor"
    Grid[111][11] = "Erebor"
    Grid[111][12] = "Erebor"
    Grid[111][13] = "Erebor"
    Grid[111][14] = "Erebor"
    Grid[111][15] = "Erebor"
    Grid[111][16] = "Erebor"
    Grid[111][17] = "Erebor"
    Grid[111][18] = "Erebor"
    Grid[111][19] = "Dale"
    Grid[111][20] = "Dale"
    Grid[111][21] = "Dale"
    Grid[111][22] = "Dale"
    Grid[111][23] = "Dale"
    Grid[111][24] = "Dale"
    Grid[111][25] = "Vale of the Carnen"
    Grid[111][26] = "Vale of the Carnen"
    Grid[111][27] = "Northern Rhovanion"
    Grid[111][28] = "Northern Rhovanion"
    Grid[111][29] = "Northern Rhovanion"
    Grid[111][30] = "Northern Rhovanion"
    Grid[111][31] = "Northern Rhovanion"
    Grid[111][32] = "Northern Rhovanion"
    Grid[111][33] = "Northern Rhovanion"
    Grid[111][34] = "Southern Rhovanion"
    Grid[111][35] = "Southern Rhovanion"
    Grid[111][36] = "Southern Rhovanion"
    Grid[111][37] = "Southern Rhovanion"
    Grid[111][38] = "Southern Rhovanion"
    Grid[111][39] = "Southern Rhovanion"
    Grid[111][40] = "Southern Rhovanion"
    Grid[111][41] = "Southern Rhovanion"
    Grid[111][42] = "Southern Rhovanion"
    Grid[111][43] = "Noman-Lands"
    Grid[111][44] = "Noman-Lands"
    Grid[111][45] = "Noman-Lands"
    Grid[111][46] = "Noman-Lands"
    Grid[111][47] = "Noman-Lands"
    Grid[111][48] = "Noman-Lands"
    Grid[111][49] = "Noman-Lands"
    Grid[111][50] = "Noman-Lands"
    Grid[111][51] = "Eastern Emyn Muil"
    Grid[111][52] = "Eastern Emyn Muil"
    Grid[111][53] = "Eastern Emyn Muil"
    Grid[111][54] = "Eastern Emyn Muil"
    Grid[111][55] = "Dagorlad"
    Grid[111][56] = "Dagorlad"
    Grid[111][57] = "North Ithilien"
    Grid[111][58] = "North Ithilien"
    Grid[111][59] = "North Ithilien"
    Grid[111][60] = "North Ithilien"
    Grid[111][61] = "Morannon"
    Grid[111][62] = "Morannon"
    Grid[111][63] = "Morannon"
    Grid[111][64] = "Morannon"
    Grid[111][65] = "Morannon"
    Grid[111][66] = "Morannon"
    Grid[111][67] = "North Ithilien"
    Grid[111][68] = "North Ithilien"
    Grid[111][69] = "North Ithilien"
    Grid[111][70] = "North Ithilien"
    Grid[111][71] = "Minas Morgul"
    Grid[111][72] = "Minas Morgul"
    Grid[111][73] = "Minas Morgul"
    Grid[111][74] = "Minas Morgul"
    Grid[111][75] = "Minas Morgul"
    Grid[111][76] = "Minas Morgul"
    Grid[111][77] = "South Ithilien"
    Grid[111][78] = "South Ithilien"
    Grid[111][79] = "South Ithilien"
    Grid[111][80] = "South Ithilien"
    Grid[111][81] = "South Ithilien"
    Grid[111][82] = "South Ithilien"
    Grid[111][83] = "South Ithilien"
    Grid[111][84] = "South Ithilien"
    Grid[111][85] = "South Ithilien"
    Grid[111][86] = "South Ithilien"
    Grid[111][87] = "South Ithilien"
    Grid[111][88] = "East Harondor"
    Grid[111][89] = "East Harondor"
    Grid[111][90] = "Near Harad"
    Grid[111][91] = "Near Harad"
    Grid[111][92] = "Near Harad"
    Grid[111][93] = "Near Harad"
    Grid[111][94] = "Near Harad"
    Grid[111][95] = "Near Harad"
    Grid[111][96] = "Near Harad"
    Grid[111][97] = "Near Harad"
    Grid[111][98] = "Near Harad"
    Grid[112][1] = "Mount Gundabad"
    Grid[112][8] = "Erebor"
    Grid[112][9] = "Erebor"
    Grid[112][10] = "Erebor"
    Grid[112][11] = "Erebor"
    Grid[112][12] = "Erebor"
    Grid[112][13] = "Erebor"
    Grid[112][14] = "Iron Hills"
    Grid[112][15] = "Iron Hills"
    Grid[112][16] = "Iron Hills"
    Grid[112][17] = "Iron Hills"
    Grid[112][18] = "Iron Hills"
    Grid[112][19] = "Dale"
    Grid[112][20] = "Dale"
    Grid[112][21] = "Dale"
    Grid[112][22] = "Dale"
    Grid[112][23] = "Dale"
    Grid[112][24] = "Dale"
    Grid[112][25] = "Vale of the Carnen"
    Grid[112][26] = "Vale of the Carnen"
    Grid[112][27] = "Vale of the Carnen"
    Grid[112][28] = "Vale of the Celduin"
    Grid[112][29] = "Vale of the Celduin"
    Grid[112][30] = "Vale of the Celduin"
    Grid[112][31] = "Vale of the Celduin"
    Grid[112][32] = "Vale of the Celduin"
    Grid[112][33] = "Vale of the Celduin"
    Grid[112][34] = "Southern Rhovanion"
    Grid[112][35] = "Southern Rhovanion"
    Grid[112][36] = "Southern Rhovanion"
    Grid[112][37] = "Southern Rhovanion"
    Grid[112][38] = "Southern Rhovanion"
    Grid[112][39] = "Southern Rhovanion"
    Grid[112][40] = "Southern Rhovanion"
    Grid[112][41] = "Southern Rhovanion"
    Grid[112][42] = "Noman-Lands"
    Grid[112][43] = "Noman-Lands"
    Grid[112][44] = "Noman-Lands"
    Grid[112][45] = "Noman-Lands"
    Grid[112][46] = "Noman-Lands"
    Grid[112][47] = "Noman-Lands"
    Grid[112][48] = "Noman-Lands"
    Grid[112][49] = "Noman-Lands"
    Grid[112][50] = "Noman-Lands"
    Grid[112][51] = "Noman-Lands"
    Grid[112][52] = "Eastern Emyn Muil"
    Grid[112][53] = "Eastern Emyn Muil"
    Grid[112][54] = "Dagorlad"
    Grid[112][55] = "Dagorlad"
    Grid[112][56] = "Dagorlad"
    Grid[112][57] = "Dagorlad"
    Grid[112][58] = "Dagorlad"
    Grid[112][59] = "North Ithilien"
    Grid[112][60] = "Morannon"
    Grid[112][61] = "Morannon"
    Grid[112][62] = "Morannon"
    Grid[112][63] = "Morannon"
    Grid[112][64] = "Morannon"
    Grid[112][65] = "Morannon"
    Grid[112][66] = "Morannon"
    Grid[112][67] = "Morannon"
    Grid[112][68] = "North Ithilien"
    Grid[112][69] = "North Ithilien"
    Grid[112][70] = "Minas Morgul"
    Grid[112][71] = "Minas Morgul"
    Grid[112][72] = "Minas Morgul"
    Grid[112][73] = "Minas Morgul"
    Grid[112][74] = "Minas Morgul"
    Grid[112][75] = "Minas Morgul"
    Grid[112][76] = "Minas Morgul"
    Grid[112][77] = "Minas Morgul"
    Grid[112][78] = "Gorgoroth"
    Grid[112][79] = "Gorgoroth"
    Grid[112][80] = "South Ithilien"
    Grid[112][81] = "South Ithilien"
    Grid[112][82] = "South Ithilien"
    Grid[112][83] = "South Ithilien"
    Grid[112][84] = "Nurn"
    Grid[112][85] = "Nurn"
    Grid[112][86] = "Nurn"
    Grid[112][87] = "East Harondor"
    Grid[112][88] = "East Harondor"
    Grid[112][89] = "Near Harad"
    Grid[112][90] = "Near Harad"
    Grid[112][91] = "Near Harad"
    Grid[112][92] = "Near Harad"
    Grid[112][93] = "Near Harad"
    Grid[112][94] = "Near Harad"
    Grid[112][95] = "Near Harad"
    Grid[112][96] = "Near Harad"
    Grid[112][97] = "Near Harad"
    Grid[112][98] = "Near Harad"
    Grid[113][1] = "Iron Hills"
    Grid[113][8] = "Erebor"
    Grid[113][9] = "Erebor"
    Grid[113][10] = "Iron Hills"
    Grid[113][11] = "Iron Hills"
    Grid[113][12] = "Iron Hills"
    Grid[113][13] = "Iron Hills"
    Grid[113][14] = "Iron Hills"
    Grid[113][15] = "Iron Hills"
    Grid[113][16] = "Iron Hills"
    Grid[113][17] = "Iron Hills"
    Grid[113][18] = "Iron Hills"
    Grid[113][19] = "Dale"
    Grid[113][20] = "Dale"
    Grid[113][21] = "Dale"
    Grid[113][22] = "Dale"
    Grid[113][23] = "Dale"
    Grid[113][24] = "Vale of the Carnen"
    Grid[113][25] = "Vale of the Carnen"
    Grid[113][26] = "Vale of the Carnen"
    Grid[113][27] = "Vale of the Carnen"
    Grid[113][28] = "Vale of the Celduin"
    Grid[113][29] = "Vale of the Celduin"
    Grid[113][30] = "Vale of the Celduin"
    Grid[113][31] = "Vale of the Celduin"
    Grid[113][32] = "Vale of the Celduin"
    Grid[113][33] = "Vale of the Celduin"
    Grid[113][34] = "Southern Rhovanion"
    Grid[113][35] = "Southern Rhovanion"
    Grid[113][36] = "Southern Rhovanion"
    Grid[113][37] = "Southern Rhovanion"
    Grid[113][38] = "Southern Rhovanion"
    Grid[113][39] = "Southern Rhovanion"
    Grid[113][40] = "Southern Rhovanion"
    Grid[113][41] = "Southern Rhovanion"
    Grid[113][42] = "Noman-Lands"
    Grid[113][43] = "Noman-Lands"
    Grid[113][44] = "Noman-Lands"
    Grid[113][45] = "Noman-Lands"
    Grid[113][46] = "Noman-Lands"
    Grid[113][47] = "Noman-Lands"
    Grid[113][48] = "Noman-Lands"
    Grid[113][49] = "Noman-Lands"
    Grid[113][50] = "Noman-Lands"
    Grid[113][51] = "Noman-Lands"
    Grid[113][52] = "Noman-Lands"
    Grid[113][53] = "Noman-Lands"
    Grid[113][54] = "Dagorlad"
    Grid[113][55] = "Dagorlad"
    Grid[113][56] = "Dagorlad"
    Grid[113][57] = "Dagorlad"
    Grid[113][58] = "Dagorlad"
    Grid[113][59] = "Morannon"
    Grid[113][60] = "Morannon"
    Grid[113][61] = "Morannon"
    Grid[113][62] = "Morannon"
    Grid[113][63] = "Morannon"
    Grid[113][64] = "Morannon"
    Grid[113][65] = "Morannon"
    Grid[113][66] = "Morannon"
    Grid[113][67] = "Morannon"
    Grid[113][68] = "Morannon"
    Grid[113][69] = "Minas Morgul"
    Grid[113][70] = "Minas Morgul"
    Grid[113][71] = "Minas Morgul"
    Grid[113][72] = "Minas Morgul"
    Grid[113][73] = "Minas Morgul"
    Grid[113][74] = "Minas Morgul"
    Grid[113][75] = "Minas Morgul"
    Grid[113][76] = "Minas Morgul"
    Grid[113][77] = "Minas Morgul"
    Grid[113][78] = "Minas Morgul"
    Grid[113][79] = "Gorgoroth"
    Grid[113][80] = "Gorgoroth"
    Grid[113][81] = "Gorgoroth"
    Grid[113][82] = "Gorgoroth"
    Grid[113][83] = "Nurn"
    Grid[113][84] = "Nurn"
    Grid[113][85] = "Nurn"
    Grid[113][86] = "Nurn"
    Grid[113][87] = "East Harondor"
    Grid[113][88] = "East Harondor"
    Grid[113][89] = "Near Harad"
    Grid[113][90] = "Near Harad"
    Grid[113][91] = "Near Harad"
    Grid[113][92] = "Near Harad"
    Grid[113][93] = "Near Harad"
    Grid[113][94] = "Near Harad"
    Grid[113][95] = "Near Harad"
    Grid[113][96] = "Near Harad"
    Grid[113][97] = "Near Harad"
    Grid[113][98] = "Far Harad"
    Grid[114][1] = "Iron Hills"
    Grid[114][8] = "Iron Hills"
    Grid[114][9] = "Iron Hills"
    Grid[114][10] = "Iron Hills"
    Grid[114][11] = "Iron Hills"
    Grid[114][12] = "Iron Hills"
    Grid[114][13] = "Iron Hills"
    Grid[114][14] = "Iron Hills"
    Grid[114][15] = "Iron Hills"
    Grid[114][16] = "Iron Hills"
    Grid[114][17] = "Iron Hills"
    Grid[114][18] = "Iron Hills"
    Grid[114][19] = "Vale of the Carnen"
    Grid[114][20] = "Vale of the Carnen"
    Grid[114][21] = "Vale of the Carnen"
    Grid[114][22] = "Vale of the Carnen"
    Grid[114][23] = "Vale of the Carnen"
    Grid[114][24] = "Vale of the Carnen"
    Grid[114][25] = "Vale of the Carnen"
    Grid[114][26] = "Vale of the Carnen"
    Grid[114][27] = "Vale of the Carnen"
    Grid[114][28] = "Vale of the Celduin"
    Grid[114][29] = "Vale of the Celduin"
    Grid[114][30] = "Vale of the Celduin"
    Grid[114][31] = "Vale of the Celduin"
    Grid[114][32] = "Vale of the Celduin"
    Grid[114][33] = "Vale of the Celduin"
    Grid[114][34] = "Southern Rhovanion"
    Grid[114][35] = "Southern Rhovanion"
    Grid[114][36] = "Southern Rhovanion"
    Grid[114][37] = "Southern Rhovanion"
    Grid[114][38] = "Southern Rhovanion"
    Grid[114][39] = "Southern Rhovanion"
    Grid[114][40] = "Southern Rhovanion"
    Grid[114][41] = "Southern Rhovanion"
    Grid[114][42] = "Noman-Lands"
    Grid[114][43] = "Noman-Lands"
    Grid[114][44] = "Noman-Lands"
    Grid[114][45] = "Noman-Lands"
    Grid[114][46] = "Noman-Lands"
    Grid[114][47] = "Noman-Lands"
    Grid[114][48] = "Noman-Lands"
    Grid[114][49] = "Noman-Lands"
    Grid[114][50] = "Noman-Lands"
    Grid[114][51] = "Noman-Lands"
    Grid[114][52] = "Noman-Lands"
    Grid[114][53] = "Noman-Lands"
    Grid[114][54] = "Dagorlad"
    Grid[114][55] = "Dagorlad"
    Grid[114][56] = "Dagorlad"
    Grid[114][57] = "Dagorlad"
    Grid[114][58] = "Dagorlad"
    Grid[114][59] = "Dagorlad"
    Grid[114][60] = "Morannon"
    Grid[114][61] = "Morannon"
    Grid[114][62] = "Morannon"
    Grid[114][63] = "Morannon"
    Grid[114][64] = "Morannon"
    Grid[114][65] = "Morannon"
    Grid[114][66] = "Morannon"
    Grid[114][67] = "Morannon"
    Grid[114][68] = "Morannon"
    Grid[114][69] = "Morannon"
    Grid[114][70] = "Minas Morgul"
    Grid[114][71] = "Minas Morgul"
    Grid[114][72] = "Minas Morgul"
    Grid[114][73] = "Minas Morgul"
    Grid[114][74] = "Minas Morgul"
    Grid[114][75] = "Minas Morgul"
    Grid[114][76] = "Minas Morgul"
    Grid[114][77] = "Minas Morgul"
    Grid[114][78] = "Minas Morgul"
    Grid[114][79] = "Gorgoroth"
    Grid[114][80] = "Gorgoroth"
    Grid[114][81] = "Gorgoroth"
    Grid[114][82] = "Gorgoroth"
    Grid[114][83] = "Nurn"
    Grid[114][84] = "Nurn"
    Grid[114][85] = "Nurn"
    Grid[114][86] = "Nurn"
    Grid[114][87] = "Khand"
    Grid[114][88] = "Khand"
    Grid[114][89] = "Near Harad"
    Grid[114][90] = "Near Harad"
    Grid[114][91] = "Near Harad"
    Grid[114][92] = "Near Harad"
    Grid[114][93] = "Near Harad"
    Grid[114][94] = "Near Harad"
    Grid[114][95] = "Far Harad"
    Grid[114][96] = "Far Harad"
    Grid[114][97] = "Far Harad"
    Grid[114][98] = "Far Harad"
    Grid[115][1] = "Iron Hills"
    Grid[115][8] = "Iron Hills"
    Grid[115][9] = "Iron Hills"
    Grid[115][10] = "Iron Hills"
    Grid[115][11] = "Iron Hills"
    Grid[115][12] = "Iron Hills"
    Grid[115][13] = "Iron Hills"
    Grid[115][14] = "Iron Hills"
    Grid[115][15] = "Iron Hills"
    Grid[115][16] = "Iron Hills"
    Grid[115][17] = "Iron Hills"
    Grid[115][18] = "Iron Hills"
    Grid[115][19] = "Vale of the Carnen"
    Grid[115][20] = "Vale of the Carnen"
    Grid[115][21] = "Vale of the Carnen"
    Grid[115][22] = "Vale of the Carnen"
    Grid[115][23] = "Vale of the Carnen"
    Grid[115][24] = "Vale of the Carnen"
    Grid[115][25] = "Vale of the Carnen"
    Grid[115][26] = "Vale of the Carnen"
    Grid[115][27] = "Vale of the Carnen"
    Grid[115][28] = "Vale of the Celduin"
    Grid[115][29] = "Vale of the Celduin"
    Grid[115][30] = "Vale of the Celduin"
    Grid[115][31] = "Vale of the Celduin"
    Grid[115][32] = "Vale of the Celduin"
    Grid[115][33] = "Vale of the Celduin"
    Grid[115][34] = "Northern Dorwinion"
    Grid[115][35] = "Southern Rhovanion"
    Grid[115][36] = "Southern Rhovanion"
    Grid[115][37] = "Southern Rhovanion"
    Grid[115][38] = "Southern Rhovanion"
    Grid[115][39] = "Southern Rhovanion"
    Grid[115][40] = "Southern Rhovanion"
    Grid[115][41] = "Southern Rhovanion"
    Grid[115][42] = "Southern Dorwinion"
    Grid[115][43] = "Southern Dorwinion"
    Grid[115][44] = "Southern Dorwinion"
    Grid[115][45] = "Noman-Lands"
    Grid[115][46] = "Noman-Lands"
    Grid[115][47] = "Noman-Lands"
    Grid[115][48] = "Noman-Lands"
    Grid[115][49] = "Noman-Lands"
    Grid[115][50] = "Noman-Lands"
    Grid[115][51] = "Noman-Lands"
    Grid[115][52] = "Noman-Lands"
    Grid[115][53] = "Dagorlad"
    Grid[115][54] = "Dagorlad"
    Grid[115][55] = "Dagorlad"
    Grid[115][56] = "Dagorlad"
    Grid[115][57] = "Dagorlad"
    Grid[115][58] = "Dagorlad"
    Grid[115][59] = "Dagorlad"
    Grid[115][60] = "Dagorlad"
    Grid[115][61] = "Dagorlad"
    Grid[115][62] = "Morannon"
    Grid[115][63] = "Morannon"
    Grid[115][64] = "Morannon"
    Grid[115][65] = "Morannon"
    Grid[115][66] = "Morannon"
    Grid[115][67] = "Morannon"
    Grid[115][68] = "Morannon"
    Grid[115][69] = "Morannon"
    Grid[115][70] = "Minas Morgul"
    Grid[115][71] = "Minas Morgul"
    Grid[115][72] = "Minas Morgul"
    Grid[115][73] = "Minas Morgul"
    Grid[115][74] = "Minas Morgul"
    Grid[115][75] = "Minas Morgul"
    Grid[115][76] = "Minas Morgul"
    Grid[115][77] = "Minas Morgul"
    Grid[115][78] = "Gorgoroth"
    Grid[115][79] = "Gorgoroth"
    Grid[115][80] = "Gorgoroth"
    Grid[115][81] = "Gorgoroth"
    Grid[115][82] = "Gorgoroth"
    Grid[115][83] = "Gorgoroth"
    Grid[115][84] = "Nurn"
    Grid[115][85] = "Nurn"
    Grid[115][86] = "Nurn"
    Grid[115][87] = "Khand"
    Grid[115][88] = "Khand"
    Grid[115][89] = "Khand"
    Grid[115][90] = "Khand"
    Grid[115][91] = "Khand"
    Grid[115][92] = "Khand"
    Grid[115][93] = "Far Harad"
    Grid[115][94] = "Far Harad"
    Grid[115][95] = "Far Harad"
    Grid[115][96] = "Far Harad"
    Grid[115][97] = "Far Harad"
    Grid[115][98] = "Far Harad"
    Grid[116][1] = "Iron Hills"
    Grid[116][8] = "Iron Hills"
    Grid[116][9] = "Iron Hills"
    Grid[116][10] = "Iron Hills"
    Grid[116][11] = "Iron Hills"
    Grid[116][12] = "Iron Hills"
    Grid[116][13] = "Iron Hills"
    Grid[116][14] = "Iron Hills"
    Grid[116][15] = "Iron Hills"
    Grid[116][16] = "Iron Hills"
    Grid[116][17] = "Iron Hills"
    Grid[116][18] = "Vale of the Carnen"
    Grid[116][19] = "Vale of the Carnen"
    Grid[116][20] = "Vale of the Carnen"
    Grid[116][21] = "Vale of the Carnen"
    Grid[116][22] = "Vale of the Carnen"
    Grid[116][23] = "Vale of the Carnen"
    Grid[116][24] = "Vale of the Carnen"
    Grid[116][25] = "Vale of the Carnen"
    Grid[116][26] = "Vale of the Carnen"
    Grid[116][27] = "Vale of the Carnen"
    Grid[116][28] = "Vale of the Celduin"
    Grid[116][29] = "Vale of the Celduin"
    Grid[116][30] = "Vale of the Celduin"
    Grid[116][31] = "Vale of the Celduin"
    Grid[116][32] = "Vale of the Celduin"
    Grid[116][33] = "Vale of the Celduin"
    Grid[116][34] = "Northern Dorwinion"
    Grid[116][35] = "Northern Dorwinion"
    Grid[116][36] = "Northern Dorwinion"
    Grid[116][37] = "Northern Dorwinion"
    Grid[116][38] = "Northern Dorwinion"
    Grid[116][39] = "Northern Dorwinion"
    Grid[116][40] = "Southern Dorwinion"
    Grid[116][41] = "Southern Dorwinion"
    Grid[116][42] = "Southern Dorwinion"
    Grid[116][43] = "Southern Dorwinion"
    Grid[116][44] = "Southern Dorwinion"
    Grid[116][45] = "Southern Dorwinion"
    Grid[116][46] = "Southern Dorwinion"
    Grid[116][47] = "Southern Dorwinion"
    Grid[116][48] = "Noman-Lands"
    Grid[116][49] = "Noman-Lands"
    Grid[116][50] = "Noman-Lands"
    Grid[116][51] = "Noman-Lands"
    Grid[116][52] = "Noman-Lands"
    Grid[116][53] = "Dagorlad"
    Grid[116][54] = "Dagorlad"
    Grid[116][55] = "Dagorlad"
    Grid[116][56] = "Dagorlad"
    Grid[116][57] = "Dagorlad"
    Grid[116][58] = "Dagorlad"
    Grid[116][59] = "Dagorlad"
    Grid[116][60] = "Dagorlad"
    Grid[116][61] = "Dagorlad"
    Grid[116][62] = "Morannon"
    Grid[116][63] = "Morannon"
    Grid[116][64] = "Morannon"
    Grid[116][65] = "Morannon"
    Grid[116][66] = "Morannon"
    Grid[116][67] = "Morannon"
    Grid[116][68] = "Morannon"
    Grid[116][69] = "Morannon"
    Grid[116][70] = "Gorgoroth"
    Grid[116][71] = "Minas Morgul"
    Grid[116][72] = "Minas Morgul"
    Grid[116][73] = "Minas Morgul"
    Grid[116][74] = "Minas Morgul"
    Grid[116][75] = "Minas Morgul"
    Grid[116][76] = "Minas Morgul"
    Grid[116][77] = "Minas Morgul"
    Grid[116][78] = "Gorgoroth"
    Grid[116][79] = "Gorgoroth"
    Grid[116][80] = "Gorgoroth"
    Grid[116][81] = "Gorgoroth"
    Grid[116][82] = "Gorgoroth"
    Grid[116][83] = "Gorgoroth"
    Grid[116][84] = "Nurn"
    Grid[116][85] = "Nurn"
    Grid[116][86] = "Nurn"
    Grid[116][87] = "Khand"
    Grid[116][88] = "Khand"
    Grid[116][89] = "Khand"
    Grid[116][90] = "Khand"
    Grid[116][91] = "Khand"
    Grid[116][92] = "Khand"
    Grid[116][93] = "Far Harad"
    Grid[116][94] = "Far Harad"
    Grid[116][95] = "Far Harad"
    Grid[116][96] = "Far Harad"
    Grid[116][97] = "Far Harad"
    Grid[116][98] = "Far Harad"
    Grid[117][1] = "Iron Hills"
    Grid[117][8] = "Iron Hills"
    Grid[117][9] = "Iron Hills"
    Grid[117][10] = "Iron Hills"
    Grid[117][11] = "Iron Hills"
    Grid[117][12] = "Iron Hills"
    Grid[117][13] = "Iron Hills"
    Grid[117][14] = "Iron Hills"
    Grid[117][15] = "Iron Hills"
    Grid[117][16] = "Iron Hills"
    Grid[117][17] = "Iron Hills"
    Grid[117][18] = "East Rhun"
    Grid[117][19] = "Vale of the Carnen"
    Grid[117][20] = "Vale of the Carnen"
    Grid[117][21] = "Vale of the Carnen"
    Grid[117][22] = "Vale of the Carnen"
    Grid[117][23] = "Vale of the Carnen"
    Grid[117][24] = "Vale of the Carnen"
    Grid[117][25] = "Vale of the Carnen"
    Grid[117][26] = "Vale of the Carnen"
    Grid[117][27] = "Vale of the Carnen"
    Grid[117][28] = "Vale of the Celduin"
    Grid[117][29] = "Vale of the Celduin"
    Grid[117][30] = "Vale of the Celduin"
    Grid[117][31] = "Vale of the Celduin"
    Grid[117][32] = "Vale of the Celduin"
    Grid[117][33] = "Vale of the Celduin"
    Grid[117][34] = "Northern Dorwinion"
    Grid[117][35] = "Northern Dorwinion"
    Grid[117][36] = "Northern Dorwinion"
    Grid[117][37] = "Northern Dorwinion"
    Grid[117][38] = "Northern Dorwinion"
    Grid[117][39] = "Northern Dorwinion"
    Grid[117][40] = "Northern Dorwinion"
    Grid[117][41] = "Southern Dorwinion"
    Grid[117][42] = "Southern Dorwinion"
    Grid[117][43] = "Southern Dorwinion"
    Grid[117][44] = "Southern Dorwinion"
    Grid[117][45] = "Southern Dorwinion"
    Grid[117][46] = "Southern Dorwinion"
    Grid[117][47] = "Southern Dorwinion"
    Grid[117][48] = "Southern Dorwinion"
    Grid[117][49] = "Noman-Lands"
    Grid[117][50] = "Noman-Lands"
    Grid[117][51] = "Noman-Lands"
    Grid[117][52] = "Dagorlad"
    Grid[117][53] = "Dagorlad"
    Grid[117][54] = "Dagorlad"
    Grid[117][55] = "Dagorlad"
    Grid[117][56] = "Dagorlad"
    Grid[117][57] = "Dagorlad"
    Grid[117][58] = "Dagorlad"
    Grid[117][59] = "Dagorlad"
    Grid[117][60] = "Dagorlad"
    Grid[117][61] = "Dagorlad"
    Grid[117][62] = "Morannon"
    Grid[117][63] = "Morannon"
    Grid[117][64] = "Morannon"
    Grid[117][65] = "Morannon"
    Grid[117][66] = "Morannon"
    Grid[117][67] = "Morannon"
    Grid[117][68] = "Morannon"
    Grid[117][69] = "Gorgoroth"
    Grid[117][70] = "Gorgoroth"
    Grid[117][71] = "Gorgoroth"
    Grid[117][72] = "Minas Morgul"
    Grid[117][73] = "Minas Morgul"
    Grid[117][74] = "Minas Morgul"
    Grid[117][75] = "Minas Morgul"
    Grid[117][76] = "Gorgoroth"
    Grid[117][77] = "Gorgoroth"
    Grid[117][78] = "Gorgoroth"
    Grid[117][79] = "Gorgoroth"
    Grid[117][80] = "Gorgoroth"
    Grid[117][81] = "Gorgoroth"
    Grid[117][82] = "Gorgoroth"
    Grid[117][83] = "Nurn"
    Grid[117][84] = "Nurn"
    Grid[117][85] = "Nurn"
    Grid[117][86] = "Nurn"
    Grid[117][87] = "Khand"
    Grid[117][88] = "Khand"
    Grid[117][89] = "Khand"
    Grid[117][90] = "Khand"
    Grid[117][91] = "Khand"
    Grid[117][92] = "Khand"
    Grid[117][93] = "Far Harad"
    Grid[117][94] = "Far Harad"
    Grid[117][95] = "Far Harad"
    Grid[117][96] = "Far Harad"
    Grid[117][97] = "Far Harad"
    Grid[117][98] = "Far Harad"
    Grid[118][1] = "Iron Hills"
    Grid[118][8] = "Iron Hills"
    Grid[118][9] = "Iron Hills"
    Grid[118][10] = "Iron Hills"
    Grid[118][11] = "Iron Hills"
    Grid[118][12] = "Iron Hills"
    Grid[118][13] = "Iron Hills"
    Grid[118][14] = "Iron Hills"
    Grid[118][15] = "Iron Hills"
    Grid[118][16] = "Iron Hills"
    Grid[118][17] = "Iron Hills"
    Grid[118][18] = "East Rhun"
    Grid[118][19] = "East Rhun"
    Grid[118][20] = "Vale of the Carnen"
    Grid[118][21] = "Vale of the Carnen"
    Grid[118][22] = "Vale of the Carnen"
    Grid[118][23] = "Vale of the Carnen"
    Grid[118][24] = "Vale of the Carnen"
    Grid[118][25] = "Vale of the Carnen"
    Grid[118][26] = "Vale of the Carnen"
    Grid[118][27] = "Vale of the Carnen"
    Grid[118][28] = "Vale of the Carnen"
    Grid[118][29] = "Vale of the Celduin"
    Grid[118][30] = "Vale of the Celduin"
    Grid[118][31] = "Vale of the Celduin"
    Grid[118][32] = "Vale of the Celduin"
    Grid[118][33] = "Vale of the Celduin"
    Grid[118][34] = "Northern Dorwinion"
    Grid[118][35] = "Northern Dorwinion"
    Grid[118][36] = "Northern Dorwinion"
    Grid[118][37] = "Northern Dorwinion"
    Grid[118][38] = "Northern Dorwinion"
    Grid[118][39] = "Northern Dorwinion"
    Grid[118][40] = "Northern Dorwinion"
    Grid[118][41] = "Southern Dorwinion"
    Grid[118][42] = "Southern Dorwinion"
    Grid[118][43] = "Southern Dorwinion"
    Grid[118][44] = "Southern Dorwinion"
    Grid[118][45] = "Southern Dorwinion"
    Grid[118][46] = "Southern Dorwinion"
    Grid[118][47] = "Southern Dorwinion"
    Grid[118][48] = "Southern Dorwinion"
    Grid[118][49] = "Southern Dorwinion"
    Grid[118][50] = "Noman-Lands"
    Grid[118][51] = "Noman-Lands"
    Grid[118][52] = "Ash Mountains"
    Grid[118][53] = "Ash Mountains"
    Grid[118][54] = "Ash Mountains"
    Grid[118][55] = "Dagorlad"
    Grid[118][56] = "Dagorlad"
    Grid[118][57] = "Dagorlad"
    Grid[118][58] = "Dagorlad"
    Grid[118][59] = "Dagorlad"
    Grid[118][60] = "Dagorlad"
    Grid[118][61] = "Morannon"
    Grid[118][62] = "Morannon"
    Grid[118][63] = "Morannon"
    Grid[118][64] = "Morannon"
    Grid[118][65] = "Morannon"
    Grid[118][66] = "Morannon"
    Grid[118][67] = "Morannon"
    Grid[118][68] = "Morannon"
    Grid[118][69] = "Gorgoroth"
    Grid[118][70] = "Gorgoroth"
    Grid[118][71] = "Mount Doom 1"
    Grid[118][72] = "Mount Doom 1"
    Grid[118][73] = "Gorgoroth"
    Grid[118][74] = "Gorgoroth"
    Grid[118][75] = "Gorgoroth"
    Grid[118][76] = "Gorgoroth"
    Grid[118][77] = "Gorgoroth"
    Grid[118][78] = "Gorgoroth"
    Grid[118][79] = "Gorgoroth"
    Grid[118][80] = "Gorgoroth"
    Grid[118][81] = "Gorgoroth"
    Grid[118][82] = "Gorgoroth"
    Grid[118][83] = "Nurn"
    Grid[118][84] = "Nurn"
    Grid[118][85] = "Nurn"
    Grid[118][86] = "Nurn"
    Grid[118][87] = "Khand"
    Grid[118][88] = "Khand"
    Grid[118][89] = "Khand"
    Grid[118][90] = "Khand"
    Grid[118][91] = "Khand"
    Grid[118][92] = "Khand"
    Grid[118][93] = "Far Harad"
    Grid[118][94] = "Far Harad"
    Grid[118][95] = "Far Harad"
    Grid[118][96] = "Far Harad"
    Grid[118][97] = "Far Harad"
    Grid[118][98] = "Far Harad"
    Grid[119][1] = "Iron Hills"
    Grid[119][8] = "Iron Hills"
    Grid[119][9] = "Iron Hills"
    Grid[119][10] = "Iron Hills"
    Grid[119][11] = "Iron Hills"
    Grid[119][12] = "Iron Hills"
    Grid[119][13] = "Iron Hills"
    Grid[119][14] = "Iron Hills"
    Grid[119][15] = "Iron Hills"
    Grid[119][16] = "Iron Hills"
    Grid[119][17] = "Iron Hills"
    Grid[119][18] = "East Rhun"
    Grid[119][19] = "East Rhun"
    Grid[119][20] = "Vale of the Carnen"
    Grid[119][21] = "Vale of the Carnen"
    Grid[119][22] = "Vale of the Carnen"
    Grid[119][23] = "Vale of the Carnen"
    Grid[119][24] = "Vale of the Carnen"
    Grid[119][25] = "Vale of the Carnen"
    Grid[119][26] = "Vale of the Carnen"
    Grid[119][27] = "Vale of the Carnen"
    Grid[119][28] = "Vale of the Carnen"
    Grid[119][29] = "Vale of the Celduin"
    Grid[119][30] = "Vale of the Celduin"
    Grid[119][31] = "Vale of the Celduin"
    Grid[119][32] = "Vale of the Celduin"
    Grid[119][33] = "Northern Dorwinion"
    Grid[119][34] = "Northern Dorwinion"
    Grid[119][35] = "Northern Dorwinion"
    Grid[119][36] = "Northern Dorwinion"
    Grid[119][37] = "Northern Dorwinion"
    Grid[119][38] = "Northern Dorwinion"
    Grid[119][39] = "Northern Dorwinion"
    Grid[119][40] = "Northern Dorwinion"
    Grid[119][41] = "Southern Dorwinion"
    Grid[119][42] = "Southern Dorwinion"
    Grid[119][43] = "Southern Dorwinion"
    Grid[119][44] = "Southern Dorwinion"
    Grid[119][45] = "Southern Dorwinion"
    Grid[119][46] = "Southern Dorwinion"
    Grid[119][47] = "Southern Dorwinion"
    Grid[119][48] = "Southern Dorwinion"
    Grid[119][49] = "Southern Dorwinion"
    Grid[119][50] = "Southern Dorwinion"
    Grid[119][51] = "Ash Mountains"
    Grid[119][52] = "Ash Mountains"
    Grid[119][53] = "Ash Mountains"
    Grid[119][54] = "Ash Mountains"
    Grid[119][55] = "Dagorlad"
    Grid[119][56] = "Dagorlad"
    Grid[119][57] = "Dagorlad"
    Grid[119][58] = "Dagorlad"
    Grid[119][59] = "Dagorlad"
    Grid[119][60] = "Dagorlad"
    Grid[119][61] = "Morannon"
    Grid[119][62] = "Morannon"
    Grid[119][63] = "Morannon"
    Grid[119][64] = "Morannon"
    Grid[119][65] = "Morannon"
    Grid[119][66] = "Morannon"
    Grid[119][67] = "Gorgoroth"
    Grid[119][68] = "Gorgoroth"
    Grid[119][69] = "Gorgoroth"
    Grid[119][70] = "Mount Doom 1"
    Grid[119][71] = "Mount Doom 1"
    Grid[119][72] = "Mount Doom 1"
    Grid[119][73] = "Mount Doom 1"
    Grid[119][74] = "Gorgoroth"
    Grid[119][75] = "Gorgoroth"
    Grid[119][76] = "Gorgoroth"
    Grid[119][77] = "Gorgoroth"
    Grid[119][78] = "Gorgoroth"
    Grid[119][79] = "Gorgoroth"
    Grid[119][80] = "Gorgoroth"
    Grid[119][81] = "Gorgoroth"
    Grid[119][82] = "Gorgoroth"
    Grid[119][83] = "Nurn"
    Grid[119][84] = "Nurn"
    Grid[119][85] = "Nurn"
    Grid[119][86] = "Nurn"
    Grid[119][87] = "Khand"
    Grid[119][88] = "Khand"
    Grid[119][89] = "Khand"
    Grid[119][90] = "Khand"
    Grid[119][91] = "Khand"
    Grid[119][92] = "Khand"
    Grid[119][93] = "Far Harad"
    Grid[119][94] = "Far Harad"
    Grid[119][95] = "Far Harad"
    Grid[119][96] = "Far Harad"
    Grid[119][97] = "Far Harad"
    Grid[119][98] = "Far Harad"
    Grid[120][1] = "Iron Hills"
    Grid[120][8] = "Iron Hills"
    Grid[120][9] = "Iron Hills"
    Grid[120][10] = "Iron Hills"
    Grid[120][11] = "Iron Hills"
    Grid[120][12] = "Iron Hills"
    Grid[120][13] = "Iron Hills"
    Grid[120][14] = "Iron Hills"
    Grid[120][15] = "Iron Hills"
    Grid[120][16] = "Iron Hills"
    Grid[120][17] = "Iron Hills"
    Grid[120][18] = "Iron Hills"
    Grid[120][19] = "East Rhun"
    Grid[120][20] = "East Rhun"
    Grid[120][21] = "East Rhun"
    Grid[120][22] = "East Rhun"
    Grid[120][23] = "East Rhun"
    Grid[120][24] = "East Rhun"
    Grid[120][25] = "Vale of the Carnen"
    Grid[120][26] = "Vale of the Carnen"
    Grid[120][27] = "Vale of the Carnen"
    Grid[120][28] = "Vale of the Carnen"
    Grid[120][29] = "Vale of the Celduin"
    Grid[120][30] = "Vale of the Celduin"
    Grid[120][31] = "Vale of the Celduin"
    Grid[120][32] = "Vale of the Celduin"
    Grid[120][33] = "Northern Dorwinion"
    Grid[120][34] = "Northern Dorwinion"
    Grid[120][35] = "Northern Dorwinion"
    Grid[120][36] = "Northern Dorwinion"
    Grid[120][37] = "Northern Dorwinion"
    Grid[120][38] = "Northern Dorwinion"
    Grid[120][39] = "Northern Dorwinion"
    Grid[120][40] = "Northern Dorwinion"
    Grid[120][41] = "Southern Dorwinion"
    Grid[120][42] = "Southern Dorwinion"
    Grid[120][43] = "Southern Dorwinion"
    Grid[120][44] = "Southern Dorwinion"
    Grid[120][45] = "Southern Dorwinion"
    Grid[120][46] = "Southern Dorwinion"
    Grid[120][47] = "Southern Dorwinion"
    Grid[120][48] = "Southern Dorwinion"
    Grid[120][49] = "Southern Dorwinion"
    Grid[120][50] = "Southern Dorwinion"
    Grid[120][51] = "Southern Dorwinion"
    Grid[120][52] = "Ash Mountains"
    Grid[120][53] = "Ash Mountains"
    Grid[120][54] = "Ash Mountains"
    Grid[120][55] = "Ash Mountains"
    Grid[120][56] = "Ash Mountains"
    Grid[120][57] = "Ash Mountains"
    Grid[120][58] = "Dagorlad"
    Grid[120][59] = "Dagorlad"
    Grid[120][60] = "Dagorlad"
    Grid[120][61] = "Morannon"
    Grid[120][62] = "Morannon"
    Grid[120][63] = "Morannon"
    Grid[120][64] = "Morannon"
    Grid[120][65] = "Morannon"
    Grid[120][66] = "Gorgoroth"
    Grid[120][67] = "Gorgoroth"
    Grid[120][68] = "Gorgoroth"
    Grid[120][69] = "Gorgoroth"
    Grid[120][70] = "Gorgoroth"
    Grid[120][71] = "Mount Doom 1"
    Grid[120][72] = "Mount Doom 1"
    Grid[120][73] = "Mount Doom 2"
    Grid[120][74] = "Mount Doom 2"
    Grid[120][75] = "Mount Doom 2"
    Grid[120][76] = "Gorgoroth"
    Grid[120][77] = "Gorgoroth"
    Grid[120][78] = "Gorgoroth"
    Grid[120][79] = "Gorgoroth"
    Grid[120][80] = "Gorgoroth"
    Grid[120][81] = "Gorgoroth"
    Grid[120][82] = "Gorgoroth"
    Grid[120][83] = "Nurn"
    Grid[120][84] = "Nurn"
    Grid[120][85] = "Nurn"
    Grid[120][86] = "Nurn"
    Grid[120][87] = "Khand"
    Grid[120][88] = "Khand"
    Grid[120][89] = "Khand"
    Grid[120][90] = "Khand"
    Grid[120][91] = "Khand"
    Grid[120][92] = "Khand"
    Grid[120][93] = "Far Harad"
    Grid[120][94] = "Far Harad"
    Grid[120][95] = "Far Harad"
    Grid[120][96] = "Far Harad"
    Grid[120][97] = "Far Harad"
    Grid[120][98] = "Far Harad"
    Grid[121][1] = "Iron Hills"
    Grid[121][8] = "Iron Hills"
    Grid[121][9] = "Iron Hills"
    Grid[121][10] = "Iron Hills"
    Grid[121][11] = "Iron Hills"
    Grid[121][12] = "Iron Hills"
    Grid[121][13] = "Iron Hills"
    Grid[121][14] = "Iron Hills"
    Grid[121][15] = "Iron Hills"
    Grid[121][16] = "Iron Hills"
    Grid[121][17] = "Iron Hills"
    Grid[121][18] = "Iron Hills"
    Grid[121][19] = "East Rhun"
    Grid[121][20] = "East Rhun"
    Grid[121][21] = "East Rhun"
    Grid[121][22] = "East Rhun"
    Grid[121][23] = "East Rhun"
    Grid[121][24] = "East Rhun"
    Grid[121][25] = "East Rhun"
    Grid[121][26] = "North Rhun"
    Grid[121][27] = "North Rhun"
    Grid[121][28] = "North Rhun"
    Grid[121][29] = "North Rhun"
    Grid[121][30] = "North Rhun"
    Grid[121][31] = "Vale of the Celduin"
    Grid[121][32] = "Vale of the Celduin"
    Grid[121][33] = "Northern Dorwinion"
    Grid[121][34] = "Northern Dorwinion"
    Grid[121][35] = "Northern Dorwinion"
    Grid[121][36] = "Northern Dorwinion"
    Grid[121][37] = "Northern Dorwinion"
    Grid[121][38] = "Northern Dorwinion"
    Grid[121][39] = "Northern Dorwinion"
    Grid[121][40] = "Northern Dorwinion"
    Grid[121][43] = "Southern Dorwinion"
    Grid[121][44] = "Southern Dorwinion"
    Grid[121][45] = "Southern Dorwinion"
    Grid[121][46] = "Southern Dorwinion"
    Grid[121][47] = "Southern Dorwinion"
    Grid[121][48] = "Southern Dorwinion"
    Grid[121][49] = "Southern Dorwinion"
    Grid[121][50] = "Southern Dorwinion"
    Grid[121][51] = "Southern Dorwinion"
    Grid[121][52] = "Ash Mountains"
    Grid[121][53] = "Ash Mountains"
    Grid[121][54] = "Ash Mountains"
    Grid[121][55] = "Ash Mountains"
    Grid[121][56] = "Ash Mountains"
    Grid[121][57] = "Ash Mountains"
    Grid[121][58] = "Ash Mountains"
    Grid[121][59] = "Ash Mountains"
    Grid[121][60] = "Dagorlad"
    Grid[121][61] = "Morannon"
    Grid[121][62] = "Morannon"
    Grid[121][63] = "Morannon"
    Grid[121][64] = "Barad~Dur"
    Grid[121][65] = "Barad~Dur"
    Grid[121][66] = "Gorgoroth"
    Grid[121][67] = "Gorgoroth"
    Grid[121][68] = "Gorgoroth"
    Grid[121][69] = "Gorgoroth"
    Grid[121][70] = "Gorgoroth"
    Grid[121][71] = "Gorgoroth"
    Grid[121][72] = "Gorgoroth"
    Grid[121][73] = "Mount Doom 2"
    Grid[121][74] = "Mount Doom 2"
    Grid[121][75] = "Mount Doom 2"
    Grid[121][76] = "Gorgoroth"
    Grid[121][77] = "Gorgoroth"
    Grid[121][78] = "Gorgoroth"
    Grid[121][79] = "Gorgoroth"
    Grid[121][80] = "Gorgoroth"
    Grid[121][81] = "Gorgoroth"
    Grid[121][82] = "Gorgoroth"
    Grid[121][83] = "Nurn"
    Grid[121][84] = "Nurn"
    Grid[121][85] = "Nurn"
    Grid[121][86] = "Nurn"
    Grid[121][87] = "Khand"
    Grid[121][88] = "Khand"
    Grid[121][89] = "Khand"
    Grid[121][90] = "Khand"
    Grid[121][91] = "Khand"
    Grid[121][92] = "Khand"
    Grid[121][93] = "Far Harad"
    Grid[121][94] = "Far Harad"
    Grid[121][95] = "Far Harad"
    Grid[121][96] = "Far Harad"
    Grid[121][97] = "Far Harad"
    Grid[121][98] = "Far Harad"
    Grid[122][1] = "Iron Hills"
    Grid[122][8] = "Iron Hills"
    Grid[122][9] = "Iron Hills"
    Grid[122][10] = "Iron Hills"
    Grid[122][11] = "Iron Hills"
    Grid[122][12] = "Iron Hills"
    Grid[122][13] = "Iron Hills"
    Grid[122][14] = "Iron Hills"
    Grid[122][15] = "Iron Hills"
    Grid[122][16] = "Iron Hills"
    Grid[122][17] = "Iron Hills"
    Grid[122][18] = "Iron Hills"
    Grid[122][19] = "East Rhun"
    Grid[122][20] = "East Rhun"
    Grid[122][21] = "East Rhun"
    Grid[122][22] = "East Rhun"
    Grid[122][23] = "East Rhun"
    Grid[122][24] = "East Rhun"
    Grid[122][25] = "East Rhun"
    Grid[122][26] = "North Rhun"
    Grid[122][27] = "North Rhun"
    Grid[122][28] = "North Rhun"
    Grid[122][29] = "North Rhun"
    Grid[122][30] = "North Rhun"
    Grid[122][31] = "North Rhun"
    Grid[122][32] = "North Rhun"
    Grid[122][33] = "North Rhun"
    Grid[122][34] = "North Rhun"
    Grid[122][35] = "Northern Dorwinion"
    Grid[122][36] = "Northern Dorwinion"
    Grid[122][37] = "Northern Dorwinion"
    Grid[122][38] = "Northern Dorwinion"
    Grid[122][39] = "Northern Dorwinion"
    Grid[122][44] = "Southern Dorwinion"
    Grid[122][45] = "Southern Dorwinion"
    Grid[122][46] = "Southern Dorwinion"
    Grid[122][47] = "Southern Dorwinion"
    Grid[122][48] = "Southern Dorwinion"
    Grid[122][49] = "Southern Dorwinion"
    Grid[122][50] = "Southern Dorwinion"
    Grid[122][51] = "Southern Dorwinion"
    Grid[122][52] = "Ash Mountains"
    Grid[122][53] = "Ash Mountains"
    Grid[122][54] = "Ash Mountains"
    Grid[122][55] = "Ash Mountains"
    Grid[122][56] = "Ash Mountains"
    Grid[122][57] = "Ash Mountains"
    Grid[122][58] = "Ash Mountains"
    Grid[122][59] = "Ash Mountains"
    Grid[122][60] = "Ash Mountains"
    Grid[122][61] = "Morannon"
    Grid[122][62] = "Barad~Dur"
    Grid[122][63] = "Barad~Dur"
    Grid[122][64] = "Barad~Dur"
    Grid[122][65] = "Barad~Dur"
    Grid[122][66] = "Barad~Dur"
    Grid[122][67] = "Gorgoroth"
    Grid[122][68] = "Gorgoroth"
    Grid[122][69] = "Gorgoroth"
    Grid[122][70] = "Crack of Doom"
    Grid[122][71] = "Crack of Doom"
    Grid[122][72] = "Crack of Doom"
    Grid[122][73] = "Gorgoroth"
    Grid[122][74] = "Mount Doom 2"
    Grid[122][75] = "Gorgoroth"
    Grid[122][76] = "Gorgoroth"
    Grid[122][77] = "Gorgoroth"
    Grid[122][78] = "Gorgoroth"
    Grid[122][79] = "Gorgoroth"
    Grid[122][80] = "Gorgoroth"
    Grid[122][81] = "Gorgoroth"
    Grid[122][82] = "Gorgoroth"
    Grid[122][83] = "Nurn"
    Grid[122][84] = "Nurn"
    Grid[122][85] = "Nurn"
    Grid[122][86] = "Nurn"
    Grid[122][87] = "Khand"
    Grid[122][88] = "Khand"
    Grid[122][89] = "Khand"
    Grid[122][90] = "Khand"
    Grid[122][91] = "Khand"
    Grid[122][92] = "Khand"
    Grid[122][93] = "Far Harad"
    Grid[122][94] = "Far Harad"
    Grid[122][95] = "Far Harad"
    Grid[122][96] = "Far Harad"
    Grid[122][97] = "Far Harad"
    Grid[122][98] = "Far Harad"
    Grid[123][1] = "Iron Hills"
    Grid[123][8] = "Iron Hills"
    Grid[123][9] = "Iron Hills"
    Grid[123][10] = "Iron Hills"
    Grid[123][11] = "Iron Hills"
    Grid[123][12] = "Iron Hills"
    Grid[123][13] = "Iron Hills"
    Grid[123][14] = "Iron Hills"
    Grid[123][15] = "Iron Hills"
    Grid[123][16] = "Iron Hills"
    Grid[123][17] = "Iron Hills"
    Grid[123][18] = "Iron Hills"
    Grid[123][19] = "East Rhun"
    Grid[123][20] = "East Rhun"
    Grid[123][21] = "East Rhun"
    Grid[123][22] = "East Rhun"
    Grid[123][23] = "East Rhun"
    Grid[123][24] = "East Rhun"
    Grid[123][25] = "North Rhun"
    Grid[123][26] = "North Rhun"
    Grid[123][27] = "North Rhun"
    Grid[123][28] = "North Rhun"
    Grid[123][29] = "North Rhun"
    Grid[123][30] = "North Rhun"
    Grid[123][31] = "North Rhun"
    Grid[123][32] = "North Rhun"
    Grid[123][33] = "North Rhun"
    Grid[123][34] = "North Rhun"
    Grid[123][35] = "North Rhun"
    Grid[123][37] = "Northern Dorwinion"
    Grid[123][38] = "Northern Dorwinion"
    Grid[123][47] = "Southern Dorwinion"
    Grid[123][48] = "Southern Dorwinion"
    Grid[123][49] = "Southern Dorwinion"
    Grid[123][50] = "Southern Dorwinion"
    Grid[123][51] = "Southern Dorwinion"
    Grid[123][52] = "Ash Mountains"
    Grid[123][53] = "Ash Mountains"
    Grid[123][54] = "Ash Mountains"
    Grid[123][55] = "Ash Mountains"
    Grid[123][56] = "Ash Mountains"
    Grid[123][57] = "Ash Mountains"
    Grid[123][58] = "Ash Mountains"
    Grid[123][59] = "Ash Mountains"
    Grid[123][60] = "Ash Mountains"
    Grid[123][61] = "Barad~Dur"
    Grid[123][62] = "Barad~Dur"
    Grid[123][63] = "Barad~Dur"
    Grid[123][64] = "Barad~Dur"
    Grid[123][65] = "Barad~Dur"
    Grid[123][66] = "Barad~Dur"
    Grid[123][67] = "Barad~Dur"
    Grid[123][68] = "Gorgoroth"
    Grid[123][69] = "Gorgoroth"
    Grid[123][70] = "Crack of Doom"
    Grid[123][71] = "Crack of Doom"
    Grid[123][72] = "Crack of Doom"
    Grid[123][73] = "Gorgoroth"
    Grid[123][74] = "Mount Doom 3"
    Grid[123][75] = "Gorgoroth"
    Grid[123][76] = "Mount Doom 3"
    Grid[123][77] = "Gorgoroth"
    Grid[123][78] = "Gorgoroth"
    Grid[123][79] = "Gorgoroth"
    Grid[123][80] = "Gorgoroth"
    Grid[123][81] = "Gorgoroth"
    Grid[123][82] = "Gorgoroth"
    Grid[123][83] = "Nurn"
    Grid[123][84] = "Nurn"
    Grid[123][85] = "Nurn"
    Grid[123][86] = "Nurn"
    Grid[123][87] = "Khand"
    Grid[123][88] = "Khand"
    Grid[123][89] = "Khand"
    Grid[123][90] = "Khand"
    Grid[123][91] = "Khand"
    Grid[123][92] = "Khand"
    Grid[123][93] = "Far Harad"
    Grid[123][94] = "Far Harad"
    Grid[123][95] = "Far Harad"
    Grid[123][96] = "Far Harad"
    Grid[123][97] = "Far Harad"
    Grid[123][98] = "Far Harad"
    Grid[124][1] = "Iron Hills"
    Grid[124][8] = "Iron Hills"
    Grid[124][9] = "Iron Hills"
    Grid[124][10] = "Iron Hills"
    Grid[124][11] = "Iron Hills"
    Grid[124][12] = "Iron Hills"
    Grid[124][13] = "Iron Hills"
    Grid[124][14] = "Iron Hills"
    Grid[124][15] = "Iron Hills"
    Grid[124][16] = "Iron Hills"
    Grid[124][17] = "Iron Hills"
    Grid[124][18] = "Iron Hills"
    Grid[124][19] = "East Rhun"
    Grid[124][20] = "East Rhun"
    Grid[124][21] = "East Rhun"
    Grid[124][22] = "East Rhun"
    Grid[124][23] = "East Rhun"
    Grid[124][24] = "North Rhun"
    Grid[124][25] = "North Rhun"
    Grid[124][26] = "North Rhun"
    Grid[124][27] = "North Rhun"
    Grid[124][28] = "North Rhun"
    Grid[124][29] = "North Rhun"
    Grid[124][30] = "North Rhun"
    Grid[124][31] = "North Rhun"
    Grid[124][32] = "North Rhun"
    Grid[124][33] = "North Rhun"
    Grid[124][34] = "North Rhun"
    Grid[124][35] = "North Rhun"
    Grid[124][36] = "North Rhun"
    Grid[124][48] = "South Rhun"
    Grid[124][49] = "South Rhun"
    Grid[124][50] = "South Rhun"
    Grid[124][51] = "South Rhun"
    Grid[124][52] = "Ash Mountains"
    Grid[124][53] = "Ash Mountains"
    Grid[124][54] = "Ash Mountains"
    Grid[124][55] = "Ash Mountains"
    Grid[124][56] = "Ash Mountains"
    Grid[124][57] = "Ash Mountains"
    Grid[124][58] = "Ash Mountains"
    Grid[124][59] = "Ash Mountains"
    Grid[124][60] = "Ash Mountains"
    Grid[124][61] = "Barad~Dur"
    Grid[124][62] = "Barad~Dur"
    Grid[124][63] = "Barad~Dur"
    Grid[124][64] = "Barad~Dur"
    Grid[124][65] = "Barad~Dur"
    Grid[124][66] = "Barad~Dur"
    Grid[124][67] = "Barad~Dur"
    Grid[124][68] = "Barad~Dur"
    Grid[124][69] = "Gorgoroth"
    Grid[124][70] = "Crack of Doom"
    Grid[124][71] = "Crack of Doom"
    Grid[124][72] = "Crack of Doom"
    Grid[124][73] = "Gorgoroth"
    Grid[124][74] = "Mount Doom 3"
    Grid[124][75] = "Mount Doom 3"
    Grid[124][76] = "Mount Doom 3"
    Grid[124][77] = "Gorgoroth"
    Grid[124][78] = "Gorgoroth"
    Grid[124][79] = "Gorgoroth"
    Grid[124][80] = "Gorgoroth"
    Grid[124][81] = "Gorgoroth"
    Grid[124][83] = "Nurn"
    Grid[124][84] = "Nurn"
    Grid[124][85] = "Nurn"
    Grid[124][86] = "Nurn"
    Grid[124][87] = "Khand"
    Grid[124][88] = "Khand"
    Grid[124][89] = "Khand"
    Grid[124][90] = "Khand"
    Grid[124][91] = "Khand"
    Grid[124][92] = "Khand"
    Grid[124][93] = "Far Harad"
    Grid[124][94] = "Far Harad"
    Grid[124][95] = "Far Harad"
    Grid[124][96] = "Far Harad"
    Grid[124][97] = "Far Harad"
    Grid[124][98] = "Far Harad"
    Grid[124][99] = "Far Harad"
    Grid[124][100] = "Far Harad"
    Grid[124][101] = "Far Harad"
    Grid[124][102] = "Far Harad"
    Grid[124][103] = "Far Harad"
    Grid[124][104] = "Far Harad"
    Grid[125][1] = "Iron Hills"
    Grid[125][2] = "Fellowship Box"
    Grid[125][3] = "Fellowship Box"
    Grid[125][4] = "Fellowship Box"
    Grid[125][5] = "Fellowship Box"
    Grid[125][6] = "Fellowship Box"
    Grid[125][7] = "Fellowship Box"
    Grid[125][8] = "Fellowship Box"
    Grid[125][9] = "Fellowship Box"
    Grid[125][10] = "Fellowship Box"
    Grid[125][11] = "Fellowship Box"
    Grid[125][12] = "Fellowship Box"
    Grid[125][13] = "Fellowship Box"
    Grid[125][14] = "Fellowship Box"
    Grid[125][15] = "Fellowship Box"
    Grid[125][16] = "Fellowship Box"
    Grid[125][17] = "Fellowship Box"
    Grid[125][18] = "Fellowship Box"
    Grid[125][19] = "Fellowship Box"
    Grid[125][20] = "Fellowship Box"
    Grid[125][21] = "Fellowship Box"
    Grid[125][22] = "East Rhun"
    Grid[125][23] = "East Rhun"
    Grid[125][24] = "East Rhun"
    Grid[125][25] = "North Rhun"
    Grid[125][26] = "North Rhun"
    Grid[125][27] = "North Rhun"
    Grid[125][28] = "North Rhun"
    Grid[125][29] = "North Rhun"
    Grid[125][30] = "North Rhun"
    Grid[125][31] = "North Rhun"
    Grid[125][32] = "North Rhun"
    Grid[125][33] = "North Rhun"
    Grid[125][34] = "North Rhun"
    Grid[125][35] = "North Rhun"
    Grid[125][36] = "North Rhun"
    Grid[125][37] = "North Rhun"
    Grid[125][47] = "South Rhun"
    Grid[125][48] = "South Rhun"
    Grid[125][49] = "South Rhun"
    Grid[125][50] = "South Rhun"
    Grid[125][51] = "South Rhun"
    Grid[125][52] = "South Rhun"
    Grid[125][53] = "South Rhun"
    Grid[125][54] = "South Rhun"
    Grid[125][55] = "Ash Mountains"
    Grid[125][56] = "Ash Mountains"
    Grid[125][57] = "Ash Mountains"
    Grid[125][58] = "Ash Mountains"
    Grid[125][59] = "Ash Mountains"
    Grid[125][60] = "Ash Mountains"
    Grid[125][61] = "Barad~Dur"
    Grid[125][62] = "Barad~Dur"
    Grid[125][63] = "Barad~Dur"
    Grid[125][64] = "Barad~Dur"
    Grid[125][65] = "Barad~Dur"
    Grid[125][66] = "Barad~Dur"
    Grid[125][67] = "Barad~Dur"
    Grid[125][68] = "Barad~Dur"
    Grid[125][69] = "Gorgoroth"
    Grid[125][70] = "Mount Doom 5"
    Grid[125][71] = "Mount Doom 5"
    Grid[125][72] = "Mount Doom 5"
    Grid[125][73] = "Gorgoroth"
    Grid[125][74] = "Gorgoroth"
    Grid[125][75] = "Gorgoroth"
    Grid[125][76] = "Gorgoroth"
    Grid[125][77] = "Gorgoroth"
    Grid[125][78] = "Gorgoroth"
    Grid[125][79] = "Gorgoroth"
    Grid[125][80] = "Gorgoroth"
    Grid[125][83] = "Nurn"
    Grid[125][84] = "Nurn"
    Grid[125][85] = "Nurn"
    Grid[125][86] = "Nurn"
    Grid[126][1] = "Iron Hills"
    Grid[126][2] = "Fellowship Box"
    Grid[126][3] = "Fellowship Box"
    Grid[126][4] = "Fellowship Box"
    Grid[126][5] = "Fellowship Box"
    Grid[126][6] = "Fellowship Box"
    Grid[126][7] = "Fellowship Box"
    Grid[126][8] = "Fellowship Box"
    Grid[126][9] = "Fellowship Box"
    Grid[126][10] = "Fellowship Box"
    Grid[126][11] = "Fellowship Box"
    Grid[126][12] = "Fellowship Box"
    Grid[126][13] = "Fellowship Box"
    Grid[126][14] = "Fellowship Box"
    Grid[126][15] = "Fellowship Box"
    Grid[126][16] = "Fellowship Box"
    Grid[126][17] = "Fellowship Box"
    Grid[126][18] = "Fellowship Box"
    Grid[126][19] = "Fellowship Box"
    Grid[126][20] = "Fellowship Box"
    Grid[126][21] = "Fellowship Box"
    Grid[126][22] = "East Rhun"
    Grid[126][23] = "East Rhun"
    Grid[126][24] = "East Rhun"
    Grid[126][25] = "North Rhun"
    Grid[126][26] = "North Rhun"
    Grid[126][27] = "North Rhun"
    Grid[126][28] = "North Rhun"
    Grid[126][29] = "North Rhun"
    Grid[126][30] = "North Rhun"
    Grid[126][31] = "North Rhun"
    Grid[126][32] = "North Rhun"
    Grid[126][33] = "North Rhun"
    Grid[126][34] = "North Rhun"
    Grid[126][35] = "North Rhun"
    Grid[126][36] = "North Rhun"
    Grid[126][37] = "North Rhun"
    Grid[126][47] = "South Rhun"
    Grid[126][48] = "South Rhun"
    Grid[126][49] = "South Rhun"
    Grid[126][50] = "South Rhun"
    Grid[126][51] = "South Rhun"
    Grid[126][52] = "South Rhun"
    Grid[126][53] = "South Rhun"
    Grid[126][54] = "South Rhun"
    Grid[126][55] = "South Rhun"
    Grid[126][56] = "South Rhun"
    Grid[126][57] = "South Rhun"
    Grid[126][58] = "South Rhun"
    Grid[126][59] = "Ash Mountains"
    Grid[126][60] = "Ash Mountains"
    Grid[126][61] = "Barad~Dur"
    Grid[126][62] = "Barad~Dur"
    Grid[126][63] = "Barad~Dur"
    Grid[126][64] = "Barad~Dur"
    Grid[126][65] = "Barad~Dur"
    Grid[126][66] = "Barad~Dur"
    Grid[126][67] = "Barad~Dur"
    Grid[126][68] = "Barad~Dur"
    Grid[126][69] = "Gorgoroth"
    Grid[126][70] = "Mount Doom 5"
    Grid[126][71] = "Mount Doom 5"
    Grid[126][72] = "Mount Doom 5"
    Grid[126][73] = "Mount Doom 5"
    Grid[126][74] = "Mount Doom 4"
    Grid[126][75] = "Mount Doom 4"
    Grid[126][76] = "Mount Doom 4"
    Grid[126][77] = "Gorgoroth"
    Grid[126][78] = "Gorgoroth"
    Grid[126][79] = "Gorgoroth"
    Grid[126][83] = "Nurn"
    Grid[126][84] = "Nurn"
    Grid[126][85] = "Nurn"
    Grid[127][1] = "Iron Hills"
    Grid[127][2] = "Fellowship Box"
    Grid[127][3] = "Fellowship Box"
    Grid[127][4] = "Fellowship Box"
    Grid[127][5] = "Fellowship Box"
    Grid[127][6] = "Fellowship Box"
    Grid[127][7] = "Fellowship Box"
    Grid[127][8] = "Fellowship Box"
    Grid[127][9] = "Fellowship Box"
    Grid[127][10] = "Fellowship Box"
    Grid[127][11] = "Fellowship Box"
    Grid[127][12] = "Fellowship Box"
    Grid[127][13] = "Fellowship Box"
    Grid[127][14] = "Fellowship Box"
    Grid[127][15] = "Fellowship Box"
    Grid[127][16] = "Fellowship Box"
    Grid[127][17] = "Fellowship Box"
    Grid[127][18] = "Fellowship Box"
    Grid[127][19] = "Fellowship Box"
    Grid[127][20] = "Fellowship Box"
    Grid[127][21] = "Fellowship Box"
    Grid[127][22] = "East Rhun"
    Grid[127][23] = "East Rhun"
    Grid[127][24] = "East Rhun"
    Grid[127][25] = "North Rhun"
    Grid[127][26] = "North Rhun"
    Grid[127][27] = "North Rhun"
    Grid[127][28] = "North Rhun"
    Grid[127][29] = "North Rhun"
    Grid[127][30] = "North Rhun"
    Grid[127][31] = "North Rhun"
    Grid[127][32] = "North Rhun"
    Grid[127][33] = "East Rhun"
    Grid[127][34] = "East Rhun"
    Grid[127][35] = "East Rhun"
    Grid[127][36] = "East Rhun"
    Grid[127][37] = "East Rhun"
    Grid[127][46] = "South Rhun"
    Grid[127][47] = "South Rhun"
    Grid[127][48] = "South Rhun"
    Grid[127][49] = "South Rhun"
    Grid[127][50] = "South Rhun"
    Grid[127][51] = "South Rhun"
    Grid[127][52] = "South Rhun"
    Grid[127][53] = "South Rhun"
    Grid[127][54] = "South Rhun"
    Grid[127][55] = "South Rhun"
    Grid[127][56] = "South Rhun"
    Grid[127][57] = "South Rhun"
    Grid[127][58] = "South Rhun"
    Grid[127][59] = "South Rhun"
    Grid[127][60] = "South Rhun"
    Grid[127][61] = "Barad~Dur"
    Grid[127][62] = "Barad~Dur"
    Grid[127][63] = "Barad~Dur"
    Grid[127][64] = "Barad~Dur"
    Grid[127][65] = "Barad~Dur"
    Grid[127][66] = "Barad~Dur"
    Grid[127][67] = "Barad~Dur"
    Grid[127][68] = "Barad~Dur"
    Grid[127][69] = "Gorgoroth"
    Grid[127][70] = "Mount Doom 5"
    Grid[127][71] = "Mount Doom 5"
    Grid[127][72] = "Mount Doom 5"
    Grid[127][73] = "Gorgoroth"
    Grid[127][74] = "Mount Doom 4"
    Grid[127][75] = "Mount Doom 4"
    Grid[127][76] = "Mount Doom 4"
    Grid[127][77] = "Gorgoroth"
    Grid[127][78] = "Gorgoroth"
    Grid[127][79] = "Gorgoroth"
    Grid[127][83] = "Nurn"
    Grid[127][84] = "Nurn"
    Grid[127][85] = "Nurn"
    Grid[128][1] = "Iron Hills"
    Grid[128][2] = "Fellowship Box"
    Grid[128][3] = "Fellowship Box"
    Grid[128][4] = "Fellowship Box"
    Grid[128][5] = "Fellowship Box"
    Grid[128][6] = "Fellowship Box"
    Grid[128][7] = "Fellowship Box"
    Grid[128][8] = "Fellowship Box"
    Grid[128][9] = "Fellowship Box"
    Grid[128][10] = "Fellowship Box"
    Grid[128][11] = "Fellowship Box"
    Grid[128][12] = "Fellowship Box"
    Grid[128][13] = "Fellowship Box"
    Grid[128][14] = "Fellowship Box"
    Grid[128][15] = "Fellowship Box"
    Grid[128][16] = "Fellowship Box"
    Grid[128][17] = "Fellowship Box"
    Grid[128][18] = "Fellowship Box"
    Grid[128][19] = "Fellowship Box"
    Grid[128][20] = "Fellowship Box"
    Grid[128][21] = "Fellowship Box"
    Grid[128][22] = "East Rhun"
    Grid[128][23] = "East Rhun"
    Grid[128][24] = "East Rhun"
    Grid[128][25] = "East Rhun"
    Grid[128][26] = "East Rhun"
    Grid[128][27] = "East Rhun"
    Grid[128][28] = "North Rhun"
    Grid[128][29] = "North Rhun"
    Grid[128][30] = "North Rhun"
    Grid[128][31] = "East Rhun"
    Grid[128][32] = "East Rhun"
    Grid[128][33] = "East Rhun"
    Grid[128][34] = "East Rhun"
    Grid[128][35] = "East Rhun"
    Grid[128][36] = "East Rhun"
    Grid[128][37] = "East Rhun"
    Grid[128][47] = "South Rhun"
    Grid[128][48] = "South Rhun"
    Grid[128][49] = "South Rhun"
    Grid[128][50] = "South Rhun"
    Grid[128][51] = "South Rhun"
    Grid[128][52] = "South Rhun"
    Grid[128][53] = "South Rhun"
    Grid[128][54] = "South Rhun"
    Grid[128][55] = "South Rhun"
    Grid[128][56] = "South Rhun"
    Grid[128][57] = "South Rhun"
    Grid[128][58] = "South Rhun"
    Grid[128][59] = "South Rhun"
    Grid[128][60] = "South Rhun"
    Grid[128][61] = "Barad~Dur"
    Grid[128][62] = "Barad~Dur"
    Grid[128][63] = "Barad~Dur"
    Grid[128][64] = "Barad~Dur"
    Grid[128][65] = "Barad~Dur"
    Grid[128][66] = "Barad~Dur"
    Grid[128][67] = "Barad~Dur"
    Grid[128][68] = "Gorgoroth"
    Grid[128][69] = "Gorgoroth"
    Grid[128][70] = "Gorgoroth"
    Grid[128][71] = "Gorgoroth"
    Grid[128][72] = "Gorgoroth"
    Grid[128][73] = "Gorgoroth"
    Grid[128][74] = "Gorgoroth"
    Grid[128][75] = "Gorgoroth"
    Grid[128][76] = "Gorgoroth"
    Grid[128][77] = "Gorgoroth"
    Grid[128][78] = "Gorgoroth"
    Grid[128][83] = "Nurn"
    Grid[128][84] = "Nurn"
    Grid[128][85] = "Nurn"
    Grid[129][1] = "Iron Hills"
    Grid[129][2] = "Fellowship Box"
    Grid[129][3] = "Fellowship Box"
    Grid[129][4] = "Fellowship Box"
    Grid[129][5] = "Fellowship Box"
    Grid[129][6] = "Fellowship Box"
    Grid[129][7] = "Fellowship Box"
    Grid[129][8] = "Fellowship Box"
    Grid[129][9] = "Fellowship Box"
    Grid[129][10] = "Fellowship Box"
    Grid[129][11] = "Fellowship Box"
    Grid[129][12] = "Fellowship Box"
    Grid[129][13] = "Fellowship Box"
    Grid[129][14] = "Fellowship Box"
    Grid[129][15] = "Fellowship Box"
    Grid[129][16] = "Fellowship Box"
    Grid[129][17] = "Fellowship Box"
    Grid[129][18] = "Fellowship Box"
    Grid[129][19] = "Fellowship Box"
    Grid[129][20] = "Fellowship Box"
    Grid[129][21] = "Fellowship Box"
    Grid[129][22] = "East Rhun"
    Grid[129][23] = "East Rhun"
    Grid[129][24] = "East Rhun"
    Grid[129][25] = "East Rhun"
    Grid[129][26] = "East Rhun"
    Grid[129][27] = "East Rhun"
    Grid[129][28] = "East Rhun"
    Grid[129][29] = "East Rhun"
    Grid[129][30] = "East Rhun"
    Grid[129][31] = "East Rhun"
    Grid[129][32] = "East Rhun"
    Grid[129][33] = "East Rhun"
    Grid[129][34] = "East Rhun"
    Grid[129][35] = "East Rhun"
    Grid[129][36] = "East Rhun"
    Grid[129][37] = "East Rhun"
    Grid[129][38] = "East Rhun"
    Grid[129][39] = "East Rhun"
    Grid[129][40] = "South Rhun"
    Grid[129][41] = "South Rhun"
    Grid[129][43] = "South Rhun"
    Grid[129][44] = "South Rhun"
    Grid[129][45] = "South Rhun"
    Grid[129][46] = "South Rhun"
    Grid[129][47] = "South Rhun"
    Grid[129][48] = "South Rhun"
    Grid[129][49] = "South Rhun"
    Grid[129][50] = "South Rhun"
    Grid[129][51] = "South Rhun"
    Grid[129][52] = "South Rhun"
    Grid[129][53] = "South Rhun"
    Grid[129][54] = "South Rhun"
    Grid[129][55] = "South Rhun"
    Grid[129][56] = "South Rhun"
    Grid[129][57] = "South Rhun"
    Grid[129][58] = "South Rhun"
    Grid[129][59] = "South Rhun"
    Grid[129][60] = "South Rhun"
    Grid[129][61] = "Barad~Dur"
    Grid[129][62] = "Barad~Dur"
    Grid[129][63] = "Barad~Dur"
    Grid[129][64] = "Barad~Dur"
    Grid[129][65] = "Barad~Dur"
    Grid[129][66] = "Barad~Dur"
    Grid[129][67] = "Barad~Dur"
    Grid[129][68] = "Barad~Dur"
    Grid[129][69] = "Gorgoroth"
    Grid[129][70] = "Gorgoroth"
    Grid[129][71] = "Gorgoroth"
    Grid[129][72] = "Gorgoroth"
    Grid[129][73] = "Gorgoroth"
    Grid[129][74] = "Gorgoroth"
    Grid[129][75] = "Gorgoroth"
    Grid[129][76] = "Gorgoroth"
    Grid[129][77] = "Gorgoroth"
    Grid[129][78] = "Gorgoroth"
    Grid[129][83] = "Nurn"
    Grid[129][84] = "Nurn"
    Grid[129][85] = "Nurn"
    Grid[130][1] = "Iron Hills"
    Grid[130][2] = "Fellowship Box"
    Grid[130][3] = "Fellowship Box"
    Grid[130][4] = "Fellowship Box"
    Grid[130][5] = "Fellowship Box"
    Grid[130][6] = "Fellowship Box"
    Grid[130][7] = "Fellowship Box"
    Grid[130][8] = "Fellowship Box"
    Grid[130][9] = "Fellowship Box"
    Grid[130][10] = "Fellowship Box"
    Grid[130][11] = "Fellowship Box"
    Grid[130][12] = "Fellowship Box"
    Grid[130][13] = "Fellowship Box"
    Grid[130][14] = "Fellowship Box"
    Grid[130][15] = "Fellowship Box"
    Grid[130][16] = "Fellowship Box"
    Grid[130][17] = "Fellowship Box"
    Grid[130][18] = "Fellowship Box"
    Grid[130][19] = "Fellowship Box"
    Grid[130][20] = "Fellowship Box"
    Grid[130][21] = "Fellowship Box"
    Grid[130][22] = "East Rhun"
    Grid[130][23] = "East Rhun"
    Grid[130][24] = "East Rhun"
    Grid[130][25] = "East Rhun"
    Grid[130][26] = "East Rhun"
    Grid[130][27] = "East Rhun"
    Grid[130][28] = "East Rhun"
    Grid[130][29] = "East Rhun"
    Grid[130][30] = "East Rhun"
    Grid[130][31] = "East Rhun"
    Grid[130][32] = "East Rhun"
    Grid[130][33] = "East Rhun"
    Grid[130][34] = "East Rhun"
    Grid[130][35] = "East Rhun"
    Grid[130][36] = "East Rhun"
    Grid[130][37] = "East Rhun"
    Grid[130][38] = "East Rhun"
    Grid[130][39] = "East Rhun"
    Grid[130][40] = "South Rhun"
    Grid[130][41] = "South Rhun"
    Grid[130][42] = "South Rhun"
    Grid[130][43] = "South Rhun"
    Grid[130][44] = "South Rhun"
    Grid[130][45] = "South Rhun"
    Grid[130][46] = "South Rhun"
    Grid[130][47] = "South Rhun"
    Grid[130][48] = "South Rhun"
    Grid[130][49] = "South Rhun"
    Grid[130][50] = "South Rhun"
    Grid[130][51] = "South Rhun"
    Grid[130][52] = "South Rhun"
    Grid[130][53] = "South Rhun"
    Grid[130][54] = "South Rhun"
    Grid[130][55] = "South Rhun"
    Grid[130][56] = "South Rhun"
    Grid[130][57] = "South Rhun"
    Grid[130][58] = "South Rhun"
    Grid[130][59] = "South Rhun"
    Grid[130][60] = "South Rhun"
    Grid[130][61] = "Gorgoroth"
    Grid[130][62] = "Gorgoroth"
    Grid[130][63] = "Gorgoroth"
    Grid[130][64] = "Gorgoroth"
    Grid[130][65] = "Gorgoroth"
    Grid[130][66] = "Barad~Dur"
    Grid[130][67] = "Barad~Dur"
    Grid[130][68] = "Gorgoroth"
    Grid[130][69] = "Gorgoroth"
    Grid[130][70] = "Gorgoroth"
    Grid[130][71] = "Gorgoroth"
    Grid[130][72] = "Gorgoroth"
    Grid[130][73] = "Gorgoroth"
    Grid[130][74] = "Gorgoroth"
    Grid[130][75] = "Gorgoroth"
    Grid[130][76] = "Gorgoroth"
    Grid[130][77] = "Gorgoroth"
    Grid[130][83] = "Gorgoroth"
    Grid[130][84] = "Gorgoroth"
    Grid[130][85] = "Khand"
    Grid[131][1] = "Iron Hills"
    Grid[131][22] = "East Rhun"
    Grid[131][23] = "East Rhun"
    Grid[131][24] = "East Rhun"
    Grid[131][25] = "East Rhun"
    Grid[131][26] = "East Rhun"
    Grid[131][27] = "East Rhun"
    Grid[131][28] = "East Rhun"
    Grid[131][29] = "East Rhun"
    Grid[131][30] = "East Rhun"
    Grid[131][31] = "East Rhun"
    Grid[131][32] = "East Rhun"
    Grid[131][33] = "East Rhun"
    Grid[131][34] = "East Rhun"
    Grid[131][35] = "East Rhun"
    Grid[131][36] = "East Rhun"
    Grid[131][37] = "East Rhun"
    Grid[131][38] = "East Rhun"
    Grid[131][39] = "South Rhun"
    Grid[131][40] = "South Rhun"
    Grid[131][41] = "South Rhun"
    Grid[131][42] = "South Rhun"
    Grid[131][43] = "South Rhun"
    Grid[131][44] = "South Rhun"
    Grid[131][45] = "South Rhun"
    Grid[131][46] = "South Rhun"
    Grid[131][47] = "South Rhun"
    Grid[131][48] = "South Rhun"
    Grid[131][49] = "South Rhun"
    Grid[131][50] = "South Rhun"
    Grid[131][51] = "South Rhun"
    Grid[131][52] = "South Rhun"
    Grid[131][53] = "South Rhun"
    Grid[131][54] = "South Rhun"
    Grid[131][55] = "South Rhun"
    Grid[131][56] = "South Rhun"
    Grid[131][57] = "South Rhun"
    Grid[131][58] = "South Rhun"
    Grid[131][59] = "South Rhun"
    Grid[131][60] = "South Rhun"
    Grid[131][61] = "Gorgoroth"
    Grid[131][62] = "Gorgoroth"
    Grid[131][63] = "Gorgoroth"
    Grid[131][64] = "Gorgoroth"
    Grid[131][65] = "Gorgoroth"
    Grid[131][66] = "Gorgoroth"
    Grid[131][67] = "Gorgoroth"
    Grid[131][68] = "Gorgoroth"
    Grid[131][69] = "Gorgoroth"
    Grid[131][70] = "Gorgoroth"
    Grid[131][71] = "Gorgoroth"
    Grid[131][72] = "Gorgoroth"
    Grid[131][73] = "Gorgoroth"
    Grid[131][74] = "Gorgoroth"
    Grid[131][75] = "Gorgoroth"
    Grid[131][76] = "Gorgoroth"
    Grid[131][77] = "Gorgoroth"
    Grid[131][81] = "Gorgoroth"
    Grid[131][82] = "Gorgoroth"
    Grid[131][83] = "Gorgoroth"
    Grid[131][84] = "Khand"
    Grid[132][1] = "Iron Hills"
    Grid[132][2] = "Iron Hills"
    Grid[132][3] = "Iron Hills"
    Grid[132][4] = "Iron Hills"
    Grid[132][5] = "Iron Hills"
    Grid[132][6] = "Iron Hills"
    Grid[132][7] = "Iron Hills"
    Grid[132][8] = "Iron Hills"
    Grid[132][9] = "Iron Hills"
    Grid[132][10] = "Iron Hills"
    Grid[132][11] = "Iron Hills"
    Grid[132][12] = "Iron Hills"
    Grid[132][13] = "Iron Hills"
    Grid[132][14] = "Iron Hills"
    Grid[132][15] = "Iron Hills"
    Grid[132][16] = "Iron Hills"
    Grid[132][17] = "Iron Hills"
    Grid[132][18] = "Iron Hills"
    Grid[132][19] = "East Rhun"
    Grid[132][20] = "East Rhun"
    Grid[132][21] = "East Rhun"
    Grid[132][22] = "East Rhun"
    Grid[132][23] = "East Rhun"
    Grid[132][24] = "East Rhun"
    Grid[132][25] = "East Rhun"
    Grid[132][26] = "East Rhun"
    Grid[132][27] = "East Rhun"
    Grid[132][28] = "East Rhun"
    Grid[132][29] = "East Rhun"
    Grid[132][30] = "East Rhun"
    Grid[132][31] = "East Rhun"
    Grid[132][32] = "East Rhun"
    Grid[132][33] = "East Rhun"
    Grid[132][34] = "East Rhun"
    Grid[132][35] = "East Rhun"
    Grid[132][36] = "East Rhun"
    Grid[132][37] = "East Rhun"
    Grid[132][38] = "East Rhun"
    Grid[132][39] = "South Rhun"
    Grid[132][40] = "South Rhun"
    Grid[132][41] = "South Rhun"
    Grid[132][42] = "South Rhun"
    Grid[132][43] = "South Rhun"
    Grid[132][44] = "South Rhun"
    Grid[132][45] = "South Rhun"
    Grid[132][46] = "South Rhun"
    Grid[132][47] = "South Rhun"
    Grid[132][48] = "South Rhun"
    Grid[132][49] = "South Rhun"
    Grid[132][50] = "South Rhun"
    Grid[132][51] = "South Rhun"
    Grid[132][52] = "South Rhun"
    Grid[132][53] = "South Rhun"
    Grid[132][54] = "South Rhun"
    Grid[132][55] = "South Rhun"
    Grid[132][56] = "South Rhun"
    Grid[132][57] = "South Rhun"
    Grid[132][58] = "South Rhun"
    Grid[132][59] = "South Rhun"
    Grid[132][60] = "South Rhun"
    Grid[132][61] = "Gorgoroth"
    Grid[132][62] = "Gorgoroth"
    Grid[132][63] = "Gorgoroth"
    Grid[132][64] = "Gorgoroth"
    Grid[132][65] = "Gorgoroth"
    Grid[132][66] = "Gorgoroth"
    Grid[132][67] = "Gorgoroth"
    Grid[132][68] = "Gorgoroth"
    Grid[132][69] = "Gorgoroth"
    Grid[132][70] = "Gorgoroth"
    Grid[132][71] = "Gorgoroth"
    Grid[132][72] = "Gorgoroth"
    Grid[132][73] = "Gorgoroth"
    Grid[132][74] = "Gorgoroth"
    Grid[132][75] = "Gorgoroth"
    Grid[132][76] = "Gorgoroth"
    Grid[132][77] = "Gorgoroth"
    Grid[132][80] = "Gorgoroth"
    Grid[132][81] = "Gorgoroth"
    Grid[132][82] = "Gorgoroth"
    Grid[132][83] = "Gorgoroth"
    Grid[132][84] = "Khand"
    Grid[133][1] = "Iron Hills"
    Grid[133][22] = "East Rhun"
    Grid[133][23] = "East Rhun"
    Grid[133][24] = "East Rhun"
    Grid[133][25] = "East Rhun"
    Grid[133][26] = "East Rhun"
    Grid[133][27] = "East Rhun"
    Grid[133][28] = "East Rhun"
    Grid[133][29] = "East Rhun"
    Grid[133][30] = "East Rhun"
    Grid[133][31] = "East Rhun"
    Grid[133][32] = "East Rhun"
    Grid[133][33] = "East Rhun"
    Grid[133][34] = "East Rhun"
    Grid[133][35] = "East Rhun"
    Grid[133][36] = "East Rhun"
    Grid[133][37] = "East Rhun"
    Grid[133][38] = "East Rhun"
    Grid[133][39] = "South Rhun"
    Grid[133][40] = "South Rhun"
    Grid[133][41] = "South Rhun"
    Grid[133][42] = "South Rhun"
    Grid[133][43] = "South Rhun"
    Grid[133][44] = "South Rhun"
    Grid[133][45] = "South Rhun"
    Grid[133][46] = "South Rhun"
    Grid[133][47] = "South Rhun"
    Grid[133][48] = "South Rhun"
    Grid[133][49] = "South Rhun"
    Grid[133][50] = "South Rhun"
    Grid[133][51] = "South Rhun"
    Grid[133][52] = "South Rhun"
    Grid[133][53] = "South Rhun"
    Grid[133][54] = "South Rhun"
    Grid[133][55] = "South Rhun"
    Grid[133][56] = "South Rhun"
    Grid[133][57] = "South Rhun"
    Grid[133][58] = "South Rhun"
    Grid[133][59] = "South Rhun"
    Grid[133][60] = "South Rhun"
    Grid[133][61] = "Gorgoroth"
    Grid[133][62] = "Gorgoroth"
    Grid[133][63] = "Gorgoroth"
    Grid[133][64] = "Gorgoroth"
    Grid[133][65] = "Gorgoroth"
    Grid[133][66] = "Gorgoroth"
    Grid[133][67] = "Gorgoroth"
    Grid[133][68] = "Gorgoroth"
    Grid[133][69] = "Gorgoroth"
    Grid[133][70] = "Gorgoroth"
    Grid[133][71] = "Gorgoroth"
    Grid[133][72] = "Gorgoroth"
    Grid[133][73] = "Gorgoroth"
    Grid[133][74] = "Gorgoroth"
    Grid[133][75] = "Gorgoroth"
    Grid[133][76] = "Gorgoroth"
    Grid[133][77] = "Gorgoroth"
    Grid[133][78] = "Gorgoroth"
    Grid[133][79] = "Gorgoroth"
    Grid[133][80] = "Gorgoroth"
    Grid[133][81] = "Gorgoroth"
    Grid[133][82] = "Gorgoroth"
    Grid[133][83] = "Gorgoroth"
    Grid[133][84] = "Khand"
    Grid[134][1] = "Iron Hills"
    Grid[134][22] = "East Rhun"
    Grid[134][23] = "East Rhun"
    Grid[134][24] = "East Rhun"
    Grid[134][25] = "East Rhun"
    Grid[134][26] = "East Rhun"
    Grid[134][27] = "East Rhun"
    Grid[134][28] = "East Rhun"
    Grid[134][29] = "East Rhun"
    Grid[134][30] = "East Rhun"
    Grid[134][31] = "East Rhun"
    Grid[134][32] = "East Rhun"
    Grid[134][33] = "East Rhun"
    Grid[134][34] = "East Rhun"
    Grid[134][35] = "East Rhun"
    Grid[134][36] = "East Rhun"
    Grid[134][37] = "East Rhun"
    Grid[134][38] = "East Rhun"
    Grid[134][39] = "South Rhun"
    Grid[134][40] = "South Rhun"
    Grid[134][41] = "South Rhun"
    Grid[134][42] = "South Rhun"
    Grid[134][43] = "South Rhun"
    Grid[134][44] = "South Rhun"
    Grid[134][45] = "South Rhun"
    Grid[134][46] = "South Rhun"
    Grid[134][47] = "South Rhun"
    Grid[134][48] = "South Rhun"
    Grid[134][49] = "South Rhun"
    Grid[134][50] = "South Rhun"
    Grid[134][51] = "South Rhun"
    Grid[134][52] = "South Rhun"
    Grid[134][53] = "South Rhun"
    Grid[134][54] = "South Rhun"
    Grid[134][55] = "South Rhun"
    Grid[134][56] = "South Rhun"
    Grid[134][57] = "South Rhun"
    Grid[134][58] = "South Rhun"
    Grid[134][59] = "South Rhun"
    Grid[134][60] = "South Rhun"
    Grid[134][61] = "Gorgoroth"
    Grid[134][62] = "Gorgoroth"
    Grid[134][63] = "Gorgoroth"
    Grid[134][64] = "Gorgoroth"
    Grid[134][65] = "Gorgoroth"
    Grid[134][66] = "Gorgoroth"
    Grid[134][67] = "Gorgoroth"
    Grid[134][68] = "Gorgoroth"
    Grid[134][69] = "Gorgoroth"
    Grid[134][70] = "Gorgoroth"
    Grid[134][71] = "Gorgoroth"
    Grid[134][72] = "Gorgoroth"
    Grid[134][73] = "Gorgoroth"
    Grid[134][74] = "Gorgoroth"
    Grid[134][75] = "Gorgoroth"
    Grid[134][76] = "Gorgoroth"
    Grid[134][77] = "Gorgoroth"
    Grid[134][78] = "Gorgoroth"
    Grid[134][79] = "Gorgoroth"
    Grid[134][80] = "Gorgoroth"
    Grid[134][81] = "Gorgoroth"
    Grid[134][82] = "Gorgoroth"
    Grid[134][83] = "Gorgoroth"
    Grid[134][84] = "Khand"
    Grid[135][1] = "Iron Hills"
    Grid[135][22] = "East Rhun"
    Grid[135][23] = "East Rhun"
    Grid[135][24] = "East Rhun"
    Grid[135][25] = "East Rhun"
    Grid[135][26] = "East Rhun"
    Grid[135][27] = "East Rhun"
    Grid[135][28] = "East Rhun"
    Grid[135][29] = "East Rhun"
    Grid[135][30] = "East Rhun"
    Grid[135][31] = "East Rhun"
    Grid[135][32] = "East Rhun"
    Grid[135][33] = "East Rhun"
    Grid[135][34] = "East Rhun"
    Grid[135][35] = "East Rhun"
    Grid[135][36] = "East Rhun"
    Grid[135][37] = "East Rhun"
    Grid[135][38] = "East Rhun"
    Grid[135][39] = "South Rhun"
    Grid[135][40] = "South Rhun"
    Grid[135][41] = "South Rhun"
    Grid[135][42] = "South Rhun"
    Grid[135][43] = "South Rhun"
    Grid[135][44] = "South Rhun"
    Grid[135][45] = "South Rhun"
    Grid[135][46] = "South Rhun"
    Grid[135][47] = "South Rhun"
    Grid[135][48] = "South Rhun"
    Grid[135][49] = "South Rhun"
    Grid[135][50] = "South Rhun"
    Grid[135][51] = "South Rhun"
    Grid[135][52] = "South Rhun"
    Grid[135][53] = "South Rhun"
    Grid[135][54] = "South Rhun"
    Grid[135][55] = "South Rhun"
    Grid[135][56] = "South Rhun"
    Grid[135][57] = "South Rhun"
    Grid[135][58] = "South Rhun"
    Grid[135][59] = "South Rhun"
    Grid[135][60] = "South Rhun"
    Grid[135][61] = "Gorgoroth"
    Grid[135][62] = "Gorgoroth"
    Grid[135][63] = "Gorgoroth"
    Grid[135][64] = "Gorgoroth"
    Grid[135][65] = "Gorgoroth"
    Grid[135][66] = "Gorgoroth"
    Grid[135][67] = "Gorgoroth"
    Grid[135][68] = "Gorgoroth"
    Grid[135][69] = "Gorgoroth"
    Grid[135][70] = "Gorgoroth"
    Grid[135][71] = "Gorgoroth"
    Grid[135][72] = "Gorgoroth"
    Grid[135][73] = "Gorgoroth"
    Grid[135][74] = "Gorgoroth"
    Grid[135][75] = "Gorgoroth"
    Grid[135][76] = "Gorgoroth"
    Grid[135][77] = "Gorgoroth"
    Grid[135][78] = "Gorgoroth"
    Grid[135][79] = "Gorgoroth"
    Grid[135][80] = "Gorgoroth"
    Grid[135][81] = "Gorgoroth"
    Grid[135][82] = "Gorgoroth"
    Grid[135][83] = "Gorgoroth"
    Grid[135][84] = "Khand"
    Grid[136][1] = "Iron Hills"
    Grid[136][22] = "East Rhun"
    Grid[136][23] = "East Rhun"
    Grid[136][24] = "East Rhun"
    Grid[136][25] = "East Rhun"
    Grid[136][26] = "East Rhun"
    Grid[136][27] = "East Rhun"
    Grid[136][28] = "East Rhun"
    Grid[136][29] = "East Rhun"
    Grid[136][30] = "East Rhun"
    Grid[136][31] = "East Rhun"
    Grid[136][32] = "East Rhun"
    Grid[136][33] = "East Rhun"
    Grid[136][34] = "East Rhun"
    Grid[136][35] = "East Rhun"
    Grid[136][36] = "East Rhun"
    Grid[136][37] = "East Rhun"
    Grid[136][38] = "East Rhun"
    Grid[136][39] = "South Rhun"
    Grid[136][40] = "South Rhun"
    Grid[136][41] = "South Rhun"
    Grid[136][42] = "South Rhun"
    Grid[136][43] = "South Rhun"
    Grid[136][44] = "South Rhun"
    Grid[136][45] = "South Rhun"
    Grid[136][46] = "South Rhun"
    Grid[136][47] = "South Rhun"
    Grid[136][48] = "South Rhun"
    Grid[136][49] = "South Rhun"
    Grid[136][50] = "South Rhun"
    Grid[136][51] = "South Rhun"
    Grid[136][52] = "South Rhun"
    Grid[136][53] = "South Rhun"
    Grid[136][54] = "South Rhun"
    Grid[136][55] = "South Rhun"
    Grid[136][56] = "South Rhun"
    Grid[136][57] = "South Rhun"
    Grid[136][58] = "South Rhun"
    Grid[136][59] = "South Rhun"
    Grid[136][60] = "South Rhun"
    Grid[136][61] = "Gorgoroth"
    Grid[136][62] = "Gorgoroth"
    Grid[136][63] = "Gorgoroth"
    Grid[136][64] = "Gorgoroth"
    Grid[136][65] = "Gorgoroth"
    Grid[136][66] = "Gorgoroth"
    Grid[136][67] = "Gorgoroth"
    Grid[136][68] = "Gorgoroth"
    Grid[136][69] = "Gorgoroth"
    Grid[136][70] = "Gorgoroth"
    Grid[136][71] = "Gorgoroth"
    Grid[136][72] = "Gorgoroth"
    Grid[136][73] = "Gorgoroth"
    Grid[136][74] = "Gorgoroth"
    Grid[136][75] = "Gorgoroth"
    Grid[136][76] = "Gorgoroth"
    Grid[136][77] = "Gorgoroth"
    Grid[136][78] = "Gorgoroth"
    Grid[136][79] = "Gorgoroth"
    Grid[136][80] = "Gorgoroth"
    Grid[136][81] = "Gorgoroth"
    Grid[136][82] = "Gorgoroth"
    Grid[136][83] = "Gorgoroth"
    Grid[136][84] = "Khand"
    Grid[137][1] = "Iron Hills"
    Grid[137][22] = "East Rhun"
    Grid[137][23] = "East Rhun"
    Grid[137][24] = "East Rhun"
    Grid[137][25] = "East Rhun"
    Grid[137][26] = "East Rhun"
    Grid[137][27] = "East Rhun"
    Grid[137][28] = "East Rhun"
    Grid[137][29] = "East Rhun"
    Grid[137][30] = "East Rhun"
    Grid[137][31] = "East Rhun"
    Grid[137][32] = "East Rhun"
    Grid[137][33] = "East Rhun"
    Grid[137][34] = "East Rhun"
    Grid[137][35] = "East Rhun"
    Grid[137][36] = "East Rhun"
    Grid[137][37] = "East Rhun"
    Grid[137][38] = "East Rhun"
    Grid[137][39] = "South Rhun"
    Grid[137][40] = "South Rhun"
    Grid[137][41] = "South Rhun"
    Grid[137][42] = "South Rhun"
    Grid[137][43] = "South Rhun"
    Grid[137][44] = "South Rhun"
    Grid[137][45] = "South Rhun"
    Grid[137][46] = "South Rhun"
    Grid[137][47] = "South Rhun"
    Grid[137][48] = "South Rhun"
    Grid[137][49] = "South Rhun"
    Grid[137][50] = "South Rhun"
    Grid[137][51] = "South Rhun"
    Grid[137][52] = "South Rhun"
    Grid[137][53] = "South Rhun"
    Grid[137][54] = "South Rhun"
    Grid[137][55] = "South Rhun"
    Grid[137][56] = "South Rhun"
    Grid[137][57] = "South Rhun"
    Grid[137][58] = "South Rhun"
    Grid[137][59] = "South Rhun"
    Grid[137][60] = "South Rhun"
    Grid[137][61] = "Gorgoroth"
    Grid[137][62] = "Gorgoroth"
    Grid[137][63] = "Gorgoroth"
    Grid[137][64] = "Gorgoroth"
    Grid[137][65] = "Gorgoroth"
    Grid[137][66] = "Gorgoroth"
    Grid[137][67] = "Gorgoroth"
    Grid[137][68] = "Gorgoroth"
    Grid[137][69] = "Gorgoroth"
    Grid[137][70] = "Gorgoroth"
    Grid[137][71] = "Gorgoroth"
    Grid[137][72] = "Gorgoroth"
    Grid[137][73] = "Gorgoroth"
    Grid[137][74] = "Gorgoroth"
    Grid[137][75] = "Gorgoroth"
    Grid[137][76] = "Gorgoroth"
    Grid[137][77] = "Gorgoroth"
    Grid[137][78] = "Gorgoroth"
    Grid[137][79] = "Gorgoroth"
    Grid[137][80] = "Gorgoroth"
    Grid[137][81] = "Gorgoroth"
    Grid[137][82] = "Gorgoroth"
    Grid[137][83] = "Gorgoroth"
    Grid[137][84] = "Khand"
    Grid[138][1] = "Iron Hills"
    Grid[138][22] = "East Rhun"
    Grid[138][23] = "East Rhun"
    Grid[138][24] = "East Rhun"
    Grid[138][25] = "East Rhun"
    Grid[138][26] = "East Rhun"
    Grid[138][27] = "East Rhun"
    Grid[138][28] = "East Rhun"
    Grid[138][29] = "East Rhun"
    Grid[138][30] = "East Rhun"
    Grid[138][31] = "East Rhun"
    Grid[138][32] = "East Rhun"
    Grid[138][33] = "East Rhun"
    Grid[138][34] = "East Rhun"
    Grid[138][35] = "East Rhun"
    Grid[138][36] = "East Rhun"
    Grid[138][70] = "Gorgoroth"
    Grid[138][71] = "Gorgoroth"
    Grid[138][72] = "Gorgoroth"
    Grid[138][73] = "Gorgoroth"
    Grid[138][74] = "Gorgoroth"
    Grid[138][75] = "Gorgoroth"
    Grid[138][76] = "Gorgoroth"
    Grid[138][77] = "Gorgoroth"
    Grid[138][78] = "Gorgoroth"
    Grid[138][79] = "Gorgoroth"
    Grid[138][80] = "Gorgoroth"
    Grid[138][81] = "Gorgoroth"
    Grid[138][82] = "Gorgoroth"
    Grid[138][83] = "Gorgoroth"
    Grid[138][84] = "Khand"
    Grid[139][1] = "Iron Hills"
    Grid[139][22] = "East Rhun"
    Grid[139][23] = "East Rhun"
    Grid[139][24] = "East Rhun"
    Grid[139][25] = "East Rhun"
    Grid[139][26] = "East Rhun"
    Grid[139][27] = "East Rhun"
    Grid[139][28] = "East Rhun"
    Grid[139][29] = "East Rhun"
    Grid[139][30] = "East Rhun"
    Grid[139][31] = "East Rhun"
    Grid[139][32] = "East Rhun"
    Grid[139][33] = "East Rhun"
    Grid[139][34] = "East Rhun"
    Grid[139][35] = "East Rhun"
    Grid[139][36] = "East Rhun"
    Grid[139][70] = "Gorgoroth"
    Grid[139][71] = "Gorgoroth"
    Grid[139][72] = "Gorgoroth"
    Grid[139][73] = "Gorgoroth"
    Grid[139][74] = "Gorgoroth"
    Grid[139][75] = "Gorgoroth"
    Grid[139][76] = "Gorgoroth"
    Grid[139][77] = "Gorgoroth"
    Grid[139][78] = "Gorgoroth"
    Grid[139][79] = "Gorgoroth"
    Grid[139][80] = "Gorgoroth"
    Grid[139][81] = "Gorgoroth"
    Grid[139][82] = "Gorgoroth"
    Grid[139][83] = "Gorgoroth"
    Grid[139][84] = "Khand"
    Grid[140][1] = "Iron Hills"
    Grid[140][22] = "East Rhun"
    Grid[140][23] = "East Rhun"
    Grid[140][24] = "East Rhun"
    Grid[140][25] = "East Rhun"
    Grid[140][26] = "East Rhun"
    Grid[140][27] = "East Rhun"
    Grid[140][28] = "East Rhun"
    Grid[140][29] = "East Rhun"
    Grid[140][30] = "East Rhun"
    Grid[140][31] = "East Rhun"
    Grid[140][32] = "East Rhun"
    Grid[140][33] = "East Rhun"
    Grid[140][34] = "East Rhun"
    Grid[140][35] = "East Rhun"
    Grid[140][36] = "East Rhun"
    Grid[140][70] = "Gorgoroth"
    Grid[140][71] = "Gorgoroth"
    Grid[140][72] = "Gorgoroth"
    Grid[140][73] = "Gorgoroth"
    Grid[140][74] = "Gorgoroth"
    Grid[140][75] = "Gorgoroth"
    Grid[140][76] = "Gorgoroth"
    Grid[140][77] = "Gorgoroth"
    Grid[140][78] = "Gorgoroth"
    Grid[140][79] = "Gorgoroth"
    Grid[140][80] = "Gorgoroth"
    Grid[140][81] = "Gorgoroth"
    Grid[140][82] = "Gorgoroth"
    Grid[140][83] = "Gorgoroth"
    Grid[140][84] = "Khand"
    Grid[141][1] = "Iron Hills"
    Grid[141][22] = "East Rhun"
    Grid[141][23] = "East Rhun"
    Grid[141][24] = "East Rhun"
    Grid[141][25] = "East Rhun"
    Grid[141][26] = "East Rhun"
    Grid[141][27] = "East Rhun"
    Grid[141][28] = "East Rhun"
    Grid[141][29] = "East Rhun"
    Grid[141][30] = "East Rhun"
    Grid[141][31] = "East Rhun"
    Grid[141][32] = "East Rhun"
    Grid[141][33] = "East Rhun"
    Grid[141][34] = "East Rhun"
    Grid[141][35] = "East Rhun"
    Grid[141][36] = "East Rhun"
    Grid[141][70] = "Gorgoroth"
    Grid[141][71] = "Gorgoroth"
    Grid[141][72] = "Gorgoroth"
    Grid[141][73] = "Gorgoroth"
    Grid[141][74] = "Gorgoroth"
    Grid[141][75] = "Gorgoroth"
    Grid[141][76] = "Gorgoroth"
    Grid[141][77] = "Gorgoroth"
    Grid[141][78] = "Gorgoroth"
    Grid[141][79] = "Gorgoroth"
    Grid[141][80] = "Gorgoroth"
    Grid[141][81] = "Gorgoroth"
    Grid[141][82] = "Gorgoroth"
    Grid[141][83] = "Gorgoroth"
    Grid[141][84] = "Khand"
    Grid[142][1] = "Iron Hills"
    Grid[142][22] = "East Rhun"
    Grid[142][23] = "East Rhun"
    Grid[142][24] = "East Rhun"
    Grid[142][25] = "East Rhun"
    Grid[142][26] = "East Rhun"
    Grid[142][27] = "East Rhun"
    Grid[142][28] = "East Rhun"
    Grid[142][29] = "East Rhun"
    Grid[142][30] = "East Rhun"
    Grid[142][31] = "East Rhun"
    Grid[142][32] = "East Rhun"
    Grid[142][33] = "East Rhun"
    Grid[142][34] = "East Rhun"
    Grid[142][35] = "East Rhun"
    Grid[142][36] = "East Rhun"
    Grid[142][70] = "Gorgoroth"
    Grid[142][71] = "Gorgoroth"
    Grid[142][72] = "Gorgoroth"
    Grid[142][73] = "Gorgoroth"
    Grid[142][74] = "Gorgoroth"
    Grid[142][75] = "Gorgoroth"
    Grid[142][76] = "Gorgoroth"
    Grid[142][77] = "Gorgoroth"
    Grid[142][78] = "Gorgoroth"
    Grid[142][79] = "Gorgoroth"
    Grid[142][80] = "Gorgoroth"
    Grid[142][81] = "Gorgoroth"
    Grid[142][82] = "Gorgoroth"
    Grid[142][83] = "Gorgoroth"
    Grid[142][84] = "Khand"
    Grid[143][1] = "Iron Hills"
    Grid[143][22] = "East Rhun"
    Grid[143][23] = "East Rhun"
    Grid[143][24] = "East Rhun"
    Grid[143][25] = "East Rhun"
    Grid[143][26] = "East Rhun"
    Grid[143][27] = "East Rhun"
    Grid[143][28] = "East Rhun"
    Grid[143][29] = "East Rhun"
    Grid[143][30] = "East Rhun"
    Grid[143][31] = "East Rhun"
    Grid[143][32] = "East Rhun"
    Grid[143][33] = "East Rhun"
    Grid[143][34] = "East Rhun"
    Grid[143][35] = "East Rhun"
    Grid[143][36] = "East Rhun"
    Grid[143][70] = "Gorgoroth"
    Grid[143][71] = "Gorgoroth"
    Grid[143][72] = "Gorgoroth"
    Grid[143][73] = "Gorgoroth"
    Grid[143][74] = "Gorgoroth"
    Grid[143][75] = "Gorgoroth"
    Grid[143][76] = "Gorgoroth"
    Grid[143][77] = "Gorgoroth"
    Grid[143][78] = "Gorgoroth"
    Grid[143][79] = "Gorgoroth"
    Grid[143][80] = "Gorgoroth"
    Grid[143][81] = "Gorgoroth"
    Grid[143][82] = "Gorgoroth"
    Grid[143][83] = "Gorgoroth"
    Grid[143][84] = "Khand"
    Grid[144][1] = "Iron Hills"
    Grid[144][2] = "Iron Hills"
    Grid[144][3] = "Iron Hills"
    Grid[144][4] = "Iron Hills"
    Grid[144][5] = "Iron Hills"
    Grid[144][6] = "Iron Hills"
    Grid[144][7] = "Iron Hills"
    Grid[144][8] = "Iron Hills"
    Grid[144][9] = "Iron Hills"
    Grid[144][10] = "Iron Hills"
    Grid[144][11] = "Iron Hills"
    Grid[144][12] = "Iron Hills"
    Grid[144][13] = "Iron Hills"
    Grid[144][14] = "Iron Hills"
    Grid[144][15] = "East Rhun"
    Grid[144][16] = "East Rhun"
    Grid[144][17] = "East Rhun"
    Grid[144][18] = "East Rhun"
    Grid[144][19] = "East Rhun"
    Grid[144][20] = "East Rhun"
    Grid[144][21] = "East Rhun"
    Grid[144][22] = "East Rhun"
    Grid[144][23] = "East Rhun"
    Grid[144][24] = "East Rhun"
    Grid[144][25] = "East Rhun"
    Grid[144][26] = "East Rhun"
    Grid[144][27] = "East Rhun"
    Grid[144][28] = "East Rhun"
    Grid[144][29] = "East Rhun"
    Grid[144][30] = "East Rhun"
    Grid[144][31] = "East Rhun"
    Grid[144][32] = "East Rhun"
    Grid[144][33] = "East Rhun"
    Grid[144][34] = "East Rhun"
    Grid[144][35] = "East Rhun"
    Grid[144][36] = "East Rhun"
    Grid[144][37] = "South Rhun"
    Grid[144][38] = "South Rhun"
    Grid[144][39] = "South Rhun"
    Grid[144][40] = "South Rhun"
    Grid[144][41] = "South Rhun"
    Grid[144][42] = "South Rhun"
    Grid[144][43] = "South Rhun"
    Grid[144][44] = "South Rhun"
    Grid[144][45] = "South Rhun"
    Grid[144][46] = "South Rhun"
    Grid[144][47] = "South Rhun"
    Grid[144][48] = "South Rhun"
    Grid[144][49] = "South Rhun"
    Grid[144][50] = "South Rhun"
    Grid[144][51] = "South Rhun"
    Grid[144][52] = "South Rhun"
    Grid[144][53] = "South Rhun"
    Grid[144][54] = "South Rhun"
    Grid[144][55] = "South Rhun"
    Grid[144][56] = "South Rhun"
    Grid[144][57] = "South Rhun"
    Grid[144][58] = "South Rhun"
    Grid[144][59] = "South Rhun"
    Grid[144][60] = "Gorgoroth"
    Grid[144][61] = "Gorgoroth"
    Grid[144][62] = "Gorgoroth"
    Grid[144][63] = "Gorgoroth"
    Grid[144][64] = "Gorgoroth"
    Grid[144][65] = "Gorgoroth"
    Grid[144][66] = "Gorgoroth"
    Grid[144][67] = "Gorgoroth"
    Grid[144][68] = "Gorgoroth"
    Grid[144][69] = "Gorgoroth"
    Grid[144][70] = "Gorgoroth"
    Grid[144][71] = "Gorgoroth"
    Grid[144][72] = "Gorgoroth"
    Grid[144][73] = "Gorgoroth"
    Grid[144][74] = "Gorgoroth"
    Grid[144][75] = "Gorgoroth"
    Grid[144][76] = "Gorgoroth"
    Grid[144][77] = "Gorgoroth"
    Grid[144][78] = "Gorgoroth"
    Grid[144][79] = "Gorgoroth"
    Grid[144][80] = "Gorgoroth"
    Grid[144][81] = "Gorgoroth"
    Grid[144][82] = "Gorgoroth"
    Grid[144][83] = "Gorgoroth"
    Grid[144][84] = "Khand"
    Grid[145][39] = "Isengard Reinforcements"
    Grid[145][40] = "Isengard Reinforcements"
    Grid[145][41] = "Isengard Reinforcements"
    Grid[145][42] = "Isengard Reinforcements"
    Grid[145][43] = "Isengard Reinforcements"
    Grid[145][44] = "Isengard Reinforcements"
    Grid[145][45] = "Isengard Reinforcements"
    Grid[145][46] = "Isengard Reinforcements"
    Grid[145][47] = "Isengard Reinforcements"
    Grid[145][48] = "Isengard Reinforcements"
    Grid[145][49] = "Isengard Reinforcements"
    Grid[145][50] = "Isengard Reinforcements"
    Grid[145][51] = "Isengard Reinforcements"
    Grid[145][52] = "Haradrim Reinforcements"
    Grid[145][53] = "Haradrim Reinforcements"
    Grid[145][54] = "Haradrim Reinforcements"
    Grid[145][55] = "Haradrim Reinforcements"
    Grid[145][56] = "Haradrim Reinforcements"
    Grid[145][57] = "Haradrim Reinforcements"
    Grid[145][58] = "Haradrim Reinforcements"
    Grid[145][59] = "Haradrim Reinforcements"
    Grid[145][60] = "Haradrim Reinforcements"
    Grid[145][61] = "Haradrim Reinforcements"
    Grid[145][62] = "Haradrim Reinforcements"
    Grid[145][63] = "Haradrim Reinforcements"
    Grid[145][64] = "Sauron Reinforcements"
    Grid[145][65] = "Sauron Reinforcements"
    Grid[145][66] = "Sauron Reinforcements"
    Grid[145][67] = "Sauron Reinforcements"
    Grid[145][68] = "Sauron Reinforcements"
    Grid[145][69] = "Sauron Reinforcements"
    Grid[145][70] = "Sauron Reinforcements"
    Grid[145][71] = "Sauron Reinforcements"
    Grid[145][72] = "Sauron Reinforcements"
    Grid[145][73] = "Sauron Reinforcements"
    Grid[145][74] = "Sauron Reinforcements"
    Grid[145][75] = "Sauron Reinforcements"
    Grid[145][76] = "Nazgul Reinforcements"
    Grid[145][77] = "Nazgul Reinforcements"
    Grid[145][78] = "Nazgul Reinforcements"
    Grid[145][79] = "Nazgul Reinforcements"
    Grid[145][80] = "Nazgul Reinforcements"
    Grid[145][81] = "Nazgul Reinforcements"
    Grid[145][82] = "Nazgul Reinforcements"
    Grid[145][83] = "Nazgul Reinforcements"
    Grid[145][84] = "Nazgul Reinforcements"
    Grid[146][39] = "Isengard Reinforcements"
    Grid[146][40] = "Isengard Reinforcements"
    Grid[146][41] = "Isengard Reinforcements"
    Grid[146][42] = "Isengard Reinforcements"
    Grid[146][43] = "Isengard Reinforcements"
    Grid[146][44] = "Isengard Reinforcements"
    Grid[146][45] = "Isengard Reinforcements"
    Grid[146][46] = "Isengard Reinforcements"
    Grid[146][47] = "Isengard Reinforcements"
    Grid[146][48] = "Isengard Reinforcements"
    Grid[146][49] = "Isengard Reinforcements"
    Grid[146][50] = "Isengard Reinforcements"
    Grid[146][51] = "Isengard Reinforcements"
    Grid[146][52] = "Haradrim Reinforcements"
    Grid[146][53] = "Haradrim Reinforcements"
    Grid[146][54] = "Haradrim Reinforcements"
    Grid[146][55] = "Haradrim Reinforcements"
    Grid[146][56] = "Haradrim Reinforcements"
    Grid[146][57] = "Haradrim Reinforcements"
    Grid[146][58] = "Haradrim Reinforcements"
    Grid[146][59] = "Haradrim Reinforcements"
    Grid[146][60] = "Haradrim Reinforcements"
    Grid[146][61] = "Haradrim Reinforcements"
    Grid[146][62] = "Haradrim Reinforcements"
    Grid[146][63] = "Haradrim Reinforcements"
    Grid[146][64] = "Sauron Reinforcements"
    Grid[146][65] = "Sauron Reinforcements"
    Grid[146][66] = "Sauron Reinforcements"
    Grid[146][67] = "Sauron Reinforcements"
    Grid[146][68] = "Sauron Reinforcements"
    Grid[146][69] = "Sauron Reinforcements"
    Grid[146][70] = "Sauron Reinforcements"
    Grid[146][71] = "Sauron Reinforcements"
    Grid[146][72] = "Sauron Reinforcements"
    Grid[146][73] = "Sauron Reinforcements"
    Grid[146][74] = "Sauron Reinforcements"
    Grid[146][75] = "Sauron Reinforcements"
    Grid[146][76] = "Nazgul Reinforcements"
    Grid[146][77] = "Nazgul Reinforcements"
    Grid[146][78] = "Nazgul Reinforcements"
    Grid[146][79] = "Nazgul Reinforcements"
    Grid[146][80] = "Nazgul Reinforcements"
    Grid[146][81] = "Nazgul Reinforcements"
    Grid[146][82] = "Nazgul Reinforcements"
    Grid[146][83] = "Nazgul Reinforcements"
    Grid[146][84] = "Nazgul Reinforcements"
    Grid[147][39] = "Isengard Reinforcements"
    Grid[147][40] = "Isengard Reinforcements"
    Grid[147][41] = "Isengard Reinforcements"
    Grid[147][42] = "Isengard Reinforcements"
    Grid[147][43] = "Isengard Reinforcements"
    Grid[147][44] = "Isengard Reinforcements"
    Grid[147][45] = "Isengard Reinforcements"
    Grid[147][46] = "Isengard Reinforcements"
    Grid[147][47] = "Isengard Reinforcements"
    Grid[147][48] = "Isengard Reinforcements"
    Grid[147][49] = "Isengard Reinforcements"
    Grid[147][50] = "Isengard Reinforcements"
    Grid[147][51] = "Isengard Reinforcements"
    Grid[147][52] = "Haradrim Reinforcements"
    Grid[147][53] = "Haradrim Reinforcements"
    Grid[147][54] = "Haradrim Reinforcements"
    Grid[147][55] = "Haradrim Reinforcements"
    Grid[147][56] = "Haradrim Reinforcements"
    Grid[147][57] = "Haradrim Reinforcements"
    Grid[147][58] = "Haradrim Reinforcements"
    Grid[147][59] = "Haradrim Reinforcements"
    Grid[147][60] = "Haradrim Reinforcements"
    Grid[147][61] = "Haradrim Reinforcements"
    Grid[147][62] = "Haradrim Reinforcements"
    Grid[147][63] = "Haradrim Reinforcements"
    Grid[147][64] = "Sauron Reinforcements"
    Grid[147][65] = "Sauron Reinforcements"
    Grid[147][66] = "Sauron Reinforcements"
    Grid[147][67] = "Sauron Reinforcements"
    Grid[147][68] = "Sauron Reinforcements"
    Grid[147][69] = "Sauron Reinforcements"
    Grid[147][70] = "Sauron Reinforcements"
    Grid[147][71] = "Sauron Reinforcements"
    Grid[147][72] = "Sauron Reinforcements"
    Grid[147][73] = "Sauron Reinforcements"
    Grid[147][74] = "Sauron Reinforcements"
    Grid[147][75] = "Sauron Reinforcements"
    Grid[147][76] = "Nazgul Reinforcements"
    Grid[147][77] = "Nazgul Reinforcements"
    Grid[147][78] = "Nazgul Reinforcements"
    Grid[147][79] = "Nazgul Reinforcements"
    Grid[147][80] = "Nazgul Reinforcements"
    Grid[147][81] = "Nazgul Reinforcements"
    Grid[147][82] = "Nazgul Reinforcements"
    Grid[147][83] = "Nazgul Reinforcements"
    Grid[147][84] = "Nazgul Reinforcements"
    Grid[148][39] = "Isengard Reinforcements"
    Grid[148][40] = "Isengard Reinforcements"
    Grid[148][41] = "Isengard Reinforcements"
    Grid[148][42] = "Isengard Reinforcements"
    Grid[148][43] = "Isengard Reinforcements"
    Grid[148][44] = "Isengard Reinforcements"
    Grid[148][45] = "Isengard Reinforcements"
    Grid[148][46] = "Isengard Reinforcements"
    Grid[148][47] = "Isengard Reinforcements"
    Grid[148][48] = "Isengard Reinforcements"
    Grid[148][49] = "Isengard Reinforcements"
    Grid[148][50] = "Isengard Reinforcements"
    Grid[148][51] = "Isengard Reinforcements"
    Grid[148][52] = "Haradrim Reinforcements"
    Grid[148][53] = "Haradrim Reinforcements"
    Grid[148][54] = "Haradrim Reinforcements"
    Grid[148][55] = "Haradrim Reinforcements"
    Grid[148][56] = "Haradrim Reinforcements"
    Grid[148][57] = "Haradrim Reinforcements"
    Grid[148][58] = "Haradrim Reinforcements"
    Grid[148][59] = "Haradrim Reinforcements"
    Grid[148][60] = "Haradrim Reinforcements"
    Grid[148][61] = "Haradrim Reinforcements"
    Grid[148][62] = "Haradrim Reinforcements"
    Grid[148][63] = "Haradrim Reinforcements"
    Grid[148][64] = "Sauron Reinforcements"
    Grid[148][65] = "Sauron Reinforcements"
    Grid[148][66] = "Sauron Reinforcements"
    Grid[148][67] = "Sauron Reinforcements"
    Grid[148][68] = "Sauron Reinforcements"
    Grid[148][69] = "Sauron Reinforcements"
    Grid[148][70] = "Sauron Reinforcements"
    Grid[148][71] = "Sauron Reinforcements"
    Grid[148][72] = "Sauron Reinforcements"
    Grid[148][73] = "Sauron Reinforcements"
    Grid[148][74] = "Sauron Reinforcements"
    Grid[148][75] = "Sauron Reinforcements"
    Grid[148][76] = "Nazgul Reinforcements"
    Grid[148][77] = "Nazgul Reinforcements"
    Grid[148][78] = "Nazgul Reinforcements"
    Grid[148][79] = "Nazgul Reinforcements"
    Grid[148][80] = "Nazgul Reinforcements"
    Grid[148][81] = "Nazgul Reinforcements"
    Grid[148][82] = "Nazgul Reinforcements"
    Grid[148][83] = "Nazgul Reinforcements"
    Grid[148][84] = "Nazgul Reinforcements"
    Grid[149][39] = "Isengard Reinforcements"
    Grid[149][40] = "Isengard Reinforcements"
    Grid[149][41] = "Isengard Reinforcements"
    Grid[149][42] = "Isengard Reinforcements"
    Grid[149][43] = "Isengard Reinforcements"
    Grid[149][44] = "Isengard Reinforcements"
    Grid[149][45] = "Isengard Reinforcements"
    Grid[149][46] = "Isengard Reinforcements"
    Grid[149][47] = "Isengard Reinforcements"
    Grid[149][48] = "Isengard Reinforcements"
    Grid[149][49] = "Isengard Reinforcements"
    Grid[149][50] = "Isengard Reinforcements"
    Grid[149][51] = "Isengard Reinforcements"
    Grid[149][52] = "Haradrim Reinforcements"
    Grid[149][53] = "Haradrim Reinforcements"
    Grid[149][54] = "Haradrim Reinforcements"
    Grid[149][55] = "Haradrim Reinforcements"
    Grid[149][56] = "Haradrim Reinforcements"
    Grid[149][57] = "Haradrim Reinforcements"
    Grid[149][58] = "Haradrim Reinforcements"
    Grid[149][59] = "Haradrim Reinforcements"
    Grid[149][60] = "Haradrim Reinforcements"
    Grid[149][61] = "Haradrim Reinforcements"
    Grid[149][62] = "Haradrim Reinforcements"
    Grid[149][63] = "Haradrim Reinforcements"
    Grid[149][64] = "Sauron Reinforcements"
    Grid[149][65] = "Sauron Reinforcements"
    Grid[149][66] = "Sauron Reinforcements"
    Grid[149][67] = "Sauron Reinforcements"
    Grid[149][68] = "Sauron Reinforcements"
    Grid[149][69] = "Sauron Reinforcements"
    Grid[149][70] = "Sauron Reinforcements"
    Grid[149][71] = "Sauron Reinforcements"
    Grid[149][72] = "Sauron Reinforcements"
    Grid[149][73] = "Sauron Reinforcements"
    Grid[149][74] = "Sauron Reinforcements"
    Grid[149][75] = "Sauron Reinforcements"
    Grid[149][76] = "Nazgul Reinforcements"
    Grid[149][77] = "Nazgul Reinforcements"
    Grid[149][78] = "Nazgul Reinforcements"
    Grid[149][79] = "Nazgul Reinforcements"
    Grid[149][80] = "Nazgul Reinforcements"
    Grid[149][81] = "Nazgul Reinforcements"
    Grid[149][82] = "Nazgul Reinforcements"
    Grid[149][83] = "Nazgul Reinforcements"
    Grid[149][84] = "Nazgul Reinforcements"
    Grid[150][39] = "Isengard Reinforcements"
    Grid[150][40] = "Isengard Reinforcements"
    Grid[150][41] = "Isengard Reinforcements"
    Grid[150][42] = "Isengard Reinforcements"
    Grid[150][43] = "Isengard Reinforcements"
    Grid[150][44] = "Isengard Reinforcements"
    Grid[150][45] = "Isengard Reinforcements"
    Grid[150][46] = "Isengard Reinforcements"
    Grid[150][47] = "Isengard Reinforcements"
    Grid[150][48] = "Isengard Reinforcements"
    Grid[150][49] = "Isengard Reinforcements"
    Grid[150][50] = "Isengard Reinforcements"
    Grid[150][51] = "Isengard Reinforcements"
    Grid[150][52] = "Haradrim Reinforcements"
    Grid[150][53] = "Haradrim Reinforcements"
    Grid[150][54] = "Haradrim Reinforcements"
    Grid[150][55] = "Haradrim Reinforcements"
    Grid[150][56] = "Haradrim Reinforcements"
    Grid[150][57] = "Haradrim Reinforcements"
    Grid[150][58] = "Haradrim Reinforcements"
    Grid[150][59] = "Haradrim Reinforcements"
    Grid[150][60] = "Haradrim Reinforcements"
    Grid[150][61] = "Haradrim Reinforcements"
    Grid[150][62] = "Haradrim Reinforcements"
    Grid[150][63] = "Haradrim Reinforcements"
    Grid[150][64] = "Sauron Reinforcements"
    Grid[150][65] = "Sauron Reinforcements"
    Grid[150][66] = "Sauron Reinforcements"
    Grid[150][67] = "Sauron Reinforcements"
    Grid[150][68] = "Sauron Reinforcements"
    Grid[150][69] = "Sauron Reinforcements"
    Grid[150][70] = "Sauron Reinforcements"
    Grid[150][71] = "Sauron Reinforcements"
    Grid[150][72] = "Sauron Reinforcements"
    Grid[150][73] = "Sauron Reinforcements"
    Grid[150][74] = "Sauron Reinforcements"
    Grid[150][75] = "Sauron Reinforcements"
    Grid[150][76] = "Nazgul Reinforcements"
    Grid[150][77] = "Nazgul Reinforcements"
    Grid[150][78] = "Nazgul Reinforcements"
    Grid[150][79] = "Nazgul Reinforcements"
    Grid[150][80] = "Nazgul Reinforcements"
    Grid[150][81] = "Nazgul Reinforcements"
    Grid[150][82] = "Nazgul Reinforcements"
    Grid[150][83] = "Nazgul Reinforcements"
    Grid[150][84] = "Nazgul Reinforcements"
    Grid[151][39] = "Isengard Reinforcements"
    Grid[151][40] = "Isengard Reinforcements"
    Grid[151][41] = "Isengard Reinforcements"
    Grid[151][42] = "Isengard Reinforcements"
    Grid[151][43] = "Isengard Reinforcements"
    Grid[151][44] = "Isengard Reinforcements"
    Grid[151][45] = "Isengard Reinforcements"
    Grid[151][46] = "Isengard Reinforcements"
    Grid[151][47] = "Isengard Reinforcements"
    Grid[151][48] = "Isengard Reinforcements"
    Grid[151][49] = "Isengard Reinforcements"
    Grid[151][50] = "Isengard Reinforcements"
    Grid[151][51] = "Isengard Reinforcements"
    Grid[151][52] = "Haradrim Reinforcements"
    Grid[151][53] = "Haradrim Reinforcements"
    Grid[151][54] = "Haradrim Reinforcements"
    Grid[151][55] = "Haradrim Reinforcements"
    Grid[151][56] = "Haradrim Reinforcements"
    Grid[151][57] = "Haradrim Reinforcements"
    Grid[151][58] = "Haradrim Reinforcements"
    Grid[151][59] = "Haradrim Reinforcements"
    Grid[151][60] = "Haradrim Reinforcements"
    Grid[151][61] = "Haradrim Reinforcements"
    Grid[151][62] = "Haradrim Reinforcements"
    Grid[151][63] = "Haradrim Reinforcements"
    Grid[151][64] = "Sauron Reinforcements"
    Grid[151][65] = "Sauron Reinforcements"
    Grid[151][66] = "Sauron Reinforcements"
    Grid[151][67] = "Sauron Reinforcements"
    Grid[151][68] = "Sauron Reinforcements"
    Grid[151][69] = "Sauron Reinforcements"
    Grid[151][70] = "Sauron Reinforcements"
    Grid[151][71] = "Sauron Reinforcements"
    Grid[151][72] = "Sauron Reinforcements"
    Grid[151][73] = "Sauron Reinforcements"
    Grid[151][74] = "Sauron Reinforcements"
    Grid[151][75] = "Sauron Reinforcements"
    Grid[151][76] = "Nazgul Reinforcements"
    Grid[151][77] = "Nazgul Reinforcements"
    Grid[151][78] = "Nazgul Reinforcements"
    Grid[151][79] = "Nazgul Reinforcements"
    Grid[151][80] = "Nazgul Reinforcements"
    Grid[151][81] = "Nazgul Reinforcements"
    Grid[151][82] = "Nazgul Reinforcements"
    Grid[151][83] = "Nazgul Reinforcements"
    Grid[151][84] = "Nazgul Reinforcements"
    Grid[152][39] = "Isengard Reinforcements"
    Grid[152][40] = "Isengard Reinforcements"
    Grid[152][41] = "Isengard Reinforcements"
    Grid[152][42] = "Isengard Reinforcements"
    Grid[152][43] = "Isengard Reinforcements"
    Grid[152][44] = "Isengard Reinforcements"
    Grid[152][45] = "Isengard Reinforcements"
    Grid[152][46] = "Isengard Reinforcements"
    Grid[152][47] = "Isengard Reinforcements"
    Grid[152][48] = "Isengard Reinforcements"
    Grid[152][49] = "Isengard Reinforcements"
    Grid[152][50] = "Isengard Reinforcements"
    Grid[152][51] = "Isengard Reinforcements"
    Grid[152][52] = "Haradrim Reinforcements"
    Grid[152][53] = "Haradrim Reinforcements"
    Grid[152][54] = "Haradrim Reinforcements"
    Grid[152][55] = "Haradrim Reinforcements"
    Grid[152][56] = "Haradrim Reinforcements"
    Grid[152][57] = "Haradrim Reinforcements"
    Grid[152][58] = "Haradrim Reinforcements"
    Grid[152][59] = "Haradrim Reinforcements"
    Grid[152][60] = "Haradrim Reinforcements"
    Grid[152][61] = "Haradrim Reinforcements"
    Grid[152][62] = "Haradrim Reinforcements"
    Grid[152][63] = "Haradrim Reinforcements"
    Grid[152][64] = "Sauron Reinforcements"
    Grid[152][65] = "Sauron Reinforcements"
    Grid[152][66] = "Sauron Reinforcements"
    Grid[152][67] = "Sauron Reinforcements"
    Grid[152][68] = "Sauron Reinforcements"
    Grid[152][69] = "Sauron Reinforcements"
    Grid[152][70] = "Sauron Reinforcements"
    Grid[152][71] = "Sauron Reinforcements"
    Grid[152][72] = "Sauron Reinforcements"
    Grid[152][73] = "Sauron Reinforcements"
    Grid[152][74] = "Sauron Reinforcements"
    Grid[152][75] = "Sauron Reinforcements"
    Grid[152][76] = "Nazgul Reinforcements"
    Grid[152][77] = "Nazgul Reinforcements"
    Grid[152][78] = "Nazgul Reinforcements"
    Grid[152][79] = "Nazgul Reinforcements"
    Grid[152][80] = "Nazgul Reinforcements"
    Grid[152][81] = "Nazgul Reinforcements"
    Grid[152][82] = "Nazgul Reinforcements"
    Grid[152][83] = "Nazgul Reinforcements"
    Grid[152][84] = "Nazgul Reinforcements"
    Grid[153][39] = "Isengard Reinforcements"
    Grid[153][40] = "Isengard Reinforcements"
    Grid[153][41] = "Isengard Reinforcements"
    Grid[153][42] = "Isengard Reinforcements"
    Grid[153][43] = "Isengard Reinforcements"
    Grid[153][44] = "Isengard Reinforcements"
    Grid[153][45] = "Isengard Reinforcements"
    Grid[153][46] = "Isengard Reinforcements"
    Grid[153][47] = "Isengard Reinforcements"
    Grid[153][48] = "Isengard Reinforcements"
    Grid[153][49] = "Isengard Reinforcements"
    Grid[153][50] = "Isengard Reinforcements"
    Grid[153][51] = "Isengard Reinforcements"
    Grid[153][52] = "Haradrim Reinforcements"
    Grid[153][53] = "Haradrim Reinforcements"
    Grid[153][54] = "Haradrim Reinforcements"
    Grid[153][55] = "Haradrim Reinforcements"
    Grid[153][56] = "Haradrim Reinforcements"
    Grid[153][57] = "Haradrim Reinforcements"
    Grid[153][58] = "Haradrim Reinforcements"
    Grid[153][59] = "Haradrim Reinforcements"
    Grid[153][60] = "Haradrim Reinforcements"
    Grid[153][61] = "Haradrim Reinforcements"
    Grid[153][62] = "Haradrim Reinforcements"
    Grid[153][63] = "Haradrim Reinforcements"
    Grid[153][64] = "Sauron Reinforcements"
    Grid[153][65] = "Sauron Reinforcements"
    Grid[153][66] = "Sauron Reinforcements"
    Grid[153][67] = "Sauron Reinforcements"
    Grid[153][68] = "Sauron Reinforcements"
    Grid[153][69] = "Sauron Reinforcements"
    Grid[153][70] = "Sauron Reinforcements"
    Grid[153][71] = "Sauron Reinforcements"
    Grid[153][72] = "Sauron Reinforcements"
    Grid[153][73] = "Sauron Reinforcements"
    Grid[153][74] = "Sauron Reinforcements"
    Grid[153][75] = "Sauron Reinforcements"
    Grid[153][76] = "Nazgul Reinforcements"
    Grid[153][77] = "Nazgul Reinforcements"
    Grid[153][78] = "Nazgul Reinforcements"
    Grid[153][79] = "Nazgul Reinforcements"
    Grid[153][80] = "Nazgul Reinforcements"
    Grid[153][81] = "Nazgul Reinforcements"
    Grid[153][82] = "Nazgul Reinforcements"
    Grid[153][83] = "Nazgul Reinforcements"
    Grid[153][84] = "Nazgul Reinforcements"
    Grid[154][39] = "Isengard Reinforcements"
    Grid[154][40] = "Isengard Reinforcements"
    Grid[154][41] = "Isengard Reinforcements"
    Grid[154][42] = "Isengard Reinforcements"
    Grid[154][43] = "Isengard Reinforcements"
    Grid[154][44] = "Isengard Reinforcements"
    Grid[154][45] = "Isengard Reinforcements"
    Grid[154][46] = "Isengard Reinforcements"
    Grid[154][47] = "Isengard Reinforcements"
    Grid[154][48] = "Isengard Reinforcements"
    Grid[154][49] = "Isengard Reinforcements"
    Grid[154][50] = "Isengard Reinforcements"
    Grid[154][51] = "Isengard Reinforcements"
    Grid[154][52] = "Haradrim Reinforcements"
    Grid[154][53] = "Haradrim Reinforcements"
    Grid[154][54] = "Haradrim Reinforcements"
    Grid[154][55] = "Haradrim Reinforcements"
    Grid[154][56] = "Haradrim Reinforcements"
    Grid[154][57] = "Haradrim Reinforcements"
    Grid[154][58] = "Haradrim Reinforcements"
    Grid[154][59] = "Haradrim Reinforcements"
    Grid[154][60] = "Haradrim Reinforcements"
    Grid[154][61] = "Haradrim Reinforcements"
    Grid[154][62] = "Haradrim Reinforcements"
    Grid[154][63] = "Haradrim Reinforcements"
    Grid[154][64] = "Sauron Reinforcements"
    Grid[154][65] = "Sauron Reinforcements"
    Grid[154][66] = "Sauron Reinforcements"
    Grid[154][67] = "Sauron Reinforcements"
    Grid[154][68] = "Sauron Reinforcements"
    Grid[154][69] = "Sauron Reinforcements"
    Grid[154][70] = "Sauron Reinforcements"
    Grid[154][71] = "Sauron Reinforcements"
    Grid[154][72] = "Sauron Reinforcements"
    Grid[154][73] = "Sauron Reinforcements"
    Grid[154][74] = "Sauron Reinforcements"
    Grid[154][75] = "Sauron Reinforcements"
    Grid[154][76] = "Nazgul Reinforcements"
    Grid[154][77] = "Nazgul Reinforcements"
    Grid[154][78] = "Nazgul Reinforcements"
    Grid[154][79] = "Nazgul Reinforcements"
    Grid[154][80] = "Nazgul Reinforcements"
    Grid[154][81] = "Nazgul Reinforcements"
    Grid[154][82] = "Nazgul Reinforcements"
    Grid[154][83] = "Nazgul Reinforcements"
    Grid[154][84] = "Nazgul Reinforcements"
    Grid[155][39] = "Isengard Reinforcements"
    Grid[155][40] = "Isengard Reinforcements"
    Grid[155][41] = "Isengard Reinforcements"
    Grid[155][42] = "Isengard Reinforcements"
    Grid[155][43] = "Isengard Reinforcements"
    Grid[155][44] = "Isengard Reinforcements"
    Grid[155][45] = "Isengard Reinforcements"
    Grid[155][46] = "Isengard Reinforcements"
    Grid[155][47] = "Isengard Reinforcements"
    Grid[155][48] = "Isengard Reinforcements"
    Grid[155][49] = "Isengard Reinforcements"
    Grid[155][50] = "Isengard Reinforcements"
    Grid[155][51] = "Isengard Reinforcements"
    Grid[155][52] = "Haradrim Reinforcements"
    Grid[155][53] = "Haradrim Reinforcements"
    Grid[155][54] = "Haradrim Reinforcements"
    Grid[155][55] = "Haradrim Reinforcements"
    Grid[155][56] = "Haradrim Reinforcements"
    Grid[155][57] = "Haradrim Reinforcements"
    Grid[155][58] = "Haradrim Reinforcements"
    Grid[155][59] = "Haradrim Reinforcements"
    Grid[155][60] = "Haradrim Reinforcements"
    Grid[155][61] = "Haradrim Reinforcements"
    Grid[155][62] = "Haradrim Reinforcements"
    Grid[155][63] = "Haradrim Reinforcements"
    Grid[155][64] = "Sauron Reinforcements"
    Grid[155][65] = "Sauron Reinforcements"
    Grid[155][66] = "Sauron Reinforcements"
    Grid[155][67] = "Sauron Reinforcements"
    Grid[155][68] = "Sauron Reinforcements"
    Grid[155][69] = "Sauron Reinforcements"
    Grid[155][70] = "Sauron Reinforcements"
    Grid[155][71] = "Sauron Reinforcements"
    Grid[155][72] = "Sauron Reinforcements"
    Grid[155][73] = "Sauron Reinforcements"
    Grid[155][74] = "Sauron Reinforcements"
    Grid[155][75] = "Sauron Reinforcements"
    Grid[155][76] = "Nazgul Reinforcements"
    Grid[155][77] = "Nazgul Reinforcements"
    Grid[155][78] = "Nazgul Reinforcements"
    Grid[155][79] = "Nazgul Reinforcements"
    Grid[155][80] = "Nazgul Reinforcements"
    Grid[155][81] = "Nazgul Reinforcements"
    Grid[155][82] = "Nazgul Reinforcements"
    Grid[155][83] = "Nazgul Reinforcements"
    Grid[155][84] = "Nazgul Reinforcements"
    Grid[156][39] = "Isengard Reinforcements"
    Grid[156][40] = "Isengard Reinforcements"
    Grid[156][41] = "Isengard Reinforcements"
    Grid[156][42] = "Isengard Reinforcements"
    Grid[156][43] = "Isengard Reinforcements"
    Grid[156][44] = "Isengard Reinforcements"
    Grid[156][45] = "Isengard Reinforcements"
    Grid[156][46] = "Isengard Reinforcements"
    Grid[156][47] = "Isengard Reinforcements"
    Grid[156][48] = "Isengard Reinforcements"
    Grid[156][49] = "Isengard Reinforcements"
    Grid[156][50] = "Isengard Reinforcements"
    Grid[156][51] = "Isengard Reinforcements"
    Grid[156][52] = "Haradrim Reinforcements"
    Grid[156][53] = "Haradrim Reinforcements"
    Grid[156][54] = "Haradrim Reinforcements"
    Grid[156][55] = "Haradrim Reinforcements"
    Grid[156][56] = "Haradrim Reinforcements"
    Grid[156][57] = "Haradrim Reinforcements"
    Grid[156][58] = "Haradrim Reinforcements"
    Grid[156][59] = "Haradrim Reinforcements"
    Grid[156][60] = "Haradrim Reinforcements"
    Grid[156][61] = "Haradrim Reinforcements"
    Grid[156][62] = "Haradrim Reinforcements"
    Grid[156][63] = "Haradrim Reinforcements"
    Grid[156][64] = "Sauron Reinforcements"
    Grid[156][65] = "Sauron Reinforcements"
    Grid[156][66] = "Sauron Reinforcements"
    Grid[156][67] = "Sauron Reinforcements"
    Grid[156][68] = "Sauron Reinforcements"
    Grid[156][69] = "Sauron Reinforcements"
    Grid[156][70] = "Sauron Reinforcements"
    Grid[156][71] = "Sauron Reinforcements"
    Grid[156][72] = "Sauron Reinforcements"
    Grid[156][73] = "Sauron Reinforcements"
    Grid[156][74] = "Sauron Reinforcements"
    Grid[156][75] = "Sauron Reinforcements"
    Grid[156][76] = "Nazgul Reinforcements"
    Grid[156][77] = "Nazgul Reinforcements"
    Grid[156][78] = "Nazgul Reinforcements"
    Grid[156][79] = "Nazgul Reinforcements"
    Grid[156][80] = "Nazgul Reinforcements"
    Grid[156][81] = "Nazgul Reinforcements"
    Grid[156][82] = "Nazgul Reinforcements"
    Grid[156][83] = "Nazgul Reinforcements"
    Grid[156][84] = "Nazgul Reinforcements"
    Grid[157][39] = "Isengard Reinforcements"
    Grid[157][40] = "Isengard Reinforcements"
    Grid[157][41] = "Isengard Reinforcements"
    Grid[157][42] = "Isengard Reinforcements"
    Grid[157][43] = "Isengard Reinforcements"
    Grid[157][44] = "Isengard Reinforcements"
    Grid[157][45] = "Isengard Reinforcements"
    Grid[157][46] = "Isengard Reinforcements"
    Grid[157][47] = "Isengard Reinforcements"
    Grid[157][48] = "Isengard Reinforcements"
    Grid[157][49] = "Isengard Reinforcements"
    Grid[157][50] = "Isengard Reinforcements"
    Grid[157][51] = "Isengard Reinforcements"
    Grid[157][52] = "Haradrim Reinforcements"
    Grid[157][53] = "Haradrim Reinforcements"
    Grid[157][54] = "Haradrim Reinforcements"
    Grid[157][55] = "Haradrim Reinforcements"
    Grid[157][56] = "Haradrim Reinforcements"
    Grid[157][57] = "Haradrim Reinforcements"
    Grid[157][58] = "Haradrim Reinforcements"
    Grid[157][59] = "Haradrim Reinforcements"
    Grid[157][60] = "Haradrim Reinforcements"
    Grid[157][61] = "Haradrim Reinforcements"
    Grid[157][62] = "Haradrim Reinforcements"
    Grid[157][63] = "Haradrim Reinforcements"
    Grid[157][64] = "Sauron Reinforcements"
    Grid[157][65] = "Sauron Reinforcements"
    Grid[157][66] = "Sauron Reinforcements"
    Grid[157][67] = "Sauron Reinforcements"
    Grid[157][68] = "Sauron Reinforcements"
    Grid[157][69] = "Sauron Reinforcements"
    Grid[157][70] = "Sauron Reinforcements"
    Grid[157][71] = "Sauron Reinforcements"
    Grid[157][72] = "Sauron Reinforcements"
    Grid[157][73] = "Sauron Reinforcements"
    Grid[157][74] = "Sauron Reinforcements"
    Grid[157][75] = "Sauron Reinforcements"
    Grid[157][76] = "Nazgul Reinforcements"
    Grid[157][77] = "Nazgul Reinforcements"
    Grid[157][78] = "Nazgul Reinforcements"
    Grid[157][79] = "Nazgul Reinforcements"
    Grid[157][80] = "Nazgul Reinforcements"
    Grid[157][81] = "Nazgul Reinforcements"
    Grid[157][82] = "Nazgul Reinforcements"
    Grid[157][83] = "Nazgul Reinforcements"
    Grid[157][84] = "Nazgul Reinforcements"
end

-- {Position={x,y,z}}
function GetGridRegion(Params) 
    local X = math.floor((Params.Position[1] + 43.65) / 0.557)
    local Z = math.floor((Params.Position[3] - 25.74) / -0.481)
    if Grid[X] ~= nil then
        if Grid[X][Z] ~= nil then
            if #Grid[X][Z] > 0 then
                -- log("Debug:"..X..","..Z..":"..Grid[X][Z])
                return Grid[X][Z]
            end
        end
    end

    return ""
end

function GetNationFromText(Text)
    for F = 1, #Nations do
        if string.find(Text, Nations[F]) ~= nil then
            return Nations[F]
        end
    end
    
    if string.find(Text, "Elf;") ~= nil then
        return "Elves"
    end

    if string.find(Text, "Dwarf;") ~= nil then
        return "Dwarves"
    end

    if string.find(Text, "North;") ~= nil then
        return "North"
    end

    if string.find(Text, "Northmen;") ~= nil then
        return "North"
    end

    return ""
end

function GetSideFromText(Text)
    if string.find(Text, "Shadow") ~= nil then
        return "Shadow"
    elseif string.find(Text, "FreePeople") ~= nil then
        return "FreePeoples"
    end

    for F = 1, #Nations do
        if string.find(Text, Nations[F]) ~= nil then
            if F > 5 then
                return "Shadow"
            else
                return "FreePeoples"
            end
        end
    end
    
    return ""
end

function FreezeObjects()
    -- table...
    getObjectFromGUID("a8d0fa").interactable = false
    -- mount doom...
    getObjectFromGUID("03e684").interactable = false
    getObjectFromGUID("a8c069").interactable = false
    getObjectFromGUID("ec1790").interactable = false
    getObjectFromGUID("873d56").interactable = false
    getObjectFromGUID("7b7ed8").interactable = false
    getObjectFromGUID("76fca0").interactable = false
end

function onObjectEnterZone(zone, enter_object)
    if Scripting then
        if zone.getGUID() == HuntBoxZoneID then
            if enter_object.getName() == "Shadow Action Dice" then
                printToAll("Shadow Action Dice added to the Hunt Box.", {1, 0.4, 0.4})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Shadow Faction Die)" then
                printToAll("Shadow Faction Die added to the Hunt Box.", {1, 0.4, 0.4})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Balrog Die)" then
                printToAll("Balrog Die added to the Hunt Box.", {1, 0.4, 0.4})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Gothmog Die)" then
                printToAll("Gothmog Die added to the Hunt Box.", {1, 0.4, 0.4})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Free Peoples Action Die)" then
                printToAll("Free Peoples Action Die added to the Hunt Box.", {0.4, 0.4, 1})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Vilya Action Die)" then
                printToAll("Vilya Action Die added to the Hunt Box.", {0.4, 0.4, 1})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Nenya Action Die)" then
                printToAll("Nenya Action Die added to the Hunt Box.", {0.4, 0.4, 1})
                enter_object.setGMNotes("HuntBox;")
            elseif enter_object.getName() == "(Narya Action Die)" then
                printToAll("Narya Action Die added to the Hunt Box.", {0.4, 0.4, 1})
                enter_object.setGMNotes("HuntBox;")
            end
        elseif zone.getGUID() == "ba2c6e" then -- Shadow side of huntbox
            SetDiceFace({Dice = enter_object, Value = "Eye"})
        elseif zone.getGUID() == "9aab75" then -- FP side of huntbox
            -- DO NOTHING:SetDiceFace({Dice=enter_object,Value="Character"})
        elseif zone.getGUID() == "822861" then -- red hand
            CheckHandLimit({HandID = "822861", HandColor = "Red"})
        elseif zone.getGUID() == "63b83a" then -- blue hand
            CheckHandLimit({HandID = "63b83a", HandColor = "Blue"})
        elseif zone.getGUID() == "71d77a" then -- yellow hand
            CheckHandLimit({HandID = "71d77a", HandColor = "Yellow"})
        elseif zone.getGUID() == "588435" then -- green hand
            CheckHandLimit({HandID = "588435", HandColor = "Green"})
        elseif zone.getGUID() == "128335" then -- fellowship card zone...
            -- card and companion tag, but not already tagged as fellowship?
            if
                enter_object.type == "Card" and enter_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" and
                    string.find(enter_object.getDescription(), "Companion;") ~= nil and
                    string.find(enter_object.getDescription(), "Fellowship;") == nil
             then
                enter_object.setDescription(enter_object.getDescription() .. "Fellowship;")
                FellowshipMenu()
            end
        end
    end
end

function onObjectLeaveZone(zone, leave_object)
    if Scripting then
        if zone.getGUID() == HuntBoxZoneID then
            if leave_object.getName() == "Shadow Action Dice" then
                printToAll("Shadow Action Dice removed from the Hunt Box.", {1, 0.4, 0.4})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Shadow Faction Die)" then
                printToAll("Shadow Faction Die removed from the Hunt Box.", {1, 0.4, 0.4})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Balrog Die)" then
                printToAll("Balrog Die removed from the Hunt Box.", {1, 0.4, 0.4})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Gothmog Die)" then
                printToAll("Gothmog Die removed from the Hunt Box.", {1, 0.4, 0.4})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Free Peoples Action Die)" then
                printToAll("Free Peoples Action Die recovered from the Hunt Box.", {0.4, 0.4, 1})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Vilya Action Die)" then
                printToAll("Vilya Action Die removed from the Hunt Box.", {0.4, 0.4, 1})
                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Nenya Action Die)" then
                if leave_object.getRotationValue() == "Character + Remove" then
                    printToAll("Nenya Action Die recovered from the Hunt Box.", {0.4, 0.4, 1})
                else
                    printToAll("Nenya Action Die removed from the Hunt Box.", {0.4, 0.4, 1})
                end

                leave_object.setGMNotes("")
            elseif leave_object.getName() == "(Narya Action Die)" then
                if leave_object.getRotationValue() == "Character" then
                    printToAll("Narya Action Die recovered from the Hunt Box.", {0.4, 0.4, 1})
                else
                    printToAll("Narya Action Die removed from the Hunt Box.", {0.4, 0.4, 1})
                end

                leave_object.setGMNotes("")
            end
        elseif zone.getGUID() == "822861" then -- red hand
            CheckHandLimit({HandID = "822861", HandColor = "Red"})
        elseif zone.getGUID() == "63b83a" then -- blue hand
            CheckHandLimit({HandID = "63b83a", HandColor = "Blue"})
        elseif zone.getGUID() == "71d77a" then -- yellow hand
            CheckHandLimit({HandID = "71d77a", HandColor = "Yellow"})
        elseif zone.getGUID() == "588435" then -- green hand
            CheckHandLimit({HandID = "588435", HandColor = "Green"})
        elseif zone.getGUID() == "128335" then -- fellowship card zone...
            -- not actively searching the fellowship?
            if not SearchingFellowship then
                -- card and and fellowship tag...
                if
                    leave_object.type == "Card" and leave_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" and
                        string.find(leave_object.getDescription(), "Fellowship;") ~= nil
                 then
                    leave_object.setDescription(string.gsub(leave_object.getDescription(), "Fellowship;", ""))
                    FellowshipMenu()
                end
            end
        end
    end
end

function onObjectLeaveContainer(Container, Leave_Object)
    if Scripting then
        if
            Container.getGUID() == "8c377e" or Container.getGUID() == "6508fd" or Container.getGUID() == "6d8b6f" or
                Container.getGUID() == "f429d8"
         then -- SP Event Decks
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = {-0.875, 0.2, 1.4},
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = {1, 0.5, 0.5},
                    font_color = {0, 0, 0},
                    tooltip = "Discard"
                }
            )
        elseif
            Container.getGUID() == "240819" or Container.getGUID() == "ba06c3" or Container.getGUID() == "992fc5" or
                Container.getGUID() == "d3fdbc"
         then -- FPP Event Decks
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = {-0.875, 0.2, 1.4},
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = {0.5, 0.5, 1},
                    font_color = {0, 0, 0},
                    tooltip = "Discard"
                }
            )
        elseif Container.getGUID() == "f8a472" then -- SP Faction Deck
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = {-0.875, 0.2, 1.4},
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = {1, 0.5, 0.5},
                    font_color = {0, 0, 0},
                    tooltip = "Discard"
                }
            )
        elseif Container.getGUID() == "6897dc" then -- FPP Faction Deck
            Leave_Object.clearButtons()
            Leave_Object.createButton(
                {
                    click_function = "DiscardCard",
                    function_owner = Global,
                    label = "x",
                    position = {-0.875, 0.2, 1.4},
                    width = 150,
                    height = 100,
                    font_size = 100,
                    color = {0.5, 0.5, 1},
                    font_color = {0, 0, 0},
                    tooltip = "Discard"
                }
            )
        end
    end
end

function onObjectSearchEnd(Object, PlayerColor)
    if Object.getGUID() == "002387" then
        Object.shuffle()
        printToAll("Shuffling Hunt Pool...")
    elseif Object.getGUID() == "043c9c" then
        Object.shuffle()
        printToAll("Shuffling Companion Random Pool...")
    end
end

-- {Dice=Object,Value="Eye"}
function SetDiceFace(Params)
    -- if object is a die and has the specified face, then rotates to it, otherwise does nothing...
    if Params.Dice ~= nil then
        if Params.Dice.type == "Dice" then
            for F, FF in pairs(Params.Dice.getRotationValues()) do
                if string.find(FF.value, Params.Value) ~= nil then
                    if not CompactMode and string.find(Params.Dice.getDescription(), "FreePeoples;") ~= nil then
                        Params.Dice.setRotationSmooth(
                            {FF.rotation[1], FF.rotation[2] + 180, FF.rotation[3]},
                            false,
                            false
                        )
                    else
                        Params.Dice.setRotationSmooth(FF.rotation, false, false)
                    end

                    break
                end
            end
        end
    end
end

-- {HandID="",HandColor=""}
function CheckHandLimit(Params)
    if getObjectFromGUID(GamePanelID) ~= nil then
        local EventLimit = 6
        local FactionLimit = 4
        local EventCount = 0
        local FactionCount = 0
        local AlertText = ""
        if
            (getObjectFromGUID(GamePanelID).getVar("Versus") == "1v2" and
                (Params.HandColor == "Red" or Params.HandColor == "Yellow")) or
                getObjectFromGUID(GamePanelID).getVar("Versus") == "2v2"
         then
            EventLimit = 4
            FactionLimit = 3
        end

        -- check hand limit...
        for O, Obj in pairs(getObjectFromGUID(Params.HandID).getObjects()) do
            if Obj.type == "Card" then
                if string.find(Obj.getDescription(), "Event;") ~= nil then
                    EventCount = EventCount + 1
                elseif string.find(Obj.getDescription(), "Faction;") ~= nil then
                    FactionCount = FactionCount + 1
                end
            end
        end

        -- check for alert...
        if EventCount > EventLimit then
            AlertText =
                "Discard " ..
                (EventCount - EventLimit) ..
                    " Event Card(s) (In Hand: " .. EventCount .. ", Limit: " .. EventLimit .. ")"
        end

        if FactionCount > FactionLimit then
            AlertText =
                AlertText ..
                "\nDiscard " ..
                    (FactionCount - FactionLimit) ..
                        " Faction Card(s) (In Hand: " .. FactionCount .. ", Limit: " .. FactionLimit .. ")"
        end

        -- display alert?
        getObjectFromGUID(Params.HandID).clearButtons()
        if AlertText ~= "" and RulesWarnings then
            local TextColor = {1, 1, 0, 0.9}
            if Params.HandColor == "Red" then
                TextColor = {1, 0, 0, 0.9}
            elseif Params.HandColor == "Blue" then
                TextColor = {0, 0, 1, 0.9}
            elseif Params.HandColor == "Green" then
                TextColor = {0, 1, 0, 0.9}
            end

            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = "HAND LIMIT EXCEEDED!",
                    position = {0.002, 0, 3.002},
                    scale = {0.25, 1, 1},
                    rotation = {0, 180, 0},
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = {0, 0, 0, 0.9}
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = AlertText,
                    position = {0.002, 0, 2.502},
                    scale = {0.25, 1, 1},
                    rotation = {0, 180, 0},
                    width = 0,
                    height = 0,
                    font_size = 75,
                    font_color = {0, 0, 0, 0.9}
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = "HAND LIMIT EXCEEDED!",
                    position = {0, 0.002, 3},
                    scale = {0.25, 1, 1},
                    rotation = {0, 180, 0},
                    width = 0,
                    height = 0,
                    font_size = 150,
                    font_color = TextColor
                }
            )
            getObjectFromGUID(Params.HandID).createButton(
                {
                    click_function = "Nothing",
                    function_owner = Global,
                    label = AlertText,
                    position = {0, 0.002, 2.5},
                    scale = {0.25, 1, 1},
                    rotation = {0, 180, 0},
                    width = 0,
                    height = 0,
                    font_size = 75,
                    font_color = TextColor
                }
            )
        end
    end
end

-- {ID="",BagID="",Name="",Description=""}
function RemoveObjectFromGame(Params)
    if Params.ID == nil then
        Params.ID = ""
    end

    if Params.BagID == nil then
        Params.BagID = ""
    end

    if Params.Name == nil then
        Params.Name = ""
    end

    if Params.Description == nil then
        Params.Description = ""
    end

    local GraveObj = getObjectFromGUID("416864")
    if getObjectFromGUID(Params.ID) ~= nil then
        -- print("Removing Object:",Params.ID," ",getObjectFromGUID(Params.ID).getName())
        GraveObj.putObject(getObjectFromGUID(Params.ID))
    else
        for O, Obj in pairs(getAllObjects()) do
            if
                (Obj.type == "Deck" or Obj.type == "Bag") and Obj ~= GraveObj and
                    (Params.BagID == "" or Obj.getGUID() == Params.BagID)
             then
                for I, Item in pairs(Obj.getObjects()) do
                    if
                        (Params.ID == "" or Params.ID == Item.guid) and (Params.Name == "" or Params.Name == Item.name) and
                            (Params.Description == "" or string.find(Item.description, Params.Description) ~= nil)
                     then
                        local FoundObj = Obj.takeObject({guid = Item.guid})
                        -- print("Removing Item:",Item.guid," ",Item.name,"/",FoundObj.getGUID(),":",FoundObj.getName()," from Container:",Obj.getGUID())
                        GraveObj.putObject(FoundObj)
                        break
                    end
                end
            elseif
                Params.ID == nil and (Params.Name == "" or Obj.getName() == Params.Name) and
                    (Params.Description == "" or string.find(Obj.getDescription(), Params.Description) ~= nil)
             then
                -- print("Removing Object::",Params.Name,"/",Obj.getGUID(),":",Obj.getName())
                GraveObj.putObject(Obj)
                break
            end
        end
    end
end

function SetupTFoE()
    function SetupTFoECoroutine()
        printToAll("Setting up The Fate of Erebor mini expansion...")
        local OverlayToken = getObjectFromGUID(TFoERegionOverlayID)
        if OverlayToken ~= nil then
            OverlayToken.setLock(true)
            OverlayToken.setPositionSmooth({19.8, 0.91, 17.5}, false, true)
            OverlayToken.setRotation({0, 180, 0})
            RemoveObjectFromGame({ID = "db77a1"})
            -- remove FP Erebor
            RemoveObjectFromGame({ID = "fb9626"})
            -- remove FP Erebor box
            RemoveObjectFromGame({ID = "8f175c"})
            -- remove Dale City
            getObjectFromGUID("55e47b").setLock(true)
            getObjectFromGUID("55e47b").setRotation({0, 180, 0})
            if getObjectFromGUID("c35be9").getVar("Settlements") == "Flat" then
                getObjectFromGUID("55e47b").setPosition({17.92, 0.78, 20.87})
            else
                getObjectFromGUID("55e47b").setPosition({17.92, 1.16, 20.87})
            end

            coroutine.yield(0)
            OverlayToken = getObjectFromGUID(TFoEStrongholdOverlayID)
            if OverlayToken ~= nil then
                OverlayToken.setLock(true)
                OverlayToken.setPositionSmooth({-34.75, 0.95, 13.15}, false, true)
                OverlayToken.setRotation({0, 180, 0})
            else
                print("Uhoh! Could not locate The Fate of Erebor Stronghold Overlay!")
            end

            coroutine.yield(0)
            -- Iron Hills 3d city...
            if getObjectFromGUID("7318b5") ~= nil then
                getObjectFromGUID("7318b5").setLock(true)
                getObjectFromGUID("7318b5").setRotation({0, 180, 0})
                if getObjectFromGUID("c35be9").getVar("Settlements") == "Flat" then
                    -- Iron Hills 3d city
                    getObjectFromGUID("7318b5").setPosition({21.92, 0.85, 21.1}, false, true)
                else
                    -- Iron Hills 3d city
                    getObjectFromGUID("7318b5").setPosition({21.92, 1.09, 21.1}, false, true)
                end
            end

            coroutine.yield(0)
            -- activate dwarves political counter...
            if getObjectFromGUID("a55f2c") ~= nil then
                printToAll("  Dwarves are Active on the Political Track...")
                getObjectFromGUID("a55f2c").setRotation({0, 225, 180})
            end

            coroutine.yield(0)
            -- udpate region markers...
            if getObjectFromGUID("d39196") ~= nil then
                getObjectFromGUID("d39196").setPositionSmooth({18.35, 9, 21.32}, false, false)
                -- move erebor marker
                getObjectFromGUID("d39196").setRotation({0, 225, 0})
            end

            coroutine.yield(0)
            if getObjectFromGUID("492ce6") ~= nil then
                getObjectFromGUID("492ce6").setPositionSmooth({21.45, 9, 21.3}, false, false)
                -- move iron hills marker
                getObjectFromGUID("492ce6").setRotation({0, 225, 180})
            end

            coroutine.yield(0)
            if getObjectFromGUID("189a1d") ~= nil then
                getObjectFromGUID("189a1d").destruct()
            end

            coroutine.yield(0)
            -- move North Regular from Dale to Carrock...
            PositionUnit(
                {
                    Name = "North Regular",
                    FromLocation = "Dale",
                    ToLocation = "Carrock",
                    Smooth = true,
                    Position = {7, 2, 21}
                }
            )
            coroutine.yield(0)
            -- move North Leader from Dale to Carrock...
            PositionUnit(
                {
                    Name = "North Leader",
                    FromLocation = "Dale",
                    ToLocation = "Carrock",
                    Smooth = true,
                    Position = {6, 2, 20.75}
                }
            )
            coroutine.yield(0)
            -- move Dwarf Leader from Erebor to Iron Hills...
            PositionUnit(
                {
                    Name = "Dwarf Leader",
                    FromLocation = "Erebor",
                    ToLocation = "Iron Hills",
                    Smooth = true,
                    Position = {19, 2, 17.5}
                }
            )
            coroutine.yield(0)
            -- move Dwarf Elite from Erebor to Reserves...
            PositionUnit(
                {
                    Name = "Dwarf Elite",
                    FromLocation = "Erebor",
                    ToLocation = "Dwarven Reinforcements",
                    Smooth = true,
                    Position = {-41.75, 2, 14}
                }
            )
            coroutine.yield(0)
            -- move Dwarf Elite from Erebor to Reserves...
            PositionUnit(
                {
                    Name = "Dwarf Elite",
                    FromLocation = "Erebor",
                    ToLocation = "Dwarven Reinforcements",
                    Smooth = true,
                    Position = {-41.75, 2, 12}
                }
            )
            coroutine.yield(0)
            -- move Dwarf Regular from Erebor to Iron Hills...
            PositionUnit(
                {
                    Name = "Dwarf Regular",
                    FromLocation = "Erebor",
                    ToLocation = "Iron Hills",
                    Smooth = true,
                    Position = {20.5, 2, 18}
                }
            )
            coroutine.yield(0)
            -- move Dwarf Regular from Reserves to Ered Luin...
            PositionUnit(
                {
                    Name = "Dwarf Regular",
                    FromLocation = "Dwarven Reinforcements",
                    ToLocation = "Ered Luin",
                    Smooth = true,
                    Position = {-18.8, 2, 15.5}
                }
            )
            coroutine.yield(0)
            -- move Sauron Regular from Reserves to Erebor...
            PositionUnit(
                {
                    Name = "Sauron Regular",
                    FromLocation = "Sauron Reinforcements",
                    ToLocation = "Erebor",
                    Smooth = true,
                    Position = {16.6, 2, 18.5}
                }
            )
            coroutine.yield(0)
            -- move Sauron Regular from Reserves to Erebor...
            PositionUnit(
                {
                    Name = "Sauron Regular",
                    FromLocation = "Sauron Reinforcements",
                    ToLocation = "Erebor",
                    Smooth = true,
                    Position = {17.5, 2, 18}
                }
            )
            coroutine.yield(0)
            -- update region info...
            Regions["Erebor"] = {
                Nation = "Sauron",
                Points = 2,
                Side = "Shadow",
                Control = "Shadow",
                Settlement = "Stronghold",
                Type = "Region",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 2, E = 0, L = 0}
            }
            Regions["Iron Hills"] = {
                Nation = "Dwarves",
                Points = 1,
                Side = "FreePeoples",
                Control = "FreePeoples",
                Settlement = "City",
                Type = "Region",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 2, E = 0, L = 1}
            }
            Regions["Carrock"] = {
                Nation = "North",
                Points = 0,
                Side = "FreePeoples",
                Control = "FreePeoples",
                Settlement = "Town",
                Type = "Region",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 2, E = 0, L = 1}
            }
            Regions["Dale"] = {
                Nation = "",
                Points = 0,
                Side = "",
                Control = "",
                Settlement = "Fortification",
                Type = "Region",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 0, E = 0, L = 0}
            }
            Regions["Ered Luin"] = {
                Nation = "Dwarves",
                Points = 0,
                Side = "FreePeoples",
                Control = "FreePeoples",
                Settlement = "Town",
                Type = "Region",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 2, E = 0, L = 0}
            }
            Regions["Dwarven Reinforcements"] = {
                Nation = "Dwarves",
                Points = 0,
                Side = "FreePeoples",
                Control = "FreePeoples",
                Settlement = "",
                Type = "Reinforcements",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 1, E = 5, L = 3}
            }
            Regions["North Reinforcements"] = {
                Nation = "North",
                Points = 0,
                Side = "FreePeoples",
                Control = "FreePeoples",
                Settlement = "",
                Type = "Reinforcements",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 6, E = 4, L = 3}
            }
            Regions["Sauron Reinforcements"] = {
                Nation = "Sauron",
                Points = 0,
                Side = "Shadow",
                Control = "Shadow",
                Settlement = "",
                Type = "Reinforcements",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 6, E = 4, L = 0}
            }
        else -- uhoh!
            print("Uhoh! Could not locate The Fate of Erebor Regions Overlay!")
        end

        coroutine.yield(0)
        -- spawn Dale 3d fortification...
        local Fort = getObjectFromGUID("42366d").clone({position = {17.65, 1.01, 15.43}})
        Fort.setLock(true)
        if getObjectFromGUID("c35be9").getVar("Settlements") == "Flat" then
            Fort.setPosition({17.65, 0.93, 15.43})
        else
            Fort.setPosition({17.65, 1.01, 15.43})
        end

        Fort.setRotation({0, 180, 0})
        return 1
    end

    startLuaCoroutine(Global, "SetupTFoECoroutine")
end

function SetupTFoENewCities()
    if getObjectFromGUID("c537fa") ~= nil then
        getObjectFromGUID("c537fa").setLock(true)
        getObjectFromGUID("c537fa").setRotation({0, 180, 0})
        if getObjectFromGUID("c35be9").getVar("Settlements") == "Flat" then
            getObjectFromGUID("c537fa").setPositionSmooth({-19.3, 0.84, 17.18}, false, true)
        else
            getObjectFromGUID("c537fa").setPositionSmooth({-19.3, 1.08, 17.18}, false, true)
        end

        Regions["Ered Luin"] = {
            Nation = "Dwarves",
            Points = 1,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "City",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 2, E = 0, L = 0}
        }
        if getObjectFromGUID("29981e") ~= nil then
            getObjectFromGUID("29981e").setPositionSmooth({-19.72, 9, 17.36}, false, false)
            -- move marker
            getObjectFromGUID("29981e").setRotation({0, 225, 180})
        end
    end

    if getObjectFromGUID("2df5ce") ~= nil then
        getObjectFromGUID("2df5ce").setLock(true)
        getObjectFromGUID("2df5ce").setRotation({0, 180, 0})
        if getObjectFromGUID("c35be9").getVar("Settlements") == "Flat" then
            getObjectFromGUID("2df5ce").setPositionSmooth({27.28, 0.84, 0.83}, false, true)
        else
            getObjectFromGUID("2df5ce").setPositionSmooth({27.28, 1.08, 0.83}, false, true)
        end

        Regions["South Rhun"] = {
            Nation = "Southron/Easterling",
            Points = 1,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "City",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 3, E = 1, L = 0}
        }
        if getObjectFromGUID("1d784f") ~= nil then
            getObjectFromGUID("1d784f").setPositionSmooth({27.76, 9, 0.95}, false, false)
            -- move marker
            getObjectFromGUID("1d784f").setRotation({0, 225, 0})
        end
    end
end

function CorruptHelmsDeep()
    -- turn helms deep into a shadow stronghold...
    function CorruptHelmsDeepCoroutine()
        -- move in shadow helms deep region overlay...
        getObjectFromGUID("534719").setLock(true)
        coroutine.yield(0)
        getObjectFromGUID("534719").setPosition({0.09, 0.90, -6.21})
        getObjectFromGUID("534719").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- move in shadow helms deep stronghold box...
        getObjectFromGUID("c9bcd7").setLock(true)
        coroutine.yield(0)
        getObjectFromGUID("c9bcd7").setPosition({-34.75, 0.95, -6.50})
        getObjectFromGUID("c9bcd7").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- move in shadow helms deep stronghold3d...
        getObjectFromGUID("011a2a").setLock(true)
        coroutine.yield(0)
        getObjectFromGUID("011a2a").setRotation({0, 180, 0})
        getObjectFromGUID("011a2a").setPosition({0.24, 0.78, -5.49})
        coroutine.yield(0)
        if getObjectFromGUID("c35be9").getVar("Settlements") ~= "Flat" then
            getObjectFromGUID("011a2a").setPositionSmooth({0.24, 1.16, -5.49}, false, false)
        end

        coroutine.yield(0)
        -- move out FP helms deep stronghold 3d...
        getObjectFromGUID("ef398b").setLock(false)
        getObjectFromGUID("ef398b").setPositionSmooth({-60, 1.15, -12}, false, false)
        getObjectFromGUID("ef398b").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- move out FP helms deep stronghold box...
        getObjectFromGUID("231cc7").setLock(false)
        getObjectFromGUID("231cc7").setPositionSmooth({-57, 1, -12}, false, false)
        getObjectFromGUID("231cc7").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- move and flip SettlementControlMarker
        getObjectFromGUID("04cc5c").setPositionSmooth({0.71, 3, -5.03}, false, false)
        getObjectFromGUID("04cc5c").setRotation({0, 225, 0})
        coroutine.yield(0)
        -- announce corruption of helms deep...
        printToAll("Helm's Deep has been corrupted to a Shadow Stronghold.", {1, 1, 0})
        return 1
    end

    startLuaCoroutine(Global, "CorruptHelmsDeepCoroutine")
end

function RestoreHelmsDeep()
    -- restore helms deep to a free peoples stronghold...
    function RestoreHelmsDeepCoroutine()
        -- move out shadow helms deep region overlay...
        getObjectFromGUID("534719").setPositionSmooth({-61.8, 1, -17.81}, false, false)
        getObjectFromGUID("534719").setRotation({0, 180, 0})
        getObjectFromGUID("534719").setLock(false)
        coroutine.yield(0)
        -- move out shadow helms deep stronghold box...
        getObjectFromGUID("c9bcd7").setPositionSmooth({-56.79, 1, -16.79}, false, false)
        getObjectFromGUID("c9bcd7").setRotation({0, 180, 0})
        getObjectFromGUID("c9bcd7").setLock(false)
        coroutine.yield(0)
        -- move out shadow helms deep stronghold3d...
        getObjectFromGUID("011a2a").setRotation({0, 180, 0})
        getObjectFromGUID("011a2a").setPositionSmooth({-61.65, 1.25, -17.08}, false, false)
        getObjectFromGUID("011a2a").setLock(false)
        coroutine.yield(0)
        -- move in FP helms deep stronghold 3d...
        getObjectFromGUID("ef398b").setLock(true)
        coroutine.yield(0)
        getObjectFromGUID("ef398b").setPosition({-0.19, 0.77, -5.57}, false, false)
        getObjectFromGUID("ef398b").setRotation({0, 180, 0})
        coroutine.yield(0)
        if getObjectFromGUID("c35be9").getVar("Settlements") ~= "Flat" then
            getObjectFromGUID("ef398b").setPositionSmooth({-0.19, 1.16, -5.57}, false, false)
        end

        coroutine.yield(0)
        -- move in FP helms deep stronghold box...
        getObjectFromGUID("231cc7").setLock(true)
        coroutine.yield(0)
        getObjectFromGUID("231cc7").setPosition({-34.75, 0.95, -6.50})
        getObjectFromGUID("231cc7").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- move and flip SettlementControlMarker
        getObjectFromGUID("04cc5c").setPositionSmooth({-0.64, 3, -5.12}, false, false)
        getObjectFromGUID("04cc5c").setRotation({0, 225, 180})
        coroutine.yield(0)
        -- announce restoration of helms deep...
        printToAll("Helm's Deep has been restored to a Free People's Stronghold.", {1, 1, 0})
        return 1
    end

    startLuaCoroutine(Global, "RestoreHelmsDeepCoroutine")
end

--{Name="",FromLocation="",ToLocation="",Smooth=true,Position={x,y,z},Rotation={x,y,z}}
function PositionUnit (Params)
    local Result = false
    if Params.Smooth == nil then
        Params.Smooth = false
    end

    for O, Obj in pairs(getAllObjects()) do
        if Obj.getName() == Params.Name then
            -- print("Found:",Obj.getName(),";'",Obj.getGMNotes(),"'")
            if Obj.getGMNotes() == "Region:" .. Params.FromLocation .. ";" then
                printToAll(
                    "Moving " .. Params.Name .. " from " .. Params.FromLocation .. " to " .. Params.ToLocation .. "."
                )
                if Params.Smooth then
                    Obj.setPositionSmooth(Params.Position, false, false)
                    if Params.Rotation ~= nil then
                        Obj.setRotationSmooth(Params.Rotation, false, false)
                    end
                else
                    Obj.setPosition(Params.Position)
                    if Params.Rotation ~= nil then
                        Obj.setRotation(Params.Rotation)
                    end
                end

                Obj.setGMNotes("Region:" .. Params.ToLocation .. ";")
                Result = true
                break
            end
        end
    end

    if not Result then
        printToAll(
            "Failed to move " .. Params.Name .. " from " .. Params.FromLocation .. " to " .. Params.ToLocation .. "!",
            {1, 0.75, 0.5}
        )
    end

    return Result
end

function MoveUnit(UnitName, ID1, ID2, ID3, ID4, FromLocation, ToLocation, ToPosition)
    local UnitObj = getObjectFromGUID(ID1)
    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID2)
    end

    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID3)
    end

    if UnitObj == nil then
        UnitObj = getObjectFromGUID(ID4)
    end

    if UnitObj ~= nil then
        printToAll("Moving " .. UnitName .. " from " .. FromLocation .. " to " .. ToLocation .. ".")
        UnitObj.setPositionSmooth(ToPosition, false, true)
        UnitObj.setGMNotes("Region:" .. ToLocation .. ";")
    else -- uhoh, could not find unit...
        printToAll("Failed to move " .. UnitName .. " from " .. FromLocation .. " to " .. ToLocation .. "!")
    end
end

function SetupBotF() -- setup the breaking of the fellowship.
    function SetupBotFCoroutine()
        printToAll("\nSetting up The Breaking of the Fellowship...\n", {0, 1, 0})
        -- update region info...
        Regions["Rivendell"] = {
            Nation = "Elves",
            Points = 2,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 3, L = 1}
        }
        Regions["Woodland Realm"] = {
            Nation = "Elves",
            Points = 2,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 1, E = 2, L = 1}
        }
        Regions["Elven Reinforcements"] = {
            Nation = "Elves",
            Points = 0,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "",
            Type = "Reinforcements",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 2, E = 2, L = 0}
        }
        Regions["Westemnet"] = {
            Nation = "Rohan",
            Points = 0,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 1, L = 1}
        }
        Regions["Rohan Reinforcements"] = {
            Nation = "Rohan",
            Points = 0,
            Side = "FreePeoples",
            Control = "FreePeoples",
            Settlement = "",
            Type = "Reinforcements",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 6, E = 3, L = 2}
        }
        Regions["North Dunland"] = {
            Nation = "Isengard",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["South Dunland"] = {
            Nation = "Isengard",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Gap of Rohan"] = {
            Nation = "Isengard",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 6, E = 0, L = 0}
        }
        Regions["Orthanc"] = {
            Nation = "Isengard",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 4, E = 1, L = 0}
        }
        Regions["Isengard Reinforcements"] = {
            Nation = "Isengard",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "",
            Type = "Reinforcements",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 2, E = 5, L = 0}
        }
        Regions["Barad~Dur"] = {
            Nation = "Sauron",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Eastemnet"] = {
            Nation = "Rohan",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 1}
        }
        Regions["Nurn"] = {
            Nation = "Sauron",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Gorgoroth"] = {
            Nation = "Sauron",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 4, E = 0, L = 0}
        }
        Regions["Minas Morgul"] = {
            Nation = "Sauron",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 5, E = 1, L = 1}
        }
        Regions["Moria"] = {
            Nation = "Sauron",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 2, E = 1, L = 0}
        }
        Regions["Mount Gundabad"] = {
            Nation = "Sauron",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 4, E = 0, L = 0}
        }
        Regions["Morannon"] = {
            Nation = "Sauron",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 1, E = 1, L = 1}
        }
        Regions["North Ithilien"] = {
            Nation = "",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 5, E = 1, L = 1}
        }
        Regions["Nazgul Reinforcements"] = {
            Nation = "Sauron",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "",
            Type = "Reinforcements",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 1}
        }
        Regions["Far Harad"] = {
            Nation = "Southron/Easterling",
            Points = 1,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "City",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Near Harad"] = {
            Nation = "Southron/Easterling",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Dagorlad"] = {
            Nation = "",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 5, E = 1, L = 1}
        }
        Regions["North Rhun"] = {
            Nation = "Southron/Easterling",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 4, E = 1, L = 1}
        }
        Regions["South Ithilien"] = {
            Nation = "",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 3, E = 1, L = 0}
        }
        Regions["South Rhun"] = {
            Nation = "Southron/Easterling",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Town",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 0, E = 0, L = 0}
        }
        Regions["Umbar"] = {
            Nation = "Southron/Easterling",
            Points = 2,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "Stronghold",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 5, E = 1, L = 0}
        }
        Regions["West Harondor"] = {
            Nation = "",
            Points = 0,
            Side = "",
            Control = "",
            Settlement = "",
            Type = "Region",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 3, E = 1, L = 0}
        }
        Regions["Haradrim Reinforcements"] = {
            Nation = "Southron/Easterling",
            Points = 0,
            Side = "Shadow",
            Control = "Shadow",
            Settlement = "",
            Type = "Reinforcements",
            Detected = {X = 0, R = 0, E = 0, L = 0},
            Starting = {R = 4, E = 1, L = 0}
        }
        if getObjectFromGUID(GamePanelID).getVar("TFoE") then
            Regions["Sauron Reinforcements"] = {
                Nation = "Sauron",
                Points = 0,
                Side = "Shadow",
                Control = "Shadow",
                Settlement = "",
                Type = "Reinforcements",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 8, E = 1, L = 0}
            }
        else
            Regions["Sauron Reinforcements"] = {
                Nation = "Sauron",
                Points = 0,
                Side = "Shadow",
                Control = "Shadow",
                Settlement = "",
                Type = "Reinforcements",
                Detected = {X = 0, R = 0, E = 0, L = 0},
                Starting = {R = 10, E = 1, L = 0}
            }
        end

        coroutine.yield(0)
        -- move 1 Elf Elite from Elven Reinforcements to Rivendell. 104e8a {-0.13, 0.99, 19.85}
        PositionUnit(
            {
                Name = "Elf Elite",
                FromLocation = "Elven Reinforcements",
                ToLocation = "Rivendell",
                Smooth = true,
                Position = {-0.17, 2, 17.66}
            }
        )
        coroutine.yield(0)
        -- move 1 Elf Elite from Reserves to Woodland Realm. ecab45 {14.40, 0.99, 15.88}
        PositionUnit(
            {
                Name = "Elf Elite",
                FromLocation = "Elven Reinforcements",
                ToLocation = "Woodland Realm",
                Smooth = true,
                Position = {14.4, 2, 15.88}
            }
        )
        coroutine.yield(0)
        -- move 1 Rohan Elite from Reserves to Westemnet. 6164fd {2.97, 1.00, -5.01}
        PositionUnit(
            {
                Name = "Rohan Elite",
                FromLocation = "Rohan Reinforcements",
                ToLocation = "Westemnet",
                Smooth = true,
                Position = {2.97, 2, -5}
            }
        )
        coroutine.yield(0)
        -- move 1 Rohan Leader from Reserves to Wesemnet. 241102 {3.14, 1.01, -3.38}
        PositionUnit(
            {
                Name = "Rohan Leader",
                FromLocation = "Rohan Reinforcements",
                ToLocation = "Westemnet",
                Smooth = true,
                Position = {3.14, 2, -3.38}
            }
        )
        coroutine.yield(0)
        -- move 4 Isengard Regulars from Reserves to Gap of Rohan. 494274,69256a,e94175,4ac65c {-7.26, 0.98, -4.09},{-6.54, 0.98, -3.85},{-5.80, 0.98, -3.48},{-4.97, 0.98, -3.09}
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "Isengard Reinforcements",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-7.26, 2, -4.09}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "Isengard Reinforcements",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-6.54, 2, -3.85}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "Isengard Reinforcements",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-5.8, 2, -3.48}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "Isengard Reinforcements",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-4.97, 2, -3.09}
            }
        )
        coroutine.yield(0)
        -- move 1 Isengard Regular from North Dunland to Gap of Rohan. e0c99d {-7.24, 0.98, -3.22}
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "North Dunland",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-7.24, 2, -3.22}
            }
        )
        coroutine.yield(0)
        -- move 1 Isengard Regular from South Dunland to Gap of Rohan. 925f64 {-6.50, 0.98, -2.93}
        PositionUnit(
            {
                Name = "Isengard Regular",
                FromLocation = "South Dunland",
                ToLocation = "Gap of Rohan",
                Smooth = true,
                Position = {-6.5, 2, -2.93}
            }
        )
        coroutine.yield(0)
        -- move 2 Sauron Regulars out of Nurn to Reserves. de56d0,231412 {42.00, 1.01, -5.50},{42.00, 1.01, -10.50}
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Nurn",
                ToLocation = "Sauron Reinforcements",
                Smooth = true,
                Position = {42, 2, -7}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Nurn",
                ToLocation = "Sauron Reinforcements",
                Smooth = true,
                Position = {42, 2, -9}
            }
        )
        coroutine.yield(0)
        -- move 1 Nazgul from Barad~Dur to Eastemnet.
        PositionUnit(
            {
                Name = "Nazgûl",
                FromLocation = "Barad~Dur",
                ToLocation = "Eastemnet",
                Smooth = true,
                Position = {6.41, 2, 1.41}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Regular from Barad~Dur to Gorgoroth. f7720b {25.01, 0.99, -12.64}
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Barad~Dur",
                ToLocation = "Gorgoroth",
                Smooth = true,
                Position = {25, 2, -12.64}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Regular from Barad~Dur to North Ithilien. 3897a7 {16.21, 0.99, -8.73}
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Barad~Dur",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {16.21, 2, -8.73}
            }
        )
        coroutine.yield(0)
        -- move 2 Sauron Regulars from Barad~Dur to Mount Gundabad. 0e02f6,7d5dcb {-2.75, 0.99, 22.27},{-1.21, 0.99, 24.73}
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Barad~Dur",
                ToLocation = "Mount Gundabad",
                Smooth = true,
                Position = {-2.31, 2, 24.54}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Barad~Dur",
                ToLocation = "Mount Gundabad",
                Smooth = true,
                Position = {-1.21, 2, 24.73}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Elite from Barad~Dur to Minas Morgul. 3cc51a
        PositionUnit(
            {
                Name = "Sauron Elite",
                FromLocation = "Barad~Dur",
                ToLocation = "Minas Morgul",
                Smooth = true,
                Position = {20.25, 2, -10.35}
            }
        )
        coroutine.yield(0)
        -- move 4 Sauron Regular from Morannon to North Ithilien a16772,7f5af0,e9f66c,7ff26b {16.94, 0.99, -9.05},{15.82, 0.99, -7.88},{15.42, 0.99, -7.06},{15.03, 0.99, -6.24}
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Morannon",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {16.94, 2, -9.05}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Morannon",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {15.82, 2, -7.88}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Morannon",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {15.42, 2, -7.06}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Sauron Regular",
                FromLocation = "Morannon",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {15.03, 2, -6.24}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Elite from Reserves to North Ithilian. 70d465 {16.99, 0.98, -7.49}
        PositionUnit(
            {
                Name = "Sauron Elite",
                FromLocation = "Sauron Reinforcements",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {16.99, 2, -7.49}
            }
        )
        coroutine.yield(0)
        -- move 1 Nazgul from Reserves to North Ithilian. da05fb {16.61, 0.98, -5.17}
        PositionUnit(
            {
                Name = "Nazgûl",
                FromLocation = "Nazgul Reinforcements",
                ToLocation = "North Ithilien",
                Smooth = true,
                Position = {16.61, 2, -5.17}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Elite from Reserves to Morannon. 12ee76 {19.12, 0.98, -6.27}
        PositionUnit(
            {
                Name = "Sauron Elite",
                FromLocation = "Sauron Reinforcements",
                ToLocation = "Morannon",
                Smooth = true,
                Position = {22.11, 2, -5.75}
            }
        )
        coroutine.yield(0)
        -- move 1 Sauron Elite from Reserves to Moria. 4d1b38 {0.23, 0.98, 10.64}
        PositionUnit(
            {
                Name = "Sauron Elite",
                FromLocation = "Sauron Reinforcements",
                ToLocation = "Moria",
                Smooth = true,
                Position = {0.52, 2, 8.76}
            }
        )
        coroutine.yield(0)
        -- move 1 Nazgul from Reserves to Dagorlad. cb19dc {20.87, 0.98, -0.48}
        PositionUnit(
            {
                Name = "Nazgûl",
                FromLocation = "Nazgul Reinforcements",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {21.28, 2, -0.74}
            }
        )
        coroutine.yield(0)
        -- move 1 Nazgul from Reserves to North Rhun. 9fe34b {26.01, 0.98, 13.38}
        PositionUnit(
            {
                Name = "Nazgûl",
                FromLocation = "Nazgul Reinforcements",
                ToLocation = "North Rhun",
                Smooth = true,
                Position = {26, 2, 13.38}
            }
        )
        coroutine.yield(0)
        -- move 1 Elite from South Rhun to Dagorlad. 88d4e0 {21.81, 1.00, -2.40}
        PositionUnit(
            {
                Name = "Southron/Easterling Elite",
                FromLocation = "South Rhun",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {21.81, 2, -2.4}
            }
        )
        coroutine.yield(0)
        -- move 3 Regulars from South Rhun to Dagorlad. 457c1b,065185,00d408 {19.14, 0.99, -0.61},{18.39, 0.99, -1.27},{19.02, 0.99, -2.04}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "South Rhun",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {19.14, 2, -0.61}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "South Rhun",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {18.39, 2, -1.27}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "South Rhun",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {19.27, 2, -1.44}
            }
        )
        coroutine.yield(0)
        -- move 2 Regulars from Reserves to Dagorlad. 5e23d4,6dd870 {19.69, 1.01, -1.25},{19.86, 0.99, -2.36}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {20.2, 2, -0.68}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "Dagorlad",
                Smooth = true,
                Position = {20.35, 2, -2.25}
            }
        )
        coroutine.yield(0)
        -- move 1 Elite from Reserves to North Rhun. 49c7fe {24.27, 1.00, 11.65}
        PositionUnit(
            {
                Name = "Southron/Easterling Elite",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "North Rhun",
                Smooth = true,
                Position = {24.27, 2, 11.65}
            }
        )
        coroutine.yield(0)
        -- move 2 Regulars from Reserves to North Rhun. ac36b7,60018b {25.22, 0.99, 8.93},{26.13, 0.99, 8.94}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "North Rhun",
                Smooth = true,
                Position = {25.22, 2, 8.93}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "North Rhun",
                Smooth = true,
                Position = {26.13, 2, 8.94}
            }
        )
        coroutine.yield(0)
        -- move 1 Elite from Far Harad to South Ithilien. d9bf61 {16.31, 1.00, -15.04}
        PositionUnit(
            {
                Name = "Southron/Easterling Elite",
                FromLocation = "Far Harad",
                ToLocation = "South Ithilien",
                Smooth = true,
                Position = {16.31, 2, -15.04}
            }
        )
        coroutine.yield(0)
        -- move 3 Regulars from Far Harad to South Ithilien. e8d1d8,9ad4df,e9b6df {14.61, 0.99, -14.73},{13.94, 0.99, -15.56},{14.93, 0.99, -15.75}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Far Harad",
                ToLocation = "South Ithilien",
                Smooth = true,
                Position = {14.61, 2, -14.73}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Far Harad",
                ToLocation = "South Ithilien",
                Smooth = true,
                Position = {13.94, 2, -15.56}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Far Harad",
                ToLocation = "South Ithilien",
                Smooth = true,
                Position = {14.93, 2, -15.75}
            }
        )
        coroutine.yield(0)
        -- move 1 Elite from Near Harad to West Harondor. a11127 {13.05, 1.00, -18.33}
        PositionUnit(
            {
                Name = "Southron/Easterling Elite",
                FromLocation = "Near Harad",
                ToLocation = "West Harondor",
                Smooth = true,
                Position = {13.05, 2, -18.33}
            }
        )
        coroutine.yield(0)
        -- move 3 Regulars from Near Harad to West Harondor. 1d514d,132b14,2e7bf1 {13.00, 0.99, -16.48},{12.21, 0.99, -16.99},{11.41, 0.99, -17.69}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Near Harad",
                ToLocation = "West Harondor",
                Smooth = true,
                Position = {13, 2, -16.48}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Near Harad",
                ToLocation = "West Harondor",
                Smooth = true,
                Position = {12.21, 2, -16.99}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Near Harad",
                ToLocation = "West Harondor",
                Smooth = true,
                Position = {11.41, 2, -17.69}
            }
        )
        coroutine.yield(0)
        -- move 1 Elite from Reserves to Umbar. a7f52b {11.65, 1.00, -22.88}
        PositionUnit(
            {
                Name = "Southron/Easterling Elite",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "Umbar",
                Smooth = true,
                Position = {11.65, 2, -22.88}
            }
        )
        coroutine.yield(0)
        -- move 2 Regulars from Reserves to Umbar. 67a57b,9adaed {9.18, 0.99, -22.73},{10.18, 0.99, -22.73}
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "Umbar",
                Smooth = true,
                Position = {10.18, 2, -22.73}
            }
        )
        coroutine.yield(0)
        PositionUnit(
            {
                Name = "Southron/Easterling Regular",
                FromLocation = "Haradrim Reinforcements",
                ToLocation = "Umbar",
                Smooth = true,
                Position = {9.18, 2, -22.73}
            }
        )
        coroutine.yield(0)
        -- move saruman to Orthanc. 61bc09 {-1.02, 1.00, -0.88}
        -- MoveUnit("Saruman","61bc09","70e1af","7752c4","","out of play","Orthanc",{-1.02, 1.00, -0.88})
        PositionUnit(
            {
                Name = "Saruman: Corrupted Wizard",
                FromLocation = "",
                ToLocation = "Orthanc",
                Smooth = true,
                Position = {-1, 1.76, -0.88}
            }
        )
        coroutine.yield(0)
        getObjectFromGUID("8039f2").setRotation({0, 180, 0})
        -- balrog is dead...
        printToAll("The Balrog is Dead.", {1, 1, 0})
        RemoveObjectFromGame({ID = "2c3907"})
        -- balrog figure 3d
        RemoveObjectFromGame({ID = "ae8ad7"})
        -- balrog figure 2d
        RemoveObjectFromGame({ID = "60d004"})
        -- balrog figure marble
        RemoveObjectFromGame({ID = "b9eda6"})
        -- balrog dice
        RemoveObjectFromGame({ID = "792f54"})
        -- balrog status counter
        RemoveObjectFromGame({ID = "b9f8d6"})
        -- balrog card
        RemoveObjectFromGame({Name = "A Balrog is Come!"})
        -- balrog event card-- b9f8d6
        -- move ring-bearers to Eastemnet {6.76, 1.00, -2.33}...
        -- MoveUnit("Ring-bearers","e76bc8","d67c12","b98185","","Rivendell","Eastemnet",{6.76, 1.00, -2.33})
        PositionUnit(
            {
                Name = "The Ring-bearers",
                FromLocation = "Rivendell",
                ToLocation = "Eastemnet",
                Smooth = true,
                Position = {9.1, 1.76, -2.7}
            }
        )
        -- fellowship is broken...
        -- Gandalf the Grey is gone...
        local CardObj = SeparateCompanionFromFellowship("Gandalf the Grey")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        KillCompanionCard(CardObj)
        coroutine.yield(0)
        -- boromir is dead...
        local CardObj = SeparateCompanionFromFellowship("Boromir")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        KillCompanionCard(CardObj)
        coroutine.yield(0)
        SeparateCompanionFromFellowship("Strider")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        -- Strider starts in Eastemnet...
        -- MoveUnit("Strider","e226bf","4ad487","c4949b","","Fellowship","Eastemnet",{5.11,1.01,0.55})
        PositionUnit(
            {
                Name = "Strider",
                FromLocation = "Fellowship Box",
                ToLocation = "Eastemnet",
                Smooth = true,
                Position = {6.4, 1.76, -0.85}
            }
        )
        SeparateCompanionFromFellowship("Legolas")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        -- Legolas starts in Eastemnet...
        -- MoveUnit("Legolas","a335e0","cb7ce5","7438fb","","Fellowship","Eastemnet",{5.26,1.01,1.68})
        PositionUnit(
            {
                Name = "Legolas",
                FromLocation = "Fellowship Box",
                ToLocation = "Eastemnet",
                Smooth = true,
                Position = {5.6, 1.76, 0.15}
            }
        )
        SeparateCompanionFromFellowship("Gimli")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        -- Gimli starts in Eastemnet...
        -- MoveUnit("Gimli","f454fb","a68c9b","694bab","","Fellowship","Eastemnet",{5.89,1.01,-0.39})
        PositionUnit(
            {
                Name = "Gimli",
                FromLocation = "Fellowship Box",
                ToLocation = "Eastemnet",
                Smooth = true,
                Position = {6.9, 1.76, -1.85}
            }
        )
        for D = 1, 30 do
            coroutine.yield(0)
        end

        coroutine.yield(0)
        -- meriadoc and peregrin start in Fangorn...
        -- MoveUnit("Meriadoc","5642f1","773683","929feb","","Fellowship","Fangorn",{3.81, 0.97, 1.46})
        PositionUnit(
            {
                Name = "Meriadoc",
                FromLocation = "Fellowship Box",
                ToLocation = "Fangorn",
                Smooth = true,
                Position = {3.8, 1.76, 1.5}
            }
        )
        SeparateCompanionFromFellowship("Meriadoc")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        -- MoveUnit("Peregrin","a34d6c","d61029","bcb921","","Fellowship","Fangorn",{3.84, 1.01, 0.68})
        PositionUnit(
            {
                Name = "Peregrin",
                FromLocation = "Fellowship Box",
                ToLocation = "Fangorn",
                Smooth = true,
                Position = {3.8, 1.76, 0.7}
            }
        )
        SeparateCompanionFromFellowship("Peregrin")
        for D = 1, 30 do
            coroutine.yield(0)
        end

        -- gandalf the white starts in Lorien...
        printToAll("Gandalf the White has returned to Lorien.", {1, 1, 0})
        -- MoveUnit("Gandalf the White","0166c2","27d117","60bd5c","","out of play","Lorien",{4.46,1.41,8})
        PositionUnit(
            {
                Name = "Gandalf the White: Emissary from the West",
                FromLocation = "",
                ToLocation = "Lorien",
                Smooth = true,
                Position = {4.45, 1.76, 8}
            }
        )
        getObjectFromGUID("0546b6").setRotation({0, 0, 0})
        -- fellowship is revealed at step 0...
        printToAll("The Fellowship starts Revealed at 0 on the Fellowship Track", {1, 1, 0})
        getObjectFromGUID("6b62ef").setPositionSmooth({5.3, 1.01, 23.20}, false, false)
        getObjectFromGUID("6b62ef").setRotation({0, 270, 0})
        -- corruption starts at 3...
        printToAll("The Corruption of the Ring-bearer starts at 3.", {1, 1, 0})
        getObjectFromGUID("abe1b3").setPositionSmooth({10.04, 1.01, 24.15}, false, false)
        -- gollum is the Fellowship Guide {27.65, 0.98, 17.00}...
        printToAll("All Companions have left the Fellowship, and Gollum is the Guide.", {1, 1, 0})
        Guide = "Gollum: Slave of the Ring"
        GuideLevel = 0
        coroutine.yield(0)
        -- MoveUnit("Gollum","0df4d4","fe5a75","5d7909","","out of play","Fellowship",{27.65, 0.98, 17.00})
        PositionUnit(
            {
                Name = "Gollum",
                FromLocation = "",
                ToLocation = "Fellowship Box",
                Smooth = true,
                Position = {27.65, 1.76, 17}
            }
        )
        getObjectFromGUID("1c4127").setPosition({32.9, 3, 20.0})
        getObjectFromGUID("1c4127").setRotation({0, 180, 0})
        coroutine.yield(0)
        -- Sauron starts active and at war...
        getObjectFromGUID("75a065").setPositionSmooth({34.25, 1.01, -7.26}, false, false)
        PoliticalTrack.Sauron.Level = 0
        PoliticalTrack.Sauron.AtWar = true
        printToAll("Sauron is at War!", {1, 1, 0})
        coroutine.yield(0)
        -- Isengard starts active and at war...
        getObjectFromGUID("7f39c1").setPositionSmooth({33.2, 1.01, -7.59}, false, false)
        PoliticalTrack.Isengard.Level = 0
        PoliticalTrack.Isengard.AtWar = true
        printToAll("Isengard is at War!", {1, 1, 0})
        coroutine.yield(0)
        -- Haradrim starts active and at war...
        getObjectFromGUID("52aff9").setPositionSmooth({35.34, 1.01, -7.59}, false, false)
        PoliticalTrack.Haradrim.Level = 0
        PoliticalTrack.Haradrim.AtWar = true
        printToAll("Haradrim are at War!", {1, 1, 0})
        coroutine.yield(0)
        -- elves start active and at war...
        getObjectFromGUID("fc2440").setPositionSmooth({33.18, 1.01, -5.47}, false, false)
        PoliticalTrack.Elves.Level = 0
        PoliticalTrack.Elves.AtWar = true
        printToAll("Elves are at War!", {1, 1, 0})
        coroutine.yield(0)
        -- gondor start inactive at zone 1...
        getObjectFromGUID("8ab5c1").setPositionSmooth({33.05, 1.01, -1.91}, false, false)
        PoliticalTrack.Gondor.Level = 1
        PoliticalTrack.Gondor.AtWar = false
        printToAll("Gondor starts further down the political track.", {1, 1, 0})
        coroutine.yield(0)
        -- The North start inactive at zone 2...
        getObjectFromGUID("07e059").setPositionSmooth({35.34, 1.01, 1.71}, false, false)
        PoliticalTrack.North.Level = 2
        PoliticalTrack.North.AtWar = false
        printToAll("The North starts further down the political track.", {1, 1, 0})
        coroutine.yield(0)
        -- Dwarves start inactive at zone 2...
        getObjectFromGUID("a55f2c").setPositionSmooth({33.14, 1.01, 1.72}, false, false)
        PoliticalTrack.Dwarves.Level = 2
        PoliticalTrack.Dwarves.AtWar = false
        printToAll("Dwarves start further down the political track.\n", {1, 1, 0})
        coroutine.yield(0)
        -- remove tiles...
        printToAll(
            "Removing standard Hunt Tiles from the Hunt Pool:\nOne Eye tile\nOne 1 Tile\nTwo 2 tiles\nTwo Zero/Reveal tiles\n"
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "8aaa0a", position = {-43.2, 1, -21}, rotation = {0, 180, 0}}
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "b58a49", position = {-41.9, 1, -21}, rotation = {0, 180, 0}}
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "9ec4f1", position = {-40.6, 1, -21}, rotation = {0, 180, 0}}
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "5d8190", position = {-39.3, 1, -21}, rotation = {0, 180, 0}}
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "a63100", position = {-38.0, 1, -21}, rotation = {0, 180, 0}}
        )
        getObjectFromGUID("002387").takeObject(
            {smooth = true, guid = "71f5b1", position = {-43.2, 1, -22.5}, rotation = {0, 180, 0}}
        )
        coroutine.yield(0)
        -- add tiles...
        printToAll(
            "Adding Special Tiles as played:\nZero Hunt tile (Elven Cloaks)\nZero Hunt tile (Elven Rope)\n-2 Hunt tile (Phial of Galadriel)\n"
        )
        if getObjectFromGUID("a31079") ~= nil then
            getObjectFromGUID("a31079").setPositionSmooth({-41.9, 1, -22.5}, false, false)
        end

        if getObjectFromGUID("a31079") ~= nil then
            getObjectFromGUID("be4e0f").setPositionSmooth({-40.6, 1, -22.5}, false, false)
        end

        if getObjectFromGUID("a31079") ~= nil then
            getObjectFromGUID("8ff093").setPositionSmooth({-39.3, 1, -22.5}, false, false)
        end

        coroutine.yield(0)
        -- remove cards...
        printToAll(
            "Removing Free Peoples Character Event Cards:\nMithril Coat and Sting\nMirror of Galadriel\nElven Cloaks\nElven Rope\nPhial of Galadriel\n"
        )
        RemoveObjectFromGame({ID = "357271", Name = "Mithril Coat and Sting"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "d870a1", Name = "Mirror of Galadriel"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "b69f25", Name = "Elven Rope"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "46f2ed", Name = "Elven Cloaks"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "b3797a", Name = "Phial of Galadriel"})
        coroutine.yield(0)
        printToAll("Removing Free Peoples Strategy Event Cards:\nMithril Coat and Sting\nMirror of Galadriel\n")
        RemoveObjectFromGame({ID = "3e59da", Name = "A Power too Great"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "619545", Name = "Kindred of Glorfindel"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "495aee", Name = "Eomer, Son of Eomund"})
        coroutine.yield(0)
        printToAll(
            "Removing Shadow Character Event Cards:\nFoul Thing from the Deep\nCruel Weather\nLure of the Ring\nThe Breaking of the Fellowship\nWorn With Sorrow and Toil\nFlocks of Crebain\nBalrog of Moria\n"
        )
        RemoveObjectFromGame({ID = "4cd9f8", Name = "Cruel Weather"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "838f6e", Name = "Foul Thing from the Deep"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "77ff2b", Name = "Lure of the Ring"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "31ade1", Name = "The Breaking of the Fellowship"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "49b1b4", Name = "Worn with Sorrow and Toil"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "630487", Name = "Flocks of Crebain"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "c6b2ab", Name = "Balrog of Moria"})
        coroutine.yield(0)
        printToAll("Removing Shadow Strategy Event Cards:\nReturn to Valinor\nRage of the Dunlendings\n")
        RemoveObjectFromGame({ID = "7a96dc", Name = "Return to Valinor"})
        coroutine.yield(0)
        RemoveObjectFromGame({ID = "92c6ed", Name = "Rage of the Dunlendings"})
        coroutine.yield(0)
        -- put shadow cards into play...
        printToAll("Placing Shadow Event Cards into Play:\nThe Palantir of Orthanc\nWormtongue\nThreats and Promises\n")
        getObjectFromGUID("8c377e").takeObject(
            {smooth = true, guid = "8d09a8", position = {-26.5, 1, -6}, rotation = {0, 180, 0}}
        )
        coroutine.yield(0)
        getObjectFromGUID("8c377e").takeObject(
            {smooth = true, guid = "accb2a", position = {-21.5, 1, -6}, rotation = {0, 180, 0}}
        )
        coroutine.yield(0)
        getObjectFromGUID("6508fd").takeObject(
            {smooth = true, guid = "1608f1", position = {-16.5, 1, -6}, rotation = {0, 180, 0}}
        )
        coroutine.yield(0)
        -- signal next step is ok to proceed...
        getObjectFromGUID(GamePanelID).setVar("Step", "")
        return 1
    end

    startLuaCoroutine(Global, "SetupBotFCoroutine")
end

-- player=""
function ShuffleHand(Params)
    if true then
        return true
    end

    -- Code by SuperSpitzi
    function SubShuffle(j)
        for i = #j, 2, -1 do
            local n = math.random(i)
            j[i], j[n] = j[n], j[i]
        end
        
        return j
    end

    local HandObj = Player[Params.player].getHandObjects()
    if #HandObj > 0 then
        local Card = {}
        for i, j in pairs(HandObj) do
            Card[i] = j.getPosition()
        end
        
        local shuffledObj = SubShuffle(HandObj)
        local shuffledCard = SubShuffle(Card)
        for i, j in pairs(shuffledObj) do
            j.setPosition(shuffledCard[i])
        end
    
    end
end

-- {Text="",Var="",Default=""}
function ReadTag(Params)
    -- returns a value read from a line of text:  ex: System:ABCDE; will return ABCDE,or the default value if not found...
    if Params.Default == nil then
        Params.Default = ""
    end

    local VarValue = string.match(Params.Text, Params.Var .. ":.-;")
    if VarValue == nil then
        return Params.Default
    else
        VarValue = string.sub(VarValue, string.len(Params.Var) + 2, -2)
        return VarValue
    end
end

-- {Text="",Tag=""} return the new text string.
function RemoveTag(Params)
    if Params.Text == nil then
        return ""
    end

    local TagString = string.match(Params.Text, Params.Tag .. ":.-;")
    if TagString == nil then
        return Params.Text
    else
        return string.gsub(Params.Text, TagString, "")
    end
end

-- {Text="",Tag="",Value=""}  return the new text string.
function UpdateTag(Params)
    if Params.Tag == nil then
        Params.Tag = Params.Var
    end

    local TagString = string.match(Params.Text, Params.Tag .. ":.-;")
    if TagString == nil then
        return Params.Text .. Params.Tag .. ":" .. Params.Value .. ";"
    else
        return string.gsub(Params.Text, TagString, Params.Tag .. ":" .. Params.Value .. ";")
    end
end

-- {ID=#}
function PlaySound(Params)
    if not Mute and getObjectFromGUID(SoundCubeID) ~= nil then
        getObjectFromGUID(SoundCubeID).AssetBundle.playTriggerEffect(Params.ID)
    end
end

-- {UnitObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function UnitEvent(Params)
    if Scripting then
        local UnitNation = GetNationFromText(Params.UnitObj.getDescription())
        local Side = GetSideFromText(UnitNation)
        if Params.Event == "Load" then
            -- 3D eagles?
            if string.find(Params.UnitObj.getDescription(), "3D;Eagles;") ~= nil then
                Params.UnitObj.setPositionSmooth(
                    {
                        Params.UnitObj.getPosition().x,
                        Params.UnitObj.getPosition().y + 2,
                        Params.UnitObj.getPosition().z,
                        false,
                        true
                    }
                )
            end

            Params.UnitObj.setGMNotes("Region:" .. GetGridRegion({Position = Params.UnitObj.getPosition()}) .. ";")
        elseif Params.Event == "Pickup" then
            Params.UnitObj.setVar("PickedUp", true)
            Params.UnitObj.setGMNotes("Region:" .. GetGridRegion({Position = Params.UnitObj.getPosition()}) .. ";")
        elseif Params.Event == "Drop" then
            if Params.UnitObj.getVar("PickedUp") then
                Params.UnitObj.setVar("PickedUp", false)
                -- remove picked up flag.
                local LastRegion =
                    ReadTag({Text = Params.UnitObj.getGMNotes(), Var = "Region", Default = "out of play"})
                local Region = GetGridRegion({Position = Params.UnitObj.getPosition()})
                -- if unit changed regions...
                if Region ~= LastRegion then
                    -- if dropped into play...
                    if
                        Region ~= "" and Params.UnitObj.getPosition().x < BoardX and
                            Params.UnitObj.getPosition().x > -BoardX and
                            Params.UnitObj.getPosition().z < BoardZ and
                            Params.UnitObj.getPosition().z > -BoardZ
                     then
                        -- sound effect?
                        if Params.UnitObj.getName() == "Nazgûl" then
                            local Scream = getObjectFromGUID("c35be9").getVar("Scream")
                            if Scream == "Never" then
                                -- do not scream please.
                            elseif Scream == "Always" then
                                -- scream
                                PlaySound({ID = 8})
                            elseif Region ~= "Nazgul Reinforcements" and LastRegion == "Nazgul Reinforcements" then
                                PlaySound({ID = 8})
                            -- scream
                            end
                        elseif Params.UnitObj.getName() == "The Ring-bearers" and Region == "Mount Doom 1" then
                            PlaySound({ID = 7})
                            -- cracks of doom.
                            broadcastToAll("Reminder: Rebuild the Hunt Pool for the Mordor Track.", {1, 1, 0})
                        elseif Params.UnitObj.getName() == "The Ring-bearers" and Region == "Crack of Doom" then
                            -- corruption 12?
                            if getObjectFromGUID("abe1b3").getPosition().x < 23.5 then
                                -- ring destroyed!
                                broadcastToAll(
                                    "Free Peoples Victory Detected!\n(The One Ring was destroyed)",
                                    {1, 1, 0}
                                )
                                PlaySound({ID = 39})
                            else
                                printToAll("The Ring-bearers reached the Crack of Doom, but were Corrupted!")
                            end
                        elseif LastRegion == "" and Region ~= "" then
                            if Params.UnitObj.getName() == "Gandalf the White: Emissary from the West" then
                                -- i've been sent back...
                                PlaySound({ID = 9})
                            elseif Params.UnitObj.getName() == "Aragorn: Heir to Isildur" then
                                -- stand!
                                PlaySound({ID = 31})
                            elseif Params.UnitObj.getName() == "Gollum" then -- "Gollum: Slave of the Ring" then
                                -- gollum
                                PlaySound({ID = 14})
                            elseif Params.UnitObj.getName() == "Sméagol" then -- "Sméagol: Tamed Wretch" then
                                -- smeagol
                                PlaySound({ID = 16})
                            elseif Params.UnitObj.getName() == "Lady Galadriel: Keeper of Nenya" then
                                -- task...
                                PlaySound({ID = 30})
                            elseif Params.UnitObj.getName() == "Lord Elrond: Keeper of Vilya" then
                                -- unite...
                                PlaySound({ID = 29})
                            elseif Params.UnitObj.getName() == "Treebeard: Tree-herd" then
                                -- no curse...
                                PlaySound({ID = 34})
                            elseif Params.UnitObj.getName() == "Saruman: Corrupted Wizard" then
                                -- A new power...
                                PlaySound({ID = 10})
                            elseif string.find(Params.UnitObj.getName(), "The Witch") ~= nil then
                                -- break him...
                                PlaySound({ID = 25})
                            elseif string.find(Params.UnitObj.getName(), "The Mouth of Sauron") ~= nil then
                                -- welcome...
                                PlaySound({ID = 27})
                            elseif Params.UnitObj.getName() == "Balrog: Evil of the Ancient World" then
                                -- roar!
                                PlaySound({ID = 28})
                            elseif Params.UnitObj.getName() == "Gothmog: Lieutenant of Morgul" then
                                -- fear...
                                PlaySound({ID = 26})
                            elseif Params.UnitObj.getName() == "Ugluk: Chieftain of the Uruk-Hai" then
                                -- ugluk...
                                PlaySound({ID = 54})
                            elseif Params.UnitObj.getName() == "The Shadow of Mirkwood: Chieftain of the Dark Lord" then
                                -- vampire king...
                                PlaySound({ID = 53})
                            elseif Params.UnitObj.getName() == "The Black Serpent: Chieftain of the Haradrim" then
                                PlaySound({ID = 52})
                            -- black serpent...
                            end
                        -- if character from out of play
                        end
                        -- if sound effect?
                        -- companion removed from fellowship?
                        if
                            LastRegion == "Fellowship Box" and
                                string.find(Params.UnitObj.getDescription(), "Companion;") ~= nil
                         then
                            SeparateCompanionFromFellowship(Params.UnitObj.getName())
                        elseif
                            Region == "Fellowship Box" and
                                string.find(Params.UnitObj.getDescription(), "Companion;") ~= nil
                         then
                            -- return companion to fellowship...
                            ReturnCompanionToFellowship(Params.UnitObj)
                        end

                        -- Validate Movement depending on unit type: Nazgul, Companion, Minion, Leader or Army Unit...
                        function ValidateMoveCoroutine()
                            if Regions[Region].Type == "Region" then
                                local RegionNation = Regions[Region].Nation
                                -- rename to match for comparison.
                                if RegionNation == "Southron/Easterling" then
                                    RegionNation = "Haradrim"
                                end

                                -- tally units in this region...
                                local AllyArmyCount = 0
                                local EnemyArmyCount = 0
                                for O, Obj in pairs(getAllObjects()) do
                                    if string.find(Obj.getGMNotes(), "Region:" .. Region .. ";") ~= nil then
                                        if
                                            string.find(Obj.getDescription(), "Regular;") ~= nil or
                                                string.find(Obj.getDescription(), "Elite;") ~= nil
                                         then
                                            if string.find(Obj.getDescription(), Side .. ";") ~= nil then
                                                AllyArmyCount = AllyArmyCount + 1
                                            else
                                                EnemyArmyCount = EnemyArmyCount + 1
                                            end
                                        end
                                    end
                                end

                                coroutine.yield(0)
                                -- what type of unit?
                                if Params.UnitObj.getName() == "Saruman: Corrupted Wizard" then
                                    if Region ~= "Orthanc" then
                                        broadcastToAll("Warning: Saruman can never leave Orthanc.", {1, 1, 0})
                                    end
                                elseif
                                    Params.UnitObj.getName() == "Nazgûl" or
                                        string.find(Params.UnitObj.getName(), "The Witch-King") ~= nil
                                 then
                                    -- Nazgul cannot enter region with a stronghold controlled by FP unless it is besieged...
                                    if
                                        Regions[Region].Settlement == "Stronghold" and
                                            Regions[Region].Control == "FreePeoples" and
                                            AllyArmyCount < 1
                                     then
                                        printToAll(
                                            "Reminder: Nazgûl cannot enter a Region with a Stronghold controlled by the Free Peoples unless it is besieged.",
                                            {1, 1, 0}
                                        )
                                    end
                                elseif string.find(Params.UnitObj.getName(), "Minion;") ~= nil then
                                elseif string.find(Params.UnitObj.getName(), "Companion;") ~= nil then
                                elseif string.find(Params.UnitObj.getName(), "Character;") ~= nil then
                                elseif UnitNation ~= "" and UnitNation ~= nil then
                                    coroutine.yield(0)
                                    -- regular or elite army unit?
                                    if
                                        string.find(Params.UnitObj.getDescription(), "Regular;") ~= nil or
                                            string.find(Params.UnitObj.getDescription(), "Elite;") ~= nil
                                     then
                                        AllyArmyCount = AllyArmyCount + 1 -- include this unit in the stack count.
                                        if Params.Color ~= nil then
                                            printToAll("(Army Stack Count: " .. AllyArmyCount .. ")", Params.Color)
                                        else
                                            printToAll("(Army Stack Count: " .. AllyArmyCount .. ")")
                                        end
                                    end

                                    if AllyArmyCount > 10 then
                                        broadcastToAll(
                                            "Warning: Army stacking limit of 10 exceeded at " .. Region .. ".",
                                            {1, 1, 0}
                                        )
                                    end

                                    -- crossed into another nation?
                                    if RegionNation ~= UnitNation and RegionNation ~= "" then
                                        -- entered a different nation, and not at war?
                                        if not PoliticalTrack[UnitNation].AtWar then
                                            broadcastToAll(
                                                "Warning: A " ..
                                                    UnitNation ..
                                                        " Unit entered another nation (" ..
                                                            RegionNation .. "), but is not yet At War.",
                                                {1, 1, 0}
                                            )
                                        elseif not PoliticalTrack[RegionNation].Active then
                                            if
                                                (UnitNation == "Haradrim" or UnitNation == "Isengard" or
                                                    UnitNation == "Sauron") and
                                                    Regions[Region].Side == "FreePeoples" or
                                                    (UnitNation == "Elves" or UnitNation == "Dwarves" or
                                                        UnitNation == "North" or
                                                        UnitNation == "Rohan" or
                                                        UnitNation == "Gondor") and
                                                        Regions[Region].Side == "Shadow"
                                             then
                                                broadcastToAll(
                                                    "Reminder: Entering an opposing Nation's border usually Activates them.",
                                                    {1, 1, 0}
                                                )
                                            end
                                        end
                                    end
                                end
                            end
                            -- if (dropped into Region)
                            coroutine.yield(0)
                            return 1
                        end

                        if RulesWarnings and Regions[Region] ~= nil then
                            startLuaCoroutine(Global, "ValidateMoveCoroutine")
                        end
                    else -- dropped out of play...
                        if Params.UnitObj.getName() == "Gandalf the Grey" then
                            PlaySound({ID = 6})
                        -- sorrow
                        end
                    end
                -- if dropped into play
                end
                -- if Region ~= LastRegion
                if LastRegion == "" then
                    LastRegion = "out of play"
                end

                if Region == "" then
                    Region = "out of play"
                end

                -- update notes...
                Params.UnitObj.setGMNotes("Region:" .. Region .. ";")
                if Params.Color ~= nil then
                    printToAll(
                        "\n" ..
                            Params.Color ..
                                " Player moved " ..
                                    Params.UnitObj.getName() .. " from " .. LastRegion .. " to " .. Region .. ".",
                        Params.Color
                    )
                else
                    printToAll(
                        "\n" .. Params.UnitObj.getName() .. " moved from " .. LastRegion .. " to " .. Region .. "."
                    )
                end
            end
        elseif Params.Event == "Collide" then
        elseif Params.Event == "Destroy" then
        end
    end
end

-- {ArmyObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function ArmyEvent(Params)
    if Scripting then
        local UnitNation = GetNationFromText(Params.ArmyObj.getDescription())
        local Side = GetSideFromText(UnitNation)
        if Params.Event == "Load" then
            Params.ArmyObj.setGMNotes("Region:" .. GetGridRegion({Position = Params.ArmyObj.getPosition()}) .. ";")
        elseif Params.Event == "Pickup" then
            Params.ArmyObj.setVar("PickedUp", true)
            Params.ArmyObj.setGMNotes("Region:" .. GetGridRegion({Position = Params.ArmyObj.getPosition()}) .. ";")
        elseif Params.Event == "Drop" then
            if Params.ArmyObj.getVar("PickedUp") then
                Params.ArmyObj.setVar("PickedUp", false)
                -- remove picked up flag.
                local LastRegion =
                    ReadTag({Text = Params.ArmyObj.getGMNotes(), Var = "Region", Default = "out of play"})
                local Region = GetGridRegion({Position = Params.ArmyObj.getPosition()})
                -- if unit changed regions...
                if Region ~= LastRegion then
                    -- if dropped into play...
                    if
                        Region ~= "" and Params.ArmyObj.getPosition().x < BoardX and
                            Params.ArmyObj.getPosition().x > -BoardX and
                            Params.ArmyObj.getPosition().z < BoardZ and
                            Params.ArmyObj.getPosition().z > -BoardZ
                     then
                    -- allies in this region?
                    end
                -- if dropped into play
                end

                if LastRegion == "" then
                    LastRegion = "out of play"
                end

                if Region == "" then
                    Region = "out of play"
                end

                -- update notes...
                Params.ArmyObj.setGMNotes("Region:" .. Region .. ";")
                if Params.Color ~= nil then
                    printToAll(
                        "\n" ..
                            Params.Color ..
                                " Player moved " ..
                                    Params.ArmyObj.getName() .. " from " .. LastRegion .. " to " .. Region .. ".",
                        Params.Color
                    )
                else
                    printToAll(
                        "\n" .. Params.ArmyObj.getName() .. " moved from " .. LastRegion .. " to " .. Region .. "."
                    )
                end
            end
        elseif Params.Event == "Collide" then
        elseif Params.Event == "Destroy" then
        end
    end
end

-- {MarkerObj=Obj,Event="Load",Color="",Info=collision_info}  Load|Pickup|Drop|Collide|Destroy
function SettlementControlMarkerEvent(Params)
    if Scripting then
        local Region = GetGridRegion({Position = Params.MarkerObj.getPosition()})
        local Control = ReadTag({Text = Params.MarkerObj.getGMNotes(), Var = "Control", Default = ""})
        if Region ~= "" then
            Params.MarkerObj.setName(Region)
            Params.MarkerObj.setDescription(
                "SettlementControlMarker;" .. Regions[Region].Settlement .. ";" .. Regions[Region].Side .. ";"
            ) -- SettlementControlMarker;[Settlement];[Side];
            if Params.MarkerObj.getRotation().z > 90 and Params.MarkerObj.getRotation().z < 270 then
                Regions[Region].Control = "FreePeoples"
            else
                Regions[Region].Control = "Shadow"
            end

            -- what type of event?
            if Params.Event == "Load" then
            elseif Params.Event == "Pickup" then
                Params.MarkerObj.setVar("PickedUp", true)
            elseif Params.Event == "Drop" then
                if Params.MarkerObj.getVar("PickedUp") then
                    Params.MarkerObj.setVar("PickedUp", false)
                -- remove picked up flag.
                end
            elseif Params.Event == "Collide" then
                -- control changed?
                if Control ~= Regions[Region].Control then
                    -- unconquered?
                    if Regions[Region].Control == Regions[Region].Side then
                        printToAll(
                            "\n" .. Region .. " is under " .. Regions[Region].Control .. " control (Unconquered)."
                        )
                    else
                        printToAll("\n" .. Region .. " is under " .. Regions[Region].Control .. " control (Conquered).")
                    end

                    -- KoME? and helms deep...
                    if KoME and Region == "Helm's Deep" then
                        -- if helms deep is now shadow controlled...
                        if Regions[Region].Control == "Shadow" then
                            -- if theoden ruler exists...
                            if getObjectFromGUID("51d8e0") ~= nil then
                                -- if theoden is corrupted...
                                if getObjectFromGUID("51d8e0").getName() == "Theoden: Corrupted Ruler" then
                                    CorruptHelmsDeep()
                                end
                            end
                        else -- restore helms deep to free peoples...
                            RestoreHelmsDeep()
                        end
                    -- if shadow controlled.
                    end

                    -- re-calc victory points...
                    CalcVictoryPoints()
                end
            elseif Params.Event == "Destroy" then
            end

            Params.MarkerObj.setGMNotes("Region:" .. Region .. ";Control:" .. Regions[Region].Control .. ";")
        end
    end
end

function CalcVictoryPoints()
    -- calculate victory points for both sides...
    VictoryPoints.FreePeoples = 0
    VictoryPoints.Shadow = 0
    for SCM, SCMObj in pairs(getAllObjects()) do
        if string.find(SCMObj.getDescription(), "SettlementControlMarker;") ~= nil then
            -- if under shadow control...
            if Regions[SCMObj.getName()].Control == "Shadow" then
                if Regions[SCMObj.getName()].Control == "Shadow" and Regions[SCMObj.getName()].Side == "FreePeoples" then
                    VictoryPoints.Shadow = VictoryPoints.Shadow + Regions[SCMObj.getName()].Points
                end
            else -- must be FreePeoples controlled
                if Regions[SCMObj.getName()].Control == "FreePeoples" and Regions[SCMObj.getName()].Side == "Shadow" then
                    VictoryPoints.FreePeoples = VictoryPoints.FreePeoples + Regions[SCMObj.getName()].Points
                end
            end
        end
    end

    if VictoryPoints.FreePeoples == 0 then
        getObjectFromGUID("d0b340").setPositionSmooth({-25.58, 1.01, -22.65}, false, false)
    elseif VictoryPoints.FreePeoples >= 10 then
        getObjectFromGUID("d0b340").setPositionSmooth({-7.2, 1.01, -22.65}, false, false)
    else
        -- free peoples victory marker.
        getObjectFromGUID("d0b340").setPositionSmooth(
            {-23 + VictoryPoints.FreePeoples * 1.58, 1.01, -22.65},
            false,
            false
        )
    end

    if VictoryPoints.Shadow == 0 then
        getObjectFromGUID("976dbc").setPositionSmooth({-25.58, 1.01, -23.65}, false, false)
    elseif VictoryPoints.Shadow >= 10 then
        getObjectFromGUID("976dbc").setPositionSmooth({-7.2, 1.01, -23.65}, false, false)
    else
        -- shadow victory marker.
        getObjectFromGUID("976dbc").setPositionSmooth({-23 + VictoryPoints.Shadow * 1.58, 1.01, -23.65}, false, false)
    end
end

-- {TokenObj=Obj,Event="Load"}  Load|Pickup|Drop|Collide|Destroy
function PoliticalTokenEvent(Params)
    if Scripting then
        local Nation = GetNationFromText(Params.TokenObj.getDescription())
        local Side = GetSideFromText(Nation)
        local Level = PoliticalTrack[Nation].Level
        local Active = PoliticalTrack[Nation].Active
        local Color = {1, 0.5, 0.5}
        if Side == "FreePeoples" then
            Color = {0.5, 0.5, 1}
        end

        if Params.Event == "Load" then
            for P, PI in pairs(PoliticalTrack) do
                if Params.TokenObj.getGUID() == PI.ID then
                    -- Active?
                    if Params.TokenObj.getRotation().z > 90 and Params.TokenObj.getRotation().z < 270 then
                        -- printToAll(Nation..": Active on the Political Track.",Color)
                        PoliticalTrack[Nation].Active = true
                    else
                        -- printToAll(Nation..": not Active on the Political Track.")
                        PoliticalTrack[Nation].Active = false
                    end

                    -- where on the track?
                    if Params.TokenObj.getPosition().z >= 2.5 then
                        PoliticalTrack[Nation].Level = 3
                        PoliticalTrack[Nation].AtWar = false
                    elseif Params.TokenObj.getPosition().z >= -1.2 then
                        PoliticalTrack[Nation].Level = 2
                        PoliticalTrack[Nation].AtWar = false
                    elseif Params.TokenObj.getPosition().z >= -4.6 then
                        PoliticalTrack[Nation].Level = 1
                        PoliticalTrack[Nation].AtWar = false
                    else
                        PoliticalTrack[Nation].Level = 0
                        PoliticalTrack[Nation].AtWar = true
                        printToAll(Nation .. " is At War on the Political Track.", Color)
                    end
                end
            end
        elseif Params.Event == "Pickup" then
            Params.TokenObj.setVar("PickedUp", true)
            Params.TokenObj.setVar("LastLevel", PoliticalTrack[Nation].Level)
        elseif Params.Event == "Drop" then
            if Params.TokenObj.getVar("PickedUp") then
                Params.TokenObj.setVar("PickedUp", false)
                -- remove picked up flag.
                -- where was it dropped onto the track?
                if Params.TokenObj.getPosition().z >= 2.5 then
                    PoliticalTrack[Nation].Level = 3
                    if Level ~= 3 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 3.")
                    end
                elseif Params.TokenObj.getPosition().z >= -1.2 then
                    PoliticalTrack[Nation].Level = 2
                    if Level ~= 2 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 2.")
                    end
                elseif Params.TokenObj.getPosition().z >= -4.6 then
                    PoliticalTrack[Nation].Level = 1
                    if Level ~= 1 then
                        printToAll(Nation .. " moved on the Political Track from " .. Level .. " to 1.")
                    end
                else -- token must have been dropped At War: flag and blow horn...
                    PoliticalTrack[Nation].Level = 0
                    PoliticalTrack[Nation].AtWar = true
                    printToAll(Nation .. " at War!")
                    if not PoliticalTrack[Nation].Active then
                        broadcastToAll(
                            "Warning: " .. Nation .. " was set to At-War, but was not Active yet.",
                            {1, 1, 0}
                        )
                    end

                    -- political level changed?  then sound the alarm!
                    if Params.TokenObj.getVar("LastLevel") ~= PoliticalTrack[Nation].Level then
                        if Nation == "Dwarves" then
                            -- Far Over...
                            Global.call("PlaySound", {ID = 24})
                        elseif Nation == "Elves" then
                            -- Elven Horn
                            Global.call("PlaySound", {ID = 22})
                        elseif Nation == "Gondor" then
                            -- For Gondor!
                            Global.call("PlaySound", {ID = 21})
                        elseif Nation == "North" then
                            -- North Horn
                            Global.call("PlaySound", {ID = 23})
                        elseif Nation == "Rohan" then
                            -- rohan horn
                            Global.call("PlaySound", {ID = 20})
                        elseif Nation == "Haradrim" then
                            -- haradrim horn
                            Global.call("PlaySound", {ID = 17})
                        elseif Nation == "Isengard" then
                            -- isengard horn
                            Global.call("PlaySound", {ID = 18})
                        elseif Nation == "Sauron" then
                            Global.call("PlaySound", {ID = 19})
                        -- sauron music
                        end
                    end
                end
            end
        elseif Params.Event == "Collide" then
            -- check to see if active status changed...
            if Params.TokenObj.getRotation().z > 90 and Params.TokenObj.getRotation().z < 270 and not Active then
                printToAll(Nation .. ": Activated!", Color)
                PoliticalTrack[Nation].Active = true
            elseif (Params.TokenObj.getRotation().z < 90 or Params.TokenObj.getRotation().z > 270) and Active then
                printToAll(Nation .. ": no longer Active.")
                PoliticalTrack[Nation].Active = false
            end
        elseif Params.Event == "Destroy" then
        end
    end
end

-- Params: {ID = "", Name = "", Type = "", Position = {x,y,z}, Rotation = {x,y,z}, Smooth = true}
function MoveObject(Params)
    local Obj = nil
    if getObjectFromGUID(Params.ID) ~= nil then
        Obj = getObjectFromGUID(Params.ID)
    else
        if Params.Name == nil then
            Params.Name = ""
        end

        if Params.Type == nil then
            Params.Type = ""
        end

        for SO, SubObj in pairs(getAllObjects()) do
            if
                Params.Name ~= "" and SubObj.getName() == Params.Name and
                    (Params.Type == "" or Params.Type == SubObj.type)
             then
                Obj = SubObj
                break
            end
        end
    end

    -- move the object if it was found...
    if Obj ~= nil then
        if Params.Smooth == true then
            Obj.setPositionSmooth(Params.Position, false, false)
            if Params.Rotation ~= nil then
                Obj.setRotationSmooth(Params.Rotation, false, false)
            end
        else -- not smooth...
            Obj.setPosition(Params.Position)
            if Params.Rotation ~= nil then
                Obj.setRotation(Params.Rotation)
            end
        end
    end
end

function StrongholdMenu(StrongholdObj)
    StrongholdObj.clearButtons()
    local FuncName = ""
    local ToolTip = ""
    if string.find(StrongholdObj.getDescription(), "Besieged;") ~= nil then
        StrongholdObj.createButton(
            {
                click_function = "StrongholdMenu",
                function_owner = Global,
                label = "Besieged",
                position = {0, 1.5, 0},
                rotation = {270, 0, 0},
                scale = {1, 1, 1},
                width = 0,
                height = 0,
                font_size = 500,
                font_color = {1, 1, 0, 0.95}
            }
        )
        FuncName = "EndSiege"
        ButtonLabel = "End Siege: " .. StrongholdObj.getName()
        ToolTip = "End Siege\n(" .. StrongholdObj.getName() .. ")"
    else
        FuncName = "StartSiege"
        ButtonLabel = "Besiege: " .. StrongholdObj.getName()
        ToolTip = "Retreat into Siege\n(" .. StrongholdObj.getName() .. ")"
    end

    StrongholdObj.createButton(
        {
            click_function = FuncName,
            function_owner = Global,
            label = "",
            tooltip = ToolTip,
            position = {0, 0.2, 0},
            scale = {1, 1, 1},
            width = 1400,
            height = 1400,
            color = {1, 1, 1, 0}
        }
    )
    local DstObj = getObjectFromGUID(StrongholdObj.getGMNotes())
    if DstObj ~= nil then
        DstObj.clearButtons()
        DstObj.createButton(
            {
                click_function = FuncName,
                function_owner = Global,
                label = ButtonLabel,
                tooltip = ToolTip,
                position = {2.1, 0, 0},
                rotation = {0, 270, 0},
                scale = {1, 1, 1},
                width = 1800,
                height = 250,
                font_size = 125,
                color = {1, 1, 1, 0.8}
            }
        )
        if string.find(DstObj.getDescription(), "Shadow;") ~= nil and StrongholdObj.getName() ~= "Erebor" then
            DstObj.createButton(
                {
                    click_function = "StrongholdMenu",
                    function_owner = Global,
                    label = StrongholdObj.getName(),
                    position = {0, 0.05, 2.2},
                    scale = {1, 1, 1},
                    width = 0,
                    height = 0,
                    font_size = 250,
                    font_color = {1, 1, 0}
                }
            )
        end
    end
end

function StartSiege(StrongholdObj)
    function StartSiegeCoroutine()
        local SiegeSpots = nil
        local SrcObj = nil
        local DstObj = nil
        -- src or dst?
        if string.find(StrongholdObj.getDescription(), "StrongholdBox;") ~= nil then
            SrcObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            DstObj = StrongholdObj
        else -- must be src...
            SrcObj = StrongholdObj
            DstObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            if DstObj == nil then
                -- get first open shadow stronghold dst...
                if getObjectFromGUID("f994cb").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f994cb")
                    SiegeSpots = {
                        {-30.8, 1.5, -10.2},
                        {-32, 1.5, -9.15},
                        {-30.8, 1.5, -9.15},
                        {-29.5, 1.5, -9.15},
                        {-32, 1.5, -10.2},
                        {-29.5, 1.5, -10.2},
                        {-32, 1.5, -11.25},
                        {-30.8, 1.5, -11.25},
                        {-29.5, 1.5, -11.25}
                    }
                elseif getObjectFromGUID("f84976").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f84976")
                    SiegeSpots = {
                        {-30.8, 1.5, -14.1},
                        {-32, 1.5, -13},
                        {-30.8, 1.5, -13},
                        {-29.5, 1.5, -13},
                        {-32, 1.5, -14.1},
                        {-29.5, 1.5, -14.1},
                        {-32, 1.5, -15.2},
                        {-30.8, 1.5, -15.2},
                        {-29.5, 1.5, -15.2}
                    }
                else -- none available...
                    printToAll("No available Shadow Strongholds.", {1, 1, 0})
                end
            end
        end

        if SrcObj ~= nil and DstObj ~= nil then
            if SiegeSpots == nil then
                SiegeSpots = SrcObj.getTable("SiegeSpots")
            end

            -- inventory region...
            local Side = ""
            local Units = {}
            local ArmyCount = 0
            -- which size controls the stronghold? (look for the matching marker).
            for O, Obj in pairs(getAllObjects()) do
                -- look for marker and units...
                if
                    Obj.getName() == SrcObj.getName() and
                        string.find(Obj.getDescription(), "SettlementControlMarker;") ~= nil
                 then
                    if Obj.getRotation().z > 90 and Obj.getRotation().z < 270 then
                        Side = "FreePeoples"
                    else
                        Side = "Shadow"
                    end

                    break
                end
            end

            coroutine.yield(0)
            if Side ~= "" then
                -- inventory units in the region...
                for O, Obj in pairs(getAllObjects()) do
                    -- is object in the correct region?
                    if
                        string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. ";") ~= nil or
                            string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. " Stronghold;") ~= nil
                     then
                        -- is object on the correct side?
                        if string.find(Obj.getDescription(), Side .. ";") ~= nil then
                            -- is it a unit, and if so, which type?  Looking for Regular;Elite;Leader;Character;Minion;
                            if
                                string.find(Obj.getDescription(), "Regular;") ~= nil or
                                    string.find(Obj.getDescription(), "Elite;") ~= nil
                             then
                                ArmyCount = ArmyCount + 1
                                table.insert(Units, Obj.getGUID())
                            elseif
                                string.find(Obj.getDescription(), "Leader;") ~= nil or
                                    string.find(Obj.getDescription(), "Character;") ~= nil or
                                    string.find(Obj.getDescription(), "Minion;") ~= nil
                             then
                                table.insert(Units, Obj.getGUID())
                            end
                        end
                    end
                end

                -- must be 5 or less army units...
                if #Units <= 0 then
                    printToAll("There are no Units to Retreat into Siege at " .. SrcObj.getName() .. ".", {1, 1, 0})
                elseif ArmyCount <= 5 then
                    local Height = 1.5
                    local Index = 0
                    SrcObj.setDescription("Stronghold;Besieged;")
                    for U = 1, #Units do
                        Index = Index + 1
                        if Index > #SiegeSpots then
                            Index = 1
                            Height = Height + 1.5
                        end

                        getObjectFromGUID(Units[U]).setPositionSmooth(
                            {SiegeSpots[Index][1], Height, SiegeSpots[Index][3]},
                            false,
                            false
                        )
                        getObjectFromGUID(Units[U]).setRotationSmooth({0, 90, 0}, false, true)
                        -- if not already in the Stronghold region square...
                        if
                            string.find(
                                getObjectFromGUID(Units[U]).getGMNotes(),
                                "Region:" .. SrcObj.getName() .. " Stronghold;"
                            ) == nil
                         then
                            -- change Region to Stronghold Box and update return info...
                            getObjectFromGUID(Units[U]).setGMNotes(
                                "Region:" ..
                                    SrcObj.getName() ..
                                        " Stronghold;PX:" ..
                                            string.format("%.3f", getObjectFromGUID(Units[U]).getPosition().x) ..
                                                ";PZ:" ..
                                                    string.format("%.3f", getObjectFromGUID(Units[U]).getPosition().z) ..
                                                        ";"
                            )
                        end

                        coroutine.yield(0)
                    end

                    coroutine.yield(0)
                    SrcObj.setGMNotes(DstObj.getGUID())
                    DstObj.setGMNotes(SrcObj.getGUID())
                else -- too many army units....
                    printToAll(
                        "Cannot Retreat into Siege at " ..
                            SrcObj.getName() .. " because there are more than 5 Army Units (" .. ArmyCount .. ").",
                        {1, 1, 0}
                    )
                end
            else -- could not determine which side controls the stronghold...
                print("Uhoh! Cannot find the Settlement Control Marker for: " .. SrcObj.getName() .. "!")
            end -- if side?
            StrongholdMenu(SrcObj)
        end

        return 1
    end

    startLuaCoroutine(Global, "StartSiegeCoroutine")
end

function EndSiege(StrongholdObj)
    function EndSiegeCoroutine()
        local SrcObj = nil
        local DstObj = nil
        -- src or dst?
        if string.find(StrongholdObj.getDescription(), "StrongholdBox;") ~= nil then
            SrcObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            DstObj = StrongholdObj
        else -- must be src...
            SrcObj = StrongholdObj
            DstObj = getObjectFromGUID(StrongholdObj.getGMNotes())
            if DstObj == nil then
                -- get first open shadow stronghold dst...
                if getObjectFromGUID("f994cb").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f994cb")
                    SiegeSpots = {
                        {-30.8, 1.5, -10.2},
                        {-32, 1.5, -9.15},
                        {-30.8, 1.5, -9.15},
                        {-29.5, 1.5, -9.15},
                        {-32, 1.5, -10.2},
                        {-29.5, 1.5, -10.2},
                        {-32, 1.5, -11.25},
                        {-30.8, 1.5, -11.25},
                        {-29.5, 1.5, -11.25}
                    }
                elseif getObjectFromGUID("f84976").getGMNotes() == "" then
                    DstObj = getObjectFromGUID("f84976")
                    SiegeSpots = {
                        {-30.8, 1.5, -14.1},
                        {-32, 1.5, -13},
                        {-30.8, 1.5, -13},
                        {-29.5, 1.5, -13},
                        {-32, 1.5, -14.1},
                        {-29.5, 1.5, -14.1},
                        {-32, 1.5, -15.2},
                        {-30.8, 1.5, -15.2},
                        {-29.5, 1.5, -15.2}
                    }
                else -- none available...
                    printToAll("Not Sieged.", {1, 1, 0})
                end
            end
        end

        if SrcObj ~= nil and DstObj ~= nil then
            -- ok to emerge if no enemy army units occupying...
            local Side = ""
            local EnemyUnits = {}
            local SiegedUnits = {}
            -- which size controls the stronghold? (look for the matching marker).
            for O, Obj in pairs(getAllObjects()) do
                -- look for marker and units...
                if
                    Obj.getName() == SrcObj.getName() and
                        string.find(Obj.getDescription(), "SettlementControlMarker;") ~= nil
                 then
                    if Obj.getRotation().z > 90 and Obj.getRotation().z < 270 then
                        Side = "FreePeoples"
                    else
                        Side = "Shadow"
                    end

                    break
                end
            end

            coroutine.yield(0)
            if Side ~= "" then
                -- inventory units in the region...
                for O, Obj in pairs(getAllObjects()) do
                    -- Shadow Stronghold box region?
                    if string.find(Obj.getGMNotes(), "Region:Shadow Stronghold 1;") ~= nil then
                        Obj.setGMNotes(
                            "Region:" ..
                                getObjectFromGUID(getObjectFromGUID("f994cb").getGMNotes()).getName() .. " Stronghold;"
                        )
                    elseif string.find(Obj.getGMNotes(), "Region:Shadow Stronghold 2;") ~= nil then
                        Obj.setGMNotes(
                            "Region:" ..
                                getObjectFromGUID(getObjectFromGUID("f84976").getGMNotes()).getName() .. " Stronghold;"
                        )
                    end

                    -- what is the object's region?
                    if string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. " Stronghold;") ~= nil then
                        -- sieged unit?
                        if
                            string.find(Obj.getDescription(), "Regular;") ~= nil or
                                string.find(Obj.getDescription(), "Elite;") ~= nil or
                                string.find(Obj.getDescription(), "Leader;") ~= nil or
                                string.find(Obj.getDescription(), "Character;") ~= nil or
                                string.find(Obj.getDescription(), "Minion;") ~= nil
                         then
                            table.insert(SiegedUnits, Obj.getGUID())
                        end
                    elseif string.find(Obj.getGMNotes(), "Region:" .. SrcObj.getName() .. ";") ~= nil then
                        -- enemy army unit?
                        if
                            string.find(Obj.getDescription(), Side .. ";") == nil and
                                (string.find(Obj.getDescription(), "Regular;") ~= nil or
                                    string.find(Obj.getDescription(), "Elite;") ~= nil)
                         then
                            table.insert(EnemyUnits, Obj.getGUID())
                        end
                    end
                end

                -- no sieged units?
                if #SiegedUnits <= 0 then
                    SrcObj.setDescription("Stronghold;")
                elseif #EnemyUnits > 0 then
                    printToAll(
                        "Cannot End Siege of " ..
                            SrcObj.getName() .. ", because Enemy Army Units are still present (" .. #EnemyUnits .. ").",
                        {1, 1, 0}
                    )
                else -- move sieged units back to board...
                    SrcObj.setDescription("Stronghold;")
                    for U = 1, #SiegedUnits do
                        -- has return position?
                        local PX =
                            ReadTag({Text = getObjectFromGUID(SiegedUnits[U]).getGMNotes(), Var = "PX", Default = ""})
                        local PZ =
                            ReadTag({Text = getObjectFromGUID(SiegedUnits[U]).getGMNotes(), Var = "PZ", Default = ""})
                        if PX == "" or PZ == "" then
                            getObjectFromGUID(SiegedUnits[U]).setPositionSmooth(
                                {SrcObj.getPosition().x - 0.7 + U * 0.2, U * 1.5, SrcObj.getPosition().z - 0.7},
                                false,
                                false
                            )
                        else
                            getObjectFromGUID(SiegedUnits[U]).setPositionSmooth(
                                {tonumber(PX), U * 1.5, tonumber(PZ)},
                                false,
                                false
                            )
                        end

                        getObjectFromGUID(SiegedUnits[U]).setGMNotes("Region:" .. SrcObj.getName() .. ";")
                    end

                    -- shadow stronghold?
                    if string.find(DstObj.getDescription(), "Shadow;") ~= nil and SrcObj.getName() ~= "Erebor" then
                        DstObj.setGMNotes("")
                        SrcObj.setGMNotes("")
                        DstObj.clearButtons()
                    end
                end
            else
                print("Uhoh! Cannot find the Settlement Control Marker for: " .. SrcObj.getName() .. "!")
            end

            coroutine.yield(0)
            StrongholdMenu(SrcObj)
        end

        return 1
    end

    startLuaCoroutine(Global, "EndSiegeCoroutine")
end

function DetectGuide()
    -- the guide should be the top card detected.  If no card is detected, look for a deck and return the top card...
    local HighestY = 0
    -- id of the highest detected card.
    local HighestID = ""
    -- highest character level to determine if guide is valid.
    local HighestLevel = 0
    local CardLevel = 0
    -- if a deck is detected, remember it's top card in case we don't find a highest card.
    local TopCardName = ""

    for _, Obj in pairs(
        Physics.cast(
            {
                origin = {32.9, 1, 20.0},
                direction = {0, 1, 0},
                type = 3,
                size = {1, 10, 1},
                orientation = {0, 0, 0},
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if Obj.hit_object.type == "Card" and (string.find(Obj.hit_object.getDescription(), "Companion;") ~= nil) then
            if Obj.hit_object.getPosition().y > HighestY then
                HighestY = Obj.hit_object.getPosition().y
                HighestID = Obj.hit_object.getGUID()
            end

            if getObjectFromGUID(HighestID) ~= nil then
                CardLevel =
                    tonumber(
                    ReadTag({Text = getObjectFromGUID(HighestID).getDescription(), Var = "Level", Default = "0"})
                )
            end

            if CardLevel > HighestLevel then
                HighestLevel = CardLevel
            end
        elseif Obj.hit_object.tag == "Deck" then
            -- get the top card...
            if Obj.hit_object ~= nil then
                if Obj.hit_object.getQuantity() > 1 then
                    TopCardName = Obj.hit_object.getObjects()[1].name
                    -- go through deck to find the highest level...

                    for I, Item in pairs(Obj.hit_object.getObjects()) do
                        CardLevel = tonumber(ReadTag({Text = Item.description, Var = "Level", Default = "0"}))
                        if CardLevel > HighestLevel then
                            HighestLevel = CardLevel
                        end
                    end
                end
            end
        end
    end
    
    Guide = ""
    GuildeLevel = 0
    if getObjectFromGUID(HighestID) ~= nil then
        TopCardName = getObjectFromGUID(HighestID).getName()
        if TopCardName ~= "" and TopCardName ~= "The Ring-bearers (Frodo & Samwise)" then
            Guide = TopCardName
            GuideLevel =
                tonumber(ReadTag({Text = getObjectFromGUID(HighestID).getDescription(), Var = "Level", Default = "0"}))
            -- printToAll("\n"..Guide.." (Level:"..GuideLevel..") is the Fellowship Guide.\n", {1,1,0})
            if Round ~= 0 and Guide ~= "Sméagol: Tamed Wretch" and HighestLevel > GuideLevel and RulesWarnings then
                broadcastToAll(
                    "Warning: There are Companions in the Fellowship with a higher level than the Guide.\n(The Guide should be Level: " ..
                        HighestLevel .. ").",
                    {1, 1, 0}
                )
            end
        end
    end

    if Guide == "" and Round > 0 then
        printToAll("Warning: Could not determine the Fellowship Guide!", {1, 1, 0})
    end

    return Guide
end

function FellowshipMenu()
    SearchingFellowship = false
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
    if CompactMode then
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = {0, 0, 2},
                rotation = {0, 0, 0},
                scale = {0.5, 0.5, 0.5},
                color = {0.8, 0.8, 1},
                font_color = {0, 0, 0},
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = {-37.5, 0, 16.7},
                rotation = {0, 0, 0},
                scale = {0.5, 0.5, 0.5},
                color = {0.8, 0.8, 1},
                font_color = {0, 0, 0},
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
    else
        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Search Fellowship",
                position = {0, 0, -2},
                rotation = {0, 0, 0},
                scale = {0.5, 0.5, 0.5},
                color = {0.8, 0.8, 1},
                font_color = {0, 0, 0},
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Search the Fellowship Cards."
            }
        )
    end

    -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.5,-2,26.5})
    -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.5,-2,26.5})
    -- inventory fellowship by counting figures...
    local CompanionCount = 0
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = {27.6, 1, 20.0},
                direction = {0, 1, 0},
                type = 3,
                size = {3, 5, 9.5},
                orientation = {0, 0, 0},
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            (Obj.hit_object.type == "Figurine" or Obj.hit_object.type == "Tileset") and
                string.find(Obj.hit_object.getDescription(), "Character;") ~= nil
         then
            CompanionCount = CompanionCount + 1
        end
    end

    -- no more companions?
    if CompanionCount < 1 then
        MoveObject({Name = "Gollum", Type = "Figurine", Position = {27.55, 2, 17.45}, Rotation = {0, 0, 0}})
        MoveObject(
            {Name = "Gollum: Slave of the Ring", Type = "Card", Position = {32.9, 2, 20.0}, Rotation = {0, 180, 0}}
        )
        Guide = "Gollum: Slave of the Ring"
        GuideLevel = 0
        CompanionCount = 1
    end

    DetectGuide()
    -- getObjectFromGUID(IDs.Cards.RingBearers).createButton({click_function="FellowshipMenu",function_owner=Global,label="Companions: "..CompanionCount,position={-2.4,0,1.9},rotation={0,0,0},scale={0.5,0.5,0.5},font_color={1,1,1},width=0,height=0,font_size=200})
    getObjectFromGUID(IDs.Cards.RingBearers).createButton(
        {
            click_function = "FellowshipMenu",
            function_owner = Global,
            label = tostring(CompanionCount),
            position = {-2.35, 0, -1.3},
            rotation = {0, 0, 0},
            scale = {0.5, 0.5, 0.5},
            font_color = {1, 1, 0.5},
            width = 0,
            height = 0,
            font_size = 500,
            tooltip = CompanionCount .. " Companions in the Fellowship."
        }
    )
    getObjectFromGUID(IDs.Cards.RingBearers).createButton(
        {
            click_function = "FellowshipMenu",
            function_owner = Global,
            label = Guide,
            position = {1.4, 0, 0},
            rotation = {0, 90, 0},
            scale = {0.5, 0.5, 0.5},
            font_color = {1, 1, 1},
            width = 0,
            height = 0,
            font_size = 200
        }
    )
end

function SearchFellowship(ButtonObj, PlayerColor)
    function SearchFellowshipCoroutine()
        SearchingFellowship = true
        local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
        getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
        local Index = 0
        local List = {}
        local Order = {"Gandalf", "Strider", "Boromir", "Legolas", "Gimli", "Meriadoc", "Peregrin", "Sméagol", "Gollum"}
        local Rotation = {80, 0, 0}
        if CompactMode then
            -- getObjectFromGUID(FellowshipRedZoneID).setPosition({-36.35,1.6,-25.5})
            -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({-36.35,1.6,-25.5})
            Rotation = {80, 180, 0}
        else
            -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.35,1.6,26.5})
            -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.35,1.6,26.5})
        end

        DetectGuide()
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = {32.9, 1, 20.0},
                    direction = {0, 1, 0},
                    type = 3,
                    size = {5, 1, 9.5},
                    orientation = {0, 0, 0},
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if Obj.hit_object.type == "Card" and Obj.hit_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" then
                Index = Index + 1
                Obj.hit_object.setHiddenFrom({"Red", "Yellow"})
                Obj.hit_object.setPositionSmooth(Spots.CompanionCards.Searched[Index], false, true)
                Obj.hit_object.setRotationSmooth(Rotation, false, true)
                Obj.hit_object.setLock(true)
                table.insert(List, Obj.hit_object.getGUID())
                FellowshipCardMenu(Obj.hit_object)
                coroutine.yield(0)
            elseif Obj.hit_object.type == "Deck" then
                for I, Item in pairs(Obj.hit_object.getObjects()) do
                    Index = Index + 1
                    local CardObj =
                        Obj.hit_object.takeObject(
                        {smooth = true, position = Spots.CompanionCards.Searched[Index], rotation = Rotation}
                    )
                    CardObj.setHiddenFrom({"Red", "Yellow"})
                    CardObj.setLock(true)
                    CardObj.setPositionSmooth(Spots.CompanionCards.Searched[Index], false, true)
                    CardObj.setRotationSmooth(Rotation, false, true)
                    table.insert(List, CardObj.getGUID())
                    FellowshipCardMenu(CardObj)
                end
                coroutine.yield(0)
            end
        end

        Index = 0

        local ButtonPosition = {0, 0, -2.5}
        if CompactMode then
            ButtonPosition = {-37.5, 0, 16.7}
        end

        getObjectFromGUID(IDs.Cards.RingBearers).createButton(
            {
                click_function = "BuildFellowshipDeck",
                function_owner = Global,
                label = "Done",
                position = ButtonPosition,
                rotation = {0, 0, 0},
                scale = {0.5, 0.5, 0.5},
                color = {0.8, 0.8, 1},
                font_color = {0, 0, 0},
                width = 1800,
                height = 400,
                font_size = 200,
                tooltip = "Build the Fellowship Deck."
            }
        )
        return 1
    end

    if PlayerColor == "Red" then
        printToAll("Sauron cannot search the Fellowship.", {1, 1, 0})
    elseif PlayerColor == "Yellow" then
        printToAll("Saruman cannot search the Fellowship.", {1, 1, 0})
    else
        startLuaCoroutine(Global, "SearchFellowshipCoroutine")
    end
end

function FellowshipCardMenu(CardObj)
    -- buttons...
    CardObj.clearButtons()
    -- guide?
    if Guide == CardObj.getName() then
        CardObj.createButton(
            {
                click_function = "SearchFellowship",
                function_owner = Global,
                label = "Fellowship Guide",
                position = {0, 0.2, -1.42},
                scale = {0.5, 0.5, 0.5},
                font_color = {1, 1, 0},
                width = 0,
                height = 0,
                font_size = 200
            }
        )
    elseif tonumber(ReadTag({Text = CardObj.getDescription(), Var = "Level", Default = "0"})) >= GuideLevel then
        CardObj.createButton(
            {
                click_function = "GuideTheFellowship",
                function_owner = Global,
                label = "Become the Guide",
                position = {0, 0.2, -1.42},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1, 0.9},
                font_color = {0, 0, 0},
                width = 1800,
                height = 250,
                font_size = 200,
                tooltip = "Set " .. CardObj.getName() .. " as the New Fellowship Guide."
            }
        )
    else
        CardObj.createButton(
            {
                click_function = "GuideTheFellowship",
                function_owner = Global,
                label = "Become the Guide",
                position = {0, 0.2, -1.42},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1, 0.6},
                font_color = {0, 0, 0},
                width = 1800,
                height = 250,
                font_size = 200,
                tooltip = "Set " .. CardObj.getName() .. " as the New Fellowship Guide.\n(Level is too low)."
            }
        )
    end

    if CardObj.getName() ~= "Gollum: Slave of the Ring" then
        CardObj.createButton(
            {
                click_function = "SeparateCardFromFellowship",
                function_owner = Global,
                label = "Separate",
                position = {-0.2, 0.2, 1.1},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1, 0.9},
                font_color = {0, 0, 0},
                width = 1100,
                height = 250,
                font_size = 200,
                tooltip = "Seperate " .. CardObj.getName() .. " from the Fellowship."
            }
        )
        CardObj.createButton(
            {
                click_function = "ConfirmCompanionDeath",
                function_owner = Global,
                label = "Dead",
                position = {-0.2, 0.2, 1.4},
                scale = {0.5, 0.5, 0.5},
                color = {1, 1, 1, 0.9},
                font_color = {0, 0, 0},
                width = 1100,
                height = 250,
                font_size = 200,
                tooltip = "Kill " .. CardObj.getName() .. "."
            }
        )
    end
end

function ConfirmCompanionDeath(CardObj)
    -- buttons...
    CardObj.clearButtons()
    CardObj.createButton(
        {
            click_function = "ConfirmCompanionDeath",
            function_owner = Global,
            label = "Dead?",
            position = {0, 0.2, 1.4},
            scale = {0.5, 0.5, 0.5},
            font_color = {1, 1, 0},
            width = 0,
            height = 0,
            font_size = 200
        }
    )
    CardObj.createButton(
        {
            click_function = "KillCompanionCard",
            function_owner = Global,
            label = "Yes",
            position = {0.7, 0.2, 1.4},
            scale = {0.5, 0.5, 0.5},
            color = {1, 1, 1, 0.9},
            font_color = {0, 0, 0},
            width = 500,
            height = 250,
            font_size = 200,
            tooltip = "YES: " .. CardObj.getName() .. " is dead."
        }
    )
    CardObj.createButton(
        {
            click_function = "FellowshipCardMenu",
            function_owner = Global,
            label = "No",
            position = {-0.7, 0.2, 1.4},
            scale = {0.5, 0.5, 0.5},
            color = {1, 1, 1, 0.9},
            font_color = {0, 0, 0},
            width = 500,
            height = 250,
            font_size = 200,
            tooltip = "NO: " .. CardObj.getName() .. " is not dead."
        }
    )
end

function KillCompanionCard(CardObj)
    -- Kill this Companion, and remove from the game...
    printToAll(CardObj.getName() .. " has died.", {1, 1, 0})
    -- guide died?
    if Guide == CardObj.getName() then
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CardObj.getName(), Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    {guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition()}
                )
            )
            break
        end
    end

    -- remove any buttons from card...
    CardObj.clearButtons()
    CardObj.setHiddenFrom()
    CardObj.setLock(false)
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
    -- CardObj.setDescription(string.gsub(CardObj.getDescription(),"Dead;","").."Dead;")
    -- try to locate the figure and remove it...
    for O, Obj in pairs(getAllObjects()) do
        -- if Obj.getName() == "Boromir" then print(Obj.getName(),":",Obj.getGUID(),":",Obj.type) end
        if Obj.getName() == "Gandalf the Grey" then
            PlaySound({ID = 6})
        -- sorrow
        end

        if
            (Obj.type == "Figurine" or Obj.type == "Tileset") and string.find(CardObj.getName(), Obj.getName()) ~= nil and
                string.find(Obj.getDescription(), "Companion;") ~= nil
         then
            getObjectFromGUID("416864").putObject(Obj)
            break
        end
    end

    -- remove the card from the game...
    getObjectFromGUID("416864").putObject(CardObj)
    -- refresh fellowship menu?
    if not SearchingFellowship then
        FellowshipMenu()
    end
end

function GuideTheFellowship(CardObj)
    Guide = CardObj.getName()
    GuideLevel = tonumber(ReadTag({Text = CardObj.getDescription(), Var = "Level", Default = 0}))
    -- broadcastToAll(Guide.." (Level:"..GuideLevel..") is now the Fellowship Guide.", {1,1,0})
    
    for O, Obj in pairs(getAllObjects()) do
        if Obj.type == "Card" and string.find(Obj.getDescription(), "Fellowship;") ~= nil then
            -- buttons...
            Obj.clearButtons()
            -- guide?
            if Guide == Obj.getName() then
                Obj.createButton(
                    {
                        click_function = "SearchFellowship",
                        function_owner = Global,
                        label = "Fellowship Guide",
                        position = {0, 0.2, -1.42},
                        scale = {0.5, 0.5, 0.5},
                        font_color = {1, 1, 0},
                        width = 0,
                        height = 0,
                        font_size = 200
                    }
                )
            elseif tonumber(ReadTag({Text = Obj.getDescription(), Var = "Level", Default = "0"})) >= GuideLevel then
                Obj.createButton(
                    {
                        click_function = "GuideTheFellowship",
                        function_owner = Global,
                        label = "Become the Guide",
                        position = {0, 0.2, -1.42},
                        scale = {0.5, 0.5, 0.5},
                        color = {1, 1, 1, 0.9},
                        font_color = {0, 0, 0},
                        width = 1800,
                        height = 250,
                        font_size = 200,
                        tooltip = "Set " .. Obj.getName() .. " as the New Fellowship Guide."
                    }
                )
            else
                Obj.createButton(
                    {
                        click_function = "GuideTheFellowship",
                        function_owner = Global,
                        label = "Become the Guide",
                        position = {0, 0.2, -1.42},
                        scale = {0.5, 0.5, 0.5},
                        color = {1, 1, 1, 0.6},
                        font_color = {0, 0, 0},
                        width = 1800,
                        height = 250,
                        font_size = 200,
                        tooltip = "Set " .. Obj.getName() .. " as the New Fellowship Guide.\n(Level is too low)."
                    }
                )
            end

            Obj.createButton(
                {
                    click_function = "SeparateCardFromFellowship",
                    function_owner = Global,
                    label = "Separate",
                    position = {-0.2, 0.2, 1.2},
                    scale = {0.5, 0.5, 0.5},
                    color = {1, 1, 1, 0.9},
                    font_color = {0, 0, 0},
                    width = 1100,
                    height = 250,
                    font_size = 200,
                    tooltip = "Seperate " .. Obj.getName() .. " from the Fellowship."
                }
            )
        end
    end
end

function SeparateCompanionFromFellowship(CompanionName)
    -- describe action to players...
    printToAll(CompanionName .. " separated from the Fellowship.", {0.4, 0.4, 1})
    if string.find(Guide, CompanionName) ~= nil then
        printToAll(Guide .. " is no longer the Fellowship Guide.", {1, 1, 0})
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CompanionName, Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    {guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition()}
                )
            )
            break
        end
    end

    -- locate the card. If it's in the fellowship box or line up, then separate it...
    local CardObj = nil
    -- in the fellowship lineup?
    for O, Obj in pairs(getAllObjects()) do
        if
            Obj.type == "Card" and string.find(Obj.getName(), CompanionName) ~= nil and
                string.find(Obj.getDescription(), "Fellowship;") ~= nil
         then
            CardObj = Obj
            break
        end
    end

    -- if not found, then look in the fellowship card stack...
    if CardObj == nil then
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = {32.9, 1, 20.0},
                    direction = {0, 1, 0},
                    type = 3,
                    size = {5, 1, 9.5},
                    orientation = {0, 0, 0},
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if
                Obj.hit_object.type == "Card" and string.find(Obj.hit_object.getName(), CompanionName) ~= nil and
                    string.find(Obj.hit_object.getDescription(), "Companion;") ~= nil
             then
                CardObj = Obj.hit_object
                break
            elseif Obj.hit_object.type == "Deck" then
                for I, Item in pairs(Obj.hit_object.getObjects()) do
                    if string.find(Item.name, CompanionName) ~= nil then
                        CardObj = Obj.hit_object.takeObject({guid = Item.guid})
                        break
                    end
                end
            end
        end
    end

    if CardObj ~= nil then
        -- get first open companion card spot...
        local Open = true -- assume true until proven false.
        local OpenSpot = Spots.CompanionCards.Separated[1]
        for S = 1, #Spots.CompanionCards.Separated do
            Open = true -- assume true until proven false.
            for O, Obj in pairs(
                Physics.cast(
                    {
                        origin = Spots.CompanionCards.Separated[S],
                        direction = {0, 1, 0},
                        type = 3,
                        size = {1, 1, 1},
                        orientation = {0, 0, 0},
                        max_distance = 0,
                        debug = false
                    }
                )
            ) do
                if Obj.hit_object.type == "Card" or Obj.hit_object.type == "Deck" then
                    Open = false
                    break
                end
            end

            if Open then
                OpenSpot = Spots.CompanionCards.Separated[S]
                break
            end
        end

        -- remove any buttons from card...
        CardObj.clearButtons()
        CardObj.setHiddenFrom()
        -- move card from fellowship deck (or lineup) to the table face up...
        CardObj.setLock(false)
        if CompactMode then
            CardObj.setRotationSmooth({0, 180, 0}, false, false)
        else
            CardObj.setRotationSmooth({0, 0, 0}, false, false)
        end

        -- CardObj.setPositionSmooth(OpenSpot,false,false)
        CardObj.setPosition(OpenSpot)
        -- remove fellowship; tag and add Separated; tag to the card...
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", "") .. "Separated;")
    end

    if not SearchingFellowship then
        FellowshipMenu()
    end

    return CardObj
end

function ReturnCompanionToFellowship(CompanionObj)
    -- CompantionObj is a figure dropped into the fellowhip box...
    printToAll(CompanionObj.getName() .. " has joined the Fellowship.", {1, 1, 0})
    -- does Gollum flee?
    if Guide == "Gollum: Slave of the Ring" then
        printToAll("Gollum flees the Fellowship!")
        MoveObject(
            {Name = "Gollum", Type = "Figurine", Position = {39.5, 1.1, 20.0}, Rotation = {0, 0, 0}, smooth = true}
        )
        MoveObject(
            {
                Name = "Gollum: Slave of the Ring",
                Type = "Card",
                Position = {39.5, 0.97, 20.0},
                Rotation = {0, 180, 180},
                smooth = true
            }
        )
        Guide = ""
        GuideLevel = 0
    end

    -- return token to fellowship bag(416864 to 043c9c)...
    for I, Item in pairs(getObjectFromGUID("416864").getObjects()) do
        if
            string.find(CompanionObj.getName(), Item.name) ~= nil and
                string.find(Item.description, "Counter;Companion;") ~= nil
         then
            getObjectFromGUID("043c9c").putObject(
                getObjectFromGUID("416864").takeObject(
                    {guid = Item.guid, smooth = true, position = getObjectFromGUID("043c9c").getPosition()}
                )
            )
            break
        end
    end

    -- check for the token on the table if not in the bag...
    for O, Obj in pairs(getAllObjects()) do
        if
            string.find(CompanionObj.getName(), Obj.getName()) ~= nil and
                string.find(Obj.getDescription(), "Counter;Companion;") ~= nil
         then
            getObjectFromGUID("043c9c").putObject(Obj)
            break
        end
    end

    -- look for a matching card tagged with seperated; on the table or smeagol card if its him...
    local CardObj = nil
    for O, Obj in pairs(getAllObjects()) do
        if
            Obj.type == "Card" and string.find(Obj.getName(), CompanionObj.getName()) ~= nil and
                string.find(Obj.getDescription(), "Separated;") ~= nil
         then
            CardObj = Obj
            break
        elseif Obj.type == "Card" and CompanionObj.getName() == "Sméagol" and Obj.getName() == "Sméagol: Tamed Wretch" then
            Guide = "Sméagol: Tamed Wretch"
            printToAll("Sméagol is now the Fellowship guide.", {1, 1, 0})
            CardObj = Obj
            break
        elseif
            Obj.type == "Card" and CompanionObj.getName() == "Gollum" and Obj.getName() == "Gollum: Slave of the Ring"
         then
            CardObj = Obj
            break
        end
    end

    if CardObj ~= nil then
        -- remove separated; tag and add fellowship; tag to the card...
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", ""))
        CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", "") .. "Fellowship;")
        if CardObj.getName() == "Sméagol: Tamed Wretch" then
            BuildFellowshipDeck()
        else
            -- lift up fellowship cards...
            for O, Obj in pairs(
                Physics.cast(
                    {
                        origin = {32.9, 1, 20.0},
                        direction = {0, 1, 0},
                        type = 3,
                        size = {5, 1, 9.5},
                        orientation = {0, 0, 0},
                        max_distance = 0,
                        debug = false
                    }
                )
            ) do
                if Obj.hit_object.type == "Card" and Obj.hit_object.getName() ~= "The Ring-bearers (Frodo & Samwise)" then
                    Obj.hit_object.setPositionSmooth(
                        {
                            Obj.hit_object.getPosition().x,
                            Obj.hit_object.getPosition().y + 1,
                            Obj.hit_object.getPosition().z
                        },
                        false,
                        false
                    )
                end
            end

            -- place the card back into the fellowship...
            CardObj.setPosition({32.9, 1.01, 20.0})
            CardObj.setRotation({0, 180, 180})
            printToAll(CompanionObj.getName() .. "'s Card was placed into the Fellowship card stack.")
        end
    end

    if not SearchingFellowship then
        FellowshipMenu()
    end
end

function SeparateCardFromFellowship(CardObj)
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    local RBObj = getObjectFromGUID(IDs.Companions.TheRingBearers)
    local SeparateRegion = ReadTag({Text = RBObj.getGMNotes(), Var = "Region", Default = "(Unknown Region)"})
    local FellowshipTrack = math.floor((getObjectFromGUID("6b62ef").getPosition().x - 5.0) / 1.58)
    -- remove buttons from card...
    CardObj.clearButtons()
    CardObj.setHiddenFrom()
    -- describe action to players...
    printToAll(
        CardObj.getName() ..
            " separated from the Fellowship at " ..
                SeparateRegion .. ".\n(Fellowship Track was at: " .. FellowshipTrack .. ").",
        {0.4, 0.4, 1}
    )
    if Guide == CardObj.getName() then
        printToAll(CardObj.getName() .. " is no longer the Fellowship Guide.", {1, 1, 0})
        Guide = ""
        GuideLevel = 0
    end

    -- remove token from bag
    for I, Item in pairs(getObjectFromGUID("043c9c").getObjects()) do
        if string.find(CardObj.getName(), Item.name) ~= nil then
            getObjectFromGUID("416864").putObject(
                getObjectFromGUID("043c9c").takeObject(
                    {guid = Item.guid, smooth = true, position = getObjectFromGUID("416864").getPosition()}
                )
            )
            break
        end
    end

    -- get first open companion card spot...
    local Open = true -- assume true until proven false.
    local OpenSpot = Spots.CompanionCards.Separated[1]
    for S = 1, #Spots.CompanionCards.Separated do
        Open = true -- assume true until proven false.
        for O, Obj in pairs(
            Physics.cast(
                {
                    origin = Spots.CompanionCards.Separated[S],
                    direction = {0, 1, 0},
                    type = 3,
                    size = {1, 1, 1},
                    orientation = {0, 0, 0},
                    max_distance = 0,
                    debug = false
                }
            )
        ) do
            if Obj.hit_object.type == "Card" or Obj.hit_object.type == "Deck" then
                Open = false
                break
            end
        end

        if Open then
            OpenSpot = Spots.CompanionCards.Separated[S]
            break
        end
    end

    -- move card from fellowship deck (or lineup) to the table face up...
    CardObj.setLock(false)
    if CompactMode then
        CardObj.setRotationSmooth({0, 180, 0}, false, false)
    else
        CardObj.setRotationSmooth({0, 0, 0}, false, false)
    end

    CardObj.setPositionSmooth(OpenSpot, false, false)
    -- remove fellowship; tag and add Separated; tag to the card...
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Fellowship;", ""))
    CardObj.setDescription(string.gsub(CardObj.getDescription(), "Separated;", "") .. "Separated;")
    -- move and ping matching figurine if it is in the fellowship box...
    local FigureObj = nil
    for O, Obj in pairs(
        Physics.cast(
            {
                origin = {27.6, 1, 20.0},
                direction = {0, 1, 0},
                type = 3,
                size = {3, 1, 9.5},
                orientation = {0, 0, 0},
                max_distance = 0,
                debug = false
            }
        )
    ) do
        if
            string.find(CardObj.getName(), Obj.hit_object.getName()) ~= nil and
                (Obj.hit_object.type == "Figurine" or Obj.hit_object.type == "Tileset") and
                string.find(Obj.hit_object.getDescription(), "Character;") ~= nil
         then
            Obj.hit_object.setPositionSmooth({OpenSpot[1], 1.1, OpenSpot[3] - 5}, false, false)
            Obj.hit_object.setRotationSmooth({0, 0, 0}, false, false)
            if Player["Blue"].seated then
                Player["Blue"].pingTable({OpenSpot[1], 1.1, OpenSpot[3] - 5})
            end

            printToAll("Place " .. CardObj.getName() .. " Figurine on the game board.", {0.4, 0.4, 1})
            break
        end
    end
end

function BuildFellowshipDeck()
    local IDs = getObjectFromGUID(GamePanelID).getTable("IDs")
    getObjectFromGUID(IDs.Cards.RingBearers).clearButtons()
    local Index = 0
    for O, Obj in pairs(getAllObjects()) do
        if Obj.type == "Card" and string.find(Obj.getDescription(), "Fellowship;") ~= nil then
            Index = Index + 1
            Obj.clearButtons()
            Obj.setHiddenFrom()
            if Obj.getName() == Guide then
                Obj.setPositionSmooth({32.9, 5, 20.0}, false, true)
                Obj.setRotation({0, 180, 0})
                Obj.setLock(false)
            else
                Obj.setPositionSmooth({32.9, 1 + Index * 0.2, 20.0}, false, true)
                Obj.setRotation({0, 180, 180})
                Obj.setLock(false)
            end
        end
    end

    -- getObjectFromGUID(FellowshipRedZoneID).setPosition({36.5,-2,26.5})
    -- getObjectFromGUID(FellowshipYellowZoneID).setPosition({36.5,-2,26.5})
    Wait.time(FellowshipMenu, 2)
end

-- {DiceID=""}
function InsertActionRoll(Params)
    -- only insert this dice roll if it did not already roll in this batch...
    local Dupe = false
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RolledTable[R] == Params.DiceID then
            Dupe = true
            break
        end
    end
    
    if not Dupe then
        table.insert(Dice.Action[Side].RollingTable, Params.DiceID)
        table.insert(Dice.Action[Side].RolledTable, Params.DiceID)
        if not Dice.Action[Side].Rolling then
            RollActionDice(Side)
        end
    end
end

-- {DiceID=""}
function DeleteActionRoll(Params)
    -- remove this dice from roll tables...
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RollingTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RollingTable, R)
            break
        end
    end
    
    for R = 1, #Dice.Action[Side].RolledTable do
        if Dice.Action[Side].RolledTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RolledTable, R)
            break
        end
    end
    
end

-- {DiceID=""}
function ReportActionRoll(Params)
    -- remove this dice from rolling table and report result...
    local Side = getObjectFromGUID(Params.DiceID).getVar("Side")
    for R = 1, #Dice.Action[Side].RollingTable do
        if Dice.Action[Side].RollingTable[R] == Params.DiceID then
            table.remove(Dice.Action[Side].RollingTable, R)
            table.insert(Dice.Action[Side].ResultTable, getObjectFromGUID(Params.DiceID).getRotationValue())
            break
        end
    end
    
end

function RollActionDice(Side)
    function RollingActionDiceCoroutine()
        -- start this coroutine when any of this player's action dice start rolling...
        -- signal this player is rolling a batch of their dice...
        Dice.Action[Side].Rolling = true
        -- clear results table, we're collecting a new results table now...
        Dice.Action[Side].ResultTable = {}
        -- keep looping until all rolling dice come to rest...
        while #Dice.Action[Side].RollingTable > 0 do
            coroutine.yield(0)
        end
        -- while
        local SideName = "Shadow"
        if Side == "Shadow" then
            DiceColor = {1, 0.4, 0.4}
        else -- assume FPP...
            DiceColor = {0.4, 0.4, 1}
            SideName = "Free Peoples"
        end

        -- display this batch of dice roll results...
        printToAll("-- -- -- ", DiceColor)
        if #Dice.Action[Side].RolledTable == 1 then
            Dice.Action[Side].ResultText =
                SideName ..
                " Player rolled an Action Die: [" ..
                    getObjectFromGUID(Dice.Action[Side].RolledTable[1]).getRotationValue() .. "]"
            UpdateDiceStats({Result = Dice.Action[Side].ResultTable[1], Type = "Action", Side = Side})
        else
            
            Dice.Action[Side].ResultText =
                SideName .. " Player rolled " .. #Dice.Action[Side].RolledTable .. " Action Dice:\n"
            for R = 1, #Dice.Action[Side].ResultTable do
                Dice.Action[Side].ResultText =
                    Dice.Action[Side].ResultText .. "[" .. Dice.Action[Side].ResultTable[R] .. "]  "
                UpdateDiceStats({Result = Dice.Action[Side].ResultTable[R], Type = "Action", Side = Side})
            end
        end

        broadcastToAll(Dice.Action[Side].ResultText, DiceColor)
        printToAll("\n")
        -- clear Tables...
        Dice.Action[Side].RollingTable = {}
        Dice.Action[Side].RolledTable = {}
        -- signal this player is done rolling this batch of dice...
        Dice.Action[Side].Rolling = false
        return 1
    end

    startLuaCoroutine(Global, "RollingActionDiceCoroutine")
end

-- {Result=1|2|3|4|5|6|FaceName",Type="Action|Combat|Faction|Special",Side="FreePeoples|Shadow"}
function UpdateDiceStats(Params)
    if Params.Type == "Action" then
        Dice.Stats[Params.Type][Params.Side].RollCount = Dice.Stats[Params.Type][Params.Side].RollCount + 1
        if Dice.Stats[Params.Type][Params.Side].Results[Params.Result] == nil then
            Dice.Stats[Params.Type][Params.Side].Results[Params.Result] = 1
        else
            Dice.Stats[Params.Type][Params.Side].Results[Params.Result] =
                Dice.Stats[Params.Type][Params.Side].Results[Params.Result] + 1
        end
    elseif Params.Type == "Combat" then
        Dice.Stats[Params.Type][Params.Side].RollCount = Dice.Stats[Params.Type][Params.Side].RollCount + 1
        Dice.Stats[Params.Type][Params.Side].Results[tonumber(Params.Result)] =
            Dice.Stats[Params.Type][Params.Side].Results[tonumber(Params.Result)] + 1
    elseif Params.Type == "Faction" then
    end
end

function DisplayDiceStats(Params)
    -- this function allows calls from other objects.
    ReportDiceStats(nil, Params.PlayerColor)
end

function ReportDiceStats(PanelObj, PlayerColor)
    if not Player[PlayerColor].seated then
        -- this player color is not seated.
        printToAll(PlayerColor .. " Player is not seated.")
    else -- print to player color only...
        printToColor("-- -- -- ", PlayerColor, {0.4, 0.4, 1})
        printToColor("Free Peoples Combat Dice Stats:", PlayerColor, {0.4, 0.4, 1})
        if Dice.Stats.Combat.FreePeoples.RollCount > 0 then
            for D = 1, 6 do
                printToColor(
                    " " ..
                        D ..
                            ": " ..
                                string.format(
                                    "%.1f",
                                    100 * Dice.Stats.Combat.FreePeoples.Results[D] /
                                        Dice.Stats.Combat.FreePeoples.RollCount
                                ) ..
                                    "% (" ..
                                        Dice.Stats.Combat.FreePeoples.Results[D] ..
                                            "/" .. Dice.Stats.Combat.FreePeoples.RollCount .. ")",
                    PlayerColor,
                    {0.4, 0.4, 1}
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Combat Rolls).", PlayerColor, {0.4, 0.4, 1})
        end

        printToColor("-- -- -- ", PlayerColor, {1, 0.4, 0.4})
        printToColor("Shadow Combat Dice Stats:", PlayerColor, {1, 0.4, 0.4})
        if Dice.Stats.Combat.Shadow.RollCount > 0 then
            for D = 1, 6 do
                printToColor(
                    " " ..
                        D ..
                            ": " ..
                                string.format(
                                    "%.1f",
                                    100 * Dice.Stats.Combat.Shadow.Results[D] / Dice.Stats.Combat.Shadow.RollCount
                                ) ..
                                    "% (" ..
                                        Dice.Stats.Combat.Shadow.Results[D] ..
                                            "/" .. Dice.Stats.Combat.Shadow.RollCount .. ")",
                    PlayerColor,
                    {1, 0.4, 0.4}
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Combat Rolls).", PlayerColor, {1, 0.4, 0.4})
        end

        printToColor("-- -- -- ", PlayerColor, {0.4, 0.4, 1})
        printToColor("Free Peoples Action Dice Stats:", PlayerColor, {0.4, 0.4, 1})
        if Dice.Stats.Action.FreePeoples.RollCount > 0 then
            for Face, Count in pairs(Dice.Stats.Action.FreePeoples.Results) do
                printToColor(
                    " " ..
                        Face ..
                            ": " ..
                                string.format("%.1f", 100 * Count / Dice.Stats.Action.FreePeoples.RollCount) ..
                                    "% (" .. Count .. "/" .. Dice.Stats.Action.FreePeoples.RollCount .. ")",
                    PlayerColor,
                    {0.4, 0.4, 1}
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Action Rolls).", PlayerColor, {0.4, 0.4, 1})
        end

        printToColor("-- -- -- ", PlayerColor, {1, 0.4, 0.4})
        printToColor("Shadow Action Dice Stats:", PlayerColor, {1, 0.4, 0.4})
        if Dice.Stats.Action.Shadow.RollCount > 0 then
            for Face, Count in pairs(Dice.Stats.Action.Shadow.Results) do
                printToColor(
                    " " ..
                        Face ..
                            ": " ..
                                string.format("%.1f", 100 * Count / Dice.Stats.Action.Shadow.RollCount) ..
                                    "% (" .. Count .. "/" .. Dice.Stats.Action.Shadow.RollCount .. ")",
                    PlayerColor,
                    {1, 0.4, 0.4}
                )
            end
        else -- no combat rolls yet.
            printToColor("  (Zero Action Rolls).", PlayerColor, {1, 0.4, 0.4})
        end

        -- print blank line for spacing...
        printToColor("\n", PlayerColor, {1, 0.4, 0.4})
    end
end

function DiscardCard(CardObj)
    local DiscardObj = nil
    if string.find(CardObj.getDescription(), "Shadow;") ~= nil then
        if string.find(CardObj.getDescription(), "Character;") ~= nil then
            DiscardObj = getObjectFromGUID("61c02b")
        elseif string.find(CardObj.getDescription(), "Strategy;") ~= nil then
            DiscardObj = getObjectFromGUID("61c02b")
        elseif string.find(CardObj.getDescription(), "Faction;") ~= nil then
            DiscardObj = getObjectFromGUID("bbab30")
        end
    elseif string.find(CardObj.getDescription(), "FreePeoples;") ~= nil then
        if string.find(CardObj.getDescription(), "Character;") ~= nil then
            DiscardObj = getObjectFromGUID("b18c8a")
        elseif string.find(CardObj.getDescription(), "Strategy;") ~= nil then
            DiscardObj = getObjectFromGUID("b18c8a")
        elseif string.find(CardObj.getDescription(), "Faction;") ~= nil then
            DiscardObj = getObjectFromGUID("2d4c4f")
        end
    end

    if DiscardObj ~= nil then
        -- face up or down?
        if CardObj.getPosition().z < -50 or CardObj.getPosition().z > 50 then
            CardObj.setRotation({DiscardObj.getRotation().x, DiscardObj.getRotation().y, 180})
        else -- facedown
            CardObj.setRotation({DiscardObj.getRotation().x, DiscardObj.getRotation().y, 0})
        end

        CardObj.setPosition({CardObj.getPosition().x, 6, CardObj.getPosition().z})
        CardObj.setPositionSmooth({DiscardObj.getPosition().x, 3, DiscardObj.getPosition().z}, false, false)
    else
        printToAll("Unable to find the Discard Pile for this card.", {1, 1, 0})
    end
end

-- ARMY FORMATION SCRIPT v7 ===
-- Gaps between units of the same type and units of different types
local UNIT_SPACING = 0.005
local TYPE_SPACING = 0.05
-- Which type the faction units are grouped with, can be regular, elite, character or leader
local FACTION_UNITS_WITH = "elite"
-- Forces each group to stick to a single row, regardless of the settings
local FORCE_SINGLE_ROW_ENABLED = false
-- Allows for merging leaders and characters with elites when the sum of those is below the set value
local MERGE_ELITE_AND_BACK_ROW_ENABLED = true
local MERGE_ELITE_AND_BACK_ROW_UNIT_COUNT = 4

local MESSAGE_COLOUR = Color.White

-- Elites behind regular settings
local MAX_REG_BEFORE_TWO_ROWS = 6
local MAX_ELITE_BEFORE_TWO_ROWS = 4
local MAX_BACK_BEFORE_TWO_ROWS = 4
local ELITES_BEHIND_REGULARS = true

-- Side by side settings
-- local MAX_REG_BEFORE_TWO_ROWS = 2
-- local MAX_ELITE_BEFORE_TWO_ROWS = 2
-- local MAX_BACK_BEFORE_TWO_ROWS = 5
-- local ELITES_BEHIND_REGULARS = false

PLAYER_SETTINGS = {
    Red = {target_friendly_units = true},
    Yellow = {target_friendly_units = true},
    Green = {target_friendly_units = true},
    Blue = {target_friendly_units = true}
}

local NP_KEY_TO_SPIN_INDEX = {[8] = 0, [9] = 3, [6] = 6, [3] = 9, [2] = 12, [1] = 15, [4] = 18, [7] = 21}

local function getSide(desc)
    if (string.find(desc, "Shadow;") ~= nil) then
        return "sa"
    else
        return "fp"
    end
end

local function getType(desc)
    if (string.find(desc, "Regular;") ~= nil) then
        return "regular"
    end
    if (string.find(desc, "Elite;") ~= nil) then
        return "elite"
    end
    if (string.find(desc, "Faction;") ~= nil) then
        return FACTION_UNITS_WITH
    end
    if (string.find(desc, "Leader;") ~= nil) then
        return "leader"
    end
    return "character"
end

local function getNation(side, desc)
    if (side == "sa") then
        if (string.find(desc, "Sauron;") ~= nil) then
            return "sauron"
        end
        if (string.find(desc, "Isengard;") ~= nil) then
            return "isengard"
        end
        if (string.find(desc, "Haradrim;") ~= nil) then
            return "haradrim"
        end
        if (string.find(desc, "Spiders;") ~= nil) then
            return "spiders"
        end
        if (string.find(desc, "Dunlending;") ~= nil) then
            return "dunlending"
        end
        if (string.find(desc, "Corsairs;") ~= nil) then
            return "corsairs"
        end
    else
        if (string.find(desc, "North;") ~= nil) then
            return "north"
        end
        if (string.find(desc, "Dwarves;") ~= nil) then
            return "dwarves"
        end
        if (string.find(desc, "Gondor;") ~= nil) then
            return "gondor"
        end
        if (string.find(desc, "Elf;") ~= nil) then
            return "elf"
        end
        if (string.find(desc, "Rohan;") ~= nil) then
            return "rohan"
        end
        if (string.find(desc, "Ents;") ~= nil) then
            return "ents"
        end
        if (string.find(desc, "Eagles;") ~= nil) then
            return "eagles"
        end
        if (string.find(desc, "DeadMen;") ~= nil) then
            return "eagles"
        end
    end
    -- Characters and minions will return 'none'
    return "none"
end

-- Returns an object from the players hand to the board where it was originally picked up
local function returnToBoard(obj, player_color)
    obj.removeFromPlayerSelection(player_color)
    obj.setPosition(obj.pick_up_position)
    obj.setRotation(obj.pick_up_rotation)
    local zero_vector = vector(0, 0, 0)
    obj.setAngularVelocity(zero_vector)
    obj.setVelocity(zero_vector)
    obj.drop()
end

local function returnAllToBoard(player_color)
    local player = Player[player_color]
    local holding = player.getHoldingObjects()
    for _, obj in pairs(holding) do
        returnToBoard(obj, player_color)
    end
end

local function getRowCount(unit_count, max_row_units)
    if (FORCE_SINGLE_ROW_ENABLED) then
        return 1
    elseif (unit_count > max_row_units) then
        return 2
    elseif (unit_count > 0) then
        return 1
    else
        return 0
    end
end

local function compareNationGreater(a, b)
    return a["nation"] > b["nation"]
end

local function compareNationLess(a, b)
    return a["nation"] < b["nation"]
end

local function clamp(val, min, max)
    return math.min(math.max(val, min), max)
end

local function moveUnits(units, count, rows, cols, size, spacing, start_pos, rotation, spin_index)
    local col_spacing = vector(spacing, 0, 0):rotateOver("y", rotation)
    local row_spacing = vector(0, 0, spacing):rotateOver("y", rotation)
    local row_two_offset = vector((count % 2) * size / 2, 0, 0):rotateOver("y", rotation)

    local idx = 0
    for c = 1, cols do
        for r = 1, rows do
            idx = idx + 1
            if (idx <= count) then
                local unit = units[idx]
                unit["obj"].held_position_offset =
                    start_pos + col_spacing * (c - 1) - row_spacing * (r - 1) + row_two_offset * (r - 1)
                unit["obj"].held_spin_index = spin_index
            end
        end
    end
end

local function arrangeHeldUnits(np_key, player_color, holding)
    -- Determines who the player is and which side they are sorting based on key pressed
    local player_is_sa = player_color == "Red" or player_color == "Yellow"
    local sorting_friendly = PLAYER_SETTINGS[player_color]["target_friendly_units"]
    local sorting_sa = sorting_friendly and player_is_sa or not sorting_friendly and not player_is_sa

    local units = {regular = {}, elite = {}, leader = {}, character = {}}
    local max_unit_size = {regular = 0, elite = 0, leader = 0, character = 0}

    -- Iterates on all held objects
    local unit_count = 0
    for _, obj in pairs(holding) do
        local desc = obj.getDescription()
        local side = getSide(desc)
        local sorting_side = sorting_sa and side == "sa" or not sorting_sa and side == "fp"

        -- Return any units from the wrong side or the fellowship back to the board
        if (not sorting_side or obj.getName() == "The Ring-bearers") then
            returnToBoard(obj, player_color)
        else
            -- Store the unit in a table along with its nation
            local unit = {obj = obj, nation = getNation(side, desc)}
            local type = getType(desc)
            table.insert(units[type], unit)
            -- Determine the size of the unit's base, write the maximum size to a table
            local bounds = obj.getBoundsNormalized()
            local max_bounds = math.max(bounds.size.x, bounds.size.z)
            max_unit_size[type] = math.max(max_unit_size[type], max_bounds)
            unit_count = unit_count + 1
        end
    end

    if (unit_count == 0) then
        if (sorting_friendly) then
            Player[player_color].broadcast(
                "Not holding any friendly units. Press numpad 0 to toggle to enemies",
                MESSAGE_COLOUR
            )
        else
            Player[player_color].broadcast(
                "Not holding any enemy units. Press numpad 0 to toggle to friendlies",
                MESSAGE_COLOUR
            )
        end
        return
    end

    local regular_size = max_unit_size["regular"]
    local elite_size = max_unit_size["elite"]
    local back_size = math.max(max_unit_size["leader"], max_unit_size["character"])

    local regular_count = #units["regular"]
    local elite_count = #units["elite"]
    local back_count = #units["leader"] + #units["character"]

    -- Sort the lists to ensure nations are grouped together
    if (ELITES_BEHIND_REGULARS) then
        table.sort(units["regular"], compareNationGreater)
    else
        table.sort(units["regular"], compareNationLess)
    end
    table.sort(units["elite"], compareNationGreater)
    table.sort(units["leader"], compareNationGreater)

    -- Inject characters in the middle of leaders
    local leader_center_idx = math.ceil(#units["leader"] / 2) + 1
    for i, char in ipairs(units["character"]) do
        table.insert(units["leader"], leader_center_idx + i - 1, char)
    end

    -- Inject characters + leaders into the middle of the elites and swap elites with back if enabled
    if (MERGE_ELITE_AND_BACK_ROW_ENABLED and elite_count + back_count <= MERGE_ELITE_AND_BACK_ROW_UNIT_COUNT) then
        local elite_center_idx = math.ceil(#units["elite"] / 2) + 1
        for i, char in ipairs(units["leader"]) do
            table.insert(units["elite"], elite_center_idx + i - 1, char)
        end
        back_count = back_count + elite_count
        elite_count = 0
        back_size = math.max(elite_size, back_size)
        units["leader"] = units["elite"]
    end

    local regular_rows = getRowCount(regular_count, MAX_REG_BEFORE_TWO_ROWS)
    local elite_rows = getRowCount(elite_count, MAX_ELITE_BEFORE_TWO_ROWS)
    local back_rows = getRowCount(back_count, MAX_BACK_BEFORE_TWO_ROWS)

    local regular_columns = math.ceil(regular_count / regular_rows)
    if (regular_count == 0) then
        regular_columns = 0
    end
    local elite_columns = math.ceil(elite_count / elite_rows)
    if (elite_count == 0) then
        elite_columns = 0
    end
    local back_columns = math.ceil(back_count / back_rows)
    if (back_count == 0) then
        back_columns = 0
    end

    -- Calculate the formation width of each group
    local regular_width = math.max(regular_columns - 1, 0) * (UNIT_SPACING + regular_size)
    local elite_width = math.max(elite_columns - 1, 0) * (UNIT_SPACING + elite_size)
    local back_width = math.max(back_columns - 1, 0) * (UNIT_SPACING + back_size)

    local regular_depth =
        math.max(0, (regular_rows - 0.5) * regular_size + math.floor(regular_rows - 0.5) * UNIT_SPACING)
    local elite_depth = math.max(0, (elite_rows - 0.5) * elite_size + math.floor(elite_rows - 0.5) * UNIT_SPACING)

    local regular_start_x = 0
    local elite_start_x = 0
    local elite_start_z = 0
    local back_start_x = -(back_width / 2)
    local back_start_z = 0
    local front_width = 0
    if (ELITES_BEHIND_REGULARS) then
        regular_start_x = -(regular_width / 2)
        if (regular_count > 0) then
            elite_start_z = -(regular_depth + elite_size / 2 + TYPE_SPACING)
            if (elite_count > 0) then
                back_start_z = elite_start_z - (elite_depth + back_size / 2 + TYPE_SPACING)
            else
                back_start_z = -(regular_depth + back_size / 2 + TYPE_SPACING)
            end
        elseif (elite_count > 0) then
            back_start_z = -(elite_depth + back_size / 2 + TYPE_SPACING)
        end
        elite_start_x = -(elite_width / 2)
    else
        local front_width = regular_width + elite_width
        if (regular_count > 0 and elite_count > 0) then
            front_width = front_width + TYPE_SPACING + (regular_size + elite_size) / 2
        end
        regular_start_x = -(front_width / 2)
        if (regular_count > 0 or elite_count > 0) then
            back_start_z = -(math.max(regular_depth, elite_depth) + back_size / 2 + TYPE_SPACING)
        end
        local center_gap = 0
        if (regular_count > 0) then
            center_gap = regular_width + (regular_size + elite_size + TYPE_SPACING) / 2
        end
        elite_start_x = -(front_width / 2) + center_gap
    end

    -- Move the units
    local spin_index = NP_KEY_TO_SPIN_INDEX[np_key]
    local rotation = spin_index * 15
    if (regular_count > 0) then
        local start_pos = vector(regular_start_x, 0, 0):rotateOver("y", rotation)
        -- The max here is to prevent NaNs when the column count is 1. The spacing value isn't used anyway with a single unit but it will break the calcs
        local spacing = regular_width / math.max(regular_columns - 1, 1)
        moveUnits(
            units["regular"],
            regular_count,
            regular_rows,
            regular_columns,
            regular_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end

    if (elite_count > 0) then
        local start_pos = vector(elite_start_x, 0, elite_start_z):rotateOver("y", rotation)
        local spacing = elite_width / math.max(elite_columns - 1, 1)
        moveUnits(
            units["elite"],
            elite_count,
            elite_rows,
            elite_columns,
            elite_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end

    if (back_count > 0) then
        local start_pos = vector(back_start_x, 0, back_start_z):rotateOver("y", rotation)
        local spacing = back_width / math.max(back_columns - 1, 1)
        moveUnits(
            units["leader"],
            back_count,
            back_rows,
            back_columns,
            back_size,
            spacing,
            start_pos,
            rotation,
            spin_index
        )
    end
end

function onScriptingButtonDown(index, player_color)
    -- Bails out if not a player
    if (player_color ~= "Red" and player_color ~= "Yellow" and player_color ~= "Blue" and player_color ~= "Green") then
        return
    end

    local holding = Player[player_color].getHoldingObjects()
    if (index == 5) then
        if (#holding ~= 0) then
            Player[player_color].broadcast("Returning all units to the board", MESSAGE_COLOUR)
            returnAllToBoard(player_color)
        end
    elseif (index == 10) then
        local enabled = not PLAYER_SETTINGS[player_color]["target_friendly_units"]
        PLAYER_SETTINGS[player_color]["target_friendly_units"] = enabled
        if (enabled) then
            Player[player_color].broadcast("Targeting friendly units", MESSAGE_COLOUR)
        else
            Player[player_color].broadcast("Targeting enemy units", MESSAGE_COLOUR)
        end
    else
        if (#holding ~= 0) then
            arrangeHeldUnits(index, player_color, holding)
        end
    end
end
-- END OF ARMY FORMATION SCRIPT v7 =================================================================================================================

-- ARMY COUNTING SCRIPT v2
-- Settings
local FP_COLOUR = {0.6, 0.6, 1}
local SA_COLOUR = {1.0, 0.6, 0.6}
local NOTES_COLOUR = {0.9, 0.9, 0.9}
local WARNING_COLOUR = {0.9, 0.9, 0.1}
local USE_SHORT_NOTES = true

addHotkey(
    "Count Selected Units",
    function(player_color, hovered_object, pointer_position, is_key_up)
        countSelectedUnits(player_color)
    end
)

local CHARACTER_DB = {
    ["Aragorn: Heir to Isildur"] = {
        leadership = 2,
        bonus_strength = 1,
        note = "Aragorn: Heir to Isildur - +1 Combat Strength",
        short_note = "Aragorn - +1 Strength"
    },
    ["Boromir"] = {
        lookup_index = 5
    },
    ["Boromir: Son of Denethor"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Boromir: Son of Denethor - +1 Combat Strength",
        short_note = "Boromir - +1 Strength"
    },
    ["Boromir: Captain General of Gondor"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Boromir: Captain General of Gondor - +1? Combat Strength",
        short_note = "Boromir - +1? Strength"
    },
    ["Lord Elrond: Keeper of Vilya"] = {
        leadership = 2,
        note = "Lord Elrond: Keeper of Vilya - Elven Elites are Leaders",
        short_note = "Lord Elrond - Elven Elites are Leaders"
    },
    ["Gandalf the White: Emissary from the West"] = {
        leadership = 1,
        note = "Gandalf the White: Emissary from the West -  May forfeit 1 Leadership to cancel Nazgûl Leadership",
        short_note = "Gandalf the White -  Forfeit 1 Leadership to cancel Nazgûl Leadership"
    },
    ["Gandalf the Grey"] = {
        lookup_index = 2
    },
    ["Gandalf the Grey: The Grey Wanderer"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Gandalf the Grey: The Grey Wanderer - +1 Combat Strength",
        short_note = "Gandalf the Grey - +1 Strength"
    },
    ["Gandalf the Grey: Keeper of Narya"] = {
        leadership = 1,
        note = "Gandalf the Grey: Keeper of Narya",
        short_note = "Gandalf the Grey"
    },
    ["Gimli"] = {
        lookup_index = 4
    },
    ["Gimli: Son of Gloin"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Gimli: Son of Gloin - +1 Combat Strength",
        short_note = "Gimli - +1 Strength"
    },
    ["Gimli: Dwarven Lord"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Gimli: Dwarven Lord - +1? Combat Strength",
        short_note = "Gimli - +1? Strength"
    },
    ["Gothmog: Lieutenant of Morgul"] = {
        leadership = 1,
        note = "Gothmog: Lieutenant of Morgul",
        short_note = "Gothmog"
    },
    ["Lady Galadriel: Keeper of Nenya"] = {
        leadership = 2,
        note = "Lady Galadriel: Keeper of Nenya",
        short_note = "Lady Galadriel"
    },
    ["Legolas"] = {
        lookup_index = 3
    },
    ["Legolas: Son of Thranduil"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Legolas: Son of Thranduil - +1 Combat Strength",
        short_note = "Legolas - +1 Strength"
    },
    ["Legolas: Elven Prince"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Legolas: Elven Prince - +1? Combat Strength",
        short_note = "Legolas - +1? Strength"
    },
    ["The Mouth of Sauron: Black Númenórean"] = {
        leadership = 2,
        note = "The Mouth of Sauron: Black Númenórean - Extend siege by one turn without reducing an Elite",
        short_note = "The Mouth of Sauron - Extend siege by one turn without reducing an Elite"
    },
    ["Meriadoc"] = {
        lookup_index = 7
    },
    ["Meriadoc Brandybuck: Hobbit Companion"] = {
        leadership = 1,
        note = "Meriadoc Brandybuck: Hobbit Companion",
        short_note = "Meriadoc"
    },
    ["Meriadoc: Hobbit of the Shire"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Meriadoc: Hobbit of the Shire - +1? Combat Strength",
        short_note = "Meriadoc - +1? Strength"
    },
    ["The Mouth of Sauron: Lieutenant of Barad~Dur"] = {
        leadership = 2,
        note = "The Mouth of Sauron: Lieutenant of Barad-Dûr",
        short_note = "The Mouth of Sauron"
    },
    ["Peregrin"] = {
        lookup_index = 6
    },
    ["Peregrin Took: Hobbit Companion"] = {
        leadership = 1,
        note = "Peregrin Took: Hobbit Companion",
        short_note = "Peregrin"
    },
    ["Peregrin: Hobbit of the Shire"] = {
        leadership = 1,
        possible_bonus_strength = 1,
        note = "Peregrin: Hobbit of the Shire - +1? Combat Strength",
        short_note = "Peregrin - +1? Strength"
    },
    ["Saruman: Corrupted Wizard"] = {
        leadership = 1,
        note = "Saruman: Corrupted Wizard",
        short_note = "Saruman"
    },
    ["Strider"] = {
        lookup_index = 2
    },
    ["Strider: Ranger of the North"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Strider: Ranger of the North - +1 Combat Strength",
        short_note = "Strider - +1 Strength"
    },
    ["Strider: Dunadan"] = {
        leadership = 1,
        bonus_strength = 1,
        note = "Strider: Dúnadan - +1 Combat Strength",
        short_note = "Strider - +1 Strength"
    },
    ["Balrog: Evil of the Ancient World"] = {
        leadership = 3,
        bonus_strength = 2,
        note = "Balrog: Evil of the Ancient World - +2 Combat Strength",
        short_note = "Balrog - +2 Strength"
    },
    ["Treebeard: Tree-herd"] = {
        leadership = 0,
        possible_bonus_strength = 1,
        note = "Treebeard: Tree-herd - +1? Combat Strength",
        short_note = "Treebeard - +1? Strength"
    },
    ["The Witch-King: The Black Captain"] = {
        leadership = 2,
        note = "The Witch-King: The Black Captain - If playing first round Combat Card draw a matching card",
        short_note = "The Witch-King: First round Combat Card draws a matching card"
    },
    ["The Witch-King: Chief of the Ring Wraiths"] = {
        leadership = 1,
        note = "The Witch-King: Chief of the Ring Wraiths",
        short_note = "The Witch-King"
    }
}

function countSelectedUnits(player_color)
    local count_friendly = PLAYER_SETTINGS[player_color]["target_friendly_units"]
    local player_is_sa = player_color == "Red" or player_color == "Yellow"
    local side_to_count = "fp"
    if (player_is_sa and count_friendly or not player_is_sa and not count_friendly) then
        side_to_count = "sa"
    end

    local info = {
        total_hp = 0,
        regulars = 0,
        elites = 0,
        leaders = 0,
        nazgul = 0,
        characters = 0,
        leadership = 0,
        bonus_strength = 0,
        possible_bonus_strength = 0,
        faction = {
            dead_men = {qty = 0, note = "Dead Men"},
            ents = {qty = 0, note = "Ents"},
            eagles = {qty = 0, note = "Eagles"},
            spiders = {qty = 0, note = "Spiders"},
            corsairs = {qty = 0, note = "Corsairs"},
            dunlendings = {qty = 0, note = "Dunlendings"}
        },
        has_faction_units = false,
        dead_men = 0,
        ents = 0,
        eagles = 0,
        spiders = 0,
        corsairs = 0,
        dunlendings = 0,
        isengard_elites_and_saruman_in_play = false,
        character_notes = {},
        number_of_locs = 0,
        max_loc_name = "",
        max_loc_count = 0,
        min_loc_name = "",
        min_loc_count = 10000
    }

    -- Copies the CompanionNames off the GamePanel to work out who is play. Unfortunately I don't think this is saved
    -- between sessions?
    local companion_names = getObjectFromGUID(GamePanelID).getVar("CompanionNames")
    local locations = {}

    local selected = Player[player_color].getSelectedObjects()
    for _, obj in pairs(selected) do
        local name = obj.getName()
        local desc = obj.getDescription()
        local side = "fp"
        if (string.find(desc, "Shadow;") ~= nil) then
            side = "sa"
        end

        if (side == side_to_count and string.find(desc, "Card;") == nil) then
            local location = GetGridRegion({Position = obj.getPosition()})
            if (string.find(desc, "Regular;") ~= nil) then
                table.insert(locations, location)
                info.regulars = info.regulars + 1
                info.total_hp = info.total_hp + 1
            elseif (string.find(desc, "Elite;") ~= nil) then
                table.insert(locations, location)
                info.elites = info.elites + 1
                info.total_hp = info.total_hp + 2
                if
                    (name == "Isengard Elite" and
                        getObjectFromGUID(GamePanelID).call(
                            "InPlay",
                            {Name = "Saruman: Corrupted Wizard", Description = "Minion;"}
                        ))
                 then
                    info.leaders = info.leaders + 1
                    info.leadership = info.leadership + 1
                    info.isengard_elites_and_saruman_in_play = true
                end
            elseif (string.find(desc, "Leader;") ~= nil) then
                table.insert(locations, location)
                info.leaders = info.leaders + 1
                info.leadership = info.leadership + 1
                if (string.find(desc, "Nazgul;") ~= nil) then
                    info.nazgul = info.nazgul + 1
                end
            elseif (string.find(desc, "DeadMen;") ~= nil) then
                table.insert(locations, location)
                info.faction.dead_men.qty = info.faction.dead_men.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Ents;") ~= nil) then
                table.insert(locations, location)
                info.faction.ents.qty = info.faction.ents.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Eagles;") ~= nil) then
                table.insert(locations, location)
                info.faction.eagles.qty = info.faction.eagles.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Spiders;") ~= nil) then
                table.insert(locations, location)
                info.faction.spiders.qty = info.faction.spiders.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Corsairs;") ~= nil) then
                table.insert(locations, location)
                info.faction.corsairs.qty = info.faction.corsairs.qty + 1
                info.has_faction_units = true
            elseif (string.find(desc, "Dunlendings;") ~= nil) then
                table.insert(locations, location)
                info.faction.dunlendings.qty = info.faction.dunlendings.qty + 1
                info.has_faction_units = true
            else
                local char = CHARACTER_DB[name]
                if (char ~= nil) then
                    table.insert(locations, location)
                    if (char.lookup_index ~= nil) then
                        -- Ensure we test index 1 and 2 to determine which one is the right one!
                        -- Gandalf and Strider can be swapped
                        if (char.lookup_index == 1 or char.lookup_index == 2) then
                            if (string.find(name, companion_names[1]) ~= nil) then
                                char.lookup_index = 1
                            elseif (string.find(name, companion_names[2]) ~= nil) then
                                char.lookup_index = 2
                            else
                                print("ERROR: Could not find character in table", WARNING_COLOUR)
                            end
                        end
                        char = CHARACTER_DB[companion_names[char.lookup_index]]
                    end
                    if (char.leadership ~= nil) then
                        info.leadership = info.leadership + char.leadership
                    end
                    if (char.bonus_strength ~= nil) then
                        info.bonus_strength = info.bonus_strength + info.bonus_strength
                    end
                    if (char.poss_strength ~= nil) then
                        info.possible_bonus_strength = info.possible_bonus_strength + char.possible_bonus_strength
                    end
                    if (USE_SHORT_NOTES) then
                        table.insert(info.character_notes, char.short_note)
                    else
                        table.insert(info.character_notes, char.note)
                    end
                    info.characters = info.characters + 1
                end
            end
        end
    end

    -- Count up locations of each unit
    local location_counts = {}
    for _, location in ipairs(locations) do
        if location_counts[location] == nil then
            location_counts[location] = 1
            info.number_of_locs = info.number_of_locs + 1
        else
            location_counts[location] = location_counts[location] + 1
        end
    end

    -- Determine location with most units and location with least
    for loc_name, loc_count in pairs(location_counts) do
        if (loc_count > info.max_loc_count) then
            info.max_loc_name = loc_name
            info.max_loc_count = loc_count
        end
        if (loc_count < info.min_loc_count) then
            info.min_loc_name = loc_name
            info.min_loc_count = loc_count
        end
    end

    printArmyInfo(side_to_count, info)
    setDiceRoller(side_to_count, info)
end

function printArmyInfo(side_to_count, info)
    local colour = FP_COLOUR
    if (side_to_count == "sa") then
        colour = SA_COLOUR
    end

    if (info.total_hp == 0 and #info.character_notes == 0 and info.leadership == 0 and not info.has_faction_units) then
        printToAll("No " .. string.upper(side_to_count) .. " Army Found", colour)
        return
    end

    local possible_bonus_strength = ""
    if (info.possible_bonus_strength > 0) then
        possible_bonus_strength = "+"
    end

    printToAll("━━━━  " .. string.upper(side_to_count) .. " ARMY INFO  ━━━━", colour)
    printToAll("Location: " .. info.max_loc_name, colour)
    printToAll(
        "R/E/L: " ..
            info.regulars ..
                "/" .. info.elites .. "/" .. info.leaders .. "      Size: " .. (info.regulars + info.elites) .. "/10",
        colour
    )
    printToAll(
        "Strength: " ..
            (info.regulars + info.elites + info.bonus_strength) ..
                possible_bonus_strength .. "    Leadership: " .. info.leadership,
        colour
    )
    if (side_to_count == "sa") then
        printToAll("Minions: " .. info.characters .. "        Nazgûl: " .. info.nazgul, colour)
    else
        printToAll("Companions: " .. info.characters, colour)
    end
    if (info.number_of_locs >= 3) then
        printToAll("Warning: Selection contains units in multiple locations", WARNING_COLOUR)
    elseif (info.max_loc_name ~= info.min_loc_name) then
        printToAll("Warning: Selection also contains units in " .. info.min_loc_name, WARNING_COLOUR)
    end

    -- Fill out notes section
    local notes = ""

    for _, faction in pairs(info.faction) do
        if (faction.qty > 0) then
            if (notes == "") then
                notes = "  ● " .. faction.qty .. " " .. faction.note
            else
                notes = notes .. "\r\n  ● " .. faction.qty .. " " .. faction.note
            end
        end
    end

    if (info.isengard_elites_and_saruman_in_play) then
        table.insert(info.character_notes, "Saruman is in play - Isengard Elites are Leaders")
    end
    for _, note in pairs(info.character_notes) do
        if (notes == "") then
            notes = "  ● " .. note
        else
            notes = notes .. "\r\n  ● " .. note
        end
    end
    if (notes ~= "") then
        printToAll(notes, NOTES_COLOUR)
    end
    -- Small lie below, but it will be!
    printToAll(string.upper(side_to_count) .. " dice roller has been set", colour)
    printToAll("━━━━━━━━━━━━━━━━━━━━\r\n", colour)
end

function setDiceRoller(side_to_count, info)
    local strength = math.min(info.regulars + info.elites + info.bonus_strength, 5)
    local leadership = math.min(info.leadership, 5)
    local roller_guid = "4b6f4c"
    if (side_to_count == "sa") then
        roller_guid = "92a611"
    end
    getObjectFromGUID(roller_guid).call("switchToCombat", {Strength = strength, Leadership = leadership})
end
-- END ARMY COUNTING SCRIPT v2
end)
return __bundle_require("Global.-1.lua")
