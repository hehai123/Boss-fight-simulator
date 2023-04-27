//To store all nightlord skill's state

//Shadow Rush state
function shadow_rush_state() {
	sprite_index = s_shadow_rush;
	
	if (floor(image_index) == 0) image_speed = 10/6*att_speed_multiplier;
	else if (floor(image_index) == 1) image_speed = 10/15*att_speed_multiplier;
}

//Shadow Leap State
function shadow_leap_state() {
	sprite_index = s_shadow_web;
	
	if (floor(image_index) == 0) image_speed = 10/9*att_speed_multiplier;
	else if (floor(image_index) == 5) image_speed = 10/6*att_speed_multiplier;
	else if (floor(image_index) == 8) image_speed = 10/3*att_speed_multiplier;
}

//Showdown State
function showdown_state() {
	sprite_index = s_showdown;
	
	// Animation speed change
	if (floor(image_index) == 0) {
		image_speed = 10/6*att_speed_multiplier;
	}
	else if (floor(image_index) == 10) {
		image_speed = 10/24*att_speed_multiplier;
	}
}

//Spread throw State 
function quadthrow_state() {
	sprite_index = s_quad_throw;
	
	// Animation speed change
	if floor(image_index) == 0
	{
		image_speed = 10/9*att_speed_multiplier;
	}
	else if floor(image_index) == 7
	{
		image_speed = 10/15*att_speed_multiplier;
	}
}

function fumaShurikenState() {
	sprite_index = s_player_fuma;
	
	image_speed = 10/6*att_speed_multiplier;
}

function erdaNovaState() {
	sprite_index = sPlayerErdaNova;
	
	image_speed = 10/60*att_speed_multiplier;
	if (floor(image_index) >= 1) image_speed = 10/15*att_speed_multiplier;
}

function explosiveShurikenState() {
	sprite_index = sPlayerExplosiveShuriken;
	
	if (floor(image_index) == 0) image_speed = 10/30*att_speed_multiplier;
	else if (floor(image_index) == 1) image_speed = 10/9*att_speed_multiplier;
	else if (floor(image_index) == 5) image_speed = 10/21*att_speed_multiplier;
	else if (floor(image_index) == 6) image_speed = 10/9*att_speed_multiplier;
}

function spreadThrowState() {
	sprite_index = sPlayerSpreadThrow;
	
	image_speed = 10/18;
}