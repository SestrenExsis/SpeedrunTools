
ADDRESSES = {
    alucard = {
        facing = 0x137FC0
    }
}

function set_inputs(dpad, actions)
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

function next_frame_with_input(dpad, actions)
    set_inputs(dpad, actions)
    emu.frameadvance()
end

function action(dpad, actions, frames)
    for i=1,frames do
        next_frame_with_input(dpad, actions)
    end
end

function shield_dash()
    action("", "Shield", 2)
    action("", "Dash Shield", 3)
    action("", "Dash", 2)
    action("", "", 3)
end

function wing_smash_left()
    action("", "Jump", 2)
    action("L", "Jump", 2)
    action("LU", "Jump", 2)
    action("U", "Jump", 2)
    action("UR", "Jump", 2)
    action("R", "Jump", 2)
    action("RD", "Jump", 2)
    action("D", "Jump", 2)
    action("DL", "Jump", 2)
    action("L", "Jump", 2)
end

function wing_smash_right()
    action("", "Jump", 2)
    action("R", "Jump", 2)
    action("RU", "Jump", 2)
    action("U", "Jump", 2)
    action("UL", "Jump", 2)
    action("L", "Jump", 2)
    action("LD", "Jump", 2)
    action("D", "Jump", 2)
    action("DR", "Jump", 2)
    action("R", "Jump", 2)
end

function wing_smash()
    local facing = mainmemory.read_u32_le(ADDRESSES.alucard.facing)
    if facing == 1 then
        wing_smash_left()
    else
        wing_smash_right()
    end
end

function check_for_macro_input()
    local inputs = input.get()
    if inputs["Keypad1"] then
        shield_dash()
    elseif inputs["Keypad2"] then
        wing_smash()
    end
end

while true do
    check_for_macro_input()
    emu.frameadvance()
end
