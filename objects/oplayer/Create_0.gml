 depth = 3;

//game_set_speed(screen_fps, gamespeed_fps); // setting gamespeed to screen_fps 

state = states.idle; 
down = false;
key_jump = false;
move_dir = 1;

horizontal_acc_constant = 100/sqr(global.game_fps);
acc_x = 14*horizontal_acc_constant; 
dec_x = 8*horizontal_acc_constant;
//in_game_move_speed = 1.60;
//move_speed = horizontal_speed_multiplier*(125+(in_game_move_speed-1)*100)/room_speed;

// horizontal speed 
//move_speed = (150 + (160 - 100)*1.25)/144 = 225
move_speed = (walk_speed+(in_game_speed-100)*1.25)/global.game_fps;
max_land_speed = move_speed*1.3; // game data is 195

//For jump right after moving
walk_jump_counter = 0; // As name suggest 
walk_jump_value = 3; // 3 ticks after walking from rest 

face_dir = -1;
canTurn = true; //False means cannot turn


//vsp
isGrounded = false;
vsp = 0;
grv = 2000/sqr(global.game_fps);
max_fall_speed = 670/global.game_fps;
jump_spd = 555/global.game_fps;
jump_spd_multiplier = 1.23;
jump_speed_final = jump_spd*jump_spd_multiplier; 

// air friction
float_friction = 100/100/sqr(global.game_fps); // from game data, 0.01/tick
float_friction_high = 10000/100/sqr(global.game_fps); // from game data, 1/tick
float_multiplier = 0.0008928571428571428; //from game data 
float_drag_2 = 10000; //from game data 
float_ = float_drag_2*float_multiplier/global.game_fps; // max free fall horizontal speed
float_force = 20000/100/sqr(global.game_fps); // free fall movement acceleration 

//===================================== Double jump =======================================

double_jump_spd_x = 725/global.game_fps; // default 725 
double_jump_spd_y = 500/global.game_fps; // default 500
double_jump_delay = 15; // prevent double jumping too quickly. Maybe don't need
double_jump_delay_value = 5; 
just_jumped = false;
jump_counter = 0;
number_of_double_jump = 2;
double_jump_min_height = 45; // prevent jumping too close to foothold 
max_height = 0;
platform_list = ds_list_create();
canWindJump = true

// ==================================== Landing physics ==========================================

just_landed = false; //To trigger just landed physics 
dec_type = 0; // 0 for normal dec, 1 for double dec. 2 = knockback air, 3 = knockback ground 

// ======================================= Attack animation =============================================
att_speed_multiplier = 1*(780/510); // Base is 780, 540 is attack speed 1 (2nd highest)
// attack speed formula is (10+AS)/16*skill delay 
// night lord can attack at 0 AS ==> 10/16 * 780 skill delay = 487.5 ms, rounded up to 510 (nearest 30) 
x_hit = 0;
y_hit = 0;
knife_number = 5; // Number of knife thrown
mana_cost = 30;
knife_face_dir = 0; 

mobNewY = 0;//Getting current y position of monster
quadHit = false; //True if skill will hit monster

// ======================================= Keyboard attack skills check ================================================
quadThrow = 0; // keybaord check pressed
quadThrow1 = 0; // keyboard check 
showDown = 0;
showDown1 = 0;
spread_throw = false;

//UI settings
rm_height = 1080;
rm_width = 1920;

Hp_box_x = -101;
Hp_box_y = -81;
hp_max = 100000;
hp = hp_max;
hp_display = hp_max;
mp_max = 23600;
mp_display = mp_max;
mp = mp_max;
display_acc = 0.05;

map_string = "0123456789/";
global.hpNumb = font_add_sprite_ext(s_hp_numbers,map_string,true,0);

// ============================ Rope Connect =============================================

ropeSize = sprite_get_height(s_hook_mid);
rope_length = 0; 
rope_length_max = 0;
rope_y_offset = 140;
rope_state = 0; //0 is extend, 1 is retract 
rope_length_1 = 0; // for rope rectraction	
rope_connect_speed_extend = 8;
rope_connect_speed_retract = 9;
hooked_platform = 0; // id of the platform you are connecting to 
rope_lift_speed = (/*horizontal_speed_multiplier*/1.2)*(125+(8)*100)/global.game_fps;
// x and y location when player pressed rope connect 
rope_x = 0;
rope_y = 0;

// ========================= Shadow rush and leap =========================================
canShadowRush = true;
canShadowLeap = true;
shadow_rush_speed = 170/0.09/global.game_fps; //93.75
shadow_leap_speed_ground = 1040/global.game_fps; //1040 for ground leap
shadow_leap_speed_air = 900/global.game_fps;
aniType = "None"; //Setting the animation type to play the correct function accordingly

// ============================= Blink float and Teleport =========================================
canBlink = true;
blink_y = 0;
blinkMoving = false; //To set the floating feeling 
blinkNoMoveCounter = 0; //To set the floating feeling
blinkFloatVar = 3;
blinkSpeed = 62.5/global.game_fps; //150+(30-100)*1.25

blinkLv = 30;
blinkDuration = 3 + 0.4*floor(blinkLv/6);

canTeleport = true
teleportCd = 0.54 //0.27s from teleport effect animation duration, 0.27*2

// ============================ Fuma Shuriken =============================================
canFuma = true;
fumaCd = 25;
fumaCdLeft = 0;
fumaSummoned = false;

// ================================ Status effects =====================================
statusResistance = 100; //Set as 100 for default 
statusDurationReduction = floor(28*log10(statusResistance) + 1); //In terms of % (57%)

//sereneLaserStunned = false;
sereneLaserStunDuration = 7*(100-statusDurationReduction)/100; //7s default 
guageStunned = false;

isDarkness = false;
darknessDuration = 5*(100-statusDurationReduction)/100; //5s default 
isSunsetStatus = false;
sunsetStatusDuration = 7*(100-statusDurationReduction)/100; //7s default 

//Getting hit =========================================
canSereneOmniHit = true;

// Player's buff
isExplosiveShuriken = false; //Checks if buff is on
canExplosiveShuriken = true;
canExplosiveShurikenPassive = true;
explosiveShurikenCd = 180; //Cooldown in seconds
explosiveShurikenCdLeft = 0; //Cooldown left
canSpreadThrow = true

// Erda Nova
canErdaNova = true

//Time Source
var setCanSereneOmniHit = function() {
	canSereneOmniHit = true;
}

var setShadowRushSpeed = function() {
	hsp = 0;
	grv = 2000/sqr(global.game_fps);
}

var setCanShadowRush = function() {
	canShadowRush = true;
}

var setBlink = function() {
	blinkMoving = false
	grv = 2000/sqr(global.game_fps);
	if (state != states.stunned) {
		state = states.jump;
	}
}

var blankFunc = function() {
}

test = 0;

//1s cd before player can get hit by laser again
global.omniHitTimer = time_source_create(time_source_game, 1, time_source_units_seconds, setCanSereneOmniHit, [], 1, time_source_expire_nearest);

//Shadow rush to dash for only 0.9s
global.shadowRushTimer = time_source_create(time_source_game, 0.09, time_source_units_seconds, setShadowRushSpeed, [], 1, time_source_expire_nearest);
//Shadow rush cd 5s
global.canshadowRushTimer = time_source_create(time_source_game, 1, time_source_units_seconds, setCanShadowRush, [], 1, time_source_expire_nearest);

//Setting max Blink duration
global.blinkDuration = time_source_create(time_source_game, blinkDuration, time_source_units_seconds, setBlink, []);

//90ms before quadthrow knife comes out
global.quadBegin = time_source_create(time_source_game, 0.09, time_source_units_seconds, blankFunc, []);

//Time source to create instance to hold hit effect data
global.hitEffect = time_source_create(time_source_game, 1, time_source_units_seconds, blankFunc, []);

// 420ms delay before shuriken comes out
global.fumaStart = time_source_create(time_source_game, 0.42, time_source_units_seconds, blankFunc, []);

// Laser stun timmer 
//laserStunTimer = time_source_create(time_source_game, sereneLaserStunDuration, time_source_units_seconds, function() {sereneLaserStunned = false}, []);

// Guage stun timmer 
guageStunTimer = time_source_create(time_source_game, 5, time_source_units_seconds, function() {guageStunned = false}, []);

//Showdown attack
//8 frames before attack lands, 60ms per frame 60*8/att_speed_multiplier
showdownAttack = time_source_create(time_source_game, 0.06*8/att_speed_multiplier, time_source_units_seconds, function() {
	var faceDirection = face_dir; //Right is 1

	//Facing Right
	var mobId;
	if (faceDirection == 1) {
		mobId = collision_rectangle(x - 5, y - 220, x + 480, y + 40, oMonster, false, true);
	}
	//Facing Left
	else if (faceDirection == -1) {
		mobId = collision_rectangle(x - 480, y - 220, x + 5, y + 40, oMonster, false, true);
	}
	
	if (mobId != noone) {
		randomize();
		var randomRange = 30;
		var ranX = irandom_range(-randomRange, randomRange);
		randomize();
		var ranY = irandom_range(-randomRange, randomRange);
		var relativeX = mobId.bbox_right - mobId.bbox_left;
		var relativeY = mobId.bbox_top - mobId.bbox_bottom;
		var finalX = relativeX/2 + mobId.bbox_left + ranX;
		var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
		if (finalY > mobId.bbox_bottom) finalY = mobId.bbox_bottom;
		//Hit effect
		instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : s_showdown_hit, image_xscale : image_xscale, follow : false});
		audio_play_sound(sound_showdown_hit, 0, false);
		
		//Damage numbers
		var dmg_control = instance_create_layer(0, 0, "controller", oDamageController, {isDarkness : isDarkness});
		dmg_control.skill = "showdown";
		
		with (mobId) {
			if (showdownDebuff == false) {
				showdownDebuff = true;
				
				time_source_start(showdownDebuffTimer);
				instance_create_layer(0, 0, "Debuff", oDebuffs, {mobId : mobId, sprite_index : sShowdownDebuff});
			}
			else {
				time_source_reset(showdownDebuffTimer);
				time_source_start(showdownDebuffTimer);
			}
		}
		
		explosiveShurikenTrigger(mobId);
	}
}, []);

/*
//Erda nova 60ms per frame 
erdaNovaAttack = time_source_create(time_source_game, 0.06*10/att_speed_multiplier, time_source_units_seconds, function() {

	var mobId = collision_rectangle(x - 350, y - 450, x + 350, y + 50, oMonster, false, true);
	
	if (mobId != noone) {
		// Hit effect and dmg numbers
		var timeController = instance_create_layer(0, 0, "controller", oTimeControl, {
			skillType : "erda",
			mobId : mobId
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
}, []);
*/
erdaNovaAttack = time_source_create(time_source_game, 0.6, time_source_units_seconds, blankFunc, []);

explosiveShurikenPassiveTimer = time_source_create(time_source_game, 10, time_source_units_seconds, function() {
	canExplosiveShurikenPassive	= true;
}, []);

//Status effects
darknessTimer = time_source_create(time_source_game, darknessDuration, time_source_units_seconds, function() {isDarkness = false}, []);
sunsetStatusTimer = time_source_create(time_source_game, sunsetStatusDuration, time_source_units_seconds, function() {isSunsetStatus = false}, []);

// Teleport delay
teleportTimer = time_source_create(time_source_game, teleportCd, time_source_units_seconds, function() {canTeleport = true}, []);

global.testPlayerSkills = {
	nlFuma : {
		currentCd : 0,
		coolDown : 25,
		icon : s_fuma_icon,
		timesource : time_source_create(time_source_game, 25, time_source_units_seconds, function() {canFuma = true}, [])
	},
	nlExplosiveShuriken : {
		currentCd : 0,
		coolDown : 180,
		duration : 100,
		amount : 68,
		icon : sExplosiveShurikenIcon,
		timesource : time_source_create(time_source_game, 180, time_source_units_seconds, function() {canExplosiveShuriken = true}, []),
	},
	nlErdaNova : {
		currentCd : 0,
		coolDown : 100,
		icon : sErdaNovaIcon,
		timesource : time_source_create(time_source_game, 100, time_source_units_seconds, function() {canErdaNova = true}, []),
	},
	nlSpreadThrow : {
		currentCd : 0,
		coolDown : 180,
		duration : 50,
		icon : s_spread_throw_icon,
		timesource : time_source_create(time_source_game, 180, time_source_units_seconds, function() {canSpreadThrow = true}, []),
	},
}