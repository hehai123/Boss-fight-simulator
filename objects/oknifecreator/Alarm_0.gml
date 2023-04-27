/// @description Create star

if (knife_count > 0) {
	
	if (hit_mob == true) {
		//knife_create(knife_max_distance*face_dir, y_final, 0, x_distance, 0);
		knife_create(y_final, 0, x_distance, 0);
	}
	else {
		//knife_create(knife_max_distance*face_dir, y_final, 0, knife_max_distance, 0);
		knife_create(y_final, 0, knife_max_distance, 0);
	}
	
	if (spread_throw == true) {
		if (spread_hit_mob_1 == true) {
			knife_create(0, 1, spread_x_distance_1, spread_angle_1);
		}
		else if (spread_hit_mob_1 == false) {
			knife_create(0, 1, spread_knife_max_distance, spread_angle_1);
		}
		
		if (spread_hit_mob_2 == true) {
			knife_create(0, 2, spread_x_distance_2, spread_angle_2);
		}
		else if (spread_hit_mob_2 == false) {
			knife_create(0, 2, spread_knife_max_distance, spread_angle_2);
		}
		
		if (spread_hit_mob_3 == true) {
			knife_create(0, 3, spread_x_distance_3, spread_angle_3);
		}
		else if (spread_hit_mob_3 == false) {
			knife_create(0, 3, spread_knife_max_distance, spread_angle_3);
		}
	}
	
	knife_count --;
	alarm[0] = 0.09*screen_fps;
}

