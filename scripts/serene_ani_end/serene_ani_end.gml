// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function serene_ani_end(){
	if animation_end() {
		if oPlayer.x >= x // If player on right 
		{
			face_direction = -1; // face right 
		}
		else if oPlayer.x < x // If player on ;eft 
		{
			face_direction = 1; //face left 
		}
		
		randomize();
		var change = irandom_range(1,4)
		if (change == 1) {
			state = states.idle;
			image_index = 0;
		}	
		else if (change == 2) {
			state = states.stab;
			image_index = 0;
		}
		else if (change == 3) {
			state = states.attack_laser;
			image_index = 0;
			laser_created = false;
		}
		else {
			state = states.walk;
			image_index = 0;
		}
	}
}