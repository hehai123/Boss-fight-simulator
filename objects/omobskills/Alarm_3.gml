/// @description Noon laser damage tick

serene_noon_map_laser_hit(x, y);
tick_count --;

if (tick_count > 0) alarm[3] = 0.24*global.game_fps;
