var target_x;
var cam_x;
//710
var limit = 385; // For outer camera border so camera stays with player if player moves too fast 
//385 is correct length but transition is bad
x = clamp(x, following.x - h_border, following.x + h_border);
target_x = x - camW()/2;

if (camX() - target_x >= limit || camX() - target_x <= -limit) {
	cam_x = lerp(camX(), target_x, acc_x*2.5)
}
else {
	cam_x = lerp(camX(), target_x, acc_x);
}

y = clamp(y, following.y - v_border + camera_y_offset, following.y + v_border + camera_y_offset);
var target_y = y - camH()/2;
var cam_y = lerp(camY(), target_y, acc_y);

cam_x = clamp(cam_x, VRLeft_x - 1, VRRight_x - camW() - 1);
cam_y = clamp(cam_y, VRTop_y - 3, VRBottom_y - camH() - 3);
camPos(cam_x, cam_y);

draw_x = cam_x;
draw_y = cam_y;

//x 197 = 880 - 1366/2 
//y 66 = 450 - 768/2

var y_pos = cam_y + 20; // why 18?
var x_pos = cam_x - 197;

layer_x(bg_moon_id, x_pos*0.97);
layer_y(bg_moon_id, y_pos*0.6); 

layer_x(bg_island_id, x_pos*0.95);
layer_y(bg_island_id, y_pos*0.95);

layer_x(bg_color1, cam_x);
layer_y(bg_color1, y_pos);

layer_x(bg_color2, cam_x);
layer_y(bg_color2, y_pos);

layer_x(bg_cloud1, x_pos*0.9);
layer_y(bg_cloud1, y_pos*0.95); 

layer_x(bg_cloud2, x_pos*0.85);
layer_y(bg_cloud2, y_pos*0.95); 

layer_x(bg_cloud3, x_pos*0.82);
layer_y(bg_cloud3, y_pos*0.9); 

layer_x(bg_cloud4, x_pos*0.8);
layer_y(bg_cloud4, y_pos*0.5); 

layer_x(bg_cloud5, x_pos*0.8);
layer_y(bg_cloud5, y_pos*0.8); 

layer_x(bg_mountain, x_pos*0.4);
layer_y(bg_mountain, y_pos*0.85); 

layer_x(bg_moon_2, x_pos*0.97);
layer_y(bg_moon_2, y_pos*0.6); 

layer_x(bg_color3, x_pos);
layer_y(bg_color3, y_pos*0.15);

layer_x(bg_color4, x_pos);
layer_y(bg_color4, y_pos);



