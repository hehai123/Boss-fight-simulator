function showdown_state1() {
	sprite_index = s_showdown;
	canTurn = false; //cannot change facing dirrection 
	
	// Friction
	landing_physics();
	air_friction();
	
	// Animation speed change
	if (floor(image_index) == 0) {
		image_speed = 10/6*att_speed_multiplier;
	}
	else if (floor(image_index) == 10) {
		image_speed = 10/24*att_speed_multiplier;
	}

	// Attack animation end 
	if (animation_end()) {
		if (down && !move_dir) {
			state = states.prone;
			image_index = 0;
			image_speed = 1;
			canTurn = 0;
		}
		else if (showDown1) {
			show_down();
		}
		else {
			state = states.idle;
			canTurn = 1;
			image_index = 0;
			image_speed = 1;
		}
	}
}