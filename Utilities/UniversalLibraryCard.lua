
local P = {}
UniversalLibraryCard = P

-- 0x0973F0 for x position
-- 0x0973F4 for y position
P.stages = {
    ['Marble Gallery'] = {
        stage_id = 0x00,
        tilemap = 0x7E5D,
        palette = 0x7F16,
        options = {
            ['(00) S-Shaped Hallways'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(01) Tall Stained Glass Windows'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(02) Spirit Orb Room'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 164,
                        y = 183,
                    },
                },
            },
            ['(03) Stained Glass Corner'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Beneath Dropoff'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 162,
                        y = 103,
                    },
                },
            },
            ['(05) Dropoff'] = {
                room_id = 0x05,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 703,
                        y = 135,
                    },
                },
            },
            ['(06) Entrance'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(07) Stopwatch Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(08) Long Hallway'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(09) Clock Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(0A) Left of Clock Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(0B) Empty Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0C) Blue Door Room'] = {
                room_id = 0x0C,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 316,
                        y = 167,
                    },
                },
            },
            ['(0D) Pathway after Left Statue'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0E) Pathway after Right Statue'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0F) Ouija Table Stairway'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(10) Three Paths'] = {
                room_id = 0x10,
                options = {
                    ['Left Path'] = {
                        x = 73,
                        y = 445,
                    },
                    ['Middle Path'] = {
                        x = 102,
                        y = 301,
                    },
                    ['Right Path'] = {
                        x = 182,
                        y = 445,
                    },
                },
            },
            ['(11) Stairwell to Underground Caverns'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 135,
                    },
                },
            },
            ['(12) Slinger Staircase'] = {
                room_id = 0x12,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(13) Right of Clock Room'] = {
                room_id = 0x13,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(14) Gravity Boots Room'] = {
                room_id = 0x14,
                options = {
                    ['Default'] = {
                        x = 600,
                        y = 183,
                    },
                },
            },
            ['(15) Elevator Room'] = {
                room_id = 0x15,
                options = {
                    ['Default'] = {
                        x = 129,
                        y = 151,
                    },
                },
            },
            ['(16) Powerup Room'] = {
                room_id = 0x16,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(17) Beneath Left Trapdoor'] = {
                room_id = 0x17,
                options = {
                    ['Default'] = {
                        x = 78,
                        y = 119,
                    },
                },
            },
            ['(18) Beneath Right Trapdoor'] = {
                room_id = 0x18,
                options = {
                    ['Default'] = {
                        x = 140,
                        y = 119,
                    },
                },
            },
            ['(19) Alucart Room'] = {
                room_id = 0x19,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Outer Wall'] = {
        stage_id = 0x01,
        tilemap = 0x7FD6,
        palette = 0x808E,
        options = {
            ['(00) Loading Room to Warp Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 135,
                    },
                },
            },
            ['(01) Top'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 160,
                        y = 135,
                    },
                },
            },
            ['(02) Exit to Clock Tower'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 140,
                        y = 135,
                    },
                },
            },
            ['(03) Telescope Room'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 535,
                        y = 151,
                    },
                },
            },
            ['(04) Lower Medusa Room'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 278,
                        y = 695,
                    },
                },
            },
            ['(05) Jewel Knuckles Room'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 225,
                        y = 135,
                    },
                },
            },
            ['(06) Secret Platform Room'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(07) Exit to Marble Gallery'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 147,
                        y = 119,
                    },
                },
            },
            ['(08) Garnet Vase Room'] = {
                room_id = 0x08,
                options = {
                    ['Ground'] = {
                        x = 282,
                        y = 167,
                    },
                    ['Ledge'] = {
                        x = 103,
                        y = 423,
                    },
                },
            },
            ['(09) Blue Axe Knight Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 741,
                        y = 135,
                    },
                },
            },
            ['(0A) Garlic Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 127,
                        y = 359,
                    },
                },
            },
            ['(0B) Doppelganger Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0C) Gladius Room'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0D) Elevator Shaft'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 336,
                        y = 743,
                    },
                },
            },
            ['(0E) Save Room at Top'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 178,
                        y = 167,
                    },
                },
            },
            ['(0F) Loading Room to Clock Tower'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(11) Save Room Near Doppelganger'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(12) Loading Room to Marble Gallery'] = {
                room_id = 0x12,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Long Library'] = {
        stage_id = 0x02,
        tilemap = 0x7C0E,
        palette = 0x7CBF,
        options = {
            ['(00) Lesser Demon Section'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 1250,
                        y = 391,
                    },
                },
            },
            ['(01) Spinning Bookcase'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(02) Holy Rod Room'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(03) Dhuron and Flea Armor Room'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Shop'] = {
                room_id = 0x04,
                options = {
                    ['Inside the Shop'] = {
                        x = 208,
                        y = 151,
                    },
                    ['Beneath the Shop'] = {
                        x = 205,
                        y = 407,
                    },
                },
            },
            ['(05) Outside the Shop'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(06) Flea Man Room'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(07) Faerie Card Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 224,
                        y = 135,
                    },
                },
            },
            ['(08) Three-Layer Room'] = {
                room_id = 0x08,
                options = {
                    ['Upper'] = {
                        x = 128,
                        y = 151,
                    },
                    ['Middle'] = {
                        x = 128,
                        y = 407,
                    },
                    ['Lower'] = {
                        x = 128,
                        y = 679,
                    },
                },
            },
            ['(09) Spellbook Section'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0A) Dhuron and Flea Man Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0B) Foot of Staircase'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0C) Exit to Outer Wall'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0D) Loading Room to Outer Wall'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Catacombs'] = {
        stage_id = 0x03,
        tilemap = 0x7849,
        palette = 0x7766,
        options = {
            ['(00) Thornweed Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 183,
                    },
                },
            },
            ['(01) Mormegil Room'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(02) Empty Room'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 151,
                    },
                },
            },
            ['(03) Mountain of Skulls'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Two-Candle Room'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 151,
                    },
                },
            },
            ['(05) $1 Room'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(06) Gremlin Room'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 213,
                        y = 391,
                    },
                },
            },
            ['(07) Save Room Near Granfaloon'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(08) Walk Armor Room'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(09) Icebrand Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(0A) Left Lossoth Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 732,
                        y = 135,
                    },
                },
            },
            ['(0B) Discus Lord Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 473,
                        y = 391,
                    },
                },
            },
            ['(0C) Right Lossoth Room'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 732,
                        y = 135,
                    },
                },
            },
            ['(0D) Bloodstone Room'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(0E) Empty Room II'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(0F) Save Room Near Exit to Abandoned Mine'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(10) Hellfire Beast Room'] = {
                room_id = 0x10,
                options = {
                    ['Default'] = {
                        x = 490,
                        y = 135,
                    },
                },
            },
            ['(11) Exit to Abandoned Mine'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 206,
                        y = 135,
                    },
                },
            },
            ['(12) Bone Ark Room'] = {
                room_id = 0x12,
                options = {
                    ['Default'] = {
                        x = 25,
                        y = 135,
                    },
                },
            },
            ['(13) Life and Heart Max Up Room'] = {
                room_id = 0x13,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 151,
                    },
                },
            },
            ['(14) Coffin Room'] = {
                room_id = 0x14,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(15) Gremlin Room II'] = {
                room_id = 0x15,
                options = {
                    ['Default'] = {
                        x = 45,
                        y = 135,
                    },
                },
            },
            ['(16) Empty Room III'] = {
                room_id = 0x16,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(17) Slime Room'] = {
                room_id = 0x17,
                options = {
                    ['Default'] = {
                        x = 33,
                        y = 391,
                    },
                },
            },
            ['(18) Blind Spike Room'] = {
                room_id = 0x18,
                options = {
                    ['Default'] = {
                        x = 36,
                        y = 135,
                    },
                },
            },
            ['(19) Top Wereskeleton Room'] = {
                room_id = 0x19,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
            ['(1A) Bottom Wereskeleton Room'] = {
                room_id = 0x1A,
                options = {
                    ['Default'] = {
                        x = 32,
                        y = 135,
                    },
                },
            },
            ['(1B) Spike Breaker Room'] = {
                room_id = 0x1A,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 167,
                    },
                },
            },
        },
    },
    ['Olrox\'s Quarters'] = {
        stage_id = 0x04,
        tilemap = 0x813E,
        palette = 0x81F6,
        options = {
            ['(00) Skelerang Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(01) Bottom of Stairwell'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(02) Grand Staircase'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(03) Secret Onyx Room'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Hammer and Blade Room'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(05) Empty Room'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(06) Tall Shaft'] = {
                room_id = 0x06,
                options = {
                    ['Ledge 4'] = {
                        x = 109,
                        y = 391,
                    },
                    ['Ledge 3'] = {
                        x = 109,
                        y = 903,
                    },
                    ['Ledge 2'] = {
                        x = 109,
                        y = 1031,
                    },
                    ['Ledge 1'] = {
                        x = 175,
                        y = 1239,
                    },
                    ['Ground'] = {
                        x = 145,
                        y = 1415,
                    },
                },
            },
            ['(07) Prison'] = {
                room_id = 0x07,
                options = {
                    ['Ground'] = {
                        x = 131,
                        y = 167,
                    },
                    ['Ledge'] = {
                        x = 34,
                        y = 87,
                    },
                },
            },
            ['(08) Open Courtyard'] = {
                room_id = 0x08,
                options = {
                    ['Ledge 1'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Ledge 2'] = {
                        x = 1454,
                        y = 391,
                    },
                    ['Ledge 3'] = {
                        x = 1454,
                        y = 647,
                    },
                    ['Ground'] = {
                        x = 1366,
                        y = 951,
                    },
                },
            },
            ['(09) Empty Cells'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0A) Garnet Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0B) Narrow Hallway to Olrox'] = {
                room_id = 0x0B,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 941,
                        y = 135,
                    },
                },
            },
            ['(0C) Olrox\'s Room'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0D) Unknown'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0E) Sword Card Room'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0F) Catwalk Crypt'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(10) Save Room'] = {
                room_id = 0x10,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Abandoned Mine'] = {
        stage_id = 0x05,
        tilemap = 0x7A34,
        palette = 0x79BF,
        options = {
            ['(00) Wolf\'s Head Column'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 220,
                        y = 648,
                    },
                },
            },
            ['(01) Venus Weed Room?'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(02) Cerberus Room'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(03) Crumbling Stairwells'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Venus Weed Room?'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(05) Column'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(06) Peanuts Room'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 136,
                    },
                },
            },
            ['(07) Four-Way Intersection'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(08) Crumbling Stairwells II'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 34,
                        y = 152,
                    },
                },
            },
            ['(09) Karma Coin Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 223,
                        y = 136,
                    },
                },
            },
            ['(0A) Bend'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(0B) Demon Card Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 467,
                        y = 136,
                    },
                },
            },
        },
    },
    ['Royal Chapel'] = {
        stage_id = 0x06,
        tilemap = 0x7B8C,
        palette = 0x7AB5,
        options = {
            ['(00) Silver Ring Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 441,
                        y = 152,
                    },
                },
            },
            ['(01) Spike Hallway'] = {
                room_id = 0x01,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 136,
                    },
                    ['Middle I'] = {
                        x = 431,
                        y = 136,
                    },
                    ['Middle II'] = {
                        x = 877,
                        y = 136,
                    },
                    ['Right Side'] = {
                        x = 1094,
                        y = 136,
                    },
                },
            },
            ['(02) Walkway Between Towers'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 145,
                        y = 136,
                    },
                },
            },
            ['(03) Walkway Left of Hippogryph'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 145,
                        y = 136,
                    },
                },
            },
            ['(04) Hippogryph Room'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(05) Walkway Right of Hippogryph'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(06) Pushing Statue Shortcut'] = {
                room_id = 0x06,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 136,
                    },
                    ['Right Side'] = {
                        x = 232,
                        y = 136,
                    },
                },
            },
            ['(07) Confessional Booth'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 136,
                    },
                },
            },
            ['(08) Goggles Room'] = {
                room_id = 0x08,
                options = {
                    ['Ground'] = {
                        x = 20,
                        y = 648,
                    },
                    ['Ledge 1'] = {
                        x = 64,
                        y = 536,
                    },
                    ['Ledge 2'] = {
                        x = 64,
                        y = 328,
                    },
                },
            },
            ['(09) Spectral Sword Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 392,
                    },
                },
            },
            ['(0A) Empty Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 168,
                    },
                },
            },
            ['(0B) Chapel Staircase'] = {
                room_id = 0x0B,
                options = {
                    ['Ground'] = {
                        x = 300,
                        y = 1720,
                    },
                    ['Ledge'] = {
                        x = 1925,
                        y = 168,
                    },
                },
            },
            ['(0C) Statue Ledge'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 168,
                    },
                },
            },
            ['(0D) Left Tower'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 400,
                        y = 2440,
                    },
                },
            },
            ['(0E) Middle Tower'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 360,
                        y = 904,
                    },
                },
            },
            ['(11) Right Tower'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 360,
                        y = 904,
                    },
                },
            },
        },
    },
    ['Castle Entrance (Revisited)'] = {
        stage_id = 0x07,
        tilemap = 0x917F,
        palette = 0x9235,
        options = {
            ['(00) After Drawbridge'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 152,
                        y = 647,
                    },
                },
            },
            ['(01) Drop Under Portcullis'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 391,
                    },
                },
            },
            ['(02) Zombie Hallway'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(03) Holy Mail Room'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 224,
                        y = 135,
                    },
                },
            },
            ['(04) Attic Staircase'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 228,
                        y = 391,
                    },
                },
            },
            ['(05) Attic Hallway'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 1000,
                        y = 135,
                    },
                },
            },
            ['(06) Attic Entrance'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(07) Merman Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(08) Jewel Sword Room'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 225,
                        y = 135,
                    },
                },
            },
            ['(09) Warg Hallway'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0A) Shortcut to Underground Caverns'] = {
                room_id = 0x0A,
                options = {
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
            ['(0B) Meeting Room with Death'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 34,
                        y = 391,
                    },
                },
            },
            ['(0C) Stairwell after Death'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 28,
                        y = 647,
                    },
                },
            },
            ['(0D) Gargoyle Room'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 220,
                        y = 135,
                    },
                },
            },
            ['(0E) Heart Max Up Room'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 234,
                        y = 135,
                    },
                },
            },
            ['(0F) Cube of Zoe Room'] = {
                room_id = 0x0F,
                options = {
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
            ['(10) Shortcut to Warp'] = {
                room_id = 0x10,
                options = {
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
            ['(11) Life Max Up Room'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Castle Center'] = {
        stage_id = 0x08,
        tilemap = 0x793E,
        palette = 0x78CA,
        options = {
            ['(00) Elevator Shaft'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 128,
                        y = 119,
                    },
                },
            },
            ['(01) Top of Cube'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 378,
                        y = 103,
                    },
                },
            },
        },
    },
    ['Underground Caverns'] = {
        stage_id = 0x09,
        tilemap = 0x8400,
        palette = 0x84AF,
        options = {
            ['(00) Long Drop'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 97,
                        y = 72,
                    },
                },
            },
            -- ['(FF) XXX'] = {
            --     room_id = 0xFF,
            --     options = {
            --         ['Default'] = {
            --             x = 40,
            --             y = 135,
            --         },
            --     },
            -- },
        },
    },
    ['Colosseum'] = {
        stage_id = 0x0A,
        tilemap = 0x76E5,
        palette = 0x7600,
        options = {
            ['(00) Holy Sword Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 382,
                        y = 184,
                    },
                },
            },
            -- ['(FF) XXX'] = {
            --     room_id = 0xFF,
            --     options = {
            --         ['Default'] = {
            --             x = 40,
            --             y = 135,
            --         },
            --     },
            -- },
        },
    },
    ['Castle Keep'] = {
        stage_id = 0x0B,
        tilemap = 0x9554,
        palette = 0x95DE,
        options = {
            ['(00) XXX'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 326,
                        y = 200,
                    },
                },
            },
        },
            -- ['(FF) XXX'] = {
            --     room_id = 0xFF,
            --     options = {
            --         ['Default'] = {
            --             x = 40,
            --             y = 135,
            --         },
            --     },
            -- },
        -- },
    },
    ['Alchemy Laboratory'] = {
        stage_id = 0x0C,
        tilemap = 0x92DD,
        palette = 0x937D,
        options = {
            ['(00) Bat Card Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(01) Exit to Royal Chapel'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(02) Blue Door Hallway'] = {
                room_id = 0x02,
                options = {
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
            ['(03) Bloody Zombie Hallway'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 135,
                    },
                },
            },
            ['(04) Cannon Room'] = {
                room_id = 0x04,
                options = {
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
            ['(05) Cloth Cape Room'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['(06) Sunglasses Room'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['(07) Glass Vat Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 60,
                        y = 183,
                    },
                },
            },
            ['(08) Skill of Wolf Room'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 25,
                        y = 135,
                    },
                },
            },
            ['(09) Heart Max Up Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 135,
                    },
                },
            },
            ['(0A) Entryway'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 720,
                        y = 135,
                    },
                },
            },
            ['(0B) Tall Spittlebone Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 903,
                    },
                },
            },
            ['(0C) Empty Zig Zag Room'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 391,
                    },
                },
            },
            ['(0D) Short Zig Zag Room'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 391,
                    },
                },
            },
            ['(0E) Tall Zig Zag Room'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 647,
                    },
                },
            },
            ['(0F) Secret Life Max Up Room'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 127,
                        y = 71,
                    },
                },
            },
            ['(10) Slogra and Gaibon Room'] = {
                room_id = 0x10,
                options = {
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
            ['(11) Box Puzzle Room'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 480,
                        y = 391,
                    },
                },
            },
            ['(12) Red Skeleton Room'] = {
                room_id = 0x12,
                options = {
                    ['Default'] = {
                        x = 590,
                        y = 455,
                    },
                },
            },
            ['(13) Room After Slogra and Gaibon'] = {
                room_id = 0x13,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(14) Exit to Marble Gallery'] = {
                room_id = 0x14,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 391,
                    },
                },
            },
            ['(15) Passage to Elevator'] = {
                room_id = 0x15,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(16) Elevator Shaft'] = {
                room_id = 0x16,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        }
    },
    ['Clock Tower'] = {
        stage_id = 0x0D,
        tilemap = 0x9415,
        palette = 0x94CE,
        options = {
            ['(00) Karasuman\'s Room'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 138,
                    },
                },
            },
            ['(FF) XXX'] = {
                room_id = 0xFF,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['Warp Room'] = {
        stage_id = 0x0E,
        tilemap = 0x996C,
        palette = 0x9A25,
        options = {
            ['(00) Lion'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(01) Goat'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
            ['(02) Scorpion'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 210,
                        y = 136,
                    },
                },
            },
            ['(03) Horse'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 210,
                        y = 136,
                    },
                },
            },
            ['(04) Snake'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 136,
                    },
                },
            },
        },
    },
    ['Boss'] = {
        options = {
            ['Succubus (Nightmare)'] = {
                stage_id = 0x12,
                tilemap = 0x9DAA,
                palette = 0x9E62,
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['Cerberus'] = {
                stage_id = 0x16,
                tilemap = 0xB23A,
                palette = 0xB2DA,
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            -- Richter = 0x18,
            -- Hippogryph,
            -- Doppleganger10,
            -- Scylla,
            -- Werewolf_Minotaur,
            -- Legion,
            -- Olrox,
            -- Galamoth = 0x36,
            -- AkmodanII,
            -- Dracula,
            -- Doppleganger40,
            -- Creature,
            -- Medusa,
            -- Death,
            -- Beezlebub,
            -- Trio,
        },
    },
    -- FinalStageBloodlines = 0x1F,
    ['Black Marble Gallery'] = {
        stage_id = 0x20,
        tilemap = 0x89C4,
        palette = 0x8A7B,
        options = {
            ['(00) S-Shaped Hallways'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(01) Tall Stained Glass Windows'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(02) Spirit Orb Room'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 164,
                        y = 183,
                    },
                },
            },
            ['(03) Stained Glass Corner'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(04) Beneath Dropoff'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 162,
                        y = 103,
                    },
                },
            },
            ['(05) Dropoff'] = {
                room_id = 0x05,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 703,
                        y = 135,
                    },
                },
            },
            ['(06) Entrance'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(07) Stopwatch Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(08) Long Hallway'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(09) Clock Room'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(0A) Left of Clock Room'] = {
                room_id = 0x0A,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(0B) Empty Room'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0C) Blue Door Room'] = {
                room_id = 0x0C,
                options = {
                    ['Left Side'] = {
                        x = 40,
                        y = 135,
                    },
                    ['Right Side'] = {
                        x = 316,
                        y = 167,
                    },
                },
            },
            ['(0D) Pathway after Left Statue'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0E) Pathway after Right Statue'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0F) Ouija Table Stairway'] = {
                room_id = 0x0F,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 647,
                    },
                },
            },
            ['(10) Three Paths'] = {
                room_id = 0x10,
                options = {
                    ['Left Path'] = {
                        x = 73,
                        y = 445,
                    },
                    ['Middle Path'] = {
                        x = 102,
                        y = 301,
                    },
                    ['Right Path'] = {
                        x = 182,
                        y = 445,
                    },
                },
            },
            ['(11) Stairwell to Underground Caverns'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 20,
                        y = 135,
                    },
                },
            },
            ['(12) Slinger Staircase'] = {
                room_id = 0x12,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(13) Right of Clock Room'] = {
                room_id = 0x13,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 151,
                    },
                },
            },
            ['(14) Gravity Boots Room'] = {
                room_id = 0x14,
                options = {
                    ['Default'] = {
                        x = 600,
                        y = 183,
                    },
                },
            },
            ['(15) Elevator Room'] = {
                room_id = 0x15,
                options = {
                    ['Default'] = {
                        x = 129,
                        y = 151,
                    },
                },
            },
            ['(16) Powerup Room'] = {
                room_id = 0x16,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(17) Beneath Left Trapdoor'] = {
                room_id = 0x17,
                options = {
                    ['Default'] = {
                        x = 78,
                        y = 119,
                    },
                },
            },
            ['(18) Beneath Right Trapdoor'] = {
                room_id = 0x18,
                options = {
                    ['Default'] = {
                        x = 140,
                        y = 119,
                    },
                },
            },
            ['(19) Alucart Room'] = {
                room_id = 0x19,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    -- ReverseOuterWall,
    -- ForbiddenLibrary,
    -- FloatingCatacombs,
    -- DeathWingsLair,
    -- Cave,
    -- AntiChapel,
    -- ReverseEntrance,
    -- ReverseCastleCenter,
    -- ReverseCaverns,
    -- ReverseColosseum,
    -- ReverseKeep,
    -- NecromancyLaboratory,
    -- ReverseClockTower,
    -- ReverseWarpRooms,
    ['Castle Entrance (First Visit)'] = {
        -- NOTE(sestren): Save rooms have been left out intentionally
        -- NOTE(sestren): Castle Entrance assigns different IDs to save rooms based on if it's first visit or not
        stage_id = 0x41,
        tilemap = 0x917F,
        palette = 0x9235,
        options = {
            ['(00) After Drawbridge'] = {
                room_id = 0x00,
                options = {
                    ['Default'] = {
                        x = 152,
                        y = 647,
                    },
                },
            },
            ['(01) Drop Under Portcullis'] = {
                room_id = 0x01,
                options = {
                    ['Default'] = {
                        x = 230,
                        y = 391,
                    },
                },
            },
            ['(02) Zombie Hallway'] = {
                room_id = 0x02,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(03) Holy Mail Room'] = {
                room_id = 0x03,
                options = {
                    ['Default'] = {
                        x = 224,
                        y = 135,
                    },
                },
            },
            ['(04) Attic Staircase'] = {
                room_id = 0x04,
                options = {
                    ['Default'] = {
                        x = 228,
                        y = 391,
                    },
                },
            },
            ['(05) Attic Hallway'] = {
                room_id = 0x05,
                options = {
                    ['Default'] = {
                        x = 1000,
                        y = 135,
                    },
                },
            },
            ['(06) Attic Entrance'] = {
                room_id = 0x06,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(07) Merman Room'] = {
                room_id = 0x07,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(08) Jewel Sword Room'] = {
                room_id = 0x08,
                options = {
                    ['Default'] = {
                        x = 225,
                        y = 135,
                    },
                },
            },
            ['(09) Warg Hallway'] = {
                room_id = 0x09,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
            ['(0A) Shortcut to Underground Caverns'] = {
                room_id = 0x0A,
                options = {
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
            ['(0B) Meeting Room with Death'] = {
                room_id = 0x0B,
                options = {
                    ['Default'] = {
                        x = 34,
                        y = 391,
                    },
                },
            },
            ['(0C) Stairwell after Death'] = {
                room_id = 0x0C,
                options = {
                    ['Default'] = {
                        x = 28,
                        y = 647,
                    },
                },
            },
            ['(0D) Gargoyle Room'] = {
                room_id = 0x0D,
                options = {
                    ['Default'] = {
                        x = 220,
                        y = 135,
                    },
                },
            },
            ['(0E) Heart Max Up Room'] = {
                room_id = 0x0E,
                options = {
                    ['Default'] = {
                        x = 234,
                        y = 135,
                    },
                },
            },
            ['(0F) Cube of Zoe Room'] = {
                room_id = 0x0F,
                options = {
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
            ['(10) Shortcut to Warp'] = {
                room_id = 0x10,
                options = {
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
            ['(11) Life Max Up Room'] = {
                room_id = 0x11,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
    ['XXX'] = {
        stage_id = 0xFF,
        tilemap = 0xFFFF,
        palette = 0xFFFF,
        options = {
            ['(FF) XXX'] = {
                room_id = 0xFF,
                options = {
                    ['Default'] = {
                        x = 40,
                        y = 135,
                    },
                },
            },
        },
    },
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
    for key in pairs(P.stages[stage].options) do
        table.insert(result, key)
    end
    return result
end

P.get_position_options = function()
    local stage = forms.gettext(P.stage_input)
    local room = forms.gettext(P.room_input)
    local result = {}
    for key in pairs(P.stages[stage].options[room].options) do
        table.insert(result, key)
    end
    return result
end

P.update = function()
    -- Check stage options
    local stage = forms.gettext(P.stage_input)
    if (
        stage ~= P.selected_stage
    ) then
        forms.setdropdownitems(P.room_input, P.get_room_options(), true)
        forms.setdropdownitems(P.position_input, P.get_position_options(), true)
    end
    -- Check room options
    local room = forms.gettext(P.room_input)
    if (
        stage ~= P.selected_stage or
        room ~= P.selected_room
    ) then
        forms.setdropdownitems(P.position_input, P.get_position_options(), true)
    end
    -- Check position options
    local position = forms.gettext(P.position_input)
    if (
        stage ~= P.selected_stage or
        room ~= P.selected_room or
        position ~= P.selected_position
    ) then
    end
    -- Update local variables
    local stage_id = (
        P.stages[stage].stage_id or
        P.stages[stage].options[room].stage_id or
        P.stages[stage].options[room].options[position].stage_id or
        0x00
    )
    local tilemap = (
        P.stages[stage].tilemap or
        P.stages[stage].options[room].tilemap or
        P.stages[stage].options[room].options[position].tilemap or
        0x7E5D
    )
    local palette = (
        P.stages[stage].palette or
        P.stages[stage].options[room].palette or
        P.stages[stage].options[room].options[position].palette or
        0x7F16
    )
    local room_id = (
        P.stages[stage].room_id or
        P.stages[stage].options[room].room_id or
        P.stages[stage].options[room].options[position].room_id or
        0x00
    )
    local x = (
        P.stages[stage].x or
        P.stages[stage].options[room].x or
        P.stages[stage].options[room].options[position].x or
        40
    )
    local y = (
        P.stages[stage].y or
        P.stages[stage].options[room].y or
        P.stages[stage].options[room].options[position].y or
        136
    )
    -- Update memory
    memory.write_u8(0x0F1724, stage_id)
    memory.write_u8(0x0A25EA, stage_id)
    memory.write_u16_le(0x0A3C98, tilemap)
    memory.write_u16_le(0x0A3C9C, palette)
    memory.write_u16_le(0x0A25E6, 8 * room_id)
    memory.write_u16_le(0x0A25E2, x)
    memory.write_u16_le(0x0A25E4, y)
    -- Remember selection
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

P.form = forms.newform(340, 110, "UniversalLibraryCard", nil)
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