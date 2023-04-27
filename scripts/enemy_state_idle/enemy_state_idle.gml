// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_idle(){


	#region Idle
	
	counter += 1;
	
	if(counter >= global.game_fps*3)
	{
		var change = choose(0,1);
		switch(change)
		{
			case 0: state = states.alert;
			case 1: counter = 0; break;
		}
	}
	
	//if collision_rectangle()
	//{}
	#endregion
}