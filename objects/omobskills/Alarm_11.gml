/// @description Dawn sword land
var skillDmg = 0.25;
var gotHit = false;
var damageNumHeight = -120;

if (place_meeting(x, y, oPlayer)) gotHit = true;
		
if (gotHit) {
	addGuage(10);
	displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
	
	var hitDirection = (x >= oPlayer.x) ? 1 : -1;
	hitEffectOnPlayer(hitDirection, sSereneDawnSwordHit);
}



