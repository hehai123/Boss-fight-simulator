// Script assets have changed for v2.3.0 see
// Spread 0 = spread throw not on
//		  1 = spread 1 stuff
//		  2 = spread 2 stuff
//		  3 = spread 3 stuff
// angle = 0 for default quad throw 

function knife_create(y_end, spread, x_distance, angle) {
	var knife = instance_create_layer(x, y - 25, "Instances_1", oStar);
	
	// Setting the knife angle 
	var dirrection;
	if (face_dir == 1) {
		dirrection = angle;
	}
	else if (face_dir == -1) {
		dirrection = 180 - angle;
	}
	
	switch (spread) {
		case 0 :
			dirrection = point_direction(0, 0, x_distance*face_dir, y_end); // Setting knife angle 
			if (hit_mob == true) {
				knife.alarm[0] = -1;
				knife.x_final = x + x_distance*face_dir;
				knife.hit_mob = true;
			}
			break;
		case 1:
			if (spread_hit_mob_1 == true) {
				knife.alarm[0] = -1;
				knife.x_final = x + x_distance*face_dir;
				knife.hit_mob = true;
			}
			else {
				knife.alarm[0] = x_distance/750*screen_fps;
			}
			break;
		case 2:
			if (spread_hit_mob_2 == true) {
				knife.alarm[0] = -1;
				knife.x_final = x + x_distance*face_dir;
				knife.hit_mob = true;
			}
			else {
				knife.alarm[0] = x_distance/750*screen_fps;
			}
			break;
		case 3:
			if (spread_hit_mob_3 == true) {
				knife.alarm[0] = -1;
				knife.x_final = x + x_distance*face_dir;
				knife.hit_mob = true;
			}
			else {
				knife.alarm[0] = x_distance/750*screen_fps;
			}
			break;
	}
	
	knife.direction = dirrection;
	
}