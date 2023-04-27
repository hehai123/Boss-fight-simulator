x = 650;
y = 30;

UI_x_offset = 49;
UI_y_offset = 87;

xx = 0;
yy = 0;

grab = false; 

skill_layer_id = layer_get_id("skills");
fma_layer_id = layer_get_id("fma");

//For Guage =================================================================
guageValue = 0;
guageMaxValue = 100;
guageRatio = guageValue/guageMaxValue; //For guage display
guageToPixel = 54*(1 - guageRatio);
guageOffsetX = 22 + 1; //22 is in game value
guageOffsetY = 61 - 1; //61 is in game value
guageWidth = 54; //Width = height = 54

alarm[0] = 5*global.game_fps; //1% Guage every 5s

currentPhase = "Noon";
guageRatio = 3;
arcAngle = 360/(3*guageRatio + 1); // Degree of each gauge. Normal is 3*, midnight is 1*

//guageCurrentAngle = 108; //Noon start angle

dawnAngle = guageRatio*arcAngle;
noonAngle = guageRatio*arcAngle;
sunsetAngle = guageRatio*arcAngle;
midnightAngle = arcAngle; //36 degrees, 36 guages?

//Starting point of guage wrt dawn
// Starting point of Dawn guage
dawnStartAngle = 180 + 180/(3*guageRatio + 1); //180 + 18, set as fixed angle or fixed point

// Starting point of Noon Guage
noonStartAngle = dawnStartAngle + dawnAngle; //198 + 108 = 306

// Starting point of Sunset Guage. Cut into 2 parts for easy drawing 
sunsetStartAngle = noonStartAngle + noonAngle - 90; //324
sunset2_start = sunsetStartAngle + sunsetAngle - 90;

//Starting point of Midnight Guage
midnightStartAngle = dawnStartAngle - midnightAngle;
//============================================================================

//Guage Arrow
canArrowMove = true;
counter = 0;
arrowAngle = noonStartAngle;