function seek_target(target_x, target_y, max_speed, max_force) {
	var desiredX = target_x - x;
	var desiredY = target_y - y;
	var desiredNormaliseFactor = sqrt(sqr(desiredX) + sqr(desiredY));
	var steeringX = desiredX/desiredNormaliseFactor*max_speed - hspeed;
	var steeringY = desiredY/desiredNormaliseFactor*max_speed - vspeed;
	
	//max force
	var steeringMag = sqrt(sqr(steeringX) + sqr(steeringY));
	if (steeringMag > max_force) {
		steeringX *= max_force/steeringMag;
		steeringY *= max_force/steeringMag;
	}

	hspeed += steeringX;
	vspeed += steeringY;
}
