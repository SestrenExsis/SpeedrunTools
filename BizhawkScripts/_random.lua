
require "SotnCore"
require "SotnAutopilot"

while true do
    gui.clearGraphics()
    SotnCore.draw_rng(128, 12)
    emu.frameadvance()
end
