// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function skill_cooldown_display(pos, i) {
	var ratio = round(global.skills_display[i][0]/global.skills_display[i][3]*15);
	draw_sprite(s_coolTime, ratio, 1886 - pos*32, 40);
}

function quickSlotSkillCooldownDisplay(skill, i) {
	var timesource = global.testPlayerSkills[$ skill].timesource;
	if (time_source_get_state(timesource) != time_source_state_active) exit;
	
	var xVar = oController.quickSlotCurrentX
	var cdRemaining = time_source_get_time_remaining(timesource)
	var cooldown = global.testPlayerSkills[$ skill].coolDown;
	var ratio = 15 - round(cdRemaining*15/cooldown);
	
	// Skill Icon Shade
	draw_sprite(s_coolTime, ratio, global.quickSlotPosition[i][0] + xVar + 574, global.quickSlotPosition[i][1]);
	
	if (cdRemaining >= 60) {
		var number = cdRemaining div 60;
		draw_sprite(sItemNo, number, global.quickSlotPosition[i][0] + xVar + 574 + 23, global.quickSlotPosition[i][1] + 1);
	}
	else {
		draw_set_halign(fa_center);
		draw_set_font(bitmap_font2);
		draw_text(global.quickSlotPosition[i][0] + xVar + 574 + 16, global.quickSlotPosition[i][1] + 10, string(round(cdRemaining))); //draw skill timmer
		draw_set_halign(fa_left); //set back to default
		draw_set_font(-1);
	}
}