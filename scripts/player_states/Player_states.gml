function player_state_walk() {	
	sprite_index = s_walk;
	canTurn = true;

	if (keyboard_check_pressed(global.quadthrow)) quad_throw();
	else if (keyboard_check_pressed(global.showdown)) show_down();
	else if (keyboard_check_pressed(global.shadowleap)) shadow_leap();
	else if (keyboard_check_pressed(global.shadowrush)) shadow_rush();
	else if (keyboard_check_pressed(global.fuma) && canFuma) fumaShuriken();
	else if (keyboard_check(global.teleport)) teleport(true);
	
	// Normal walking friction + prone
	if move_dir != 0 && isGrounded
	{
		hsp = Approach(hsp, move_dir*move_speed, acc_x);
		walk_jump_counter ++;
	}
	else if move_dir = 0 && isGrounded
	{
		dec_type = 0;
		if down
		{
			state = states.prone;
			image_index = 0;
		}
		else
		{
			state = states.idle;
			image_index = 0;
		}
	}
	
	//input_check_walk();
	
	jump_physics();
	landing_physics();
}