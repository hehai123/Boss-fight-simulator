/// @description Insert description here
// You can write your code in this editor

image_xscale = faceDir;

switch (state) {
	case states.idle:
		sprite_index = sSereneDawnDeerSpawn;
		image_speed = 10/9;
	
		if (animation_end()) {
			state = states.walk;
			image_index = 0;
		}
		break;
	case states.walk:
		sprite_index = sSereneDawnDeerMove;
		image_speed = 10/9;
		
		if (oPlayer.x >= x)	faceDir = -1;
		else faceDir = 1;
		x -= hsp*faceDir;
		
		if (place_meeting(x, y, oPlayer)) {
			state = states.attack;
			image_index = 0;
			time_source_start(deerAttack);
		}
		break;
	case states.attack:
		sprite_index = sSereneDawnDeerAttack;
		image_speed = 10/9;
		if (floor(image_index) >= 18) image_speed = 10/12;
	
		if (animation_end()) {
			state = states.walk;
			image_index = 0;
		}
		break;
	case states.die:
		sprite_index = sSereneDawnDeerDie;
		if (animation_end()) instance_destroy();
		break;
}






