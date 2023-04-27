function landing_physics() {
	
	// to be placed inside jump and stunned state
	if (isGrounded) 
	{
		if (just_landed)
		{
			if (abs(hsp) > max_land_speed)
			{
				//Probably not used // dec_type 2
				if dec_type == 2 && abs(hsp) > max_land_speed*3
				{
					hsp = move_speed*3*sign(hsp);
				}
				else
				{
					hsp = max_land_speed*sign(hsp);
				}
			}
			if move_dir == 0
			{
				hsp = Approach(hsp, 0, 60/global.game_fps); // minus of 60 from hsp 
			}
			if move_dir == -sign(hsp) && canTurn
			{
				hsp = 0;
			}
			just_landed = false;
			canWindJump = true;
			jump_counter = 0;
			//just_jumped = false;
		}
		
		if move_dir == 0 or !canTurn
		{
			if dec_type == 0 or dec_type == 2 // normal friction 
			{
				hsp = Approach(hsp, 0, dec_x);
			}
			else if dec_type == 1 // deceleration for normal jump landing 
			{
				hsp = Approach(hsp, 0, dec_x*2);
			}
			else if dec_type == 3 // deceleration for super knockback on ground
			{
				hsp = Approach(hsp, 0, dec_x*2.5);
			}
			walk_jump_counter = 0;
		}
	}
}


function jump_physics(){
	// to be placed inside idle, prone and walk state

	if isGrounded && key_jump && keyboard_lastkey == vk_space //key_jump 
	{
		state = states.jump;
		image_index = 0;
		dec_type = 1; // normal jump
		vsp -= jump_speed_final; //changed from = - to -=
		//If moving up
		//if (sign(vsp) == -1) vsp = min(-jump_speed_final, vsp);
		double_jump_delay = 10;
		
		// walk + jump 
		if move_dir != 0
		{
			if walk_jump_counter >= walk_jump_value 
			{
				hsp = move_speed*move_dir;
			}
			else 
			{
				hsp = move_speed*move_dir*0.8;
			}
		}
	}
	//else if !isGrounded
	//{
	//	state = states.jump;
	//	image_index = 0;
	//	dec_type = 1; // normal jump
	//}
}

function double_jump_physics(){
	
}

function air_friction(){
	// free fall movement 
	// to be placed inside jump and stunned state? 
	if !isGrounded
	{
		if canTurn
		{
			if move_dir != 0 // if pressing left or right 
			{
				if abs(hsp) < float_
				{
					hsp = Approach(hsp, move_dir*float_, float_force); // 2
				}
			}
			else if move_dir == 0 // if not pressing left or right 
			{
				if vsp < max_fall_speed 
				{
					hsp = Approach(hsp, 0, float_friction); // 0.01
				}
				else if vsp >= max_fall_speed
				{
					hsp = Approach(hsp, 0, float_friction_high); // 1 
				}
			}
		}
		else if !canTurn 
		{
			//if state == states.stunned
			//{
			//	hsp = Approach(hsp, 0, float_friction_high*10); // 10 (Should it be lowered?)
			//}
			//else if (state == states.attack_quadthrow || state == states.attack_showdown)
			//{
			//	if vsp < max_fall_speed 
			//	{
			//		hsp = Approach(hsp, 0, float_friction); // 0.01
			//	}
			//	else if vsp >= max_fall_speed
			//	{
			//		hsp = Approach(hsp, 0, float_friction_high); // 1 
			//	}
			//}
			if vsp < max_fall_speed 
			{
				hsp = Approach(hsp, 0, float_friction); // 0.01
			}
			else if vsp >= max_fall_speed
			{
				hsp = Approach(hsp, 0, float_friction_high); // 1 
			}
		}
	}
}