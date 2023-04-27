/// @description Insert description here

timer += delta_time/1000000;

if (timer > counter) {
	for (var i = 0; i < array_length(global.skills_display); i++) {
		var skill_time_left = global.skills_display[i][0];
		if (skill_time_left > 0) {	
			global.skills_display[i][0]--;
		}
		else {
			switch (global.skills_display[i][1]) {
				case s_spread_throw_icon:
					oPlayer.spread_throw = false;
					break;
			}
			array_delete(global.skills_display, i, 1);	
		}
	}
	counter++;
}
