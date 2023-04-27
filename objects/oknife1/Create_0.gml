/// @description Fake Knife
face_dir = oPlayer.knife_face_dir;
image_xscale = -face_dir;
hsp = 780/game_get_speed(gamespeed_fps)*face_dir;
alarm[0] = game_get_speed(gamespeed_fps)*0.5;
