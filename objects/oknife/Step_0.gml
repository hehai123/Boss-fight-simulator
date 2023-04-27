//x += hsp;
//y += vsp;

// setting how it moves aginst moving mobs
if (hit_mob == true) {
	var angle = point_direction(x, y, oSerene.x + x_hit, oSerene.y + y_hit);
	motion_set(angle, 800/global.game_fps);
	
	//if collided 
	if (collision_line(oSerene.x + x_hit, oSerene.y - 408, oSerene.x + x_hit, oSerene.y + 100, oKnife, false, false)) { //changed self to oknife
		collided = true;
		alarm[0] = -1;
	}
}

else {
	if (face_dir == 1) {
		motion_set(ang, 800/global.game_fps);
	}
	else {		
		motion_set(ang, 800/global.game_fps);
	}
}

if (collided == true) {
	visible = false;
	
	if (sound_played == false) { // do everything here once
		sound_played = true;
		sound_id = audio_play_sound(sound_quad_hit, 0, false);
		alarm[1] = global.game_fps*0.75; // to stop sound after 0.75s
		//var hit = instance_create_layer(x, y, "Instances_1", oQuad_hit);
		//hit.image_xscale = face_dir;
		randomize();
		var ran_x = irandom_range(-30,30);
		var ran_y = irandom_range(-30,30);
		//var hit = instance_create_layer(x + ran_x, y + ran_y, "skills", oSkill_ani);
		//hit.sprite_index = s_quadthrow_hit;
	}
}

//if collision_rectangle(oSerene.x-80,oSerene.y-408,oSerene.x+75,oSerene.y+15,self,false,false)
//{
//	collided = true;
//	alarm[0] = -1;
//}

//if collided == true
//{
//	// Check if knife has travelled to centre
//	if collision_line(oSerene.x,oSerene.y-408,oSerene.x,oSerene.y+100,self,false,false) 
//	{
//		while !collision_line(oSerene.x,oSerene.y-408,oSerene.x,oSerene.y+100,self,false,false)
//		{
//			x += sign(hsp)
//		}
//		hsp = 0;
//		visible = false; 
//		if sound_played == false  // do everything here once
//		{
//			sound_played = true;
//			sound_id = audio_play_sound(sound_quad_hit,0,false);
//			alarm[1] = room_speed*0.75; // to stop sound after 0.75s
//			randomize();
//			x_rand = irandom_range(0, 20);
//			y_rand = irandom_range(0, 20);
//			var hit = instance_create_layer(x-10+x_rand,y-10+y_rand,"Instances_1",oQuad_hit);
//			hit.image_xscale = face_dir;
//		}
//	}
//}


