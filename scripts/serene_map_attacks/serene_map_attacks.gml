function create_map_laser(){
	var skill_layer_id = layer_get_id("skillsMeteor");
	randomize();
	var ran_x = irandom_range(150, 900);
	var ran_y = irandom_range(190, 229);
	var angle;
	var delay = irandom_range(0, 29)*0.09 + 0.81;
	if (ran_x < 400) angle = irandom_range(135, 155);
	else if (ran_x >= 400 && ran_x < 650) angle = irandom_range(110, 160);
	else angle = irandom_range(110, 135);
	var laser = instance_create_layer(ran_x, ran_y, skill_layer_id, oMobSkills, {
		sprite_index : s_serene_map_laser_0,
		image_speed : 10/9,
		image_angle : angle,
	});
	with (laser) {
		alarm[4] = delay*global.game_fps;
	}
	
	randomize();
	ran_x = irandom_range(932, 1682);
	ran_y = irandom_range(190, 229);
	delay = irandom_range(0, 29)*0.09 + 0.81;
	if (ran_x < 1182) angle = irandom_range(45, 70);
	else if (ran_x >= 1182 && ran_x < 1432) angle = irandom_range(20,70);
	else angle = irandom_range(25, 45);
	laser = instance_create_layer(ran_x, ran_y, skill_layer_id, oMobSkills, {
		sprite_index : s_serene_map_laser_0,
		image_speed : 10/9,
		image_angle : angle,
	});
	
	with (laser) {
		alarm[4] = delay*global.game_fps;
	}
}

//Serene noon map laser hit
function serene_noon_map_laser_hit(x, y) {
	var skillDmg = 0.1;
	var gotHit = false;
	var damageNumHeight = -180;
	var playerID = instance_place(x, y, oPlayer)
	//if (place_meeting(x, y, oPlayer)) gotHit = true;
	if (playerID != noone) gotHit = true

	if (gotHit) {
		addGuage(10);
		var dmg_number_1 = instance_create_layer(playerID.x, playerID.y + damageNumHeight, "dmg_num", oDmgskin2); // Dmg number on player
		var dmg_amount = floor(oPlayer.hp_max*skillDmg);
		oPlayer.hp -= dmg_amount; // Reduce player hp
		dmg_number_1.dmg = dmg_amount; // Damage number 

		var hitDirection = (oSerene.x >= oPlayer.x) ? -1 : 1;
		instance_create_layer(playerID.x, playerID.y, skill_layer_id, oMobSkills, {
			sprite_index : s_serene_map_laser_hit,
			image_speed : 10/6,
			image_xscale : hitDirection,
		});
		
		// Screen Flash after getting hit by noon laser
		if (instance_exists(oScreenFlashShort)) {
			if oScreenFlashShort.duration < 1.7 {
				oScreenFlashShort.duration += 0.24;
			}
		}
		else instance_create_layer(0, 0, "fma", oScreenFlashShort);
	}	
}


function create_map_bomb_data() {
	var skill_layer_id = layer_get_id("skills");
	var bombHeight = 815;
	var bomb_x = 130;
	
	//Time delay of bomb
	var time;
	
	//7 out of 8 bombs to appear
	randomize();
	var bombNotAppear = irandom_range(0, 7);
	
	//Roll to see if bombs will appear at the same time
	randomize();
	var allAppear = irandom_range(1, 20);
	
	// 15% chance for all bombs to appear together // 18
	if (allAppear >= 18) {
		time = 1; // for alarm to count down to 0
		for (var i = 0; i < 8; i++) {
			if (i == bombNotAppear) continue;
			instance_create_layer(bomb_x + i*250, bombHeight, skill_layer_id, oMobSkills, {
				sprite_index : s_serene_noon_map_bomb_warning,
				image_speed : 0,
				visible : false,
				bomb_delay : time,
			});
		}
	} 
	else {
		for (var i = 0; i < 8; i++) {
			if (i == bombNotAppear) continue;
			randomize();
			time = irandom_range(0, 40)*0.18;
			instance_create_layer(bomb_x + i*250, bombHeight, skill_layer_id, oMobSkills, {
				sprite_index : s_serene_noon_map_bomb_warning,
				image_speed : 0,
				visible : false,
				bomb_delay : time,
			});
		}
	}
}
