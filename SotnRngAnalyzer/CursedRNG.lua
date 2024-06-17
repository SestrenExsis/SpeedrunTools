
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
    BOSS_RICHTER = 0x18,
    BOSS_HIPPOGRYPH = 0x19,
    BOSS_DOPPELGANGER10 = 0x1A,
    BOSS_SCYLLA = 0x1B,
    BOSS_MINOTAUR_AND_WEREWOLF = 0x1C,
    PROLOGUE = 0x1F,
    REVERSE_OUTER_WALL = 0x21,
    REVERSE_CASTLE_KEEP = 0x2B,
    REVERSE_CLOCK_TOWER = 0x2D,
    CASTLE_ENTRANCE = 0x41,
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

local injections = {}
injections['li v0, X'] = { instruction = 0x34020000, mask = 0x7FFF }
injections['li s0, X'] = { instruction = 0x34100000, mask = 0x7FFF }
injections['li s1, X'] = { instruction = 0x34110000, mask = 0x7FFF }
injections['slti v0, s1, X'] = { instruction = 0x2A220000, mask = 0x7FFF }
injections['srl v0, $18'] = { instruction = 0x00021602, mask = 0x0000 }
injections['andi s1, v0, X'] = { instruction = 0x30510000, mask = 0x7FFF }

local hooks = {}

hooks[Stage.PROLOGUE] = {} -- 801B186C
hooks[Stage.PROLOGUE]['Stage Nice RNG'] = { address = 0x801B1898, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }
hooks[Stage.PROLOGUE]['Wineglass shard - Speed'] = { address = 0x801AD968, default = 0x3051001F, injection = 'andi s1, v0, X', mask = 0x1F }
hooks[Stage.PROLOGUE]['Wineglass shard - Angle'] = { address = 0x801AD974, default = 0x00028040, injection = 'li s0, X', mask = 0x1FE }
hooks[Stage.PROLOGUE]['Wineglass shard - Amount'] = { address = 0x801ADA68, default = 0x2A220008, injection = 'slti v0, s1, X', mask = 0x00 }

hooks[Stage.CASTLE_ENTRANCE] = {} -- 801C184C
hooks[Stage.CASTLE_ENTRANCE]['Stage Nice RNG'] = { address = 0x801C1878, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }
hooks[Stage.CASTLE_ENTRANCE]['Warg Explosion - X position'] = { address = 0x801D0080, default = 0x3042000F, injection = 'li v0, X', mask = 0x0F }
hooks[Stage.CASTLE_ENTRANCE]['Warg Explosion - Y position'] = { address = 0x801D009C, default = 0x30420007, injection = 'li v0, X', mask = 0x07 }

hooks[Stage.ALCHEMY_LABORATORY] = {} -- 801B94D4 -- Also Slogra and Gaibon
hooks[Stage.ALCHEMY_LABORATORY]['Stage Nice RNG'] = { address = 0x801B9500, default = 0x00021602, injection = 'li v0, X', mask = 0x00 }
hooks[Stage.ALCHEMY_LABORATORY]['Spittlebone'] = { address = 0x801C68E8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.ALCHEMY_LABORATORY]['Bloody Zombie'] = { address = 0x801C5714, default = 0x3042003F, injection = 'li v0, X', mask = 0x3F }
-- Rooom ID = 801827C8 --> First Bloody Zombie room
-- Rooom ID = 80182748 --> Bloody Zombie Hallway

hooks[Stage.MARBLE_GALLERY] = {} -- ???
hooks[Stage.MARBLE_GALLERY]['Stage Nice RNG'] = { address = 0x801C37B4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }
-- hooks[Stage.MARBLE_GALLERY]['Diplocephalus'] = { address = 0x801D1648, mask = 0x7F },
hooks[Stage.MARBLE_GALLERY]['Flea Man'] = { address = 0x801DC904, default = 0x30510007, injection = 'li s1, X', mask = 0x07 }

hooks[Stage.OUTER_WALL] = {} -- ???
hooks[Stage.OUTER_WALL]['Stage Nice RNG'] = { address = 0x801C1A1C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_DOPPELGANGER10] = {} -- ???
hooks[Stage.BOSS_DOPPELGANGER10]['Stage Nice RNG'] = { address = 0x801B69E8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.OLROXS_QUARTERS] = {} -- ???
hooks[Stage.OLROXS_QUARTERS]['Stage Nice RNG'] = { address = 0x801B8740, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.COLOSSEUM] = {} -- ???
hooks[Stage.COLOSSEUM]['Stage Nice RNG'] = { address = 0x801B8700, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_MINOTAUR_AND_WEREWOLF] = {} -- ???
hooks[Stage.BOSS_MINOTAUR_AND_WEREWOLF]['Stage Nice RNG'] = { address = 0x801A769C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.LONG_LIBRARY] = {} -- ???
hooks[Stage.LONG_LIBRARY]['Stage Nice RNG'] = { address = 0x801BF15C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 1'] = { address = 0x801D25B0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 2'] = { address = 0x801D25C0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 3'] = { address = 0x801D25D0, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 1'] = { address = 0x801D30D8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 2'] = { address = 0x801D30E8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 3'] = { address = 0x801D30F8, default = 0x3042001F, injection = 'li v0, X', mask = 0x1F }

hooks[Stage.CLOCK_TOWER] = {} -- ??? -- Also Karasuman
hooks[Stage.CLOCK_TOWER]['Stage Nice RNG'] = { address = 0X801AC70C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.CASTLE_KEEP] = {} -- ???
hooks[Stage.CLOCK_TOWER]['Stage Nice RNG'] = { address = 0x801AD65C, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.ROYAL_CHAPEL] = {} -- ???
hooks[Stage.ROYAL_CHAPEL]['Stage Nice RNG'] = { address = 0x801C5FB4, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_HIPPOGRYPH] = {} -- ???
hooks[Stage.BOSS_HIPPOGRYPH]['Stage Nice RNG'] = { address = 0x801A6BE0, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.UNDERGROUND_CAVERNS] = {} -- ???
hooks[Stage.UNDERGROUND_CAVERNS]['Stage Nice RNG'] = { address = 0x801CA620, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_SCYLLA] = {} -- ???
hooks[Stage.BOSS_SCYLLA]['Stage Nice RNG'] = { address = 0x801A6728, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_SUCCUBUS] = {} -- ???
hooks[Stage.BOSS_SUCCUBUS]['Stage Nice RNG'] = { address = 0x801A6730, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.CASTLE_CENTER] = {} -- ???
hooks[Stage.CASTLE_CENTER]['Stage Nice RNG'] = { address = 0x80190E78, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.BOSS_RICHTER] = {} -- ???
hooks[Stage.BOSS_RICHTER]['Stage Nice RNG'] = { address = 0x801A9B80, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.REVERSE_CASTLE_KEEP] = {} -- ???
hooks[Stage.REVERSE_CASTLE_KEEP]['Stage Nice RNG'] = { address = 0x801A2520, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

hooks[Stage.REVERSE_OUTER_WALL] = {} -- ???
hooks[Stage.REVERSE_OUTER_WALL]['Stage Nice RNG'] = { address = 0x801A9CC8, default = 0x00021602, injection = 'li v0, X', mask = 0xFF }

function cycle(frames)
    -- Every N frames, cycle through all the Nice RNG values
    if hooks[stage_id()] ~= nil then
        local rng_value = math.floor(emu.framecount() / frames) % 256
        for stage_id, hook in pairs(hooks[stage_id()]) do
            if hook.desc == 'Stage Nice RNG' then
                mainmemory.write_u32_le(hook.address - 0x80000000, 0x34020000 | (rng_value & hook.mask))
            end
        end
    end
end

-- local prev_room_id = 
local variables = {}
variables['random'] = 0x00
variables['rectangle_x'] = 0x00
variables['rectangle_y'] = 0x00
variables['morse_code'] = 0x00
variables['cycle_04'] = 0x00
variables['book_01'] = 0x10
variables['book_02'] = 0x10
variables['book_03'] = 0x10
variables['random'] = { type = 'random', mask = 0x7FFF }
local lerp_rect_16_08 = rect_shape(16, 8)
    -- pulse_02
    -- pulse_04
    -- room: changes to a random value at the start of each room

-- Curated
-- local stage_hooks[][]
-- local room_hooks[Room.BLOODY_ZOMBIE_HALLWAY][Bloody Zombie]
hooks[Stage.PROLOGUE]['Stage Nice RNG'].source = { type = 'vanilla' }
hooks[Stage.PROLOGUE]['Wineglass shard - Speed'].source = { type = 'fixed', param1 = 0xFF }
hooks[Stage.PROLOGUE]['Wineglass shard - Amount'].source = { type = 'fixed', param1 = 0x1F }
hooks[Stage.CASTLE_ENTRANCE]['Stage Nice RNG'].source = { type = 'fixed', param1 = 0x01 }
hooks[Stage.CASTLE_ENTRANCE]['Warg Explosion - X position'].source = { type = 'variable', param1 = 'rectangle_x' }
hooks[Stage.CASTLE_ENTRANCE]['Warg Explosion - Y position'].source = { type = 'variable', param1 = 'rectangle_y' }
hooks[Stage.ALCHEMY_LABORATORY]['Stage Nice RNG'].source = { type = 'fixed', param1 = 0x01 }
hooks[Stage.ALCHEMY_LABORATORY]['Spittlebone'].source = { type = 'fixed', param1 = 0x00 }
-- hooks[Stage.ALCHEMY_LABORATORY]['Bloody Zombie'].source = { type = 'fixed', param1 = 0x00 }
hooks[Stage.ALCHEMY_LABORATORY]['Bloody Zombie'].source = { type = 'variable', param1 = 'morse_code' }
hooks[Stage.MARBLE_GALLERY]['Flea Man'].source = { type = 'fixed', param1 = 0x02 }
hooks[Stage.LONG_LIBRARY]['Stage Nice RNG'].source = { type = 'fixed', param1 = 0xFF }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 1'].source = { type = 'variable', param1 = 'book1' }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 2'].source = { type = 'variable', param1 = 'book2' }
hooks[Stage.LONG_LIBRARY]['Spellbook - Rotation 3'].source = { type = 'variable', param1 = 'book3' }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 1'].source = { type = 'fixed', param1 = 0x10 }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 2'].source = { type = 'fixed', param1 = 0x10 }
hooks[Stage.LONG_LIBRARY]['Magic Tome - Unknown 3'].source = { type = 'fixed', param1 = 0x10 }

local global_nice_rng_source = { type = 'fixed', param1 = 0x00 }

function curated()
    variables['rectangle_x'] = lerp_rect_16_08[1 + (emu.framecount() % #lerp_rect_16_08)][1]
    variables['rectangle_y'] = lerp_rect_16_08[1 + (emu.framecount() % #lerp_rect_16_08)][2]
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
    -- Set stage-specific Nice RNG
    if hooks[stage_id()] ~= nil then
        for desc, hook in pairs(hooks[stage_id()]) do
            local injected_value = mainmemory.read_u32_le(hook.address - 0x80000000)
            local source = hook.source
            -- Default to the global setting if stage-specific not provided
            if hook.source == nil and desc == 'Stage Nice RNG' then
                source = global_nice_rng_source
            end
            if source == nil or source.type == 'vanilla' then
                injected_value = hook.default
            elseif hook.injection ~= nil and injections[hook.injection] ~= nil then
                local instruction = injections[hook.injection].instruction
                local rng_value = 0x0000
                if source.type == 'fixed' then
                    rng_value = source.param1
                elseif source.type == 'random' then
                    rng_value = math.random(0x7FFF) & source.param1
                elseif source.type == 'variable' then
                    rng_value = variables[source.param1]
                end
                local mask = injections[hook.injection].mask
                injected_value = instruction | (rng_value & mask)
            end
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