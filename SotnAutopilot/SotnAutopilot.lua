
ADDRESSES = {
    alucard = {
        facing = 0x137FC0
    }
}

dpad_mnemonics = {}
dpad_mnemonics["U"] = "P1 D-Pad Up"
dpad_mnemonics["D"] = "P1 D-Pad Down"
dpad_mnemonics["L"] = "P1 D-Pad Left"
dpad_mnemonics["R"] = "P1 D-Pad Right"

action_mnemonics = {}
action_mnemonics["Attack"] = "P1 □"
action_mnemonics["Dash"] = "P1 △"
action_mnemonics["Shield"] = "P1 ○"
action_mnemonics["Jump"] = "P1 X"
action_mnemonics["Mist"] = "P1 L1"
action_mnemonics["L2"] = "P1 L2"
action_mnemonics["Bat"] = "P1 R1"
action_mnemonics["Wolf"] = "P1 R2"
action_mnemonics["Map"] = "P1 Select"
action_mnemonics["Menu"] = "P1 Start"

function action(dpad, actions, frames)
    if dpad == nil then
        dpad = ""
    end
    if actions == nil then
        actions = ""
    end
    if frames == nil then
        frames = 1
    end
    for i=1,frames do
        local result = {}
        for key, value in pairs(dpad_mnemonics) do
            if bizstring.contains(dpad, key) then
                result[value] = true
            end
        end
        for key, value in pairs(action_mnemonics) do
            if bizstring.contains(actions, key) then
                result[value] = true
            end
        end
        joypad.set(result)
        emu.frameadvance()
    end
    return result
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
