/// @description Dmg numbers

vsp = -20/global.game_fps;
alpha = 1;

fade = false;

b = power(10  ,9);
randomize();
dmg = irandom_range(9*b,11*b);

with (oSerene)
{
	hp -= oDamage1.dmg;
}

map_string = "0123456789KMB ";
b_digit = floor(dmg/1000000000);
m_digit = floor((dmg-b_digit*1000000000)/1000000);
k_digit = floor((dmg-b_digit*1000000000-m_digit*1000000)/1000); 
bitmap_font = font_add_sprite_ext(s_dmg_skin1,map_string,true,-10); 
