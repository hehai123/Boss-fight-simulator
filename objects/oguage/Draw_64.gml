/// @description Drawing guage
//draw_set_color(c_black);
//draw_text(100, 500, "ArrowAngle : " + string(arrowAngle));
//draw_text(100, 530, string(sunsetStartAngle));
//draw_text(100, 560, string(midnightStartAngle));
//draw_text(100, 590, string(dawnStartAngle));
//draw_text(100, 620, string(noonStartAngle));
//draw_set_color(c_white);

draw_sprite(s_serene_UI_bg, 0, x, y);
//draw_circle(x, y, 2, 1); //For testing only 

//Midnight
draw_sprite_general(
		s_serene_UI_color, 
		3,
		49,
		0,
		49,
		98,
		x + 49*sin(degtorad(midnightStartAngle)) + UI_x_offset,
		y - 49*cos(degtorad(midnightStartAngle)) + UI_y_offset,
		1,
		1,
		-midnightStartAngle,
		c_white,
		c_white,
		c_white,
		c_white,
		1
);

// Dawn
draw_sprite_general(
		s_serene_UI_color, 
		0,
		49,
		0,
		49,
		98,
		x + 49*sin(degtorad(dawnStartAngle)) + UI_x_offset,
		y - 49*cos(degtorad(dawnStartAngle)) + UI_y_offset,
		1,
		1,
		-dawnStartAngle,
		c_white,
		c_white,
		c_white,
		c_white,
		1
);

// Noon
draw_sprite_general(
		s_serene_UI_color, 
		1,
		49,
		0,
		49,
		98,
		x + 49*sin(degtorad(noonStartAngle)) + UI_x_offset,
		y - 49*cos(degtorad(noonStartAngle)) + UI_y_offset,
		1,
		1,
		-noonStartAngle,
		c_white,
		c_white,
		c_white,
		c_white,
		1
);

// Sunset 1 
draw_sprite_general(
		s_serene_UI_color, 
		2,
		49,
		49,
		49,
		49,
		x + UI_x_offset,
		y + UI_y_offset ,
		1,
		1,
		-sunsetStartAngle,
		c_white,
		c_white,
		c_white,
		c_white,
		1
);

// Sunset 2
draw_sprite_general(
		s_serene_UI_color, 
		2,
		49,
		49,
		49,
		49,
		x + UI_x_offset,
		y + UI_y_offset,
		1,
		1,
		-sunset2_start,
		c_white,
		c_white,
		c_white,
		c_white,
		1
);

//Guage outer circumference 
draw_sprite(s_serene_UI_bg2, 0, x, y-1);

//Guage border
draw_sprite_ext(s_serene_UI_border, 0, x + UI_x_offset, y + UI_y_offset, 1, 1, -dawnStartAngle, c_white, 1);
draw_sprite_ext(s_serene_UI_border, 0, x + UI_x_offset, y + UI_y_offset, 1, 1, -noonStartAngle, c_white, 1);
draw_sprite_ext(s_serene_UI_border, 0, x + UI_x_offset, y + UI_y_offset, 1, 1, -sunsetStartAngle - 90, c_white, 1);
draw_sprite_ext(s_serene_UI_border, 0, x + UI_x_offset, y + UI_y_offset, 1, 1, -midnightStartAngle, c_white, 1);

//Guage Arrow
draw_sprite_ext(s_serene_UI_arrow, 0, x + UI_x_offset, y + UI_y_offset, 1, 1, -arrowAngle, c_white, 1);

//Guage inner circle
draw_sprite(s_serene_UI_bg3, 0, x+1, y-1);

//Guage amount
draw_sprite_part(s_serene_UI_guage, 0, 0, guageToPixel, guageWidth, guageWidth - guageToPixel, x + guageOffsetX, y + guageOffsetY + guageToPixel);