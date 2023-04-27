/// @description Dmg numbers

vsp = -20/global.game_fps;
alpha = 1;

alarm[0] = global.game_fps*0.5;
fade = false;

dmg = 0;
if (isDarkness) {
	dmg = 0;
}
else {
	b = power(10, 9);
	randomize();
	dmg = irandom_range(30*b,42*b);
}

oSerene.hp -= dmg;

map_string = "0123456789KMB ";
b_digit = floor(dmg/1000000000);
m_digit = floor((dmg-b_digit*1000000000)/1000000);
k_digit = floor((dmg-b_digit*1000000000-m_digit*1000000)/1000); 
bitmap_font = font_add_sprite_ext(s_dmg_skin1,map_string,true,-10); 
