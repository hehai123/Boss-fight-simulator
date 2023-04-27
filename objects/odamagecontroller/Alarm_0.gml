/// @description Delay between each dmg number
if (counter > 0) {
	
	instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id, oDamage_numbers, {isDarkness : isDarkness}); // -443

	alarm[0] = skill_delay;
    y_displacement += y_change;
	counter --;
}


