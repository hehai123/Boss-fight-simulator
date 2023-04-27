/// @description For any skill animation or effect

//depth = 2; //questionable

image_speed_multiplier = 1; 

additional_multiplier = oPlayer.att_speed_multiplier;

// follow = false; see if skill animation follows player or not 

//image_xscale = oPlayer.face_dir*-1;

//For Fuma Shuriken
finalPosX = 0; //X ending location

if (sprite_index == s_fuma_b1) {
	alarm[1] = 0.1*global.game_fps;
	mask_index = s_fuma_b1;
}

switch (sprite_index) {
	case sExplosiveShurikenHit1:
		image_alpha = 0.1;
		image_speed = 10/9*additional_multiplier;
		break;	
}


