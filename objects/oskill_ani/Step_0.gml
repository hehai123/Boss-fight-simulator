switch (sprite_index) 
{
	case s_hook_push:
		image_speed = 10/9;
		break;
	
	case s_quadthrow_effect:
		image_alpha = 0.5;
		if (floor(image_index) == 0) {
			image_speed = 10/18*additional_multiplier;
		}
		else if (floor(image_index) == 1) {
			image_speed = 10/9*additional_multiplier;
		}
		else if (floor(image_index) == 6) image_speed = 10/6*additional_multiplier
		break;
	
	//Still affected by attack speed?
	case s_shadow_rush_special:
	case s_shadow_rush_effect:
	case s_shadow_leap_effect: 
	case s_blink_effect: 
		image_alpha = 0.3;
		image_speed = 10/6*additional_multiplier; //removed image speed multiplier as it is usless
		break;
	case sErdaNova:
		//image_alpha = 1;
		image_speed = 10/6*additional_multiplier;
		break;
	case s_quadthrow_hit:
		image_alpha = 0.1;
		image_speed = 10/6;
		break;
	case s_fuma_effect0:
	case s_fuma_effect:
		image_alpha = 0.2
		image_speed = 10/6*additional_multiplier;
		image_alpha = 1;
		break;
	
	case s_fuma_b1:
		image_alpha = 0.2
		image_speed = 10/6;
		if (keyboard_check(global.fuma)) {
			speed = 0;
			sprite_index = s_fuma_c1;
			image_index = 0;
			alarm[0] = 2*global.game_fps; //Continue spining for 2s
		}
		else if (point_distance(x, 0, finalPosX, 0) < speed) {
			speed = 0;
			x = finalPosX;
			sprite_index = s_fuma_c1;
			image_index = 0;
			alarm[0] = 2*global.game_fps; //Continue spining for 2s
		}
		break;
	case s_fuma_c1:
		image_alpha = 0.2
		image_speed = 10/4;
		break;
	case s_fuma_e1:
		image_alpha = 0.2;
		image_speed = 10/6;
		break;
	case s_fuma_hit:
		image_alpha = 0.2
		image_speed = 10/6;
		break;
	case s_serene_noon_laser_stun:
		image_speed = 10/6;
		break;
	case sGuagedEffect:
	case sErdaNovaDebuff:
		image_speed = 10/9;
		if (oSerene.isBound == false) instance_destroy();
		break;
	case sSereneNoonStabHit:
	case sSereneSunsetStabHit:
	case sSereneMidnightStabHit:
	case sSereneDawnStabHit:
	case sSereneNoonDashHit:
	case sSereneSunsetDashHit:
	case sSereneMidnightDashHit:
	case sSereneDawnDashHit:
	case sSereneSunsetAttack3Hit:
	case sSereneSunsetAttack4Hit:
	case sSereneSunsetAttack5Hit:
	case sSereneSunsetMapWallHit:
	case sSereneMidnightMapHit:
	case sSereneMidnightPushHit:
	case sSereneDawnDeerAttackHit:
	case sSereneDawnWispAttackHit:
	case sSereneDawnSwordHit:
	case sSereneDawnTouchHit:
	case sErdaNovaHit:
		image_speed = 10/6;
		break;
	case sSereneSunsetMapSwordHit:
	case s_showdown_hit:
		image_speed = 10/9;
		break;
	case s_showdown_a:
		image_alpha = 0.5;
		image_speed = 10/6*additional_multiplier;
		break;
	case sExplosiveShurikenBuff0:
		image_alpha = 0.2
		image_speed = 10/3*additional_multiplier;
		if (floor(image_index) >= 2) image_speed = 10/6*additional_multiplier;
		break;
	case sExplosiveShurikenBuff:
		image_alpha = 0.2
		image_speed = 10/72*additional_multiplier;
		if (floor(image_index) >= 1) image_speed = 10/6*additional_multiplier;
		break;
	case sSpreadThrow:
	case s_wind_jump_effect:
		image_alpha = 0.2
		image_speed = 10/12;
		break;
	case s_teleport_effect:
		image_alpha = 0.2
		image_speed = 10/3;
		if (floor(image_index) == 1) {
			image_speed = 10/6;
		}
		break;
}

if (follow == true) {	
	x = oPlayer.x;
	y = oPlayer.y;
}

if (animation_end()) {
	//if (sprite_index == s_fuma_b1 || sprite_index == s_fuma_c1) exit;
	//if (sprite_index == s_serene_noon_laser_stun) exit;
	switch (sprite_index) {
		case s_fuma_b1:
		case s_fuma_c1:
		case s_serene_noon_laser_stun:
		case sGuagedEffect:
			exit;
		case sErdaNovaDebuff:
			image_index = 7;
			exit;
	}
	
	instance_destroy();
}