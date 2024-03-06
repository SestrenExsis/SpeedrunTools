
local function getVersion()
    local version = "legacy"
    if client ~= nil and client.getversion ~= nil then
        version = client.getversion()
    end
    -- TODO(sestren): Remove patch version in a more sensible way
    if version == "2.9.1" then
        version = "2.9"
    end
    return version
end

if getVersion() == "2.9" then
    require "BizMath29"
else
    require "BizMathLegacy"
end

local P = {}
DisplayRNGValues = P

P.Addresses = {
    PlaystationEvilSeed = 0x009010,
    PlaystationNiceSeed = 0x0978B8,
    SaturnEvilSeed = 0x0482B8,
    SaturnNiceSeed = 0x05D748,
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

P.read_nice_seed = function()
    local result = nil
    local systemid = emu.getsystemid()
    if systemid == 'PSX' then
        result = P.read_u32(P.Addresses.PlaystationNiceSeed)
    elseif systemid == 'SAT' then
        local a = mainmemory.read_u16_le(P.Addresses.SaturnNiceSeed)
        local b = mainmemory.read_u16_le(P.Addresses.SaturnNiceSeed + 2)
        result = BizMath.bor(BizMath.lshift(a, 0x10), b)
    end
    return result
end

P.read_evil_seed = function()
    local result = nil
    local systemid = emu.getsystemid()
    if systemid == 'PSX' then
        result = P.read_u32(P.Addresses.PlaystationEvilSeed)
    elseif systemid == 'SAT' then
        local a = mainmemory.read_u16_le(P.Addresses.SaturnEvilSeed)
        local b = mainmemory.read_u16_le(P.Addresses.SaturnEvilSeed + 2)
        result = BizMath.bor(BizMath.lshift(a, 0x10), b)
    end
    return result
end

P.read_u32 = function(__address)
    local result = nil
    local systemid = emu.getsystemid()
    if systemid == 'PSX' then
        result = mainmemory.read_u32_le(__address)
    elseif systemid == 'SAT' then
        local a = mainmemory.read_u16_le(__address)
        local b = mainmemory.read_u16_le(__address + 2)
        result = BizMath.bor(BizMath.lshift(a, 0x10), b)
    end
    return result
end

P.advance_tumbler = function(__tumblers, __index, __seed)
    local a = __tumblers[__index].A
    local b = __tumblers[__index].B
    local result = BizMath.band(
        0xffffffff,
        P.mul32(__seed, a).lo + b
    )
    return result
end

P.seed_index = function(__target_seed, __tumblers)
    local result = 0
    local temp = 0x00000000
    if emu.getsystemid() == 'SAT' then
        temp = 0x00000001
    end
    -- Unlock tumblers 1 through 8
    for i=1,8 do
        local mask = BizMath.lshift(1, 4 * i) - 1
        local step_size = BizMath.lshift(1, 4 * (i - 1))
        while BizMath.band(temp, mask) ~= BizMath.band(__target_seed, mask) do
            temp = P.advance_tumbler(__tumblers, i, temp)
            result = result + step_size
        end
    end
    return result
end

P.mul32 = function(__a, __b)
    -- Split a and b into their high and low bytes
    local a0 = BizMath.rshift(__a, 0x10)
    local a1 = BizMath.band(__a, 0xffff)
    local b0 = BizMath.rshift(__b, 0x10)
    local b1 = BizMath.band(__b, 0xffff)
    -- Use FOIL to stay within Lua number precision bounds
    local temp = a0 * b1 + a1 * b0
    local lo = a1 * b1 + BizMath.lshift(BizMath.band(temp, 0xffff), 0x10)
    -- TODO(sestren): Verify if hi equation should use rshift or lshift
    local hi = a0 * b0 + BizMath.lshift(temp, 0x10)
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

P.set_nice_rng_index = function(__index)
    local nice_seed = 0x00000000
    for j = 1, __index do
        nice_seed = P.advance_tumbler(P.Tumblers.NiceSeed, 1, nice_seed)
    end
    mainmemory.write_u32_le(P.Addresses.NiceSeed, nice_seed)
end

P.increment_nice_rng = function()
    local nice_seed = P.read_u32(P.Addresses.NiceSeed)
    local nice_index = P.seed_index(nice_seed, P.Tumblers.NiceSeed)
    if nice_index < 0xffffffff then
        nice_index = nice_index + 1
        P.set_nice_rng_index(nice_index)
    end
end

P.decrement_nice_rng = function()
    local nice_seed = P.read_u32(P.Addresses.NiceSeed)
    local nice_index = P.seed_index(nice_seed, P.Tumblers.NiceSeed)
    if nice_index > 0 then
        nice_index = (nice_index - 1) % 0xffffffff
        P.set_nice_rng_index(nice_index)
    end
end

P.draw = function()
    P.canvas.Clear(0xff000000)
    P.text(5, 0, "seed      rng  index    delta", 0xff999999, 0xff000000)
    -- Show nice RNG info
    local nice_rng = BizMath.band(
        0xff,
        BizMath.rshift(P.nice_seed, 0x18)
    )
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
    local evil_rng = BizMath.band(
        0x7fff,
        BizMath.rshift(P.evil_seed, 0x11)
    )
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

P.update = function()
    -- TODO(sestren): Figure out how to handle the canvas going away
    -- local x = P.canvas.GetMouseX()
    -- local y = P.canvas.GetMouseY()
    -- if x >= 0 and x < P.canvas_width then
    --     if y >= 0 and y < P.canvas_height then
    --         if input.getmouse().Left then
    --             P.decrement_nice_rng()
    --         elseif input.getmouse().Right then
    --             P.increment_nice_rng()
    --         end
    --     end
    -- end
    P.prev_nice_index = P.nice_index
    P.prev_evil_index = P.evil_index
    P.nice_seed = P.read_nice_seed()
    P.evil_seed = P.read_evil_seed()
    P.nice_index = P.seed_index(P.nice_seed, P.Tumblers.NiceSeed)
    P.evil_index = P.seed_index(P.evil_seed, P.Tumblers.EvilSeed)
end

event.unregisterbyname("DisplayRNGValues__update")
event.onframeend(P.update, "DisplayRNGValues__update")

gui.defaultBackground(0xffff0000)
P.scale = 1
P.prev_nice_index = 0
P.prev_evil_index = 0
P.nice_seed = 0
P.evil_seed = 0
P.nice_index = 0
P.evil_index = 0
P.canvas_width = P.scale * 320
P.canvas_height = P.scale * 56
P.canvas = gui.createcanvas(P.canvas_width, P.canvas_height, P.scale * 4, P.scale * 4)
P.canvas.SetTitle("DisplayRNGValues")

P.update()
while true do
    emu.yield()
    P.draw()
end