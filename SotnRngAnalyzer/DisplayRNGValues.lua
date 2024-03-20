require "SotnCore"

local P = {}
DisplayRNGValues = P

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

-- P.set_nice_rng_index = function(__index)
--     local nice_seed = 0x00000000
--     for j = 1, __index do
--         nice_seed = SotnCore.advance_tumbler(SotnCore.Tumblers.NiceSeed, 1, nice_seed)
--     end
--     mainmemory.write_u32_le(P.Addresses.NiceSeed, nice_seed)
-- end

-- P.increment_nice_rng = function()
--     local nice_seed = P.read_u32(P.Addresses.NiceSeed)
--     local nice_index = P.seed_index(nice_seed, P.Tumblers.NiceSeed)
--     if nice_index < 0xffffffff then
--         nice_index = nice_index + 1
--         P.set_nice_rng_index(nice_index)
--     end
-- end

-- P.decrement_nice_rng = function()
--     local nice_seed = P.read_u32(P.Addresses.NiceSeed)
--     local nice_index = P.seed_index(nice_seed, P.Tumblers.NiceSeed)
--     if nice_index > 0 then
--         nice_index = (nice_index - 1) % 0xffffffff
--         P.set_nice_rng_index(nice_index)
--     end
-- end

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
    P.text(5, 1, SotnCore.hex(P.nice_seed, 8))
    P.text(14, 1, SotnCore.hex(nice_rng, 2))
    P.text(19, 1, P.nice_index)
    P.text(28, 1, nice_delta, 0xff9999ff)
    -- Show evil RNG info
    -- NOTE: See spec for rand() in psx-spx for correct value to shift
    local evil_rng = BizMath.band(
        0x7fff,
        BizMath.rshift(P.evil_seed, 0x10)
    )
    local evil_delta = P.evil_index - P.prev_evil_index
    if evil_delta > 0 then
        evil_delta = "+"..evil_delta
    else
        evil_delta = " -"
    end
    P.text(0, 2, "evil", 0xffff0000)
    P.text(5, 2, SotnCore.hex(P.evil_seed, 8))
    P.text(14, 2, SotnCore.hex(evil_rng, 4))
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
    P.nice_seed = SotnCore.read_nice_seed()
    P.evil_seed = SotnCore.read_evil_seed()
    P.nice_index = SotnCore.nice_seed_index(P.nice_seed)
    P.evil_index = SotnCore.evil_seed_index(P.evil_seed)
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