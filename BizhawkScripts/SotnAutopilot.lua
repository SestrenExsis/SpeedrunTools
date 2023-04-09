
require "SotnCore"

local P = {}
SotnAutopilot = P

P.set_inputs = function(dpad, actions)
    if dpad == nil then
        dpad = ""
    end
    local result = {}
    -- input string format: "UDLRsSTXQOlLrR"
    local input_str = ""
    if bizstring.contains(dpad, "U") then
        input_str = input_str.."U"
        result["Up"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(dpad, "D") then
        input_str = input_str.."D"
        result["Down"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(dpad, "L") then
        input_str = input_str.."L"
        result["Left"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(dpad, "R") then
        input_str = input_str.."R"
        result["Right"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Select") then
        input_str = input_str.."s"
        result["Select"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Start") then
        input_str = input_str.."S"
        result["Start"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Dash") then
        input_str = input_str.."T"
        result["Dash"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Jump") then
        input_str = input_str.."X"
        result["Jump"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Attack") then
        input_str = input_str.."Q"
        result["Attack"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Shield") then
        input_str = input_str.."O"
        result["Shield"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Mist") then
        input_str = input_str.."l"
        result["Mist"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "L2") then
        input_str = input_str.."L"
        result["L2"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Bat") then
        input_str = input_str.."r"
        result["Bat"] = true
    else
        input_str = input_str.."."
    end
    if bizstring.contains(actions, "Wolf") then
        input_str = input_str.."R"
        result["Wolf"] = true
    else
        input_str = input_str.."."
    end
    joypad.setfrommnemonicstr("|....|32768,32768,32768,32768,"..input_str.."...|..............|")
    return result
end

P.next_frame_with_input = function(dpad, actions)
    P.set_inputs(dpad, actions)
    emu.frameadvance()
end

P.action = function(dpad, actions, frames)
    for i=1,frames do
        P.next_frame_with_input(dpad, actions)
    end
end


P.shield_dash = function()
    P.action("", "Shield", 2)
    P.action("", "Dash Shield", 3)
    P.action("", "Dash", 2)
    P.action("", "", 3)
end

P.wing_smash_left = function()
    P.action("", "Jump", 2)
    P.action("L", "Jump", 2)
    P.action("LU", "Jump", 2)
    P.action("U", "Jump", 2)
    P.action("UR", "Jump", 2)
    P.action("R", "Jump", 2)
    P.action("RD", "Jump", 2)
    P.action("D", "Jump", 2)
    P.action("DL", "Jump", 2)
    P.action("L", "Jump", 2)
end

P.wing_smash_right = function()
    P.action("", "Jump", 2)
    P.action("R", "Jump", 2)
    P.action("RU", "Jump", 2)
    P.action("U", "Jump", 2)
    P.action("UL", "Jump", 2)
    P.action("L", "Jump", 2)
    P.action("LD", "Jump", 2)
    P.action("D", "Jump", 2)
    P.action("DR", "Jump", 2)
    P.action("R", "Jump", 2)
end

P.wing_smash = function()
    local facing = mainmemory.read_u32_le(SotnConstants.Addresses.Alucard.Facing)
    if facing == 1 then
        P.wing_smash_left()
    else
        P.wing_smash_right()
    end
end

P.check_for_macro_input = function()
    local inputs = input.get()
    if inputs["Keypad1"] then
        P.shield_dash()
    elseif inputs["Keypad2"] then
        P.wing_smash()
    end
end

return SotnAutopilot