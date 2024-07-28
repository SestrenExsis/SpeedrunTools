
Stage = {
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

Room = {
    OUTSIDE_CASTLE_GATE = 0x80183D58,
    INSIDE_CASTLE_GATE = 0x80183CC8,
    STAIRMASTERS_DOMAIN = 0x80183CD8,
    BLOODY_ZOMBIE_HALLWAY = 0x80182748,
    ROOM_AFTER_SLOGRA_AND_GAIBON = 0x801827C8,
    WARG_HALLWAY = 0x80183D10,
}

function stage_id()
    local result = mainmemory.read_u32_le(0x0974A0)
    return result
end

function room_id()
    local result = mainmemory.read_u32_le(0x1375BC)
    return result
end

function rect_shape(width, height)
    local result = {}
    for y = 0, height - 1 do
        result[#result + 1] = {0, y}
    end
    for x = 0, width - 1 do
        result[#result + 1] = {x, height - 1}
    end
    for y = height - 1, 0, -1 do
        result[#result + 1] = {width - 1, y}
    end
    for x = width - 1, 0, -1 do
        result[#result + 1] = {x, 0}
    end
    return result
end

-- '   . . .   --- --- ---   . . .   '
local morse_code = {
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 0, 0, 0, -- '-'
    0, 0, 0, 0, 0, 0, -- '-'
    0, 0, 0, 1, 1, 1, -- '-'
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 0, 0, 0, -- '-'
    0, 0, 0, 0, 0, 0, -- '-'
    0, 0, 0, 1, 1, 1, -- '-'
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 0, 0, 0, -- '-'
    0, 0, 0, 0, 0, 0, -- '-'
    0, 0, 0, 1, 1, 1, -- '-'
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    0, 0, 0, 1, 1, 1, -- '.'
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
    1, 1, 1, 1, 1, 1, -- ' '
}

-- [800978B8]!!?

-- Opening dialogue at roughly 0x801829F0

local injections = {
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

-- Global Evil RNG: 0xBFC02224   30427FFF andi v0,$7FFF
-- 
-- memory domain: BiosROM 0x20000 addresses
-- search for 00031402 30427FFF
-- Karma Coin
        -- 00000000
        -- A6600050
        -- 0C005839
        -- A6600052
        -- 30420001 <-- HOOK
        -- 10400005
        -- 00000000

local hooks = {}
hooks[Stage.PROLOGUE] = { -- jal $801B186C
    ['Stage Nice RNG'] = { address = 0x801B1898, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    ['Wineglass shard - Speed'] = { address = 0x801AD968, default = 0x3051001F, injection = 'andi s1, v0, X', mask = 0x1F },
    ['Wineglass shard - Angle'] = { address = 0x801AD974, default = 0x00028040, injection = 'li s0, X', mask = 0x1FE },
    ['Wineglass shard - Amount'] = { address = 0x801ADA68, default = 0x2A220008, injection = 'slti v0, s1, X', mask = 0x2F },
}
hooks[Stage.CASTLE_ENTRANCE] = { -- jal $801C184C, search for 0C070613
    ['Stage Nice RNG'] = { address = 0x801C1878, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    -- ['Merman Ledge - Tile'] = { address = 0x8019D6C8, default = 0x052A052A, injection = 'copy', mask = 0xFFFFFFFF },
    ['Left-Side Rock - Corner Tile'] = { address = 0x8019D158, default = 0x025E0000, injection = 'copy', mask = 0xFFFFFFFF },
    ['Left-Side Rock - Item Drop'] = { address = 0x801BA7CC, default = 0x34020043, injection = 'li v0, X', mask = 0x7FFF },
    ['Left-Side Rock - Particle Count'] = { address = 0x801BA774, default = 0x2A220003, injection = 'slti v0, s1, X', mask = 0x0F },
    ['Left-Side Rock - Tile Start'] = { address = 0x801BA630, default = 0x24421258, injection = 'addiu v0, X', mask = 0x7FFF },
    ['Left-Side Rock - Hit Add'] = { address = 0x801BA788, default = 0x24420001, injection = 'addiu v0, X', mask = 0x7FFF },
    ['Left-Side Rock - Hit Count'] = { address = 0x801BA798, default = 0x28420002, injection = 'slti v0, v0, X', mask = 0x7FFF },
    ['Left-Side Rock - X Velocity Multiplier'] = { address = 0x801BA73C, default = 0x00021200, injection = 'sll v0, X', mask = 0x1F },
    ['Left-Side Rock - Y Velocity Multiplier'] = { address = 0x801BA758, default = 0x00021200, injection = 'sll v0, X', mask = 0x1F },
    ['Stairway Rock - Hit Add'] = { address = 0x801BB038, default = 0x2442001, injection = 'addiu v0, X', mask = 0x7FFF },
    ['Red Rust Skeleton - Item Drop'] = { address = 0x801D60FC, default = 0x3402001A, injection = 'li v0, X', mask = 0x7FFF },
    ['Short Sword Skeleton - Item Drop'] = { address = 0x801D6100, default = 0x34020013, injection = 'li v0, X', mask = 0x7FFF },
    ['Lightning - Extra Delay'] = { address = 0x801B7E50, default = 0x3042007F, injection = 'li v0, X', mask = 0x7F },
    ['Lightning - Minimum Delay'] = { address = 0x801B7E58, default = 0x24420040, injection = 'addiu v0, X', mask = 0x7FFF },
    ['Strike - Spark X'] = { address = 0x801C24C8, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Strike - Spark Y'] = { address = 0x801C24F0, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Blood Spray - Timer'] = { address = 0x801CC0B8, default = 0x34020030, injection = 'li v0, X', mask = 0x7FFF },
    ['Blood Spray - Start X'] = { address = 0x801CC0F0, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Blood Spray - Start Y'] = { address = 0x801CC10C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Blood Spray - Speed'] = { address = 0x801CC154, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Blood Spray - Unknown'] = { address = 0x801CC1CC, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Warg Explosion - X Position'] = { address = 0x801D0080, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Warg Explosion - Y Position'] = { address = 0x801D009C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- TODO: Warg explosion hook is different when attacking from the right
    ['Zombie - Unknown 1'] = { address = 0x801D65C8, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Zombie Spawner - Delay Start'] = { address = 0x801D6860, default = 0x24420020, injection = 'addiu v0, X', mask = 0x7FFF },
    ['Zombie Spawner - Delay Range'] = { address = 0x801D685C, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Zombie Spawner - Distance Start'] = { address = 0x801D67C8, default = 0x24440060, injection = 'addiu a0, v0, X', mask = 0x7FFF },
    ['Zombie Spawner - Distance Range'] = { address = 0x801D67B8, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Zombie Spawner - Distance Behind'] = { address = 0x801D67E0, default = 0x00441023, injection = 'li v0, X', mask = 0x00 },
    ['Zombie - Palette 1'] = { address = 0x801D65B8, default = 0x24420001, injection = 'li v0, X', mask = 0x1 },
    ['Zombie - Palette 2'] = { address = 0x801D65DC, default = 0x24420001, injection = 'li v0, X', mask = 0x1 },
    ['Zombie - Rise 1'] = { address = 0x801D6664, default = 0x2442FFFE, injection = 'subiu v0, X', mask = 0x7FFF },
    ['Zombie - Rise 2'] = { address = 0x801D6668, default = 0x24630002, injection = 'addiu v1, X', mask = 0x7FFF },
    ['Zombie - Autoside'] = { address = 0x801D67C4, default = 0x10600004, injection = 'nop', mask = 0x00 },
    ['Zombie - Autokill'] = { address = 0x801D66BC, default = 0x1040000E, injection = 'nop', mask = 0x00 },
    ['Zombie - Max Count'] = { address = 0x801D6794, default = 0x248505E0, injection = 'addiu a1, a0, X', mask = 0x7FFF },
}
hooks[Stage.CASTLE_ENTRANCE_2] = { -- jal $801B90BC, search for 0C06E42F
    ['Stage Nice RNG'] = { address = 0x801B90E8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.ALCHEMY_LABORATORY] = { -- jal $801B94D4 -- Also Slogra and Gaibon
    ['Stage Nice RNG'] = { address = 0x801B9500, default = 0x00021602, injection = 'li v0, X', mask = 0x00 },
    ['Green Axe Knight - Attack RNG'] = { address = 0x801C4584, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Green Axe Knight - Attack Step'] = { address = 0x801C4590, default = 0x902422B4, injection = 'li a0, X', mask = 0x00 },
    ['Bloody Zombie'] = { address = 0x801C5714, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Spittlebone'] = { address = 0x801C68E8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Slogra - Taunt Check'] = { address = 0x801B4B58, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Slogra Death Explosion - X Position'] = { address = 0x801B52BC, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Slogra Death Explosion - Y Position'] = { address = 0x801B52D4, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Gaibon Death Explosion - X Position'] = { address = 0x801B67A8, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    -- TODO(sestren): Figure out how to get the cannon to repeat its shots
        -- ['Cannon Shot - Unknown 1B294C'] = { address = 0x801B294C, default = 0x34020001, injection = 'li v0, X', mask = 0x7FFF },
    -- TODO(sestren): Figure out how to get the elevator to go faster
        -- ['Unknown 1'] = { address = 0x801B7360, default = 0x2442FFFF, injection = 'addiu v0, X', mask = 0x7FFF },
        -- ['Unknown 2'] = { address = 0x801B73C8, default = 0x2442FFFF, injection = 'addiu v0, X', mask = 0x7FFF },
        -- ['Unknown 3'] = { address = 0x801B73D0, default = 0x2463FFFF, injection = 'addiu v1, X', mask = 0x7FFF },
    ['Karma Coin'] = { address = 0x8017E358, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    }
hooks[Stage.MARBLE_GALLERY] = { -- jal $801C3788, search for 0C070DE2
    -- jal $800160E4, search for 0C005839
        -- 800E4D54 3042000F    li v0, X    0x0F
        -- 800E53F0 30420001    li v0, X    0x01
    ['Unknown 1C335C'] = { address = 0x801C335C, default = 0x30540003, injection = 'li s4, X', mask = 0x03 },
    ['Unknown 1C3360'] = { address = 0x801C3360, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Unknown 1C3724'] = { address = 0x801C3724, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Stage Nice RNG'] = { address = 0x801C37B4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    ['Unknown 1C4404'] = { address = 0x801C4404, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C442C'] = { address = 0x801C442C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C5C38'] = { address = 0x801C5C38, default = 0x304400FF, injection = 'li a0, X', mask = 0xFF },
    ['Unknown 1C70B8'] = { address = 0x801C70B8, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C70DC'] = { address = 0x801C70DC, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C7438'] = { address = 0x801C7438, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C7454'] = { address = 0x801C7454, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C749C'] = { address = 0x801C749C, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Unknown 1C7514'] = { address = 0x801C7514, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1C7A8C'] = { address = 0x801C7A8C, default = 0x0C070DE2, injection = 'mult v1, v0', mask = 0xFF }, -- there is no multiply immediate instruction
    ['Unknown 1CC1F8'] = { address = 0x801CC1F8, default = 0x30540003, injection = 'li s4, X', mask = 0x03 },
    ['Unknown 1CC1FC'] = { address = 0x801CC1FC, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Giant Eyeball'] = { address = 0x801CCA3C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown 1CF204'] = { address = 0x801CF204, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1CF26C'] = { address = 0x801CF26C, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1CF2D0'] = { address = 0x801CF2D0, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1CF338'] = { address = 0x801CF338, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D0354'] = { address = 0x801D0354, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D0374'] = { address = 0x801D0374, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D0528'] = { address = 0x801D0528, default = 0x30440001, injection = 'li a0, X', mask = 0x01 },
    ['Unknown 1D08DC'] = { address = 0x801D08DC, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Unknown 1D08F0'] = { address = 0x801D08F0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Diplocephalus'] = { address = 0x801D1648, default = 0x3042007F, injection = 'li v0, X', mask = 0x7F },
    ['Unknown 1D1E50'] = { address = 0x801D1E50, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D1E64'] = { address = 0x801D1E64, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D1E70'] = { address = 0x801D1E70, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D41C8'] = { address = 0x801D41C8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Unknown 1D41DC'] = { address = 0x801D41DC, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Unknown 1D60E8'] = { address = 0x801D60E8, default = 0x3042002F, injection = 'li v0, X', mask = 0x2F },
    ['Unknown 1D61E4'] = { address = 0x801D61E4, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F },
    ['Unknown 1D61F0'] = { address = 0x801D61F0, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D621C'] = { address = 0x801D621C, default = 0x3042007F, injection = 'li v0, X', mask = 0x7F },
    ['Unknown 1D64D8'] = { address = 0x801D64D8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Unknown 1D641F'] = { address = 0x801D641F, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Unknown 1D6548'] = { address = 0x801D6548, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    ['Unknown 1D689C'] = { address = 0x801D689C, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D6900'] = { address = 0x801D6900, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1D69C0'] = { address = 0x801D69C0, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D6B9C'] = { address = 0x801D6B9C, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D6F04'] = { address = 0x801D6F04, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D7014'] = { address = 0x801D7014, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Unknown 1D796C'] = { address = 0x801D796C, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1DA210'] = { address = 0x801DA210, default = 0x3054003F, injection = 'li s4, X', mask = 0x3F },
    ['Unknown 1DB4A4'] = { address = 0x801DB4A4, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Flea Man'] = { address = 0x801DC904, default = 0x30510007, injection = 'li s1, X', mask = 0x07 },
    ['Unknown 1DCE44'] = { address = 0x801DCE44, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown 1EC904'] = { address = 0x801EC904, default = 0x30510007, injection = 'li s1, X', mask = 0x07 },
    ['Unknown 1ECE44'] = { address = 0x801ECE44, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Clock Room - Statue Toggle'] = { address = 0x801CCD64, default = 0x8E6202D0, injection = 'lw v0, X(s3)', mask = 0x7FFF },
    ['Clock Room - Minute Hand'] = { address = 0x801CCC2C, default = 0x8CA302D0, injection = 'lw v1, X(a1)', mask = 0x7FFF },
    ['Clock Room - Hour Hand 1'] = { address = 0x801CCC44, default = 0x8CA302CC, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 2'] = { address = 0x801CCC48, default = 0x8CA502D0, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 3'] = { address = 0x801CCC4C, default = 0x00031080, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 4'] = { address = 0x801CCC50, default = 0x00431021, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 5'] = { address = 0x801CCC54, default = 0x00021900, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 6'] = { address = 0x801CCC58, default = 0x00621823, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 7'] = { address = 0x801CCC5C, default = 0x00031880, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 8'] = { address = 0x801CCC60, default = 0x00051080, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 9'] = { address = 0x801CCC64, default = 0x00451021, injection = 'copy', mask = 0xFFFFFFFF },
    ['Clock Room - Hour Hand 10'] = { address = 0x801CCC68, default = 0x00621821, injection = 'copy', mask = 0xFFFFFFFF },
}
hooks[Stage.WARP_ROOM] = { -- jal $801881E8, search for 0C06207A
    -- ['Stage Nice RNG'] = { address = 0x80188214, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.OUTER_WALL] = { -- jal $801C19F0, search for 0C07067C
    ['Stage Nice RNG'] = { address = 0x801C1A1C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    ['Unknown 1B6340'] = { address = 0x801B6340, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown XXXXXX'] = { address = 0x801B636C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Bird or Telescope - Unknown 1BAAFC'] = { address = 0x801BAAFC, default = 0x30480003, injection = 'li t0, X', mask = 0x07 },
    ['Telescope - Unknown 1BAF1C'] = { address = 0x801BAF1C, default = 0x30500007, injection = 'li s0, X', mask = 0x07 },
    ['Telescope - Unknown 1BAF20'] = { address = 0x801BAF20, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Telescope - Unknown 1BB540'] = { address = 0x801BB540, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Elevator 1BC778'] = { address = 0x801BC778, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Elevator 1BC7D8'] = { address = 0x801BC7D8, default = 0x30420001, injection = 'li v0, X', mask = 0x01 },
    ['Elevator 1BC7E8'] = { address = 0x801BC7E8, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Elevator 1BCFE0'] = { address = 0x801BCFE0, default = 0x00430018, injection = 'mult v0, v1', mask = 0xFF }, -- there is no multiply immediate instruction
    ['Elevator 1BD378'] = { address = 0x801BD378, default = 0x00430018, injection = 'mult v0, v1', mask = 0xFF }, -- there is no multiply immediate instruction
    ['Rocks? - Unknown 1BED88'] = { address = 0x801BED88, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    ['Unknown XXXXXX'] = { address = 0x801BFCEC, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    ['Unknown XXXXXX'] = { address = 0x801BFD08, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    -- ['Unknown XXXXXX'] = { address = 0x801C08A8, default = 0x30420003
    -- 'Attack or Break - Unknown 1', 0x801C266C, default = 0x30420007
    -- 'Attack or Break - Unknown 2', 0x801C2694, default = 0x30420007
    -- 0x801C3EA0, default = 0x304400FF
    -- 0x801C43E4, default = 0x00620018, injection = 'mult v1, v0', mask = 0xFF }, -- there is no multiply immediate instruction
    -- 0x801C90DC, default = 0x30540003, injection = 'li s4, X', mask = 0x03 },
    -- 0x801C90E0, default = 0x3042000F
    -- 'Blue Axe Knight - Death Unknown 1CAB60', 0x801CAB60, default = 0x3042001F
    -- 'Blue Axe Knight - Death Unknown 1CAB78', 0x801CAB78, default = 0x3042001F
    -- 'Blue Axe Knight - Death Unknown 1CAC40', 0x801CAC40, default = 0x3042000F
    -- 'Blue Axe Knight - Death Unknown 1CAC60', 0x801CAC60, default = 0x3042001F
    -- 'Blue Axe Knight - Attack Type', 0x801CAD98, default = 0x34020007
    -- 'Blue Axe Knight - Unknown 1CAF2C', 0x801CAF2C, default = 0x30420001
    -- 'Stage Card - Unknown 1', 0x801CC6D4, default = 0x30420003 -- pull from s1 instead
    -- 'Stage Card - Unknown 2', 0x801CC73C, default = 0x30420003 -- pull from s1 instead
    -- 'Stage Card - Unknown 3', 0x801CC7A0, default = 0x30420003 -- pull from s1 instead
    -- 'Stage Card - Unknown 4', 0x801CC808, default = 0x30420003 -- pull from s1 instead
    -- 0x801CCA74, default = 0x30420007
    -- 0x801CCA98, default = 0x30420007
    -- 'Medusa Death? - Unknown 1CCDF4', 0x801CCDF4, default = 0x30420007
    -- 'Medusa Death? - Unknown 1CCE10', 0x801CCE10, default = 0x30420007
    -- 'Medusa Death? - Unknown 1CCE58', 0x801CCE58, default = 0x3042000F
    -- 'Medusa Death? - Unknown 1CCED0', 0x801CCED0, default = 0x30420007
    -- 0x801CD96C, default = 0x30420003
    -- 0x801CE0C8, default = 0x30420001
    -- 0x801CE2CC, default = 0x30420001
    -- 0x801CE2DC, default = 0x30420001
    -- 0x801CE4D0, default = 0x30420007
    -- 0x801CE4F8, default = 0x30420007
    -- 0x801CE580, default = 0x30420001
    -- 0x801CE5A4, default = 0x30420001
    -- 0x801CE5B8, default = 0x34040003
    -- 0x801CE824, default = 0x3042001F
    -- 0x801CE83C, default = 0x3042001F
    -- 'Sword Lord - 1CFA20', 0x801CFA20, default = 0x30420003
    -- 'Sword Lord - 1CFB34', 0x801CFB34, default = 0x30420001
    -- 'Sword Lord - 1CFBB0', 0x801CFBB0, default = 0x30420003
    -- 'Sword Lord - 1CFD3C', 0x801CFD3C, default = 0x30420003
    -- 'Sword Lord - 1CFF2C', 0x801CFF2C, default = 0x30420007
    -- 'Sword Lord - 1CFF6C', 0x801CFF6C, default = 0x3042002F
    -- 'Sword Lord - 1CFF84', 0x801CFF84, default = 0x3042003F
    -- 'Sword Lord - 1D0380', 0x801D0380, default = 0x3042000F
    -- 'Armor Lord - Flame Attack', 0x801D16AC, default = 0x30420001
    -- 'Armor Lord - Death Sparkles 1', 0x801D2C04, default = 0x30420003
    -- 'Armor Lord - Death Sparkles 2', 0x801D2C18, default = 0x3042003F
    -- 'Armor Lord - Death Sparkles 3', 0x801D2C50, default = 0x30420007
    -- 'Armor Lord - Unknown 1D2EB4', 0x801D2EB4, default = 0x30420003
    -- 'Armor Lord - Attack Type', 0x801D2FA0, default = 0x30420007
    -- 'Armor Lord? - Taking Damage?', 0x801D2FE8, default = 0x30420001
    -- 'Armor Lord? - Dying 1?', 0x801D3394, default = 0x3042001F
    -- 'Armor Lord? - Dying 2?', 0x801D33AC, default = 0x3042003F
    -- 0x801D37D8, default = 0x30420001
    -- Spear Guard 0x801D3858, default = 0x30420003
    -- 0x801D38B0, default = 0x30420001
    -- 0x801D3EC8, default = 0x30420003
    -- 0x801D4754, default = 0x30420007
    -- 0x801D4770, default = 0x30420007
    -- 0x801D478C, default = 0x3042001F
    -- 0x801D48E8, default = 0x30430007
    -- 'Skeleton Ape? - 1D52C0', 0x801D52C0, default = 0x30420007
    -- 'Medusa Head - Unknown 1' 0x801D59CC, default = 0x3042000F
    -- 0x801EC754, default = 0x30420007
    -- 0x801EC770, default = 0x30420007
    -- 0x801EC78C, default = 0x3042001F
    -- 0x801EC8E8, default = 0x30430007
    -- 0x801ED2C0, default = 0x30420007
    -- 0x801ED9CC, default = 0x3042000F
    -- 0x801EF858, default = 0x30420003
    -- 0x801EF8B0, default = 0x30420001
    -- 0x801EFEC8, default = 0x30420003
}
hooks[Stage.BOSS_DOPPELGANGER10] = { -- jal $801B69BC, search for 0C06DA6F
    ['Stage Nice RNG'] = { address = 0x801B69E8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    -- ['Unknown 1B7638 A'] = { address = 0x801B7638, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1B7660 A'] = { address = 0x801B7660, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1B8E6C'] = { address = 0x801B8E6C, default = 0x304400FF, injection = 'li a0, X', mask = 0xFF },
    -- ['Unknown 1BA05C'] = { address = 0x801BA060, default = 0x00620018, injection = 'mult v1, v0', mask = 0xFF }, -- there is no multiply immediate instruction
    -- ['Unknown 1BED4C'] = { address = 0x801BED4C, default = 0x30540003, injection = 'li s4, X', mask = 0x03 },
    -- ['Unknown 1BED50'] = { address = 0x801BED50, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    -- ['Unknown 1C0B34'] = { address = 0x801C0B34, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    -- ['Unknown 1C0B9C'] = { address = 0x801C0B9C, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    -- ['Unknown 1C0C00'] = { address = 0x801C0C00, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    -- ['Unknown 1C0C68'] = { address = 0x801C0C68, default = 0x30420003, injection = 'li v0, X', mask = 0x03 },
    -- ['Unknown 1C0ED4'] = { address = 0x801C0ED4, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1C0EF8'] = { address = 0x801C0EF8, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1C1254 B'] = { address = 0x801C1254, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1C1270 B'] = { address = 0x801C1270, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
    -- ['Unknown 1C12B8 B'] = { address = 0x801C12B8, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F },
    -- ['Unknown 1C1330 B'] = { address = 0x801C1330, default = 0x30420007, injection = 'li v0, X', mask = 0x07 },
}
hooks[Stage.OLROXS_QUARTERS] = { -- jal $801B8714, search for 0C06E1C5
    ['Stage Nice RNG'] = { address = 0x801B8740, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.COLOSSEUM] = { -- jal $801B86D4, search for 0C06E1B5
    ['Stage Nice RNG'] = { address = 0x801B8700, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_MINOTAUR_AND_WEREWOLF] = { -- jal $801A7670, search for 0C069D9C
    ['Stage Nice RNG'] = { address = 0x801A769C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.LONG_LIBRARY] = { -- jal $801BF130, search for 0C06FC4C
    ['Stage Nice RNG'] = { address = 0x801BF15C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    -- 0x 801BBBDC 3042007F
    -- 0x 801BBB24 3042003F
    -- 0x 801BBC60 3042003F
    -- 0x 801BC96C 30420001
    -- 0x 801BC994 30420003
    -- 0x 801BCB20 30420001
    -- 0x 801BCB7C 30420001
    -- 0x 801BD6E4 30430003
    -- 0x 801BDD64 30420003
    -- 0x 801BDDAC 30420003
    -- 0x 801BDF60 30420003
    -- 0x 801BE008 30420003
    -- 0x 801BE040 30420007
    -- 0x 801BE05C 30420003
    -- 0x 801BE968 3042001F
    -- 0x 801BE980 3042003F
    -- 0x 801BEB4C 3042001F
    -- 0x 801BEB64 3042001F
    -- 'Attack 1', 0x 801BFDAC 30420007
    -- 'Attack 2', 0x 801BFDD4 30420007
    -- 0x 801C15E0 304400FF
    -- 0x 801C28C0 00620018 -- mult v1, v0
    -- 0x 801C4C48 30540003
    -- 0x 801C4C4C 3042000F
    -- 0x 801C9058 3042003F
    -- 0x 801C9168 3042003F
    -- 0x 801C9E24 30420003
    -- 0x 801C9F70 30420001
    -- 0x 801CA3A0 3042007F
    -- 0x 801CA3B8 3042001F
    -- 0x 801CA400 30420008
    -- 0x 801CA508 3042007F
    -- 0x 801CA520 3042001F
    -- 0x 801CA568 30420008
    -- 'Stage Card - Unknown 1', 0x 801CB23C 30420003
    -- 'Stage Card - Unknown 2', 0x 801CB2A4 30420003
    -- 'Stage Card - Unknown 3', 0x 801CB308 30420003
    -- 'Stage Card - Unknown 4', 0x 801CB370 30420003
    -- 0x 801CB5DC 30420007
    -- 0x 801CB600 30420007
    -- 'Blood Spray - Unknown 1', 0x 801CB95C 30420007
    -- 'Blood Spray - Unknown 2', 0x 801CB978 30420007
    -- 'Blood Spray - Unknown 3', 0x 801CB9C0 3042000F
    -- 'Blood Spray - Unknown 4', 0x 801CBA38 30420007
    -- 'Dhuron - Attack Type', 0x 801CC244 30420007
    -- 'Dhuron - Lightning Attack', 0x 801CCCB4 30420003
    -- 0x 801CF4AC 30420003
    -- 0x 801CFC34 3042001F
    -- 0x 801CFD10 30420001
    -- 'Flea Man - Jump Type', 0x 801D04A0 30510007
    -- 0x 801D1170 30420001
    ['Spellbook - Rotation 1'] = { address = 0x801D25B0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Spellbook - Rotation 2'] = { address = 0x801D25C0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Spellbook - Rotation 3'] = { address = 0x801D25D0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    -- 'Spellbook - Death Unknown 1', 0x 801D2734 3042000F
    -- 'Spellbook - Death Unknown 2', 0x 801D27C8 3042001F
    -- 'Spellbook - Death Unknown 3', 0x 801D27E4 3042001F
    -- 'Spellbook - Death Unknown 4', 0x 801D2954 3051001F
    -- 'Spellbook - Death Unknown 5', 0x 801D2D30 3042000F
    -- 'Spellbook - Death Unknown 6', 0x 801D2D44 00021040
    ['Magic Tome - Unknown 1'] = { address = 0x801D30D8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Magic Tome - Unknown 2'] = { address = 0x801D30E8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    ['Magic Tome - Unknown 3'] = { address = 0x801D30F8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F },
    -- 'Magic Tome - Death Unknown 1', 0x 801D326C 3042000F
    -- 'Magic Tome - Death Unknown 2', 0x 801D3300 3042001F
    -- 'Magic Tome - Death Unknown 3', 0x 801D331C 3042001F
    -- 'Magic Tome - Death Unknown 4', 0x 801D347C 3042001F
    -- 0x 801EE5B0 3042001F
    -- 0x 801EE5C0 3042001F
    -- 0x 801EE5D0 3042001F
    -- 0x 801EE734 3042000F
    -- 0x 801EE7C8 3042001F
    -- 0x 801EE7E4 3042001F
    -- 0x 801EE954 3051001F
    -- 0x 801EED30 3042000F
    -- 0x 801EED44 00021040
    -- 0x 801EF0D8 3042001F
    -- 0x 801EF0E8 3042001F
    -- 0x 801EF0F8 3042001F
    -- 0x 801EF26C 3042000F
    -- 0x 801EF300 3042001F
    -- 0x 801EF31C 3042001F
    -- 0x 801EF47C 3042001F
}
hooks[Stage.CLOCK_TOWER] = { -- jal $801AC6E0, search for 0C06B1B8 -- Also Karasuman
    ['Stage Nice RNG'] = { address = 0x801AC70C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.CASTLE_KEEP] = { -- jal $801AD630, search for 0C06B58C
    ['Stage Nice RNG'] = { address = 0x801AD65C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.ROYAL_CHAPEL] = { -- jal $801C5F88, search for 0C0717E2
    ['Stage Nice RNG'] = { address = 0x801C5FB4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_HIPPOGRYPH] = { -- jal $801A6BB4, search for 0C069AED
    ['Stage Nice RNG'] = { address = 0x801A6BE0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.UNDERGROUND_CAVERNS] = { -- jal $801CA5F0, search for 0C07297C
    ['Stage Nice RNG'] = { address = 0x801CA61C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_SCYLLA] = { -- jal $801A6704, search for 0C0699C1
    ['Stage Nice RNG'] = { address = 0x801A6730, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_SUCCUBUS] = { -- jal $80196F90, search for 0C065BE4
    ['Stage Nice RNG'] = { address = 0x80196FBC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.ABANDONED_MINE] = { -- jal $8019DE74, search for 0C06779D
    ['Stage Nice RNG'] = { address = 0x8019DEA0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_CERBERUS] = { -- jal $80196648, search for 0C065992
    ['Stage Nice RNG'] = { address = 0x80196674, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.CATACOMBS] = { -- jal $801BB6A4, search for 0C06EDA9
    ['Stage Nice RNG'] = { address = 0x801BB6D0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_GRANFALOON] = { -- jal $801A55A0, search for 0C069568
    ['Stage Nice RNG'] = { address = 0x801A55CC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.CASTLE_CENTER] = { -- jal $80190C4C ???, search for ???
    ['Stage Nice RNG'] = { address = 0x80190E78, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_RICHTER] = { -- jal $801A9B54, search for 0C06A6D5
    ['Stage Nice RNG'] = { address = 0x801A9B80, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_KEEP] = { -- jal $801A24F4, search for 0C06893D
    ['Stage Nice RNG'] = { address = 0x801A2520, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_CLOCK_TOWER] = { -- jal $801ACEA0, search for 0C06B3A8
    -- Also Darkwing Bat
    ['Stage Nice RNG'] = { address = 0x801ACECC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_OUTER_WALL] = { -- jal $801A9C9C, search for 0C06A727
    ['Stage Nice RNG'] = { address = 0x801A9CC8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.FORBIDDEN_LIBRARY] = { -- jal $801A2B60, search for 0C068AD8
    ['Stage Nice RNG'] = { address = 0x801A2B8C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.ANTI_CHAPEL] = { -- jal $801B462C, search for 0C06D18B
    ['Stage Nice RNG'] = { address = 0x801B4658, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_MEDUSA] = { -- jal $80193198, search for 0C064C66
    ['Stage Nice RNG'] = { address = 0x801931C4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.DEATH_WINGS_LAIR] = { -- jal $801B6CF0, search for 0C06DB3C
    ['Stage Nice RNG'] = { address = 0x801B6D1C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_COLOSSEUM] = { -- jal $801A6B40, search for 0C069AD0
    ['Stage Nice RNG'] = { address = 0x801A6B6C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BLACK_MARBLE_GALLERY] = { -- jal $801B7324, search for 0C06DCC9
    ['Stage Nice RNG'] = { address = 0x801B7350, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
    -- 1B7FA0 30420007
    -- 1B7FC8 30420007
    -- 1B97D4 304400FF
    -- 1BA9C8 00620018 mult v1, v0
    -- 1BF6C0 30540003
    -- 1BF6C4 3042000F
    -- 1C0BE4 30420007
    -- 1C2868 30420001
    -- 1C3DC0 30420003
    -- 1C3DD4 3042003F
    -- 1C3E0C 30420007
    -- 1C4050 30420003
    -- 1C41AC 30420007
    -- 1C45B4 3042001F
    -- 1C45CC 3042003F
    -- 1C554C 30420003
    -- 1C55B4 30420003
    -- 1C5618 30420003
    -- 1C5680 30420003
    -- 1C58EC 30420007
    -- 1C5910 30420007
    -- 1C5C6C 30420007
    -- 1C5C88 30420007
    -- 1C5CD0 3042000F
    -- 1C5D48 30420007
    -- 1C84E4 30420003
    -- 1C9594 30420001
    -- 1CB47C 30420001
    -- 1CB654 3051001F
    -- 1CB660 00028040
    -- 1CB6B0 3042001F
    -- 1CB99C 3051001F
    -- 1CB9A8 00028040
    -- 1CC964 30420001
    -- 1CCBF0 3051001F
    -- 1CCBFC 00028040
    -- 1CCC4C 3042001F
    -- 1CDDE0 30420001
    -- 1CE420 30420018
    -- 1CE444 30420003
    -- 1CE5C8 3050001F
    -- 1CE5D4 3044003F
    -- 1CE798 00021200
    -- 1CE7AC 3042001F
    -- 1D04F0 3042003F
    -- 1D0508 3042003F
    -- 1D051C 3042001F
    -- 1D2858 3042000F
}
hooks[Stage.NECROMANCY_LABORATORY] = { -- jal $801ACC04, search for 0C06B301
    ['Stage Nice RNG'] = { address = 0x801ACC30, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.CAVE] = { -- jal $8019ABF4, search for 0C066AFD
    ['Stage Nice RNG'] = { address = 0x8019AC20, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_DEATH] = { -- jal $801A1A80, search for 0C0686A0
    ['Stage Nice RNG'] = { address = 0x801A1AAC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.FLOATING_CATACOMBS] = { -- jal $801B3F50, search for 0C06CFD4
    ['Stage Nice RNG'] = { address = 0x801B3F7C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_CAVERNS] = { -- jal $801CA1E4, search for 0C072879
    ['Stage Nice RNG'] = { address = 0x801CA210, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_ENTRANCE] = { -- jal $801B3EB0, search for 0C06CFAC
    ['Stage Nice RNG'] = { address = 0x801B3EDC, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_BEELZEBUB] = { -- jal $80195144, search for 0C0xxxxx
    ['Stage Nice RNG'] = { address = 0x80195170, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_AKMODAN_II] = { -- jal $80xxxxxx, search for 0C0xxxxx
    ['Stage Nice RNG'] = { address = 0x80195F00, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_CREATURE] = { -- jal $8019xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x80198E38, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_TRIO] = { -- jal $8019xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x8019A090, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_DOPPELGANGER40] = { -- jal $8019xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x801B591C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_GALAMOTH] = { -- jal $8019xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x80199DC4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_OLROX] = { -- jal $8019xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x801BC108, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.BOSS_SHAFT] = { -- jal $8019xxxx, search for 0C06xxxx
    -- ['Stage Nice RNG'] = { address = 0x801BC108, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}
hooks[Stage.REVERSE_WARP_ROOM] = { -- jal $8018xxxx, search for 0C06xxxx
    ['Stage Nice RNG'] = { address = 0x8018A194, default = 0x00021602, injection = 'li v0, X', mask = 0xFF },
}


-- [800978B8]!!?
-- search for 00021602 in Bizhawk
-- Cutscene: Castle Entrance w/ Death
-- BOSS: Dracula
-- BOSS: Lord Dracula

-- IDEA: Guarantee Karma Coin results in something funny

-- local prev_room_id = 
local variables = {}
variables['random'] = 0x00
variables['perimeter_x'] = 0x00
variables['perimeter_y'] = 0x00
variables['rectangle_x'] = 0x00
variables['rectangle_y'] = 0x00
variables['morse_code'] = 0x00
variables['book_01'] = 0x10
variables['book_02'] = 0x10
variables['book_03'] = 0x10
variables['random'] = { type = 'random', mask = 0x7FFF }
local lerp_rect_16_08 = rect_shape(16, 8)
    -- pulse_02
    -- pulse_04
    -- room: changes to a random value at the start of each room

-- 801BA4C0
-- 801BA774 slti v0,s1,$3

-- Curated
-- local stage_hooks[][]
-- local room_hooks[Room.BLOODY_ZOMBIE_HALLWAY][Bloody Zombie]
local global_sources = {
    -- ['Stage Nice RNG'] = { type = 'vanilla' },
    ['Stage Nice RNG'] = { type = 'fixed', param1 = 0x00 },
}

local stage_sources = {}
stage_sources[Stage.PROLOGUE] = {
    ['Stage Nice RNG'] = { type = 'vanilla' },
    ['Wineglass shard - Speed'] = { type = 'fixed', param1 = 0xFF },
    ['Wineglass shard - Amount'] = { type = 'fixed', param1 = 0x2F },
}
stage_sources[Stage.CASTLE_ENTRANCE] = {
    ['Stage Nice RNG'] = { type = 'vanilla' },
    -- ['Stage Nice RNG'] = { type = 'fixed', param1 = 0x00 },
    -- ['Stage Nice RNG'] = { type = 'random', param1 = 0xFF },
    -- ['Left-Side Rock - Particle Count'] = { type = 'fixed', param1 = 0x07},
    ['Left-Side Rock - Corner Tile'] = { type = 'fixed', param1 = 0x02970000 },
    -- ['Merman Ledge - Tile'] = { type = 'random', param1 = 0xFFFF }, -- 0x4283
    ['Left-Side Rock - Tile Start'] = { type = 'fixed', param1 = 0x1258 - (25 * 0xC) },
    -- ['Left-Side Rock - Hit Add'] = { type = 'fixed', param1 = 0x1 },
    ['Left-Side Rock - Hit Count'] = { type = 'fixed', param1 = 0x20 },
    ['Left-Side Rock - X Velocity Multiplier'] = { type = 'fixed', param1 = 0x0A },
    ['Left-Side Rock - Y Velocity Multiplier'] = { type = 'fixed', param1 = 0x0A },
    ['Left-Side Rock - Item Drop'] = { type = 'fixed', param1 = 0x44},
    ['Stairway Rock - Hit Add'] = { type = 'fixed', param1 = 0x0 },
    ['Red Rust Skeleton - Item Drop'] = { type = 'fixed', param1 = 0x7B },
    ['Short Sword Skeleton - Item Drop'] = { type = 'fixed', param1 = 0x10 },
    ['Blood Spray - Timer'] = { type = 'fixed', param1 = 0x38 },
    ['Blood Spray - Speed'] = { type = 'mask', param1 = 0x3F },
    ['Blood Spray - Unknown'] = { type = 'mask', param1 = 0x0F },
    -- ['Zombie - Unknown 1'] = { type = 'fixed', param1 = 0x01 },
    ['Zombie Spawner - Delay Start'] = { type = 'fixed', param1 = 0x6 },
    ['Zombie Spawner - Delay Range'] = { type = 'fixed', param1 = 0x0 },
    ['Zombie Spawner - Distance Start'] = { type = 'fixed', param1 = 0x0B0 },
    ['Zombie Spawner - Distance Range'] = { type = 'fixed', param1 = 0x00 },
    ['Zombie Spawner - Distance Behind'] = { type = 'fixed', param1 = 0x70 },
    -- ['Zombie - Palette 1'] = { type = 'fixed', param1 = 0x00 },
    -- ['Zombie - Palette 2'] = { type = 'fixed', param1 = 0x08 },
    -- ['Zombie - Autoside'] = { type = 'fixed', param1 = 0x00 },
    ['Zombie - Autokill'] = { type = 'fixed', param1 = 0x00 },
    ['Zombie - Max Count'] = { type = 'fixed', param1 = 0x1028 },
}
stage_sources[Stage.ALCHEMY_LABORATORY] = {
    ['Stage Nice RNG'] = { type = 'fixed', param1 = 0x01 },
    ['Spittlebone'] = { type = 'fixed', param1 = 0x00 },
    ['Bloody Zombie'] = { type = 'fixed', param1 = 0x00 },
    ['Green Axe Knight - Attack Step'] = { type = 'fixed', param1 = 0x07 },
    ['Slogra - Taunt Check'] = { type = 'fixed', param1 = 0x00 },
    -- ['Gaibon Death Explosion - X Position'] = { type = 'pingpong', param1 = 0x3F },
    ['Karma Coin'] = { type = 'fixed', param1 = 0x00 },
}
stage_sources[Stage.MARBLE_GALLERY] = {
    ['Stage Nice RNG'] = { type = 'vanilla' },
    ['Flea Man'] = { type = 'fixed', param1 = 0x02 },
    ['Clock Room - Minute Hand'] = { type = 'fixed', param1 = 0x2D4 },
    ['Clock Room - Hour Hand 1'] = { type = 'fixed', param1 = 0x8CA302D4 }, -- lw v1,$2D4(a1)
    ['Clock Room - Hour Hand 3'] = { type = 'fixed', param1 = 0x00000000 }, -- nop
    ['Clock Room - Hour Hand 4'] = { type = 'fixed', param1 = 0x00000000 }, -- nop
    ['Clock Room - Hour Hand 5'] = { type = 'fixed', param1 = 0x00051900 }, -- sll v1,a1,$4
    ['Clock Room - Hour Hand 6'] = { type = 'fixed', param1 = 0x00651823 }, -- subu v1,a1
    ['Clock Room - Hour Hand 8'] = { type = 'fixed', param1 = 0x00000000 }, -- nop
    ['Clock Room - Hour Hand 9'] = { type = 'fixed', param1 = 0x00000000 }, -- nop
    ['Clock Room - Hour Hand 10'] = { type = 'fixed', param1 = 0x00000000 }, -- nop
}
stage_sources[Stage.LONG_LIBRARY] = {
    ['Stage Nice RNG'] = { type = 'fixed', param1 = 0xFF },
    ['Spellbook - Rotation 1'] = { type = 'variable', param1 = 'book1' },
    ['Spellbook - Rotation 2'] = { type = 'variable', param1 = 'book2' },
    ['Spellbook - Rotation 3'] = { type = 'variable', param1 = 'book3' },
    ['Magic Tome - Unknown 1'] = { type = 'fixed', param1 = 0x10 },
    ['Magic Tome - Unknown 2'] = { type = 'fixed', param1 = 0x10 },
    ['Magic Tome - Unknown 3'] = { type = 'fixed', param1 = 0x10 },
}
stage_sources[Stage.ABANDONED_MINE] = {
    ['Stage Nice RNG'] = { type = 'fixed', param1 = 0x00 },
}
stage_sources[Stage.BOSS_CERBERUS] = {
    ['Stage Nice RNG'] = { type = 'cycle', param1 = 0x03, param2 = 0x02, param3 = 0xFF },
}
stage_sources[Stage.BOSS_AKMODAN_II] = {
    ['Stage Nice RNG'] = { type = 'cycle', param1 = 0x01, param2 = 0x01, param3 = 0xFF },
}
stage_sources[Stage.CASTLE_KEEP] = {
    ['Stage Nice RNG'] = { type = 'fixed', param1 = 0x07 },
}

local room_sources = {}
room_sources[Room.OUTSIDE_CASTLE_GATE] = {
    ['Lightning - Extra Delay'] = { type = 'fixed', param1 = 0x00 },
    ['Lightning - Minimum Delay'] = { type = 'fixed', param1 = 0x7FFF },
}
room_sources[Room.INSIDE_CASTLE_GATE] = {
    ['Lightning - Extra Delay'] = { type = 'random', param1 = 0x3F },
    ['Lightning - Minimum Delay'] = { type = 'fixed', param1 = 0x10 },
}
room_sources[Room.STAIRMASTERS_DOMAIN] = {
    ['Lightning - Extra Delay'] = { type = 'random', param1 = 0xFF },
    ['Lightning - Minimum Delay'] = { type = 'fixed', param1 = 0x80 },
}
room_sources[Room.WARG_HALLWAY] = {
    ['Warg Explosion - X Position'] = { type = 'variable', param1 = 'rectangle_x' },
    ['Warg Explosion - Y Position'] = { type = 'variable', param1 = 'rectangle_y' },
}
room_sources[Room.BLOODY_ZOMBIE_HALLWAY] = {
    ['Bloody Zombie'] = { stage = Stage.ALCHEMY_LABORATORY, type = 'variable', param1 = 'morse_code' },
}

function curated()
    variables['rectangle_x'] = lerp_rect_16_08[1 + (emu.framecount() % #lerp_rect_16_08)][1]
    variables['rectangle_y'] = lerp_rect_16_08[1 + (emu.framecount() % #lerp_rect_16_08)][2]
    variables['perimeter_x'] = math.random(0, 0xFF)
    variables['perimeter_y'] = math.random(0, 0xFF)
    if math.random() < 0.5 then
        variables['perimeter_x'] = 0xFF * math.random(0, 1)
    else
        variables['perimeter_y'] = 0xFF * math.random(0, 1)
    end
    variables['morse_code'] = morse_code[1 + (emu.framecount() % #morse_code)]
    variables['book1'] = 0x10
    variables['book2'] = 0x10
    variables['book3'] = 0x10
    local rotation_power = math.random(0, 9)
    if rotation_power >= 9 then
        local rotation_type = math.random(1, 3)
        if rotation_type == 1 then
            variables['book1'] = 0x7F
        elseif rotation_type == 2 then
            variables['book2'] = 0x7F
        elseif rotation_type == 3 then
            variables['book3'] = 0x7F
        end
    elseif rotation_power > 0 then
        local rotation_type = math.random(1, 3)
        if rotation_type == 1 then
            variables['book1'] = 0x00
        elseif rotation_type == 2 then
            variables['book2'] = 0x00
        elseif rotation_type == 3 then
            variables['book3'] = 0x00
        end
    end
    if hooks[stage_id()] ~= nil then
        for desc, hook in pairs(hooks[stage_id()]) do
            -- Prioritize room sources over stage sources over global sources
            local source = global_sources[desc]
            if stage_sources[stage_id()] ~= nil then
                if stage_sources[stage_id()][desc] ~= nil then
                    source = stage_sources[stage_id()][desc]
                end
            end
            if room_sources[room_id()] ~= nil then
                if room_sources[room_id()][desc] ~= nil then
                    source = room_sources[room_id()][desc]
                end
            end
            -- Set value to inject to either the default value or the one given by the source
            local injected_value = hook.default
            if source == nil or source.type == 'vanilla' then
                injected_value = hook.default
            elseif source.type == 'mask' then
                injected_value = (0xFFFF8000 & hook.default) | source.param1
            elseif hook.injection ~= nil and injections[hook.injection] ~= nil then
                local instruction = injections[hook.injection].instruction
                local rng_value = 0x0000
                if source.type == 'fixed' then
                    rng_value = source.param1
                elseif source.type == 'random' then
                    rng_value = math.random(0x7FFF) & source.param1
                elseif source.type == 'variable' then
                    rng_value = variables[source.param1]
                    if source.param2 ~= nil then
                        rng_value = rng_value & source.param2
                    end
                elseif source.type == 'cycle' then
                    local frames = source.param1 * emu.framecount()
                    rng_value = math.floor(frames / source.param2) % source.param3
                -- elseif source.type == 'pingpong' then
                --     rng_value = emu.framecount() % (2 * source.param1)
                --     if rng_value >= source.param1 then

                --     end
                end
                rng_value = rng_value & injections[hook.injection].mask
                if injections[hook.injection].multiplier ~= nil then
                    rng_value = rng_value * injections[hook.injection].multiplier
                end
                injected_value = instruction | rng_value
            end
            -- Write the injected value at the hook's address
            mainmemory.write_u32_le(hook.address - 0x80000000, injected_value)
        end
    end
end

while true do
    curated()
    -- cycle(1)
    -- cycle(180 * 60)
    emu.frameadvance()
end