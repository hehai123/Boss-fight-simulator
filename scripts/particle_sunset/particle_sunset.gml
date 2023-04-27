//Sunset side particle 1
var _p1 = part_type_create();

var life = 1.5;
var lifeVar = 0;
var lifeMin = max(0, life - lifeVar);
var lifeMax = max(0, life + lifeVar);
var gravityX = 0;
var gravityY = -9;
var gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
var gravityAngle = 90; //Up //Normal angle convention 
var spd = 0;
var spdVar = 0;
var spdMin = max(0, spd - spdVar)/global.game_fps;
var spdMax = (spd + spdVar)/global.game_fps;
var angle = -46;
var angleVar = 0;
var angleMin = angle - angleVar;
var angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene3_side_particle1, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
var particleSize = 141; //diagonal length divided by sqrt 2
var particleSizeChangeRate = (10 - 7)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 13, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 1, 0);
var colorMin = 128;
var colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Side1 = _p1; 

//Sunset side particle 2
_p1 = part_type_create();

life = 10;
lifeVar = 0;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = 0;
gravityY = -1;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 90; //Up //Normal angle convention 
spd = 15;
spdVar = 5;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 105;
angleVar = 36;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene3_side_particle2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (10 - 6)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 36, particleSizeChangeRate, 0.01);
part_type_alpha3(_p1, 0, 214/255, 0);
colorMin = 128;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Side2 = _p1;

//Sunset side particle 3
_p1 = part_type_create();

life = 10;
lifeVar = 0;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -15;
gravityY = -10;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 146.31; //Up Left //Normal angle convention 
spd = 15;
spdVar = 5;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 105;
angleVar = 36;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene3_side_particle3, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (10 - 6)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 20, particleSizeChangeRate, 0.1);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 255; //128
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Side3 = _p1;

//Sunset side particle 4
_p1 = part_type_create();

life = 10;
lifeVar = 0;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = 15;
gravityY = -10;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 33.69; //Up Right //Normal angle convention 
spd = 15;
spdVar = 5;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 105;
angleVar = 36;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
//var startSpin = 100;
//var startSpinVar = 150;
//var endSpin = 100;
//var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene3_side_particle3, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p12, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (10 - 6)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 20, particleSizeChangeRate, 1);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Side4 = _p1;

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

part_type_sprite(_p1, serene1_top_particle, false, true, false);
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

global.ptSerene3Top1 = _p1;

// Sunset smog particle 1
_p1 = part_type_create();

life = 8;
lifeVar = 0.3;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = 0;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 0; //Left

spd = 1;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 161;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
var startSpin = 50;
var startSpinVar = 0;
var endSpin = 50;
var spinChangeRate = 0/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene3_smog_1, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, -50, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (591 - 527)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 527, 527, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 60/255, 0); //60/255
//colorMin = 128;
//colorMax = 255;
//part_type_colour_rgb(_p7, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Smog1 = _p1; 

// Sunset smog particle 2 cc
_p1 = part_type_create();

life = 15.5;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -2;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = -180; //Left //Normal angle convention 

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 200;
startSpinVar = 200;
endSpin = 200;
spinChangeRate = 100/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene3_smog_2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, 400, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (200 - 200)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 200, 200, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 20/255, 0);
//colorMin = 128;
//colorMax = 255;
//part_type_colour_rgb(_p7, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Smog2_1 = _p1; 

// Sunset smog particle 2 c
_p1 = part_type_create();

life = 15.5;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -2;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = -180; //Left //Normal angle convention 

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 200;
startSpinVar = 200;
endSpin = 200;
spinChangeRate = 100/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene3_smog_2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, 400, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (200 - 200)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 200, 200, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 20/255, 0);
//colorMin = 128;
//colorMax = 255;
//part_type_colour_rgb(_p7, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene3Smog2_2 = _p1;
