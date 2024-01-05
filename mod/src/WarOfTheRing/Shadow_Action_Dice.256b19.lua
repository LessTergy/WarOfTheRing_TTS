-- Bundled by luabundle {"rootModuleName":"Shadow Action Dice.256b19.lua","version":"1.6.0"}
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
__bundle_register("Shadow Action Dice.256b19.lua", function(require, _LOADED, __bundle_register, __bundle_modules)
require("ActionDiceDefault")
end)
__bundle_register("ActionDiceDefault", function(require, _LOADED, __bundle_register, __bundle_modules)
Side = ""
ThisDiceRolling = false

function onLoad()
    if string.find(self.getDescription(), "Shadow;") ~= nil then
        Side = "Shadow"
    else
        Side = "FreePeoples"
    end

    ThisDiceRolling = false
    PanelID = Global.call("ReadTag", {Text = self.getDescription(), Var = "Panel", Default = ""})
end

function onDestroy()
    --remove this dice if it was rolling
    if ThisDiceRolling then
        Global.call("DeleteActionRoll", {DiceID = self.getGUID()})
    end
end

function onRandomize(player_color)
    if not ThisDiceRolling then
        ThisDiceRolling = true
        Global.call("InsertActionRoll", {DiceID = self.getGUID()})
        Wait.condition(DoneRolling, RollWatcher)
    end
end

function RollWatcher()
    return self.resting
end

function DoneRolling()
    Global.call("ReportActionRoll", {DiceID = self.getGUID()})
    ThisDiceRolling = false
end
end)
return __bundle_require("Shadow Action Dice.256b19.lua")
