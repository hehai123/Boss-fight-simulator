/// @description Drawing cursor
//draw_text(100,100, "button_check = " +string(button_check));
//draw_text(100,250, "mouse x = " +string(device_mouse_x_to_gui(0)));
//draw_text(100,300, "mouse y = " +string(device_mouse_y_to_gui(0)));

if mouse_hold == true
{
	draw_sprite_ext(mouse_hold_item, mouse_hold_item_index, x-16, y-16, 1, 1, 0, c_white, 0.5);
}

draw_self();