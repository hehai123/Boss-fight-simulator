/// @description Transit to laser attack

//Transit to map laser hit
skill_layer_id = layer_get_id("skills");
instance_create_layer(x, y, skill_layer_id, oMobSkills, {
	image_speed : 10/9,
	sprite_index : s_serene_map_laser_1,
	image_angle : image_angle,
});	

instance_destroy();

