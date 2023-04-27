/// @description Insert description here
// You can write your code in this editor

switch (currentPhase) {
	case "Noon":
		if (!updated) {
			updated = true;
			particlesClear();
			sereneNoonParticleEffects();
		}
		break;
	case "Sunset":
		if (!updated) {
			updated = true;
			particlesClear();
			sereneSunsetParticleEffects();
		}
		break;
	case "Midnight":
		if (!updated) {
			updated = true;
			particlesClear();
			sereneMidnightParticleEffects();
		}
		break;
	case "Dawn":
		if (!updated) {
			updated = true;
			particlesClear();
			sereneDawnParticleEffects();
		}
		break;
}









