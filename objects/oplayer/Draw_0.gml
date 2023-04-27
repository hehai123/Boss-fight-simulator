if state = states.ropeconnect
{
	if rope_state == 0
	{
		DrawRopeConnect_extend();
	}
	else if rope_state == 1
	{
		DrawRopeConect_retract();
	}
}

draw_self();

//Draw hit box face only
//draw_set_color(c_red);
//if (state == states.prone) {
//	//if (face_dir == 1) draw_rectangle(x + 5, y - 36, x + 40, y - 1, true);
//	//else if (face_dir == -1) draw_rectangle(x - 41, y - 36, x - 6, y - 1, true);
//	//draw_sprite(s_prone_mask, 0, x, y);
//	if (face_dir == 1) draw_circle(x + 26, y - 17, 16, true);
//	else if (face_dir == -1) draw_circle(x - 26, y - 17, 16, true);
//}
//else {
//	//if (face_dir == 1) draw_rectangle(x - 14, y - 64, x + 21, y - 29, true);
//	//else if (face_dir == -1) draw_rectangle(x - 22, y - 64, x + 13, y - 29, true);
//	if (face_dir == 1) draw_circle(x + 1, y - 46, 16, true);
//	else if (face_dir == -1) draw_circle(x - 1, y - 46, 16, true);
//}
//draw_set_color(c_white);

//Testing purpose
//draw_circle(x, y, 10, true);

//draw_set_color(c_white);
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
//draw_rectangle(x, y - 50, x + face_dir*380, y, true); // for quad throw distance
//draw_rectangle(x, y - 50, x + face_dir*200, y, true);
//draw_line(x, y - 25, x + 299*face_dir, y - 25 -140);
//draw_set_color(c_black);
