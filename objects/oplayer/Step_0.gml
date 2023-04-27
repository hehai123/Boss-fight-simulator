// keyboard checks for optimisation 

move_dir = keyboard_check(vk_right) - keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
down = keyboard_check(vk_down);
quadThrow = keyboard_check_pressed(global.quadthrow);
quadThrow1 = keyboard_check(global.quadthrow);
showDown = keyboard_check_pressed(global.showdown);
showDown1 = keyboard_check(global.showdown); 


//var move = move_dir*move_speed;

//isGrounded = place_meeting(x,y+1,oTile);

var vcollide = instance_place(x, y+1, oTile);
if vcollide != noone
{
	if vcollide.type == 1
	{	
		isGrounded = true; 
	}
	
	if vcollide.type == 2 && !place_meeting(x, y, oTile)
	{
		isGrounded = true; 
	}
}
else 
{
	isGrounded = false;
}

if !place_meeting(x, y+1, oTile)
{
	double_jump_delay--;
}


//=================== face dirrection ==================================
if move_dir == 1 && canTurn
{
	face_dir = 1;
}
else if move_dir == -1 && canTurn
{
	face_dir = -1;
}

image_xscale = face_dir;
//=================== face dirrection ==================================

#region // idle state
if (state == states.idle)
{
	sprite_index = s_stand;
	image_speed = 1;
	canTurn = true;
	
	input_check();
	
	// Double jump landing friction 
	landing_physics();
}
#endregion

else if state == states.walk
{
	player_state_walk();
}

else if (state == states.jump)
{
	canTurn = true;
	sprite_index = s_jump;
	just_landed = true;
	
	// attack skills
	if (quadThrow) {
		quad_throw();
	}
	else if (showDown) {
		show_down();
	}
	else if keyboard_check_pressed(global.shadowrush) {
		shadow_rush();
	}
	else if keyboard_check_pressed(global.shadowleap) {
		shadow_leap();
	}
	else if keyboard_check_pressed(global.blink) {
		blink();
	}
	else if (keyboard_check_pressed(global.erdaNova)) {
		if (canErdaNova) erdaNova();
	}
	else if (keyboard_check_pressed(global.teleport)) {
		if (keyboard_check(vk_down)) teleportDown();
		else if (keyboard_check(vk_left) || keyboard_check(vk_right)) teleport(false);
	}
	
	// Double Jump
	if !isGrounded
	{
		if (keyboard_check(vk_up) && keyboard_check_pressed(vk_space)) {
			if (canWindJump) windJump();
		}
		else if double_jump_delay < double_jump_delay_value && keyboard_check_pressed(vk_space) && jump_counter < number_of_double_jump
		{
			if ((oTile.y - y) > double_jump_min_height)
			{
				//If moving up, allow higher jumps
				if (sign(vsp) == -1) vsp = min(-double_jump_spd_y, vsp);
				//If dropping
				else if (sign(vsp) == 1) vsp -= double_jump_spd_y;
				//vsp -= max(double_jump_spd_y, -vsp);
				hsp = double_jump_spd_x*face_dir;
				audio_play_sound(sound_flash_jump, 0, false);
				jump_counter++; 
				
				instance_create_layer(x, y, "skills", oSkill_ani, {sprite_index : s_flash_jump, follow : false});
			}
		}
	}
	
	// Double Jump land
	if isGrounded 
	{
		if move_dir == 0
		{
			if down
			{
				state = states.prone;
				image_index = 0;
				canTurn = false;
			}
			else 
			{
				state = states.idle;
				image_index = 0;
			}
		}
		else if move_dir != 0
		{
			state = states.walk;
			image_index = 0;
		}
	}
	if jump_counter != 0
	{
		dec_type = 0;
	}
	else 
	{
		dec_type = 1;
	}
}

else if state == states.prone
{
	sprite_index = s_prone;
	mask_index = s_prone;
	canTurn = false; 
	
	// Normal friction
	landing_physics();
	
	if isGrounded && down && key_jump
	{
		ds_list_clear(platform_list);
		collision_line_list(x,y,x,y+2000,oTile,false,true,platform_list,true);
		if platform_list[|0].type == 2
		{
			with (platform_list[|0]) {
				type = 3; // doesn't check for collision with player 
				alarm[0] = game_fps*0.4;
			}
			hsp = 0;
			state = states.jump;
			image_index = 0;
			vsp = -key_jump*jump_speed_final*down_jump_multiplier;
			just_jumped = true;
			double_jump_delay = 10;
			canTurn = true;
		}
	}
	else if (quadThrow)
	{
		mask_index = s_stand;
		quad_throw();
	}
	if keyboard_check_released(vk_down)
	{
		mask_index = s_stand;
		state = states.idle;
		canTurn = true;
	}
}

else if (state == states.attack_quadthrow)
{
	sprite_index = s_quad_throw;
	canTurn = false; //cannot change facing dirrection 
	
	// Friction
	landing_physics();
	air_friction();
	
	// Animation speed change
	if floor(image_index) == 0
	{
		image_speed = 10/9*att_speed_multiplier;
	}
	else if floor(image_index) == 7
	{
		image_speed = 10/15*att_speed_multiplier;
	}

	// Attack animation end 
	if animation_end()
	{
		if down && !move_dir
		{
			state = states.prone;
			image_index = 0;
			image_speed = 1;
			canTurn = false;
		}
		else if (quadThrow1) // keyboard_check 
		{
			quad_throw();
		}
		else
		{
			state = states.idle;
			canTurn = true;
			image_index = 0;
			image_speed = 1;
		}
	}
}

else if (state == states.attack_showdown) {
	showdown_state();
}

else if (state == states.in_animation) {
	
	canTurn = false; //Cannot change face dirrection
	
	// Friction
	landing_physics();
	air_friction();
	
	//Shadow rush affects hsp and vsp which is why it is placed below friction
	switch (aniType) {
		case "shadowRush":
			shadow_rush_state();
			break;
		case "shadowLeap":
			shadow_leap_state();
			break;
		case "showdown":
			showdown_state();
			break;
		case "quadthrow":
			quadthrow_state();
			break;
		case "fumaShuriken":
			fumaShurikenState();
			break;
		case "erdaNova":
			erdaNovaState();
			break;
		case "explosiveShuriken":
			explosiveShurikenState();
			break;
		case "spreadThrow":
			spreadThrowState();
			break;
	}
	
	// Animation end
	animation_end_check();
}

else if (state == states.blink) {
	
	sprite_index = s_fly;
	//air_friction();
	
	if (move_dir != 0) { 
		blinkMoving = true;
		image_index = 0;
		if (keyboard_check(vk_up)) {
			vsp = -blinkSpeed/2;
			hsp = blinkSpeed*move_dir/2;
		}
		else if (keyboard_check(vk_down)) {
			vsp = blinkSpeed/2;
			hsp = blinkSpeed*move_dir/2;
		}
		else { 
			vsp = 0;
			hsp = blinkSpeed*move_dir;
		}
	}
	else {
		if (keyboard_check(vk_up)) {
			blinkMoving = true;
			image_index = 0;
			vsp = -blinkSpeed;
			hsp = 0;
		}
		else if (keyboard_check(vk_down)) {
			blinkMoving = true;
			image_index = 0;
			vsp = blinkSpeed;
			hsp = 0;
		}
		else { 
			if (blinkMoving) {
				blinkMoving = false;
				blinkNoMoveCounter = 0;
				blink_y = y;
			}
			image_index = 1;
			vsp = 0;
			hsp = 0;
			y = blink_y - blinkFloatVar*(cos(degtorad(blinkNoMoveCounter*360/global.game_fps)) -1);
			blinkNoMoveCounter ++;
		}
	}
	

	if (keyboard_check_released(global.blink)) {
		state = states.jump;
		grv = 2000/sqr(global.game_fps);
		blinkMoving = false
		if (time_source_get_state(global.blinkDuration) == time_source_state_active) {
			time_source_stop(global.blinkDuration);
		}
	}
}

else if state == states.stunned 
{	
	if (time_source_get_state(global.blinkDuration) == time_source_state_active){
		blinkMoving = false
		sprite_index = s_fly
		if (keyboard_check_released(global.blink)) {
			grv = 2000/sqr(global.game_fps);
			time_source_stop(global.blinkDuration);
		}
	}
	sprite_index = s_alert;
	canTurn = false;
	move_dir = 0; 

	air_friction();
	landing_physics();
}

// ================ Rope connect ========================== 
else if state == states.ropeconnect
{
	hsp = 0;
	canTurn = 0;
	if rope_length <= rope_length_max
	{
		rope_length += rope_connect_speed_extend; //rmb to adjust accrodingly
		rope_length_1 = rope_length;
	}
	else if rope_length > rope_length_max && rope_state == 0
	{
		audio_play_sound(sound_ropeconnect,1,false);
		instance_create_layer(x,y, "Instances_1", oSkill_ani, 
		{
			sprite_index : s_hook_push,
			depth : 2,
			image_alpha : 0.5,
			follow : false,
		});
		rope_state = 1; // rope to retract upwards
	}
	if rope_state == 1 // rope retracting 
	{
		sprite_index = s_jump;
		if rope_length_1 >= 40 // 60
		{	
			vsp = -rope_lift_speed;
		}
		if rope_length_1 > 0
		{
			rope_length_1 -= rope_connect_speed_retract; //rmb to adjust accrodingly
		}
		if hooked_platform.y >= y //rope_length_1 <= 39
		{
			state = states.idle;
			image_index = 0;
			image_speed = 1;
			canTurn = true;
			dec_type = 1; 
		}
	}
}

// Gravity 
if vsp < max_fall_speed
{
	vsp = Approach(vsp, max_fall_speed, grv);
}

if place_meeting(x, y+vsp, oTile)
{
	var vcollidee = instance_place(x,y+vsp,oTile)
	if (vsp > 0)
	{
		if (vcollidee.type == 1)
		{
			while (abs(vsp) > 0)
			{
				vsp *= 0.5;
				if (!place_meeting(x, y+vsp, oTile))
				{
					y += vsp;
				}
			}
			vsp = 0;
		}
		else if (vcollidee.type == 2) {
			if (!place_meeting(x, y, oTile)) {// if not inside the platform
				while (abs(vsp) > 0) {
					vsp *= 0.5;
					if (!place_meeting(x, y+vsp, oTile)) {
						y += vsp;
					}
				}
				vsp = 0;
			}
		}
	}
}

//if keyboard_check_pressed(ord("E"))
//{
//	y = 124;
//	vsp = 0;
//}

//if keyboard_check_pressed(ord("T"))
//{
//	hsp = 1125/global.game_fps;
//	just_landed = true;
//	dec_type = 2;
//}
//if keyboard_check_pressed(ord("R"))
//{
//	hsp = -2125/global.game_fps;
//	just_landed = true;
//	dec_type = 2;
//}

//if keyboard_check_pressed(ord("Y"))
//{
//	lifes--;
//}

if place_meeting(x + hsp, y, oWall)
{
	var hsp_final = hsp;
	
	while (abs(hsp_final) > 0.1)
	{
		hsp_final *= 0.5;
		if (!place_meeting(x + hsp_final, y, oWall))
		{
			x += hsp_final;
		}
	}
	hsp = 0;
}

x += hsp; 
y += vsp;

// Potion
if keyboard_check_pressed(global.pot)
{
	hp = hp_max;
	mp = mp_max;
}

// Hp and Mp display 
if hp_display != hp
{
	hp_display = lerp(hp_display,hp,display_acc);
}
if mp_display != mp
{
	mp_display = lerp(mp_display,mp,display_acc);
}
