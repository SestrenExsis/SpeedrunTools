
require "SotnCore"

local P = {}
DisplayRNGValues = P

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
        BizMath.rshift(P.evil_seed, 0x10)
    )
    local evil_delta_str = P.evil_delta
    if evil_delta_str > 0 then
        evil_delta_str = "+"..evil_delta_str
    else
        evil_delta_str = " -"
    end
    P.text(10, 1, "Evil RNG", 0xffff0000)
    P.text(19, 1, SotnCore.hex(P.evil_seed, 8))
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
    P.evil_seed = SotnCore.read_evil_seed()
    P.evil_index = SotnCore.evil_seed_index(P.evil_seed)
end

P.onframeend = function()
    P.prev_evil_index = P.evil_index
    P.evil_seed = SotnCore.read_evil_seed()
    P.evil_index = SotnCore.evil_seed_index(P.evil_seed)
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