// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function serene_ani_end_test(){
	
	if animation_end() {
		var face_direction_previous = face_direction;
		canStab = false; //To prevent auto stab that is set by next line
		
		if oPlayer.x >= x // If player on right 
		{
			face_direction = -1; // face right 
			if (collision_rectangle(x + 1, y - 160, x + 450, y - 40, oPlayer, false, true)) canStab = true;
		}
		else if oPlayer.x < x // If player on left 
		{
			face_direction = 1; //face left 
			if (collision_rectangle(x - 450, y - 160, x - 1, y - 40, oPlayer, false, true)) canStab = true;
		}
		
		switch (serenePhase) {
			case "Noon":
				noonAttackAI(face_direction_previous);
				break;
			case "Sunset":
				sunsetAttackAI(face_direction_previous);
				break;
			case "Midnight":
				midnightAttackAI(face_direction_previous);
				break;
			case "Dawn":
				dawnAttackAI(face_direction_previous);
				break;
		}
	}
}

function bindRelease () {
	var face_direction_previous = face_direction;
	canStab = false; //To prevent auto stab that is set by next line

	if oPlayer.x >= x // If player on right 
	{
		face_direction = -1; // face right 
		if (collision_rectangle(x + 1, y - 160, x + 450, y - 40, oPlayer, false, true)) canStab = true;
	}
	else if oPlayer.x < x // If player on left 
	{
		face_direction = 1; //face left 
		if (collision_rectangle(x - 450, y - 160, x - 1, y - 40, oPlayer, false, true)) canStab = true;
	}
	switch (serenePhase) {
		case "Noon":
			noonAttackAI(face_direction_previous);
			break;
		case "Sunset":
			sunsetAttackAI(face_direction_previous);
			break;
		case "Midnight":
			midnightAttackAI(face_direction_previous);
			break;
		case "Dawn":
			dawnAttackAI(face_direction_previous);
			break;
	}
}

function noonAttackAI(face_direction_previous) {
	if (mustFma) {
		serene_fma_setState();
		serene_fma_start();
	}
	else if (mustNoonOmni == true) {
		face_direction = face_direction_previous;
		serene_noon_omni_setState();
	} 
	else if (canNoonOmni == true) {
		randomize();
		var ranValue = irandom_range(1, 10);
			
		//50% chance to omni
		switch (ranValue) {
			case 1:
			case 2: 
				sereneMove();
				break;
			case 3:
				if (canStab) sereneStab();
				else if (canDash) sereneDash();
				else sereneMove();
				break;
			case 4:
				if (canDash) sereneDash();
				else if (canNoonLaser == true) serene_noon_laser_setState();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 5:
				if (canNoonLaser == true) serene_noon_laser_setState();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				face_direction = face_direction_previous;
				serene_noon_omni_setState();
				break;
		}	
	}
	else if (canNoonLaser == true) {
		randomize();
		var ranValue = irandom_range(1, 10);
			
		//60% chance to laser
		//20% chance to dash?
		switch (ranValue) {
			case 1:
			case 2: 
				sereneMove();
				break;
			case 3:
				if (canStab) sereneStab();
				else if (canDash) sereneDash();
				else sereneMove();
				break;
			case 4:
				if (canDash) sereneDash();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				serene_noon_laser_setState();
				break;
		}	
	} 
	else if (canDash) {
		randomize();
		var ranValue = irandom_range(1, 9);
			
		//44.44% chance to dash
		//11.11% chance to idle
		switch (ranValue) {
			case 1:
				sereneStand();
				break;
			case 2: 
			case 3:
				sereneMove();
				break;
			case 4:
			case 5:
				if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
				sereneDash();
				break;
		}	
	}
	else if (canStab) sereneStab();
	else sereneMove();
}

function sunsetAttackAI(face_direction_previous) {
	if (mustFma) {
		serene_fma_setState();
		serene_fma_start();
	}
	else if (mustSunsetSkill1) {
		face_direction = face_direction_previous;
		sereneSunsetSkill1();
	} 
	else if (canSunsetSkill1) {
		randomize();
		var ranValue = irandom_range(1, 10);
			
		//50% chance summon meteor
		switch (ranValue) {
			case 1:
			case 2: 
				sereneMove();
				break;
			case 3:
				if (canStab) sereneStab();
				else if (canDash) sereneDash();
				else sereneMove();
				break;
			case 4:
				if (canDash) sereneDash();
				else if (canSunsetAttack3) sereneSunsetAttack3();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 5:
				if (canSunsetAttack3) sereneSunsetAttack3();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				face_direction = face_direction_previous;
				sereneSunsetSkill1();
				break;
		}	
	}
	else if (canSunsetAttack3) {
		randomize();
		var ranValue = irandom_range(1, 10);
			
		//60% chance to do 123 attack
		//20% chance to dash?
		switch (ranValue) {
			case 1:
			case 2: 
				sereneMove();
				break;
			case 3:
				if (canStab) sereneStab();
				else if (canDash) sereneDash();
				else sereneMove();
				break;
			case 4:
				if (canDash) sereneDash();
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				sereneSunsetAttack3();
				break;
		}	
	} 
	else if (canDash) {
		randomize();
		var ranValue = irandom_range(1, 9);
			
		//44.44% chance to dash
		//11.11% chance to idle
		switch (ranValue) {
			case 1:
				sereneStand();
				break;
			case 2: 
			case 3:
				sereneMove();
				break;
			case 4:
			case 5:
				if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
				sereneDash();
				break;
		}	
	}
	else if (canStab) sereneStab();
	else sereneMove();
}

function midnightAttackAI(face_direction_previous) {
	if (mustFma) {
		serene_fma_setState();
		serene_fma_start();
	}
	else if (canMidnightAttack3) {
		randomize();
		var ranValue = irandom_range(1, 10);
			
		//60% chance to do aoe push attack
		//20% chance to dash?
		switch (ranValue) {
			case 1:
				sereneStand();
				break;
			case 2: 
				sereneMove();
				break;
			case 3:
				sereneMidnightAttack3();
				break;
			case 4:
				if (canDash) {
					canDash = false;
					sereneDash();
					time_source_start(midnightDashTimer);
				}
				else if (canStab) sereneStab();
				else sereneMove();
				break;
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				if (canStab) sereneStab();
				else if (canDash) {
					canDash = false;
					sereneDash();
					time_source_start(midnightDashTimer);
				}
				else sereneMove();
				break;
		}	
	} 
	else if (canDash) {
		randomize();
		var ranValue = irandom_range(1, 9);
			
		//44.44% chance to dash
		//11.11% chance to idle
		switch (ranValue) {
			case 1:
				sereneStand();
				break;
			case 2: 
			case 3:
				sereneMove();
				break;
			case 4:
			case 5:
				if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
				canDash = false;
				time_source_start(midnightDashTimer);
				sereneDash();
				break;
		}	
	}
	else if (canStab) sereneStab();
	else sereneMove();
}

function dawnAttackAI(face_direction_previous) {
	if (mustFma) {
		serene_fma_setState();
		serene_fma_start();
	}
	else if (canDawnSkill1) {
		sereneDawnSkill1();
	} 
	else if (canDash) {
		randomize();
		var ranValue = irandom_range(1, 9);
			
		//44.44% chance to dash
		//11.11% chance to idle
		switch (ranValue) {
			case 1:
				sereneStand();
				break;
			case 2: 
			case 3:
				sereneMove();
				break;
			case 4:
			case 5:
				if (canStab) sereneStab();
				else sereneMove();
				break;
			case 6:
			case 7:
			case 8:
			case 9:
				canDash = false;
				time_source_start(dawnDashTimer);
				sereneDash();
				break;
		}	
	}
	else if (canStab) sereneStab();
	else sereneMove();
}