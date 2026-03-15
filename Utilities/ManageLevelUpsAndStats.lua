
local P = {}
ManageLevelUpsAndStats = P

P.settings = {
    sampleSize = 10000,
}

P.getStats = function()
    -- Get selected inputs
    local nameCode = forms.gettext(P.ui.nameCode)
    local startingHearts = forms.gettext(P.ui.startingHearts)
    local defeatDraculaTime = forms.gettext(P.ui.defeatDraculaTime)
    local finalHealth = forms.gettext(P.ui.finalHealth)
    local finalSubweapon = forms.gettext(P.ui.finalSubweapon)
    local lifeMaxUps = forms.gettext(P.ui.lifeMaxUps)
    if lifeMaxUps == nil or #lifeMaxUps < 2 then
        lifeMaxUps = P.option.lifeMaxUps[1]
    end
    local heartMaxUps = forms.gettext(P.ui.heartMaxUps)
    if heartMaxUps == nil or #heartMaxUps < 2 then
        heartMaxUps = P.option.heartMaxUps[1]
    end
    -- Starting stats
    local hp = 70
    local mp = 20
    local hearts = 50
    local strength = 6
    local constitution = 6
    local intelligence = 6
    local luck = 6
    local damageTakenRating = 0
    -- Perform checks and give stat bonuses
    if finalHealth == P.option.finalHealth.none then
        damageTakenRating = 3
        -- console.log('Item - Potion')
    elseif finalHealth == P.option.finalHealth.full then
        damageTakenRating = 0
        hp = hp + 5
        strength = strength + 1
        constitution = constitution + 1
        intelligence = intelligence + 1
        luck = luck + 1
    elseif finalHealth == P.option.finalHealth.halfOrMore then
        damageTakenRating = 1
        strength = strength + 1
    elseif finalHealth == P.option.finalHealth.lessThanHalf then
        damageTakenRating = 2
        constitution = constitution + 1
    end
    if finalHearts == P.option.finalHearts.zero and damageTakenRating < 3 then
        -- console.log('Item - Heart Refresh')
    end
    if startingHearts == P.option.startingHearts.moreThan40Hearts then
        intelligence = intelligence + 1
        -- console.log('Item - Neutron Bomb')
    elseif startingHearts == P.option.startingHearts.fewerThan41Hearts then
        strength = strength + 1
    end
    -- Subweapon
    if finalSubweapon == P.option.finalSubweapon.cross then
        if damageTakenRating < 3 then
            hearts = hearts + 5
            mp = mp + 5
        end
    elseif finalSubweapon == P.option.finalSubweapon.holyWater then
        if damageTakenRating < 2 then
            hearts = hearts + 5
            intelligence = intelligence + 1
        end
    elseif finalSubweapon == P.option.finalSubweapon.none then
        if damageTakenRating == 0 then
            constitution = constitution + 1
            intelligence = intelligence + 1
            luck = luck + 5
        elseif damageTakenRating == 1 then
            hp = hp + 5
        elseif damageTakenRating == 2 then
            strength = strength + 1
        end
    end
    if defeatDraculaTime == P.option.defeatDraculaTime.fast then
        hp = hp + 5
        mp = mp + 5
        hearts = hearts + 5
        strength = strength + 5
        constitution = constitution + 5
        intelligence = intelligence + 5
        luck = luck + 5
    elseif defeatDraculaTime == P.option.defeatDraculaTime.normal then
        luck = luck + 2
    elseif defeatDraculaTime == P.option.defeatDraculaTime.slow then
        luck = luck + 1
    elseif defeatDraculaTime == P.option.defeatDraculaTime.slower then
        console.log('...')
    elseif defeatDraculaTime == P.option.defeatDraculaTime.slowest then
        constitution = constitution + 1
    end
    if nameCode == P.option.nameCode.luckMode then
        hp = 25
        mp = 1
        hearts = 5
        strength = 1
        constitution = 0
        intelligence = 0
        luck = 99
        -- console.log('Item - Lapis Lazuli')
    elseif nameCode == P.option.nameCode.axeArmor then
        -- console.log('Item - Axe Lord Armor')
    end
    -- Return stats
    local result = {
        strength = strength,
        constitution = constitution,
        intelligence = intelligence,
        luck = luck,
        hp = hp + 5 * tonumber(string.sub(lifeMaxUps, -2)),
        mp = mp,
        hearts = hearts + 5 * tonumber(string.sub(heartMaxUps, -2)),
    }
    return result
end

P.getUpgrades = function()
    local fortune = 0
    local level = forms.gettext(P.ui.level)
    if level == nil or #level < 2 then
        level = P.option.level[1]
    end
    local levelUps = tonumber(string.sub(level, -2))
    local strength = 0
    local constitution = 0
    local intelligence = 0
    local luck = 0
    local hp = 0
    local mp = 0
    local hearts = 0
    for levelUp = 2, levelUps do
        hp = hp + P.hpIncreases[1 + levelUp // 10]
        local mpBonus = math.random(0, 1)
        mp = mp + 4 + mpBonus
        hearts = hearts + 2
        local statCount = 0
        if math.random(0, 1) == 1 then
            strength = strength + 1
            statCount = statCount + 1
        end
        if math.random(0, 1) == 1 then
            constitution = constitution + 1
            statCount = statCount + 1
        end
        if math.random(0, 1) == 1 then
            intelligence = intelligence + 1
            statCount = statCount + 1
        end
        if math.random(0, 1) == 1 then
            luck = luck + 1
            statCount = statCount + 1
        end
        if statCount < 2 then
            local randomStat = math.random(0, 3)
            if randomStat == 0 then
                strength = strength + 1
            elseif randomStat == 1 then
                constitution = constitution + 1
            elseif randomStat == 2 then
                intelligence = intelligence + 1
            elseif randomStat == 3 then
                luck = luck + 1
            end
            statCount = statCount + 1
        end
        fortune = fortune + statCount + mpBonus
    end
    local result = {
        strength = strength,
        constitution = constitution,
        intelligence = intelligence,
        luck = luck,
        hp = hp,
        mp = mp,
        hearts = hearts,
        fortune = fortune,
    }
    return result
end

P.getSamples = function(_sampleCount)
    local result = {}
    for i = 1, _sampleCount do
        local sample = P.getUpgrades()
        table.insert(result, sample)
    end
    return result
end

P.sortTable = function(_table, _sortKey)
    table.sort(_table, function(a, b) return a[_sortKey] < b[_sortKey] end)
end

P.regenerateSamples = function()
    local rolls = forms.gettext(P.ui.rolls)
    local sortKey = 'fortune'
    if rolls == P.option.rolls.strengthBottom10 then
        sortKey = 'strength'
    elseif rolls == P.option.rolls.strengthMiddle10 then
        sortKey = 'strength'
    elseif rolls == P.option.rolls.strengthTop10 then
        sortKey = 'strength'
    end
    P.samples = P.getSamples(P.settings.sampleSize)
    P.sortTable(P.samples, sortKey)
    P.selection.level = forms.gettext(P.ui.level)
end

P.rollStats = function()
    if forms.gettext(P.ui.level) ~= P.selection.level then
        P.regenerateSamples()
    end
    local stats = P.getStats()
    local rolls = forms.gettext(P.ui.rolls)
    local lowerPercentile = 0.0
    local percentileRange = 1.0
    if rolls == P.option.rolls.totalBottom60 then
        lowerPercentile = 0.0
        percentileRange = 0.6
    elseif rolls == P.option.rolls.totalMiddle60 then
        lowerPercentile = 0.2
        percentileRange = 0.6
    elseif rolls == P.option.rolls.totalTop60 then
        lowerPercentile = 0.8
        percentileRange = 0.6
    elseif rolls == P.option.rolls.totalBottom5 then
        lowerPercentile = 0.0
        percentileRange = 0.05
    elseif rolls == P.option.rolls.totalMiddle5 then
        lowerPercentile = 0.475
        percentileRange = 0.05
    elseif rolls == P.option.rolls.totalTop5 then
        lowerPercentile = 0.925
        percentileRange = 0.05
    elseif rolls == P.option.rolls.strengthBottom10 then
        lowerPercentile = 0.0
        percentileRange = 0.1
    elseif rolls == P.option.rolls.strengthMiddle10 then
        lowerPercentile = 0.45
        percentileRange = 0.1
    elseif rolls == P.option.rolls.strengthTop10 then
        lowerPercentile = 0.9
        percentileRange = 0.1
    end
    local lowerBound = math.floor(1 + lowerPercentile * P.settings.sampleSize)
    local upperBound = math.floor(lowerBound + percentileRange * P.settings.sampleSize - 1)
    local upgradeIndex = math.random(lowerBound, upperBound)
    local upgrades = P.samples[upgradeIndex]
    if upgrades == nil then
        upgrades = P.samples[1]
    end
    forms.settext(P.ui.strength, math.min(99, stats.strength + upgrades.strength))
    forms.settext(P.ui.constitution, math.min(99, stats.constitution + upgrades.constitution))
    forms.settext(P.ui.intelligence, math.min(99, stats.intelligence + upgrades.intelligence))
    forms.settext(P.ui.luck, math.min(99, stats.luck + upgrades.luck))
    forms.settext(P.ui.hp, math.min(9999, stats.hp + upgrades.hp))
    forms.settext(P.ui.mp, stats.mp + upgrades.mp)
    forms.settext(P.ui.hearts, math.min(9999, stats.hearts + upgrades.hearts))
end

P.applyStats = function()
    local level = forms.gettext(P.ui.level)
    if level == nil or #level < 2 then
        level = P.option.level[1]
    end
    local levelUps = tonumber(string.sub(level, -2))
	memory.write_u32_le(0x97BE8, levelUps)
    local xp = P.xpTargets[levelUps]
	memory.write_u32_le(0x97BEC, xp)
    local hp = tonumber(forms.gettext(P.ui.hp))
	memory.write_u32_le(0x97BA0, hp)
	memory.write_u32_le(0x97BA4, hp)
    local hearts = tonumber(forms.gettext(P.ui.hearts))
	memory.write_u32_le(0x97BA8, hearts)
	memory.write_u32_le(0x97BAC, hearts)
    local mp = tonumber(forms.gettext(P.ui.mp))
	memory.write_u32_le(0x97BB0, mp)
	memory.write_u32_le(0x97BB4, mp)
    local strength = tonumber(forms.gettext(P.ui.strength))
	memory.write_u32_le(0x97BB8, strength)
    local constitution = tonumber(forms.gettext(P.ui.constitution))
	memory.write_u32_le(0x97BBC, constitution)
    local intelligence = tonumber(forms.gettext(P.ui.intelligence))
	memory.write_u32_le(0x97BC0, intelligence)
    local luck = tonumber(forms.gettext(P.ui.luck))
	memory.write_u32_le(0x97BC4, luck)
end

P.update = function()
    -- ...
end

P.draw = function()
    -- ...
end

P.getOptions = function(_table)
    local result = {}
    for key, value in pairs(_table) do
        table.insert(result, value)
    end
    return result
end

event.unregisterbyname("ManageLevelUpsAndStats__update")
event.onframeend(P.update, "ManageLevelUpsAndStats__update")

P.option = {
    nameCode = {
        normal = 'No special name code',
        luckMode = 'Special name code - Luck Mode',
        axeArmor = 'Special name code - Axe Armor',
    },
    startingHearts = {
        moreThan40Hearts = 'Start with 41 or more hearts',
        fewerThan41Hearts = 'Start with fewer than 41 hearts',
    },
    defeatDraculaTime = {
        fast = 'Fast Dracula kill (0-60 seconds)',
        normal = 'Normal Dracula kill (61-120 seconds)',
        slow = 'Slow Dracula kill (121-180 seconds)',
        slower = 'Slower Dracula kill (181-999 seconds)',
        slowest = 'Slowest Dracula kill (1000+ seconds)',
    },
    finalHealth = {
        full = 'Full health remaining',
        halfOrMore = 'Half health or more remaining',
        lessThanHalf = 'Less than half health remaining',
        zero = 'No health remaining; rescued by Maria',
    },
    finalHearts = {
        zero = 'Finish fight with no hearts',
        oneOrMore = 'Finish fight with one or more hearts',
    },
    finalSubweapon = {
        cross = 'Cross subweapon',
        holyWater = 'Holy Water subweapon',
        none = 'No subweapon',
    },
    level = {
        [1] = 'Level 01',
    },
    lifeMaxUps = {
        [0] = 'Life Max-Ups = 00',
    },
    heartMaxUps = {
        [0] = 'Heart Max-Ups = 00',
    },
    rolls = {
        unbiased = 'Type 0 - Unbiased sample selection',
        totalBottom60 = 'Type 1A - Somewhat biased toward lower total rolls',
        totalMiddle60 = 'Type 1B - Somewhat biased toward average total rolls',
        totalTop60 = 'Type 1C - Somewhat biased toward higher total rolls',
        totalBottom5 = 'Type 2A - Extremely biased toward lower total rolls',
        totalMiddle5 = 'Type 2B - Extremely biased toward average total rolls',
        totalTop5 = 'Type 2C - Extremely biased toward higher total rolls',
        -- strengthBottom10 = 'Type 3A - Very biased toward lower STR rolls',
        -- strengthMiddle10 = 'Type 3B - Very biased toward average STR rolls',
        -- strengthTop10 = 'Type 3C - Very biased toward higher STR rolls',
    },
}
for level = 2, 99 do
    local digits = string.sub('0'..level, -2)
    P.option.level[level] = 'Level '..digits
end
for maxUps = 1, 20 do
    local digits = string.sub('0'..maxUps, -2)
    P.option.lifeMaxUps[maxUps] = 'Life Max-Ups = '..digits
    P.option.heartMaxUps[maxUps] = 'Heart Max-Ups = '..digits
end

P.form = forms.newform(395, 330, "ManageLevelUpsAndStats", nil)
P.ui = {
    -- Name Entry and Prologue
    labelPrologue = forms.label(P.form, 'Prologue', 8, 12 + 0 * 24, 240, 18),
    nameCode = forms.dropdown(P.form, P.getOptions(P.option.nameCode), 8, 8 + 1 * 24, 240, 24),
    startingHearts = forms.dropdown(P.form, P.getOptions(P.option.startingHearts), 8, 8 + 2 * 24, 240, 24),
    defeatDraculaTime = forms.dropdown(P.form, P.getOptions(P.option.defeatDraculaTime), 8, 8 + 3 * 24, 240, 24),
    finalHealth = forms.dropdown(P.form, P.getOptions(P.option.finalHealth), 8, 8 + 4 * 24, 240, 24),
    finalHearts = forms.dropdown(P.form, P.getOptions(P.option.finalHearts), 8, 8 + 5 * 24, 240, 24),
    finalSubweapon = forms.dropdown(P.form, P.getOptions(P.option.finalSubweapon), 8, 8 + 6 * 24, 240, 24),
    -- Level-ups and upgrades
    labelUpgrades = forms.label(P.form, 'Upgrades', 8, 12 + 7 * 24, 240, 18),
    level = forms.dropdown(P.form, P.getOptions(P.option.level), 8, 8 + 8 * 24, 150, 24),
    lifeMaxUps = forms.dropdown(P.form, P.getOptions(P.option.lifeMaxUps), 8, 8 + 9 * 24, 150, 24),
    heartMaxUps = forms.dropdown(P.form, P.getOptions(P.option.heartMaxUps), 8, 8 + 10 * 24, 150, 24),
    -- Rolls
    labelRolls = forms.label(P.form, 'Sample selection type', 8, 12 + 11 * 24, 240, 18),
    rolls = forms.dropdown(P.form, P.getOptions(P.option.rolls), 8, 8 + 12 * 24, 280, 24),
    -- Stats
    strength = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 1 * 24, false, true),
    constitution = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 2 * 24, false, true),
    intelligence = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 3 * 24, false, true),
    luck = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 4 * 24, false, true),
    hp = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 5 * 24, false, true),
    mp = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 6 * 24, false, true),
    hearts = forms.textbox(P.form, '0', 50, 24, 'UNSIGNED', 256, 8 + 7 * 24, false, true),
    -- Stat labels
    labelStats = forms.label(P.form, 'Stats', 256, 12 + 0 * 24, 240, 18),
    labelStrength = forms.label(P.form, 'STR', 256 + 52, 12 + 1 * 24, 42, 18),
    labelConstitution = forms.label(P.form, 'CON', 256 + 52, 12 + 2 * 24, 42, 18),
    labelIntelligence = forms.label(P.form, 'INT', 256 + 52, 12 + 3 * 24, 42, 18),
    labelLuck = forms.label(P.form, 'LCK', 256 + 52, 12 + 4 * 24, 42, 18),
    labelHp = forms.label(P.form, 'HP', 256 + 52, 12 + 5 * 24, 42, 18),
    labelMp = forms.label(P.form, 'MP', 256 + 52, 12 + 6 * 24, 42, 18),
    labelHearts = forms.label(P.form, 'Hearts', 256 + 52, 12 + 7 * 24, 42, 18),
    -- Buttons
    buttonRollStats = forms.button(P.form, 'Roll stats', P.rollStats, 256, 12 + 8 * 24, 120, 24),
    buttonApplyStats = forms.button(P.form, 'Apply stats', P.applyStats, 256, 12 + 9 * 24, 120, 24),
    buttonRegenerateSamples = forms.button(P.form, 'Regenerate samples', P.regenerateSamples, 256, 12 + 10 * 24, 120, 24),
}

P.selection = {
    -- nameCode = P.option.nameCode[1],
    -- startingHearts = P.option.startingHearts[1],
    -- defeatDraculaTime = P.option.defeatDraculaTime[1],
    -- finalHealth = P.option.finalHealth[1],
    -- finalHearts = P.option.finalHearts[1],
    -- finalSubweapon = P.option.finalSubweapon[1],
    level = P.option.level[1],
    -- lifeMaxUps = P.option.lifeMaxUps[1],
    -- heartMaxUps = P.option.heartMaxUps[1],
    -- rolls= P.option.rolls[1],
}
P.regenerateSamples()
P.rollStats()

P.hpIncreases = {1, 3, 6, 10, 20, 30, 40, 50, 100, 200}
P.xpTargets = {
         0,    100,    250,    450,    700,   1000,   1350,   1750,   2200,   2700,
      3250,   3850,   4500,   5200,   5950,   6750,   7600,   8500,   9450,  10450,
     11700,  13200,  15100,  17500,  20400,  23700,  27200,  30900,  35000,  39500,
     44500,  50000,  56000,  61500,  68500,  76000,  84000,  92500, 101500, 110000,
    120000, 130000, 140000, 150000, 160000, 170000, 180000, 190000, 200000, 210000,
    222000, 234000, 246000, 258000, 270000, 282000, 294000, 306000, 318000, 330000,
    344000, 358000, 372000, 386000, 400000, 414000, 428000, 442000, 456000, 470000,
    486000, 502000, 518000, 534000, 550000, 566000, 582000, 598000, 614000, 630000,
    648000, 666000, 684000, 702000, 720000, 738000, 756000, 774000, 792000, 810000,
    830000, 850000, 870000, 890000, 910000, 930000, 950000, 970000, 999999,
}

P.update()
while true do
    emu.yield()
    P.draw()
end
