/// @description Dmg numbers

skill = ""; // skill name
created = false; // prevents duplicates

screen_fps = global.game_fps; 

// damage number layer stuff
layer_id = "dmg_num";
l_depth = layer_get_depth(layer_id); // Gets the layer's depth 

//damange number y displacement
y_displacement = 0; 
y_change = -30;
monster_head_y = -158 - 60;

counter = 1; // number of damage lines

skill_delay = 0; // variable to store damage number delays 

skill_details = 
{
	 showdown : 
	 {
		 delay : 0.09,
		 hits : 4
	 },
	 quadthrow :
	 {
		 delay : 0.09,
		 hits : 10
	 },
	 spreadthrow :
	 {
		 delay : 0.09,
		 hits : 5
	 },
	 fuma:
	 {
		 delay : 0.1,
		 hits : 10
	 },
	 spread: 
	 {
		delay: 0,
		hits: 1
	 },
	 erda: 
	 {
		delay: 0.09,
		hits: 5
	 },
	  explosive: 
	 {
		delay: 0.09,
		hits: 10
	 }
}
