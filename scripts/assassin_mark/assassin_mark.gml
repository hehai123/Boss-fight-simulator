// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function assassin_mark(x, y, angle){
	var knife = instance_create_layer(x, y, "Instances_1", oStar);
	//knife.additional_attack = true;
	knife.alarm[0] = 1.5*global.game_fps; //1.5
	knife.alarm[1] = 0.06*global.game_fps; //0.2
	knife.alarm[2] = 0.06*global.game_fps; // start tracking target
	knife.direction = angle;
	knife.speed = 0;
}