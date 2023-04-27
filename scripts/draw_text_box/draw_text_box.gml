// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_box(text,y){

draw_set_font(Font1);

var a = 60;
var text_box_width = string_width(text);
var text_box_width_final = text_box_width + a*2;
var text_box_last = text_box_width mod 8; // for final text box x coordinate adjustment 

var box_x = rm_width/2-text_box_width_final/2;
var box_y = y;

draw_sprite_ext(s_bm_notification, 0, box_x, box_y, 1, 1, 0, c_white, 0.8);
for(var i=0; i<(text_box_width div 8); i++)
{
	draw_sprite_ext(s_bm_notification_2, 0, box_x + a + i*8, box_y, 1, 1, 0, c_white, 0.8);
}
draw_sprite_ext(s_bm_notification, 1, box_x + a + text_box_width - text_box_last, box_y, 1, 1, 0, c_white, 0.8);
draw_text(box_x + a, box_y + 53, text); // 50 is default?
}