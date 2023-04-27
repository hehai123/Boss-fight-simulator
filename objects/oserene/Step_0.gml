image_xscale = face_direction; 

//collision with ground
vsp += grv; 

if (place_meeting(x, y + vsp, oTile))
{
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oTile)) y += vsp;
	}
	vsp = 0;
}

y += vsp;

//Showdown debuff on head
//if (showdownDebuff) {
	
//}

if (state == states.idle) {
	text = "idle"
	image_speed = 10/9;
	hsp = 0;
	
	switch (serenePhase) {
		case "Noon":
			sprite_index = s_serene_noon_stand;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetStand;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightStand;
			break;
		case "Dawn":
			sprite_index = sSereneDawnStand;
			break;
	}
	
	//Fma check
	serene_fma_startCheck();
	
	//serene_ani_end();
	serene_ani_end_test();
}

else if (state == states.walk) {
	text = "walking"
	image_speed = 10/9;
	switch (serenePhase) {
		case "Noon":
			sprite_index = s_serene_noon_stand;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetMove;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightMove;
			break;
		case "Dawn":
			sprite_index = sSereneDawnMove;
			break;
	}
	hsp = -move_speed*face_direction;
	
	if (collision_rectangle(x + 1, y - 160, x + 450, y - 40, oPlayer, false, true)) {
		face_direction = -1;
		sereneStab();
	}
	else if (collision_rectangle(x - 450, y - 160, x - 1, y - 40, oPlayer, false, true)) {
		face_direction = 1;
		sereneStab();
	}
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
}

else if (state == states.stab) {
	text = "stab"
	hsp = 0;
	switch (serenePhase) {
		case "Noon":
			sprite_index = s_serene_noon_stab;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetStab;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightStab;
			break;
		case "Dawn":
			sprite_index = sSereneDawnStab;
			break;
	}
	
	// Animation speed
	if (floor(image_index) == 0) image_speed = 10/6;
	else if (floor(image_index) >= 21) image_speed = 10/9;
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
}

else if (state == states.attack_laser) {
	text = "laser"
	image_speed = 10/12;
	sprite_index = s_serene_noon_laser;
	hsp = 0;
	
	// Animation speed
	if (floor(image_index) >= 10) image_speed = 10/9;
	
	//Fma check
	serene_fma_startCheck();
	
	//serene_ani_end();
	serene_ani_end_test();
}

else if (state == states.dash) {
	text = "dash"
	image_speed = 10/3;
	sprite_index = s_serene_noon_dash;
	switch (serenePhase) {
		case "Noon":
			sprite_index = s_serene_noon_dash;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetDash;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightDash;
			break;
		case "Dawn":
			sprite_index = sSereneDawnDash;
			break;
	}
	
	// Animation speed
	if (floor(image_index) >= 23) {
		image_speed = 10/9;
		
		if (dashAttackCounter > 0) {
			//If got showdown debuff, dont hit player
			if (!showdownDebuff) {
				// Facing left
				if (face_direction == 1) {
					if (collision_rectangle(xprevious - 1, y - 215, x, y + 1, oPlayer, false, true)) dashHit = true;
				}
				// Facing right
				else if (face_direction == -1) {
					if (collision_rectangle(xprevious + 1, y - 215, x, y + 1, oPlayer, false, true)) dashHit = true;
				}
			}
			
			if (dashHit) {
				dashHit = false;
				dashAttackCounter = 0;

				var skillDmg;
				var hitEffect;
				var dashSpeed;
				var damageNumHeight = -120;
				
				switch (serenePhase) {
					case "Noon":
						skillDmg = 0.35;
						hitEffect = sSereneNoonDashHit;
						addGuage(10);
						darknessDebuff();
						break;
					case "Sunset":
						skillDmg = 0.5;
						hitEffect = sSereneSunsetDashHit;
						addGuage(10);
						sunsetDebuff();
						break;
					case "Midnight":
						skillDmg = 0.15;
						hitEffect = sSereneMidnightDashHit;
						break;
					case "Dawn":
						skillDmg = 0.3;
						hitEffect = sSereneDawnDashHit;
						addGuage(10);
						break;
				}
				displayDmgNum(oPlayer.x, oPlayer.y + damageNumHeight, skillDmg);
				knockBack(face_direction, 1.5, 2); //stunned for 1s ??
				hitEffectOnPlayer(face_direction, hitEffect);
			}
			else dashAttackCounter--;
		}
	}
	
	//Fma check
	serene_fma_startCheck();
	
	//Dash deceleration
	dashCounter --;
	if (dashCounter <= 0) hsp = Approach(hsp, 0, dec_x);

	serene_ani_end_test();
}

else if (state == states.omni) {
	text = "omni laser"
	image_speed = 10/9;
	sprite_index = s_serene_noon_omni;
	hsp = 0;
	
	//Fma check
	serene_fma_startCheck();

	serene_ani_end_test();
}

else if (state == states.sunsetSkill1) {
	sprite_index = sSereneSunsetSkill1;
	image_speed = 10/9;
	hsp = 0;
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
}

else if (state == states.sunsetAttack3) {
	sprite_index = sSereneSunsetAttack3;
	image_speed = 10/3;
	if (floor(image_index) >= 7) image_speed = 10/6;
	
	dashCounter --;
	if (dashCounter <= 0) hsp = 0;

	serene_fma_startCheck();
	if (animation_end()) {
		state = states.sunsetAttack4;
		image_index = 0;
		
		// If player on right 
		if (oPlayer.x >= x) face_direction = -1; // face right 
		else face_direction = 1;
		time_source_reset(sunsetAttack4Attack);
		time_source_start(sunsetAttack4Attack);
		dashCounter = sunsetDashCounterValue;
	}
}

else if (state == states.sunsetAttack4) {
	sprite_index = sSereneSunsetAttack4;
	image_speed = 10/3;
	if (floor(image_index) >= 5) image_speed = 10/6;
	
	dashCounter --;
	if (dashCounter <= 0) hsp = 0;
	
	serene_fma_startCheck();
	if (animation_end()) {
		state = states.sunsetAttack5;
		image_index = 0;
		
		// If player on right 
		if (oPlayer.x >= x) face_direction = -1; // face right 
		else face_direction = 1;
		
		time_source_start(sunsetAttack5Attack);
	}
}

else if (state == states.sunsetAttack5) {
	sprite_index = sSereneSunsetAttack5;
	image_speed = 10/3;
	hsp = 0;
	if (floor(image_index) >= 3) image_speed = 10/6;
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
}

else if (state == states.midnightAttack3) {
	sprite_index = sSereneMidnightPush;
	image_speed = 10/6;
	hsp = 0;
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
}

else if (state == states.bound) {
	hsp = 0;	
	
	switch (serenePhase) {
		case "Noon":
			sprite_index = sSereneNoonStunned;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetStunned;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightStunned;
			break;
		case "Dawn":
			sprite_index = sSereneDawnStunned;
			break;
	}
	
	//Fma check
	serene_fma_startCheck();
}

else if (state == states.fma) {
	image_speed = 10/6;
	sprite_index = s_serene_fma;
	hsp = 0;
	
	switch (serenePhase) {
		case "Noon":
			sprite_index = s_serene_fma;
			break;
		case "Sunset":
			sprite_index = sSereneSunsetSkill3;
			break;
		case "Midnight":
			sprite_index = sSereneMidnightSkill3;
			break;
		case "Dawn":
			sprite_index = sSereneDawnSkill3;
			break;
	}
	
	// Animation speed
	if (floor(image_index) >= 52) image_speed = 10/12; //Default is 10/90

	serene_ani_end_test();
}

else if (state == states.dawnSkill1) {
	sprite_index = sSereneDawnSkill1;
	image_speed = 10/9;	
	hsp = 0;
	
	//Fma check
	serene_fma_startCheck();
	serene_ani_end_test();
	
}

if (place_meeting(x + hsp, y, oWall))
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oWall)) x += hsp;
	}
	hsp = 0;
}

x += hsp;