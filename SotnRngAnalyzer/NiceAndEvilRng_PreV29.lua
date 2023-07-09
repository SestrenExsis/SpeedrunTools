
-- constants and helper functions

ADDRESSES = {
    evil_seed = 0x009010,
    nice_seed = 0x0978B8,
}

function mul32(__a, __b)
    -- Split a and b into their high and low bytes
    local a0 = bit.rshift(__a, 0x10)
    local a1 = bit.band(__a, 0xffff)
    local b0 = bit.rshift(__b, 0x10)
    local b1 = bit.band(__b, 0xffff)
    -- Use FOIL to stay within Lua number precision bounds
    local temp = a0 * b1 + a1 * b0
    local lo = a1 * b1 + bit.lshift(band(temp, 0xffff), 0x10)
    local hi = a0 * b0 + bit.rshift(temp, 0x10)
    -- Output the low and high 32-bit halves of the product separately
    local result = {hi = hi, lo = lo}
    return result
end

function hex(__number, __digits)
    local result = bizstring.hex(__number)
    while #result < __digits do
        result = '0'..result
    end
    return result
end

-- TUMBLERS is used in conjunction with advance_tumbler() and seed_index() 
-- to decode the seed index based on a given Random() or rand() seed
TUMBLERS = {
    nice_seed = { -- Random()
        { a = 0x01010101, b = 0x00000001 }, -- 1
        { a = 0x30881001, b = 0xf6a87810 }, -- 2
        { a = 0x80810001, b = 0xeaff8100 }, -- 3
        { a = 0x08100001, b = 0x27f81000 }, -- 4
        { a = 0x81000001, b = 0x7f810000 }, -- 5
        { a = 0x10000001, b = 0xf8100000 }, -- 6
        { a = 0x00000001, b = 0x81000000 }, -- 7
        { a = 0x00000001, b = 0x10000000 }, -- 8
    },
    evil_seed = { -- rand()
        { a = 0x41c64e6d, b = 0x00003039 }, -- 1
        { a = 0x5f748241, b = 0x65136930 }, -- 2
        { a = 0xbe67a401, b = 0x1ef73300 }, -- 3
        { a = 0x65fa4001, b = 0xb8133000 }, -- 4
        { a = 0xdfa40001, b = 0x21330000 }, -- 5
        { a = 0xfa400001, b = 0x13300000 }, -- 6
        { a = 0xa4000001, b = 0x33000000 }, -- 7
        { a = 0x40000001, b = 0x30000000 }, -- 8
    }
}

function advance_tumbler(__tumblers, __index, __seed)
    local a = __tumblers[__index].a
    local b = __tumblers[__index].b
    local result = bit.band(
        0xFFFFFFFF,
        mul32(__seed, a).lo + b
    )
    return result
end

function seed_index(__target_seed, __tumblers)
    local result = 0
    local temp = 0x00000000
    -- Unlock tumblers 1 through 8
    for i=1,8 do
        local mask = bit.lshift(1, 4 * i) - 1
        local step_size = bit.lshift(1, 4 * (i - 1))
        while bit.band(temp, mask) ~= bit.band(__target_seed, mask) do
            temp = advance_tumbler(__tumblers, i, temp)
            result = result + step_size
        end
    end
    return result
end

-- main functions and global variables

local _prev_nice_index = 0
local _prev_evil_index = 0

while true do
    local x = 128
    local y = 12
    -- Clear the GUI
    gui.clearGraphics()
    gui.pixelText(x + 20, y + 0, "seed     rng  index    delta", 0xff999999)
    -- Show nice RNG info
    local nice_seed = mainmemory.read_u32_le(ADDRESSES.nice_seed)
    local nice_rng = bit.band(0xff, bit.rshift(nice_seed, 0x18))
    local nice_index = seed_index(nice_seed, TUMBLERS.nice_seed)
    local nice_delta = nice_index - _prev_nice_index
    if nice_delta > 0 then
        nice_delta = "+"..nice_delta
    else
        nice_delta = " -"
    end
    gui.pixelText(x + 0, y + 8, "nice", 0xff00ff00)
    gui.pixelText(x + 20, y + 8, hex(nice_seed, 8))
    gui.pixelText(x + 56, y + 8, hex(nice_rng, 2))
    gui.pixelText(x + 76, y + 8, nice_index)
    gui.pixelText(x + 112, y + 8, nice_delta, 0xff9999ff)
    -- Show evil RNG info
    local evil_seed = mainmemory.read_u32_le(ADDRESSES.evil_seed)
    local evil_rng = bit.band(0x7fff, bit.rshift(evil_seed, 0x11))
    local evil_index = seed_index(evil_seed, TUMBLERS.evil_seed)
    local evil_delta = evil_index - _prev_evil_index
    if evil_delta > 0 then
        evil_delta = "+"..evil_delta
    else
        evil_delta = " -"
    end
    gui.pixelText(x + 0, y + 16, "evil", 0xffff0000)
    gui.pixelText(x + 20, y + 16, hex(evil_seed, 8))
    gui.pixelText(x + 56, y + 16, hex(evil_rng, 4))
    gui.pixelText(x + 76, y + 16, evil_index)
    gui.pixelText(x + 112, y + 16, evil_delta, 0xff9999ff)
    -- Advance the frame
    emu.frameadvance()
    _prev_nice_index = nice_index
    _prev_evil_index = evil_index
end