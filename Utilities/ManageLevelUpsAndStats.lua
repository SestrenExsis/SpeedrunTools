
local P = {}
ManageLevelUpsAndStats = P

P.hpIncreases = {1, 3, 6, 10, 20, 30, 40, 50, 100, 200}

P.getStats = function()
    -- Get selected inputs
    local nameCode = forms.gettext(P.input.nameCode)
    local startingHearts = forms.gettext(P.input.startingHearts)
    local defeatDraculaTime = forms.gettext(P.input.defeatDraculaTime)
    local finalHealth = forms.gettext(P.input.finalHealth)
    local finalSubweapon = forms.gettext(P.input.finalSubweapon)
    local lifeMaxUps = forms.gettext(P.input.lifeMaxUps)
    local heartMaxUps = forms.gettext(P.input.heartMaxUps)
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
    local level = forms.gettext(P.input.level)
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
        fortune = fortune + statCount + mpIncrease
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

P.update = function()
    local nameCode = forms.gettext(P.input.nameCode)
    local startingHearts = forms.gettext(P.input.startingHearts)
    local defeatDraculaTime = forms.gettext(P.input.defeatDraculaTime)
    local finalHealth = forms.gettext(P.input.finalHealth)
    local finalHearts = forms.gettext(P.input.finalHearts)
    local finalSubweapon = forms.gettext(P.input.finalSubweapon)
    local level = forms.gettext(P.input.level)
    local lifeMaxUps = forms.gettext(P.input.lifeMaxUps)
    local heartMaxUps = forms.gettext(P.input.heartMaxUps)
    if (
        nameCode ~= P.selection.nameCode or
        startingHearts ~= P.selection.startingHearts or
        defeatDraculaTime ~= P.selection.defeatDraculaTime or
        finalHealth ~= P.selection.finalHealth or
        finalHearts ~= P.selection.finalHearts or
        finalSubweapon ~= P.selection.finalSubweapon or
        level ~= P.selection.level or
        lifeMaxUps ~= P.selection.lifeMaxUps or
        heartMaxUps ~= P.selection.heartMaxUps
    ) then
        local stats = P.getStats()
        local upgrades = P.getUpgrades()
        for i = 0, 999 do
            P.getUpgrades()
        end
        -- Update displays
        local labelText = ''
        labelText = labelText..'   STR = '..string.sub('  '..stats.strength, -3)..' + '..string.sub('  '..upgrades.strength, -3)..'\n'
        labelText = labelText..'   CON = '..string.sub('  '..stats.constitution, -3)..' + '..string.sub('  '..upgrades.constitution, -3)..'\n'
        labelText = labelText..'   INT = '..string.sub('  '..stats.intelligence, -3)..' + '..string.sub('  '..upgrades.intelligence, -3)..'\n'
        labelText = labelText..'   LCK = '..string.sub('  '..stats.luck, -3)..' + '..string.sub('  '..upgrades.luck, -3)..'\n'
        labelText = labelText..'    HP = '..string.sub('  '..stats.hp, -3)..' + '..string.sub('  '..upgrades.hp, -3)..'\n'
        labelText = labelText..'    MP = '..string.sub('  '..stats.mp, -3)..' + '..string.sub('  '..upgrades.mp, -3)..'\n'
        labelText = labelText..'Hearts = '..string.sub('  '..stats.hearts, -3)..' + '..string.sub('  '..upgrades.hearts, -3)..'\n'
        forms.settext(P.statsLabel, labelText)
        local levelUps = tonumber(string.sub(level, -2))
    end
    -- Update local variables
    P.selection.nameCode = nameCode
    P.selection.startingHearts = startingHearts
    P.selection.defeatDraculaTime = defeatDraculaTime
    P.selection.finalHealth = finalHealth
    P.selection.finalHearts = finalHearts
    P.selection.finalSubweapon = finalSubweapon
    P.selection.level = level
    P.selection.lifeMaxUps = lifeMaxUps
    P.selection.heartMaxUps = heartMaxUps
end

P.draw = function()
    -- 
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
    level = {},
    lifeMaxUps = {},
    heartMaxUps = {},
}
for level = 1, 99 do
    local digits = string.sub('0'..level, -2)
    P.option.level[level] = 'Level '..digits
end
for maxUps = 0, 20 do
    local digits = string.sub('0'..maxUps, -2)
    P.option.lifeMaxUps[maxUps] = 'Life Max-Ups = '..digits
    P.option.heartMaxUps[maxUps] = 'Heart Max-Ups = '..digits
end

P.form = forms.newform(395, 255, "ManageLevelUpsAndStats", nil)
P.input = {
    -- Name Entry and Prologue
    nameCode = forms.dropdown(P.form, P.getOptions(P.option.nameCode), 8, 8, 240, 24),
    startingHearts = forms.dropdown(P.form, P.getOptions(P.option.startingHearts), 8, 8 + 1 * 24, 240, 24),
    defeatDraculaTime = forms.dropdown(P.form, P.getOptions(P.option.defeatDraculaTime), 8, 8 + 2 * 24, 240, 24),
    finalHealth = forms.dropdown(P.form, P.getOptions(P.option.finalHealth), 8, 8 + 3 * 24, 240, 24),
    finalHearts = forms.dropdown(P.form, P.getOptions(P.option.finalHearts), 8, 8 + 4 * 24, 240, 24),
    finalSubweapon = forms.dropdown(P.form, P.getOptions(P.option.finalSubweapon), 8, 8 + 5 * 24, 240, 24),
    -- Level-ups and upgrades
    level = forms.dropdown(P.form, P.getOptions(P.option.level), 8, 8 + 7 * 24, 240, 24),
    lifeMaxUps = forms.dropdown(P.form, P.getOptions(P.option.lifeMaxUps), 8, 8 + 8 * 24, 240, 24),
    heartMaxUps = forms.dropdown(P.form, P.getOptions(P.option.heartMaxUps), 8, 8 + 9 * 24, 240, 24),
}
P.selection = {
    nameCode = P.option.nameCode[1],
    startingHearts = P.option.startingHearts[1],
    defeatDraculaTime = P.option.defeatDraculaTime[1],
    finalHealth = P.option.finalHealth[1],
    finalHearts = P.option.finalHearts[1],
    finalSubweapon = P.option.finalSubweapon[1],
    level = P.option.level[1],
    lifeMaxUps = P.option.lifeMaxUps[1],
    heartMaxUps = P.option.heartMaxUps[1],
}
local labelText = ''
labelText = labelText..'STR    = ?\n'
labelText = labelText..'CON    = ?\n'
labelText = labelText..'INT    = ?\n'
labelText = labelText..'LCK    = ?\n'
labelText = labelText..'HP     = ?\n'
labelText = labelText..'MP     = ?\n'
labelText = labelText..'Hearts = ?'
P.statsLabel = forms.label(P.form, labelText, 256, 8, 150, 100, true)

P.update()
while true do
    emu.yield()
    P.draw()
end
