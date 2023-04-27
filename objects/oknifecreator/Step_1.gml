/// @description Check if quad throw will hit

//checks if knife will hit or not
if (collision_check == false) {

	x_distance = knife_check(knife_max_distance, 0, 0);
	collision_check = true; // check only once
	
}

//check if spread throws will hit or not 
if (collision_check_spread == false && spread_throw == true) {
	
	spread_x_distance_1 = knife_check(spread_knife_max_distance, spread_angle_1, 1);
	spread_x_distance_2 = knife_check(spread_knife_max_distance, spread_angle_2, 2);
	spread_x_distance_3 = knife_check(spread_knife_max_distance, spread_angle_3, 3);

	collision_check_spread = true; // check only once
}
