/// @description Create star additional

if (knife_count_shadow > 0) {
	
	if (hit_mob == true) {
		knife_create(y_final, 0, x_distance, 0);
	}
	else {
		knife_create(y_final, 0, knife_max_distance, 0);
	}
	
	y_final += y_change;
	
	knife_count_shadow --;
	alarm[1] = 0.09*screen_fps;
}

