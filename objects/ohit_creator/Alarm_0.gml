/// @description Hit animation

if (count > 0) {
	var hit;
	randomize();
	var ran_x = irandom_range(-30,30);
	var ran_y = irandom_range(-30,30);
	if (spread == false) {
		//hit = instance_create_layer(monster_id.x + x_hit_location, y_hit_location, "mob_hit", oQuad_hit);
		hit = instance_create_layer(monster_id.x + x_hit_location + ran_x, y_hit_location + ran_y, "skills", oSkill_ani);
	}
	else {
		//hit = instance_create_layer(x_hit_location, y_hit_location, "mob_hit", oQuad_hit);
		hit = instance_create_layer(x_hit_location + ran_x, y_hit_location + ran_y, "skills", oSkill_ani);
	}
	//hit.image_xscale = face_dir;
	//hit.monster_id = monster_id;
	//hit.x_hit_location = x_hit_location;
	hit.sprite_index = s_quadthrow_hit;
	hit.follow = false;
	audio_play_sound(sound_quad_hit, 0, false);
	if (spread == false) {
		y_hit_location += y_change;
		if (y_hit_location > y_hit_min) {
			y_hit_location = y_hit_min;
		}
		alarm[0] = 0.09*screen_fps; // 0.09 for quad throw 
	}
	else {
		alarm[0] = 0.09*screen_fps; 
	}
	count --;
}
