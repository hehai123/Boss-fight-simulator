// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/*
function movement(){
	shoe_swim_acc = 1;
	shoe_swim_speed_h = 1;
	shoe_walk_jump = 1.0;
	shoe_walk_speed = 1.0;
	swim_speed = 140;
	swim_speed_dec = 
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
	
	min_friction = 0.05;
	max_friction = 2;
	shoe_walk_acc = 1;
	shoe_walk_drag = 1;
	shoe_walk_slant = 0.9;
	swim_speed_dec = 0.9;
	walk_drag = 80000;
	walk_force = 140000;
	slip_force = 60000;
	slip_speed = 120;
	
	if (fh) {
            fx = fh->x2 - fh->x1;
			fy = fh->y2 - fh->y1; 
			fx2 = fx * fx; 
			fy2 = fy * fy;
            len = sqrt(fx2 + fy2); // finding length of foothold using pythagoras' theorem
			
            mvr = vx * len / fx; //vx = 0 when reset 
            mvr -= fh->force; // some spring force?? 
			
            fs = (map::current["info"]["fs"] ? map::current["info"]["fs"] : 1.) / shoe_mass* delta; // fs = 0.0001 assume fs is 1 since not all map have fs 
			
            maxf = (flying ? swim_speed_dec : 1.) * walk_speed * shoe_walk_speed; // usually flying is false. therefore maxf = 1*walk_speed*shoe_walk_speed = 125
			
            // double horz = shoe_walk_acc * walk_force; // comment by them  
            drag = std::max(std::min(shoe_walk_drag, max_friction), min_friction)* walk_drag; // drag = 80000
			
            slip = fy / len; // 0 when ground is flat
            if (shoe_walk_slant < std::abs(slip)) // if slip more than 0.9, probably wont happen. 0.9 slip is very very steep
			{
                slipf = slip_force * slip;
                slips = slip_speed * slip;
                mvr += mleft ? -drag * fs : mright ? drag * fs : 0;
                mvr = slips > 0 ? std::min(slips, mvr + slipf * delta)
                                : std::max(slips, mvr + slipf * delta);
            } 
			else 
			{
                mvr = mleft // if left pressed, 
                          ? mvr < -maxf ? std::min(-maxf, mvr + drag * fs) //if mvr < -maxf, mvr = min(-maxf, mvr + drag*fs) = min(-125, mvr + 8)
                                        : std::max(-maxf, mvr - shoe_walk_acc * walk_force * fs) //else mvr = max(-maxf, mvr - 14)
                          : mright // if right pressed, 
                                ? mvr > maxf ? std::max(maxf, mvr - drag * fs) // if mvr > maxf, mvr = max(maxf, mvr -drag*fs) = max(125, mvr -8)
                                             : std::min(maxf, mvr + shoe_walk_acc * walk_force * fs) // else mvr = min(125, mvr + 14)
                                : mvr < 0. ? std::min(0., mvr + drag * fs) // if not pressing left or right, if mvr < 0, mvr = min(0 , mvr + 8) 
                                           : mvr > 0. ? std::max(0., mvr - drag * fs) : mvr; // else if mvr > 0, mvr = max(0, mvr - 8)
										   //else mvr = mvr or do nothing basically? 
            }
            mvr += fh->force;
            vx = mvr * fx / len, vy = mvr * fy / len;
        }
	
}
*/