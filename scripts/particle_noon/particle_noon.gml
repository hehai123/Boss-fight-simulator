global.game_fps = 144;

//Noon bottom particle 1
var _p1 = part_type_create();

var life = 2;
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

part_type_sprite(_p1, serene1_bottom_particle, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);

// needs more advanced stuff. size is fixed for now
var particleSize = 141; //diagonal length divided by sqrt 2
var particleSizeChangeRate = (12 - 7)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 13, particleSizeChangeRate, 0.1); //Check how wiggle works
part_type_alpha3(_p1, 0, 100/255, 0);
var colorMin = 128;
var colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene1Bottom1 = _p1; 

//Noon bottom particle 2
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

part_type_sprite(_p1, serene1_bottom_particle, false, true, false);
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
part_type_size(_p1, 1, 36, particleSizeChangeRate, 0.1);
part_type_alpha3(_p1, 0, 214/255, 0);
colorMin = 128;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene1Bottom2 = _p1;

// Noon smog particle 1 cc
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -6;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 180; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
var startSpin = 100;
var startSpinVar = 150;
var endSpin = 100;
var spinChangeRate = 75/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene1_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 50, -250, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene1Smog1_1 = _p1; 

// Noon smog particle 1 c
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -6;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 180; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 100;
startSpinVar = 150;
endSpin = 100;
spinChangeRate = 75/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene1_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 50, -250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene1Smog1_2 = _p1; 

// Noon Sunshine cc
_p1 = part_type_create();

life = 15;
lifeVar = 0;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = 0;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 0; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 20;
startSpinVar = 20;
endSpin = 50;
spinChangeRate = 40/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene1_sunshine, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, -40, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 615; //diagonal length divided by sqrt 2
particleSizeChangeRate = (400 - 650)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 50, 1250, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 119/255, 0); //119 also can? //57
part_type_blend(_p1, true);

//part_type_colour_rgb(_p1, 0, 0, 211, 211, 255, 255);
part_type_color2(_p1, 54271, 16764672);

global.ptSerene1Sunshine1_1 = _p1; 

// Noon Sunshine c
_p1 = part_type_create();

life = 15;
lifeVar = 0;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = 0;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
//Normal angle convention 
gravityAngle = 0; //Left

spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = 0;
angleVar = 0;
angleMin = angle - angleVar;
angleMax = angle + angleVar;
startSpin = 20;
startSpinVar = 20;
endSpin = 50;
spinChangeRate = 40/life/global.game_fps; // angle in degrees/life/fps

part_type_sprite(_p1, serene1_sunshine, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, 0, -40, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 615; //diagonal length divided by sqrt 2
particleSizeChangeRate = (400 - 650)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 50, 1250, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 119/255, 0); //119 also can? //57
part_type_blend(_p1, true);

//part_type_colour_rgb(_p1, 0, 0, 211, 211, 255, 255);
part_type_color2(_p1, 54271, 16764672);

global.ptSerene1Sunshine1_2 = _p1; 

//Noon top particle 1
_p1 = part_type_create();

life = 2.5;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -10;
gravityY = 3;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 196.7; //Down left //Normal angle convention 
spd = 0;
spdVar = 0;
spdMin = max(0, spd - spdVar)/global.game_fps;
spdMax = (spd + spdVar)/global.game_fps;
angle = -90;
angleVar = 25;
angleMin = angle - angleVar;
angleMax = angle + angleVar;

part_type_sprite(_p1, serene1_top_particle, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (7 - 15)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 13, 17, particleSizeChangeRate, 0.1);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);
part_type_blend(_p1, true);

global.ptSerene1Top1 = _p1;
