/// @description Damage number controller
for (k = 0; k < oPlayer.knife_number; k++)
{
	if k = 0
	{
		alarm[k] = 1; 
	}
	else
	{
		alarm[k] = global.game_fps*(0.09*k);
	}
}

layer_id = "Layer_dmg_num";

l_depth = layer_get_depth(layer_id); // Gets the layer's depth 
monster_object = oSerene;

ae = instance_create_layer(monster_object.x, monster_object.y-443-120,layer_id,oDamage1);
ae.depth = l_depth - 5;
ad = instance_create_layer(monster_object.x, monster_object.y-443-90,layer_id,oDamage1);
ad.depth = l_depth - 4;
ac = instance_create_layer(monster_object.x, monster_object.y-443-60,layer_id,oDamage1);
ac.depth = l_depth - 3;
ab = instance_create_layer(monster_object.x, monster_object.y-443-30,layer_id,oDamage1);
ab.depth = l_depth - 2;
aa = instance_create_layer(monster_object.x, monster_object.y-443,layer_id,oDamage1);
aa.depth = l_depth - 1;











