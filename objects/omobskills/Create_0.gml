/// @description Insert description here

skill_layer_id = layer_get_id("skills");
isFma = false;
justBeforeFma = false;

//canSound = true;

switch (sprite_index) {
	case s_serene_map_laser_0:
		audio_play_sound(sound_serene_map_laser_prepare, 1, false);
		break;
	case s_serene_map_laser_1: 
		audio_play_sound(sound_serene_map_laser_loop, 1, false);
		//Check if player is in laser's hitbox and damage
		serene_noon_map_laser_hit(x, y);
	
		alarm[3] = 0.24*global.game_fps;
		tick_count = 5;
		break;
	case s_serene_map_laser_2:
		audio_play_sound(sound_serene_map_laser_end, 1, false);
		break;
	case s_serene_noon_map_bomb_warning:
		//Bomb appear
		alarm[1] = bomb_delay*global.game_fps;
		break;
	case s_serene_noon_omni_special:
		//Hit player at the right timing
		alarm[0] = 1.32*global.game_fps;
		break;
	case sSereneSunsetMapSword:
		//Sword appear
		alarm[5] = swordDelay*global.game_fps;
		break;
	case sSereneMidnightMap:
		//Pillar appear
		alarm[8] = spawnDelay*global.game_fps;
		break;
	case sSereneDawnSword:
		alarm[10] = dawnSwordDelay*global.game_fps;
		break;
}	
////Noon map laser
//if (sprite_index == s_serene_map_laser_0) {
//	audio_play_sound(sound_serene_map_laser_prepare, 1, false);
//}
//if (sprite_index == s_serene_map_laser_1) {
//	audio_play_sound(sound_serene_map_laser_loop, 1, false);
	
//	//Check if player is in laser's hitbox and damage
//	serene_noon_map_laser_hit(x, y);
	
//	alarm[3] = 0.24*global.game_fps;
//	tick_count = 5;
//}
//if (sprite_index == s_serene_map_laser_2) {
//	audio_play_sound(sound_serene_map_laser_end, 1, false);
//}

////Noon map bomb appear timing
//if (sprite_index == s_serene_noon_map_bomb_warning) {
	
//	//Bomb appear
//	alarm[1] = bomb_delay*global.game_fps;
//}

////Serene omni laser
//if (sprite_index == s_serene_noon_omni_special) {
	
//	//Hit player at the right timing
//	alarm[0] = 1.32*global.game_fps;
//}

//For obtacle atom
randomize();
inGameSpeed = irandom_range(20, 60);
vsp = (150 + (inGameSpeed - 100)*1.25)/global.game_fps;

//For dawn crab
dawnCrabAttack = time_source_create(time_source_game, 2.7, time_source_units_seconds, function() {
	sprite_index = sSereneDawnCrabAttack;
	image_index = 0;
	time_source_start(dawnCrabHit);
}, [], -1);
dawnCrabHit = time_source_create(time_source_game, 0.09, time_source_units_seconds, function () {
	var skillDmg = 0.35;
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	if (place_meeting(x, y, oPlayer)) gotHit = true;
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
		//addGuage(10);
		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		knockBack(hitDirection, 1.5, 1); //stunned for 1.5s
		hitEffectOnPlayer(hitDirection, sSereneDawnCrabHit);
	}
}, [], 1, time_source_expire_nearest);