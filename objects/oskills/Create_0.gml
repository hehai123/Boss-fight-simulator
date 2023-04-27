/// @description Insert description here

timer = 0; // for counter 
counter = 1; // for timer 
x_rand = 0;
y_rand = 0;
counter1 = 0;

//counter (goes down), icon, explosiveshuriken counter only, duration

global.skills_display = [];

global.skill_info = 
{	
	ExplosiveShuriken :
	{
		icon : sExplosiveShurikenIcon,
		cooldown : 180,
		cooldown_counter : 0,
		duration : 100,
		skill_on : false
	},
	
	SpreadThrow:
	{
		icon : s_spread_throw_icon,
		cooldown : 180,
		cooldown_counter : 0,
		duration : 60,
		skill_on : false
	}
}

map_string = "0123456789";
bitmap_font = font_add_sprite_ext(s_SkillCoolDownNumber_2, map_string, true, 1); 
