/// @description Insert description here

faceDir = -1; //1 is facing left //Face right when summoned
image_xscale = faceDir;
gameSpeed = -45; // data is -45
hsp = (125 + (gameSpeed)*1.25)/global.game_fps;
state = states.idle;

deerAttack = time_source_create(time_source_game, 1.02, time_source_units_seconds, function () {
	var skillDmg = 0.1;
	var skill_layer_id = layer_get_id("skills");
	var gotHit = false;
	var damageNumHeight = -120;
	
	if (place_meeting(x, y, oPlayer)) gotHit = true;
	
	if (gotHit) {
		displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
		//addGuage(10);
		var hitDirection = (x >= oPlayer.x) ? 1 : -1;
		knockBack(hitDirection, 1.5, 1); //stunned for 1.5s
		hitEffectOnPlayer(hitDirection, sSereneDawnDeerAttackHit);
	}
}, [], 1, time_source_expire_nearest);







