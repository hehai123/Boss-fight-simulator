/// @description Noon bomb explode
var skillDmg = 0.35;
var gotHit = false;
var damageNumHeight = -120;

if (place_meeting(x, y, oPlayer)) gotHit = true;
		
if (gotHit) {
	darknessDebuff();
	addGuage(20); //17 Aug Serene 3:50 timing for bomb guage amount
	displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);

	var hitDirection = (x >= oPlayer.x) ? 1 : -1;
	instance_create_layer(oPlayer.x, oPlayer.y, skill_layer_id, oMobSkills, {
		sprite_index : s_serene_noon_map_bomb_hit,
		image_speed : 10/6,
		image_xscale : hitDirection,
	});
}
