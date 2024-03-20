
local P = {}
SotnCore = P

P.get_bizhawk_version = function()
    local version = "0.0.0"
    if client ~= nil and client.getversion ~= nil then
        version = client.getversion()
    end
    local result = {}
    for str in string.gmatch(version, "([^.]+)") do
        table.insert(result, tonumber(str))
    end
    while #result < 3 do
        table.insert(result, 0)
    end
    return result
end

P.bizhawk_version = P.get_bizhawk_version()
if (
    P.bizhawk_version[1] > 2 or
    (P.bizhawk_version[1] == 2 and P.bizhawk_version[2] >= 9)
) then
    require "BizMath29"
else
    require "BizMathLegacy"
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

P.Addresses = {
    PlaystationEvilSeed = 0x009010,
    PlaystationNiceSeed = 0x0978B8,
    SaturnEvilSeed = 0x0482B8,
    SaturnNiceSeed = 0x05D748,
}

P.StartingSeeds = {
    EvilSeed = 0x000001,
    NiceSeed = 0x000000,
}

-- Tumblers is used in conjunction with advance_tumbler() and seed_index() 
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
    local result = BizMath.band(
        0xffffffff,
        P.mul32(__seed, a).lo + b
    )
    return result
end

P.evil_seed_index = function(__target_seed)
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
            temp = P.advance_tumbler(P.Tumblers.EvilSeed, i, temp)
            result = result + step_size
        end
    end
    return result
end

P.nice_seed_index = function(__target_seed)
    local result = 0
    local temp = 0x00000000
    -- Unlock tumblers 1 through 8
    for i=1,8 do
        local mask = BizMath.lshift(1, 4 * i) - 1
        local step_size = BizMath.lshift(1, 4 * (i - 1))
        while BizMath.band(temp, mask) ~= BizMath.band(__target_seed, mask) do
            temp = P.advance_tumbler(P.Tumblers.NiceSeed, i, temp)
            result = result + step_size
        end
    end
    return result
end

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

P.dpad_mnemonics = {}
P.action_mnemonics = {}

local systemid = emu.getsystemid()
if systemid == 'PSX' then
    P.dpad_mnemonics["U"] = "P1 D-Pad Up"
    P.dpad_mnemonics["D"] = "P1 D-Pad Down"
    P.dpad_mnemonics["L"] = "P1 D-Pad Left"
    P.dpad_mnemonics["R"] = "P1 D-Pad Right"
    P.action_mnemonics["Attack"] = "P1 □"
    P.action_mnemonics["Dash"] = "P1 △"
    P.action_mnemonics["Shield"] = "P1 ○"
    P.action_mnemonics["Jump"] = "P1 X"
    P.action_mnemonics["Mist"] = "P1 L1"
    P.action_mnemonics["L2"] = "P1 L2"
    P.action_mnemonics["Bat"] = "P1 R1"
    P.action_mnemonics["Wolf"] = "P1 R2"
    P.action_mnemonics["Map"] = "P1 Select"
    P.action_mnemonics["Menu"] = "P1 Start"
elseif systemid == 'SAT' then
    P.dpad_mnemonics["U"] = "P1 Up"
    P.dpad_mnemonics["D"] = "P1 Down"
    P.dpad_mnemonics["L"] = "P1 Left"
    P.dpad_mnemonics["R"] = "P1 Right"
    P.action_mnemonics["Attack"] = "P1 A"
    P.action_mnemonics["Dash"] = "P1 R"
    P.action_mnemonics["Shield"] = "P1 C"
    P.action_mnemonics["Jump"] = "P1 B"
    P.action_mnemonics["Item"] = "P1 L"
    P.action_mnemonics["Mist"] = "P1 X"
    P.action_mnemonics["Bat"] = "P1 Y"
    P.action_mnemonics["Wolf"] = "P1 Z"
    P.action_mnemonics["Menu"] = "P1 Start"
end

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
