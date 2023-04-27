/// @description Insert description here

updated = false;
x_origin = 880;
y_origin = 450;
x_start = 0;
y_start = 0;
xVar = 0;
yVar = 0;
x_min = 0; 
x_max = 0;
y_min = 0; 
y_max = 0; 

//Dawn particles ======================================================
//Create particle system
global.partSystem = part_system_create_layer("Particle_effect", false);

_pp1 = part_emitter_create(global.partSystem); // Dawn smog top // Sunset smog particle 2 cc //Midnight smog particle 1 cc //Noon smog particle 1 cc
_pp2 = part_emitter_create(global.partSystem); // Dawn smog top // Sunset smog particle 2 c //Midnight smog particle 2 cc //Noon smog particle 1 c

_pp3 = part_emitter_create(global.partSystem); // Dawn Smog side // Sunset side particle 4 //Noon sunshine particle 1 cc
_pp4 = part_emitter_create(global.partSystem); // Dawn Smog side // Sunset smog particle 1 //Noon sunshine particle 1 c

_pp5 = part_emitter_create(global.partSystem); // Dawn Smog bottom 
_pp6 = part_emitter_create(global.partSystem); // Dawn Smog bottom 

_pp7 = part_emitter_create(global.partSystem); // Dawn bottom particle 1 //Noon bottom particle 1 // Sunset side particle 1 //Midnight middle particle 1
_pp8 = part_emitter_create(global.partSystem); // Dawn bottom particle 2 //Noon bottom particle 2 // Sunset side particle 2 //Midnight middle particle 2

_pp9 = part_emitter_create(global.partSystem); // Dawn middle particle 1 // Sunset side particle 3 //Midnight middle particle 3
_pp10 = part_emitter_create(global.partSystem); // Dawn middle particle 2
_pp11 = part_emitter_create(global.partSystem); // Dawn top particle // Sunset top particle //Midnight top particle //Noon top particle



