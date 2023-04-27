/// @description Insert description here

image_xscale = faceDir;

switch (state) {
	case states.idle:
		sprite_index = sSereneDawnWispSpawn;
		image_speed = 10/9;
		
		if (place_meeting(x, y, oPlayer)) {
			state = states.attack;
			image_index = 0;
			time_source_start(wispAttack);
		}
	
		if (animation_end()) {
			state = states.walk;
			image_index = 0;
		}
		break;
	case states.walk:
		sprite_index = sSereneDawnWispMove;
		image_speed = 10/6;
		
		if (oPlayer.x >= x)	faceDir = -1;
		else faceDir = 1;
		x -= hsp*faceDir;
		
		if (place_meeting(x, y, oPlayer)) {
			state = states.attack;
			image_index = 0;
			time_source_start(wispAttack);
		}
		break;
	case states.attack:
		sprite_index = sSereneDawnWispAttack;
		image_speed = 10/9;
		if (floor(image_index) >= 8) image_speed = 10/6;
	
		if (animation_end()) instance_destroy();
		break;
	case states.die:
		sprite_index = sSereneDawnWispDie;
		image_speed = 10/9;
		if (floor(image_index) >= 1) image_speed = 10/6;
		
		if (animation_end()) instance_destroy();
		break;
}










