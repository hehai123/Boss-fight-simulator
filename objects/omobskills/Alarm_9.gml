/// @description Midnight pilar hit
var skillDmg = 0.15;
var gotHit = false;
var damageNumHeight = -120;

if (place_meeting(x, y, oPlayer)) gotHit = true;
		
if (gotHit) {
	displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
	
	var hitDirection = (x >= oPlayer.x) ? 1 : -1;
	hitEffectOnPlayer(hitDirection, sSereneMidnightMapHit);
}







