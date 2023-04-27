//draw_text(100,100, "image_index " +string(y));
//draw_text(100,150, "state: " +string(state));
//draw_text(100,200, "global.skills_display: " + array_get(global.skills_display[0], 0));
//draw_text(100,250, "knife_face_dir: " +string(knife_face_dir));
//draw_text(100, 100, "dec_type: " +string(dec_type));
//draw_text(100,550, "testing: " +string(testing));


draw_sprite(s_Exp_back,0,0,rm_height-10);
draw_sprite(s_Exp_back,1,0,rm_height-10);

// Hp and Mp background
draw_sprite(s_Hp_Mp,1,rm_width/2+Hp_box_x,rm_height+Hp_box_y);

// Hp bar
draw_sprite_stretched(s_Hp,0,rm_width/2+Hp_box_x+24,rm_height+Hp_box_y+28, (hp_display/hp_max)*171, 13); 
// Mp bar
draw_sprite_stretched(s_Mp,0,rm_width/2+Hp_box_x+24,rm_height+Hp_box_y+44, (mp_display/mp_max)*171, 13); 

// HP and MP box cover 
draw_sprite(s_Hp_Mp,0,rm_width/2+Hp_box_x,rm_height+Hp_box_y);

// Hp and Mp numbers
draw_set_font(global.hpNumb);
draw_set_halign(fa_center);
draw_text(rm_width/2+8, rm_height+Hp_box_y+30, string(hp)+"/"+string(hp_max));
draw_text(rm_width/2+8, rm_height+Hp_box_y+46, string(mp)+"/"+string(mp_max));
draw_set_font(-1); //set back to default 
draw_set_halign(fa_left); //set back to default

// Char lv
draw_sprite(s_Lv,0,rm_width/2+Hp_box_x,rm_height+Hp_box_y);
draw_sprite(s_Lv_number,0,rm_width/2+Hp_box_x+20,rm_height+Hp_box_y);
draw_sprite(s_Lv_number,1,rm_width/2+Hp_box_x+28,rm_height+Hp_box_y);
draw_sprite(s_Lv_number,2,rm_width/2+Hp_box_x+36,rm_height+Hp_box_y);

//// Quick key 
//draw_sprite(s_quick_key,0,rm_width-327,rm_height-86);
//draw_sprite(s_quick_key,1,rm_width-327,rm_height-86);
//draw_sprite(s_quick_key_left,0,rm_width-325,rm_height-83);


