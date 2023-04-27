/// @description Insert description here

if (justBeforeFma) {
	justBeforeFma = false;
	switch(sprite_index) {
		case sSereneSunsetMapWallStand:
			sprite_index = sSereneSunsetMapWallDie;
			image_index = 0;
			alarm[7] = -1;
			break;
	}
}
else if (isFma) {
	isFma = false;
	switch(sprite_index) {
		case s_serene_map_laser_0:
		case s_serene_map_laser_1:
		case s_serene_map_laser_2:
		case s_serene_noon_omni_special:
		case s_serene_noon_map_bomb_warning:
		case sSereneSunsetMapObtacleStart:
		case sSereneSunsetMapSword:
		case sSereneMidnightMap:
		case sSereneDawnSword:
		case sSereneDawnCrabMove:
		case sSereneDawnCrabSpawn:
		case sSereneDawnCrabAttack:
			instance_destroy();
			break;
		case sSereneSunsetMapObtacleIng:
			sprite_index = sSereneSunsetMapObtacleEnd;
			image_index = 0;
			image_speed = 10/6;
			vspeed = 0;
	}
}

switch (sprite_index) {
	case sSereneSunsetMapObtacleIng: 
		vspeed = Approach(vspeed, vsp, 1/global.game_fps);
	
		if (place_meeting(x, y + vspeed, oPlayer))
		{
			while (abs(vspeed) > 0.1)
			{
				vspeed *= 0.5;
				if (!place_meeting(x, y + vspeed, oPlayer)) y += vspeed;
			}
			vspeed = 0;
			sprite_index = sSereneSunsetMapObtacleEnd;
			image_speed = 10/6;
			image_index = 0;
			
			var skillDmg = 0.4;
			var damageNumHeight = -120;
			addGuage(10);
			displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
			var hitDirection = (x >= oPlayer.x) ? 1 : -1;
			hitEffectOnPlayer(hitDirection, sSereneSunsetMapSwordHit);
		}
		else if (place_meeting(x, y + vspeed - 47, oTile))
		{
			while (abs(vspeed) > 0.1)
			{
				vspeed *= 0.5;
				if (!place_meeting(x, y + vspeed, oTile)) y += vspeed;
			}
			vspeed = 0;
			sprite_index = sSereneSunsetMapObtacleEnd;
			image_speed = 10/6;
			image_index = 0;
		}
		break;
	case sSereneSunsetMapSword:
		if (floor(image_index) == 9) image_speed = 10/9;
		else if (floor(image_index) == 19) image_speed = 10/6;
		break;
	case sSereneSunsetMapWallStand:
		sunsetFlameWallDuration--;
		if (sunsetFlameWallDuration <= 0) {
			sprite_index = sSereneSunsetMapWallDie;
			image_index = 0;
			alarm[7] = -1;
			//exit;
		}
		break;
	case sSereneMidnightMap:
		if (floor(image_index) == 12) image_speed = 10/9;
		break;
	case sSereneDawnCrabSpawn:
		image_speed = 10/6;
		if (time_source_get_state(dawnCrabAttack) != time_source_state_active) time_source_start(dawnCrabAttack);
		break;
	case sSereneDawnCrabMove:
		image_speed = 10/9;
		x -= image_xscale*150/global.game_fps;
		if (x <= -500 || x >= 2400) instance_destroy();
		break;
	case sSereneDawnCrabAttack:
		image_speed = 10/3;
		if (floor(image_index) == 1) image_speed = 10/6;
		else if (floor(image_index) >= 2) image_speed = 10/9;
		break;
}


if (animation_end()) {
	switch (sprite_index) {
		case sSereneSunsetMapObtacleStart:
			sprite_index = sSereneSunsetMapObtacleIng;
			image_index = 0;
			mask_index = sSereneSunsetMapObtacleMask;
			exit;
		case sSereneSunsetMapObtacleIng:
		case sSereneSunsetMapWallStand:
		case sSereneDawnCrabMove:
			exit;
		case sSereneSunsetMapWallRegen:
			sprite_index = sSereneSunsetMapWallStand;
			image_index = 0;
			alarm[7] = 0.5*global.game_fps;
			exit;
		case sSereneDawnCrabSpawn:
		case sSereneDawnCrabAttack:
			sprite_index = sSereneDawnCrabMove;
			image_index = 0;
			exit;
	}
	
	if (sprite_index == s_serene_fma_evade_prepare) {
		instance_create_layer(x, y, skill_layer_id, oMobSkills, {
			image_speed : 10/6,
			sprite_index : s_serene_fma_evade_effect,
		});
	}
	
	if (sprite_index == s_serene_fma_prepare) {
		instance_create_layer(x, y, skill_layer_id, oMobSkills, {
			image_speed : 10/6,
			sprite_index : s_serene_fma_effect,
		});	
	}
	
	if (sprite_index == s_serene_map_laser_0) {
		image_index = 7;
		exit;
	}
	
	if (sprite_index == s_serene_map_laser_1) {
		instance_create_layer(x, y, skill_layer_id, oMobSkills, {
			image_speed : 10/9,
			sprite_index : s_serene_map_laser_2,
			image_angle : image_angle,
			depth : depth,
		});	
		
		//Last damage tick
		serene_noon_map_laser_hit(x, y);
	}
	
	instance_destroy();
}