if keyboard_check_pressed(ord("K"))
{
	if global.show_keyboard == false
	{
		audio_play_sound(MenuUp,1,false);
		//var ok_button = instance_create_layer(x_final + 470, y_final + 464, gui_layer, oButton); //x = 470, y = 464
		//with ok_button
		//{
		//	sprite_index = key_ok;
		//	//depth = -1;
		//	width = 82;
		//	height = 24;
		//	type = "keyboard";
		//}
		//var cancel_button = instance_create_layer(x_final + 559, y_final + 464, gui_layer, oButton);
		//with cancel_button
		//{
		//	sprite_index = key_cancel;
		//	//depth = -1;
		//	//width = 82;
		//	//height = 24;
		//	type = "keyboard";
		//}
		instance_create_layer(x_final, y_final, gui_layer, oButton, {sprite_index : sKeySave, type : "keyboard"});
		instance_create_layer(x_final, y_final, gui_layer, oButton, {sprite_index : sKeyReset, type : "keyboard"});
		instance_create_layer(x_final, y_final, gui_layer, oButton, {sprite_index : sKeyChangeQuickSlot, type : "keyboard"});
		instance_create_layer(x_final, y_final, gui_layer, oButton, {sprite_index : sKeyReset2, type : "keyboard"});
		instance_create_layer(x_final, y_final, gui_layer, oButton, {sprite_index : sKeyDeleteAll, type : "keyboard"});
	}
	else 
	{
		audio_play_sound(MenuDown,1,false);
	}
	global.show_keyboard = !global.show_keyboard;
}

// binding skills to keys
for (var i=0; i<73; i++ )
{
	if (global.key_position[i][3] == true)
	{	
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
			case s_shadow_rush_icon:
				global.shadowrush = global.key_position[i][6];
				break;
			case s_shadow_leap_icon:
				global.shadowleap = global.key_position[i][6];
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


