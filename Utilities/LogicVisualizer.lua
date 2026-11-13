
local P = {}
LogicVisualizer = P

P.Stage = {
    MARBLE_GALLERY = 0x00,
    OUTER_WALL = 0x01,
    LONG_LIBRARY = 0x02,
    CATACOMBS = 0x03,
    OLROXS_QUARTERS = 0x04,
    ABANDONED_MINE = 0x05,
    ROYAL_CHAPEL = 0x06,
    CASTLE_ENTRANCE_2 = 0x07,
    CASTLE_CENTER = 0x08,
    UNDERGROUND_CAVERNS = 0x09,
    COLOSSEUM = 0x0A,
    CASTLE_KEEP = 0x0B,
    ALCHEMY_LABORATORY = 0x0C,
    CLOCK_TOWER = 0x0D,
    WARP_ROOMS = 0x0E,
    BOSS_SUCCUBUS = 0x12,
    BOSS_CERBERUS = 0x16,
    BOSS_RICHTER = 0x18,
    BOSS_HIPPOGRYPH = 0x19,
    BOSS_DOPPELGANGER10 = 0x1A,
    BOSS_SCYLLA = 0x1B,
    BOSS_MINOTAUR_AND_WEREWOLF = 0x1C,
    BOSS_GRANFALOON = 0x1D,
    BOSS_OLROX = 0x1E,
    PROLOGUE = 0x1F,
    BLACK_MARBLE_GALLERY = 0x20,
    REVERSE_OUTER_WALL = 0x21,
    FORBIDDEN_LIBRARY = 0x22,
    FLOATING_CATACOMBS = 0x23,
    DEATH_WINGS_LAIR = 0x24,
    CAVE = 0x25,
    ANTI_CHAPEL = 0x26,
    REVERSE_ENTRANCE = 0x27,
    REVERSE_CAVERNS = 0x29,
    REVERSE_COLOSSEUM = 0x2A,
    REVERSE_KEEP = 0x2B,
    NECROMANCY_LABORATORY = 0x2C,
    REVERSE_CLOCK_TOWER = 0x2D,
    REVERSE_WARP_ROOMS = 0x2E,
    BOSS_GALAMOTH = 0x36,
    BOSS_AKMODAN_II = 0x37,
    BOSS_SHAFT = 0x38,
    BOSS_DOPPELGANGER40 = 0x39,
    BOSS_CREATURE = 0x3A,
    BOSS_MEDUSA = 0x3B,
    BOSS_DEATH = 0x3C,
    BOSS_BEELZEBUB = 0x3D,
    BOSS_TRIO = 0x3E,
    CASTLE_ENTRANCE = 0x41,
}

-- TODO(sestren): Time room transitions

P.Logic = {
  ['abandonedMine'] = {
    ['bend'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['cerberusRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['demonSwitch'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 240,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "behindDemonBlock",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 208,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "demonBlock",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 207,
              },
              ['positionY'] = {
                minimum = 64,
                maximum = 207,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 208,
                maximum = 543,
              },
            },
          },
          ['outcome'] = {
            section = "zigZagLedges",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 544,
                maximum = 703,
              },
            },
          },
          ['outcome'] = {
            section = "crumblingStairwell",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 704,
                maximum = 847,
              },
            },
          },
          ['outcome'] = {
            section = "tinyLedges",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 96,
                maximum = 159,
              },
              ['positionY'] = {
                minimum = 992,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "holeInFloor",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 848,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "behindDemonBlock",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 1048,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toBehindDemonBlock'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 128,
          },
          requirements = {
            {
              section = "demonBlock",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toDemonBlock'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 128,
            statusDemonSwitchActivated = true,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              progressionSummonDemonFamiliar = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "behindDemonBlock",
              progressionSummonDemonFamiliar = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperLeftLedge",
              statusDemonSwitchActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "behindDemonBlock",
              statusDemonSwitchActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "demonBlock",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toZigZagLedges'] = {
          ['outcome'] = {
            positionX = 216,
            positionY = 256,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toCrumblingStairwell'] = {
          ['outcome'] = {
            positionX = 96,
            positionY = 656,
            statusStairwellInAbandonedMineDislodged = true,
          },
          requirements = {
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "zigZagLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "tinyLedges",
              progressionDoubleJump = true,
              statusStairwellInAbandonedMineDislodged = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toTinyLedges'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 800,
          },
          requirements = {
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "crumblingStairwell",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 192,
            positionY = 944,
          },
          requirements = {
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "tinyLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "holeInFloor",
              ['verticalClimb'] = {
                minimum = 8,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHoleInFloor'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 1008,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
      },
    },
    ['demonCard'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['fourWayIntersection'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 352,
                maximum = 415,
              },
              ['positionY'] = {
                minimum = 224,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "holeInFloor",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = 64,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "holeInFloor",
              ['verticalClimb'] = {
                minimum = 8,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHoleInFloor'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 240,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
      },
    },
    ['karmaCoinRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCatacombs'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lowerStairwell'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 96,
                maximum = 159,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 95,
              },
            },
          },
          ['outcome'] = {
            section = "layer0",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 335,
              },
            },
          },
          ['outcome'] = {
            section = "layer1",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 336,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "layer2",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 512,
                maximum = 735,
              },
            },
          },
          ['outcome'] = {
            section = "layer3",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 736,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 12,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 324,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['toLayer0'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 48,
          },
          requirements = {
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer1'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 144,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer2'] = {
          ['outcome'] = {
            positionX = 48,
            positionY = 384,
          },
          requirements = {
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer3'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 640,
          },
          requirements = {
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 896,
          },
          requirements = {
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
      },
    },
    ['peanutsRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['snakeColumn'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToCatacombs'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['venusWeedRoom'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['wellLitSkullRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['wolfsHeadColumn'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 176,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "layer0",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 160,
                maximum = 463,
              },
            },
          },
          ['outcome'] = {
            section = "layer1",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 127,
              },
              ['positionY'] = {
                minimum = 464,
                maximum = 623,
              },
            },
          },
          ['outcome'] = {
            section = "layer2",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 464,
                maximum = 559,
              },
            },
          },
          ['outcome'] = {
            section = "layer2",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 608,
                maximum = 847,
              },
            },
          },
          ['outcome'] = {
            section = "layer3",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 848,
                maximum = 959,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLayer0'] = {
          ['outcome'] = {
            positionX = 216,
            positionY = 128,
          },
          requirements = {
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer1'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 240,
          },
          requirements = {
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer0",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer2'] = {
          ['outcome'] = {
            positionX = 56,
            positionY = 592,
          },
          requirements = {
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer1",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLayer3'] = {
          ['outcome'] = {
            positionX = 240,
            positionY = 640,
          },
          requirements = {
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer2",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 240,
            positionY = 896,
          },
          requirements = {
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "layer3",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
      },
    },
  },
  ['alchemyLaboratory'] = {
    ['batCardRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['bloodyZombieHallway'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['blueDoorHallway'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 256,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              progressionUnlockBlueDoors = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 488,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              progressionUnlockBlueDoors = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['boxPuzzleRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 240,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 335,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 488,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              techniqueSolveBoxPuzzle = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 488,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['cannonRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 95,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 112,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
            statusCannonActivated = true,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              statusCannonActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['clothCapeRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['corridorToElevator'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['elevatorShaft'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1792,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1791,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftMiddle'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1664,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['emptyZigZagRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['entryway'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['glassVats'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['heartMaxUpRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['redSkeletonLiftRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 640,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 104,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 104,
            positionY = -24,
            verticalClimb = 228,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 640,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 736,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              techniqueSolveRedSkeletonLiftPuzzle = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 488,
            positionY = 384,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomC'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['secretLifeMaxUpRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['shortZigZagRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['skillOfWolfRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['slograAndGaibonRoom'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 800,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "alcove",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "alcove",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toAlcove'] = {
          ['outcome'] = {
            positionX = 1008,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 784,
            positionY = 416,
          },
          requirements = {
            {
              section = "alcove",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['sunglassesRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tallSpittleboneRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1280,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1279,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tallZigZagRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 792,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tetrominoRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 287,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "batCardRoomDuplicate",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "batCardRoomDuplicate",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['castleEntrance'] = {
    ['afterDrawbridge'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 112,
                maximum = 143,
              },
              ['positionY'] = {
                minimum = 688,
                maximum = 751,
              },
            },
          },
          ['outcome'] = {
            section = "beneathTrapdoor",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 96,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 608,
                maximum = 671,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 192,
                maximum = 383,
              },
              ['positionY'] = {
                minimum = 112,
                maximum = 207,
              },
            },
          },
          ['outcome'] = {
            section = "parapet",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 4.999,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 792,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "beneathTrapdoor",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['fromBeneathTrapdoorToMain'] = {
          ['outcome'] = {
            positionX = 160,
            positionY = 640,
          },
          requirements = {
            {
              section = "beneathTrapdoor",
              ['costs'] = {
                time = 0.7,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['toParapet'] = {
          ['outcome'] = {
            positionX = 288,
            positionY = 160,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 7.5,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 10.5,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toBeneathTrapdoor'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 720,
          },
          requirements = {
            {
              section = "main",
              statusTrapdoorAfterDrawbridgeOpened = true,
              ['costs'] = {
                time = 0.5,
              },
            },
          },
        },
        ['fromParapetToMain'] = {
          ['outcome'] = {
            positionX = 304,
            positionY = 640,
          },
          requirements = {
            {
              section = "parapet",
              ['costs'] = {
                time = 1.7,
              },
            },
          },
        },
      },
    },
    ['dropUnderPortcullis'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 112,
                maximum = 143,
              },
              ['positionY'] = {
                minimum = 16,
                maximum = 63,
              },
            },
          },
          ['outcome'] = {
            section = "top",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 208,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -56,
          },
          requirements = {
            {
              section = "upperLedge",
              ['costs'] = {
                time = 0.7,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 240,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLedge'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 32,
          },
          requirements = {
            {
              section = "beneathTrapdoor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
      },
    },
    ['zombieHallway'] = {
      ['roomInfo'] = {
        width = 1792,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1791,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1800,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['holyMailRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 48,
                maximum = 111,
              },
              ['positionY'] = {
                minimum = 48,
                maximum = 95,
              },
            },
          },
          ['outcome'] = {
            section = "ledge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 48,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 207,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLedge'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = 72,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBladeDash = true,
              techniqueBladeDash = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              progressionMistTransformation = true,
              techniquePreciseCornerMist = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 232,
            positionY = 128,
          },
          requirements = {
            {
              section = "ledge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['atticStaircase'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['atticHallway'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['atticEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['mermanRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 96,
                maximum = 159,
              },
              ['positionY'] = {
                minimum = 16,
                maximum = 47,
              },
            },
          },
          ['outcome'] = {
            section = "holeInCeiling",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 15,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "secretPassage",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 48,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -56,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "secretPassage",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['openSecretPassage'] = {
          ['outcome'] = {
            statusSecretWallInMermanRoomOpened = true,
          },
          requirements = {
            {
              section = "main",
              progressionBatTransformation = true,
              progressionWolfTransformation = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['fromMainToSecretPassage'] = {
          ['outcome'] = {
            positionX = 8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              statusSecretWallInMermanRoomOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['fromSecretPassageToMain'] = {
          ['outcome'] = {
            positionX = 64,
            positionY = 384,
          },
          requirements = {
            {
              section = "secretPassage",
              statusSecretWallInMermanRoomOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['fromMainToHoleInCeiling'] = {
          ['outcome'] = {
            positionX = 112,
            positionY = 176,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
        ['fromHoleInCeilingToMain'] = {
          ['outcome'] = {
            positionX = 112,
            positionY = 176,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['jewelSwordRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 64,
                maximum = 223,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['wargHallway'] = {
      ['roomInfo'] = {
        width = 1536,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 48,
                maximum = 223,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['shortcutToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 95,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 112,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 64,
                maximum = 207,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              statusPassageFromCastleEntranceToUndergroundCavernsOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = 128,
            statusPassageFromCastleEntranceToUndergroundCavernsOpened = true,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['meetingRoomWithDeath'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 16,
                maximum = 79,
              },
            },
          },
          ['outcome'] = {
            section = "highInTheAir",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 63,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 479,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -56,
          },
          requirements = {
            {
              section = "highIntheAir",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "highIntheAir",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "highIntheAir",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
            statusMetDeathInCastleEntrance = true,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
            statusMetDeathInCastleEntrance = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
            statusMetDeathInCastleEntrance = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHighInTheAir'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 48,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
              techniqueChainedRisingUppercuts = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
              techniqueChainedRisingUppercuts = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 448,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "highInTheAir",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 128,
          },
          requirements = {
            {
              section = "highInTheAir",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
              techniqueChainedRisingUppercuts = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
      },
    },
    ['stairwellAfterDeath'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['gargoyleRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 223,
              },
              ['positionY'] = {
                minimum = 176,
                maximum = 239,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 224,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 128,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
              techniqueChainedRisingUppercuts = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
      },
    },
    ['heartMaxUpRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['cubeOfZoeRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 303,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 671,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 304,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 544,
                maximum = 687,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 432,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 464,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "middleRightLedge",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftMiddle'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 480,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionRisingUppercut = true,
              techniqueRisingUppercut = true,
              techniqueChainedRisingUppercuts = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              statusPassageFromCastleEntranceToMarbleGalleryOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMiddleRightLedge'] = {
          ['outcome'] = {
            positionX = 488,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              progressionDoubleJump = true,
              techniqueForgivingCandleDiveKick = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperRightLedge",
              progressionDoubleJump = true,
              statusPassageFromCastleEntranceToMarbleGalleryOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperRightLedge",
              techniquePreciseJump = true,
              statusPassageFromCastleEntranceToMarbleGalleryOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 480,
            positionY = 640,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['openShortcut'] = {
          ['outcome'] = {
            statusPassageFromCastleEntranceToMarbleGalleryOpened = true,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['shortcutToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 127,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              statusPassageFromCastleEntranceToWarpRoomsOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              statusPassageFromCastleEntranceToWarpRoomsOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['openShortcut'] = {
          ['outcome'] = {
            statusPassageFromCastleEntranceToWarpRoomsOpened = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lifeMaxUpRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomC'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['castleKeep'] = {
    ['bend'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 207,
              },
              ['positionY'] = {
                minimum = 224,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "holeInFloor",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 240,
            positionY = 128,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "holeInFloor",
              ['verticalClimb'] = {
                minimum = 8,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHoleInFloor'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 240,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['dualPlatforms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 48,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 48,
            positionY = -24,
            verticalClimb = 228,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['falchionRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['ghostCardRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 128,
                maximum = 287,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 447,
              },
            },
          },
          ['outcome'] = {
            section = "upperLedges",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 368,
                maximum = 431,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "rightWindow",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 47,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "leftPassage",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 48,
                maximum = 367,
              },
              ['positionY'] = {
                minimum = 448,
                maximum = 607,
              },
            },
          },
          ['outcome'] = {
            section = "lowerLedges",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 48,
                maximum = 367,
              },
              ['positionY'] = {
                minimum = 608,
                maximum = 687,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLedges'] = {
          ['outcome'] = {
            positionX = 144,
            positionY = 384,
          },
          requirements = {
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "rightWindow",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "rightWindow",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "rightWindow",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "rightWindow",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toRightWindow'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLeftPassage'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLowerLedges'] = {
          ['outcome'] = {
            positionX = 256,
            positionY = 512,
          },
          requirements = {
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 64,
            positionY = 640,
          },
          requirements = {
            {
              section = "leftPassage",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "rightWindow",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "lowerLedges",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['keepArea'] = {
      ['roomInfo'] = {
        width = 2048,
        height = 2048,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1984,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 272,
                maximum = 367,
              },
              ['positionY'] = {
                minimum = 704,
                maximum = 879,
              },
            },
          },
          ['outcome'] = {
            section = "teleporter",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 768,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 800,
                maximum = 975,
              },
            },
          },
          ['outcome'] = {
            section = "throneRoom",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1040,
                maximum = 1599,
              },
              ['positionY'] = {
                minimum = 768,
                maximum = 975,
              },
            },
          },
          ['outcome'] = {
            section = "anteroom",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1632,
                maximum = 1695,
              },
              ['positionY'] = {
                minimum = 768,
                maximum = 959,
              },
            },
          },
          ['outcome'] = {
            section = "topOfStairs",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1840,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 1056,
                maximum = 1183,
              },
            },
          },
          ['outcome'] = {
            section = "bottomOfStairs",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 368,
                maximum = 687,
              },
              ['positionY'] = {
                minimum = 1152,
                maximum = 1279,
              },
            },
          },
          ['outcome'] = {
            section = "powerOfMistLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 368,
                maximum = 431,
              },
              ['positionY'] = {
                minimum = 1680,
                maximum = 1743,
              },
            },
          },
          ['outcome'] = {
            section = "leapStoneLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 400,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 1744,
                maximum = 1855,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1392,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 1632,
                maximum = 1743,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 1888,
                maximum = 1967,
              },
            },
          },
          ['outcome'] = {
            section = "hallway",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 1432,
            positionY = 760,
            staleLocation = true,
          },
          requirements = {
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "anteroom",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1920,
          },
          requirements = {
            {
              section = "hallway",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 2056,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 2056,
            positionY = 1152,
          },
          requirements = {
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 2056,
            positionY = 1664,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightHallway'] = {
          ['outcome'] = {
            positionX = 2056,
            positionY = 1920,
          },
          requirements = {
            {
              section = "hallway",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 2016,
            positionY = 384,
          },
          requirements = {
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toTeleporter'] = {
          ['outcome'] = {
            positionX = 320,
            positionY = 848,
          },
          requirements = {
            {
              section = "throneRoom",
              statusRichterSaved = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toThroneRoom'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = 944,
          },
          requirements = {
            {
              section = "anteroom",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "teleporter",
              statusRichterSaved = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toAnteroom'] = {
          ['outcome'] = {
            positionX = 1568,
            positionY = 896,
          },
          requirements = {
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "throneRoom",
              statusRichterSaved = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toTopOfStairs'] = {
          ['outcome'] = {
            positionX = 1648,
            positionY = 896,
          },
          requirements = {
            {
              section = "anteroom",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toBottomOfStairs'] = {
          ['outcome'] = {
            positionX = 2032,
            positionY = 1152,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toPowerOfMistLedge'] = {
          ['outcome'] = {
            positionX = 416,
            positionY = 1200,
          },
          requirements = {
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toLeapStoneLedge'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = 1712,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 2032,
            positionY = 1664,
          },
          requirements = {
            {
              section = "bottomOfStairs",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leapStoneLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "powerOfMistLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "topOfStairs",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lionTorchPlatform'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 207,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 63,
              },
            },
          },
          ['outcome'] = {
            section = "holeInCeiling",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 64,
                maximum = 431,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 32,
                maximum = 63,
              },
              ['positionY'] = {
                minimum = 448,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "holeInFloor",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = -24,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitTopWithJump'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = -24,
            verticalClimb = 28,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = -24,
            verticalClimb = 75,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = -24,
            verticalClimb = 75,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = -24,
            verticalClimb = 244,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 48,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toHoleInCeiling'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 32,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 128,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "holeInFloor",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "holeInFloor",
              ['verticalClimb'] = {
                minimum = 40,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHoleInFloor'] = {
          ['outcome'] = {
            positionX = 48,
            positionY = 480,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToClockTower'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lowerAttic'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 112,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToClockTower'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['tyrfingRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['upperAttic'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 392,
            positionY = 256,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
  },
  ['catacombs'] = {
    ['ballroomMaskRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "upperLedges",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 256,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 496,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLedges",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['toUpperLedges'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
      },
    },
    ['boneArkRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['catEyeCircletRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['granfaloonsLair'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['hellfireBeastRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['icebrandRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftLavaPath'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['mormegilRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pitchBlackSpikeMaze'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 47,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "leftSide",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 48,
                maximum = 639,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 640,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 80,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftSide'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              progressionBatTransformation = true,
              progressionEcholocation = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionBatTransformation = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionDoubleJump = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMainFromRightSide'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 176,
            statusLightInSpikeMazeActivated = true,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMainFromLeftSide'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 176,
          },
          requirements = {
            {
              section = "leftSide",
              progressionBatTransformation = true,
              progressionEcholocation = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leftSide",
              progressionBatTransformation = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leftSide",
              progressionDoubleJump = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leftSide",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leftSide",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 752,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              progressionBatTransformation = true,
              progressionEcholocation = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionBatTransformation = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionDoubleJump = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              statusLightInSpikeMazeActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightLavaPath'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId00'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId02'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId04'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId05'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId14'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId19'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId20'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId21'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId22'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId23'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId25'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 1072,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['roomId26'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 1072,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['smallGremlinRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spikeBreakerRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['walkArmorRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
  },
  ['clockTower'] = {
    ['belfry'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 384,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToCourtyard'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['fireOfBatRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['healingMailRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['hiddenArmory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['karasumansRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftGearRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 31,
              },
              ['positionY'] = {
                minimum = 864,
                maximum = 927,
              },
            },
          },
          ['outcome'] = {
            section = "secretPassage",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "secretPassage",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toSecretPassage'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 144,
            positionY = 896,
          },
          requirements = {
            {
              section = "secretPassage",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['openCourtyard'] = {
      ['roomInfo'] = {
        width = 1536,
        height = 1280,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 480,
                maximum = 1071,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 847,
              },
            },
          },
          ['outcome'] = {
            section = "centerArea",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 207,
              },
              ['positionY'] = {
                minimum = 304,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1408,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 48,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1280,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 816,
                maximum = 927,
              },
            },
          },
          ['outcome'] = {
            section = "middleRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 127,
              },
              ['positionY'] = {
                minimum = 816,
                maximum = 927,
              },
            },
          },
          ['outcome'] = {
            section = "lowerLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 1104,
                maximum = 1279,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 896,
          },
          requirements = {
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 1152,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toCenterArea'] = {
          ['outcome'] = {
            positionX = 528,
            positionY = 816,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 384,
          },
          requirements = {
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 1504,
            positionY = 128,
          },
          requirements = {
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toLowerLeftLedge'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 896,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toMiddleRightLedge'] = {
          ['outcome'] = {
            positionX = 1520,
            positionY = 896,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 1520,
            positionY = 1152,
          },
          requirements = {
            {
              section = "lowerLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "centerArea",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "middleRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pathToKarasuman'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pendulumRoom'] = {
      ['roomInfo'] = {
        width = 1792,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1791,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 128,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1800,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightGearRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spire'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 640,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['stairwellToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['colosseum'] = {
    ['arena'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['bladeMasterRoom'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 672,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['bloodCloakRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['bottomOfElevatorShaft'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTopRight'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['fountainRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['holySwordRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 416,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftSideArmory'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['passagewayBetweenArenaAndRoyalChapel'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 127,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "leftOfBarrier",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 880,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfBarrier",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1288,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftOfBarrier'] = {
          ['outcome'] = {
            positionX = 96,
            positionY = 160,
            statusBarrierInColosseumOpened = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 160,
          },
          requirements = {
            {
              section = "leftOfBarrier",
              statusBarrierInColosseumOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightSideArmory'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spiralStaircases'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['topOfElevatorShaft'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "behindMistGate",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 272,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "behindMistGate",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1288,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottomRight'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 304,
            positionY = 160,
          },
          requirements = {
            {
              section = "behindMistGate",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
        ['toBehindMistGate'] = {
          ['outcome'] = {
            positionX = 232,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
      },
    },
    ['topOfLeftSpiralStaircase'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['topOfRightSpiralStaircase'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 144,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['valhallaKnightRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
  },
  ['longLibrary'] = {
    ['dhuronAndFleaArmorRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['dhuronAndFleaManRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToOuterWall'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['faerieCardRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['fleaManRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['footOfStaircase'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['holyRodRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lesserDemonArea'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 976,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 175,
              },
            },
          },
          ['outcome'] = {
            section = "topRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 288,
                maximum = 1087,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 335,
              },
            },
          },
          ['outcome'] = {
            section = "upperLevel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 400,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 336,
                maximum = 543,
              },
            },
          },
          ['outcome'] = {
            section = "middleLevel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1024,
                maximum = 1135,
              },
              ['positionY'] = {
                minimum = 336,
                maximum = 623,
              },
            },
          },
          ['outcome'] = {
            section = "middleLevel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 544,
                maximum = 735,
              },
            },
          },
          ['outcome'] = {
            section = "lowerLevel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 207,
              },
              ['positionY'] = {
                minimum = 544,
                maximum = 895,
              },
            },
          },
          ['outcome'] = {
            section = "lowerLevel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 784,
                maximum = 1135,
              },
              ['positionY'] = {
                minimum = 816,
                maximum = 943,
              },
            },
          },
          ['outcome'] = {
            section = "behindMistGate",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 816,
                maximum = 959,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1288,
            positionY = 128,
          },
          requirements = {
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1288,
            positionY = 384,
          },
          requirements = {
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toTopRightLedge'] = {
          ['outcome'] = {
            positionX = 1248,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              techniquePreciseJump = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toUpperLevel'] = {
          ['outcome'] = {
            positionX = 848,
            positionY = 272,
          },
          requirements = {
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "topRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMiddleLevel'] = {
          ['outcome'] = {
            positionX = 1264,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toLowerLevel'] = {
          ['outcome'] = {
            positionX = 1216,
            positionY = 672,
          },
          requirements = {
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "middleLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 256,
            positionY = 928,
          },
          requirements = {
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "lowerLevel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
            {
              section = "behindMistGate",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
        ['toBehindMistGate'] = {
          ['outcome'] = {
            positionX = 816,
            positionY = 864,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
      },
    },
    ['loadingRoomToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['outsideShop'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['secretBookcaseRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['shop'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 256,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "beneathShop",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "beneathShop",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spellbookArea'] = {
      ['roomInfo'] = {
        width = 1792,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 399,
              },
              ['positionY'] = {
                minimum = 48,
                maximum = 287,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 303,
              },
              ['positionY'] = {
                minimum = 304,
                maximum = 479,
              },
            },
          },
          ['outcome'] = {
            section = "middleLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1791,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftMiddle'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 640,
            positionY = 792,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
        ['toMiddleLeftLedge'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 324,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 640,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "middleLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
      },
    },
    ['threeLayerRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "topLayer",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 256,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 512,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "bottomLayer",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "topLayer",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "topLayer",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftMiddle'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "bottomLayer",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "bottomLayer",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['marbleGallery'] = {
    ['alucartRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['beneathDropoff'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTopLeftWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 40,
            positionY = -24,
            verticalClimb = 11,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopLeftWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 40,
            positionY = -24,
            verticalClimb = 11,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopLeftWithGravityJump'] = {
          ['outcome'] = {
            positionX = 40,
            positionY = -24,
            verticalClimb = 276,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopLeft'] = {
          ['outcome'] = {
            positionX = 40,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              UNKNOWN_MOVEMENT_REQUIREMENT = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopRight'] = {
          ['outcome'] = {
            positionX = 272,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['beneathLeftTrapdoor'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 12,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 324,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['beneathRightTrapdoor'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 12,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 59,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 324,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['blueDoorRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 239,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 272,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftSide'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 160,
          },
          requirements = {
            {
              section = "rightSide",
              progressionUnlockBlueDoors = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 304,
            positionY = 160,
            statusPressurePlateInMarbleGalleryActivated = true,
          },
          requirements = {
            {
              section = "main",
              progressionUnlockBlueDoors = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['clockRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 31,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 79,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 224,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 79,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 64,
                maximum = 191,
              },
              ['positionY'] = {
                minimum = 192,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTopLeft'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = -24,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopMiddle'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -200,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopRight'] = {
          ['outcome'] = {
            positionX = 232,
            positionY = -24,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 32,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 232,
            positionY = 32,
          },
          requirements = {
            {
              section = "main",
              progressionBatTransformation = true,
              progressionItemMaterialization = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionDoubleJump = true,
              progressionItemMaterialization = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionGravityJump = true,
              progressionItemMaterialization = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              progressionItemMaterialization = true,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionWolfTransformation = true,
              progressionItemMaterialization = true,
              techniqueWolfMistRise = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 224,
          },
          requirements = {
            {
              section = "main",
              statusSecretFloorInClockRoomOpened = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['openSecretFloor'] = {
          ['outcome'] = {
            statusSecretFloorInClockRoomOpened = true,
          },
          requirements = {
            {
              section = "main",
              ['itemInscribedRing'] = {
                minimum = 2,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['dropoff'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 303,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 191,
              },
            },
          },
          ['outcome'] = {
            section = "leftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 288,
                maximum = 495,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 496,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 512,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftLedge'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 128,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 752,
            positionY = 128,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 224,
          },
          requirements = {
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['elevatorRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['exitTopWithJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 44,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTopWithDoubleJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 91,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
          },
        },
        ['exitTopWithPoweredMist'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 91,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
          },
        },
        ['exitTopWithGravityJump'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
            verticalClimb = 356,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['emptyRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['entrance'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['gravityBootsRoom'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 608,
                maximum = 671,
              },
              ['positionY'] = {
                minimum = 208,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 640,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 688,
            positionY = 176,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 640,
            positionY = 224,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftOfClockRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['longHallway'] = {
      ['roomInfo'] = {
        width = 3840,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 3839,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 3848,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['ouijaTableStairway'] = {
      ['roomInfo'] = {
        width = 512,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pathwayAfterLeftStatue'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pathwayAfterRightStatue'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['powerUpRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightOfClockRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['sShapedHallways'] = {
      ['roomInfo'] = {
        width = 1536,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['slingerStaircase'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 576,
                maximum = 671,
              },
              ['positionY'] = {
                minimum = 480,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 608,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 752,
            positionY = 384,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              statusPressurePlateInMarbleGalleryActivated = true,
              ['verticalClimb'] = {
                minimum = 8,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 608,
            positionY = 496,
          },
          requirements = {
            {
              section = "main",
              statusPressurePlateInMarbleGalleryActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spiritOrbRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 1280,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1279,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 1152,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['stainedGlassCorner'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 160,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['stairwellToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['stopwatchRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 352,
                maximum = 415,
              },
              ['positionY'] = {
                minimum = 224,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 320,
            positionY = 160,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              statusPressurePlateInMarbleGalleryActivated = true,
              ['verticalClimb'] = {
                minimum = 8,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 240,
          },
          requirements = {
            {
              section = "main",
              statusPressurePlateInMarbleGalleryActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tallStainedGlassWindows'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['threePaths'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 79,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "leftPath",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 96,
                maximum = 159,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 335,
              },
            },
          },
          ['outcome'] = {
            section = "middlePath",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 80,
                maximum = 175,
              },
              ['positionY'] = {
                minimum = 336,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 176,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "rightPath",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "middlePath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "leftPath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "rightPath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottomLeft'] = {
          ['outcome'] = {
            positionX = 40,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "leftPath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottomMiddle'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottomRight'] = {
          ['outcome'] = {
            positionX = 216,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "rightPath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMiddlePath'] = {
          ['outcome'] = {
            positionX = 152,
            positionY = 304,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
              progressionMistTransformation = true,
              techniqueWolfMistRise = true,
              techniqueLongWolfMistRise = true,
              techniqueVeryLongWolfMistRise = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 216,
            positionY = 536,
          },
          requirements = {
            {
              section = "middlePath",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToCastleCenter'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToUndergroundCaverns'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['olroxsQuarters'] = {
    ['bottomOfStairwell'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['catwalkCrypt'] = {
      ['roomInfo'] = {
        width = 1792,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1791,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1800,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['echoOfBatRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['emptyCells'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['emptyRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['garnetRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['grandStaircase'] = {
      ['roomInfo'] = {
        width = 768,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 536,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['hammerAndBladeRoom'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToColosseum'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['narrowHallwayToOlrox'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 399,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "leftOfTunnel",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 432,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfTunnel",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftOfTunnel'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 1000,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfTunnel",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "leftOfTunnel",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "leftOfTunnel",
              ['costs'] = {
                time = 2,
              },
              progressionWolfTransformation = true,
            },
          },
        },
      },
    },
    ['olroxsRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 47,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "leftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 464,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "rightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 256,
            positionY = 432,
          },
          requirements = {
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftLedge'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toRightLedge'] = {
          ['outcome'] = {
            positionX = 480,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
      },
    },
    ['openCourtyard'] = {
      ['roomInfo'] = {
        width = 1536,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 1392,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 1544,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
      },
    },
    ['prison'] = {
      ['roomInfo'] = {
        width = 1536,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1535,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottomLeft'] = {
          ['outcome'] = {
            positionX = 112,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottomRight'] = {
          ['outcome'] = {
            positionX = 1424,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['secretOnyxRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['skelerangRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['swordCardRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tallShaft'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1536,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 64,
                maximum = 191,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 63,
              },
            },
          },
          ['outcome'] = {
            section = "holeInCeiling",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 1376,
                maximum = 1631,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1408,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 1408,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toHoleInCeiling'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 32,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 1408,
          },
          requirements = {
            {
              section = "holeInCeiling",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToColosseum'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToRoyalChapel'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['outerWall'] = {
    ['blueAxeKnightRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['doppelgangerRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['elevatorShaftRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 2304,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 2303,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 416,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 640,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftMiddle'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1664,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 2176,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 2328,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['exitToClockTower'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 96,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['garlicRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['garnetVaseRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 304,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 400,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['gladiusRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['jewelKnucklesRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              statusSecretPlatformInOuterWallActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToClockTower'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
            statusSecretPlatformInOuterWallActivated = false,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToLongLibrary'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
            statusSecretPlatformInOuterWallActivated = false,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
            statusSecretPlatformInOuterWallActivated = false,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
            statusSecretPlatformInOuterWallActivated = false,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['lowerMedusaRoom'] = {
      ['roomInfo'] = {
        width = 768,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 31,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "behindMistGate",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "behindMistGate",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 792,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toBehindMistGate'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = 384,
          },
          requirements = {
            {
              section = "behindMistGate",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['secretPlatformRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 280,
            verticalClimb = 0,
            statusSecretPlatformInOuterWallActivated = true,
          },
          requirements = {
            {
              section = "main",
              statusSecretPlatformInOuterWallActivated = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['telescopeRoom'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 336,
                maximum = 735,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 239,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 480,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['topOfOuterWall'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 176,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToClockTower'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToLongLibrary'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToWarpRooms'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
  },
  ['royalChapel'] = {
    ['chapelStaircase'] = {
      ['roomInfo'] = {
        width = 2048,
        height = 1792,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 2047,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1791,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 2056,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 1816,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['confessionalBooth'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['emptyRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['gogglesRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 144,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 352,
                maximum = 415,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 640,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 224,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
      },
    },
    ['hippogryphRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftTower'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 2560,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 2559,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = 376,
            positionY = 896,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 648,
            positionY = 640,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 1920,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = 248,
            positionY = 2432,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 2432,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToColosseum'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['middleTower'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = 376,
            positionY = 896,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 648,
            positionY = 640,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['nave'] = {
      ['roomInfo'] = {
        width = 512,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pushingStatueShortcut'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 31,
              },
              ['positionY'] = {
                minimum = 96,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "leftOfStatue",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfStatue",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftOfStatue'] = {
          ['outcome'] = {
            positionX = 16,
            positionY = 128,
            statusStatueInRoyalChapelMoved = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 176,
          },
          requirements = {
            {
              section = "leftOfStatue",
              statusStatueInRoyalChapelMoved = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightTower'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = 376,
            positionY = 896,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 640,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 896,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['silverRingRoom'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['spikeHallway'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 111,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "leftOfSpikeHallway",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 1040,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfSpikeHallway",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1160,
            positionY = 128,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toLeftOfSpikeHallway'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              progressionMistTransformation = true,
              progressionUnlockBlueDoors = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 1072,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftOfSpikeHallway",
              progressionMistTransformation = true,
              progressionUnlockBlueDoors = true,
              ['itemSpikeBreaker'] = {
                minimum = 1,
              },
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['statueLedge'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToAlchemyLaboratory'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToColosseum'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['walkwayBetweenTowers'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = 120,
            positionY = 128,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1160,
            positionY = 128,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['walkwayLeftOfHippogryph'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = 120,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['walkwayRightOfHippogryph'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 648,
            positionY = 128,
            staleLocation = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
  },
  ['undergroundCaverns'] = {
    ['bandannaRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['claymoreStairwell'] = {
      ['roomInfo'] = {
        width = 256,
        height = 1024,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1023,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['crystalBend'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 80,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['crystalCloakRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['dKBridge'] = {
      ['roomInfo'] = {
        width = 1024,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 816,
                maximum = 975,
              },
              ['positionY'] = {
                minimum = 176,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "beneathBridge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1023,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 1032,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "beneathBridge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "beneathBridge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "beneathBridge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "beneathBridge",
              statusBridgeInUndergroundCavernsBroken = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toBeneathBridge'] = {
          ['outcome'] = {
            positionX = 960,
            positionY = 192,
            statusBridgeInUndergroundCavernsBroken = true,
          },
          requirements = {
            {
              section = "main",
              statusButtonInUndergroundCavernsActivated = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['dKButton'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['pressButton'] = {
          ['outcome'] = {
            statusButtonInUndergroundCavernsActivated = true,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['exitToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['falseSaveRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['useSaveRoom'] = {
          ['outcome'] = {
            positionX = 384,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['hiddenCrystalEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 768,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 767,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 136,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionGravityJump = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 640,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 104,
            positionY = 792,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['holySymbolRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['iceFloeRoom'] = {
      ['roomInfo'] = {
        width = 2304,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 2303,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 2176,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 2312,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['leftFerrymanRoute'] = {
      ['roomInfo'] = {
        width = 3328,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 3327,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 2144,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 3336,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['longDrop'] = {
      ['roomInfo'] = {
        width = 256,
        height = 2816,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 799,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 16,
                maximum = 47,
              },
              ['positionY'] = {
                minimum = 864,
                maximum = 927,
              },
            },
          },
          ['outcome'] = {
            section = "leftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 208,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 864,
                maximum = 927,
              },
            },
          },
          ['outcome'] = {
            section = "rightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 80,
                maximum = 191,
              },
              ['positionY'] = {
                minimum = 2768,
                maximum = 2815,
              },
            },
          },
          ['outcome'] = {
            section = "pit",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightMiddle'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 896,
          },
          requirements = {
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 2840,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 240,
            positionY = 128,
          },
          requirements = {
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toLeftLedge'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 896,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toRightLedge'] = {
          ['outcome'] = {
            positionX = 232,
            positionY = 896,
          },
          requirements = {
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "pit",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              techniqueLongPoweredMistTravel = true,
            },
          },
        },
        ['toPit'] = {
          ['outcome'] = {
            positionX = 136,
            positionY = 2792,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "leftLedge",
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "rightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['mealTicketsAndMoonstoneRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['mermanStatueRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['pentagramRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['plaqueRoomWithBreakableWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['plaqueRoomWithLifeMaxUp'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['rightFerrymanRoute'] = {
      ['roomInfo'] = {
        width = 3328,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 2895,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 2928,
                maximum = 3327,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "rightSide",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 3336,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 24,
            positionY = 128,
          },
          requirements = {
            {
              section = "rightSide",
              progressionSummonFerryman = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toRightSide'] = {
          ['outcome'] = {
            positionX = 3328,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              progressionSummonFerryman = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['risingWaterRoom'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId09'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['roomId10'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId11'] = {
      ['roomInfo'] = {
        width = 768,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 767,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 776,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId12'] = {
      ['roomInfo'] = {
        width = 512,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId18'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['roomId19'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomA'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomB'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['saveRoomC'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['scyllaRoom'] = {
      ['roomInfo'] = {
        width = 1280,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 1279,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 896,
            positionY = 280,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['scyllaWyrmRoom'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['smallStairwell'] = {
      ['roomInfo'] = {
        width = 256,
        height = 512,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 511,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitTop'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = -24,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 384,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['tallStairwell'] = {
      ['roomInfo'] = {
        width = 256,
        height = 2304,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 2303,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1664,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitBottom'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 2328,
            verticalClimb = 0,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
    ['triggerTeleporterToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToBossSuccubus'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['defeatSuccubus'] = {
          ['outcome'] = {
            positionX = -128,
            positionY = 128,
            statusSuccubusDefeated = true,
          },
          requirements = {
            {
              section = "main",
              techniqueDefeatSuccubusAtZeroProgression = true,
              statusSuccubusDefeated = false,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionDoubleJump = true,
              statusSuccubusDefeated = false,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionBatTransformation = true,
              statusSuccubusDefeated = false,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionGravityJump = true,
              statusSuccubusDefeated = false,
              ['costs'] = {
                time = 2,
              },
            },
            {
              section = "main",
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
              statusSuccubusDefeated = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToMarbleGallery'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['waterfall'] = {
      ['roomInfo'] = {
        width = 512,
        height = 1536,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 95,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 159,
              },
            },
          },
          ['outcome'] = {
            section = "upperLeftLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 208,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 239,
              },
            },
          },
          ['outcome'] = {
            section = "upperRightLedge",
          },
        },
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 511,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 1535,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeftUpper'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightUpper'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 128,
          },
          requirements = {
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitLeftLower'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 1408,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRightLower'] = {
          ['outcome'] = {
            positionX = 520,
            positionY = 1408,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['toUpperLeftLedge'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toUpperRightLedge'] = {
          ['outcome'] = {
            positionX = 480,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionMistTransformation = true,
              progressionLongerMistDuration = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
        ['toMain'] = {
          ['outcome'] = {
            positionX = 32,
            positionY = 1408,
          },
          requirements = {
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperLeftLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              techniqueLogicalRisks = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionBatTransformation = true,
            },
            {
              section = "upperRightLedge",
              ['costs'] = {
                time = 2,
              },
              progressionDoubleJump = true,
              progressionGravityJump = true,
            },
          },
        },
      },
    },
  },
  ['warpRooms'] = {
    ['loadingRoomToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['loadingRoomToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['triggerTeleporterToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['triggerTeleporterToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
      },
    },
    ['warpRoomToAbandonedMine'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
            statusWarpRoomToAbandonedMineUnlocked = true,
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOuterWall'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOuterWall",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOuterWallUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleKeep'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleKeep",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOlroxsQuarters'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOlroxsQuarters",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleEntrance'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleEntrance",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['warpRoomToCastleEntrance'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToAbandonedMine'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToAbandonedMine",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToAbandonedMineUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOuterWall'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOuterWall",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToAbandonedMineUnlocked = false,
              statusWarpRoomToOuterWallUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleKeep'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleKeep",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToAbandonedMineUnlocked = false,
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOlroxsQuarters'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOlroxsQuarters",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToAbandonedMineUnlocked = false,
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleEntrance'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleEntrance",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToAbandonedMineUnlocked = false,
              statusWarpRoomToOuterWallUnlocked = false,
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['warpRoomToCastleKeep'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
            statusWarpRoomToCastleKeepUnlocked = true,
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOlroxsQuarters'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOlroxsQuarters",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOlroxsQuartersUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleEntrance'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleEntrance",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToOlroxsQuartersUnlocked = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['warpRoomToOlroxsQuarters'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
            statusWarpRoomToOlroxsQuartersUnlocked = true,
          },
        },
      },
      ['commands'] = {
        ['exitLeft'] = {
          ['outcome'] = {
            positionX = -8,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleEntrance'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleEntrance",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
    ['warpRoomToOuterWall'] = {
      ['roomInfo'] = {
        width = 256,
        height = 256,
      },
      ['regions'] = {
        {
          requirements = {
            {
              ['positionX'] = {
                minimum = 0,
                maximum = 255,
              },
              ['positionY'] = {
                minimum = 0,
                maximum = 255,
              },
            },
          },
          ['outcome'] = {
            section = "main",
            statusWarpRoomToOuterWallUnlocked = true,
          },
        },
      },
      ['commands'] = {
        ['exitRight'] = {
          ['outcome'] = {
            positionX = 264,
            positionY = 128,
          },
          requirements = {
            {
              section = "main",
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleKeep'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleKeep",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToCastleKeepUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToOlroxsQuarters'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToOlroxsQuarters",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = true,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
        ['teleportToCastleEntrance'] = {
          ['outcome'] = {
            positionX = 128,
            positionY = 160,
            room = "warpRoomToCastleEntrance",
            section = "main",
          },
          requirements = {
            {
              section = "main",
              statusWarpRoomToCastleKeepUnlocked = false,
              statusWarpRoomToOlroxsQuartersUnlocked = false,
              ['costs'] = {
                time = 2,
              },
            },
          },
        },
      },
    },
  },
}

P.Stages = {
    [P.Stage.ABANDONED_MINE] = {
        stageName = 'abandonedMine',
        roomOffset = 0x80181960,
        roomNames = {
            [0] = 'wolfsHeadColumn',
            [1] = 'wellLitSkullRoom',
            [2] = 'cerberusRoom',
            [3] = 'demonSwitch',
            [4] = 'venusWeedRoom',
            [5] = 'snakeColumn',
            [6] = 'peanutsRoom',
            [7] = 'fourWayIntersection',
            [8] = 'lowerStairwell',
            [9] = 'karmaCoinRoom',
            [10] = 'bend',
            [11] = 'demonCard',
            [12] = 'loadingRoomToCatacombs',
            [13] = 'loadingRoomToWarpRooms',
            [14] = 'loadingRoomToUndergroundCaverns',
            [15] = 'saveRoom',
        },
    },
    [P.Stage.ALCHEMY_LABORATORY] = {
        stageName = 'alchemyLaboratory',
        roomOffset = 0x80182730,
        roomNames = {
            [0] = 'batCardRoom',
            [1] = 'exitToRoyalChapel',
            [2] = 'blueDoorHallway',
            [3] = 'bloodyZombieHallway',
            [4] = 'cannonRoom',
            [5] = 'clothCapeRoom',
            [6] = 'sunglassesRoom',
            [7] = 'glassVats',
            [8] = 'skillOfWolfRoom',
            [9] = 'heartMaxUpRoom',
            [10] = 'entryway',
            [11] = 'tallSpittleboneRoom',
            [12] = 'emptyZigZagRoom',
            [13] = 'shortZigZagRoom',
            [14] = 'tallZigZagRoom',
            [15] = 'secretLifeMaxUpRoom',
            [16] = 'slograAndGaibonRoom',
            [17] = 'boxPuzzleRoom',
            [18] = 'redSkeletonLiftRoom',
            [19] = 'tetrominoRoom',
            [20] = 'exitToMarbleGallery',
            [21] = 'corridorToElevator',
            [22] = 'elevatorShaft',
            [23] = 'saveRoomA',
            [24] = 'saveRoomB',
            [25] = 'saveRoomC',
            [26] = 'loadingRoomToMarbleGallery',
            [27] = 'loadingRoomToRoyalChapel',
            [28] = 'loadingRoomToCastleEntrance',
        },
    },
    [P.Stage.CASTLE_ENTRANCE] = {
        stageName = 'castleEntrance',
        roomOffset = 0x80183CC8,
        roomNames = {
            [0] = 'afterDrawbridge',
            [1] = 'dropUnderPortcullis',
            [2] = 'zombieHallway',
            [3] = 'holyMailRoom',
            [4] = 'atticStaircase',
            [5] = 'atticHallway',
            [6] = 'atticEntrance',
            [7] = 'mermanRoom',
            [8] = 'jewelSwordRoom',
            [9] = 'wargHallway',
            [10] = 'shortcutToUndergroundCaverns',
            [11] = 'meetingRoomWithDeath',
            [12] = 'stairwellAfterDeath',
            [13] = 'gargoyleRoom',
            [14] = 'heartMaxUpRoom',
            [15] = 'cubeOfZoeRoom',
            [16] = 'shortcutToWarpRooms',
            [17] = 'lifeMaxUpRoom',
            [18] = 'loadingRoomToMarbleGallery',
            [19] = 'loadingRoomToWarpRooms',
            [20] = 'loadingRoomToAlchemyLaboratory',
            [21] = 'loadingRoomToUndergroundCaverns',
            [22] = 'saveRoomA',
            [23] = 'saveRoomB',
            [24] = 'saveRoomC',
        },
    },
    [P.Stage.CASTLE_ENTRANCE_2] = {
        stageName = 'castleEntrance',
        roomOffset = 0x80183A80,
        roomNames = {
            [0] = 'afterDrawbridge',
            [1] = 'dropUnderPortcullis',
            [2] = 'zombieHallway',
            [3] = 'holyMailRoom',
            [4] = 'atticStaircase',
            [5] = 'atticHallway',
            [6] = 'atticEntrance',
            [7] = 'mermanRoom',
            [8] = 'jewelSwordRoom',
            [9] = 'wargHallway',
            [10] = 'shortcutToUndergroundCaverns',
            [11] = 'meetingRoomWithDeath',
            [12] = 'stairwellAfterDeath',
            [13] = 'gargoyleRoom',
            [14] = 'heartMaxUpRoom',
            [15] = 'cubeOfZoeRoom',
            [16] = 'shortcutToWarpRooms',
            [17] = 'lifeMaxUpRoom',
            [18] = 'loadingRoomToMarbleGallery',
            [19] = 'loadingRoomToWarpRooms',
            [20] = 'loadingRoomToAlchemyLaboratory',
            [21] = 'loadingRoomToUndergroundCaverns',
            [22] = 'saveRoomA',
            [23] = 'saveRoomB',
            [24] = 'saveRoomC',
        },
    },
    [P.Stage.CASTLE_KEEP] = {
        stageName = 'castleKeep',
        roomOffset = 0x80181B7C,
        roomNames = {
            [0] = 'upperAttic',
            [1] = 'lowerAttic',
            [2] = 'keepArea',
            [3] = 'ghostCardRoom',
            [4] = 'bend',
            [5] = 'falchionRoom',
            [6] = 'lionTorchPlatform',
            [7] = 'dualPlatforms',
            [8] = 'tyrfingRoom',
            [9] = 'saveRoomA',
            [10] = 'loadingRoomToClockTower',
            [11] = 'loadingRoomToWarpRooms',
            [12] = 'loadingRoomToRoyalChapel',
        },
    },
    [P.Stage.CATACOMBS] = {
        stageName = 'catacombs',
        roomOffset = 0x80182AF4,
        roomNames = {
            [0] = 'roomId00',
            [1] = 'mormegilRoom',
            [2] = 'roomId02',
            [3] = 'granfaloonsLair',
            [4] = 'roomId04',
            [5] = 'roomId05',
            [6] = 'smallGremlinRoom',
            [7] = 'saveRoomA',
            [8] = 'walkArmorRoom',
            [9] = 'icebrandRoom',
            [10] = 'leftLavaPath',
            [11] = 'ballroomMaskRoom',
            [12] = 'rightLavaPath',
            [13] = 'catEyeCircletRoom',
            [14] = 'roomId14',
            [15] = 'saveRoomB',
            [16] = 'hellfireBeastRoom',
            [17] = 'exitToAbandonedMine',
            [18] = 'boneArkRoom',
            [19] = 'roomId19',
            [20] = 'roomId20',
            [21] = 'roomId21',
            [22] = 'roomId22',
            [23] = 'roomId23',
            [24] = 'pitchBlackSpikeMaze',
            [25] = 'roomId25',
            [26] = 'roomId26',
            [27] = 'spikeBreakerRoom',
            [28] = 'loadingRoomToAbandonedMine',
        },
    },
    [P.Stage.CLOCK_TOWER] = {
        stageName = 'clockTower',
        roomOffset = 0x80182340,
        roomNames = {
            [0] = 'karasumansRoom',
            [1] = 'pathToKarasuman',
            [2] = 'healingMailRoom',
            [3] = 'pendulumRoom',
            [4] = 'spire',
            [5] = 'hiddenArmory',
            [6] = 'leftGearRoom',
            [7] = 'rightGearRoom',
            [8] = 'exitToCourtyard',
            [9] = 'belfry',
            [10] = 'openCourtyard',
            [11] = 'stairwellToOuterWall',
            [12] = 'fireOfBatRoom',
            [13] = 'loadingRoomToOuterWall',
            [14] = 'loadingRoomToCastleKeep',
        },
    },
    [P.Stage.COLOSSEUM] = {
        stageName = 'colosseum',
        roomOffset = 0x80182E60,
        roomNames = {
            [0] = 'holySwordRoom',
            [1] = 'topOfLeftSpiralStaircase',
            [2] = 'bladeMasterRoom',
            [3] = 'topOfRightSpiralStaircase',
            [4] = 'passagewayBetweenArenaAndRoyalChapel',
            [5] = 'arena',
            [6] = 'topOfElevatorShaft',
            [7] = 'spiralStaircases',
            [8] = 'valhallaKnightRoom',
            [9] = 'fountainRoom',
            [10] = 'bloodCloakRoom',
            [11] = 'bottomOfElevatorShaft',
            [12] = 'leftSideArmory',
            [13] = 'rightSideArmory',
            [14] = 'loadingRoomToRoyalChapel',
            [15] = 'loadingRoomToOlroxsQuarters',
            [16] = 'saveRoomA',
            [17] = 'saveRoomB',
        },
    },
    [P.Stage.LONG_LIBRARY] = {
        stageName = 'longLibrary',
        roomOffset = 0x80182EC4,
        roomNames = {
            [0] = 'lesserDemonArea',
            [1] = 'secretBookcaseRoom',
            [2] = 'holyRodRoom',
            [3] = 'dhuronAndFleaArmorRoom',
            [4] = 'shop',
            [5] = 'outsideShop',
            [6] = 'fleaManRoom',
            [7] = 'faerieCardRoom',
            [8] = 'threeLayerRoom',
            [9] = 'spellbookArea',
            [10] = 'dhuronAndFleaManRoom',
            [11] = 'footOfStaircase',
            [12] = 'exitToOuterWall',
            [13] = 'loadingRoomToOuterWall',
            [14] = 'saveRoomA',
        },
    },
    [P.Stage.MARBLE_GALLERY] = {
        stageName = 'marbleGallery',
        roomOffset = 0x801827E4,
        roomNames = {
            [0] = 'sShapedHallways',
            [1] = 'tallStainedGlassWindows',
            [2] = 'spiritOrbRoom',
            [3] = 'stainedGlassCorner',
            [4] = 'beneathDropoff',
            [5] = 'dropoff',
            [6] = 'entrance',
            [7] = 'stopwatchRoom',
            [8] = 'longHallway',
            [9] = 'clockRoom',
            [10] = 'leftOfClockRoom',
            [11] = 'emptyRoom',
            [12] = 'blueDoorRoom',
            [13] = 'pathwayAfterLeftStatue',
            [14] = 'pathwayAfterRightStatue',
            [15] = 'ouijaTableStairway',
            [16] = 'threePaths',
            [17] = 'stairwellToUndergroundCaverns',
            [18] = 'slingerStaircase',
            [19] = 'rightOfClockRoom',
            [20] = 'gravityBootsRoom',
            [21] = 'elevatorRoom',
            [22] = 'powerUpRoom',
            [23] = 'beneathLeftTrapdoor',
            [24] = 'beneathRightTrapdoor',
            [25] = 'alucartRoom',
            [26] = 'loadingRoomToOuterWall',
            [27] = 'loadingRoomToUndergroundCaverns',
            [28] = 'loadingRoomToAlchemyLaboratory',
            [29] = 'loadingRoomToOlroxsQuarters',
            [30] = 'loadingRoomToCastleEntrance',
            [31] = 'saveRoomA',
            [32] = 'saveRoomB',
        },
    },
    [P.Stage.OLROXS_QUARTERS] = {
        stageName = 'olroxsQuarters',
        roomOffset = 0x801832A4,
        roomNames = {
            [0] = 'skelerangRoom',
            [1] = 'bottomOfStairwell',
            [2] = 'grandStaircase',
            [3] = 'secretOnyxRoom',
            [4] = 'hammerAndBladeRoom',
            [5] = 'emptyRoom',
            [6] = 'tallShaft',
            [7] = 'prison',
            [8] = 'openCourtyard',
            [9] = 'emptyCells',
            [10] = 'garnetRoom',
            [11] = 'narrowHallwayToOlrox',
            [12] = 'olroxsRoom',
            [13] = 'echoOfBatRoom',
            [14] = 'swordCardRoom',
            [15] = 'catwalkCrypt',
            [16] = 'saveRoomA',
            [17] = 'loadingRoomToMarbleGallery',
            [18] = 'loadingRoomToColosseum',
            [19] = 'loadingRoomToWarpRooms',
            [20] = 'loadingRoomToRoyalChapel',
        },
    },
    [P.Stage.OUTER_WALL] = {
        stageName = 'outerWall',
        roomOffset = 0x8018348C,
        roomNames = {
            [0] = 'loadingRoomToWarpRooms',
            [1] = 'topOfOuterWall',
            [2] = 'exitToClockTower',
            [3] = 'telescopeRoom',
            [4] = 'lowerMedusaRoom',
            [5] = 'jewelKnucklesRoom',
            [6] = 'secretPlatformRoom',
            [7] = 'exitToMarbleGallery',
            [8] = 'garnetVaseRoom',
            [9] = 'blueAxeKnightRoom',
            [10] = 'garlicRoom',
            [11] = 'doppelgangerRoom',
            [12] = 'gladiusRoom',
            [13] = 'elevatorShaftRoom',
            [14] = 'saveRoomA',
            [15] = 'loadingRoomToClockTower',
            [16] = 'loadingRoomToLongLibrary',
            [17] = 'saveRoomB',
            [18] = 'loadingRoomToMarbleGallery',
        },
    },
    [P.Stage.ROYAL_CHAPEL] = {
        stageName = 'royalChapel',
        roomOffset = 0x8018235C,
        roomNames = {
            [0] = 'silverRingRoom',
            [1] = 'spikeHallway',
            [2] = 'walkwayBetweenTowers',
            [3] = 'walkwayLeftOfHippogryph',
            [4] = 'hippogryphRoom',
            [5] = 'walkwayRightOfHippogryph',
            [6] = 'pushingStatueShortcut',
            [7] = 'confessionalBooth',
            [8] = 'gogglesRoom',
            [9] = 'nave',
            [10] = 'emptyRoom',
            [11] = 'chapelStaircase',
            [12] = 'statueLedge',
            [13] = 'leftTower',
            [14] = 'middleTower',
            [15] = 'loadingRoomToCastleKeep',
            [16] = 'saveRoomB',
            [17] = 'rightTower',
            [18] = 'saveRoomA',
            [19] = 'loadingRoomToAlchemyLaboratory',
            [20] = 'loadingRoomToColosseum',
            [21] = 'loadingRoomToOlroxsQuarters',
        },
    },
    [P.Stage.UNDERGROUND_CAVERNS] = {
        stageName = 'undergroundCaverns',
        roomOffset = 0x801830F4,
        roomNames = {
            [0] = 'longDrop',
            [1] = 'hiddenCrystalEntrance',
            [2] = 'crystalBend',
            [3] = 'tallStairwell',
            [4] = 'plaqueRoomWithLifeMaxUp',
            [5] = 'smallStairwell',
            [6] = 'claymoreStairwell',
            [7] = 'mealTicketsAndMoonstoneRoom',
            [8] = 'plaqueRoomWithBreakableWall',
            [9] = 'roomId09',
            [10] = 'roomId10',
            [11] = 'roomId11',
            [12] = 'roomId12',
            [13] = 'holySymbolRoom',
            [14] = 'pentagramRoom',
            [15] = 'dKBridge',
            [16] = 'exitToAbandonedMine',
            [17] = 'dKButton',
            [18] = 'roomId18',
            [19] = 'roomId19',
            [20] = 'exitToCastleEntrance',
            [21] = 'mermanStatueRoom',
            [22] = 'iceFloeRoom',
            [23] = 'rightFerrymanRoute',
            [24] = 'crystalCloakRoom',
            [25] = 'leftFerrymanRoute',
            [26] = 'waterfall',
            [27] = 'scyllaRoom',
            [28] = 'scyllaWyrmRoom',
            [29] = 'risingWaterRoom',
            [30] = 'bandannaRoom',
            [31] = 'loadingRoomToCastleEntrance',
            [32] = 'loadingRoomToMarbleGallery',
            [33] = 'loadingRoomToAbandonedMine',
            [34] = 'saveRoomA',
            [35] = 'saveRoomB',
            [36] = 'saveRoomC',
            [37] = 'falseSaveRoom',
        },
    },
    [P.Stage.WARP_ROOMS] = {
        stageName = 'warpRooms',
        roomOffset = 0x801811B0,
        roomNames = {
            [0] = 'warpRoomToCastleKeep',
            [1] = 'warpRoomToOlroxsQuarters',
            [2] = 'warpRoomToOuterWall',
            [3] = 'warpRoomToCastleEntrance',
            [4] = 'warpRoomToAbandonedMine',
            [5] = 'loadingRoomToAbandonedMine',
            [6] = 'loadingRoomToCastleEntrance',
            [7] = 'loadingRoomToOlroxsQuarters',
            [8] = 'loadingRoomToOuterWall',
            [9] = 'loadingRoomToCastleKeep',
        },
    },
}

P.getCurrentState = function()
    local relicSoulOfBat = (mainmemory.read_u8(0x097964) >= 3)
    local relicSoulOfWolf = (mainmemory.read_u8(0x097968) >= 3)
    local relicEchoOfBat = (mainmemory.read_u8(0x097966) >= 3)
    local relicPowerOfWolf = (mainmemory.read_u8(0x097969) >= 3)
    local relicSkillOfWolf = (mainmemory.read_u8(0x09796A) >= 3)
    local relicFormOfMist = (mainmemory.read_u8(0x09796B) >= 3)
    local relicPowerOfMist = (mainmemory.read_u8(0x09796C) >= 3)
    local relicCubeOfZoe = (mainmemory.read_u8(0x09796E) >= 3)
    local relicGravityBoots = (mainmemory.read_u8(0x097970) >= 3)
    local relicLeapStone = (mainmemory.read_u8(0x097971) >= 3)
    local relicHolySymbol = (mainmemory.read_u8(0x097972) >= 3)
    local relicJewelOfOpen = (mainmemory.read_u8(0x097974) >= 3)
    local relicMermanStatue = (mainmemory.read_u8(0x097975) >= 3)
    local relicDemonCard = (mainmemory.read_u8(0x097979) >= 3)
    local equippedSpikeBreaker = (mainmemory.read_u8(0x097C0C) == 0x0E)
    local result = {
        techniqueSolveBoxPuzzle = true,
        techniqueLogicalRisks = true,
        -- techniqueForgivingCandleDiveKick = true,
    }
    result.progressionBatTransformation = relicSoulOfBat
    result.progressionEcholocation = relicEchoOfBat
    result.progressionFasterWolfRunSpeed = relicPowerOfWolf
    result.progressionMidAirReset = relicSoulOfBat or relicSoulOfWolf or relicFormOfMist or relicLeapStone
    result.progressionMistTransformation = relicFormOfMist
    result.progressionWolfChargeAttack = relicSkillOfWolf
    result.progressionWolfSwimMovement = relicSkillOfWolf
    result.progressionWolfTransformation = relicSoulOfWolf
    result.progressionLongerMistDuration = relicPowerOfMist
    result.progressionItemMaterialization = relicCubeOfZoe
    result.progressionGravityJump = relicGravityBoots
    result.progressionDoubleJump = relicLeapStone
    result.progressionProtectionFromWater = relicHolySymbol
    result.progressionUnlockBlueDoors = relicJewelOfOpen
    result.progressionSummonFerryman = relicMermanStatue
    result.progressionSummonDemonFamiliar = relicDemonCard -- or relicNosedevilCard
    -- Status
    result.statusPassageFromCastleEntranceToUndergroundCavernsOpened = (mainmemory.read_u8(0x03BE1C) & 0x01) > 0
    result.statusPassageFromCastleEntranceToWarpRoomsOpened = (mainmemory.read_u8(0x03BE1E) & 0x01) > 0
    result.statusCannonActivated = (mainmemory.read_u8(0x03BE6F) & 0x01) > 0
    result.statusPressurePlateInMarbleGalleryActivated = (mainmemory.read_u8(0x03BDED) & 0x01) > 0
    result.statusBarrierInColosseumOpened = (mainmemory.read_u8(0x03BE9D) & 0x01) > 0
    -- result.statusXXX = (mainmemory.read_u8(0x03BEFF) & 0x01) > 0
    if P.Stages[P.currentStageId] ~= nil then
        result.stage = P.Stages[P.currentStageId].stageName
        local roomIndex = (P.currentRoomId - P.Stages[P.currentStageId].roomOffset) / 8
        if P.Stages[P.currentStageId].roomNames[roomIndex] ~= nil then
            local playerX = mainmemory.read_u16_le(0x0973F0)
            local playerY = mainmemory.read_u16_le(0x0973F4)
            result.room = P.Stages[P.currentStageId].roomNames[roomIndex]
            local roomLogic = P.Logic[result.stage][result.room]
            for regionIndex, regionInfo in ipairs(roomLogic['regions']) do
                local requirement = regionInfo['requirements'][1]
                local left = requirement['positionX'].minimum
                local right =  requirement['positionX'].maximum
                local top = requirement['positionY'].minimum
                local bottom = 1 + requirement['positionY'].maximum
                if playerX >= left and playerX < right and playerY >= top and playerY < bottom then
                    result.section = regionInfo['outcome']['section']
                    break
                end
            end
        end
    end
    return result
end

P.stage_id = function()
    local result = mainmemory.read_u32_le(0x0974A0)
    return result
end

P.room_id = function()
    local result = mainmemory.read_u32_le(0x1375BC)
    return result
end

P.update = function()
    P.timers[0] = P.timers[0] + 1
    local prevStageId = P.currentStageId
    local prevRoomId = P.currentRoomId
    P.currentStageId = P.stage_id()
    P.currentRoomId = P.room_id()
    if P.currentStageId ~= prevStageId or P.currentRoomId ~= prevRoomId then
        P.timers[1] = P.timers[0]
        P.timers[0] = 0
    end
    P.currentState = P.getCurrentState()
end

P.draw = function()
    local playerX = mainmemory.read_u16_le(0x0973F0)
    local playerY = mainmemory.read_u16_le(0x0973F4)
    local scrollX = mainmemory.read_u16_le(0x07308E)
    local scrollY = mainmemory.read_u16_le(0x073092)
    local centerX = playerX - scrollX + 12
    local centerY = playerY - scrollY - 2
    gui.drawEllipse(centerX, centerY, 4, 4, 0xffffffff)
    if P.Logic[P.currentState.stage] ~= nil and P.Logic[P.currentState.stage][P.currentState.room] ~= nil then
        local roomLogic = P.Logic[P.currentState.stage][P.currentState.room]
        for regionIndex, regionInfo in ipairs(roomLogic['regions']) do
            local requirement = regionInfo['requirements'][1]
            local left = requirement['positionX'].minimum
            local right =  requirement['positionX'].maximum
            local top = requirement['positionY'].minimum
            local bottom = 1 + requirement['positionY'].maximum
            local color = 0x0cff0000
            if regionInfo['outcome']['section'] == P.currentState.section then
                color = 0x0c00ff00
                for commandName, commandInfo in pairs(roomLogic['commands']) do
                    if (
                        commandInfo['outcome'].positionX ~= nil and
                        commandInfo['outcome'].positionY ~= nil
                    ) then
                        local inSection = false
                        local metRequirements = false
                        for requirementIndex, requirementInfo in ipairs(commandInfo['requirements']) do
                            metRequirements = true
                            for progressionName, progressionInfo in pairs(requirementInfo) do
                                if progressionName == 'costs' then
                                    -- SKIP
                                elseif progressionName == 'section' then
                                    if P.currentState[progressionName] == progressionInfo then
                                        inSection = true
                                    else
                                        metRequirements = false
                                    end
                                elseif P.currentState[progressionName] ~= nil then
                                    if P.currentState[progressionName] ~= progressionInfo then
                                        metRequirements = false
                                    end
                                else
                                    metRequirements = false
                                end
                            end
                            if metRequirements then
                                -- console.log(requirementIndex, requirementInfo)
                                break
                            end
                        end
                        if inSection then
                            local lineColor = 0x20ff0000
                            if metRequirements then
                                lineColor = 0x8000ff00
                            end
                            local targetX = commandInfo['outcome'].positionX - scrollX + 12
                            local targetY = commandInfo['outcome'].positionY - scrollY - 2
                            gui.drawLine(centerX, centerY, targetX, targetY, lineColor)
                            if not metRequirements then
                                local textX = (8 * centerX + targetX) / 9
                                local textY = (8 * centerY + targetY) / 9
                                gui.drawText(textX, textY, commandName, 0xffffffff, 0x80000000, 8)
                            end
                        end
                    end
                end
            end
            gui.drawBox(
                15 + left - scrollX,
                top - scrollY,
                15 + right - scrollX,
                bottom - scrollY,
                0xffffffff,
                color
            )
        end
    end
    local formLabelText = string.format('t = %.2f', P.timers[0] / 60)..'\n'..string.format('t = %.2f', P.timers[1] / 60)
    forms.settext(P.formLabel, formLabelText)
end

event.unregisterbyname("LogicVisualizer__update")
event.onframeend(P.update, "LogicVisualizer__update")

P.form = forms.newform(340, 110, "LogicVisualizer", nil)
P.formLabel = forms.label(P.form, '-', 8, 8, 240, 180, true)
P.timers = {
    [0] = 0,
    [1] = 0,
}
P.currentState = P.getCurrentState()

P.update()
while true do
    emu.yield()
    P.draw()
    -- break
end