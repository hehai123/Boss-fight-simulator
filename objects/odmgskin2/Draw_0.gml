/// @description Draw hit dmg skin

draw_set_alpha(alpha); 
draw_set_halign(fa_center);
draw_set_font(bitmap_font);
draw_text(x,y, dmg);
draw_set_halign(fa_left); //set back to default
draw_set_alpha(1);
draw_set_font(-1);
