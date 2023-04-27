global.game_fps = 144;
game_set_speed(global.game_fps, gamespeed_fps);
//window_set_fullscreen(true);

// Time Sources

//oController
//Bomb timer 
//global.bombTimer = time_source_create(time_source_game, 12, time_source_units_seconds, create_map_bomb_data, [], 1, time_source_expire_nearest);
//time_source_start(global.bombTimer);

//Laser timer 
//global.laserTimer = time_source_create(time_source_game, 10, time_source_units_seconds, create_map_laser, [], -1);
//time_source_start(global.laserTimer);

//Keyboard
global.show_keyboard = false;

// x, y, number, have icon, icon sprite
#region //key_position
var row_1 = 88;
var row_2 = 126;
var row_3 = 159;
var row_4 = 192;
var row_5 = 225;
var row_6 = 258;
global.key_position = [
	[31, row_1, 1, false, 0, 0, vk_escape], //ESC
	[97, row_1, 2, false, 0, 0, vk_f1], //F1
	[130, row_1, 3, false, 0, 0, vk_f2], //F2
	[163, row_1, 4, false, 0, 0, vk_f3], //F3
	[196, row_1, 5, false, 0, 0, vk_f4], //F4
	[246, row_1, 6, false, 0, 0, vk_f5], //F5
	[279, row_1, 7, false, 0, 0, vk_f6], //F6
	[312, row_1, 8, false, 0, 0, vk_f7], //F7
	[345, row_1, 9, false, 0, 0, vk_f8], //F8
	[394, row_1, 10, false, 0, 0, vk_f9], //F9
	[427, row_1, 11, false, 0, 0, vk_f10],//F10
	[460, row_1, 12, false, 0, 0, vk_f11], //F11
	[493, row_1, 13, false, 0, 0, vk_f12], //F12
	[568, row_1, 14, false, 0, 0, 145], //SIK
	[31, row_2, 15, false, 0, 0, 192], //`
	[31 + 33*1, row_2, 16, true, sExplosiveShurikenIcon, 0, ord("1")], //1
	[31 + 33*2, row_2, 17, false, 0, 0, ord("2")], //2
	[31 + 33*3, row_2, 18, false, 0, 0, ord("3")], //3
	[31 + 33*4, row_2, 19, false, 0, 0, ord("4")], //4
	[31 + 33*5, row_2, 20, false, 0, 0, ord("5")], //5
	[31 + 33*6, row_2, 21, false, 0, 0, ord("6")], //6
	[31 + 33*7, row_2, 22, false, 0, 0, ord("7")], //7
	[31 + 33*8, row_2, 23, false, 0, 0, ord("8")], //8
	[31 + 33*9, row_2, 24, false, 0, 0, ord("9")], //9
	[31 + 33*10, row_2, 25, false, 0, 0, ord("0")], //0
	[31 + 33*11, row_2, 26, false, 0, 0, 189], //-
	[31 + 33*12, row_2, 27, false, 0, 0, 187], //=
	[535, row_2, 28, false, 0, 0, vk_insert], //INS
	[535 + 33*1, row_2, 29, false, 0, 0, vk_home], //Hm
	[535 + 33*2, row_2, 30, false, 0, 0, vk_pageup], //Pup
	[80, row_3, 31, true, s_blink_icon, 0, ord("Q")], //Q
	[80 + 33*1, row_3, 32, false, 0, 0, ord("W")], //W
	[80 + 33*2, row_3, 33, false, 0, 0, ord("E")], //E
	[80 + 33*3, row_3, 34, false, 0, 0, ord("R")], //R
	[80 + 33*4, row_3, 35, false, 0, 0, ord("T")], //T
	[80 + 33*5, row_3, 36, false, 0, 0, ord("Y")], //Y
	[80 + 33*6, row_3, 37, false, 0, 0, ord("U")], //U
	[80 + 33*7, row_3, 38, true, sKeyboardIcons, 1, ord("I")], //I
	[80 + 33*8, row_3, 39, false, 0, 0, ord("O")], //O
	[80 + 33*9, row_3, 40, false, 0, 0, ord("P")], //P
	[80 + 33*10, row_3, 41, false, 0, 0, 219], //[
	[80 + 33*11, row_3, 42, true, sKeyboardIcons, 15, 221], //]
	[485, row_3, 43, true, sErdaNovaIcon, 0, 220], //\
	[535, row_3, 44, false, 0, 0, vk_delete], //Del
	[535 + 33*1, row_3, 45, true, s_fuma_icon, 0, vk_end], //End
	[535 + 33*2, row_3, 46, true, s_shadow_leap_icon, 0, vk_pagedown], //Pdn
	[96, row_4, 47, false, 0, 0, ord("A")], //A
	[96 + 33*1, row_4, 48, false, 0, 0, ord("S")], //S
	[96 + 33*2, row_4, 49, true, s_potion, 0, ord("D")], //D
	[96 + 33*3, row_4, 50, false, 0, 0, ord("F")], //F
	[96 + 33*4, row_4, 51, false, 0, 0, ord("G")], //G
	[96 + 33*5, row_4, 52, false, 0, 0, ord("H")], //H
	[96 + 33*6, row_4, 53, false, 0, 0, ord("J")], //J
	[96 + 33*7, row_4, 54, true, sKeyboardIcons, 9, ord("K")], //K
	[96 + 33*8, row_4, 55, false, 0, 0, ord("L")], //L
	[96 + 33*9, row_4, 56, false, 0, 0, 186], //;
	[96 + 33*10, row_4, 57, false, 0, 0, 222], //'
	[112, row_5, 58, true, s_spread_throw_icon, 0, ord("Z")], //Z
	[112 + 33*1, row_5, 59, true, s_spreadthrow, 0, ord("X")], //X
	[112 + 33*2, row_5, 60, true, s_showdown_icon, 0, ord("C")], //C
	[112 + 33*3, row_5, 61, true, s_shadow_rush_icon, 0, ord("V")], //V
	[112 + 33*4, row_5, 62, true, s_teleport_icon, 0, ord("B")], //B
	[112 + 33*5, row_5, 63, false, 0, 0, ord("N")], //N
	[112 + 33*6, row_5, 64, false, 0, 0, ord("M")], //M
	[112 + 33*7, row_5, 65, false, 0, 0, 188], //,
	[112 + 33*8, row_5, 66, false, 0, 0, 190], //.
	[55, row_5, 67, true, s_ropeconnect, 0, vk_shift], //Shift left
	[465, row_5, 67, true, s_ropeconnect, 0, vk_shift], //Shift right
	[40, row_6, 68, false, 0, 0, vk_control], //Ctrl left
	[485, row_6, 68, false, 0, 0, vk_control], //Ctrl right
	[138, row_6, 69, false, 0, 0, vk_alt], //Alt left 
	[384, row_6, 69, false, 0, 0, vk_alt], //Alt right
	[261, row_6, 70, true, sKeyboardIcons, 46, vk_space], //Space
	];
#endregion

//Binding keys
for (var i = 0; i < 73; i++) {
	if (global.key_position[i][3] == true) {	
		switch (global.key_position[i][4]) {
			case s_ropeconnect:
				global.rope_connect = global.key_position[i][6];
				break;
			case s_spreadthrow:
				global.quadthrow = global.key_position[i][6];
				break;
			case s_potion:
				global.pot = global.key_position[i][6];
				break;
			case s_showdown_icon:
				global.showdown = global.key_position[i][6];
				break;
			case s_spread_throw_icon:
				global.spreadthrow = global.key_position[i][6];
				break;
			case s_shadow_leap_icon:
				global.shadowleap = global.key_position[i][6];
				break;
			case s_shadow_rush_icon:
				global.shadowrush = global.key_position[i][6];
				break;
			case s_blink_icon:
				global.blink = global.key_position[i][6];
				break;
			case s_fuma_icon:
				global.fuma = global.key_position[i][6];
				break;
			case sErdaNovaIcon:
				global.erdaNova = global.key_position[i][6];
				break;
			case sExplosiveShurikenIcon:
				global.explosiveShuriken = global.key_position[i][6];
				break;
			case s_teleport_icon:
				global.teleport = global.key_position[i][6];
				break;
			case sKeyboardIcons:
				switch (global.key_position[i][5]) {
					case 15:
						global.quickSlot = global.key_position[i][6];
						break;
				}
				break;
		}
	}
}

//Key settings
//For quick slot
global.settingQuickSlot = false; //True if user is setting quick slot
global.settingQuickSlotKey = false; //True if user is setting quick slot key
global.selectedQuickSlotKey = -1; // Key that is selected, -1 for not setting

#region // Quick slot key position
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var quickSlotRowX = gui_width - 574 + 2 + 12;
var quickSlotColY1 = gui_height - 86 + 3 + 3;
var quickSlotColY2 = gui_height - 86 + 38 + 3;
//x pos, y pos, selected or not, image index for key label, icon, icon image index, selected or not
global.quickSlotPosition = [
[quickSlotRowX, quickSlotColY1, 67, false, 0, 0],
[quickSlotRowX + 35, quickSlotColY1, 28, false, 0, 0],
[quickSlotRowX + 35*2, quickSlotColY1, 29, false, 0, 0],
[quickSlotRowX + 35*3, quickSlotColY1, 30, false, 0, 0],
[quickSlotRowX + 35*4, quickSlotColY1, 16, false, 0, 0],
[quickSlotRowX + 35*5, quickSlotColY1, 17, false, 0, 0],
[quickSlotRowX + 35*6, quickSlotColY1, 18, false, 0, 0],
[quickSlotRowX + 35*7, quickSlotColY1, 19, false, 0, 0],
[quickSlotRowX + 35*8, quickSlotColY1, 20, false, 0, 0],
[quickSlotRowX + 35*9, quickSlotColY1, 21, false, 0, 0],
[quickSlotRowX + 35*10, quickSlotColY1, 22, false, 0, 0],
[quickSlotRowX + 35*11, quickSlotColY1, 23, false, 0, 0],
[quickSlotRowX + 35*12, quickSlotColY1, 24, false, 0, 0],
[quickSlotRowX + 35*13, quickSlotColY1, 25, false, 0, 0],
[quickSlotRowX + 35*14, quickSlotColY1, 54, false, 0, 0],
[quickSlotRowX + 35*15, quickSlotColY1, 55, false, 0, 0],
[quickSlotRowX, quickSlotColY2, 68, false, 0, 0],
[quickSlotRowX + 35, quickSlotColY2, 44, false, 0, 0],
[quickSlotRowX + 35*2, quickSlotColY2, 45, false, 0, 0],
[quickSlotRowX + 35*3, quickSlotColY2, 46, false, 0, 0],
[quickSlotRowX + 35*4, quickSlotColY2, 31, false, 0, 0],
[quickSlotRowX + 35*5, quickSlotColY2, 32, false, 0, 0],
[quickSlotRowX + 35*6, quickSlotColY2, 33, false, 0, 0],
[quickSlotRowX + 35*7, quickSlotColY2, 34, false, 0, 0],
[quickSlotRowX + 35*8, quickSlotColY2, 35, false, 0, 0],
[quickSlotRowX + 35*9, quickSlotColY2, 47, false, 0, 0],
[quickSlotRowX + 35*10, quickSlotColY2, 48, false, 0, 0],
[quickSlotRowX + 35*11, quickSlotColY2, 49, false, 0, 0],
[quickSlotRowX + 35*12, quickSlotColY2, 50, false, 0, 0],
[quickSlotRowX + 35*13, quickSlotColY2, 51, false, 0, 0],
[quickSlotRowX + 35*14, quickSlotColY2, 63, false, 0, 0],
[quickSlotRowX + 35*15, quickSlotColY2, 64, false, 0, 0],
];
#endregion