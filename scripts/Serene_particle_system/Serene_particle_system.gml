function sereneDawnParticleEffects() {
	//Create particle emitter Dawn smog top 
	x_start = 0 + 35;
	y_start = -500 + 105;
	xVar = 500;
	yVar = 100;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 20/2; //20 but half clockwise, half cc
	particleLife = 12;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp1, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp1, global.ptSerene2Smog1_1, particleCreationRate);
			
	part_emitter_region(global.partSystem, _pp2, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp2, global.ptSerene2Smog1_2, particleCreationRate);
			
	//Create particle emitter Dawn Smog side
	x_start = -800 + 57;
	y_start = -100 + 273;
	xVar = 250;
	yVar = 238;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 15/2; //15 but half clockwise, half cc// cut to 4 as 7.5 feels too many
	particleLife = 12;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp3, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp3, global.ptSerene2Smog2_1, particleCreationRate);

	part_emitter_region(global.partSystem, _pp4, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp4, global.ptSerene2Smog2_2, particleCreationRate);
			
	//Create particle emitter Dawn Smog bottom 
	x_start = 150 + 4;
	y_start = 500 + 37;
	xVar = 500;
	yVar = 100;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 20/2; //20 but half clockwise, half cc // reduced to 60%
	particleLife = 12;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp5, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp5, global.ptSerene2Smog3_1, particleCreationRate)
			
	part_emitter_region(global.partSystem, _pp6, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp6, global.ptSerene2Smog3_2, particleCreationRate);
			
	//Create particle emitter Dawn bottom particle
	x_start = 0 + 2;
	y_start = 500 + 62;
	xVar = 1366;
	yVar = 132;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 150;
	particleLife = 6;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp7, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp7, global.ptSerene2Btm1, particleCreationRate);
			
	//Create particle emitter Dawn bottom particle 2
	x_start = 0 + 9;
	y_start = 600 + 32;
	xVar = 1366;
	yVar = 112;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 10;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp8, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp8, global.ptSerene2Btm2, particleCreationRate);
			
	//Create particle emitter Dawn middle particle 1
	x_start = 0 - 3;
	y_start = 93 + 81;
	xVar = 150;
	yVar = 30;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp9, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp9, global.ptSerene2Middle1, particleCreationRate);
			
	//Create particle emitter Dawn middle particle 2
	x_start = 0 + 44;
	y_start = 93 + 14;
	xVar = 150;
	yVar = 30;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp10, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp10, global.ptSerene2Middle2, particleCreationRate);
			
	//Create particle emitter Top particle 1
	x_start = 0 + 113;
	y_start = -260 - 55;
	xVar = 700;
	yVar = 200;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 100;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp11, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp11, global.ptSerene2Top1, particleCreationRate);
}

function sereneSunsetParticleEffects() {
	// Sunset side particle 1
	x_start = 0 + 10;
	y_start = 400 + 117;
	xVar = 1366;
	yVar = 212;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 100;
	particleLife = 1.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp7, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp7, global.ptSerene3Side1, particleCreationRate);
			
	// Sunset side particle 2
	x_start = 0 - 16;
	y_start = 300 + 294;
	xVar = 1366;
	yVar = 112;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 10;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp8, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp8, global.ptSerene3Side2, particleCreationRate);
			
	// Sunset side particle 3
	x_start = -250 - 67;
	y_start = 300 - 51;
	xVar = 166;
	yVar = 350;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 10;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp9, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp9, global.ptSerene3Side3, particleCreationRate)
	
	// Sunset side particle 4
	x_start = 250 + 134;
	y_start = 300 - 108;
	xVar = 166;
	yVar = 350;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 10;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp3, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp3, global.ptSerene3Side4, particleCreationRate);
			
	// Sunset smog 1
	x_start = -1000 + 453;
	y_start = 350 + 177;
	xVar = 1366;
	yVar = 70;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 10;
	particleLife = 8;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp4, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp4, global.ptSerene3Smog1, particleCreationRate);
			
	// Sunset smog 1 cc + c
	x_start = 0 + 0;
	y_start = -100 + 158;
	xVar = 500;
	yVar = 238;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30/2;
	particleLife = 15.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp1, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp1, global.ptSerene3Smog2_1, particleCreationRate);
	
	part_emitter_region(global.partSystem, _pp2, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp2, global.ptSerene3Smog2_1, particleCreationRate);
			
	// Sunset top particle 1
	x_start = 60 - 56;
	y_start = -400 + 107;
	xVar = 1366;
	yVar = 159;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 100;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp11, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp11, global.ptSerene3Top1, particleCreationRate);
}

function sereneMidnightParticleEffects() {
	// Midnight middle particle 1
	x_start = 0 + 70;
	y_start = 200 - 97;
	xVar = 141;
	yVar = 60;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 50;
	particleLife = 3;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp7, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp7, global.ptSerene4Middle1, particleCreationRate);
			
	// Midnight middle particle 2
	x_start = 600 - 78;
	y_start = 200 + 46; // 200 + 92 changed to 200 + 46 for symmetry with midnight middle particle 3
	xVar = 140;
	yVar = 60;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 50;
	particleLife = 3;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp8, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp8, global.ptSerene4Middle2, particleCreationRate);
			
	// Midnight middle particle 3
	x_start = -600 - 48;
	y_start = 200 + 46; 
	xVar = 140;
	yVar = 60;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 50;
	particleLife = 3;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp9, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp9, global.ptSerene4Middle3, particleCreationRate)
			
	// Midnight smog 1 cc + c
	x_start = 448 + 97;
	y_start = 150 + 1;
	xVar = 1366;
	yVar = 120;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 80/2;
	particleLife = 15.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp1, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp1, global.ptSerene4Smog1_1, particleCreationRate);
	
	part_emitter_region(global.partSystem, _pp2, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp2, global.ptSerene4Smog1_2, particleCreationRate);
			
	// Midnight top particle 1
	x_start = 60 + 17;
	y_start = -200 - 28;
	xVar = 1366;
	yVar = 318;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 200;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp11, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp11, global.ptSerene4Top1, particleCreationRate);
}

function sereneNoonParticleEffects() {
	// Noon bottom particle 1
	x_start = 0 + 21;
	y_start = 500 - 24;
	xVar = 1366;
	yVar = 200;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 100;
	particleLife = 2;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp7, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp7, global.ptSerene1Bottom1, particleCreationRate);
			
	// Noon bottom particle 1
	x_start = 0 + 23;
	y_start = 400 + 139;
	xVar = 1366;
	yVar = 112;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30;
	particleLife = 10;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;

	part_emitter_region(global.partSystem, _pp8, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp8, global.ptSerene1Bottom2, particleCreationRate);
			
	// Noon smog 1 cc + c
	x_start = 300 + 167;
	y_start = 500 - 45;
	xVar = 800;
	yVar = 140;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 30/2;
	particleLife = 12;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp1, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp1, global.ptSerene1Smog1_1, particleCreationRate);
	
	part_emitter_region(global.partSystem, _pp2, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp2, global.ptSerene1Smog1_2, particleCreationRate);
	
	// Noon Sunshine 1 cc + c
	x_start = 0 + 49;
	y_start = -550 + 140;
	xVar = 0;
	yVar = 0;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 4/2;
	particleLife = 15;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp3, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp3, global.ptSerene1Sunshine1_1, particleCreationRate);
	
	part_emitter_region(global.partSystem, _pp4, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp4, global.ptSerene1Sunshine1_2, particleCreationRate);
			
	// Noon top particle 1
	x_start = 60 + 21;
	y_start = -200 - 69;
	xVar = 1366;
	yVar = 318;

	x_min = x_origin + x_start - xVar;
	x_max = x_origin + x_start + xVar;
	y_min = y_origin + y_start - yVar;
	y_max = y_origin + y_start + yVar;

	totalParticle = 200;
	particleLife = 2.5;
	particleCreationRate = -global.game_fps*particleLife/totalParticle;
			
	part_emitter_region(global.partSystem, _pp11, x_min, x_max, y_min, y_max, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(global.partSystem, _pp11, global.ptSerene1Top1, particleCreationRate);
}

function particlesClear() {
	part_particles_clear(global.partSystem);
	part_emitter_clear(global.partSystem, _pp1);
	part_emitter_clear(global.partSystem, _pp2);
	part_emitter_clear(global.partSystem, _pp3);
	part_emitter_clear(global.partSystem, _pp4);
	part_emitter_clear(global.partSystem, _pp5);
	part_emitter_clear(global.partSystem, _pp6);
	part_emitter_clear(global.partSystem, _pp7);
	part_emitter_clear(global.partSystem, _pp8);
	part_emitter_clear(global.partSystem, _pp9);
	part_emitter_clear(global.partSystem, _pp10);
	part_emitter_clear(global.partSystem, _pp11);
}