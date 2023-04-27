/// @description Damage number depth controller

damage_drawer = ds_list_create(); 
hit_drawer = ds_list_create();
skillEffect = ds_list_create();

layer_id = "dmg_num";
l_depth = layer_get_depth(layer_id); // Gets the layer's depth 
la_depth = layer_get_depth("mob_hit");
skill_layer = layer_get_depth("skills_top");




