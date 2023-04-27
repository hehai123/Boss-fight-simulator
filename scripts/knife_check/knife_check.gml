// Checker is the true false variable to check if the knife hits mob or not 
function knife_check(max_distance, angle, spread_number) {
	
	var knife_x_travel_distance = 0; // value to be returned at end of code
	
	var x_max = max_distance;
	var y_max = 0;
	if (angle != 0) {
		x_max = max_distance*cos(angle/180*pi);
		y_max = - 25 - max_distance*sin(angle/180*pi);
	}
	
	//Check if monster exist first
	if (instance_exists(oMonster)) {
		//Convert serene mask to the actual hit box
		//Didn't convert since serene hit box is almost the same. Hitbox is 2px above bottom only
		var monster;
		if (spread_number == 0) {
			monster = collision_line(x, y - 25, x + x_max*face_dir, y, oMonster, false, true);
		}
		else {
			monster = collision_line(x, y - 25, x + x_max*face_dir, y + y_max, oMonster, false, true); 
		}
		
		// if monster within hitbox
		if (monster != noone) {
			var mob_x = monster.x; 
			switch (spread_number) {
				case 0:
					hit_mob = true;
				break;
				case 1:
					spread_hit_mob_1 = true;
				break;
				case 2:
					spread_hit_mob_2 = true;
				break;
				case 3:
					spread_hit_mob_3 = true;
				break;
			}
			
			if (spread_number == 0) {
				// quad throw logic 
				
				var x_min;
				var x_hit; // x position where hit animation will appear relative to monster
				
				var x_middle = 0; //Max distance from monster where knife will travel to origin of monster
				
				//If facing right
				if (face_dir == 1) {
					if (x >= mob_x) knife_x_travel_distance = (monster.bbox_right - mob_x)/2;
					else if (x < mob_x) {
						x_middle = max_distance - 2*(mob_x - monster.bbox_left);
						//If far enough, max travel distance
						var distance = mob_x - x; 
						if (distance >= x_middle) knife_x_travel_distance = (distance - x_middle)/2 + x_middle;
						//Else, travel to mob x origin
						else knife_x_travel_distance = distance;
					}
					x_hit = (x + knife_x_travel_distance) - mob_x;
				}
				//If facing left
				else if (face_dir == -1) {
					if (x < mob_x) knife_x_travel_distance = (mob_x - monster.bbox_left)/2;
					else if (x >= mob_x) {
						x_middle = max_distance - 2*(mob_x - monster.bbox_right);
						//If far enought, travel max distance
						var distance = x - mob_x;
						if (distance >= x_middle) knife_x_travel_distance = (distance - x_middle)/2 + x_middle;
						//Else, travel to mob x origin
						else knife_x_travel_distance = distance;
					}
					x_hit = (x - knife_x_travel_distance) - mob_x;
				}
				// If facing right
				//if (face_dir == 1) {
				//	x_min = (monster.bbox_right - mob_x); 
				//	//if player is left of mob
				//	if (x_player < mob_x - x_min) {
				//		knife_x_travel_distance = mob_x - x_player;
				//		knife_x_travel_distance = (knife_x_travel_distance > x_max) ? x_max : knife_x_travel_distance;
				//	}
				//	//if player is right of mob
				//	else if (x_player >= mob_x - x_min) {
				//		knife_x_travel_distance = (monster.bbox_right - x_player)/2;
				//	}
				//	x_hit = (x_player + knife_x_travel_distance) - mob_x;
				//}
				//If facing left
				//else if (face_dir == -1) {
				//	//If player is on right of mob
				//	x_min = (mob_x - monster.bbox_left);
				//	if (x_player > mob_x + x_min) {
				//		knife_x_travel_distance = x_player - mob_x;
				//		knife_x_travel_distance = (knife_x_travel_distance > x_max) ? x_max : knife_x_travel_distance;
				//	}
				//	//If player is on left of mob
				//	else if (x_player <= mob_x + x_min) {
				//		knife_x_travel_distance = (x_player - monster.bbox_left)/2;
				//	}
				//	x_hit = (x_player - knife_x_travel_distance) - mob_x;
				//}
			}
			else {
				// quad throw logic 
				// If facing right
				if (face_dir == 1) {
					//if player is left of mob
					if (x_player < mob_x) {
						knife_x_travel_distance = monster.bbox_left - x_player;
						knife_x_travel_distance = (knife_x_travel_distance > 0) ? knife_x_travel_distance : 1;
					}
					//if player is right of mob
					else if (x_player >= mob_x) {
						knife_x_travel_distance = 1;
					}
				}
				//If facing left
				else if (face_dir == -1) {
					//If player is on right of mob
					if (x_player > mob_x) {
						knife_x_travel_distance = x_player - monster.bbox_right;
						knife_x_travel_distance = (knife_x_travel_distance > 0) ? knife_x_travel_distance : 1;
					}
					//If player is on left of mob
					else if (x_player <= mob_x) {
						knife_x_travel_distance = 1;
					}
				}
			}
			
			// Hit animation 
			var hit = instance_create_layer(0, 0, "controller", oHit_creator);
			var distance_final = knife_x_travel_distance*cos(angle*180/pi); // final distance knife will travel before hitting mob 
			var alarm_time = distance_final/750*screen_fps;
			if (alarm_time < 1) {
				alarm_time = 1;
			}
			hit.alarm[0] = alarm_time; // 750 is knife speed
			hit.alarm[1] = alarm_time; // 750 is knife speed, for damage number timing
			hit.face_dir = - face_dir; 
			if (spread_number == 0) {
				hit.monster_id = monster;
				hit.count = 10; // number of hits 
				hit.y_hit_location = y - 25 - 40;
				hit.x_hit_location = x_hit;
			}
			else {
				hit.count = 5; // number of hits 
				hit.y_hit_location = monster.y - 200;
				//hit.x_hit_location = mob_x;
				hit.spread = true;
			}
			hit.y_hit_min = monster.bbox_bottom - 15; // only -15 for blackmage
			
			return knife_x_travel_distance;
		}
	}
}