//Midnight side particle 1
var _p1 = part_type_create();

var life = 3;
var lifeVar = 1;
var lifeMin = max(0, life - lifeVar);
var lifeMax = max(0, life + lifeVar);
var gravityX = 0;
var gravityY = -2;
var gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
var gravityAngle = 90; //Up //Normal angle convention 
var spd = 0;
var spdVar = 0;
var spdMin = max(0, spd - spdVar)/global.game_fps;
var spdMax = (spd + spdVar)/global.game_fps;
var angle = -90;
var angleVar = 25;
var angleMin = angle - angleVar;
var angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene4_middle_particle1, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
var particleSize = 141; //diagonal length divided by sqrt 2
var particleSizeChangeRate = (5 - 10)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 6, 14, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 100/255, 0);
var colorMin = 128;
var colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene4Middle1 = _p1; 

//Midnight side particle 2
_p1 = part_type_create();

life = 3;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = 2;
gravityY = -2;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 45; //Up Right //Normal angle convention 
spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = -90;
angleVar = 25;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene4_middle_particle2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (10 - 10)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 6, 14, particleSizeChangeRate, 0.01);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 128;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene4Middle2 = _p1;

//Midnight side particle 3
_p1 = part_type_create();

life = 3;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -2;
gravityY = -2;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 135; //Up Left //Normal angle convention 
spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = -90;
angleVar = 25;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene4_middle_particle2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (10 - 10)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 6, 14, particleSizeChangeRate, 0.01);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 128;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene4Middle3 = _p1;

//Sunset top particle 1
_p1 = part_type_create();

life = 2.5;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = 0;
gravityY = 2;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 270; //Down //Normal angle convention 
spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = -90;
angleVar = 25;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene1_bottom_particle, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (7 - 15)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 13, 17, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0,100/255, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene4Top1 = _p1;

// Midnight smog particle 1 cc
_p1 = part_type_create();

life = 15.5;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -2;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 180; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 161;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
var startSpin = 50;
var startSpinVar = 50;
var endSpin = 50;
var spinChangeRate = 50/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, -100, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (350 - 400)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 400, 400, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 20/255, 0);

global.ptSerene4Smog1_1 = _p1; 

// Midnight smog particle 1 c
_p1 = part_type_create();

life = 15.5;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -2;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 180; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 161;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 50;
startSpinVar = 50;
endSpin = 50;
spinChangeRate = 50/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, -100, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (350 - 400)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 400, 400, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 20/255, 0);

global.ptSerene4Smog1_2 = _p1; 
