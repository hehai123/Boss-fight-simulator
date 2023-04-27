/// @description Recover from stunned state

if move_dir == 0
{	
	if (isGrounded) {
		state = states.idle;
	}
	else state = states.jump;
	dec_type = 0;
	image_index = 0;
}
else if move_dir != 0
{
	if (isGrounded) {
		state = states.walk;
	}
	else state = states.jump;
	dec_type = 0;
	image_index = 0;
}

canTurn = true;





