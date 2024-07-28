require "SotnCore"

-- TODO(sestren): Figure out how to handle the canvas going away

-- NOTE(sestren): Karma Coin RNG can't easily be restored to random after 
-- NOTE(sestren): fixing, unfortunately. This is due to the game loading in 
-- NOTE(sestren): weapon logic, and would require more work than I am willing
-- NOTE(sestren): to put in right now to account for it
    -- 00000000
    -- A6600050
    -- 0C005839
    -- A6600052
    -- 30420001 <-- HOOK
    -- 10400005
    -- 00000000

local P = {}
StaticRNG = P

P.Stage = {
    MARBLE_GALLERY = 0x00,
    OUTER_WALL = 0x01,
    LONG_LIBRARY = 0x02,
    CATACOMBS = 0x03,
    OLROXS_QUARTERS = 0x04,
    ABANDONED_MINE = 0x05,
    ROYAL_CHAPEL = 0x06,
    CASTLE_ENTRANCE_2 = 0x07,
    CASTLE_CENTER = 0x08,
    UNDERGROUND_CAVERNS = 0x09,
    COLOSSEUM = 0x0A,
    CASTLE_KEEP = 0x0B,
    ALCHEMY_LABORATORY = 0x0C,
    CLOCK_TOWER = 0x0D,
    WARP_ROOM = 0x0E,
    BOSS_SUCCUBUS = 0x12,
    BOSS_CERBERUS = 0x16,
    MARIA_CUTSCENE_IN_CLOCK_ROOM = 0x17,
    BOSS_RICHTER = 0x18,
    BOSS_HIPPOGRYPH = 0x19,
    BOSS_DOPPELGANGER10 = 0x1A,
    BOSS_SCYLLA = 0x1B,
    BOSS_MINOTAUR_AND_WEREWOLF = 0x1C,
    BOSS_GRANFALOON = 0x1D,
    BOSS_OLROX = 0x1E,
    PROLOGUE = 0x1F,
    BLACK_MARBLE_GALLERY = 0x20,
    REVERSE_OUTER_WALL = 0x21,
    FORBIDDEN_LIBRARY = 0x22,
    FLOATING_CATACOMBS = 0x23,
    DEATH_WINGS_LAIR = 0x24,
    CAVE = 0x25,
    ANTI_CHAPEL = 0x26,
    REVERSE_ENTRANCE = 0x27,
    REVERSE_CASTLE_CENTER = 0x28,
    REVERSE_CAVERNS = 0x29,
    REVERSE_COLOSSEUM = 0x2A,
    REVERSE_KEEP = 0x2B,
    NECROMANCY_LABORATORY = 0x2C,
    REVERSE_CLOCK_TOWER = 0x2D,
    REVERSE_WARP_ROOM = 0x2E,
    BOSS_DARWKING_BAT = 0x35,
    BOSS_GALAMOTH = 0x36,
    BOSS_AKMODAN_II = 0x37,
    BOSS_DRACULA = 0x38,
    BOSS_DOPPELGANGER40 = 0x39,
    BOSS_CREATURE = 0x3A,
    BOSS_MEDUSA = 0x3B,
    BOSS_DEATH = 0x3C,
    BOSS_BEELZEBUB = 0x3D,
    BOSS_TRIO = 0x3E,
    -- DEBUG_ROOM = 0x40,
    CASTLE_ENTRANCE = 0x41,
}

P.stage_id = function()
    local result = mainmemory.read_u32_le(0x0974A0)
    return result
end

P.addresses = {
    [P.Stage.PROLOGUE] = 0x801B1898,
    [P.Stage.CASTLE_ENTRANCE] = 0x801C1878,
    [P.Stage.CASTLE_ENTRANCE_2] = 0x801B90E8,
    [P.Stage.ALCHEMY_LABORATORY] = 0x801B9500,
    [P.Stage.MARBLE_GALLERY] = 0x801C37B4,
    [P.Stage.WARP_ROOM] = 0x80188214,
    [P.Stage.OUTER_WALL] = 0x801C1A1C,
    [P.Stage.BOSS_DOPPELGANGER10] = 0x801B69E8,
    [P.Stage.OLROXS_QUARTERS] = 0x801B8740,
    [P.Stage.COLOSSEUM] = 0x801B8700,
    [P.Stage.BOSS_MINOTAUR_AND_WEREWOLF] = 0x801A769C,
    [P.Stage.LONG_LIBRARY] = 0x801BF15C,
    [P.Stage.CLOCK_TOWER] = 0x801AC70C,
    [P.Stage.CASTLE_KEEP] = 0x801AD65C,
    [P.Stage.ROYAL_CHAPEL] = 0x801C5FB4,
    [P.Stage.BOSS_HIPPOGRYPH] = 0x801A6BE0,
    [P.Stage.UNDERGROUND_CAVERNS] = 0x801CA61C,
    [P.Stage.BOSS_SCYLLA] = 0x801A6730,
    [P.Stage.BOSS_SUCCUBUS] = 0x80196FBC,
    [P.Stage.ABANDONED_MINE] = 0x8019DEA0,
    [P.Stage.BOSS_CERBERUS] = 0x80196674,
    [P.Stage.CATACOMBS] = 0x801BB6D0,
    [P.Stage.BOSS_GRANFALOON] = 0x801A55CC,
    [P.Stage.CASTLE_CENTER] = 0x80190E78,
    [P.Stage.MARIA_CUTSCENE_IN_CLOCK_ROOM] = 0x8018CF9C,
    [P.Stage.BOSS_RICHTER] = 0x801A9B80,
    [P.Stage.REVERSE_KEEP] = 0x801A2520,
    [P.Stage.REVERSE_CLOCK_TOWER] = 0x801ACECC,
    [P.Stage.REVERSE_OUTER_WALL] = 0x801A9CC8,
    [P.Stage.FORBIDDEN_LIBRARY] = 0x801A2B8C,
    [P.Stage.ANTI_CHAPEL] = 0x801B4658,
    [P.Stage.BOSS_MEDUSA] = 0x801931C4,
    [P.Stage.DEATH_WINGS_LAIR] = 0x801B6D1C,
    [P.Stage.REVERSE_COLOSSEUM] = 0x801A6B6C,
    [P.Stage.BLACK_MARBLE_GALLERY] = 0x801B7350,
    [P.Stage.NECROMANCY_LABORATORY] = 0x801ACC30,
    [P.Stage.CAVE] = 0x8019AC20,
    [P.Stage.BOSS_DEATH] = 0x801A1AAC,
    [P.Stage.FLOATING_CATACOMBS] = 0x801B3F7C,
    [P.Stage.REVERSE_CAVERNS] = 0x801CA210,
    [P.Stage.REVERSE_CASTLE_CENTER] = 0x801A0498,
    [P.Stage.REVERSE_ENTRANCE] = 0x801B3EDC,
    [P.Stage.BOSS_BEELZEBUB] = 0x80195170,
    [P.Stage.BOSS_AKMODAN_II] = 0x80195F00,
    [P.Stage.BOSS_CREATURE] = 0x80198E38,
    [P.Stage.BOSS_TRIO] = 0x8019A090,
    [P.Stage.BOSS_DOPPELGANGER40] = 0x801B591C,
    [P.Stage.BOSS_DARWKING_BAT] = 0x801ACECC,
    [P.Stage.BOSS_GALAMOTH] = 0x80199DC4,
    [P.Stage.BOSS_OLROX] = 0x801BC108,
    [P.Stage.BOSS_DRACULA] = 0x801A54E8,
    [P.Stage.REVERSE_WARP_ROOM] = 0x8018A194,
}

P.global_sources = {
    ['Stage Nice RNG'] = { type = 'room', param1 = 0x00 },
}

P.text = function(__col, __row, __message, __color)
    local font_height = 12
    local font_width = 8
    if __color == nil then
        __color = 0xff999999
    end
    local x = font_width * (__col + 0.5)
    local y = font_height * (__row + 0.5)
    P.canvas.DrawText(x, y, __message, __color, 0xff000000, font_height)
end

P.pad = function(__number, __digits, __pad)
    local result = tostring(__number)
    while #result < __digits do
        result = __pad..result
    end
    return result
end

P.food = function(__food_id)
    local foods = {
        "ora", -- "Orange",
        "app", -- "Apple",
        "ban", -- "Banana",
        "grp", -- "Grapes",
        "str", -- "Strawberry",
        "pin", -- "Pineapple",
        "pnt", -- "Peanuts",
        "tod", -- "Toadstool",
        "shi", -- "Shiitake",
        "chk", -- "Cheesecake",
        "shk", -- "Shortcake",
        "tar", -- "Tart",
        "par", -- "Parfait",
        "pud", -- "Pudding",
        "ice", -- "Ice cream",
        "fra", -- "Frankfurter",
        "bur", -- "Hamburger",
        "piz", -- "Pizza",
        "chz", -- "Cheese",
        "ham", -- "Ham and eggs",
        "ome", -- "Omelette",
        "mor", -- "Morning set",
        "lna", -- "Lunch A",
        "lnb", -- "Lunch B",
        "cry", -- "Curry rice",
        "gyr", -- "Gyros plate",
        "spg", -- "Spaghetti",
        "juc", -- "Grape juice",
        "bat", -- "Barley tea",
        "grt", -- "Green tea",
        "nat", -- "Natou",
        "ram", -- "Ramen",
        "mis", -- "Miso soup",
        "sus", -- "Sushi",
        "por", -- "Pork bun",
        "red", -- "Red bean bun",
        "chi", -- "Chinese bun",
        "dim", -- "Dim Sum set",
        "pot", -- "Pot roast",
        "sir", -- "Sirloin",
        "tur", -- "Turkey"
    }
    local result = string.upper(foods[1 + __food_id])
    return result
end

P.coin = function(__side_id)
    local sides = {
        "T", -- "Tails",
        "H", -- "Heads",
    }
    local result = sides[1 + __side_id]
    return result
end

P.draw = function()
    P.canvas.Clear(0xff000000)
    -- Show nice RNG info
    P.text(6, 1, "  "..SotnCore.hex(P.fixed_nice_rng, 2).."   "..
        P.pad(1 + P.fixed_nice_rng % 2, 2, " ").."   "..
        P.pad(1 + P.fixed_nice_rng % 8, 2, " ").."   "..
        P.pad(1 + P.fixed_nice_rng % 16, 2, " ").."   "..
        P.pad(1 + P.fixed_nice_rng % 32, 2, " ").."   "..
        "--".."  "..
        P.pad(1 + P.fixed_nice_rng % 256, 3, " ")
    )
    -- Blink sign on any activity
    local nice_delta = P.nice_index - P.prev_nice_index
    local nice_color = 0xff005500
    if nice_delta > 0 then
        nice_flash = true
        nice_color = 0xffccffcc
    elseif nice_flash then
        nice_flash = false
        nice_color = 0xff00ff00
    end
    P.text(4, 1, "■", nice_color)
    -- Show evil RNG info
    P.text(6, 2, SotnCore.hex(P.fixed_evil_rng, 4).."    "..
        P.coin(P.fixed_evil_rng % 2).."   "..
        P.pad(1 + P.fixed_evil_rng % 8, 2, " ").."   "..
        P.pad(1 + P.fixed_evil_rng % 16, 2, " ").."   "..
        P.pad(1 + P.fixed_evil_rng % 32, 2, " ").."  "..
        P.food(P.fixed_evil_rng % 41).."  "..
        P.pad(1 + P.fixed_evil_rng % 256, 3, " ")
    )
    -- Blink sign on extra activity
    local evil_delta = P.evil_index - P.prev_evil_index
    local evil_color = 0xff550000
    if evil_delta > 1 then
        evil_flash = true
        evil_color = 0xffffcccc
    elseif evil_flash then
        evil_flash = false
        evil_color = 0xffff0000
    end
    P.text(4, 2, "■", evil_color)
    P.text(0, 1, "nice", 0xff00ff00)
    P.text(0, 2, "evil", 0xffff0000)
    P.text(6, 0, "value  D2   D8  D16  D32  D41 D256", 0xffffffff, 0xff000000)
    -- Blink on player activity
    local frames_since_active = emu.framecount() - P.active_frame
    local activity_color = 0xff000055
    if frames_since_active == 0 then
        activity_color = 0xff0000ff
    elseif frames_since_active == 1 then
        activity_color = 0xff0000cc
    end
    P.text(0, 0, "...", activity_color)
    P.canvas.Refresh()
end

P.update = function()
    -- Reset counters if they fall behind (after loading a save state, for example)
    if emu.framecount() < P.active_frame then
        P.active_frame = emu.framecount()
    end
    if emu.framecount() < P.rng_change_frame then
        P.rng_change_frame = emu.framecount()
    end
    -- If the player goes idle, start shuffling the RNG periodically
    if mainmemory.read_u32_le(0x072EE8) ~= 0 then
        P.active_frame = emu.framecount()
    end
    local frames_since_active = emu.framecount() - P.active_frame
    local frames_since_rng_change = emu.framecount() - P.rng_change_frame
    local stale_ind = false
    if (
        frames_since_active >= P.idle_frames and
        frames_since_rng_change >= P.cycle_frames
    ) then
        stale_ind = true
    end
    if stale_ind then
        P.rng_change_frame = emu.framecount()
        P.fixed_nice_rng = math.random(0x00, 0xFF)
        P.fixed_evil_rng = math.random(0x00, 0x7FFF)
    end
    -- Assign Evil RNG
    memory.write_u32_le(0x002224, BizMath.bor(0x34020000, P.fixed_evil_rng), 'BiosROM')
    -- Assign Nice RNG, if it can be found in Stage memory
    local address = P.addresses[P.stage_id()]
    if address ~= nil then
        local rng_value = BizMath.band(P.fixed_nice_rng, 0xFF)
        local instruction = 0x34020000 | rng_value
        mainmemory.write_u32_le(address - 0x80000000, instruction)
    end
    -- Update previous frame information
    P.prev_nice_index = P.nice_index
    P.prev_evil_index = P.evil_index
    local nice_seed = SotnCore.read_nice_seed()
    local evil_seed = SotnCore.read_evil_seed()
    P.nice_index = SotnCore.nice_seed_index(nice_seed)
    P.evil_index = SotnCore.evil_seed_index(evil_seed)
end

event.unregisterbyname("StaticRNG__update")
event.onframeend(P.update, "StaticRNG__update")

gui.defaultBackground(0xffff0000)

P.active_frame = 0
P.rng_change_frame = 0
P.prev_nice_index = 0
P.prev_evil_index = 0
P.nice_index = 0
P.evil_index = 0
P.evil_flash = false
P.nice_flash = false
P.fixed_nice_rng = 0xFF
P.fixed_evil_rng = 0x7FFF

-- NOTE(sestren): These are configurable
P.scale = 1
P.idle_frames = 60
P.cycle_frames = 30

P.canvas_width = P.scale * 320
P.canvas_height = P.scale * 56
P.canvas = gui.createcanvas(P.canvas_width, P.canvas_height, P.scale * 4, P.scale * 4)
P.canvas.SetTitle("StaticRNG")

P.update()
while true do
    emu.yield()
    P.draw()
end