if mouse_check_button_pressed(mb_left)
{
	if point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x+81, y+81, 78)
	{
		//relative click position 
		xx = x - device_mouse_x_to_gui(0);
		yy = y - device_mouse_y_to_gui(0);
		grab = true; 
	}
}

if grab == true
{
	x = device_mouse_x_to_gui(0) + xx;
	y = device_mouse_y_to_gui(0) + yy; 

	if mouse_check_button_released(mb_left)
	{
		grab = false;
	}
}
if keyboard_check_pressed(ord("M"))
{
	life -= 1;
	var life_gone_animation = instance_create_layer(0, 0, "Instances_1", oGUI_animation);
	with life_gone_animation
	{
		//sprite_index = s_life_middle;
		image_speed = 10/9;
		x = oLife.x;
		y = oLife.y;
		depth = -1;
	}
}

