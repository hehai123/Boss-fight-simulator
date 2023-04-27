/// @description Create damage number

var dmg_control = instance_create_layer(0, 0, "controller", oDamageController);
if (spread == false) {
	dmg_control.skill = "quadthrow"; 
}
else if (spread == true) {
	dmg_control.skill = "spreadthrow"; 
}
