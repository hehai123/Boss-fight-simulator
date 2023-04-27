/// @description Sunset Flame Wall dmg tick

if (place_meeting(x, y, oPlayer)) {
	var skillDmg = 0.5;
	var damageNumHeight = -120;
	displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
	var hitDirection = (x >= oPlayer.x) ? 1 : -1;
	hitEffectOnPlayer(hitDirection, sSereneSunsetMapWallHit);
	sunsetDebuff();
}

alarm[7] = 0.5*global.game_fps;








