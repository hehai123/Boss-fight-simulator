/// @description Omni attack hit checker

if (!oPlayer.canSereneOmniHit) exit;
		
var skillDmg = 0.5;
var gotHit = false;
var damageNumHeight = -120;
	
//Change player's collision hitbox
if (oPlayer.state == states.prone) {
	oPlayer.mask_index = s_prone_mask;
}
else oPlayer.mask_index = s_stand_mask;
if (place_meeting(x, y, oPlayer)) {
	gotHit = true;
	with (oPlayer) {
		canSereneOmniHit = false;
		time_source_start(global.omniHitTimer);
	}
}
//Change player's collision hitbox back
oPlayer.mask_index = s_stand;
	
if (gotHit) {
	darknessDebuff();
	displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

	var hitDirection = (oSerene.x >= oPlayer.x) ? -1 : 1;
	instance_create_layer(oPlayer.x, oPlayer.y, skill_layer_id, oMobSkills, {
		sprite_index : s_serene_noon_omni_hit,
		image_speed : 10/6,
		image_xscale : hitDirection,
	});
}	







