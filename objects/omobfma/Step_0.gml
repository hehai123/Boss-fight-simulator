/// @description Insert description here
// You can write your code in this editor

if (sprite_index == s_serene_fma_screen0) {
	if (floor(image_index) >= 1) {
		image_speed = 10/9;	
	}
}

if (animation_end()) {
	instance_destroy();
}
