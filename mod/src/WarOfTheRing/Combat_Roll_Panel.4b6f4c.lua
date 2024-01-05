-- Rollers and Comms
ROLLER_SA_GUID = '92a611'
ROLLER_FP_GUID = '4b6f4c'
ROLLER_SA = nil
ROLLER_FP = nil
ROLLER_SA_READY = false
ROLLER_FP_READY = false

-- Dice settings
MODEL = 'Die_6'
SCALE = 0.75
NORMAL_COLOUR = 'White'
FP_HIT_COLOUR = 'Blue'
SA_HIT_COLOUR = 'Red'
FRIENDLY_HIT_COLOUR = nil
ENEMY_HIT_COLOUR = nil

-- Speed settings
DELAY = 0.25
STAGGER_TIME = 0.2
RANDOMIZE_COUNT = 4
RANDOMIZE_STAGGER_TIME = 0.1

-- Roll history
CURRENT_ROLL_ID = 0
HISTORY = {}

-- Input
ROLL_COUNT = 0
ROLL_TO_HIT = 0
REROLL_COUNT = 0
REROLL_TO_HIT = 0
SIX_HITS_TWICE = false
ONE_HITS_SELF = false
MISSES_TO_HITS = 0

-- Sound effects
BATTLE_NOISE_CUBE_GUID = '507f2b'
BATTLE_HITS_CUBE_GUIDS = {'5bea69', '94d153', '739b9e', '1202a1', '9f8bae', '380278', '1d727f', 'de57a1', '586a5a', '34dbdd'}
BATTLE_NOISE_CUBE = nil
BATTLE_HITS_CUBES = {}
BATTLE_HITS_COUNT = 5

-- UI
CURRENT_PANEL = ''
PANEL_NAMES = {'General', 'Combat', 'Hunt'}
SIDE_SA = false

COLOURS = nil
COLOURS_SA = {btn_standard = '#a1572d', btn_selected = '#db6d30', btn_bottom = '#db6d30', btn_bottom_ready = '#208820',
              txt_standard = '#000000', txt_selected = '#EEEEEE'}
COLOURS_FP = {btn_standard = '#638489', btn_selected = '#839797', btn_bottom = '#839797', btn_bottom_ready = '#208820',
              txt_standard = '#000000', txt_selected = '#EEEEEE'}

BUTTON_COUNTS = {General = {RollCount = {1, 5}, RollToHit = {2, 9}},
                 Combat = {RollCount = {0, 5}, RollToHit = {2, 6}, RerollCount = {0, 5}, RerollToHit = {2, 6}, MissesToHits = {0, 2}},
                 Hunt = {RollCount = {1, 5}, RollToHit = {2, 6}, RerollCount = {0, 3}}}
BUTTON_DEFAULTS = {General = {roll_count = 1, roll_to_hit = 5, reroll_count = 0, reroll_to_hit = 0},
                   Combat = {roll_count = 1, roll_to_hit = 5, reroll_count = 0, reroll_to_hit = 5},
                   Hunt = {roll_count = 1, roll_to_hit = 6, reroll_count = 0, reroll_to_hit = 6}}

function setupUI(panel_to_activate)
    -- Delay and condition here to try and catch cases where the xml never scales to the object properly
    Wait.time(function()
        Wait.condition(function()
            local bounds = self.getBoundsNormalized()
            local scale = self.getScale()
            self.UI.setAttribute('pnlMain', 'scale', 1 / scale.x .. ' ' .. 1 / scale.z)
            self.UI.setAttribute('pnlMain', 'position', '0 0 ' .. bounds.size.y * -51)
            self.UI.setAttribute('pnlMain', 'width', bounds.size.x * 98)
            self.UI.setAttribute('pnlMain', 'height', bounds.size.z * 98)
            self.UI.setAttribute('pnlMain', 'active', true)
            if (not SIDE_SA) then
                self.UI.setAttribute('btnSelectHunt', 'active', false)
                self.UI.setAttribute('hzCombat1HitsSelf', 'active', false)
                self.UI.setAttribute('hzCombat6HitsTwice', 'active', true)
                self.UI.setAttribute('hzCombatMissesToHits', 'active', true)
            end
            activatePanel(panel_to_activate)
        end, function() return not self.loading_custom end)
    end, 0.5)
end

function onSave() return JSON.encode({CURRENT_PANEL = CURRENT_PANEL, CURRENT_ROLL_ID = CURRENT_ROLL_ID, HISTORY = HISTORY}) end

function onLoad(save_state)
    if (string.find(self.getDescription(), 'Shadow;') ~= nil) then
        SIDE_SA = true
        COLOURS = COLOURS_SA
        FRIENDLY_HIT_COLOUR = FP_HIT_COLOUR
        ENEMY_HIT_COLOUR = SA_HIT_COLOUR
        self.UI.setAttribute('txtGeneralHitsEnemyDesc', 'text', 'FP HITS')
        self.UI.setAttribute('txtGeneralHitsFriendlyDesc', 'text', 'SA HITS')
        self.UI.setAttribute('txtCombatHitsEnemyDesc', 'text', 'FP HITS')
        self.UI.setAttribute('txtCombatHitsFriendlyDesc', 'text', 'SA HITS')
    else
        COLOURS = COLOURS_FP
        FRIENDLY_HIT_COLOUR = SA_HIT_COLOUR
        ENEMY_HIT_COLOUR = FP_HIT_COLOUR
        self.UI.setAttribute('txtGeneralHitsEnemyDesc', 'text', 'SA HITS')
        self.UI.setAttribute('txtGeneralHitsFriendlyDesc', 'text', 'FP HITS')
        self.UI.setAttribute('txtCombatHitsEnemyDesc', 'text', 'SA HITS')
        self.UI.setAttribute('txtCombatHitsFriendlyDesc', 'text', 'FP HITS')
    end

    CURRENT_PANEL = ''
    local panel_to_activate = 'Combat'

    local state = JSON.decode(save_state)
    if (state ~= nil) then
        if (state.CURRENT_PANEL ~= nil) then panel_to_activate = state.CURRENT_PANEL end
        if (state.CURRENT_ROLL_ID ~= nil) then CURRENT_ROLL_ID = state.CURRENT_ROLL_ID end
        if (state.HISTORY ~= nil) then HISTORY = state.HISTORY end
    end
    setupUI(panel_to_activate)

    BATTLE_NOISE_CUBE = getObjectFromGUID(BATTLE_NOISE_CUBE_GUID)
    BATTLE_HITS_CUBES = {}
    for _, guid in pairs(BATTLE_HITS_CUBE_GUIDS) do table.insert(BATTLE_HITS_CUBES, getObjectFromGUID(guid)) end

    ROLLER_SA = getObjectFromGUID(ROLLER_SA_GUID)
    ROLLER_FP = getObjectFromGUID(ROLLER_FP_GUID)
    if (ROLLER_SA == nil) then print('ERROR: Could not find Shadow Army Dice Roller') end
    if (ROLLER_FP == nil) then print('ERROR: Could not find Free People Dice Roller') end
end

function setButtonSelected(button_id)
    self.UI.setAttribute(button_id, 'fontStyle', 'BoldAndItalic')
    self.UI.setAttribute(button_id, 'color', COLOURS.btn_selected)
    self.UI.setAttribute(button_id, 'textColor', COLOURS.txt_selected)
end

function setButtonUnselected(button_id)
    self.UI.setAttribute(button_id, 'fontStyle', 'Italic')
    self.UI.setAttribute(button_id, 'color', COLOURS.btn_standard)
    self.UI.setAttribute(button_id, 'textColor', COLOURS.txt_standard)
end

function setAllButtonsUnselected(panel_name, button_name)
    if (BUTTON_COUNTS[panel_name][button_name] == nil) then return end
    local start_idx = BUTTON_COUNTS[panel_name][button_name][1]
    local end_idx = BUTTON_COUNTS[panel_name][button_name][2]
    for i = start_idx, end_idx do setButtonUnselected('btn' .. panel_name .. button_name .. i) end
end

function setPanelActive(panel_name)
    self.UI.setAttribute('pnl' .. panel_name, 'active', true)
    setButtonSelected('btnSelect' .. panel_name)
end

function setPanelInactive(panel_name)
    self.UI.setAttribute('pnl' .. panel_name, 'active', false)
    setButtonUnselected('btnSelect' .. panel_name)
end

function reloadRollPanel(panel_name)
    if (CURRENT_ROLL_ID ~= 0) then
        local roll_info = HISTORY[CURRENT_ROLL_ID]
        if (roll_info.type == panel_name and not roll_info.failed and not roll_info.cleared) then
            setRollCount(roll_info.roll_count)
            setRollToHit(roll_info.roll_to_hit)
            setRerollCount(roll_info.reroll_count)
            setRerollToHit(roll_info.reroll_to_hit)
            if (panel_name == 'Combat' and not SIDE_SA) then setMissesToHits(roll_info.misses_to_hits) end
            setUIHits(roll_info)
            if (roll_info.completed) then
                self.UI.setAttribute('btn' .. panel_name .. 'Roll', 'interactable', true)
                self.UI.setAttribute('btn' .. panel_name .. 'Adjust', 'interactable', true)
                self.UI.setAttribute('btn' .. panel_name .. 'Clear', 'interactable', true)
            else
                self.UI.setAttribute('btn' .. panel_name .. 'Roll', 'interactable', false)
                self.UI.setAttribute('btn' .. panel_name .. 'Adjust', 'interactable', false)
                self.UI.setAttribute('btn' .. panel_name .. 'Clear', 'interactable', false)

            end

            return
        end
    end

    -- Set defaults
    setRollCount(BUTTON_DEFAULTS[panel_name].roll_count)
    setRollToHit(BUTTON_DEFAULTS[panel_name].roll_to_hit)
    setRerollCount(BUTTON_DEFAULTS[panel_name].reroll_count)
    setRerollToHit(BUTTON_DEFAULTS[panel_name].reroll_to_hit)
    setMissesToHits(0)
    set6HitsTwice(false)
    set1HitsSelf(false)
    zeroUIHits(panel_name)
    self.UI.setAttribute('btn' .. panel_name .. 'Roll', 'interactable', true)
    self.UI.setAttribute('btn' .. panel_name .. 'Adjust', 'interactable', false)
    self.UI.setAttribute('btn' .. panel_name .. 'Clear', 'interactable', false)
end

function activatePanel(panel_name)
    if (CURRENT_PANEL == panel_name) then return end
    CURRENT_PANEL = panel_name
    for _, panel in ipairs(PANEL_NAMES) do if (panel_name ~= panel) then setPanelInactive(panel) end end
    setPanelActive(panel_name)

    if (panel_name == 'General' or panel_name == 'Combat' or panel_name == 'Hunt') then reloadRollPanel(panel_name) end
end

function uiSelectGeneral() activatePanel('General') end
function uiSelectCombat() activatePanel('Combat') end
function uiSelectHunt() activatePanel('Hunt') end
function uiSelectStats() activatePanel('Stats') end
function uiSelectSettings() activatePanel('Settings') end

function setRollCount(roll_count)
    setAllButtonsUnselected(CURRENT_PANEL, 'RollCount')
    setButtonSelected('btn' .. CURRENT_PANEL .. 'RollCount' .. roll_count)
    ROLL_COUNT = roll_count
    onInputChange('RollCount')
end

function uiSetRollCount1() setRollCount(1) end
function uiSetRollCount2() setRollCount(2) end
function uiSetRollCount3() setRollCount(3) end
function uiSetRollCount4() setRollCount(4) end
function uiSetRollCount5() setRollCount(5) end

function setRollToHit(roll_to_hit)
    setAllButtonsUnselected(CURRENT_PANEL, 'RollToHit')
    setButtonSelected('btn' .. CURRENT_PANEL .. 'RollToHit' .. roll_to_hit)
    ROLL_TO_HIT = roll_to_hit
    if (CURRENT_PANEL == 'Hunt') then
        setRerollToHit(roll_to_hit)
    elseif (CURRENT_PANEL == 'General') then
        local displayFriendlyAndEnemyHits = roll_to_hit == 8 or roll_to_hit == 9
        self.UI.setAttribute('pnl' .. CURRENT_PANEL .. 'HitsBoth', 'active', displayFriendlyAndEnemyHits)
        self.UI.setAttribute('pnl' .. CURRENT_PANEL .. 'Hits', 'active', not displayFriendlyAndEnemyHits)
    end
    onInputChange('ToHit')
end

function uiSetRollToHit2() setRollToHit(2) end
function uiSetRollToHit3() setRollToHit(3) end
function uiSetRollToHit4() setRollToHit(4) end
function uiSetRollToHit5() setRollToHit(5) end
function uiSetRollToHit6() setRollToHit(6) end
function uiSetRollToHit7() setRollToHit(7) end -- Face value of die
function uiSetRollToHit8() setRollToHit(8) end -- 1 or 2 hits self, 5 or 6 hits enemy
function uiSetRollToHit9() setRollToHit(9) end -- 1 hits self, 6 hits enemy

function setRerollCount(reroll_count)
    setAllButtonsUnselected(CURRENT_PANEL, 'RerollCount')
    setButtonSelected('btn' .. CURRENT_PANEL .. 'RerollCount' .. reroll_count)
    REROLL_COUNT = reroll_count
    onInputChange('RerollCount')
end

function uiSetRerollCount0() setRerollCount(0) end
function uiSetRerollCount1() setRerollCount(1) end
function uiSetRerollCount2() setRerollCount(2) end
function uiSetRerollCount3() setRerollCount(3) end
function uiSetRerollCount4() setRerollCount(4) end
function uiSetRerollCount5() setRerollCount(5) end

function setRerollToHit(reroll_to_hit)
    setAllButtonsUnselected(CURRENT_PANEL, 'RerollToHit')
    setButtonSelected('btn' .. CURRENT_PANEL .. 'RerollToHit' .. reroll_to_hit)
    REROLL_TO_HIT = reroll_to_hit
    onInputChange('RerollToHit')
end

function uiSetRerollToHit2() setRerollToHit(2) end
function uiSetRerollToHit3() setRerollToHit(3) end
function uiSetRerollToHit4() setRerollToHit(4) end
function uiSetRerollToHit5() setRerollToHit(5) end
function uiSetRerollToHit6() setRerollToHit(6) end

function setMissesToHits(misses_to_hits)
    if (CURRENT_PANEL == 'Combat' and not SIDE_SA) then
        setAllButtonsUnselected('Combat', 'MissesToHits')
        setButtonSelected('btnCombatMissesToHits' .. misses_to_hits)
        onInputChange('MissesToHits')
    end
    MISSES_TO_HITS = misses_to_hits
end

function uiSetMissesToHits0() setMissesToHits(0) end
function uiSetMissesToHits1() setMissesToHits(1) end
function uiSetMissesToHits2() setMissesToHits(2) end

function set1HitsSelf(enabled)
    if (CURRENT_PANEL == 'Combat' and SIDE_SA) then
        if (enabled) then
            self.UI.setAttribute('btnCombat1HitsSelf', 'text', 'X')
            setButtonSelected('btnCombat1HitsSelf')
        else
            self.UI.setAttribute('btnCombat1HitsSelf', 'text', '')
            setButtonUnselected('btnCombat1HitsSelf')
        end
        onInputChange('1HitsSelf')
        self.UI.setAttribute('pnl' .. CURRENT_PANEL .. 'HitsBoth', 'active', enabled)
        self.UI.setAttribute('pnl' .. CURRENT_PANEL .. 'Hits', 'active', not enabled)
    end
    ONE_HITS_SELF = enabled
end

function uiToggle1HitsSelf() set1HitsSelf(not ONE_HITS_SELF) end

function set6HitsTwice(enabled)
    if (CURRENT_PANEL == 'Combat' and not SIDE_SA) then
        if (enabled) then
            self.UI.setAttribute('btnCombat6HitsTwice', 'text', 'X')
            setButtonSelected('btnCombat6HitsTwice')
        else
            self.UI.setAttribute('btnCombat6HitsTwice', 'text', '')
            setButtonUnselected('btnCombat6HitsTwice')
        end
        onInputChange('6HitsTwice')
    end
    SIX_HITS_TWICE = enabled
end

function uiToggle6HitsTwice() set6HitsTwice(not SIX_HITS_TWICE) end

function createRollInfo()
    return {type = CURRENT_PANEL, roll_count = ROLL_COUNT, roll_to_hit = ROLL_TO_HIT, reroll_count = REROLL_COUNT,
            reroll_to_hit = REROLL_TO_HIT, six_hits_twice = SIX_HITS_TWICE, one_hits_self = ONE_HITS_SELF, misses_to_hits = MISSES_TO_HITS,
            completed = false, on_roll_step = true, failed = false, cleared = false, adjust_requested = false, roll_dice = {},
            reroll_dice = {}, roll_results = {}, reroll_results = {}, reroll_qty = 0, roll_die_hits = 0, reroll_die_hits = 0,
            friendly_hits = 0, total_hits = 0}
end

function sendStats(roll_info)
    if Global.getVar("UpdateDiceStats") == nil then return end
    local side = 'FreePeoples'
    if (SIDE_SA) then side = 'Shadow' end
    for _, result in pairs(roll_info.roll_results) do
        Global.call('UpdateDiceStats', {Result = result, Type = 'Combat', Side = side})
    end

    for _, result in pairs(roll_info.reroll_results) do
        Global.call('UpdateDiceStats', {Result = result, Type = 'Combat', Side = side})
    end
end

function uiShowStats()
    uiClearRoll()
    local player_colour = 'Blue'
    if (SIDE_SA) then player_colour = 'Red' end
    if Global.getVar("DisplayDiceStats") ~= nil then Global.call("DisplayDiceStats",{PlayerColor = player_colour}) end
end

function clearDice(roll_info)
    if (roll_info.cleared) then return end
    for _, die_guid in ipairs(roll_info.roll_dice) do
        local die = getObjectFromGUID(die_guid)
        if (die ~= nil and not die.isDestroyed()) then die.destruct() end
    end
    for _, die_guid in ipairs(roll_info.reroll_dice) do
        local die = getObjectFromGUID(die_guid)
        if (die ~= nil and not die.isDestroyed()) then die.destruct() end
    end
    roll_info.roll_dice = {}
    roll_info.reroll_dice = {}
    roll_info.cleared = true

    sendStats(roll_info)
end

function getStartDiePosition(is_roll)
    local pos = self.getPosition()
    local rot = self.getRotation()
    local start_pos = vector(-(self.getBounds().size.x / 2) + self.getBounds().size.x * 0.1, 0.5, (self.getBounds().size.z / 2) + 1.2)
    if (not is_roll) then start_pos.z = start_pos.z + 1.2 end
    return pos + start_pos:rotateOver('y', rot.y)
end

function getDiePositionOffset()
    local rot = self.getRotation()
    local offset = vector(self.getBounds().size.x * 0.8 * 0.25, 0, 0)
    return offset:rotateOver('y', rot.y)
end

function createDice(on_roll_step, dice, qty, start_idx)
    local start_pos = getStartDiePosition(on_roll_step)
    local offset = getDiePositionOffset()
    local end_idx = #dice + qty

    for idx = start_idx, end_idx do
        local pos = start_pos + offset * (idx - 1)
        local die = spawnObject({type = MODEL, position = pos, scale = {SCALE, SCALE, SCALE}, sound = false})
        die.setColorTint(NORMAL_COLOUR)
        table.insert(dice, die.getGUID())
        die.randomize()
    end
end

function beginRoll()
    -- Clear previously used dice and prepare for next roll
    if (CURRENT_ROLL_ID > 0) then clearDice(HISTORY[CURRENT_ROLL_ID]) end

    -- Create and store roll info
    local roll_info = createRollInfo()
    CURRENT_ROLL_ID = CURRENT_ROLL_ID + 1
    HISTORY[CURRENT_ROLL_ID] = roll_info

    onBegin(roll_info)

    createDice(true, roll_info.roll_dice, roll_info.roll_count, 1)

    -- Work out appropriate length of time for battle sound, then play correct one
    -- BATTLE_NOISE_CUBE.AssetBundle.playTriggerEffect(1)

    Wait.time(function() doRoll(roll_info, 1) end, DELAY)
end

function calculateHitResult(result, to_hit, roll_info)
    if (to_hit <= 6) then
        if (roll_info.one_hits_self and roll_info.on_roll_step and result == 1) then return {target = 'friendly', hits = 1} end
        if (roll_info.six_hits_twice and result == 6) then return {target = 'enemy', hits = 2} end
        if result >= to_hit then return {target = 'enemy', hits = 1} end
        return {target = 'miss', hits = 0}
    elseif (to_hit == 7) then
        -- Hit value is the die result, so always a hit
        return {target = 'enemy', hits = result}
    elseif (to_hit == 8) then
        -- 1 and 2 hits self, 5 and 6 hits enemy
        if (result <= 2) then return {target = 'friendly', hits = 1} end
        if (result >= 5) then return {target = 'enemy', hits = 1} end
        return {target = 'miss', hits = 0}
    elseif (to_hit == 9) then
        -- 1 hits self, 6 hits enemy
        if (result == 1) then return {target = 'friendly', hits = 1} end
        if (result == 6) then return {target = 'enemy', hits = 1} end
        return {target = 'miss', hits = 0}
    end
end

function doRoll(roll_info, start_die_idx)
    local dice = {}
    local results = {}
    local to_hit = 0
    local qty = 0
    if (roll_info.on_roll_step) then
        dice = roll_info.roll_dice
        results = roll_info.roll_results
        to_hit = roll_info.roll_to_hit
        qty = roll_info.roll_count
    else
        dice = roll_info.reroll_dice
        results = roll_info.reroll_results
        to_hit = roll_info.reroll_to_hit
        qty = roll_info.reroll_qty
    end

    local dice_settled_count = 0
    local dice_rolling_count = qty - start_die_idx + 1
    local is_rolling = {false, false, false, false, false}

    for die_idx = start_die_idx, qty do
        -- Stagger the rolls
        Wait.time(function()
            for r = 1, RANDOMIZE_COUNT do
                Wait.time(function()
                    local die = getObjectFromGUID(dice[die_idx])
                    if die == nil or die.isDestroyed() then
                        roll_info.roll_failed = true
                        return
                    end
                    die.roll()
                end, (r - 1) * RANDOMIZE_STAGGER_TIME)
            end
            is_rolling[die_idx] = true
        end, die_idx * STAGGER_TIME)

        -- Store the result and increment the rolls settled when the die is resting
        Wait.condition(function()
            local die = getObjectFromGUID(dice[die_idx])
            if die == nil or die.isDestroyed() then
                roll_info.roll_failed = true
                return
            end
            local result = die.getRotationValue()
            results[die_idx] = result
            hit_result = calculateHitResult(result, to_hit, roll_info)
            addHit(die_idx, die, hit_result, roll_info, roll_info.on_roll_step)
            dice_settled_count = dice_settled_count + 1
        end, function()
            local die = getObjectFromGUID(dice[die_idx])
            if (die == nil or die.isDestroyed()) then roll_info.failed = true end
            return roll_info.failed or is_rolling[die_idx] and die.resting
        end)
    end

    Wait.condition(function() onRollComplete(roll_info) end,
        function() return dice_settled_count == dice_rolling_count or roll_info.failed end)
end

function onRollComplete(roll_info)
    if (roll_info.failed) then
        onFail(roll_info)
        return
    end

    if (roll_info.on_roll_step) then
        roll_info.on_roll_step = false
        if (roll_info.misses_to_hits ~= 0) then missesToHits(roll_info) end

        roll_info.reroll_qty = math.min(roll_info.roll_count - roll_info.roll_die_hits, roll_info.reroll_count)
        if (roll_info.reroll_qty > 0) then
            local current_dice_qty = #roll_info.reroll_dice
            local missing_dice_qty = roll_info.reroll_qty - current_dice_qty
            createDice(false, roll_info.reroll_dice, missing_dice_qty, current_dice_qty + 1)
            Wait.time(function() doRoll(roll_info, current_dice_qty + 1) end, DELAY)
        else
            onComplete(roll_info)
        end
    else
        onComplete(roll_info)
    end
end

function missesToHits(roll_info)
    local hits_to_add = roll_info.misses_to_hits
    for die_idx = 1, #roll_info.roll_dice do
        if (hits_to_add ~= 0) then
            local dieGUID = roll_info.roll_dice[die_idx]
            local die = getObjectFromGUID(dieGUID)
            local hit_result = calculateHitResult(die.getRotationValue(), roll_info.roll_to_hit, roll_info)
            if (hit_result.hits == 0) then
                hit_result.hits = 1
                hit_result.target = 'enemy'
                addHit(die_idx, die, hit_result, roll_info, true)
                hits_to_add = hits_to_add - 1
            end
        end
    end
end

function adjustRoll(roll_info)
    roll_info.adjust_requested = false
    roll_info.completed = false

    local roll_dice_diff = ROLL_COUNT - roll_info.roll_count
    local old_roll_count = roll_info.roll_count
    local old_reroll_qty = roll_info.reroll_qty

    roll_info.roll_count = ROLL_COUNT
    roll_info.roll_to_hit = ROLL_TO_HIT
    roll_info.reroll_count = REROLL_COUNT
    roll_info.reroll_to_hit = REROLL_TO_HIT
    roll_info.six_hits_twice = SIX_HITS_TWICE
    roll_info.one_hits_self = ONE_HITS_SELF
    roll_info.misses_to_hits = MISSES_TO_HITS

    roll_info.roll_die_hits = 0
    roll_info.reroll_die_hits = 0
    roll_info.total_hits = 0
    roll_info.friendly_hits = 0

    -- Remove extra roll dice
    if (roll_dice_diff < 0) then
        local dice_to_remove = math.abs(roll_dice_diff)
        for i = 1, dice_to_remove do
            local dieGUID = roll_info.roll_dice[#roll_info.roll_dice]
            if (dieGUID == nil) then
                onFail(roll_info)
                return
            end
            local die = getObjectFromGUID(dieGUID)
            if (die == nil) then
                onFail(roll_info)
                return
            end
            die.destruct()
            table.remove(roll_info.roll_results, #roll_info.roll_dice)
            table.remove(roll_info.roll_dice, #roll_info.roll_dice)
        end
    end

    -- Recalculate hits
    for die_idx = 1, #roll_info.roll_dice do
        local dieGUID = roll_info.roll_dice[die_idx]
        if (dieGUID == nil) then
            onFail(roll_info)
            return
        end
        local die = getObjectFromGUID(dieGUID)
        if (die == nil) then
            onFail(roll_info)
            return
        end
        local hit_result = calculateHitResult(die.getRotationValue(), roll_info.roll_to_hit, roll_info)
        addHit(die_idx, die, hit_result, roll_info, true)
    end

    if (roll_info.misses_to_hits ~= 0) then missesToHits(roll_info) end

    -- Remove extra reroll dice
    local new_reroll_qty = math.min(roll_info.roll_count - roll_info.roll_die_hits, roll_info.reroll_count)
    local reroll_qty_diff = new_reroll_qty - old_reroll_qty
    roll_info.reroll_qty = new_reroll_qty
    if (reroll_qty_diff < 0) then
        local dice_to_remove = math.abs(reroll_qty_diff)
        for i = 1, dice_to_remove do
            local dieGUID = roll_info.reroll_dice[#roll_info.reroll_dice]
            if (dieGUID == nil) then
                onFail(roll_info)
                return
            end
            local die = getObjectFromGUID(dieGUID)
            if (die == nil) then
                onFail(roll_info)
                return
            end
            die.destruct()
            table.remove(roll_info.reroll_results, #roll_info.reroll_dice)
            table.remove(roll_info.reroll_dice, #roll_info.reroll_dice)
        end
    end

    -- Recalculate reroll hits
    for die_idx = 1, #roll_info.reroll_dice do
        local dieGUID = roll_info.reroll_dice[die_idx]
        if (dieGUID == nil) then
            onFail(roll_info)
            return
        end
        local die = getObjectFromGUID(dieGUID)
        if (die == nil) then
            onFail(roll_info)
            return
        end
        local hit_result = calculateHitResult(die.getRotationValue(), roll_info.reroll_to_hit, roll_info)
        addHit(die_idx, die, hit_result, roll_info, false)
    end

    -- Now we do redo our missing rolls
    if (roll_dice_diff > 0) then
        -- Create extra dice and roll, it will automatically handle rerolls as required
        roll_info.on_roll_step = true
        onBegin(roll_info)
        createDice(true, roll_info.roll_dice, roll_dice_diff, old_roll_count + 1)
        Wait.time(function() doRoll(roll_info, old_roll_count + 1) end, DELAY)
    elseif (reroll_qty_diff > 0) then
        -- Create extra reroll dice and roll
        roll_info.on_roll_step = false
        onBegin(roll_info)
        createDice(false, roll_info.reroll_dice, reroll_qty_diff, old_reroll_qty + 1)
        Wait.time(function() doRoll(roll_info, old_reroll_qty + 1) end, DELAY)
    else
        onComplete(roll_info)
    end
end

function uiSetAdjustRoll()
    if (CURRENT_ROLL_ID ~= 0) then
        local roll_info = HISTORY[CURRENT_ROLL_ID]
        if (roll_info.type == CURRENT_PANEL and not roll_info.cleared) then
            self.UI.setAttribute('btn' .. roll_info.type .. 'Adjust', 'interactable', false)
            if (roll_info.completed) then
                adjustRoll(roll_info)
            else
                roll_info.adjust_requested = true
            end
        end
    end
end

function onInputChange(input_name)
    if (CURRENT_ROLL_ID ~= 0) then
        local roll_info = HISTORY[CURRENT_ROLL_ID]
        if (roll_info.type == CURRENT_PANEL and not roll_info.cleared) then
            if (not roll_info.adjust_requested) then
                self.UI.setAttribute('btn' .. roll_info.type .. 'Adjust', 'interactable', true)
            end
        end
    end
end

function uiClearRoll()
    if CURRENT_ROLL_ID ~= 0 then
        clearDice(HISTORY[CURRENT_ROLL_ID])
        zeroUIHits(HISTORY[CURRENT_ROLL_ID].type)
    end
end

function switchToHunt(params)
    activatePanel('Hunt')
    setRollCount(params.HuntLevel)
    setRollToHit(params.ToHit)
    setRerollCount(params.ReRolls)
end

function switchToCombat(params)
    activatePanel('Combat')
    setRollCount(params.Strength)
    setRerollCount(params.Leadership)
    setRollToHit(5)
    setRerollToHit(5)
end

-- Currently unused, stub for linking rollers together
function uiReadyForCombat()
    if (SIDE_SA) then
        ROLLER_SA_READY = not ROLLER_SA_READY
        if (ROLLER_SA_READY) then
            self.UI.setAttribute('btnCombatReady', 'color', COLOUR.btn_bottom_ready)
        else
            self.UI.setAttribute('btnCombatReady', 'color', COLOUR.btn_bottom)
        end
    else
        ROLLER_FP_READY = not ROLLER_FP_READY
        if (ROLLER_FP_READY) then
            self.UI.setAttribute('btnCombatReady', 'color', COLOUR.btn_bottom_ready)
            ROLLER_SA.call('sendFPCombatState', {ready = true, fp_roll_count = ROLL_COUNT, fp_reroll_count = REROLL_COUNT})
        else
            self.UI.setAttribute('btnCombatReady', 'color', COLOUR.btn_bottom)
            ROLLER_SA.call('sendFPCombatState', {ready = false})
        end
    end
end

-- Currently unused, stub for linking rollers together
function sendFPCombatState(params)
    ROLLER_FP_READY = params.ready

    if (params.ready) then

    else

    end
end

-- Currently unused, stub for linking rollers together
function beginCombat() if (not (ROLLER_SA_READY and ROLLER_FP_READY)) then return end end

function setUIHits(roll_info, panel_name)
    self.UI.setAttribute('txt' .. roll_info.type .. 'HitsEnemy', 'text', roll_info.total_hits)
    self.UI.setAttribute('txt' .. roll_info.type .. 'HitsFriendly', 'text', roll_info.friendly_hits)
    self.UI.setAttribute('txt' .. roll_info.type .. 'Hits', 'text', roll_info.total_hits)
end

function zeroUIHits(panel_name)
    self.UI.setAttribute('txt' .. panel_name .. 'HitsEnemy', 'text', '-')
    self.UI.setAttribute('txt' .. panel_name .. 'HitsFriendly', 'text', '-')
    self.UI.setAttribute('txt' .. panel_name .. 'Hits', 'text', '-')
end

function onBegin(roll_info)
    self.UI.setAttribute('btn' .. roll_info.type .. 'Roll', 'interactable', false)
    self.UI.setAttribute('btn' .. roll_info.type .. 'Clear', 'interactable', false)
    self.UI.setAttribute('btn' .. roll_info.type .. 'Adjust', 'interactable', false)
    setUIHits(roll_info)
end

function onComplete(roll_info)
    if (roll_info.adjust_requested) then
        adjustRoll(roll_info)
    else
        roll_info.completed = true
        self.UI.setAttribute('btn' .. roll_info.type .. 'Roll', 'interactable', true)
        self.UI.setAttribute('btn' .. roll_info.type .. 'Clear', 'interactable', true)
    end
end

function addHit(die_idx, die, hit_result, roll_info, on_roll_step)
    if (hit_result.hits ~= 0) then
        local die_hit = math.min(math.max(-1, hit_result.hits), 1)
        if (on_roll_step) then
            roll_info.roll_die_hits = roll_info.roll_die_hits + die_hit
        else
            roll_info.reroll_die_hits = roll_info.reroll_die_hits + die_hit
        end
        if (hit_result.target == 'enemy') then
            roll_info.total_hits = roll_info.total_hits + hit_result.hits
            die.setColorTint(ENEMY_HIT_COLOUR)
        elseif (hit_result.target == 'friendly') then
            roll_info.friendly_hits = roll_info.friendly_hits + hit_result.hits
            die.setColorTint(FRIENDLY_HIT_COLOUR)
        end

        setUIHits(roll_info)
    else
        die.setColorTint(NORMAL_COLOUR)
    end

    if (hit_result.hits > 0) then
        if (roll_info.type == 'Combat' or roll_info.type == 'General') then
            local cube_idx = die_idx
            local sound_idx = math.random(1, BATTLE_HITS_COUNT)
            if (SIDE_SA) then
                cube_idx = cube_idx + 5
                sound_idx = sound_idx + BATTLE_HITS_COUNT
            end
            BATTLE_HITS_CUBES[cube_idx].AssetBundle.playTriggerEffect(sound_idx)
        elseif (roll_info.type == 'Hunt') then
            if (roll_info.total_hits == 1) then
                -- Play a successful hunt sound! but only on the first success
            end
        end
    end
end

function onFail(roll_info)
    print('ERROR: Dice roll failed - most likely from dice being manually deleted while running')
    clearDice(roll_info)
    reloadRollPanel(roll_info.type)
end
