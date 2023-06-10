
local P = {}
SotnCore = P

P.Addresses = {
    Alucard = {
        Facing = 0x137FC0,
        HP = 0x097BA0,
        Pos = {
            X = 0x073074,
            Y = 0x07307C
        }
    },
    EvilSeed = 0x009010,
    NiceSeed = 0x0978B8,
    Book3 = {
        Pos = {
            X = 0x077A5A,
            Y = 0x077A5E
        },
        Rotation = {
            Yaw = 0x077AFC,
            Roll = 0x077AFE,
            Pitch = 0x077B00
        },
        V0 = {
            X = 0x087848,
            Y = 0x08784A
        },
        V1 = {
            X = 0x087854,
            Y = 0x087856
        },
        V2 = {
            X = 0x087860,
            Y = 0x087862
        },
        V3 = {
            X = 0x08786C,
            Y = 0x08786E
        },
        V4 = {
            X = 0x08787C,
            Y = 0x08787E
        },
        V5 = {
            X = 0x087888,
            Y = 0x08788A
        }
    }
}

-- TUMBLERS is used in conjunction with advance_tumbler() and seed_index() 
-- to decode the seed index based on a given Random() or rand() seed
P.Tumblers = {
    NiceSeed = { -- Random()
        { A = 0x01010101, B = 0x00000001 }, -- 1
        { A = 0x30881001, B = 0xf6a87810 }, -- 2
        { A = 0x80810001, B = 0xeaff8100 }, -- 3
        { A = 0x08100001, B = 0x27f81000 }, -- 4
        { A = 0x81000001, B = 0x7f810000 }, -- 5
        { A = 0x10000001, B = 0xf8100000 }, -- 6
        { A = 0x00000001, B = 0x81000000 }, -- 7
        { A = 0x00000001, B = 0x10000000 }, -- 8
    },
    EvilSeed = { -- rand()
        { A = 0x41c64e6d, B = 0x00003039 }, -- 1
        { A = 0x5f748241, B = 0x65136930 }, -- 2
        { A = 0xbe67a401, B = 0x1ef73300 }, -- 3
        { A = 0x65fa4001, B = 0xb8133000 }, -- 4
        { A = 0xdfa40001, B = 0x21330000 }, -- 5
        { A = 0xfa400001, B = 0x13300000 }, -- 6
        { A = 0xa4000001, B = 0x33000000 }, -- 7
        { A = 0x40000001, B = 0x30000000 }, -- 8
    }
}

P.advance_tumbler = function(__tumblers, __index, __seed)
    local a = __tumblers[__index].A
    local b = __tumblers[__index].B
    local result = 0xFFFFFFFF & (P.mul32(__seed, a).lo + b))
    return result
end

P.seed_index = function(__target_seed, __tumblers)
    local result = 0
    local temp = 0x00000000
    -- Unlock tumblers 1 through 8
    for i=1,8 do
        local mask = (1 << (4 * i)) - 1
        local step_size = (1 << (4 * (i - 1)))
        while (temp & mask) ~= (__target_seed & mask) do
            temp = P.advance_tumbler(__tumblers, i, temp)
            result = result + step_size
        end
    end
    return result
end

P.mul32 = function(__a, __b)
    -- Split a and b into their high and low bytes
    local a0 = (__a >> 0x10)
    local a1 = (__a & 0xffff)
    local b0 = (__b >> 0x10)
    local b1 = (__b & 0xffff)
    -- Use FOIL to stay within Lua number precision bounds
    local temp = a0 * b1 + a1 * b0
    local lo = a1 * b1 + ((temp & 0xffff) << 0x10)
    local hi = a0 * b0 + (temp >> 0x10)
    -- Output the low and high 32-bit halves of the product separately
    local result = {hi = hi, lo = lo}
    return result
end

P.hex = function(__number, __digits)
    local result = bizstring.hex(__number)
    while #result < __digits do
        result = '0'..result
    end
    return result
end

P.prev_nice_index = 0
P.prev_evil_index = 0

P.draw_rng = function(x, y)
    -- Clear the GUI
    gui.clearGraphics()
    gui.pixelText(x + 20, y + 0, "seed     rng  index    delta", 0xff999999)
    -- Show nice RNG info
    local nice_seed = mainmemory.read_u32_le(SotnCore.Addresses.NiceSeed)
    local nice_rng = (0xff & (nice_seed >> 0x18))
    local nice_index = SotnCore.seed_index(nice_seed, SotnCore.Tumblers.NiceSeed)
    local nice_delta = nice_index - P.prev_nice_index
    if nice_delta > 0 then
        nice_delta = "+"..nice_delta
    else
        nice_delta = " -"
    end
    gui.pixelText(x + 0, y + 8, "nice", 0xff00ff00)
    gui.pixelText(x + 20, y + 8, SotnCore.hex(nice_seed, 8))
    gui.pixelText(x + 56, y + 8, SotnCore.hex(nice_rng, 2))
    gui.pixelText(x + 76, y + 8, nice_index)
    gui.pixelText(x + 112, y + 8, nice_delta, 0xff9999ff)
    -- Show evil RNG info
    local evil_seed = mainmemory.read_u32_le(SotnCore.Addresses.EvilSeed)
    local evil_rng = (0x7fff & (evil_seed >> 0x11))
    local evil_index = SotnCore.seed_index(evil_seed, SotnCore.Tumblers.EvilSeed)
    local evil_delta = evil_index - P.prev_evil_index
    if evil_delta > 0 then
        evil_delta = "+"..evil_delta
    else
        evil_delta = " -"
    end
    gui.pixelText(x + 0, y + 16, "evil", 0xffff0000)
    gui.pixelText(x + 20, y + 16, SotnCore.hex(evil_seed, 8))
    gui.pixelText(x + 56, y + 16, SotnCore.hex(evil_rng, 4))
    gui.pixelText(x + 76, y + 16, evil_index)
    gui.pixelText(x + 112, y + 16, evil_delta, 0xff9999ff)
    P.prev_nice_index = nice_index
    P.prev_evil_index = evil_index
end

return SotnCore