//Keyboard inputs from idle state
function input_check() {
	if (!global.settingQuickSlot) {
		switch(keyboard_key) {
			case global.showdown:
				show_down();
				break;
			case global.quadthrow:
				quad_throw();
				break;
			case global.shadowrush:
				shadow_rush();
				break;
			case global.shadowleap:
				shadow_leap();
				break;
			case global.spreadthrow:
				spreadThrow();
				break;
			case global.fuma:
				fumaShuriken();
				break;
			case global.explosiveShuriken:
				explosiveShuriken();
				break;
			case global.erdaNova:
				erdaNova();
				break;
			case global.rope_connect:
				ropeConnect();
				break;
			case vk_right:
			case vk_left:
				state = states.walk;
				image_index = 0
				break;
			case vk_space:
				jump_physics();
				break;
			case vk_down:
				if (isGrounded) state = states.prone;
				break;
			//case 0: //No keys pressed
			//	state = states.idle;
			//	image_index = 0;
			//	break;
		}
	}
}

//What to do after player animation ends 
function animation_end_check() {
	
	if (animation_end()) {
		image_speed = 1
		switch (keyboard_key){
			case global.showdown:
				show_down();
				break;
			case global.quadthrow:
				quad_throw();
				break;
			case global.shadowrush:
				shadow_rush();
				break;
			case global.shadowleap:
				shadow_leap();
				break;
			case vk_right:
			case vk_left:
				image_index = 0;
				image_speed = 1;
				if (isGrounded) {
					state = states.walk;	
				} else state = states.jump;
				break;
			case vk_space:
				jump_physics();
				break;
			case vk_down:
				if (isGrounded) state = states.prone;
				break;
			case 0: //No keys pressed
			default:
				if (isGrounded) {
					state = states.idle;
					image_index = 0;
				} else state = states.jump;
				break;
		}
	}
}

//Keyboard inputs from walking state
function input_check_walk() {
	switch(keyboard_lastkey) {
		case global.showdown:
			show_down();
			break;
		case global.quadthrow:
			quad_throw();
			break;
		case global.shadowrush:
			shadow_rush();
			break;
		case global.shadowleap:
			shadow_leap();
			break;
		case global.spreadthrow:
			spreadThrow();
			break;
		case global.fuma:
			fumaShuriken();
			break;
		case global.rope_connect:
			ropeConnect();
			break;
		case vk_right:
		case vk_left:
			state = states.walk;
			//image_index = 0
			break;
		case vk_space:
			jump_physics();
			break;
		case 0: //No keys pressed
			state = states.idle;
			no_turn = 1;
			image_index = 0;
			image_speed = 1;
			break;
	}
}