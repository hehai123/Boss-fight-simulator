//Create damage number and setting player hp accordingly
function displayDmgNum(x, y, skillDmg) {
	var layer_id = layer_get_id("dmg_num");
	var dmg_amount = floor(oPlayer.hp_max*skillDmg);
	var dmg_number = instance_create_layer(x, y, layer_id, oDmgskin2);
	oPlayer.hp -= dmg_amount; //Minus player's hp
	dmg_number.dmg = dmg_amount; //Setting damage number
}

function hitEffectOnPlayer(dir, sprite_index) {
	var xPos = oPlayer.bbox_left + (oPlayer.bbox_right - oPlayer.bbox_left)/2;
	var yPos = oPlayer.bbox_top + (oPlayer.bbox_bottom - oPlayer.bbox_top)/2;
	instance_create_layer(xPos, yPos, "skills", oSkill_ani, {
		sprite_index : sprite_index,
		image_xscale : dir,
		follow : false
	});
	
}

function knockBack(dir, duration, type) {
	with (oPlayer) {
		state = states.stunned;
		switch (type) {
			case 1: // Deer, crab
				if (isGrounded) { 
					hsp = -dir*1125/global.game_fps; // 125 + 800*1.25
					dec_type = 1;
				}
				else {
					hsp = -dir*1625/global.game_fps; //2125
					//vsp -= 300/global.game_fps;
					dec_type = 2;
				}
			break;
			case 2: // For dash
				if (isGrounded) { 
					hsp = -dir*(125 + 600*1.25)/global.game_fps;
					dec_type = 1;
				}
				else {
					hsp = -dir*(125 + 900*1.25)/global.game_fps;
					//vsp -= 300/global.game_fps;
					dec_type = 2;
				}
				break;
		}
		
		var stunDuration = duration*global.game_fps;
		if (alarm_get(0) < stunDuration) {
			alarm[0] = stunDuration;
		}
	}
}
	
function darknessDebuff() {
	with (oPlayer) {
		if (!isDarkness) {
			isDarkness = true;
			instance_create_layer(0, 0, "skills", oDebuffs, {sprite_index : sDebuffDarkness});
		}
		time_source_start(darknessTimer);
	}
}

function sunsetDebuff() {
	with (oPlayer) {
		if (!isSunsetStatus) {
			isSunsetStatus = true;
			instance_create_layer(0, 0, "skills", oDebuffs, {sprite_index : sSereneSunsetDisease});
		}
		time_source_start(sunsetStatusTimer);
	}
}