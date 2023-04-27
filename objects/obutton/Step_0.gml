
if hover == true
{
	image_index = 1;
	left_click();
	if mouse_check_button_released(mb_left)
	{
		//global.show_keyboard = false;
		switch (sprite_index) {
			case sKeyChangeQuickSlot:
				if (!global.settingQuickSlot) global.settingQuickSlot = true;
				if (isClickable) {
					isClickable = false;
					with (oController) {
						isQuickSlotOpen = true;
					}
					instance_create_layer(quickSlotX, quickSlotY, "gui", oDisplay, {sprite_index : sKeyQuickSlotBg, type : "keyboardQuickSlot"});
					instance_create_layer(quickSlotX, quickSlotY, "gui_top", oButton, {sprite_index : sKeyQuickSlotChanged, type : "keyboardQuickSlot"});
					instance_create_layer(quickSlotX, quickSlotY, "gui_top", oButton, {sprite_index : sKeyQuickSlotCancel, type : "keyboardQuickSlot"});
				}
				break;
			case sKeyQuickSlotChanged:
				quickSlotChange();
				break;
			case sKeyQuickSlotCancel:
				quickSlotCancel();
				break;
			case sKeySave:
				quickSlotChange();
				global.show_keyboard = false
				break;
		}
	}
	
	if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) == false
	{
		hover = false;
		image_index = 2;
	}
}

else if hover == false 
{
	image_index = 2;
}

if global.show_keyboard == false
{
	if type == "keyboard"
	{
		instance_destroy();
	}
}


