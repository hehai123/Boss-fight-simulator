// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*
function movement(){
	shoe_swim_acc = 1;
	shoe_swim_speed_h = 1;
	shoe_walk_jump = 1.0;
	swim_speed = 140;
	fall_speed = 670;
	float_coefficient = 0.01;
	float_drag_1 = 100000;
	float_drag_2 = 10000;
	float_multiplier = 0.0008928571428571428 // 1/1120 
	shoe_mass = 100;
	delta = 0.01;
	fly_force = 120000;
	gravity_acc = 2000;
	jump_speed = 555;
	down_jump_multiplier =  0.35355339; //6959/19683? 
	walk_speed = 125;
	
	
	if (jumping)
	{
		if down_jump
		{
			vx = 0;
			vy = -jump_speed * down_jump_multiplier; // jump down by moving up first 
		}
		else //???
		{
			vy = shoe_walk_jump * jump_speed * (flying ? -0.7 : -1); // what is flying?
			fmax = walk_speed * shoe_walk_speed;
		}
			
			
	}
	
	if (flying) {
        var vmid = shoe_swim_acc; // 1
        var vmax = shoe_swim_speed_h * swim_speed; // 140
        var shoefloat = float_drag_1 / shoe_mass * delta; // 10
        vx = vx < -vmax //vx is velocity? // vx < -140
                    ? min(-vmax, vx + shoefloat) // some form of acc?
                    : vx > vmax ? max(vmax, vx - shoefloat) // 
                                : mleft ? max(-vmax, vx - shoefloat) // if left arrow key pressed, max abs speed is vx - shoefloat
                                        : mright ? min(vmax, vx + shoefloat) // if right arrow key pressed, max abs speed is vmax
                                                : vx > 0 ? max(0., vx - shoefloat) // if not pressing right or left arrow key, speed decelerates to 0
                                                        : min(0., vx + shoefloat);
        var flys = fly_force / shoe_mass * delta * vmid; // 14
        vy = mup
                    ? vy < vmax * 0.3 ? min(vmax * 0.3, vy + flys * 0.5) // if key up, if is slower than 0.3*vmax, accelerate to vmax*0.3?
					
                                    : max(vmax * 0.3, vy - flys) 
                    : mdown 
                        ? vy < vmax * 1.5 ? min(vmax * 1.5, vy + flys) // if key down, if drop too fast? 
                                            : max(vmax * 1.5, vy - flys * 0.5)
                        : vy < vmax ? min(vmax, vy + flys) : max(vmax, vy - flys); // 
	}
	
	else { // what is else?? falling? 
		shoefloat = float_drag_2 / shoe_mass * delta; // 1
        vy > 0 ? vy = max(0., vy - shoefloat) : vy = min(0., vy + shoefloat); // if >0, decrease to 0, if <0, increase to 0 
        vy = min(vy + gravity_acc * delta, fall_speed); // gravity_acc*delta = 20, increase to 670.	Down is positive 
        vx = mleft 
                    ? vx > -float_drag_2 * float_multiplier // if key left 
                        ? max(-float_drag_2 * float_multiplier, vx - 2 * shoefloat) //if vx > -8.92, continue decreasing until -8.92 by -2 per tick
                        : vx // else it is capped at -8.92 
                    : mright 
                        ? vx < float_drag_2 * float_multiplier //else if key right 
                                ? min(float_drag_2 * float_multiplier, vx + 2 * shoefloat) // if vx < 8.92, vs increase until 8.92 by 2 per tick  
                                : vx // else it is capped at 8.92
                        : vy < fall_speed // if no right or left key pressed {
                                ? vx > 0 ? max(0., vx - float_coefficient * shoefloat) // if vy < fall_speed && if vx > 0, vx decreases to 0 by -0.01 per tick
                                        : min(0., vx + float_coefficient * shoefloat) // if vy < fall_speed && vx <= 0, vx increases to 0 by 0.01 per tick
                                : vx > 0 ? max(0., vx - shoefloat) // if vy >= fall_speed && vx > 0, vx decreases to 0 by -1 per tick 
                                        : min(0., vx + shoefloat); // if vy >= fall_speed && vx <= 0, vx increases to 0 by 1 per tick 
}

}
*/