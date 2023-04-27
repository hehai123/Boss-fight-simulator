/// @description Fuma hit checker

var monsterId = instance_place(x, y, oMonster);
if (monsterId != noone) {
	var originX = oMonster.bbox_right - oMonster.bbox_left;
	var originY = oMonster.bbox_top - oMonster.bbox_bottom;
	var timeController = instance_create_layer(0, 0, "controller", oTimeControl, {
		skillType : "fuma",
		mobId : monsterId,
		image_xscale : image_xscale
	});
}
alarm[1] = 0.18*global.game_fps;









