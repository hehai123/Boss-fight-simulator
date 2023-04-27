/// @description Insert description here

// Remove pixel interpolation effect
gpu_set_texfilter(false);
draw_sprite(sDeathCountUI, 0, deathCounterUIX, deathCounterUIY);
draw_sprite(sDeathCountNumber, 0, deathCounterUIX + 54, deathCounterUIY + 29);
draw_sprite(sDeathCountNumber, deathCounterNumber, deathCounterUIX + 64, deathCounterUIY + 29);

draw_sprite(s_timer, 0, timerUIX, timerUIY);
draw_sprite(s_timer_number, min_1, timerUIMin1X, timerUINumY);
draw_sprite(s_timer_number, min_2, timerUIMin2X, timerUINumY);
draw_sprite(s_timer_number, sec_1, timerUISec1X, timerUINumY);
draw_sprite(s_timer_number, sec_2, timerUISec2X, timerUINumY);
gpu_set_texfilter(true);

// Hp bar
draw_sprite(s_bm_hp_guage,0,rm_width/2-400,0);
draw_sprite(s_bm_hp_guage,1,rm_width/2-400,0);
draw_sprite(s_bm_hp_guage,2,rm_width/2-400+37,0);
draw_sprite_stretched(s_bm_hp_guage2,0,rm_width/2-400+40, 0, 756, 20); 
draw_sprite_stretched(s_bm_hp_guage2,1,rm_width/2-400+40, 0, (mobHp/mobMaxHp)*756, 20); //Hp bar
draw_sprite(s_bm_hp_guage,3,rm_width/2+396,0);

//HP ratio
draw_sprite(s_HPRatio_background, 0, rmCenterX + hpRX, hpRY);
draw_set_font(bitmap_font);
draw_set_halign(fa_right);
if (mobHp == mobMaxHp) {
	draw_text(rmCenterX + hpNumPosX, hpNumPosY, string_format(integerDigits, 3, 0) + "%");
}
else draw_text(rmCenterX + hpNumPosX, hpNumPosY, string_format(integerDigits, 3, 1) + "%");
draw_set_font(-1);
draw_set_halign(fa_left); //set back to default

// Bind Timer
if (bindTimer > 0) {
	draw_sprite(sBindResistIcon, 0, rm_width/2-400 + 38, 21);
	draw_sprite(sSkillCooldownNumberSmall, bindSec1, rm_width/2-400 + 38 + 1, 21 + 19);
	draw_sprite(sSkillCooldownNumberSmall, bindSec2, rm_width/2-400 + 38 + 10, 21 + 19);
}

// Quick key 
draw_sprite(s_quick_key, 0, quickSlotX, quickSlotY);

//drawing key alphanumeric (top most layer) for quick slot and icon
for (var i = 0; i < 32; i++)
{
	if (global.quickSlotPosition[i][3] == true) {
		// Draw quick slot icons
		draw_sprite(
		global.quickSlotPosition[i][4],
		global.quickSlotPosition[i][5],
		global.quickSlotPosition[i][0] + quickSlotCurrentX + 574, 
		global.quickSlotPosition[i][1]);
	}
	// Draw quick slot keys
	draw_sprite(
		key_all,
		global.quickSlotPosition[i][2] - 1,
		global.quickSlotPosition[i][0] + 2 + quickSlotCurrentX + 574,
		global.quickSlotPosition[i][1] + 2
		);
	// Skill cd number
	switch (global.quickSlotPosition[i][4]) {
		case s_spread_throw_icon:
			quickSlotSkillCooldownDisplay("nlSpreadThrow", i);
			break;
		case sExplosiveShurikenIcon:
			quickSlotSkillCooldownDisplay("nlExplosiveShuriken", i);
			break;
		case s_fuma_icon:
			quickSlotSkillCooldownDisplay("nlFuma", i);
			break;
		case sErdaNovaIcon:
			quickSlotSkillCooldownDisplay("nlErdaNova", i);
			break;
	}
}

draw_sprite(s_quick_key, 1, quickSlotX, quickSlotY);
draw_sprite(s_quick_key_left, 0, quickSlotX + 2, quickSlotY + 3);

// Quick Slot selected glow
if (global.selectedQuickSlotKey != -1) draw_sprite(sKeyQuickSlotSelected, 0, global.quickSlotPosition[global.selectedQuickSlotKey][0], global.quickSlotPosition[global.selectedQuickSlotKey][1]);

