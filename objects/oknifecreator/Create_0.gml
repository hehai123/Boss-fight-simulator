/// @description Knife creator

face_dir = 1;
screen_fps = global.game_fps;
//shadow_partner = false; 
alarm[0] = 0.09*screen_fps; // delay between each knife
alarm[1] = 0.135*screen_fps; // shadow partner stars

knife_count = 0;
knife_count_shadow = 0;
knife_max_distance = 437.5; // max distance knife can fly // 380 350/0.8
spread_knife_max_distance = 350; // max distance knife can fly

y_change = 16;
y_final = - 40;

spread_throw = false;

//Spread throw angles
spread_angle_1 = 25; //25 degrees 
spread_angle_2 = 45;
spread_angle_3 = -25;

collision_check = false; 
collision_check_spread = false;  

x_mob = 0; 
y_mob = 0;
x_player = x;
y_player = y;
hit_mob = false; 
spread_hit_mob_1 = false; // checks if spread 1 hits monster or not
spread_hit_mob_2 = false; // checks if spread 2 hits monster or not
spread_hit_mob_3 = false; // checks if spread 3 hits monster or not

x_distance = 0; //distance knife will travel before hitting monster
spread_x_distance_1 = 0; //distance knife will travel before hitting monster
spread_x_distance_2 = 0; //distance knife will travel before hitting monster
spread_x_distance_3 = 0; //distance knife will travel before hitting monster

