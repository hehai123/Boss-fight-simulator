/// @description Insert description here

faceDir = -1; //1 is facing left //Face right when summoned
image_xscale = faceDir;
gameSpeed = -60; // data is -60
hsp = (125 + (gameSpeed)*1.25)/global.game_fps;
state = states.idle;

wispAttack = time_source_create(time_source_game, 0.75, time_source_units_seconds, function () {
	var skillDmg = 0.25;
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	if (place_meeting(x, y, oPlayer)) gotHit = true;
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
		//addGuage(10);
		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		hitEffectOnPlayer(hitDirection, sSereneDawnWispAttackHit);
	}
}, [], 1, time_source_expire_nearest);

alarm[0] = 22*global.game_fps; //die after 22s 










