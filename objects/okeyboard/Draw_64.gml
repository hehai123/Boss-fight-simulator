/// @description draw keyboard layout

if(!global.show_keyboard) exit;

#region // Main keyboard UI
draw_sprite(
	key_background,
	0,
	x_final, 
	y_final);
	
draw_sprite(
	key_background2,
	0,
	x_final, 
	y_final);

draw_sprite(
	key_background3,
	0,
	x_final, 
	y_final);
#endregion

#region // Icon
for (var i=0; i<73; i++ )
{
	if global.key_position[i][3] == true
	{
		draw_sprite(
		global.key_position[i][4],
		global.key_position[i][5],
		x_final + global.key_position[i][0] -2, 
		y_final + global.key_position[i][1] -3);
	}
}
#endregion

//drawing key alphanumeric (top most layer)
for (var i = 0; i < 72; i++)
{
	draw_sprite(
		key_all,
		global.key_position[i][2] -1,
		x_final + global.key_position[i][0],
		y_final + global.key_position[i][1]
		);
}

// draw space word
draw_sprite(
		key_all,
		global.key_position[72][2] -1,
		x_final + global.key_position[72][0] -2,
		y_final + global.key_position[72][1]
		);