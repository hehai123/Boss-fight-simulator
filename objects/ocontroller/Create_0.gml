/// @description Timer, hp bar, music

rm_width = window_get_width();
rm_height = window_get_height();
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

rmCenterX = rm_width/2;
rmCenterY = rm_height/2;

mobID = oSerene;

currentPhase = "Noon";

//Timer + death count UI
deathCounterUIoffsetX = -17;
deathCounterUIX = 0.5*(rm_width - sprite_get_width(sDeathCountUI) - sprite_get_width(s_timer)) + deathCounterUIoffsetX;
deathCounterUIY = 30;
deathCounterNumber = oPlayer.lifes; 
timerUIX = deathCounterUIX + sprite_get_width(sDeathCountUI);
timerUIY = deathCounterUIY;
timerUIMin1X = timerUIX + 85;
timerUIMin2X = timerUIX + 105;
timerUISec1X = timerUIX + 152;
timerUISec2X = timerUIX + 173;
timerUINumY = deathCounterUIY + 12;

//Hp bar
mobMaxHp = mobID.hp_max;
mobHp = mobID.hp;

//Hp Ratio settings
hpRX = -400;
hpRY = 37;
hpNumPosX = 32 + hpRX; //27 from game data
hpNumPosY = 5 + hpRY; //8 from game data

//Keyboard functions 

//Quick slot
isQuickSlotOpen = false;
isQuickSlotOpenBefore = false; //Checks if quick slot is open or not before using change quick slot button
quickSlotClosedX = -363;
quickSlotOpenedX = -574;
quickSlotCurrentX = quickSlotClosedX;
quickSlotX = gui_width + quickSlotCurrentX;
quickSlotY = gui_height - 86;
quickSlotMoveSpeed = 1000/global.game_fps;
// Setting quick slot icons at the start
for (var i = 0; i < 32; i++) {
	for (var j = 0; j < 73; j++) {
		if (global.quickSlotPosition[i][2] == global.key_position[j][2]) {
			global.quickSlotPosition[i][3] = global.key_position[j][3];
			global.quickSlotPosition[i][4] = global.key_position[j][4];
			global.quickSlotPosition[i][5] = global.key_position[j][5];
			break;
		}
	}
}

// Bind counter
bindTimer = 0;
bindSec1 = bindTimer div 10;
bindSec2 = bindTimer mod 10;

map_string = "0123456789.%";
integerDigits = floor(mobHp/mobMaxHp*1000)/10;
bitmap_font = font_add_sprite_ext(s_HPRatio_num, map_string, true, 1);

//Skill timer
map_string2 = "0123456789";
bitmap_font2 = font_add_sprite_ext(s_SkillCoolDownNumber_2, map_string2, true, -1); 

audio_master_gain(0.5); // 0.1
audio_group_load(Skill_SFX);
audio_group_set_gain(Skill_SFX, 0.05, 0);
currentSoundId = audio_play_sound(BGM_noon, 0, true);

noonBoom = time_source_create(time_source_game, 12, time_source_units_seconds, create_map_bomb_data, [], 1, time_source_expire_nearest);
time_source_start(noonBoom);

noonLaser = time_source_create(time_source_game, 10, time_source_units_seconds, create_map_laser, [], -1);
time_source_start(noonLaser);

//Sunset sky sword every 8.1s
sunsetSwordStartDelay = 5*global.game_fps; //Only start 5s after fma
sunsetSword = time_source_create(time_source_game, 8.1, time_source_units_seconds, function() {
	var skill_layer_id = layer_get_id("skills");
	var gapX = 310;
	//var startingX = 880 - gapX*3;
	var startingY = 765;
	var startingX = 160;
	//Time delay of bomb
	var time;
	
	//7 out of 8 bombs to appear
	randomize();
	var noSpawn = irandom_range(0, 7);
	
	//Roll to see if bombs will appear at the same time
	randomize();
	var allAppear = irandom_range(1, 20);
	
	// 15% chance for all bombs to appear together // 18
	if (allAppear >= 21) {
		time = 1; // for alarm to count down to 0
		for (var i = 0; i < 8; i++) {
			if (i == noSpawn) continue;
			instance_create_layer(startingX + i*gapX, startingY, skill_layer_id, oMobSkills, {
				sprite_index : s_serene_noon_map_bomb_warning,
				image_speed : 0,
				visible : false,
				swordDelay : time,
			});
		}
	} 
	else {
		for (var i = 0; i < 8; i++) {
			if (i == noSpawn) continue;
			randomize();
			time = irandom_range(0, 132)*0.1;
			instance_create_layer(startingX + i*gapX, startingY, skill_layer_id, oMobSkills, {
				sprite_index : sSereneSunsetMapSword,
				image_speed : 0,
				visible : false,
				swordDelay : time,
			});
		}
	}
}, [], -1);
sunsetFlameWall = time_source_create(time_source_game, 60, time_source_units_seconds, function() {
	//var wallDuration = 22;
	var wallDuration = (oSerene.hp/oSerene.hp_max <= 0.3) ? 30 : 22; //22s or 30s depending on Serene hp left
	instance_create_layer(550, 765, "flameWall", oMobSkills, {
		sprite_index : sSereneSunsetMapWallRegen,
		image_speed : 10/9,
		sunsetFlameWallDuration: wallDuration*global.game_fps
	});
	instance_create_layer(1450, 765, "flameWall", oMobSkills, {
		sprite_index : sSereneSunsetMapWallRegen,
		image_speed : 10/9,
		sunsetFlameWallDuration: wallDuration*global.game_fps
	});
}, []);

midnightPillarStartDelayTime = 2*global.game_fps; //Only start 2s after fma
midnightPillarStartDelay = midnightPillarStartDelayTime;
// ds_list to store the unique values
my_ds_list_of_possable_values = ds_list_create();
// How many unique values that we want
number_of_unique_values = 11;
// Adding values of 1 to 10 to the list
for (var i = 0 ; i <= 22; i++) ds_list_add(my_ds_list_of_possable_values, i);
midnightPillars = time_source_create(time_source_game, 7.5, time_source_units_seconds, function() {
	var skill_layer_id = layer_get_id("skills");
	var gapX = 90;
	//var startingX = 880 - gapX*3;
	var startingY = 765;
	var startingX = 50;
	//Time delay of spawn
	var time;
	
	randomize();
	//do the random magic
	ds_list_shuffle(my_ds_list_of_possable_values);

	for (var i = 0; i <= number_of_unique_values; i++) {
		var j = ds_list_find_value(my_ds_list_of_possable_values, i);

		randomize();
		time = irandom_range(0, 48)*0.1;
		instance_create_layer(startingX + j*gapX, startingY, skill_layer_id, oMobSkills, {
			sprite_index : sSereneMidnightMap,
			image_speed : 0,
			visible : false,
			spawnDelay : time,
		});
	}
}, [], -1);

summonWisps = time_source_create(time_source_game, 15, time_source_units_seconds, function() {
	instance_create_layer(430, 757, "Instances_1", oSummonWisp);
	instance_create_layer(880, 757, "Instances_1", oSummonWisp);
	instance_create_layer(1330, 757, "Instances_1", oSummonWisp);
	time_source_start(summonWipsAgain);
}, [], -1);
summonWipsAgain = time_source_create(time_source_game, 1, time_source_units_seconds, function() { 
	instance_create_layer(430, 757, "Instances_1", oSummonWisp);
	instance_create_layer(880, 757, "Instances_1", oSummonWisp);
	instance_create_layer(1330, 757, "Instances_1", oSummonWisp);
}, []);
dawnSword = time_source_create(time_source_game, 20, time_source_units_seconds, function() {
	var skill_layer_id = layer_get_id("skills");
	var gapX = 210;
	//var startingX = 880 - gapX*3;
	var startingY = 765;
	var startingX = 110;
	var totalSpawnLocation = 11;
	//Time delay of bomb
	var time;
	
	//10 out of 11 bombs to appear
	randomize();
	var noSpawn = irandom_range(0, 10);
	
	//Roll to see if bombs will appear at the same time
	randomize();
	var allAppear = irandom_range(1, 20);
	
	// 10% chance for all bombs to appear together // 18
	if (allAppear >= 19) {
		time = 1; // for alarm to count down to 0
		for (var i = 0; i < totalSpawnLocation; i++) {
			if (i == noSpawn) continue;
			instance_create_layer(startingX + i*gapX, startingY, skill_layer_id, oMobSkills, {
				sprite_index : sSereneDawnSword,
				image_speed : 0,
				visible : false,
				dawnSwordDelay : time,
			});
		}
	} 
	else {
		for (var i = 0; i < totalSpawnLocation; i++) {
			if (i == noSpawn) continue;
			randomize();
			time = irandom_range(0, 126)*0.1;
			instance_create_layer(startingX + i*gapX, startingY, skill_layer_id, oMobSkills, {
				sprite_index : sSereneDawnSword,
				image_speed : 0,
				visible : false,
				dawnSwordDelay : time,
			});
		}
	}
}, [], -1);

