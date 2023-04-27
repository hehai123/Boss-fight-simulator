/// @description Insert description here

image_speed = 10/6;

depth = 2;

speed = 750/global.game_fps; // still testing 

//alarm[0] = 0.5*global.game_fps; // self-destroy if never collide

hit_mob = false;
x_final = 0; // x destination if it hits enemy
isSpread = false; //True if knife belongs to spread throw

additional_attack = false; // creates homing stars
max_force = 45/global.game_fps;
max_speed = 1400/global.game_fps; 
mobId = oSerene;
