function quad_throw() {
	//state = states.attack_quadthrow;
	
	state = states.in_animation;
	image_index = 0;
	aniType = "quadthrow";
	mp -= mana_cost;
	audio_play_sound(sound_quad_use, 0, false);
	
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : s_quadthrow_effect,
		image_xscale : -face_dir,
		follow : true
	});

	var knifeStartX = x + 10*face_dir;
	var knifeYHeight = y - 25;
	var mobStartY = 0; //Y position of monster at start of skill cast
	var mobHitY = 0; //Position where hit animation will be created wrt monster
	
	//Check if Quadthrow will hit monster or not 
	var knifeMaxX = 400; //350/0.8 //437.5 so what is it??
	var knifeXDistance = knifeMaxX; //0
	quadHit = false; //Checks if it will hit monster or not
	
	if (instance_exists(oMonster)) {
		var monster;
		var knifeEndX = knifeStartX + knifeMaxX*face_dir;
		var middleX = 0; //Max distance from monster where knife will travel to monster origin
		monster = collision_line(knifeStartX, knifeYHeight, knifeEndX, knifeYHeight, oMonster, false, true);
		
		if (monster != noone) {
			var mobX = monster.x;
			mobStartY = monster.y;
			var mobHitX = 0; //Position where hit animation will be created wrt monster
			mobHitY = knifeYHeight - mobStartY;
			quadHit = true;
			//If player is facing right
			if (face_dir == 1) {
				//If knife starting position is on right of monster
				if (knifeStartX >= mobX) knifeXDistance = (monster.bbox_right - knifeStartX)/2;
				//If knife starting position is on left of monster
				else {
					middleX = knifeMaxX - 2*(mobX - monster.bbox_left);
					//Distance between monster and knife starting position
					var distance = mobX - knifeStartX; 
					//If far enough, knife will travel max distance. Else, travel to monster origin 
					knifeXDistance = (distance >= middleX) ? (distance - middleX)/2 + middleX : distance;
				}
				mobHitX = knifeStartX + knifeXDistance - mobX;
			}
			//If player is facing left
			else if (face_dir == -1) {
				//If knife starting position is on left of monster
				if (knifeStartX < mobX) knifeXDistance = (knifeStartX - monster.bbox_left)/2;
				//If knife starting position is on right of monster
				else {
					middleX	= knifeMaxX - 2*(monster.bbox_right - mobX);
					//Distance between monster and knife starting position
					var distance = knifeStartX - mobX; 
					//If far enough, knife will travel max distance. Else, travel to monster origin 
					knifeXDistance = (distance >= middleX) ? (distance - middleX)/2 + middleX : distance;
				}
				mobHitX = knifeStartX - knifeXDistance - mobX;
			}
			
			//Create hit effect on monster
			var knifeSpeed = 750;
			var hitDelay = knifeXDistance/knifeSpeed;
			var createInstance = function(relativeX, relativeY, monsterID, dir, skillName) {
				var timeController = instance_create_layer(0, 0, "controller", oTimeControl, {
					hitRelativeX : relativeX,
					hitRelativeY : relativeY,
					skillType : skillName,
					mobId : monsterID,
					image_xscale : -dir
					});
			}
			time_source_reconfigure(global.hitEffect, hitDelay, time_source_units_seconds, createInstance, [mobHitX, mobHitY, monster, face_dir, "quadThrow"], 1);
			time_source_start(global.hitEffect);
			
			//Explosive Shuriken
			explosiveShurikenTrigger(monster);
		}
	}
	
	//Throwing knife animation 
	var setQuadThrow = function(x, y, dir, knifeDistance, mobStartY) {
		var knifeSpeed = 750;
		var knifeEndHeight = -40;
		var knifeEndHeightChange = 16;
		var count = time_source_get_reps_completed(global.quadBegin) - 1; // 0 to 4
		if (instance_exists(oMonster) && quadHit) {
			if (count == 0) {
				mobNewY = oMonster.y;
			}
			var heightDiff = mobNewY - mobStartY;
			knifeDistance = (knifeDistance == 0) ? 1 : knifeDistance;
			var angle = point_direction(0, 0, knifeDistance*dir, heightDiff + knifeEndHeight + knifeEndHeightChange*count);
			var knife = instance_create_layer(x, y, "skills", oStar);
			knife.direction = angle;
			knife.alarm[0] = -1;
			knife.x_final = x + knifeDistance*dir;
			knife.hit_mob = true;
		}
		else {
			var knifeMaxDistance = 400;
			var knife = instance_create_layer(x, y, "skills", oStar);
			knife.direction = point_direction(0, 0, knifeDistance*dir, knifeEndHeight + knifeEndHeightChange*count);
			knife.x_final = x + knifeDistance*dir;
			//knife.alarm[0] = -1;
			knife.alarm[0] = knifeMaxDistance/knifeSpeed*global.game_fps;
		}
		
		//Spread throw
		if (spread_throw) {
			//First angle
			var knifeMaxDistance = 350;
			var knife = instance_create_layer(x, y, "skills", oStar);
			if (face_dir == 1) knife.direction = 25;
			else if (face_dir == -1) knife.direction = 180 - 25;
			knife.alarm[0] = knifeMaxDistance/knifeSpeed*global.game_fps;
			knife.isSpread = true;
			
			//Second angle
			knife = instance_create_layer(x, y, "skills", oStar);
			if (face_dir == 1) knife.direction = 45;
			else if (face_dir == -1) knife.direction = 180 - 45;
			knife.alarm[0] = knifeMaxDistance/knifeSpeed*global.game_fps;
			knife.isSpread = true;
			
			//Third angle
			knife = instance_create_layer(x, y, "skills", oStar);
			if (face_dir == 1) knife.direction = -25;
			else if (face_dir == -1) knife.direction = 180 + 25;
			knife.alarm[0] = knifeMaxDistance/knifeSpeed*global.game_fps;
			knife.isSpread = true;
		}
	}
	
	time_source_reconfigure(global.quadBegin, 0.09, time_source_units_seconds, setQuadThrow, [knifeStartX, knifeYHeight, face_dir, knifeXDistance, mobStartY], 5);
	time_source_start(global.quadBegin);
}

function show_down() {
	state = states.in_animation;
	image_index = 0;

	aniType = "showdown";
	mp -= 50; //50 in game
	audio_play_sound(sound_showdown_use, 0, false);
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : s_showdown_a,
		image_xscale : -face_dir,
		follow : false
	});

	time_source_start(showdownAttack);
}

function shadow_rush() {
	if (!canShadowRush) exit;
	canShadowRush = false;
	state = states.in_animation;
	
	image_index = 0;
	aniType = "shadowRush";

	mp -= 35; //35 in game
	hsp = shadow_rush_speed*face_dir;
	vsp = 0;
	grv = 0;
	time_source_start(global.shadowRushTimer);
	time_source_start(global.canshadowRushTimer);
	
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_shadow_rush_effect;
	skill_animation.follow = true; 
	
	skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_shadow_rush_special;
	skill_animation.follow = false; 
}

function shadow_leap() {
	if (!canShadowLeap) exit;
	
	//canShadowLeap = false;
	state = states.in_animation;
	image_index = 0;
	aniType = "shadowLeap";
	mp -= 16; //16 in game
	
	if (isGrounded) {
		vsp -= shadow_leap_speed_ground;	
	}
	else {
		//If moving up, allow higher jumps
		if (sign(vsp) == -1) vsp = min(-shadow_leap_speed_air, vsp);
		//If dropping
		else if (sign(vsp) == 1) vsp -= shadow_leap_speed_air;
	}
	
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_shadow_leap_effect;
	skill_animation.follow = false; 
}

function blink() {
	if (!canBlink) exit;
	
	//canBlink = false;
	time_source_start(global.blinkDuration);
	state = states.blink;
	hsp = 0;
	vsp = 0;
	grv = 0;
	blink_y = y;
	blinkNoMoveCounter = 0;
	
	hp -= floor(hp_max*0.03); // 3% of max hp
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_blink_effect;
	skill_animation.follow = false; 
}

function fumaShuriken() {
	if (!canFuma) exit;
	canFuma = false;
	
	state = states.in_animation;
	image_index = 0;
	aniType = "fumaShuriken";
	mp -= 800; //800 in game
	
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : s_fuma_effect0,
	});
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : s_fuma_effect,
	});
	
	var currentX = x;
	var currentY = y;
	var playerFaceDir = face_dir;
	var offsetX = -180;
	var offsetY = -58;
	var fumaStartX = x - offsetX*face_dir;
	var fumaStartY = y + offsetY;
	
	var fumaCreate = function(fumaX, fumaY, faceDir) {
		instance_create_layer(fumaX, fumaY, "skills", oSkill_ani, {
			sprite_index : s_fuma_b1,
			hspeed : faceDir*1000/global.game_fps,
			finalPosX : fumaX + faceDir*600,
			follow : false,
		});
		fumaSummoned = true;
	}
	
	//Creates flying projectile after 0.42s
	time_source_reconfigure(global.fumaStart, 0.42 ,time_source_units_seconds, fumaCreate, [fumaStartX, fumaStartY, playerFaceDir]);
	time_source_start(global.fumaStart);
	
	var skill = "nlFuma"
	var timesource = global.testPlayerSkills[$ skill].timesource
	time_source_start(timesource);
}

function spreadThrow() {
	if (!canSpreadThrow) exit;
	
	canSpreadThrow = false;
	spread_throw = true; 

	state = states.in_animation;
	image_index = 0;

	aniType = "spreadThrow";
	mp -= 1000; //1000 in game
	audio_play_sound(soundSpreadThrow, 0, false);
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : sSpreadThrow
	});
	
	var skill = "nlSpreadThrow";
	var duration = global.testPlayerSkills[$ skill].duration;
	var icon = global.testPlayerSkills[$ skill].icon;
	var timesource = global.testPlayerSkills[$ skill].timesource;
	
	time_source_start(timesource);
	var temp = [duration, icon, 0, duration];
	array_push(global.skills_display, temp);
}

function erdaNova() {
	if (!canErdaNova) exit;
	
	var mobId = collision_rectangle(x - 350, y - 450, x + 350, y + 50, oMonster, false, true);
	if (mobId == noone) exit;	
	
	canErdaNova = false;
	state = states.in_animation;
	image_index = 0;

	aniType = "erdaNova";
	hp -= 0.15*hp_max; //15% in game
	audio_play_sound(soundErdaNovaUse, 0, false);
		
	var skill = "nlErdaNova"
	var timesource = global.testPlayerSkills[$ skill].timesource;
	time_source_start(timesource)
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : sErdaNova
	});
	
	// For Erda Nova attack hit after 0.6s
	var erdaAttack = function(mobId) {
		// Hit effect and dmg numbers
		var timeController = instance_create_layer(0, 0, "controller", oTimeControl, {
			skillType : "erda",
			mobId : mobId,
		});
		
		//Debuff effect
		var erda = instance_create_layer(mobId.x, mobId.y, "Debuff", oSkill_ani, {sprite_index : sErdaNovaDebuff, follow : false});
		erda.alarm[2] = 10*global.game_fps;
		with (mobId) {
			if (!isBound) {
				isBound = true;
				state = states.bound;
				oController.bindTimer = 100;
				if (mobId.object_index == oSerene) {
					with (mobId) sereneTimeSourceAttacksStop();
				}
				time_source_start(bindDebuffTimer);
			}
		}
	}
	
	// Erda Nova attack hit after 0.6s
	time_source_reconfigure(erdaNovaAttack, 0.06*10/att_speed_multiplier, time_source_units_seconds, erdaAttack, [mobId]);
	time_source_start(erdaNovaAttack);
}

function explosiveShuriken() {
	if (!canExplosiveShuriken) exit;
	canExplosiveShuriken = false;
	isExplosiveShuriken = true;
	canExplosiveShurikenPassive = false;
	if (time_source_get_state(explosiveShurikenPassiveTimer) == time_source_state_active) {
		time_source_stop(explosiveShurikenPassiveTimer);
	}
	
	var skill = "nlExplosiveShuriken";
	var duration = global.testPlayerSkills[$ skill].duration;
	var icon = global.testPlayerSkills[$ skill].icon;
	var timesource = global.testPlayerSkills[$ skill].timesource;
	var amount = global.testPlayerSkills[$ skill].amount;
	
	time_source_start(timesource); // Start cooldown timer
	state = states.in_animation;
	image_index = 0;

	aniType = "explosiveShuriken";
	mp -= 1000; //1000 in game
	audio_play_sound(soundExplosiveShurikenUse, 0, false);
	instance_create_layer(x, y, "Below_player", oSkill_ani, {
		sprite_index : sExplosiveShurikenBuff0
	});
	instance_create_layer(x, y, "skills", oSkill_ani, {
		sprite_index : sExplosiveShurikenBuff
	});
	
	for (var i = 0; i < array_length(global.skills_display); i++) {
		if (global.skills_display[i][1] == sExplosiveShurikenIcon && global.skills_display[i][2] == 0) {
			array_delete(global.skills_display, i , 1);
			break; // Check if need to remove break or not
		}
	}
	
	var temp = [duration, icon, amount, duration];
	array_push(global.skills_display, temp);
}
	
function explosiveShurikenTrigger(mobId) {
	var explosionAmount = 0;
	
	//Explosive Shuriken passive skill 
	if (canExplosiveShurikenPassive) {
		canExplosiveShurikenPassive = false;
		time_source_start(explosiveShurikenPassiveTimer);
		
		var temp = [10, sExplosiveShurikenIcon, 0, 10];
		array_push(global.skills_display, temp);
		
		explosionAmount = 1;
		instance_create_layer(0, 0, "controller", oTimeControl, {
				skillType : "explodingShuriken",
				mobId : mobId,
				faceDir : -face_dir,
				explodeCount : explosionAmount
		});
		exit;
	}
	
	// Explosive Shuriken active skill
	for (var i = 0; i < array_length(global.skills_display); i++) {
		if (global.skills_display[i][1] == sExplosiveShurikenIcon && global.skills_display[i][2] > 0) {
			randomize();
			explosionAmount = irandom_range(2, 4);
			global.skills_display[i][2] -= explosionAmount;
			if (global.skills_display[i][2] <= 0) {
				isExplosiveShuriken = false;
				array_delete(global.skills_display, i, 1);	
				canExplosiveShurikenPassive = true;
			}

			instance_create_layer(0, 0, "controller", oTimeControl, {
				skillType : "explodingShuriken",
				mobId : mobId,
				faceDir : -face_dir,
				explodeCount : explosionAmount
			});
			break;
		}
	}
}

function teleport(isOnGround) {
	if (!canTeleport) exit;
	
	var groundY = 755; // Y position of player on the ground
	var vertical = 80; 
	if (!isOnGround && y + vertical < groundY) exit;
	
	canTeleport = false;
	time_source_start(teleportTimer);
	
	var horizontal = 275;
	var mpCost = 22;
	
	x += horizontal*move_dir;
	if (x > 1773) x = 1773;
	else if (x < 18) x = 18;
	if (!isOnGround) y = groundY;
	mp -= mpCost;
	
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_teleport_effect;
	skill_animation.follow = true;
}

function teleportDown() {
	if (!canTeleport) exit;
	
	var groundY = 755; // Y position of player on the ground
	var vertical = 320;
	if (y + vertical < groundY) exit; // Cannot teleport down
	var mpCost = 22;
	
	canTeleport = false;
	time_source_start(teleportTimer);
	
	y = groundY;
	mp -= mpCost;
	hsp = 0;
	
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_teleport_effect;
	skill_animation.follow = true;
}

function windJump() {
	var vertical = 1280/global.game_fps;
	var mp = 18;
	canWindJump = false;
	
	//If moving up, allow higher jumps
	if (sign(vsp) == -1) vsp = min(-vertical, vsp);
	//If dropping
	else if (sign(vsp) == 1) vsp -= vertical;
	
	var skill_animation = instance_create_layer(x, y, "skills", oSkill_ani);
	skill_animation.sprite_index = s_wind_jump_effect;
	skill_animation.follow = false; 
}

function ropeConnect() {
	var rope_connect = collision_line(x,y,x,y-700,oTile,false,true); //check for platfrom above
	if rope_connect != noone
	{
		hooked_platform = rope_connect; 
		rope_x = x;
		rope_y = y;
		hsp = 0;
		state = states.ropeconnect;
		rope_length = 0;
		rope_length_max = abs(y-rope_y_offset-rope_connect.y);
		rope_state = 0;
	}
}


