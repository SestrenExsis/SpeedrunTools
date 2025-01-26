
require "SotnCore"

local P = {}
DisplayRNGValues = P

P.seed_from_index = function(__target_index, __tumblers)
    local result = 0x00000000
    local pushes = __target_index
    for i = 8,1,-1 do
        local power = 0x10 ^ (i - 1)
        while pushes >= power do
            result = SotnCore.advance_tumbler(__tumblers, i, result)
            pushes = pushes - power
        end
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

P.RNG = {}
for i=1,32 do
    table.insert(P.RNG, {
        id = i,
        index = 0,
        seed = 0x00000000,
        rng = 0x0000,
        mask = 0x7fff,
        roll = 0x0000,
        note = '-',
    })
end

P.draw = function()
    P.canvas.Clear(0xff000000)
    P.text(0, 0, P.evil_delta.. " RNG calls this frame", 0xff9999ff)
    P.text(0, 2, "#. index..... seed.... rng. mask roll. note...", 0xffffffff, 0xff000000)
    -- Show all RNG calls this frame
    for i=1,P.evil_delta do
        if P.RNG[i] ~= nil then
            P.text( 0, 3 + i, P.RNG[i].id, 0xff999999)
            P.text( 3, 3 + i, P.RNG[i].index, 0xff999999)
            P.text( 13, 3 + i, SotnCore.hex(P.RNG[i].seed, 8), 0xff999999)
            P.text( 21, 3 + i, SotnCore.hex(P.RNG[i].rng, 4), 0xff999999)
            P.text( 26, 3 + i, SotnCore.hex(P.RNG[i].mask, 4), 0xff999999)
            P.text( 31, 3 + i, P.RNG[i].roll, 0xff999999)
            P.text( 36, 3 + i, P.RNG[i].note, 0xff999999)
        end
    end
    -- Refresh
    P.canvas.Refresh()
end

P.onframestart = function()
    P.evil_seed = SotnCore.read_evil_seed()
    P.evil_index = SotnCore.evil_seed_index(P.evil_seed)
end

P.onframeend = function()
    local prev_evil_index = P.evil_index
    P.evil_seed = SotnCore.read_evil_seed()
    P.evil_index = SotnCore.evil_seed_index(P.evil_seed)
    P.evil_delta = P.evil_index - prev_evil_index
    P.RNG = {}
    for i=1,32 do
        table.insert(P.RNG, {
            id = i,
            index = 0,
            seed = 0x00000000,
            rng = 0x0000,
            mask = 0x7fff,
            roll = 0x0000,
            note = '-',
        })
    end
    local prev_index = P.evil_index - P.evil_delta
    local seed = P.seed_from_index(prev_index, SotnCore.Tumblers.EvilSeed)
    for i=1,P.evil_delta do
        if P.RNG[i] ~= nil then
            seed = SotnCore.advance_tumbler(SotnCore.Tumblers.EvilSeed, 1, seed)
            P.RNG[i].id = i
            P.RNG[i].index = SotnCore.evil_seed_index(seed)
            P.RNG[i].seed = seed
            -- NOTE: See spec for rand() in psx-spx
            P.RNG[i].rng = BizMath.band(0x7fff, BizMath.rshift(seed, 0x10))
            P.RNG[i].mask = 0xff
            P.RNG[i].roll = BizMath.band(P.RNG[i].mask, P.RNG[i].rng)
            P.RNG[i].note = '-'
        end
    end
    -- Crit check
    local crit_chance = 0x10
    local rolls = 2
    local crit_rng = P.RNG[rolls]
    crit_rng.mask = 0xff
    local crit_roll = BizMath.band(crit_rng.mask, crit_rng.rng)
    if crit_roll < crit_chance then
        crit_rng.note = 'CRIT=Y'
        -- Strength check for Crit
        local str_bonus_rng = P.RNG[rolls + 1]
        str_bonus_rng.mask = 0x3f
        str_bonus_rng.roll = BizMath.band(str_bonus_rng.mask, str_bonus_rng.rng)
        local str_stat = mainmemory.read_u8(0x097bb8)
        local str_weight = str_stat + str_bonus_rng.roll
        str_bonus_rng.note = 'STR='..str_stat..'+'..str_bonus_rng.roll..'='..str_weight
        -- Constitution check for Crit
        local con_bonus_rng = P.RNG[rolls + 2]
        con_bonus_rng.mask = 0x3f
        con_bonus_rng.roll = BizMath.band(con_bonus_rng.mask, con_bonus_rng.rng)
        local con_stat = mainmemory.read_u8(0x097bbc)
        local con_weight = con_stat + con_bonus_rng.roll
        con_bonus_rng.note = 'CON='..con_stat..'+'..con_bonus_rng.roll..'='..con_weight
        -- Intelligence check for Crit
        local int_bonus_rng = P.RNG[rolls + 3]
        int_bonus_rng.mask = 0x3f
        int_bonus_rng.roll = BizMath.band(int_bonus_rng.mask, int_bonus_rng.rng)
        local int_stat = mainmemory.read_u8(0x097bc0)
        local int_weight = int_stat + int_bonus_rng.roll
        int_bonus_rng.note = 'INT='..int_stat..'+'..int_bonus_rng.roll..'='..int_weight
        -- Luck check for Crit
        local lck_bonus_rng = P.RNG[rolls + 4]
        lck_bonus_rng.mask = 0x3f
        lck_bonus_rng.roll = BizMath.band(lck_bonus_rng.mask, lck_bonus_rng.rng)
        local lck_stat = mainmemory.read_u8(0x097bc4)
        local lck_weight = lck_stat + lck_bonus_rng.roll
        lck_bonus_rng.note = 'LCK='..lck_stat..'+'..lck_bonus_rng.roll..'='..lck_weight
        -- ...
        rolls = rolls + 4
        if (
            lck_weight > int_weight and
            lck_weight > con_weight and
            lck_weight > str_weight
        ) then
            local lucky_crit_rng = P.RNG[rolls + 1]
            lucky_crit_rng.mask = 0x7fff
            lucky_crit_rng.roll = BizMath.band(lucky_crit_rng.mask, lucky_crit_rng.rng)
            lucky_crit_rng.note = 'Luck-based Crit'
            rolls = rolls + 1
        end
    else
        crit_rng.note = 'CRIT=N'
    end
    -- Item drop check
    local base_drop_rate = 0x40
    local rare_drop_rate = 0x02
    local uncommon_drop_rate = 0x10
    local rings_of_arcana = 0
    local luck = mainmemory.read_u8(0x097bc4)
    local roll0_rng = P.RNG[rolls + 1]
    roll0_rng.mask = 0xff
    roll0_rng.roll = BizMath.band(roll0_rng.mask, roll0_rng.rng)
    rolls = rolls + 1
    local modified_drop_rate = base_drop_rate + math.floor((base_drop_rate * luck) / 128)
    local drop_ind = 'N'
    if roll0_rng.roll < modified_drop_rate then
        drop_ind = 'Y'
        local roll1_rng = P.RNG[rolls + 1]
        roll1_rng.mask = 0xff
        roll1_rng.roll = BizMath.band(roll1_rng.mask, roll1_rng.rng)
        local roll2_rng = P.RNG[rolls + 2]
        roll2_rng.mask = 0x1f
        roll2_rng.roll = BizMath.band(roll2_rng.mask, roll2_rng.rng)
        local luck_mod = math.floor((roll2_rng.roll + luck) / 20)
        local result = roll1_rng.roll - luck_mod
        roll2_rng.note = 'MOD='..luck_mod
        result = result - rare_drop_rate * math.max(0, rings_of_arcana)
        if result < rare_drop_rate then
            roll1_rng.note = 'RARE=Y '..result
        else
            roll1_rng.note = 'RARE=N '..result
            result = result - rare_drop_rate
            result = result - uncommon_drop_rate * math.max(0, rings_of_arcana)
            local roll3_rng = P.RNG[rolls + 3]
            roll3_rng.mask = 0x1f
            roll3_rng.roll = BizMath.band(roll3_rng.mask, roll3_rng.rng)
            rolls = rolls + 1
            local luck_mod2 = math.floor((roll3_rng.roll + luck) / 20)
            result = result - luck_mod2
            if result < uncommon_drop_rate then
                roll3_rng.note = 'UNCOMMON=Y'
            else
                roll3_rng.note = 'UNCOMMON=N'
            end
        end
    end
    roll0_rng.note = 'DROP='..drop_ind
end

event.unregisterbyname("DisplayItemDropLogic__onframestart")
event.onframestart(P.onframestart, "DisplayItemDropLogic__onframestart")
event.unregisterbyname("DisplayItemDropLogic__onframeend")
event.onframeend(P.onframeend, "DisplayItemDropLogic__onframeend")

gui.defaultBackground(0xffff0000)
P.scale = 1
P.evil_seed = 0
P.evil_index = 0
P.evil_delta = 0
P.canvas_width = P.scale * 512
P.canvas_height = P.scale * 378
P.canvas = gui.createcanvas(P.canvas_width, P.canvas_height, P.scale * 4, P.scale * 4)
P.canvas.SetTitle("DisplayItemDropLogic")

while true do
    emu.yield()
    P.draw()
end