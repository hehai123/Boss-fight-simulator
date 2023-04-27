/// @description Let it travel to the x position

//Used to create mark of assassin additional throwing stars
if (hit_mob == true) {
	var distance = point_distance(x, 0, x_final, 0); 
	if (distance < speed) {
		speed = 0;
		x = x_final;
	}
	
	if (speed == 0) {
		randomize();
		//var angle = 270; 
		var angle = irandom(359);
		assassin_mark(mobId.x, mobId.y - 15, angle);

		instance_destroy();
	}
}
//else if (hit_mob == false) {
//	var distance = point_distance(x, 0, x_final, 0); 
//	if (distance < speed) {
//		speed = 0;
//		x = x_final;
//	}
//	if (speed == 0) instance_destroy();
//}

if (isSpread) {
	if (place_meeting(x, y, mobId)) {
		speed = 0;
		audio_play_sound(sound_quad_hit, 0, false);
		var dmg_control = instance_create_layer(0, 0, "controller", oDamageController);
		dmg_control.skill = "spread"; 
		
		randomize();
		var angle = irandom(359);
		assassin_mark(mobId.x, mobId.y - 15, angle);
		
		instance_destroy();	
	}
	
}

if (additional_attack == true) {
	
	var target = instance_find(mobId, 0);
	var x_dis = (target.bbox_bottom - target.bbox_top)/2;
	seek_target(target.x, target.y - x_dis, max_speed, max_force);

   	if (point_distance(x, y, target.x, target.y - x_dis) < 15) {
		instance_destroy();
	}
}


	
