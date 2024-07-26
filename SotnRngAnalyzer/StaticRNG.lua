require "SotnCore"

-- TODO(sestren): Figure out how to handle the canvas going away

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
    REVERSE_CAVERNS = 0x29,
    REVERSE_COLOSSEUM = 0x2A,
    REVERSE_KEEP = 0x2B,
    NECROMANCY_LABORATORY = 0x2C,
    REVERSE_CLOCK_TOWER = 0x2D,
    REVERSE_WARP_ROOM = 0x2E,
    BOSS_GALAMOTH = 0x36,
    BOSS_AKMODAN_II = 0x37,
    BOSS_SHAFT = 0x38,
    BOSS_DOPPELGANGER40 = 0x39,
    BOSS_CREATURE = 0x3A,
    BOSS_MEDUSA = 0x3B,
    BOSS_DEATH = 0x3C,
    BOSS_BEELZEBUB = 0x3D,
    BOSS_TRIO = 0x3E,
    CASTLE_ENTRANCE = 0x41,
}

P.stage_id = function()
    local result = mainmemory.read_u32_le(0x0974A0)
    return result
end

P.room_id = function()
    local result = mainmemory.read_u32_le(0x1375BC)
    return result
end

P.injections = {
    ['nop'] = { instruction = 0x00000000, mask = 0x0000 },
    ['li v0, X'] = { instruction = 0x34020000, mask = 0x7FFF },
    ['li a0, X'] = { instruction = 0x34040000, mask = 0x7FFF },
    ['li a1, X'] = { instruction = 0x34050000, mask = 0x7FFF },
    ['li s0, X'] = { instruction = 0x34100000, mask = 0x7FFF },
    ['li s1, X'] = { instruction = 0x34110000, mask = 0x7FFF },
    ['slti v0, v0, X'] = { instruction = 0x28420000, mask = 0x7FFF },
    ['slti v0, s1, X'] = { instruction = 0x2A220000, mask = 0x7FFF },
    ['sll v0, X'] = { instruction = 0x00021000, mask = 0x001F, multiplier = 64 },
    ['sll v0, v1, X'] = { instruction = 0x00031000, mask = 0x001F, multiplier = 64 },
    ['srl v0, $18'] = { instruction = 0x00021602, mask = 0x0000 },
    ['andi s1, v0, X'] = { instruction = 0x30510000, mask = 0x7FFF },
    ['addiu v0, X'] = { instruction = 0x24420000, mask = 0x7FFF },
    ['addiu a0, v0, X'] = { instruction = 0x24440000, mask = 0x7FFF },
    ['addiu a1, a0, X'] = { instruction = 0x24850000, mask = 0x7FFF },
    ['la v0, X'] = { instruction = 0x24850000, mask = 0x7FFF },
    ['lw a0, X(s3)'] = { instruction = 0x8E640000, mask = 0x7FFF },
    ['lw v0, X(s3)'] = { instruction = 0x8E620000, mask = 0x7FFF },
    ['lw v1, X(a1)'] = { instruction = 0x8CA30000, mask = 0x7FFF },
    ['lw a1, X(a1)'] = { instruction = 0x8CA50000, mask = 0x7FFF },
    ['copy'] = { instruction = 0x00000000, mask = 0xFFFFFFFF },
}

P.hooks = {
    [P.Stage.PROLOGUE] = { -- jal $801B186C
        ['Stage Nice RNG'] = { address = 0x801B1898, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CASTLE_ENTRANCE] = { -- jal $801C184C, search for 0C070613
        ['Stage Nice RNG'] = { address = 0x801C1878, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CASTLE_ENTRANCE_2] = { -- jal $801B90BC, search for 0C06E42F
        ['Stage Nice RNG'] = { address = 0x801B90E8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.ALCHEMY_LABORATORY] = { -- jal $801B94D4 -- Also Slogra and Gaibon
        ['Stage Nice RNG'] = { address = 0x801B9500, default = 0x00021602, injection = 'li v0, X', mask = 0x00 },
        ['Green Axe Knight - Attack RNG'] = { address = 0x801C4584, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
        ['Bloody Zombie'] = { address = 0x801C5714, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
        ['Spittlebone'] = { address = 0x801C68E8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
        ['Slogra - Taunt Check'] = { address = 0x801B4B58, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
        ['Karma Coin'] = { address = 0x8017E358, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    },
    [P.Stage.MARBLE_GALLERY] = { -- jal $801C3788, search for 0C070DE2
        ['Stage Nice RNG'] = { address = 0x801C37B4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
        ['Diplocephalus'] = { address = 0x801D1648, default = 0x3042007F, injection = 'li v0, X', mask = 0x7F },
        ['Flea Man'] = { address = 0x801DC904, default = 0x30510007, injection = 'li s1, X', mask = 0x07 },
    },
    [P.Stage.WARP_ROOM] = { -- jal $801881E8, search for 0C06207A
        -- ['Stage Nice RNG'] = { address = 0x80188214, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.OUTER_WALL] = { -- jal $801C19F0, search for 0C07067C
        ['Stage Nice RNG'] = { address = 0x801C1A1C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_DOPPELGANGER10] = { -- jal $801B69BC, search for 0C06DA6F
        ['Stage Nice RNG'] = { address = 0x801B69E8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.OLROXS_QUARTERS] = { -- jal $801B8714, search for 0C06E1C5
        ['Stage Nice RNG'] = { address = 0x801B8740, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.COLOSSEUM] = { -- jal $801B86D4, search for 0C06E1B5
        ['Stage Nice RNG'] = { address = 0x801B8700, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_MINOTAUR_AND_WEREWOLF] = { -- jal $801A7670, search for 0C069D9C
        ['Stage Nice RNG'] = { address = 0x801A769C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.LONG_LIBRARY] = { -- jal $801BF130, search for 0C06FC4C
        ['Stage Nice RNG'] = { address = 0x801BF15C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
        ['Spellbook - Rotation 1'] = { address = 0x801D25B0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
        ['Spellbook - Rotation 2'] = { address = 0x801D25C0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
        ['Spellbook - Rotation 3'] = { address = 0x801D25D0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    },
    [P.Stage.CLOCK_TOWER] = { -- jal $801AC6E0, search for 0C06B1B8 -- Also Karasuman
        ['Stage Nice RNG'] = { address = 0x801AC70C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CASTLE_KEEP] = { -- jal $801AD630, search for 0C06B58C
        ['Stage Nice RNG'] = { address = 0x801AD65C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.ROYAL_CHAPEL] = { -- jal $801C5F88, search for 0C0717E2
        ['Stage Nice RNG'] = { address = 0x801C5FB4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_HIPPOGRYPH] = { -- jal $801A6BB4, search for 0C069AED
        ['Stage Nice RNG'] = { address = 0x801A6BE0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.UNDERGROUND_CAVERNS] = { -- jal $801CA5F0, search for 0C07297C
        ['Stage Nice RNG'] = { address = 0x801CA61C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_SCYLLA] = { -- jal $801A6704, search for 0C0699C1
        ['Stage Nice RNG'] = { address = 0x801A6730, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_SUCCUBUS] = { -- jal $80196F90, search for 0C065BE4
        ['Stage Nice RNG'] = { address = 0x80196FBC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.ABANDONED_MINE] = { -- jal $8019DE74, search for 0C06779D
        ['Stage Nice RNG'] = { address = 0x8019DEA0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_CERBERUS] = { -- jal $80196648, search for 0C065992
        ['Stage Nice RNG'] = { address = 0x80196674, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CATACOMBS] = { -- jal $801BB6A4, search for 0C06EDA9
        ['Stage Nice RNG'] = { address = 0x801BB6D0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_GRANFALOON] = { -- jal $801A55A0, search for 0C069568
        ['Stage Nice RNG'] = { address = 0x801A55CC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CASTLE_CENTER] = { -- jal $80190C4C ???, search for ???
        ['Stage Nice RNG'] = { address = 0x80190E78, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_RICHTER] = { -- jal $801A9B54, search for 0C06A6D5
        ['Stage Nice RNG'] = { address = 0x801A9B80, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_KEEP] = { -- jal $801A24F4, search for 0C06893D
        ['Stage Nice RNG'] = { address = 0x801A2520, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_CLOCK_TOWER] = { -- jal $801ACEA0, search for 0C06B3A8 -- Also Darkwing Bat
        ['Stage Nice RNG'] = { address = 0x801ACECC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_OUTER_WALL] = { -- jal $801A9C9C, search for 0C06A727
        ['Stage Nice RNG'] = { address = 0x801A9CC8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.FORBIDDEN_LIBRARY] = { -- jal $801A2B60, search for 0C068AD8
        ['Stage Nice RNG'] = { address = 0x801A2B8C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.ANTI_CHAPEL] = { -- jal $801B462C, search for 0C06D18B
        ['Stage Nice RNG'] = { address = 0x801B4658, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_MEDUSA] = { -- jal $80193198, search for 0C064C66
        ['Stage Nice RNG'] = { address = 0x801931C4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.DEATH_WINGS_LAIR] = { -- jal $801B6CF0, search for 0C06DB3C
        ['Stage Nice RNG'] = { address = 0x801B6D1C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_COLOSSEUM] = { -- jal $801A6B40, search for 0C069AD0
        ['Stage Nice RNG'] = { address = 0x801A6B6C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BLACK_MARBLE_GALLERY] = { -- jal $801B7324, search for 0C06DCC9
        ['Stage Nice RNG'] = { address = 0x801B7350, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.NECROMANCY_LABORATORY] = { -- jal $801ACC04, search for 0C06B301
        ['Stage Nice RNG'] = { address = 0x801ACC30, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.CAVE] = { -- jal $8019ABF4, search for 0C066AFD
        ['Stage Nice RNG'] = { address = 0x8019AC20, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_DEATH] = { -- jal $801A1A80, search for 0C0686A0
        ['Stage Nice RNG'] = { address = 0x801A1AAC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.FLOATING_CATACOMBS] = { -- jal $801B3F50, search for 0C06CFD4
        ['Stage Nice RNG'] = { address = 0x801B3F7C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_CAVERNS] = { -- jal $801CA1E4, search for 0C072879
        ['Stage Nice RNG'] = { address = 0x801CA210, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_ENTRANCE] = { -- jal $801B3EB0, search for 0C06CFAC
        ['Stage Nice RNG'] = { address = 0x801B3EDC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_BEELZEBUB] = { -- jal $80195144, search for 0C0xxxxx
        ['Stage Nice RNG'] = { address = 0x80195170, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_AKMODAN_II] = { -- jal $80xxxxxx, search for 0C0xxxxx
        ['Stage Nice RNG'] = { address = 0x80195F00, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_CREATURE] = { -- jal $8019xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x80198E38, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_TRIO] = { -- jal $8019xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x8019A090, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_DOPPELGANGER40] = { -- jal $8019xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x801B591C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_GALAMOTH] = { -- jal $8019xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x80199DC4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_OLROX] = { -- jal $8019xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x801BC108, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.BOSS_SHAFT] = { -- jal $8019xxxx, search for 0C06xxxx
        -- ['Stage Nice RNG'] = { address = 0x801BC108, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    },
    [P.Stage.REVERSE_WARP_ROOM] = { -- jal $8018xxxx, search for 0C06xxxx
        ['Stage Nice RNG'] = { address = 0x8018A194, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    }
}

P.global_sources = {
    ['Stage Nice RNG'] = { type = 'room', param1 = 0x00 },
}

P.stage_sources = {}

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
        "cak", -- "Cheesecake",
        "sho", -- "Shortcake",
        "tar", -- "Tart",
        "par", -- "Parfait",
        "pud", -- "Pudding",
        "ice", -- "Ice cream",
        "fra", -- "Frankfurter",
        "bur", -- "Hamburger",
        "piz", -- "Pizza",
        "chz", -- "Cheese",
        "egg", -- "Ham and eggs",
        "let", -- "Omelette",
        "mor", -- "Morning set",
        "lna", -- "Lunch A",
        "lnb", -- "Lunch B",
        "cry", -- "Curry rice",
        "gyr", -- "Gyros plate",
        "get", -- "Spaghetti",
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
    P.text(5, 1, SotnCore.hex(P.room_nice_rng, 2).."      "..
        P.pad(1 + P.room_nice_rng % 2, 2, " ").."   "..
        P.pad(1 + P.room_nice_rng % 8, 2, " ").."   "..
        P.pad(1 + P.room_nice_rng % 16, 2, " ").."   "..
        P.pad(1 + P.room_nice_rng % 32, 2, " ").."   "..
        "--".."  "..
        P.pad(1 + P.room_nice_rng % 256, 3, " ")
    )
    P.text(5, 0, "rng     D2   D8  D16  D32  D41 D256", 0xffffffff, 0xff000000)
    -- Show evil RNG info
    P.text(5, 2, SotnCore.hex(P.room_evil_rng, 4).."     "..
        P.coin(P.room_evil_rng % 2).."   "..
        P.pad(1 + P.room_evil_rng % 8, 2, " ").."   "..
        P.pad(1 + P.room_evil_rng % 16, 2, " ").."   "..
        P.pad(1 + P.room_evil_rng % 32, 2, " ").."  "..
        P.food(P.room_evil_rng % 41).."  "..
        P.pad(1 + P.room_evil_rng % 256, 3, " ")
    )
    P.text(0, 1, "nice", 0xff00ff00)
    P.text(0, 2, "evil", 0xffff0000)
    P.canvas.Refresh()
end

P.update = function()
    local nice_delta = P.nice_index - P.prev_nice_index
    if mainmemory.read_u32_le(0x072EE8) ~= 0 then
        P.active_frame = emu.framecount()
    end
    local frames_since_active = emu.framecount() - P.active_frame
    local frames_since_rng_change = emu.framecount() - P.rng_change_frame
    local stale_ind = false
    if (
        frames_since_active >= 120 and
        frames_since_rng_change >= 60
    ) then
        stale_ind = true
    end
    if P.room_id() ~= P.prev_room_id then
        -- stale_ind = true
    end
    if stale_ind then
        P.rng_change_frame = emu.framecount()
        P.room_nice_rng = math.random(0x00, 0xFF)
        P.room_evil_rng = math.random(0x00, 0x7FFF)
    end
    memory.write_u32_le(0x002224, BizMath.bor(0x34020000, P.room_evil_rng), 'BiosROM')
    if P.hooks[P.stage_id()] ~= nil then
        for desc, hook in pairs(P.hooks[P.stage_id()]) do
            -- Prioritize stage sources over global sources
            local source = P.global_sources[desc]
            if P.stage_sources[P.stage_id()] ~= nil then
                if P.stage_sources[P.stage_id()][desc] ~= nil then
                    source = P.stage_sources[P.stage_id()][desc]
                end
            end
            -- Set value to inject to either the default value or the one given by the source
            local injected_value = hook.default
            if source == nil or source.type == 'vanilla' then
                injected_value = hook.default
            elseif source.type == 'mask' then
                injected_value = BizMath.bor(BizMath.band(0xFFFF8000, hook.default), source.param1)
            elseif hook.injection ~= nil and P.injections[hook.injection] ~= nil then
                local instruction = P.injections[hook.injection].instruction
                local rng_value = 0x0000
                if source.type == 'fixed' then
                    rng_value = source.param1
                elseif source.type == 'room' then
                    rng_value = P.room_nice_rng
                elseif source.type == 'random' then
                    rng_value = BizMath.band(math.random(0x7FFF), source.param1)
                end
                rng_value = BizMath.band(rng_value, P.injections[hook.injection].mask)
                if P.injections[hook.injection].multiplier ~= nil then
                    rng_value = rng_value * P.injections[hook.injection].multiplier
                end
                injected_value = BizMath.bor(instruction, rng_value)
            end
            -- Write the injected value at the hook's address
            mainmemory.write_u32_le(hook.address - 0x80000000, injected_value)
        end
    end
    P.prev_nice_index = P.nice_index
    P.prev_evil_index = P.evil_index
    local nice_seed = SotnCore.read_nice_seed()
    local evil_seed = SotnCore.read_evil_seed()
    P.nice_index = SotnCore.nice_seed_index(nice_seed)
    P.evil_index = SotnCore.evil_seed_index(evil_seed)
    P.prev_room_id = P.room_id()
end

event.unregisterbyname("StaticRNG__update")
event.onframeend(P.update, "StaticRNG__update")

gui.defaultBackground(0xffff0000)
P.scale = 1
P.prev_nice_index = 0
P.prev_evil_index = 0
P.nice_index = 0
P.evil_index = 0
P.active_frame = 0
P.rng_change_frame = 0
P.prev_room_id = P.room_id()
P.room_nice_rng = 0xFF
P.room_evil_rng = 0x7FFF
P.canvas_width = P.scale * 320
P.canvas_height = P.scale * 56
P.canvas = gui.createcanvas(P.canvas_width, P.canvas_height, P.scale * 4, P.scale * 4)
P.canvas.SetTitle("StaticRNG")

P.update()
while true do
    emu.yield()
    P.draw()
end