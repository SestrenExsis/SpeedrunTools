
local P = {}
SotnSaturnCore = P

P.Addresses = {
    EvilSeed = 0x0482B8,
    NiceSeed = 0x05D748,
}

P.StartingSeeds = {
    EvilSeed = 0x000001,
    NiceSeed = 0x000000,
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

P.read4 = function(__address)
    -- mainmemory.read_u32_le(__address)
    local a = mainmemory.read_u16_le(__address)
    local b = mainmemory.read_u16_le(__address + 2)
    local result = (a << 0x10) | b
    return result
end

P.advance_tumbler = function(__tumblers, __index, __seed)
    local a = __tumblers[__index].A
    local b = __tumblers[__index].B
    local result = (
        0xffffffff & P.mul32(__seed, a).lo + b
    )
    return result
end

P.seed_index = function(__starting_seed, __target_seed, __tumblers)
    local result = 0
    local temp = __starting_seed
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

P.prev_nice_index = 0
P.prev_evil_index = 0

P.dpad_mnemonics = {}
P.dpad_mnemonics["U"] = "P1 Up"
P.dpad_mnemonics["D"] = "P1 Down"
P.dpad_mnemonics["L"] = "P1 Left"
P.dpad_mnemonics["R"] = "P1 Right"

P.action_mnemonics = {}
P.action_mnemonics["Attack"] = "P1 A"
P.action_mnemonics["Dash"] = "P1 R"
P.action_mnemonics["Shield"] = "P1 C"
P.action_mnemonics["Jump"] = "P1 B"
P.action_mnemonics["Item"] = "P1 L"
P.action_mnemonics["Mist"] = "P1 X"
P.action_mnemonics["Bat"] = "P1 Y"
P.action_mnemonics["Wolf"] = "P1 Z"
P.action_mnemonics["Menu"] = "P1 Start"

P.action = function(dpad, actions, frames)
    if dpad == nil then
        dpad = ""
    end
    if actions == nil then
        actions = ""
    end
    if frames == nil then
        frames = 1
    end
    for i=1,frames do
        local result = {}
        for key, value in pairs(P.dpad_mnemonics) do
            if bizstring.contains(dpad, key) then
                result[value] = true
            end
        end
        for key, value in pairs(P.action_mnemonics) do
            if bizstring.contains(actions, key) then
                result[value] = true
            end
        end
        joypad.set(result)
        emu.frameadvance()
    end
    return result
end

return SotnCore
