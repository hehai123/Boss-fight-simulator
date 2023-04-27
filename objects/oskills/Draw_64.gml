/// @description Insert description here

for (var i = 0; i < array_length(global.skills_display); i++) {
	
	draw_sprite(global.skills_display[i][1], 0, 1886 - i*32, 40); // draw skill icon
	skill_cooldown_display(i, i); // draw skill cooldown shade
	
	if (global.skills_display[i][0] >= 60) {
		var number = global.skills_display[i][0] div 60;
		//explosive shuriken number
		if (global.skills_display[i][1] == sExplosiveShurikenIcon) {
			var amountLeft = global.skills_display[i][2];
			if (amountLeft > 0) draw_sprite(sSkillNumbers, amountLeft - 1, 1886 - i*32 + 16, 40 + 20);
		}
		draw_sprite(sItemNo, number, 1886 - i*32, 40 + 19);
	}
	else {
		//explosive shuriken number
		if (global.skills_display[i][1] == sExplosiveShurikenIcon) {
			var amountLeft = global.skills_display[i][2];
			if (amountLeft > 0) draw_sprite(sSkillNumbers, amountLeft - 1, 1886 - i*32 + 16, 40 + 20);
		}
		draw_set_halign(fa_center);
		draw_set_font(bitmap_font);
		draw_text(1886 - i*32 + 16, 40 + 10, string(global.skills_display[i][0])); //draw skill timmer
		draw_set_halign(fa_left); //set back to default
		draw_set_font(-1);
	}
}
