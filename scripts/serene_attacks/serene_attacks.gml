function noon_laser_attack(face_direction = oSerene.face_direction, x = oSerene.x ,y = oSerene.y) {
	var skillDmg = 0.35;
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	//Create laser beam
	instance_create_layer(x, y, skill_layer_id, oMobSkills, {
		image_xscale : face_direction,
		image_speed : 10/6,
		sprite_index : s_serene_noon_laser_ani 
	});
	
	//Facing left
	if (face_direction == 1) {
		if (collision_rectangle(x - 1850, y - 100, x - 10, y - 45, oPlayer, false, true)) gotHit = true;
	}
	//Facing right
	else if (face_direction == -1) {
		if (collision_rectangle(x + 10, y - 100, x + 1850, y - 45, oPlayer, false, true)) gotHit = true;
	}
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
		addGuage(30);
		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, s_serene_noon_laser_hit);
		var stunEffect = instance_create_layer(oPlayer.x, oPlayer.y, skill_layer_id, oSkill_ani, {
			sprite_index : s_serene_noon_laser_stun,
			image_xscale : hitDirection,
		});
		
		with (oPlayer) {
			var stunDuration = sereneLaserStunDuration*global.game_fps
			state = states.stunned;
			sereneLaserStunned = true;
			if (alarm_get(0) < stunDuration) {
				alarm[0] = stunDuration;
			}
			//time_source_start(laserStunTimer);
		}

		stunEffect.alarm[2] = oPlayer.sereneLaserStunDuration*global.game_fps;
	}
}

function noon_omni_laser_create(face_direction, x ,y){
	var skill_layer_id = layer_get_id("skills");
	
	randomize();
	var angRandom = irandom_range(0,2);
	var startAngle;
	switch (angRandom) {
		case 0:
			startAngle = 0;
			break;
		case 1:
			startAngle = 10;
			break;
		case 2:
			startAngle = 20;
			break;
		default: break;
	}

	for (var i = 0; i < 12; i++) {
		instance_create_layer(x - 9*face_direction, y - 109, skill_layer_id, oMobSkills, {
		image_xscale : face_direction,
		image_speed : 10/9,
		image_angle : startAngle + i*30,
		sprite_index : s_serene_noon_omni_special,
		});
	}
}

//Checking if omni laser hits player
function noon_omni_laser_attack (x, y) {
	time_source_start(global.omniTimer);
}

//Check if can add guage and add guage
function addGuage(amount) {
	//Add guage if not stunned by guage 
	if (!oPlayer.guageStunned) {
		if (oGuage.guageValue + amount >= oGuage.guageMaxValue) {
			//Guaged
			var skill_layer_id = layer_get_id("skills");
			var fma_layer_id = layer_get_id("guaged");
			with (oGuage) {
				guageValue = 0; //Reset gauge
				midnightAngle --;
				switch (currentPhase) {
					case "Noon":
						noonAngle ++;
						break
					case "Sunset":
						sunsetAngle ++;
						break;
					case "Dawn":
						dawnAngle ++;
						break;
				}
			}
			
			//Screen effect
			instance_create_layer(0, 0, fma_layer_id, oMobFma, {
				sprite_index : s_sereneDeath,
				image_xscale : 1920/683,
				image_yscale : 1920/683,
			});
			
			//5 sec stun for player 
			with (oPlayer) {
				time_source_start(guageStunTimer);
				state = states.stunned;
				guageStunned = true;
				alarm[0] = 5*global.game_fps; 
			}
			var stunEffect = instance_create_layer(oPlayer.x, oPlayer.y, skill_layer_id, oSkill_ani, {
				sprite_index : sGuagedEffect,
			});
			stunEffect.alarm[2] = 5*global.game_fps;
		} else oGuage.guageValue += amount;
	}
}

