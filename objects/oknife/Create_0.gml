/// @description Actual Knife

face_dir = 1; //oPlayer.knife_face_dir;
image_speed = 10/9;
image_xscale = -face_dir;
depth = 2;
face_dir = image_xscale;
//game_fps = game_get_speed(gamespeed_fps); // 144 default 

hsp = 780/global.game_fps*-face_dir;
vsp = 0;
alarm[0] = global.game_fps*0.55;

sound_id = 0; 
sound_played = false;

x_hit = 0; // x position of where knife will end on mob
y_hit = 0; // y position of where knife will end on mob
ang = 0; // anlge at which the knife will fly (for knife that does not hit mob)

x_rand = 0;
y_rand = 0;
hit_mob = false; //see if it hits mobs or not 
collided = false;
