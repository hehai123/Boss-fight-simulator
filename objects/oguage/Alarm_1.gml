/// @description Allow arrow rotation

canArrowMove = true;

//Setting phase
switch (currentPhase) {
	case "Noon":
		currentPhase = "Sunset";
		with (oSerene) {
			serenePhase = "Sunset";
			time_source_start(sunsetFirstSkill1);
		}
		oController.currentPhase = "Sunset";
		var soundPosition = audio_sound_get_track_position(oController.currentSoundId);
		audio_sound_gain(BGM_noon, 0, 3000); //Fade out over 3s
		oController.currentSoundId = audio_play_sound(BgmSunset, 0, true, 1, soundPosition);
		oController.sunsetSwordStartDelay = 5*global.game_fps;
		with (oController) {
			time_source_start(sunsetFlameWall);
		}
		audio_sound_gain(BgmSunset, 0, 0);
		audio_sound_gain(BgmSunset, 1, 2400); //Fade in over 2.4s // Actual is 0.9s
		mapSpriteChange("Sunset");
		break;
	case "Sunset":
		currentPhase = "Midnight";
		with (oSerene) {
			serenePhase = "Midnight";
			time_source_start(midnightAttack3Timer);
		}
		soundPosition = audio_sound_get_track_position(oController.currentSoundId);
		audio_sound_gain(BgmSunset, 0, 3000); //Fade out over 3s
		oController.currentSoundId = audio_play_sound(BgmMidnight, 0, true, 1, soundPosition);
		audio_sound_gain(BgmMidnight, 0, 0);
		audio_sound_gain(BgmMidnight, 1, 1800); //Fade in over 1.8s
		with (oController) {
			currentPhase = "Midnight";
			midnightPillarStartDelay = midnightPillarStartDelayTime;
		}
		mapSpriteChange("Midnight");
		break;
	case "Midnight":
		currentPhase = "Dawn";
		with (oSerene) {
			serenePhase = "Dawn";
		}
		soundPosition = audio_sound_get_track_position(oController.currentSoundId);
		audio_sound_gain(BgmMidnight, 0, 3000); //Fade out over 3s
		oController.currentSoundId = audio_play_sound(BgmDawn, 0, true, 1, soundPosition);
		audio_sound_gain(BgmDawn, 0, 0);
		audio_sound_gain(BgmDawn, 1, 1800); //Fade in over 1.8s
		with (oController) {
			currentPhase = "Dawn";
			alarm[0] = 1*global.game_fps;
		}
		mapSpriteChange("Dawn");
		break;
	case "Dawn":
		currentPhase = "Noon";
		soundPosition = audio_sound_get_track_position(oController.currentSoundId);
		audio_sound_gain(BgmDawn, 0, 3000); //Fade out over 3s
		oController.currentSoundId = audio_play_sound(BGM_noon, 0, true, 1, soundPosition);
		audio_sound_gain(BGM_noon, 0, 0);
		audio_sound_gain(BGM_noon, 1, 1800); //Fade in over 1.8s
		oSerene.serenePhase = "Noon";
		oController.currentPhase = "Noon";
		mapSpriteChange("Noon");
		break;
}







