/// @description Draw damage numebrs

draw_set_alpha(alpha); 
//draw_set_color(c_white);
draw_set_halign(fa_center);

if (isDarkness) draw_sprite(s_dmg_skin_miss, 0, x, y);
else {
	draw_set_font(bitmap_font);
	draw_text(x,y, string(b_digit) + "B " + string(m_digit) + "M " + string(k_digit) + "K");
	draw_set_halign(fa_left); //set back to default	
}

draw_set_alpha(1);
draw_set_font(-1); // set back to normal 
