
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
    SaturnEvilSeed = 0x0482B8,
}

-- Tumblers is used in conjunction with advance_tumbler() and seed_index() 
-- to decode the seed index based on a given nice or evil seed
P.Tumblers = {
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
    local font_height = P.scale * 12
    local font_width = P.scale * 8
    if __color == nil then
        __color = 0xff999999
    end
    local x = font_width * (__col + 0.5)
    local y = font_height * (__row + 0.5)
    P.canvas.DrawText(x, y, __message, __color, 0xff000000, font_height)
end

P.target_indexes = {
    184, 498, 541, 709, 882,
    982, 1439, 1741, 1762, 2490,
    2841, 3300, 3411, 3416, 3459,
    3624, 3679, 4641, 5162, 5304,
    5958, 5963, 6191, 6224, 6927,
    7016, 7494, 8191, 8499, 8688,
    9610, 9744, 11354, 11857, 12086,
    12131, 12808, 13470, 13709, 13764,
    13799, 14173, 14226, 14515, 14567,
}

P.draw = function()
    P.canvas.Clear(0xff000000)
    P.text(19, 0, "seed      index    delta", 0xff999999, 0xff000000)
    -- Show evil RNG info
    local evil_rng = BizMath.band(
        0x7fff,
        BizMath.rshift(P.evil_seed, 0x11)
    )
    local evil_delta_str = P.evil_delta
    if evil_delta_str > 0 then
        evil_delta_str = "+"..evil_delta_str
    else
        evil_delta_str = " -"
    end
    P.text(10, 1, "Evil RNG", 0xffff0000)
    P.text(19, 1, P.hex(P.evil_seed, 8))
    P.text(28, 1, P.evil_index)
    P.text(37, 1, evil_delta_str, 0xff9999ff)
    -- Show frames off from Masamune drop for Saturn
    if emu.getsystemid() == 'SAT' then
        if (
            P.prev_evil_index ~= nil and
            P.prev_evil_index > 0 and
            P.prev_evil_index < 15000 and
            P.evil_delta >= 8
        ) then
            local min_diff = nil
            for i=1,#P.target_indexes do
                local diff = P.target_indexes[i] - P.prev_evil_index
                if (
                    min_diff == nil or
                    math.abs(diff) < math.abs(min_diff)
                ) then
                    min_diff = diff
                end
            end
            local min_diff_str = '?'
            if min_diff ~= nil then
                if min_diff > 0 then
                    min_diff_str = 'early by '..min_diff..' frames'
                elseif min_diff < 0 then
                    min_diff_str = 'late by '..math.abs(min_diff)..' frames'
                else
                    min_diff_str = 'exactly the right frame'
                end
            end
            P.text(19, 3, min_diff_str, 0xffffffff)
        end
    end
    -- Show timeline
    local timeline = ''
    local start_time = P.evil_index
    for offset=-30,30 do
        local time = start_time + offset
        local char = '.'
        for j=1,#P.target_indexes do
            if P.target_indexes[j] == time then
                char = 't'
                break
            end
        end
        if offset == -1 then
            if char == '.' then
                char = '|'
            else
                char = 'T'
            end
        end
        timeline = timeline..char
        time = time + 1
    end
    P.text(0, 5, timeline, 0xff999999)
    P.canvas.Refresh()
end

P.onframestart = function()
    P.evil_seed = P.read_evil_seed()
    P.evil_index = P.seed_index(P.evil_seed, P.Tumblers.EvilSeed)
end

P.onframeend = function()
    P.prev_evil_index = P.evil_index
    P.evil_seed = P.read_evil_seed()
    P.evil_index = P.seed_index(P.evil_seed, P.Tumblers.EvilSeed)
    P.evil_delta = P.evil_index - P.prev_evil_index
end

event.unregisterbyname("DisplayMasamuneDrops__onframestart")
event.onframestart(P.onframestart, "DisplayMasamuneDrops__onframestart")
event.unregisterbyname("DisplayMasamuneDrops__onframeend")
event.onframeend(P.onframeend, "DisplayMasamuneDrops__onframeend")

gui.defaultBackground(0xffff0000)
P.scale = 1
P.prev_evil_index = 0
P.evil_seed = 0
P.evil_index = 0
P.evil_delta = 0
P.canvas_width = P.scale * 470
P.canvas_height = P.scale * 96
P.canvas = gui.createcanvas(P.canvas_width, P.canvas_height, P.scale * 4, P.scale * 4)
P.canvas.SetTitle("DisplayMasamuneDrops")

while true do
    emu.yield()
    P.draw()
end