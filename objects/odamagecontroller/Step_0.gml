/// @description Insert description here

if (created == false) {
	
	created = true; // prevents duplicates
	
	switch(skill) 
	{
		case "showdown":
			counter = skill_details.showdown.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id, oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.showdown.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement += y_change;
			counter --;
		break;
		
		case "quadthrow":
			counter = skill_details.quadthrow.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id, oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.quadthrow.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement += y_change;
			counter --;
		break;
		case "spreadthrow":
			counter = skill_details.spreadthrow.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y, layer_id, oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.spreadthrow.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement = 0;
			y_change = 0;

			counter --;
		break;
		case "fuma":
			counter = skill_details.fuma.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id , oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.fuma.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement += y_change;

			counter --;
		break;
		case "erda":
			counter = skill_details.erda.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id , oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.erda.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement += y_change;

			counter --;
		break;
		case "explosive":
			counter = skill_details.explosive.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y + y_displacement, layer_id , oDamage_numbers, {isDarkness : isDarkness});
			
			skill_delay = skill_details.explosive.delay*screen_fps;
			alarm[0] = skill_delay;
			
			y_displacement += y_change;

			counter --;
		break;
		case "spread":
			counter = skill_details.spread.hits;
			instance_create_layer(oSerene.x, oSerene.y + monster_head_y, layer_id, oDamage_numbers, {isDarkness : isDarkness});
			counter --;
		break;
	}
}

// if all damage number displayed
if (counter == 0) {
	instance_destroy();
}
	
