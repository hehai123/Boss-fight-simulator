/// @description Insert description here

if (instance_exists(oDamage_numbers)) {
	
	ds_list_clear(damage_drawer); // just clear to prevent problems
	
	var _num = instance_number(oDamage_numbers);

	// add all instance of damage numbers to ds list 
	for (var i = 0; i < _num; i ++) {
		ds_list_add(damage_drawer, instance_find(oDamage_numbers, i));
	}
	
	ds_list_sort(damage_drawer, false);

	// setting depth individually for each damage number
	for (var i = 0; i < _num; i++) {
		var hello = damage_drawer[| i];
		hello.depth = l_depth + i;
	}
}

if (instance_exists(oQuad_hit)) {
	
	ds_list_clear(hit_drawer); // just clear to prevent problems
	
	var _num = instance_number(oQuad_hit);

	// add all instance of damage numbers to ds list 
	for (var i = 0; i < _num; i ++) {
		ds_list_add(hit_drawer, instance_find(oQuad_hit, i));
	}
	
	ds_list_sort(hit_drawer, false);

	// setting depth individually for each damage number
	for (var i = 0; i < _num; i++) {
		var hello = hit_drawer[| i];
		hello.depth = la_depth + i; // hit animation + 4
	}
}

if (instance_exists(oSkillTop)) {
	
	ds_list_clear(skillEffect); // just clear to prevent problems
	
	var _num = instance_number(oSkillTop);
	
	// add all instance of damage numbers to ds list 
	for (var i = 0; i < _num; i ++) {
		ds_list_add(skillEffect, instance_find(oSkillTop, i));
	}
	
	if (ds_list_size(skillEffect) > 1) {
		ds_list_sort(skillEffect, false);

		// setting depth individually for each damage number
		for (var i = 0; i < _num; i++) {
			var hello = skillEffect[| i];
			hello.depth = skill_layer + i; // hit animation + 4
		}
	}
}
	
