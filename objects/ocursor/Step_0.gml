if state == mstate.normal
{
	sprite_index = s_cursor;
	image_speed = 1;
	
	if mouse_check_button_pressed(mb_left)
	{
		state = mstate.left_click;
	}
	
	//check if keyboard layout is open 
	if global.show_keyboard == true
	{
		for (var i = 0; i < 73; i++ )
		{
			//if mouse is inside the icon box 
			if point_in_rectangle(
			device_mouse_x_to_gui(0), 
			device_mouse_y_to_gui(0),
			x_final + global.key_position[i][0] -2,
			y_final + global.key_position[i][1] -3,
			x_final + global.key_position[i][0] -2 + 31,
			y_final + global.key_position[i][1] -3 + 31
			) 
			{
				state = mstate.hover;
			}
		}
		
		// check if mouse is hovering above a button 
		button_check = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oButton);
		if button_check != noone
		{
			state = mstate.clickable;
			with button_check
			{
				hover = true;
			}
		}
	}
	if (global.settingQuickSlot) {
		for (var i = 0 ; i < 32; i++) {	
			if (point_in_rectangle(
				device_mouse_x_to_gui(0), 
				device_mouse_y_to_gui(0),
				global.quickSlotPosition[i][0],
				global.quickSlotPosition[i][1],
				global.quickSlotPosition[i][0] + 31,
				global.quickSlotPosition[i][1] + 31
				)) {
					state = mstate.hover;
				}
		}
	}
}

else if state == mstate.hover
{
	sprite_index = s_cursor_close;
	if image_number == 0
	{
		image_speed = 0.4;
	}
	else if image_number == 1
	{
		image_speed = 1;
	}
	else 
	{
		image_speed = 0.5;
	}
	
	if global.show_keyboard == true
	{
		if mouse_check_button_pressed(mb_left)
		{
			for (var i = 0; i < 73; i++ )
			{
				if point_in_rectangle(
				device_mouse_x_to_gui(0), 
				device_mouse_y_to_gui(0),
				x_final + global.key_position[i][0] -2,
				y_final + global.key_position[i][1] -3,
				x_final + global.key_position[i][0] -2 + 31,
				y_final + global.key_position[i][1] -3 + 31
				) 
				{
					if global.key_position[i][3] == true 
					{
						mouse_hold = true;
						mouse_hold_item = global.key_position[i][4];
						mouse_hold_item_index = global.key_position[i][5];
						mouse_index = i;
						state = mstate.hold;
					}
				}
			}
		}
		
		// check if mouse is hovering above a button 
		button_check = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oButton);
		if button_check != noone 
		{
			state = mstate.clickable;
			with button_check
			{
				hover = true;
			}
		}
	}
	else if !global.show_keyboard
	{
		state = mstate.normal;
	}
	
	if (global.settingQuickSlot) {
		if (mouse_check_button_pressed(mb_left)) {
			for (var i = 0 ; i < 32; i++) {	
				if (point_in_rectangle(
					device_mouse_x_to_gui(0), 
					device_mouse_y_to_gui(0),
					global.quickSlotPosition[i][0],
					global.quickSlotPosition[i][1],
					global.quickSlotPosition[i][0] + 31,
					global.quickSlotPosition[i][1] + 31
					)) {
						global.settingQuickSlotKey = true;
						global.selectedQuickSlotKey = i;
					}
			}
		}
	}
}

else if state == mstate.hold
{
	sprite_index = s_cursor_close;
	image_speed = 0;
	image_index = 2;
	
	if !global.show_keyboard
	{
		state = mstate.normal;
	}
	else if global.show_keyboard && mouse_check_button_pressed(mb_left)
	{
		for (var i = 0; i < 73; i++)
		{
			if point_in_rectangle(
			device_mouse_x_to_gui(0), 
			device_mouse_y_to_gui(0),
			x_final + global.key_position[i][0] -2,
			y_final + global.key_position[i][1] -3,
			x_final + global.key_position[i][0] -2 + 31,
			y_final + global.key_position[i][1] -3 + 31
			) 
			{
				if global.key_position[i][3] == false
				{
					// removing icon from key settings
					if mouse_index <= 65 or mouse_index == 72 // any other keys
					{
						global.key_position[mouse_index][3] = false;
						global.key_position[mouse_index][4] = 0;
						global.key_position[mouse_index][5] = 0;
					}
					else if mouse_index == 66 or mouse_index == 67 // shift key
					{
						global.key_position[66][3] = false;
						global.key_position[66][4] = 0;
						global.key_position[66][5] = 0;
						global.key_position[67][3] = false;
						global.key_position[67][4] = 0;
						global.key_position[67][5] = 0;
					}
					else if mouse_index == 68 or mouse_index == 69 // ctrl key 
					{
						global.key_position[68][3] = false;
						global.key_position[68][4] = 0;
						global.key_position[68][5] = 0;
						global.key_position[69][3] = false;
						global.key_position[69][4] = 0;
						global.key_position[69][5] = 0;
					}
					else if mouse_index == 70 or mouse_index == 71 // alt key
					{
						global.key_position[70][3] = false;
						global.key_position[70][4] = 0;
						global.key_position[70][5] = 0;
						global.key_position[71][3] = false;
						global.key_position[71][4] = 0;
						global.key_position[71][5] = 0;
					}
					
					// adding icon to key settings 
					if i <= 65 or i == 72 // any other keys
					{
						global.key_position[i][3] = true;
						global.key_position[i][4] = mouse_hold_item;
						global.key_position[i][5] = mouse_hold_item_index;
					}
					else if i == 66 or i == 67 // shift key
					{
						global.key_position[66][3] = true;
						global.key_position[67][3] = true;
						global.key_position[66][4] = mouse_hold_item;
						global.key_position[67][4] = mouse_hold_item;
						global.key_position[66][5] = mouse_hold_item_index;
						global.key_position[67][5] = mouse_hold_item_index;
					}
					else if i == 68 or i == 69 // ctrl key
					{
						global.key_position[68][3] = true;
						global.key_position[69][3] = true;
						global.key_position[68][4] = mouse_hold_item;
						global.key_position[69][4] = mouse_hold_item;
						global.key_position[68][5] = mouse_hold_item_index;
						global.key_position[69][5] = mouse_hold_item_index;
					}
					else if i == 70 or i == 71 // alt key
					{
						global.key_position[70][3] = true;
						global.key_position[71][3] = true;
						global.key_position[70][4] = mouse_hold_item;
						global.key_position[71][4] = mouse_hold_item;
						global.key_position[70][5] = mouse_hold_item_index;
						global.key_position[71][5] = mouse_hold_item_index;
					}
					//Remove from quick slot 
					for (var j = 0; j < 32; j++) {
						if (global.quickSlotPosition[j][2] == global.key_position[mouse_index][2]) {
							global.quickSlotPosition[j][3] = global.key_position[mouse_index][3];
							global.quickSlotPosition[j][4] = global.key_position[mouse_index][4];
							global.quickSlotPosition[j][5] = global.key_position[mouse_index][5];
							break;
						}
					}
					//Add to quick slot
					for (var j = 0; j < 32; j++) {
						if (global.quickSlotPosition[j][2] == global.key_position[i][2]) {
							global.quickSlotPosition[j][3] = global.key_position[i][3];
							global.quickSlotPosition[j][4] = global.key_position[i][4];
							global.quickSlotPosition[j][5] = global.key_position[i][5];
							break;
						}
					}
					mouse_hold = false;
					mouse_hold_item = 0; 
					mouse_index = 0;
					state = mstate.normal;
				}
			}
		}
	}
	
}

else if state == mstate.clickable
{
	sprite_index = s_cursor_clickable;
	image_speed = 1/5;
	
	if mouse_check_button_pressed(mb_left)
	{
		state = mstate.left_click;
	}
	
	if !global.show_keyboard
	{
		state = mstate.normal;
	}
	
	if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oButton) == noone
	{
		state= mstate.normal;
	}
		
}

else if state == mstate.left_click
{
	sprite_index = s_cursor_left_click;
	image_speed = 0;
	
	if mouse_check_button(mb_left) == false 
	{
		state = mstate.normal;
	}
}
	
	

x = device_mouse_x_to_gui(0);
y = device_mouse_y_to_gui(0);




//if !global.show_keyboard exit;

//mousex = device_mouse_x_to_gui(0);
//mousey = device_mouse_y_to_gui(0);

