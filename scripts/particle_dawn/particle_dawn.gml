//Dawn bottom particle 1
var _p1 = part_type_create();

var life = 6;
var lifeVar = 1;
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

part_type_sprite(_p1, serene2_bottom_particle, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
var particleSize = 141; //diagonal length divided by sqrt 2
var particleSizeChangeRate = (10 - 20)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 14, 26, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 100/255, 0);
var colorMin = 128;
var colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene2Btm1 = _p1; 

//Dawn bottom particle 2
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

part_type_sprite(_p1, serene2_bottom_particle, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
//particleSizeChangeRate = (10 - 20)/life/global.game_fps; //(Final size - initial size)/life/fps
//if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 30, 0, 0.01);
part_type_alpha3(_p1, 0, 100/255, 0);
colorMin = 128;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene2Btm2 = _p1; 

//Dawn line particle 1
_p1 = part_type_create();

life = 10;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = 0;
gravityY = 0;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 90; //Up //Normal angle convention 
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

part_type_sprite(_p1, serene2_line, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 500; //diagonal length divided by sqrt 2
//particleSizeChangeRate = (10 - 20)/life/global.game_fps; //(Final size - initial size)/life/fps
//if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 1, 160, 0, 0.1);
part_type_alpha3(_p1, 0, 0.5, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene2Line1 = _p1;

//Dawn middle particle 1
_p1 = part_type_create();

life = 2.5;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -2;
gravityY = -2;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 135; //Up left //Normal angle convention 
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
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (5 - 15)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 13, 17, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 70/255, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene2Middle1 = _p1;

//Dawn middle particle 2
_p1 = part_type_create();

life = 2.5;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -1;
gravityY = -3;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 108.43; //Up left //Normal angle convention 
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
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (3 - 8)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 6, 10, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 70/255, 0);
colorMin = 255;
colorMax = 255;
part_type_colour_rgb(_p1, colorMin, colorMax, colorMin, colorMax, colorMin, colorMax);

global.ptSerene2Middle2 = _p1;

//Dawn top particle
_p1 = part_type_create();

life = 2.5;
lifeVar = 1;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);
gravityX = -2;
gravityY = 4;
gravityMag = sqrt(sqr(gravityX)+sqr(gravityY))/144/144;
gravityAngle = 243.43; //Down left //Normal angle convention 
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
//part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 141; //diagonal length divided by sqrt 2
particleSizeChangeRate = (5 - 18)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 16, 20, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 100/255, 0);
//colorMin = 255;
//colorMax = 255;
part_type_colour_rgb(_p1, 44, 44, 105, 105, 209, 209);
part_type_blend(_p1, true);
//part_type_color2(_p1, $2C69D1, $3C67C2);

global.ptSerene2Top1 = _p1;

//Dawn smog particle 1 cc
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -3;
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
var spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (420 - 450)/life/global.game_fps; //(Final size - initial size)/life/fps
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 450, 450, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene2Smog1_1 = _p1;

//Dawn smog particle 1 c
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -3;
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
spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (420 - 450)/life/global.game_fps; //(Final size - initial size)/life/fps
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 450, 450, -particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene2Smog1_2 = _p1;

//Dawn smog particle 2 cc
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -4;
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
spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene2Smog2_1 = _p1;

//Dawn smog particle 2 c
_p1 = part_type_create();

life = 12;
lifeVar = 1.36;
lifeMin = max(0, life - lifeVar);
lifeMax = max(0, life + lifeVar);

gravityX = -4;
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
spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene2Smog2_2 = _p1; 

//Dawn smog particle 3 cc
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
spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog_2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);
part_type_blend(_p1, false);

global.ptSerene2Smog3_1 = _p1; 

//Dawn smog particle 1 c
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
spinChangeRate = 100/life/global.game_fps; //100 degrees/life/fps

part_type_sprite(_p1, serene2_smog_2, false, true, false);
part_type_life(_p1, lifeMin*144, lifeMax*144);
part_type_speed(_p1, spdMin, spdMax, 0, 0);
part_type_direction(_p1, angleMin, angleMax, 0, 0);
part_type_gravity(_p1, gravityMag, gravityAngle);
part_type_orientation(_p1, -50, 250, -spinChangeRate, 0, false) //starting angle

// needs more advanced stuff. size is fixed for now
particleSize = 344; //diagonal length divided by sqrt 2
particleSizeChangeRate = (655 - 672)/life/global.game_fps; //(Final size - initial size)/life/fps
if (abs(particleSizeChangeRate) < 0.01) particleSizeChangeRate = 0.01*sign(particleSizeChangeRate);
part_type_scale(_p1, 1/particleSize, 1/particleSize);
part_type_size(_p1, 672, 672, particleSizeChangeRate, 0);
part_type_alpha3(_p1, 0, 40/255, 0);

global.ptSerene2Smog3_2 = _p1; 
