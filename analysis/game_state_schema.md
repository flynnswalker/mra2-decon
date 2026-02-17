# MRA2 Game State Field Schema

Extracted from descriptor table at `0x083EE428`.
Total fields: 154

## Field Table

| Idx | Offset | Type | Max | Stride | Name | Notes |
|-----|--------|------|-----|--------|------|-------|
| 0 | 0x0068 | special_read | 999 | 0 | stat_pow | Power stat (offset 0x68 from monster base) |
| 1 | 0x006A | special_read | 999 | 0 | stat_int | Intelligence stat |
| 2 | 0x006C | special_read | 999 | 0 | stat_ski | Accuracy/Skill stat |
| 3 | 0x006E | special_read | 999 | 0 | stat_spd | Evasion/Speed stat |
| 4 | 0x0070 | special_read | 999 | 0 | stat_def | Defense stat |
| 5 | 0x0072 | special_read | 999 | 0 | stat_lif | Life stat |
| 6 | 0x0074 | uint16 | 99 | 0 |  |  |
| 7 | 0x0075 | uint16 | 99 | 0 |  |  |
| 8 | 0x0076 | uint16 | 99 | 0 |  |  |
| 9 | 0x0077 | uint16 | 99 | 0 |  |  |
| 10 | 0x0078 | uint16 | 99 | 0 |  |  |
| 11 | 0x0079 | uint16 | 99 | 0 |  |  |
| 12 | 0x007A | uint16 | 14 | 0 |  |  |
| 13 | 0x007B | uint16 | 255 | 1 |  |  |
| 14 | 0x007E | uint16 | 255 | 1 |  |  |
| 15 | 0x0080 | uint16 | 255 | 1 |  |  |
| 16 | 0x0082 | uint16 | 255 | 1 |  |  |
| 17 | None | func_call |  | 0 |  |  |
| 18 | 0x0088 | uint16 | 11 | 0 |  |  |
| 19 | 0x0089 | uint16 | 5 | 0 |  |  |
| 20 | 0x008C | array_u16 | 0xFFFFFFFF | 0 |  |  |
| 21 | 0x0090 | uint32 | 65535 | 0 |  |  |
| 22 | 0x0094 | uint32 | 9999 | 0 | amount_0x94 |  |
| 23 | 0x0096 | int16 | 9999 | 0 | amount_0x96 |  |
| 24 | 0x0098 | uint16 | 8 | 0 |  |  |
| 25 | 0x009A | uint32 | 999 | 0 | stat999_0x9A |  |
| 26 | 0x009C | int8 | 15 | 0 | flags_0x9C | 4-bit flags or small counter (0-15) |
| 27 | 0x009E | uint32 | 999 | 0 | stat999_0x9E |  |
| 28 | 0x00A0 | uint32 | 999 | 0 | stat999_0xA0 |  |
| 29 | 0x00A2 | int8 | 100 | 0 | pct_0xA2 | percentage field (0-100) |
| 30 | 0x00A3 | uint16 | 100 | 0 |  |  |
| 31 | 0x00A4 | int8 | 100 | 0 | pct_0xA4 | percentage field (0-100) |
| 32 | 0x00A5 | array_u32 | 9 | 0 |  |  |
| 33 | 0x00A6 | array_u32 | 9 | 0 |  |  |
| 34 | 0x00A7 | array_u32 | 9 | 0 |  |  |
| 35 | 0x00A8 | array_u32 | 9 | 0 |  |  |
| 36 | 0x00A9 | array_u32 | 9 | 0 |  |  |
| 37 | 0x00AA | array_u32 | 9 | 0 |  |  |
| 38 | 0x00AB | int8 | 10 | 0 | level_0xAB | small level/counter (0-10) |
| 39 | 0x00AC | int8 | 10 | 0 | level_0xAC | small level/counter (0-10) |
| 40 | 0x00AD | int8 | 10 | 0 | level_0xAD | small level/counter (0-10) |
| 41 | 0x00AE | int8 | 10 | 0 | level_0xAE | small level/counter (0-10) |
| 42 | 0x00AF | int8 | 10 | 0 | level_0xAF | small level/counter (0-10) |
| 43 | 0x00B0 | int8 | 10 | 0 | level_0xB0 | small level/counter (0-10) |
| 44 | 0x00B1 | int8 | 100 | 0 | pct_0xB1 | percentage field (0-100) |
| 45 | 0x00B2 | int8 | 100 | 0 | pct_0xB2 | percentage field (0-100) |
| 46 | 0x00B3 | int8 | 100 | 0 | pct_0xB3 | percentage field (0-100) |
| 47 | 0x00B4 | uint16 | 100 | 0 |  |  |
| 48 | 0x00B8 | array_u16 | 4 | 0 |  |  |
| 49 | 0x00BC | uint16 | 99 | 0 |  |  |
| 50 | 0x00BD | uint16 | 100 | 0 |  |  |
| 51 | None | func_call |  | 0 |  |  |
| 52 | None | func_call |  | 0 |  |  |
| 53 | None | func_call |  | 0 |  |  |
| 54 | 0x00DC | uint16 | 255 | 0 |  |  |
| 55 | 0x00DD | int8 | 127 | 0 |  |  |
| 56 | 0x00DE | uint32 | 999 | 0 | stat999_0xDE |  |
| 57 | 0x00E0 | uint32 | 999 | 0 | stat999_0xE0 |  |
| 58 | 0x00E2 | uint32 | 999 | 0 | stat999_0xE2 |  |
| 59 | 0x00E4 | array_u16 | 0x98967F | 0 |  |  |
| 60 | 0x00E8 | uint32 | 999 | 0 | stat999_0xE8 |  |
| 61 | 0x00EA | uint16 | 2 | 0 |  |  |
| 62 | 0x00EB | int8 | 10 | 0 | level_0xEB | small level/counter (0-10) |
| 63 | 0x00EC | int8 | 10 | 0 | level_0xEC | small level/counter (0-10) |
| 64 | 0x00ED | int8 | 10 | 0 | level_0xED | small level/counter (0-10) |
| 65 | 0x00EE | int8 | 10 | 0 | level_0xEE | small level/counter (0-10) |
| 66 | 0x00EF | int8 | 10 | 0 | level_0xEF | small level/counter (0-10) |
| 67 | 0x00F0 | int8 | 10 | 0 | level_0xF0 | small level/counter (0-10) |
| 68 | 0x00F1 | int8 | 10 | 0 | level_0xF1 | small level/counter (0-10) |
| 69 | 0x00F2 | int8 | 10 | 0 | level_0xF2 | small level/counter (0-10) |
| 70 | 0x00F3 | int8 | 10 | 0 | level_0xF3 | small level/counter (0-10) |
| 71 | 0x00F4 | int8 | 10 | 0 | level_0xF4 | small level/counter (0-10) |
| 72 | 0x00F5 | int8 | 10 | 0 | level_0xF5 | small level/counter (0-10) |
| 73 | 0x00F6 | uint16 | 14 | 0 |  |  |
| 74 | 0x00F7 | uint16 | 6 | 0 |  |  |
| 75 | 0x00F8 | uint16 | 255 | 1 |  |  |
| 76 | None | func_call |  | 0 |  |  |
| 77 | 0x0108 | uint16_special | 255 | 88 |  |  |
| 78 | 0x0128 | uint16_special | 255 | 88 |  |  |
| 79 | 0x0148 | array_u16 | 0xFFFFFFFF | 88 |  |  |
| 80 | 0x014C | uint16 | 30 | 88 |  |  |
| 81 | 0x014D | uint16 | 40 | 88 |  |  |
| 82 | 0x0150 | array_u16 | 0xFFFFFFFF | 88 |  |  |
| 83 | 0x0154 | uint16 | 11 | 88 |  |  |
| 84 | 0x0155 | uint16 | 100 | 88 |  |  |
| 85 | 0x0156 | uint16 | 14 | 88 |  |  |
| 86 | 0x0157 | uint16 | 2 | 88 |  |  |
| 87 | 0x0158 | uint16 | 1 | 88 |  |  |
| 88 | 0x015A | special_read | 999 | 88 | stat999_0x15A |  |
| 89 | 0x015C | special_read | 999 | 88 | stat999_0x15C |  |
| 90 | None | func_call |  | 0 |  |  |
| 91 | None | func_call |  | 0 |  |  |
| 92 | 0x047C | uint16_special | 255 | 40 |  |  |
| 93 | 0x049C | uint16 | 30 | 40 |  |  |
| 94 | 0x049D | uint16 | 40 | 40 |  |  |
| 95 | 0x049E | uint16 | 11 | 40 |  |  |
| 96 | None | func_call |  | 0 |  |  |
| 97 | 0x0478 | uint32 | 999 | 0 | stat999_0x478 |  |
| 98 | None | func_call |  | 0 |  |  |
| 99 | 0x0000 | uint16_special | 255 | 0 |  |  |
| 100 | 0x0020 | array_u16 | 0xFFFFFFFF | 0 |  |  |
| 101 | 0x0024 | array_u16 | 0xFFFFFFFF | 0 |  |  |
| 102 | None | func_call |  | 0 |  |  |
| 103 | None | func_call |  | 0 |  |  |
| 104 | None | func_call |  | 0 |  |  |
| 105 | None | func_call |  | 0 |  |  |
| 106 | None | func_call |  | 0 |  |  |
| 107 | 0x0104 | uint16 | 30 | 0 |  |  |
| 108 | 0x0105 | uint16 | 40 | 0 |  |  |
| 109 | None | func_call |  | 0 |  |  |
| 110 | None | func_call |  | 0 |  |  |
| 111 | None | func_call |  | 0 |  |  |
| 112 | None | func_call |  | 0 |  |  |
| 113 | None | func_call |  | 0 |  |  |
| 114 | None | func_call |  | 0 |  |  |
| 115 | None | func_call |  | 0 |  |  |
| 116 | None | func_call |  | 0 |  |  |
| 117 | None | func_call |  | 0 |  |  |
| 118 | None | func_call |  | 0 |  |  |
| 119 | None | func_call |  | 0 |  |  |
| 120 | 0x0100 | uint32 | 999 | 2 | stat999_0x100 |  |
| 121 | None | func_call |  | 0 |  |  |
| 122 | 0x013C | uint16_special | 255 | 104 |  |  |
| 123 | 0x015C | uint16 | 30 | 104 |  |  |
| 124 | 0x015D | uint16 | 40 | 104 |  |  |
| 125 | 0x015E | uint16_special | 255 | 104 |  |  |
| 126 | 0x017E | uint16_special | 255 | 104 |  |  |
| 127 | 0x019E | uint16 | 30 | 104 |  |  |
| 128 | 0x019F | uint16 | 40 | 104 |  |  |
| 129 | 0x01A0 | uint16 | 100 | 104 |  |  |
| 130 | 0x00F0 | uint32 | 9999 | 0 | amount_0xF0 |  |
| 131 | 0x00F2 | uint32 | 9999 | 0 | amount_0xF2 |  |
| 132 | 0x00F4 | uint32 | 9999 | 0 | amount_0xF4 |  |
| 133 | 0x00F8 | array_u16 | 0x5F5E0FF | 0 |  |  |
| 134 | None | func_call |  | 0 |  |  |
| 135 | None | func_call |  | 0 |  |  |
| 136 | None | func_call |  | 0 |  |  |
| 137 | None | func_call |  | 0 |  |  |
| 138 | None | func_call |  | 0 |  |  |
| 139 | 0x0134 | array_u16 | 139 | 0 |  |  |
| 140 | 0x0138 | uint32 | 140 | 0 |  |  |
| 141 | 0x095C | uint16 | 1 | 28 |  |  |
| 142 | 0x095D | int8 | 127 | 28 |  |  |
| 143 | 0x095E | int8 | 127 | 28 |  |  |
| 144 | 0x095F | int8 | 127 | 28 |  |  |
| 145 | 0x0960 | int8 | 127 | 28 |  |  |
| 146 | 0x0961 | int8 | 127 | 28 |  |  |
| 147 | 0x0962 | int8 | 127 | 28 |  |  |
| 148 | 0x0963 | int8 | 127 | 28 |  |  |
| 149 | 0x0964 | uint16 | 255 | 28 |  |  |
| 150 | 0x0965 | uint16 | 255 | 28 |  |  |
| 151 | 0x0966 | uint16 | 255 | 28 |  |  |
| 152 | 0x0967 | uint16 | 255 | 28 |  |  |
| 153 | 0x0968 | uint16_special | 255 | 28 |  |  |

## Monster Struct Layout (base: 0x02006D48)

Offsets are relative to the struct base pointer.

- `+0x0000` (uint16_special, max=255): field[99] field_99
- `+0x0020` (array_u16, max=4294967295): field[100] field_100
- `+0x0024` (array_u16, max=4294967295): field[101] field_101
- `+0x0068` (special_read, max=999): field[0] stat_pow
- `+0x006A` (special_read, max=999): field[1] stat_int
- `+0x006C` (special_read, max=999): field[2] stat_ski
- `+0x006E` (special_read, max=999): field[3] stat_spd
- `+0x0070` (special_read, max=999): field[4] stat_def
- `+0x0072` (special_read, max=999): field[5] stat_lif
- `+0x0074` (uint16, max=99): field[6] field_6
- `+0x0075` (uint16, max=99): field[7] field_7
- `+0x0076` (uint16, max=99): field[8] field_8
- `+0x0077` (uint16, max=99): field[9] field_9
- `+0x0078` (uint16, max=99): field[10] field_10
- `+0x0079` (uint16, max=99): field[11] field_11
- `+0x007A` (uint16, max=14): field[12] field_12
- `+0x007B` (uint16, max=255): field[13] field_13
- `+0x007E` (uint16, max=255): field[14] field_14
- `+0x0080` (uint16, max=255): field[15] field_15
- `+0x0082` (uint16, max=255): field[16] field_16
- `+0x0088` (uint16, max=11): field[18] field_18
- `+0x0089` (uint16, max=5): field[19] field_19
- `+0x008C` (array_u16, max=4294967295): field[20] field_20
- `+0x0090` (uint32, max=65535): field[21] field_21
- `+0x0094` (uint32, max=9999): field[22] amount_0x94
- `+0x0096` (int16, max=9999): field[23] amount_0x96
- `+0x0098` (uint16, max=8): field[24] field_24
- `+0x009A` (uint32, max=999): field[25] stat999_0x9A
- `+0x009C` (int8, max=15): field[26] flags_0x9C
- `+0x009E` (uint32, max=999): field[27] stat999_0x9E
- `+0x00A0` (uint32, max=999): field[28] stat999_0xA0
- `+0x00A2` (int8, max=100): field[29] pct_0xA2
- `+0x00A3` (uint16, max=100): field[30] field_30
- `+0x00A4` (int8, max=100): field[31] pct_0xA4
- `+0x00A5` (array_u32, max=9): field[32] field_32
- `+0x00A6` (array_u32, max=9): field[33] field_33
- `+0x00A7` (array_u32, max=9): field[34] field_34
- `+0x00A8` (array_u32, max=9): field[35] field_35
- `+0x00A9` (array_u32, max=9): field[36] field_36
- `+0x00AA` (array_u32, max=9): field[37] field_37
- `+0x00AB` (int8, max=10): field[38] level_0xAB
- `+0x00AC` (int8, max=10): field[39] level_0xAC
- `+0x00AD` (int8, max=10): field[40] level_0xAD
- `+0x00AE` (int8, max=10): field[41] level_0xAE
- `+0x00AF` (int8, max=10): field[42] level_0xAF
- `+0x00B0` (int8, max=10): field[43] level_0xB0
- `+0x00B1` (int8, max=100): field[44] pct_0xB1
- `+0x00B2` (int8, max=100): field[45] pct_0xB2
- `+0x00B3` (int8, max=100): field[46] pct_0xB3
- `+0x00B4` (uint16, max=100): field[47] field_47
- `+0x00B8` (array_u16, max=4): field[48] field_48
- `+0x00BC` (uint16, max=99): field[49] field_49
- `+0x00BD` (uint16, max=100): field[50] field_50
- `+0x00DC` (uint16, max=255): field[54] field_54
- `+0x00DD` (int8, max=127): field[55] field_55
- `+0x00DE` (uint32, max=999): field[56] stat999_0xDE
- `+0x00E0` (uint32, max=999): field[57] stat999_0xE0
- `+0x00E2` (uint32, max=999): field[58] stat999_0xE2
- `+0x00E4` (array_u16, max=9999999): field[59] field_59
- `+0x00E8` (uint32, max=999): field[60] stat999_0xE8
- `+0x00EA` (uint16, max=2): field[61] field_61
- `+0x00EB` (int8, max=10): field[62] level_0xEB
- `+0x00EC` (int8, max=10): field[63] level_0xEC
- `+0x00ED` (int8, max=10): field[64] level_0xED
- `+0x00EE` (int8, max=10): field[65] level_0xEE
- `+0x00EF` (int8, max=10): field[66] level_0xEF
- `+0x00F0` (int8, max=10): field[67] level_0xF0
- `+0x00F0` (uint32, max=9999): field[130] amount_0xF0
- `+0x00F1` (int8, max=10): field[68] level_0xF1
- `+0x00F2` (int8, max=10): field[69] level_0xF2
- `+0x00F2` (uint32, max=9999): field[131] amount_0xF2
- `+0x00F3` (int8, max=10): field[70] level_0xF3
- `+0x00F4` (int8, max=10): field[71] level_0xF4
- `+0x00F4` (uint32, max=9999): field[132] amount_0xF4
- `+0x00F5` (int8, max=10): field[72] level_0xF5
- `+0x00F6` (uint16, max=14): field[73] field_73
- `+0x00F7` (uint16, max=6): field[74] field_74
- `+0x00F8` (uint16, max=255): field[75] field_75
- `+0x00F8` (array_u16, max=99999999): field[133] field_133
- `+0x0100` (uint32, max=999): field[120] stat999_0x100
- `+0x0104` (uint16, max=30): field[107] field_107
- `+0x0105` (uint16, max=40): field[108] field_108
- `+0x0108` (uint16_special, max=255): field[77] field_77
- `+0x0128` (uint16_special, max=255): field[78] field_78
- `+0x0134` (array_u16, max=139): field[139] field_139
- `+0x0138` (uint32, max=140): field[140] field_140
- `+0x013C` (uint16_special, max=255): field[122] field_122
- `+0x0148` (array_u16, max=4294967295): field[79] field_79
- `+0x014C` (uint16, max=30): field[80] field_80
- `+0x014D` (uint16, max=40): field[81] field_81
- `+0x0150` (array_u16, max=4294967295): field[82] field_82
- `+0x0154` (uint16, max=11): field[83] field_83
- `+0x0155` (uint16, max=100): field[84] field_84
- `+0x0156` (uint16, max=14): field[85] field_85
- `+0x0157` (uint16, max=2): field[86] field_86
- `+0x0158` (uint16, max=1): field[87] field_87
- `+0x015A` (special_read, max=999): field[88] stat999_0x15A
- `+0x015C` (special_read, max=999): field[89] stat999_0x15C
- `+0x015C` (uint16, max=30): field[123] field_123
- `+0x015D` (uint16, max=40): field[124] field_124
- `+0x015E` (uint16_special, max=255): field[125] field_125
- `+0x017E` (uint16_special, max=255): field[126] field_126
- `+0x019E` (uint16, max=30): field[127] field_127
- `+0x019F` (uint16, max=40): field[128] field_128
- `+0x01A0` (uint16, max=100): field[129] field_129
- `+0x0478` (uint32, max=999): field[97] stat999_0x478
- `+0x047C` (uint16_special, max=255): field[92] field_92
- `+0x049C` (uint16, max=30): field[93] field_93
- `+0x049D` (uint16, max=40): field[94] field_94
- `+0x049E` (uint16, max=11): field[95] field_95
- `+0x095C` (uint16, max=1): field[141] field_141
- `+0x095D` (int8, max=127): field[142] field_142
- `+0x095E` (int8, max=127): field[143] field_143
- `+0x095F` (int8, max=127): field[144] field_144
- `+0x0960` (int8, max=127): field[145] field_145
- `+0x0961` (int8, max=127): field[146] field_146
- `+0x0962` (int8, max=127): field[147] field_147
- `+0x0963` (int8, max=127): field[148] field_148
- `+0x0964` (uint16, max=255): field[149] field_149
- `+0x0965` (uint16, max=255): field[150] field_150
- `+0x0966` (uint16, max=255): field[151] field_151
- `+0x0967` (uint16, max=255): field[152] field_152
- `+0x0968` (uint16_special, max=255): field[153] field_153