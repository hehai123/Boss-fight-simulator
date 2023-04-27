/// @description Insert description here

if mouse_check_button_pressed(mb_left)
{
	if point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x + 81, y + 81, 78)
	{
		//relative click position 
		xx = x - device_mouse_x_to_gui(0);
		yy = y - device_mouse_y_to_gui(0);
		grab = true; 
	}
}

if grab == true
{
	x = device_mouse_x_to_gui(0) + xx;
	y = device_mouse_y_to_gui(0) + yy; 

	if mouse_check_button_released(mb_left)
	{
		grab = false;
	}
}

noonStartAngle = dawnStartAngle + dawnAngle;
sunsetStartAngle = noonStartAngle + noonAngle - 90;
sunset2_start = sunsetStartAngle + sunsetAngle - 90;
midnightStartAngle = dawnStartAngle - midnightAngle;

counter ++;
//Ratio is calculated already. Do not change. 60s = 54 degree
if (counter >= global.game_fps*10/9 - 1 && canArrowMove) {
	arrowAngle ++;
	counter = 0;
	
	switch (currentPhase) {
		case "Noon":
			if (arrowAngle mod 360 == sunsetStartAngle - 270 - 1) { //-11 for testing 
				if (instance_exists(oMobSkills)) oMobSkills.justBeforeFma = true;
			}
			else if (arrowAngle mod 360 == sunsetStartAngle -270) { //-270 // - 10 for testing 
				oSerene.mustFma = true;
				canArrowMove = false;
				alarm[1] = 3*global.game_fps; //3 sec stop
				oController.currentPhase = "Transition";
				oParticles.currentPhase = "Sunset";
				oParticles.updated = false;
				if (instance_exists(oMobSkills)) oMobSkills.isFma = true;
			}
			break;
		case "Sunset":
			if (arrowAngle mod 360 == midnightStartAngle  - 1  ) { // -1 // + 165 - 1 for testing
				if (instance_exists(oMobSkills)) oMobSkills.justBeforeFma = true;
			}
			else if (arrowAngle mod 360 == midnightStartAngle  ) { // nothing // + 165 for testing
				oSerene.mustFma = true;
				canArrowMove = false;
				alarm[1] = 3*global.game_fps; //3 sec stop
				oController.currentPhase = "Transition";
				oParticles.currentPhase = "Midnight";
				oParticles.updated = false;
				if (instance_exists(oMobSkills)) oMobSkills.isFma = true;
			}
			break;
		case "Midnight":
			if (arrowAngle mod 360 == dawnStartAngle - 1) { // -1 // + 145 - 1 for testing
				if (instance_exists(oMobSkills)) oMobSkills.justBeforeFma = true;
			}
			else if (arrowAngle mod 360 == dawnStartAngle) { //Nothing // + 145 for testing
				oSerene.mustFma = true;
				canArrowMove = false;
				alarm[1] = 3*global.game_fps; //3 sec stop
				oController.currentPhase = "Transition";
				oParticles.currentPhase = "Dawn";
				oParticles.updated = false;
				if (instance_exists(oMobSkills)) oMobSkills.isFma = true;
			}
			break;
		case "Dawn":
			if (arrowAngle mod 360 == noonStartAngle - 1) {
				if (instance_exists(oMobSkills)) oMobSkills.justBeforeFma = true;
				if (instance_exists(oSummonDeer)) {
					oSummonDeer.state = states.die;
					oSummonDeer.image_index = 0;
				}
				if (instance_exists(oSummonWisp)) {
					oSummonWisp.state = states.die;
					oSummonWisp.image_index = 0;
				}
			}
			else if (arrowAngle mod 360 == noonStartAngle) {
				oSerene.mustFma = true;
				canArrowMove = false;
				alarm[1] = 3*global.game_fps; //3 sec stop
				oController.currentPhase = "Transition";
				oParticles.currentPhase = "Noon";
				oParticles.updated = false;
				if (instance_exists(oMobSkills)) oMobSkills.isFma = true;
			}
			break;
	}
}


//Gauge ratio
guageRatio = guageValue/guageMaxValue;
guageToPixel = 54*(1 - guageRatio);