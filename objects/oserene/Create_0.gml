global.game_fps = 144 //global.game_fps doesn't work 

text = "idle";

hsp = 0;
vsp = 0;
grv = 0.3;

gameSpeed = -20; // data is -20
move_speed = (125 + (gameSpeed)*1.25)/global.game_fps; // 75???

face_direction = 1; 
no_move = 1; // 0 to disable movement, 1 to enable 

//timmer = 0;

state = states.idle;

player_x = 0; // To get player's x location 

hp_max = 330*power(10,12); // 330T
hp = hp_max;

laser_created = false;

//Dash mechanics =============================
//dash_hsp = 3650; //rushSpeed = 6000 in game 
dashCounter = 0; //To continue dashing at same speed before deceleration.
dashAttackCounter = 0; // To allow collision check against player while dashing
dashHit = false; // True if dash hits player
fs = 100;
screen_fps = 144;
walk_drag = 80000;
dec_x = walk_drag/100/sqr(global.game_fps)*fs; //80000/144^2
rushFinalX = 0;
rushDistance = 800; //Dash 800px
//===============================================


//Fma mechanics =========================
can_fma = false; 
rm_height = 1080;
rm_width = 1920;
//==============================================

skill_layer_id = layer_get_id("skills");
fma_layer_id = layer_get_id("fma");

//Checks if can do certain attacks ==============================================================
//Noon
mustNoonOmni = false;
mustFma = false;
canNoonOmni = true;

canNoonLaser = true;

canStab = false;
canDash = true;

//Sunset
mustSunsetSkill1 = false; //Summon meteor
canSunsetSkill1 = false; //Summon meteor
canSunsetDash = true;
canSunsetAttack3 = true;
sunsetDashCounterValue = 12;

//Midnight
canMidnightAttack1 = false; //Dash
canMidnightAttack3 = false; //Aoe push

//Dawn
canDawnSkill1 = true; //Summon crab

//Showdown debuff
showdownDebuff = false;

//Bind
isBound = false;

//Time source functions

var setCanNoonLaser = function() {
	canNoonLaser = true;
}
var setCanNoonOmni = function() {
	canNoonOmni = true;
}
var setMustNoonOmni = function() {
	mustNoonOmni = true;
}

// Time Source
stabAttack = time_source_create(time_source_game, 0.57, time_source_units_seconds, function() {
	var skillDmg;
	var hitEffect;
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	//Facing left
	if (face_direction == 1) {
		if (collision_rectangle(x - 450, y - 160, x - 1, y - 40, oPlayer, false, true)) gotHit = true;
	}
	//Facing right
	else if (face_direction == -1) {
		if (collision_rectangle(x + 1, y - 160, x + 450, y - 40, oPlayer, false, true)) gotHit = true;
	}
	
	if (gotHit) {
		switch (serenePhase) {
			case "Noon":
				skillDmg = 0.2;
				hitEffect = sSereneNoonStabHit;
				addGuage(10);
				break;
			case "Sunset":
				skillDmg = 0.35;
				hitEffect = sSereneSunsetStabHit;
				addGuage(10);
				sunsetDebuff();
				break;
			case "Midnight":
				skillDmg = 0.1;
				hitEffect = sSereneMidnightStabHit;
				break;
			case "Dawn":
				skillDmg = 0.15;
				hitEffect = sSereneDawnStabHit;
				addGuage(10);
				break;
		}
				
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, hitEffect);
	}
}, []);
dashAttack = time_source_create(time_source_game, 0.69, time_source_units_seconds, function() {
	switch (serenePhase) {
		case "Noon":
			dashSpeed = 3775;
			dashCounter = 29;  
			dashAttackCounter = 27; //27 ==> 707.8125px
			break;
		case "Sunset":
			dashSpeed = 1900;
			dashCounter = 62; 
			dashAttackCounter = 54; //54 ==> 712.5px
			break;
		case "Midnight":
			dashSpeed = 1900;
			dashCounter = 62;
			dashAttackCounter = 54; //54 ==> 712.5px
			break;
		case "Dawn":
			dashSpeed = 2850;
			dashCounter = 40; 
			dashAttackCounter = 36; //36 ==> 712.5px
			break;
	}
	oSerene.hsp = -dashSpeed*face_direction/global.game_fps;
}, []);

global.noonLaserAttack = time_source_create(time_source_game, 1.2, time_source_units_seconds, noon_laser_attack, [], 1);
global.noonLaserTimer = time_source_create(time_source_game, 12, time_source_units_seconds, setCanNoonLaser, [], 1, time_source_expire_nearest);
	
global.noonOmniTimer = time_source_create(time_source_game, 10, time_source_units_seconds, setCanNoonOmni, [], 1, time_source_expire_nearest);
global.mustNoonOmniTimer = time_source_create(time_source_game, 13, time_source_units_seconds, setMustNoonOmni, [], 1, time_source_expire_nearest);

noonDashTimer = time_source_create(time_source_game, 7, time_source_units_seconds, function() {canDash = true}, []);

sunsetFirstSkill1 = time_source_create(time_source_game, 7, time_source_units_seconds, function() {canSunsetSkill1 = true}, [], 1, time_source_expire_nearest);
sunsetSkill1Timer = time_source_create(time_source_game, 20, time_source_units_seconds, function() {canSunsetSkill1 = true}, [], 1, time_source_expire_nearest);
sunsetMustSkill1Timer = time_source_create(time_source_game, 26, time_source_units_seconds, function() {mustSunsetSkill1 = true}, [], 1, time_source_expire_nearest);
sunsetDashTimer = time_source_create(time_source_game, 8, time_source_units_seconds, function() {canDash = true}, []);
sunsetAttack3Timer = time_source_create(time_source_game, 14, time_source_units_seconds, function() {canSunsetAttack3 = true}, [], 1, time_source_expire_nearest);
sunsetAttack3Attack = time_source_create(time_source_game, 1.29, time_source_units_seconds, function() {
	hsp = -face_direction*6000/global.game_fps
	dashCounter = sunsetDashCounterValue;
	
	var skillDmg = 2; //200%
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	//If got showdown debuff, dont hit player
	if (!showdownDebuff) {
		//Facing left
		if (face_direction == 1) {
			if (collision_rectangle(x - 450, y - 350, x - 30, y, oPlayer, false, true)) gotHit = true;
		}
		//Facing right
		else if (face_direction == -1) {
			if (collision_rectangle(x + 30, y - 350, x + 450, y, oPlayer, false, true)) gotHit = true;
		}
	}
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, sSereneSunsetAttack3Hit);
	}
}, []);
sunsetAttack4Attack = time_source_create(time_source_game, 1.29, time_source_units_seconds, function() {
	hsp = -face_direction*6000/global.game_fps
	dashCounter = sunsetDashCounterValue;
	
	var skillDmg = 2; //200%
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	//If got showdown debuff, dont hit player
	if (!showdownDebuff) {
		//Facing left
		if (face_direction == 1) {
			if (collision_rectangle(x - 450, y - 350, x - 30, y, oPlayer, false, true)) gotHit = true;
		}
		//Facing right
		else if (face_direction == -1) {
			if (collision_rectangle(x + 30, y - 350, x + 450, y, oPlayer, false, true)) gotHit = true;
		}
	}
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, sSereneSunsetAttack4Hit);
	}
}, []);
sunsetAttack5Attack = time_source_create(time_source_game, 1.29, time_source_units_seconds, function() {
	var skillDmg = 2; //200%
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	//Facing left
	if (face_direction == 1) {
		if (collision_rectangle(x - 580, y - 335, x + 10, y - 40, oPlayer, false, true)) gotHit = true;
	}
	//Facing right
	else if (face_direction == -1) {
		if (collision_rectangle(x + 580, y - 335, x - 10 , y - 40, oPlayer, false, true)) gotHit = true;
	}
	
	if (gotHit) {
		//addGuage(20); 0 guage
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, sSereneSunsetAttack5Hit);
	}
}, []);

midnightDashTimer = time_source_create(time_source_game, 9, time_source_units_seconds, function() {canDash = true}, []);
//midnightAttack1Timer = time_source_create(time_source_game, 9, time_source_units_seconds, function() {canMidnightAttack1 = true}, []);
midnightAttack3Timer = time_source_create(time_source_game, 4, time_source_units_seconds, function() {canMidnightAttack3 = true}, []);
midnightAttack3Attack = time_source_create(time_source_game, 0.75, time_source_units_seconds, function() {
	
	var skillDmg = 0.2; //20%
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	//Facing left
	if (face_direction == 1) {
		if (collision_rectangle(x - 216, y - 340, x + 215, y - 5, oPlayer, false, true)) gotHit = true;
	}
	//Facing right
	else if (face_direction == -1) {
		if (collision_rectangle(x + 216, y - 340, x - 215, y - 5, oPlayer, false, true)) gotHit = true;
	}
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, sSereneMidnightPushHit);
	}
}, []);
	
dawnDashTimer = time_source_create(time_source_game, 8.5, time_source_units_seconds, function() {canDash = true}, []);
dawnSkill1Timer = time_source_create(time_source_game, 13, time_source_units_seconds, function() {canDawnSkill1 = true}, []);

showdownDebuffTimer = time_source_create(time_source_game, 70, time_source_units_seconds, function() {showdownDebuff = false}, []);

bindDebuffTimer = time_source_create(time_source_game, 10, time_source_units_seconds, function() {
	isBound = false;
	bindRelease();
}, []);