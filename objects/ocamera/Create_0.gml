following = oPlayer;

h_border = 40; //60
v_border = 10; //300
camera_y_offset = -40;

acc_x = 1.44/global.game_fps; //0.015
acc_y = 1/global.game_fps; //0.04

//Map origin
x_origin = 880;
y_origin = 450;

draw_x = 0;
draw_y = 0;

//Vision restriction
VRLeft = -888;
VRRight = 920;
VRTop = -310;
VRBottom = 530;

VRLeft_x = x_origin + VRLeft;
VRRight_x = x_origin + VRRight;
VRTop_y = y_origin + VRTop;
VRBottom_y = y_origin + VRBottom;

//draw_y = 0; // for testing

bg_moon_id = layer_get_id("BG_Moon");
bg_island_id = layer_get_id("BG_Island");
bg_color1 = layer_get_id("BG_Color_1");

bg_color2 = layer_get_id("BG_Color_2");
bg_color3 = layer_get_id("BG_Color_3");
bg_color4 = layer_get_id("BG_Color_4");

bg_cloud1 = layer_get_id("BG_Cloud_1");
bg_cloud2 = layer_get_id("BG_Cloud_2");
bg_cloud3 = layer_get_id("BG_Cloud_3");
bg_cloud4 = layer_get_id("BG_Cloud_4");
bg_cloud5 = layer_get_id("BG_Cloud_5");
bg_mountain = layer_get_id("BG_Mountain");
bg_moon_2 = layer_get_id("BG_Moon_2");
