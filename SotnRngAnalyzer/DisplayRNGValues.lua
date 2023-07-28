
local P = {}
DisplayRNGValues = P

P.Addresses = {
    EvilSeed = 0x009010,
    NiceSeed = 0x0978B8,
}

-- Tumblers is used in conjunction with advance_tumbler() and seed_index() 
-- to decode the seed index based on a given nice or evil seed
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
    local result = (
        0xFFFFFFFF & P.mul32(__seed, a).lo + b
    )
    return result
end

P.seed_index = function(__target_seed, __tumblers)
    local result = 0
    local temp = 0x00000000
    -- Unlock tumblers 1 through 8
    for i=1,8 do
        local mask = (1 << 4 * i) - 1
        local step_size = (1 << 4 * (i - 1))
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
    local hi = a0 * b0 + (temp << 0x10)
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

P.draw = function()
    P.canvas.Clear(0xff000000)
    P.text(5, 0, "seed      rng  index    delta", 0xff999999, 0xff000000)
    -- Show nice RNG info
    local nice_rng = (0xff & (P.nice_seed >> 0x18))
    local nice_delta = P.nice_index - P.prev_nice_index
    if nice_delta > 0 then
        nice_delta = "+"..nice_delta
    else
        nice_delta = " -"
    end
    P.text(0, 1, "nice", 0xff00ff00)
    P.text(5, 1, P.hex(P.nice_seed, 8))
    P.text(14, 1, P.hex(nice_rng, 2))
    P.text(19, 1, P.nice_index)
    P.text(28, 1, nice_delta, 0xff9999ff)
    -- Show evil RNG info
    local evil_rng = (0x7fff & (P.evil_seed >> 0x11))
    local evil_delta = P.evil_index - P.prev_evil_index
    if evil_delta > 0 then
        evil_delta = "+"..evil_delta
    else
        evil_delta = " -"
    end
    P.text(0, 2, "evil", 0xffff0000)
    P.text(5, 2, P.hex(P.evil_seed, 8))
    P.text(14, 2, P.hex(evil_rng, 4))
    P.text(19, 2, P.evil_index)
    P.text(28, 2, evil_delta, 0xff9999ff)
    P.canvas.Refresh()
end

gui.defaultBackground(0xffff0000)
P.prev_nice_index = 0
P.prev_evil_index = 0
P.nice_seed = 0
P.evil_seed = 0
P.nice_index = 0
P.evil_index = 0
P.canvas = gui.createcanvas(300, 52, 4, 4)

P.update = function()
    P.prev_nice_index = P.nice_index
    P.prev_evil_index = P.evil_index
    P.nice_seed = mainmemory.read_u32_le(P.Addresses.NiceSeed)
    P.evil_seed = mainmemory.read_u32_le(P.Addresses.EvilSeed)
    P.nice_index = P.seed_index(P.nice_seed, P.Tumblers.NiceSeed)
    P.evil_index = P.seed_index(P.evil_seed, P.Tumblers.EvilSeed)
end

event.unregisterbyname("DisplayRNGValues__update")
event.onframeend(P.update, "DisplayRNGValues__update")

P.update()
while true do
    emu.yield()
    P.draw()
end