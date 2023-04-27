/// @description For events with delay

//mobId = 0;
//hitRelativeX = 0; //X pos to create hit effect wrt monster
//hitRelativeY = 0; //Y pos to create hit effect wrt monster

//skillType = "None"; //Skill name

test = 0;
test1 = 0;

skillsData = 
{	
	quadThrow :
	{
		delay : 0.09,
		rand : 30,
		startHeight : -40,
		heightChange : 16,
		count : 10
	},
	fuma:
	{
		delay : 0.1,
		rand : 26,
		count : 10
	},
	erda:
	{
		delay : 0.09,
		rand : 100,
		count : 5
	},
	explosivePre:
	{
		delay : 0.11, // Should be 0.1 in game
		rand : 200,
	},
	explosive:
	{
		delay : 0.09,
		rand : 40, //20 randomHitOrigin = 40 rand
		count : 10
	}
}

var doNothing = function() {}
timer = time_source_create(time_source_game, 1, time_source_units_seconds, doNothing, []);

switch (skillType) {
	case "quadThrow" :
		//First hit
		randomize();
		var ranValue = skillsData.quadThrow.rand/2;
		var ranX = irandom_range(-ranValue, ranValue);
		var ranY = irandom_range(-ranValue, ranValue);
		var finalX = mobId.x + hitRelativeX + ranX;
		var beforeFinalY = hitRelativeY + ranY + skillsData.quadThrow.startHeight;
		if (mobId.y + beforeFinalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom - mobId.y;
		var finalY = mobId.y + beforeFinalY;
		//Hit effect
		instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : s_quadthrow_hit, image_xscale : image_xscale, follow : false});
		//Damage numbers
		var dmg_control = instance_create_layer(0, 0, "controller", oDamageController, {isDarkness : oPlayer.isDarkness});
		dmg_control.skill = "quadthrow"; 
		audio_play_sound(sound_quad_hit, 0, false);
		var counter = skillsData.quadThrow.count;
		counter --;
		test1 = counter;
		var dosomething = function() {
			var counter1 = time_source_get_reps_completed(timer);
			randomize();
			var ranValue = skillsData.quadThrow.rand/2;
			var ranX = irandom_range(-ranValue, ranValue);
			var ranY = irandom_range(-ranValue, ranValue);
			var finalX = mobId.x + hitRelativeX + ranX;
			var beforeFinalY = hitRelativeY + ranY + skillsData.quadThrow.startHeight + counter1*skillsData.quadThrow.heightChange;
			if (mobId.y + beforeFinalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom - mobId.y;
			var finalY = mobId.y + beforeFinalY;
			instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : s_quadthrow_hit, image_xscale : image_xscale, follow : false});
			sound_id = audio_play_sound(sound_quad_hit, 0, false);
		}
		time_source_reconfigure(timer, skillsData.quadThrow.delay, time_source_units_seconds, dosomething, [], counter);
		time_source_start(timer);
		break;
	case "fuma":
		//First hit
		randomize();
		ranValue = skillsData.fuma.rand/2;
		ranX = irandom_range(-ranValue, ranValue);
		ranY = irandom_range(-ranValue, ranValue);
		var relativeX = mobId.bbox_right - mobId.bbox_left;
		var relativeY = mobId.bbox_top - mobId.bbox_bottom;
		finalX = relativeX/2 + mobId.bbox_left + ranX;
		finalY = relativeY/2 + mobId.bbox_bottom + ranY;
		if (finalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom;

		//Hit effect
		instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : s_fuma_hit, image_xscale : image_xscale, follow : false});
		//Damage numbers
		dmg_control = instance_create_layer(0, 0, "controller", oDamageController, {isDarkness : oPlayer.isDarkness});
		dmg_control.skill = "fuma"; 
		audio_play_sound(sound_fuma_hit, 0, false);
		
		counter = skillsData.fuma.count;
		counter --;
		dosomething = function() {
			var counter1 = time_source_get_reps_completed(timer);
			randomize();
			var ranValue = skillsData.fuma.rand/2;
			var ranX = irandom_range(-ranValue, ranValue);
			var ranY = irandom_range(-ranValue, ranValue);
			var relativeX = mobId.bbox_right - mobId.bbox_left;
			var relativeY = mobId.bbox_top - mobId.bbox_bottom;
			var finalX = relativeX/2 + mobId.bbox_left + ranX;
			var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
			if (finalY > mobId.bbox_bottom) finalY = mobId.bbox_bottom;
			instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : s_fuma_hit, image_xscale : image_xscale, follow : false});
			sound_id = audio_play_sound(sound_fuma_hit, 0, false);
		}
		time_source_reconfigure(timer, skillsData.fuma.delay, time_source_units_seconds, dosomething, [], counter);
		time_source_start(timer);
		break;
	case "erda":
		//First hit
		randomize();
		ranValue = skillsData.erda.rand/2;
		ranX = irandom_range(-ranValue, ranValue);
		ranY = irandom_range(-ranValue, ranValue);
		relativeX = mobId.bbox_right - mobId.bbox_left;
		relativeY = mobId.bbox_top - mobId.bbox_bottom;
		finalX = relativeX/2 + mobId.bbox_left + ranX;
		finalY = relativeY/2 + mobId.bbox_bottom + ranY;
		if (finalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom;

		//Hit effect
		instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : sErdaNovaHit, follow : false});
		
		//Damage numbers
		dmg_control = instance_create_layer(0, 0, "controller", oDamageController, {isDarkness : oPlayer.isDarkness});
		dmg_control.skill = "erda"; 
		audio_play_sound(sound_fuma_hit, 0, false);
		
		counter = skillsData.erda.count;
		counter --;
		dosomething = function() {
			var counter1 = time_source_get_reps_completed(timer);
			randomize();
			var ranValue = skillsData.erda.rand/2;
			var ranX = irandom_range(-ranValue, ranValue);
			var ranY = irandom_range(-ranValue, ranValue);
			var relativeX = mobId.bbox_right - mobId.bbox_left;
			var relativeY = mobId.bbox_top - mobId.bbox_bottom;
			var finalX = relativeX/2 + mobId.bbox_left + ranX;
			var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
			if (finalY > mobId.bbox_bottom) finalY = mobId.bbox_bottom;
			instance_create_layer(finalX, finalY, "skills", oSkill_ani, {sprite_index : sErdaNovaHit, follow : false});
			sound_id = audio_play_sound(soundErdaNovaHit, 0, false);
		}
		time_source_reconfigure(timer, skillsData.erda.delay, time_source_units_seconds, dosomething, [], counter);
		time_source_start(timer);
		break;
	case "explodingShuriken":
		dosomething = function() {
			// First summon
			randomize();
			ranValue = skillsData.explosivePre.rand/2;
			var ranX = irandom_range(-ranValue, ranValue);
			var ranY = irandom_range(-ranValue, ranValue);
			var relativeX = mobId.bbox_right - mobId.bbox_left;
			var relativeY = mobId.bbox_top - mobId.bbox_bottom;
			var finalX = relativeX/2 + mobId.bbox_left + ranX;
			var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
			if (finalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom;

			instance_create_layer(finalX, finalY, "skills", oSkill_ani, {
				sprite_index : sExplosiveShurikenHit1, 
				follow : false,
				image_xscale : faceDir
			});
			audio_play_sound(soundExplosiveShurikenHit, 0, false);
			
			instance_create_layer(finalX, finalY, "controller", oTimeControl, {skillType : "explodingShuriken2"});
			
			if (explodeCount > 1) {
				time_source_reconfigure(timer, skillsData.explosivePre.delay, time_source_units_seconds, function() {
					// First summon
					randomize();
					ranValue = skillsData.explosivePre.rand/2;
					var ranX = irandom_range(-ranValue, ranValue);
					var ranY = irandom_range(-ranValue, ranValue);
					var relativeX = mobId.bbox_right - mobId.bbox_left;
					var relativeY = mobId.bbox_top - mobId.bbox_bottom;
					var finalX = relativeX/2 + mobId.bbox_left + ranX;
					var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
					if (finalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom;
					
					instance_create_layer(finalX, finalY, "skills", oSkill_ani, {
						sprite_index : sExplosiveShurikenHit1, 
						follow : false,
						image_xscale : faceDir
					});
					audio_play_sound(soundExplosiveShurikenHit, 0, false);
			
					instance_create_layer(finalX, finalY, "controller", oTimeControl, {skillType : "explodingShuriken2"});
				}, [], explodeCount - 1);
				time_source_start(timer);
			}
		}
		
		time_source_reconfigure(timer, 0.54, time_source_units_seconds, dosomething, []);
		time_source_start(timer);
		break;
	case "explodingShuriken2":
		// if exploding shuriken summon hits monster
		dosomething = function() {
			mobId = collision_rectangle(x - 200, y - 200, x + 200, y + 200, oMonster, false, true);
			
			if (mobId != noone) {
				instance_create_layer(0, 0, "controller", oTimeControl, {skillType : "explodingShuriken3", mobId : mobId});
			}
		}
		
		time_source_reconfigure(timer, 0.9, time_source_units_seconds, dosomething, []);
		time_source_start(timer);
		break;
	case "explodingShuriken3":
		// Explosive Shuriken hit effect
		//First hit
		randomize();
		ranValue = skillsData.explosive.rand/2;
		ranX = irandom_range(-ranValue, ranValue);
		ranY = irandom_range(-ranValue, ranValue);
		relativeX = mobId.bbox_right - mobId.bbox_left;
		relativeY = mobId.bbox_top - mobId.bbox_bottom;
		finalX = relativeX/2 + mobId.bbox_left + ranX;
		finalY = relativeY/2 + mobId.bbox_bottom + ranY;
		if (finalY > mobId.bbox_bottom) beforeFinalY = mobId.bbox_bottom;

		//Hit effect
		instance_create_layer(finalX, finalY, "skills_top", oSkillTop, {sprite_index : sExplosiveShurikenHit2, follow : false});
		
		//Damage numbers
		dmg_control = instance_create_layer(0, 0, "controller", oDamageController, {isDarkness : oPlayer.isDarkness});
		dmg_control.skill = "explosive"; 
		audio_play_sound(soundExplosiveShurikenHit1, 0, false);
		
		counter = skillsData.explosive.count;
		counter --;
		dosomething = function() {
			var counter1 = time_source_get_reps_completed(timer);
			randomize();
			var ranValue = skillsData.explosive.rand/2;
			var ranX = irandom_range(-ranValue, ranValue);
			var ranY = irandom_range(-ranValue, ranValue);
			var relativeX = mobId.bbox_right - mobId.bbox_left;
			var relativeY = mobId.bbox_top - mobId.bbox_bottom;
			var finalX = relativeX/2 + mobId.bbox_left + ranX;
			var finalY = relativeY/2 + mobId.bbox_bottom + ranY;
			if (finalY > mobId.bbox_bottom) finalY = mobId.bbox_bottom;
			instance_create_layer(finalX, finalY, "skills_top", oSkillTop, {sprite_index : sExplosiveShurikenHit2, follow : false});
			sound_id = audio_play_sound(soundExplosiveShurikenHit1, 0, false);
		}
		time_source_reconfigure(timer, skillsData.explosive.delay, time_source_units_seconds, dosomething, [], counter);
		time_source_start(timer);
		break;
}




