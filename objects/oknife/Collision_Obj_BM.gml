
if sound_played == false
{
	alarm[0] = -1;
	sound_id = audio_play_sound(sound_quad_hit,0,false);
	alarm[1] = room_speed*0.75;
	visible = false;
	sound_played = true;
	randomize();
	x_rand = irandom_range(0, 20);
	y_rand = irandom_range(0, 20);
	instance_create_layer(x-10+x_rand,y-10+y_rand,"Instances_1",oQuad_hit);
}

	
