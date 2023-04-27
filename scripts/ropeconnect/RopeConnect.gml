// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawRopeConnect_extend(){
	var _originX = floor(x);
	var _originY = floor(y) - rope_y_offset;
	
	var _chains = rope_length div ropeSize;
	draw_sprite(s_hook_ball, 0, _originX, _originY - rope_length);
	//draw_sprite(s_hook_btm, 0, _originX, _originY - ropeSize*2);
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite
		(
			s_hook_mid, 
			0,
			_originX,
			_originY - (i+2)*ropeSize
		);
	}
}

function DrawRopeConect_retract(){
	var _originX = floor(rope_x);
	var _originY = floor(rope_y) - rope_y_offset;
	var rope_height = _originY - rope_length;
	
	var _ropeY = _originY - (rope_length div ropeSize + 1)*ropeSize; // Y position of the top most link chain
	
	var _chains = rope_length_1 div ropeSize - 3; // number of link chains to draw 
	
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite
		(
			s_hook_mid, 
			0,
			_originX,
			_ropeY + i*ropeSize
		);
	}
	if rope_length_1 > 59
	{
		draw_sprite(s_hook_btm, 0, _originX, _ropeY + ropeSize*(_chains-1)); 
	}
	draw_sprite(s_hook_ball, 0, _originX, rope_height); 
}