/// @description Player hit dmg skin

vsp = -20/global.game_fps;
alpha = 1; 

fade = false;
dmg = 0;

map_string = "0123456789";
bitmap_font = font_add_sprite_ext(s_dmg_skin2,map_string,false,-16); 

alarm[0] = global.game_fps*1;
alarm[1]= global.game_fps*0.5;