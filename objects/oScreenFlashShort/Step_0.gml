
/// @description Insert description here

switch (floor(image_index)) {
	case 3:
		alpha = 0;
		break;
	case 4:
		alpha = 0.1;
		break;
	case 5:
		alpha = 0.15;
		break;
	case 6:
		alpha = 0.2;
		break;
	case 7:
		alpha = 0.25;
		break;
	case 8:
		alpha = 0.3;
		break;
	case 9:
		alpha = 0.35;
		break;
	case 10:
		alpha = 0.4;
		break;
	case 11:
		alpha = 0.45;
		break;
	case 12:
		alpha = 0.5;
		break;
	case 13:
		alpha = 0.55;
		break;
	case 14:
		alpha = 0.6;
		break;
	case 15:
		alpha = 0.7;
		break;
	case 16:
		alpha = 0.8;
		break;
	case 17:
		alpha = 1;
		image_speed = 0
		timer += delta_time/1000000;
		if (timer >= duration) {
			image_index = 18;
		}
		break;
	case 18:
		alpha = 0.7;
		image_speed = 10/1.5;
		break;
	case 19:
		alpha = 0.6;
		break;
	case 20:
		alpha = 0.5;
		break;
	case 21:
		alpha = 0.4;
		break;
	case 22:
		alpha = 0.3;
		break;
	case 23:
		alpha = 0.2;
		break;
	case 24:
		alpha = 0.1;
		break;
	default:
		break;
}

if (animation_end()) {
	instance_destroy();	
}

