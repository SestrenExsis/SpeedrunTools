
require "SotnAutopilot"

while true do
    SotnAutopilot.check_for_macro_input()
    emu.frameadvance()
end
