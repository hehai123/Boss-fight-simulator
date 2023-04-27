/// @description Passive guage gain/lose

switch (currentPhase) {
	case "Noon":
		guageValue ++;
		alarm[0] = 5*global.game_fps;
		break;
	case "Sunset":
	case "Dawn":
		guageValue += 0.5;
		alarm[0] = 5*global.game_fps;
		break;
	case "Midnight":
		if (guageValue > 0) guageValue -= 7.5;
		if (guageValue < 0) guageValue = 0;
		alarm[0] = 1.5*global.game_fps;
		break;
}


