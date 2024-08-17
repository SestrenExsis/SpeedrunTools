
local P = {}
UniversalLibraryCard = P

-- 0x0973F0 for x position
-- 0x0973F4 for y position
P.stages = {
    ['Castle Entrance'] = {
        -- stage_id = 0x07,  -- Subsequent Visit -- save rooms have different room IDs
        stage_id = 0x41,  -- First Visit
        tilemap = 0x917F,
        palette = 0x9235,
        rooms = {
            ['After Drawbridge'] = {
                room_id = 0x00,
                positions = {
                    ['Default'] = {
                        x = 152,
                        y = 647,
                    },
                }
            },
            ['Drop Under Portcullis'] = {
                room_id = 0x01,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 391,
                    },
                }
            },
            ['Zombie Hallway'] = {
                room_id = 0x02,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Holy Mail Room'] = {
                room_id = 0x03,
                positions = {
                    ['Default'] = {
                        x = 224,
                        y = 135,
                    },
                },
            },
            ['Attic Staircase'] = {
                room_id = 0x04,
                positions = {
                    ['Default'] = {
                        x = 228,
                        y = 391,
                    },
                },
            },
            ['Attic Hallway'] = {
                room_id = 0x05,
                positions = {
                    ['Default'] = {
                        x = 1000,
                        y = 135,
                    },
                },
            },
            ['Attic Entrance'] = {
                room_id = 0x06,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Merman Room'] = {
                room_id = 0x07,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Jewel Sword Room'] = {
                room_id = 0x08,
                positions = {
                    ['Default'] = {
                        x = 225,
                        y = 135,
                    },
                },
            },
            ['Warg Hallway'] = {
                room_id = 0x09,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Shortcut to Underground Caverns'] = {
                room_id = 0x0A,
                positions = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 210,
                        y = 135,
                    },
                },
            },
            ['Meeting Room with Death'] = {
                room_id = 0x0B,
                positions = {
                    ['Default'] = {
                        x = 34,
                        y = 391,
                    },
                },
            },
            ['Stairwell after Death'] = {
                room_id = 0x0C,
                positions = {
                    ['Default'] = {
                        x = 28,
                        y = 647,
                    },
                },
            },
            ['Gargoyle Room'] = {
                room_id = 0x0D,
                positions = {
                    ['Default'] = {
                        x = 220,
                        y = 135,
                    },
                },
            },
            ['Heart Max Up Room'] = {
                room_id = 0x0E,
                positions = {
                    ['Default'] = {
                        x = 234,
                        y = 135,
                    },
                },
            },
            ['Cube of Zoe Room'] = {
                room_id = 0x0F,
                positions = {
                    ['Entryway'] = {
                        x = 478,
                        y = 647,
                    },
                    ['Next to Pressure Plate'] = {
                        x = 472,
                        y = 135,
                    },
                },
            },
            ['Shortcut to Warp'] = {
                room_id = 0x10,
                positions = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 216,
                        y = 135,
                    },
                },
            },
            ['Life Max Up Room'] = {
                room_id = 0x11,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Alchemy Laboratory'] = {
        stage_id = 0x0C,
        tilemap = 0x92DD,
        palette = 0x937D,
        rooms = {
            ['Bat Card Room'] = {
                room_id = 0x00,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Exit to Royal Chapel'] = {
                room_id = 0x01,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Blue Door Hallway'] = {
                room_id = 0x02,
                positions = {
                    ['Left Side'] = {
                        x = 78,
                        y = 151,
                    },
                    ['Right Side'] = {
                        x = 471,
                        y = 135,
                    },
                },
            },
            ['Bloody Zombie Hallway'] = {
                room_id = 0x03,
                positions = {
                    ['Default'] = {
                        x = 20,
                        y = 135,
                    },
                },
            },
            ['Cannon Room'] = {
                room_id = 0x04,
                positions = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 210,
                        y = 135,
                    },
                },
            },
            ['Cloth Cape Room'] = {
                room_id = 0x05,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['Sunglasses Room'] = {
                room_id = 0x06,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['Glass Vat Room'] = {
                room_id = 0x07,
                positions = {
                    ['Default'] = {
                        x = 60,
                        y = 183,
                    },
                },
            },
            ['Skill of Wolf Room'] = {
                room_id = 0x08,
                positions = {
                    ['Default'] = {
                        x = 25,
                        y = 135,
                    },
                },
            },
            ['Heart Max Up Room'] = {
                room_id = 0x09,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['Entryway'] = {
                room_id = 0x0A,
                positions = {
                    ['Default'] = {
                        x = 720,
                        y = 135,
                    },
                },
            },
            ['Tall Spittlebone Room'] = {
                room_id = 0x0B,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 903,
                    },
                },
            },
            ['Empty Zig Zag Room'] = {
                room_id = 0x0C,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 391,
                    },
                },
            },
            ['Short Zig Zag Room'] = {
                room_id = 0x0D,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 391,
                    },
                },
            },
            ['Tall Zig Zag Room'] = {
                room_id = 0x0E,
                positions = {
                    ['Default'] = {
                        x = 230,
                        y = 647,
                    },
                },
            },
            ['Secret Life Max Up Room'] = {
                room_id = 0x0F,
                positions = {
                    ['Default'] = {
                        x = 127,
                        y = 71,
                    },
                },
            },
            ['Slogra and Gaibon Room'] = {
                room_id = 0x10,
                positions = {
                    ['Left Side'] = {
                        x = 60,
                        y = 135,
                    },
                    ['Alcove'] = {
                        x = 980,
                        y = 135,
                    },
                },
            },
            ['Box Puzzle Room'] = {
                room_id = 0x11,
                positions = {
                    ['Default'] = {
                        x = 480,
                        y = 391,
                    },
                },
            },
            ['Red Skeleton Room'] = {
                room_id = 0x12,
                positions = {
                    ['Default'] = {
                        x = 590,
                        y = 455,
                    },
                },
            },
            ['Room After Slogra and Gaibon'] = {
                room_id = 0x13,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['Exit to Marble Gallery'] = {
                room_id = 0x14,
                positions = {
                    ['Default'] = {
                        x = 20,
                        y = 391,
                    },
                },
            },
            ['Passage to Elevator'] = {
                room_id = 0x15,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Elevator Shaft'] = {
                room_id = 0x16,
                positions = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        }
    }
}

P.get_stage_options = function()
    local result = {}
    for key in pairs(P.stages) do
        table.insert(result, key)
    end
    return result
end

P.get_room_options = function()
    local stage = forms.gettext(P.stage_input)
    local result = {}
    for key in pairs(P.stages[stage].rooms) do
        table.insert(result, key)
    end
    return result
end

P.get_position_options = function()
    local stage = forms.gettext(P.stage_input)
    local room = forms.gettext(P.room_input)
    local result = {}
    for key in pairs(P.stages[stage].rooms[room].positions) do
        table.insert(result, key)
    end
    return result
end

P.update = function()
    -- Check stage options
    local stage = forms.gettext(P.stage_input)
    if stage ~= P.selected_stage then
        forms.setdropdownitems(P.room_input, P.get_room_options(), true)
        forms.setdropdownitems(P.position_input, P.get_position_options(), true)
        memory.write_u8(
            0x0F1724,
            P.stages[stage].stage_id
        )
        memory.write_u8(
            0x0A25EA,
            P.stages[stage].stage_id
        )
        memory.write_u16_le(
            0x0A3C98,
            P.stages[stage].tilemap
        )
        memory.write_u16_le(
            0x0A3C9C,
            P.stages[stage].palette
        )
    end
    -- Check room options
    local room = forms.gettext(P.room_input)
    if (
        stage ~= P.selected_stage or
        room ~= P.selected_room
    ) then
        forms.setdropdownitems(P.position_input, P.get_position_options(), true)
        memory.write_u16_le(
            0x0A25E6,
            8 * P.stages[stage].rooms[room].room_id
        )
    end
    -- Check position options
    local position = forms.gettext(P.position_input)
    if (
        stage ~= P.selected_stage or
        room ~= P.selected_room or
        position ~= P.selected_position
    ) then
        memory.write_u16_le(
            0x0A25E2,
            P.stages[stage].rooms[room].positions[position].x
        )
        memory.write_u16_le(
            0x0A25E4,
            P.stages[stage].rooms[room].positions[position].y
        )
    end
    P.selected_stage = stage
    P.selected_room = room
    P.selected_position = position
end

P.draw = function()
    -- 
end

-- TODO(sestren): event.oninputpoll

event.unregisterbyname("UniversalLibraryCard__update")
event.onframeend(P.update, "UniversalLibraryCard__update")

P.form = forms.newform(340, 90, "UniversalLibraryCard", nil)
P.stage_input = forms.dropdown(P.form, P.get_stage_options(), 8, 8, 240, 180)
P.room_input = forms.dropdown(P.form, P.get_room_options(), 8, 32, 240, 180)
P.position_input = forms.dropdown(P.form, P.get_position_options(), 8, 56, 240, 180)
P.selected_stage = 'Alchemy Laboratory'
P.selected_room = 'Entrance'
P.selected_position = 'Default'

P.update()
while true do
    emu.yield()
    P.draw()
end