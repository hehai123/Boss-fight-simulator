//Noon Omni laser state
function serene_noon_omni_setState(){
	state = states.omni;
	image_index = 0;
	noon_omni_laser_create(face_direction, x, y);
	canNoonOmni = false;
	mustNoonOmni = false;
	//if (time_source_get_state(noonOmniTimer) != time_source_state_initial) 
	time_source_reset(global.noonOmniTimer);
	time_source_start(global.noonOmniTimer);
	//if (time_source_get_state(mustNoonOmniTimer) != time_source_state_initial) 
	time_source_reset(global.mustNoonOmniTimer);
	time_source_start(global.mustNoonOmniTimer);
}

//Noon laser state
function serene_noon_laser_setState() {
	state = states.attack_laser;
	image_index = 0;
	canNoonLaser = false;
	//if (time_source_get_state(noonLaserTimer) != time_source_state_initial) 
	//time_source_reset(global.noonLaserTimer);
	time_source_start(global.noonLaserTimer);
	//if (time_source_get_state(noonLaserAttack) != time_source_state_initial) 
	//time_source_reset(global.noonLaserAttack);
	time_source_start(global.noonLaserAttack);
}

function sereneDash() {
	canDash = false;
	state = states.dash;
	image_index = 0;
	
	time_source_start(dashAttack); 
	if (serenePhase == "Noon") time_source_start(noonDashTimer);
	else if (serenePhase == "Sunset") time_source_start(sunsetDashTimer);
	else if (serenePhase == "Midnight") time_source_start(midnightDashTimer);
	else if (serenePhase == "Dawn") time_source_start(dawnDashTimer);
}

function sereneStab() {
	canStab = false;
	time_source_start(stabAttack);
	state = states.stab;
	image_index = 0;
}

//Noon walk state
function sereneMove() {
	state = states.walk;
	image_index = 0;
}

//Noon idle state
function sereneStand() {
	state = states.idle;
	image_index = 0;
}

//Serene start FMA immediately
function serene_fma_startCheck() {
	if (mustFma) {
		serene_fma_setState();
		serene_fma_start();
	}
}

//Serene fma state
function serene_fma_setState() {
	state = states.fma;
	image_index = 0;
	mustFma = false;
	isBound = false;
	
	sereneTimeSourceAttacksStop();
	time_source_stop(bindDebuffTimer);
	time_source_stop(global.noonLaserTimer);
	time_source_stop(global.noonOmniTimer);
	time_source_stop(global.mustNoonOmniTimer);
	
	canNoonLaser = true;
	canNoonOmni = true;
	mustNoonOmni = false;
	canDash = true;
	canMidnightAttack1 = true;
}

//Stop attacks with delay
function sereneTimeSourceAttacksStop () {
	if (time_source_get_state(global.noonLaserAttack) == time_source_state_active) time_source_stop(global.noonLaserAttack);
	if (time_source_get_state(dashAttack) == time_source_state_active) time_source_stop(dashAttack);
	if (time_source_get_state(stabAttack) == time_source_state_active) time_source_stop(stabAttack);
	if (time_source_get_state(sunsetAttack3Attack) == time_source_state_active) time_source_stop(sunsetAttack3Attack);
	if (time_source_get_state(sunsetAttack4Attack) == time_source_state_active) time_source_stop(sunsetAttack4Attack);
	if (time_source_get_state(sunsetAttack5Attack) == time_source_state_active) time_source_stop(sunsetAttack5Attack);
	if (time_source_get_state(midnightAttack3Attack) == time_source_state_active) time_source_stop(midnightAttack3Attack);
}

//Serene Fma start
function serene_fma_start() {
	var fma_layer_id = layer_get_id("fma");
	var skill_layer_id = layer_get_id("skills");
	var heightY = 450 + 200; // game data is 200
	var startX = 15; //map center - 280*3 = 880 - 840 = 40; ?? 15 is correct already 
	
	instance_create_layer(0, 0, fma_layer_id, oMobFma, {
		image_speed : 10/9,
		sprite_index : s_serene_fma_screen,
		image_xscale : 1920/700,
		image_yscale : 1920/700,
	});	
		
	instance_create_layer(0, 0, fma_layer_id, oMobFma, {
		image_speed : 10/72,
		sprite_index : s_serene_fma_screen0,
		image_xscale : 1920/700,
		image_yscale : 1920/700,
	});	
	
	//Fma Pillars 
	randomize();
	var evadePos = irandom_range(1, 5); //Only pos 1 to 5 will have shorter pillars to evade
	for (var i = 0; i < 7; i++) {
		if (i == evadePos) {
			instance_create_layer(startX + i*280, heightY, skill_layer_id, oMobSkills, {
				image_speed : 10/6,
				sprite_index : s_serene_fma_evade_prepare,
			});	
		}
		else {
			instance_create_layer(startX + i*280, heightY, skill_layer_id, oMobSkills, {
				image_speed : 10/6,
				sprite_index : s_serene_fma_prepare,
			});	
		}	
	} 
	instance_create_layer(0, 0, fma_layer_id, oScreenFlash, {image_speed : 10/6, alpha : 0});
}

function sereneSunsetSkill1() {
	mustSunsetSkill1 = false;
	canSunsetSkill1 = false;
	state = states.sunsetSkill1;
	image_index = 0;
	
	var skill_layer_id = layer_get_id("skillsMeteor");
	randomize();
	var gapX = irandom_range(225, 250);
	var startingX = 0;
	var startingY = 200;
	for (var i = 0; i < 8; i++) {
		randomize();
		var xPosVar = irandom_range(-10, 20);
		var yPosVar = irandom_range(0, 100);
		instance_create_layer(startingX + i*gapX + xPosVar, startingY + yPosVar, skill_layer_id, oMobSkills, {
			sprite_index : sSereneSunsetMapObtacleStart,
			image_speed : 10/9
		});
	}
	
	time_source_reset(sunsetSkill1Timer);
	time_source_start(sunsetSkill1Timer);
	time_source_reset(sunsetMustSkill1Timer);
	time_source_start(sunsetMustSkill1Timer);
}

function sereneSunsetAttack3() {
	canSunsetAttack3 = false;
	time_source_start(sunsetAttack3Timer);
	time_source_start(sunsetAttack3Attack);
	
	state = states.sunsetAttack3;
	image_index = 0;
}

function sereneMidnightAttack3() {
	canMidnightAttack3 = false;
	time_source_start(midnightAttack3Timer);
	time_source_start(midnightAttack3Attack);
	
	state = states.midnightAttack3;
	image_index = 0;
}

function sereneDawnSkill1() {
	canDawnSkill1 = false;
	time_source_start(dawnSkill1Timer);
	
	instance_create_layer(x - face_direction*220 , 757, "DawnCrab", oMobSkills, {
		sprite_index : sSereneDawnCrabSpawn,
		image_xscale : face_direction
	});
	state = states.dawnSkill1;
	image_index = 0;
}
