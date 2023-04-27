/// @description Insert description here

// for player
if (mobId == 0) {
	x = oPlayer.x + oPlayer.face_dir*8;
	y = oPlayer.y - 50;
}
else {
	x = mobId.x + headPosX;
	y = mobId.y + headPosY;
}

switch (sprite_index) {
	case sShowdownDebuff:
		if (mobId.showdownDebuff == false) instance_destroy();	
		break;
	case sDebuffDarkness:
		if (oPlayer.isDarkness == false) instance_destroy();
		break;
	case sSereneSunsetDisease:
		if (oPlayer.isSunsetStatus == false) instance_destroy();
		break;
}









