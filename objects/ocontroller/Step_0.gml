/// @description Insert description here

// Timer ===============================================
timer -= delta_time/1000000;
show_time = ceil(timer);
time_min = show_time div 60;
min_1 = time_min div 10;
min_2 = time_min mod 10;
time_sec = show_time mod 60;
sec_1 = time_sec div 10;
sec_2 = time_sec mod 10;

if (bindTimer > 0) {
	bindTimer -= delta_time/1000000;
	bindSec1 = bindTimer div 10;
	bindSec2 = bindTimer mod 10;
}

//Death counter
deathCounterNumber = oPlayer.lifes;

//Map Hazards
switch (currentPhase) {
	case "Noon":
		if (audio_sound_get_gain(BgmDawn) == 0) audio_stop_sound(BgmDawn);
		//if (time_source_exists(global.bombTimer)) {
		//	if (time_source_get_state(global.bombTimer) == time_source_state_stopped) {
		//		//Bomb spawns every 19.2s
		//		time_source_reconfigure(global.bombTimer, 19.2, time_source_units_seconds, create_map_bomb_data, [], -1);
		//		time_source_start(global.bombTimer);	
		//	}
		//}
		if (time_source_get_state(noonBoom) != time_source_state_active) {
			time_source_reconfigure(noonBoom, 19.2, time_source_units_seconds, create_map_bomb_data, [], -1);
			time_source_start(noonBoom);
		}
		if (time_source_get_state(noonLaser) != time_source_state_active) time_source_start(noonLaser);
		break;
	case "Sunset":
		if (audio_sound_get_gain(BGM_noon) == 0) audio_stop_sound(BGM_noon);
		sunsetSwordStartDelay--;
		if (sunsetSwordStartDelay < 0) {
			if (time_source_get_state(sunsetSword) != time_source_state_active) time_source_start(sunsetSword);
		}
		break;
	case "Midnight":
		if (audio_sound_get_gain(BgmSunset) == 0) audio_stop_sound(BgmSunset);
		midnightPillarStartDelay--;
		if (midnightPillarStartDelay < 0) {
			if (time_source_get_state(midnightPillars) != time_source_state_active) time_source_start(midnightPillars);
		}
		break;
	case "Dawn":
		if (time_source_get_state(summonWisps) != time_source_state_active) time_source_start(summonWisps);
		if (time_source_get_state(dawnSword) != time_source_state_active) time_source_start(dawnSword);
		break;
	case "Transition":
		//if (time_source_get_state(global.laserTimer) == time_source_state_active) time_source_stop(global.laserTimer);
		//if (time_source_get_state(global.bombTimer) == time_source_state_active) time_source_stop(global.bombTimer);
		time_source_stop(noonLaser);
		time_source_stop(noonBoom);
		if (time_source_get_state(sunsetSword) == time_source_state_active) time_source_stop(sunsetSword);
		if (time_source_get_state(midnightPillars) == time_source_state_active) time_source_stop(midnightPillars);
		if (time_source_get_state(summonWisps) == time_source_state_active) time_source_stop(summonWisps);
		if (time_source_get_state(summonWipsAgain) == time_source_state_active) time_source_stop(summonWipsAgain);
		if (time_source_get_state(dawnSword) == time_source_state_active) time_source_stop(dawnSword);
		break;
}

//Hp variables
mobHp = mobID.hp;
integerDigits = floor(mobHp/mobMaxHp*1000)/10;

// Keyboard key pressed
if (keyboard_check_pressed(global.quickSlot)) quickSlot();

if (isQuickSlotOpen) {
	if (quickSlotCurrentX > quickSlotOpenedX) {
		quickSlotCurrentX = Approach(quickSlotCurrentX, quickSlotOpenedX, quickSlotMoveSpeed);
		quickSlotX = gui_width + quickSlotCurrentX;
	}
}
else {
	if (quickSlotCurrentX < quickSlotClosedX) {
		quickSlotCurrentX = Approach(quickSlotCurrentX, quickSlotClosedX, quickSlotMoveSpeed);
		quickSlotX = gui_width + quickSlotCurrentX;
	}
}

// Changing quick slot key
if (global.settingQuickSlotKey) {
	if (keyboard_check_pressed(vk_anykey)) {
		for (var i = 0; i < 73; i++) {
			if (global.key_position[i][6] == keyboard_key) {
				for (var j = 0; j < 32; j++) {
					if (global.quickSlotPosition[j][2] == global.key_position[i][2]) {
						global.quickSlotPosition[j][2] = global.quickSlotPosition[global.selectedQuickSlotKey][2];
						global.quickSlotPosition[j][3] = global.quickSlotPosition[global.selectedQuickSlotKey][3];
						global.quickSlotPosition[j][4] = global.quickSlotPosition[global.selectedQuickSlotKey][4];
						global.quickSlotPosition[j][5] = global.quickSlotPosition[global.selectedQuickSlotKey][5];
						break;
					}
				}
				global.quickSlotPosition[global.selectedQuickSlotKey][2] = global.key_position[i][2];
				global.quickSlotPosition[global.selectedQuickSlotKey][3] = global.key_position[i][3];
				global.quickSlotPosition[global.selectedQuickSlotKey][4] = global.key_position[i][4];
				global.quickSlotPosition[global.selectedQuickSlotKey][5] = global.key_position[i][5];
				break;
			}
		}
	}
}





