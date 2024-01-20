
require "SotnSaturnCore"

local P = {}
DrillMasamuneDrop = P

P.trial_count = 0
P.trial_message = "TEST"
P.trial_color = 0xffffffff
P.min_offset = -15
P.max_offset = 15
P.trials = {}
for offset = P.min_offset, P.max_offset do
    P.trials[offset] = 0
end

function clear_graphics()
    gui.clearGraphics()
end

function draw_text()
    gui.pixelText(16, 222, P.trial_message, P.trial_color)
    local color = 0xffffff00
    local x = 175
    local y = 218
    for offset=P.min_offset, P.max_offset do
        if P.trials[offset] > 0 then
            if offset < -2 then
                color = 0xffffff00
            elseif offset == -2 then
                color = 0xff00ff00
            elseif offset < 2 then
                color = 0xff00ffff
            elseif offset == 2 then
                color = 0xff00ff00
            else
                color = 0xffff0000
            end
            gui.drawBox(x + 3 * offset, y, x + 3 * offset + 1, y - P.trials[offset], color)
        end
    end
    gui.drawLine(x + 3 * P.min_offset, y, x + 3 * P.max_offset, y, 0xffffffff)
    gui.drawBox(x - 3 * 2, y + 1, x - 3 * 2 + 1, y + 3, 0xffffffff)
    gui.drawBox(x + 3 * 2, y + 1, x + 3 * 2 + 1, y + 3, 0xffffffff)
end

P.trial = function()
    savestate.load("Drill - Masamune Drop.State")
    SotnSaturnCore.action("R", "", 1)
    SotnSaturnCore.action("R", "Jump", 60)
    SotnSaturnCore.action("R", "", 45)
    SotnSaturnCore.action("", "", 30)
    SotnSaturnCore.action("", "Bat", 30)
    -- Timers
    while true do
        emu.frameadvance()
        local current_input = input.get()
        local jump_held = current_input["J1 B1"]
        if jump_held then
            break
        end
    end
    while true do
        emu.frameadvance()
        local current_input = input.get()
        local jump_held = current_input["J1 B1"]
        if not jump_held then
            break
        end
    end
    local evil_seed = SotnSaturnCore.read4(SotnSaturnCore.Addresses.EvilSeed)
    local evil_index = SotnSaturnCore.seed_index(
        SotnSaturnCore.StartingSeeds.EvilSeed,
        evil_seed,
        SotnSaturnCore.Tumblers.EvilSeed
    )
    evil_index = evil_index - 1 -- Wing smash starts 1 frame after letting go of input
    if evil_index < 400 then
        local delta = 400 - evil_index
        P.trial_message = "Too FAST for 1st drop by "..delta.." frames"
        P.trial_color = 0xffffff00
        console.log(P.trial_message)
    elseif evil_index == 400 then
        P.trial_message = "Perfect timing for 1st DROP"
        P.trial_color = 0xff00ff00
        console.log(P.trial_message)
    elseif evil_index < 404 then
        local delta1 = evil_index - 400
        local delta2 = evil_index - 404
        P.trial_message = "BETWEEN drops: ("..delta1..", "..delta2..")"
        P.trial_color = 0xff00ffff
        console.log(P.trial_message)
    elseif evil_index == 404 then
        P.trial_message = "Perfect timing for 2nd DROP"
        P.trial_color = 0xff00ff00
        console.log(P.trial_message)
    else
        local delta = evil_index - 404
        P.trial_message = "Too SLOW for 2nd drop by "..delta.." frames"
        P.trial_color = 0xffff0000
        console.log(P.trial_message)
    end
    local offset = evil_index - 402
    if offset < P.min_offset then
        offset = P.min_offset
    elseif offset > P.max_offset then
        offset = P.max_offset
    end
    P.trials[offset] = P.trials[offset] + 1
    local timeout = 30
    if evil_index == 400 or evil_index == 404 then
        timeout = 240
    end
    SotnSaturnCore.action("", "", timeout)
end

console.log("drill_masamune_drop")

event.unregisterbyname("clear_graphics")
event.onframeend(clear_graphics, "clear_graphics")
event.unregisterbyname("draw_text")
event.onframeend(draw_text, "draw_text")

while true do
    P.trial()
    P.trial_count = P.trial_count + 1
end
