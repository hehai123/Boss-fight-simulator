/// @desc Returns y position of camera, and sets first if given
/// @param [y] (optional) new y
function camY() {
	// Because Game Maker's view functions take too long to write :'(
	if(argument_count == 1){
		var yy = argument[0];
		camPos(camX(), yy);
	}

	return camera_get_view_y(view_camera[0]);
}

/// @desc Returns x position of camera, and sets first if given
/// @param [x] (optional) new x
function camX() {
	// Because Game Maker's view functions take too long to write :'(
	if(argument_count == 1){
		var xx = argument[0];
		camPos(xx, camY());
	}

	return camera_get_view_x(view_camera[0]);
}

/// @desc Returns camera position as [x,y], sets position if given
/// @param [x] (optional) new x
/// @param [y] (optional) new y
function camPos() {
	// Because Game Maker's view functions take too long to write :'(

	if(argument_count == 2){
		var xx = argument[0];
		var yy = argument[1];
		camera_set_view_pos(view_camera[0], xx, yy);
	}

	return [camX(), camY()];
}

/// @desc Returns width of camera, and sets first if given
/// @param [width] (Optional) new width
function camW() {
	// Because Game Maker's view functions take too long to write :'(
	if(argument_count == 1){
		var ww = argument[0];
		camSize(ww, camH());
	}

	if(view_enabled){
		return camera_get_view_width(view_camera[0]);
	}else{
		return room_width
	}
}

/// @desc Returns width of camera, and sets first if given
/// @param [height] (Optional) new height
function camH() {
	// Because Game Maker's view functions take too long to write :'(
	if(argument_count == 1){
		var hh = argument[0];
		camSize(camW(), hh);
	}

	if(view_enabled){
		return camera_get_view_height(view_camera[0]);
	}else{
		return room_height;
	}
}

/// @desc Returns camera size as [w,h], sets position if given
/// @param [width] (optional) new width
/// @param [height] (optional) new height
function camSize() {
	// Because Game Maker's view functions take too long to write :'(
	if(argument_count == 2){
		var ww = argument[0];
		var hh = argument[1];
		camera_set_view_size(view_camera[0], ww, hh);
	}

	return [camW(), camH()];
}

/// @desc Returns left side of camera, (identical to camX() except that it's readonly)
function camL() {
	return camX();
}

/// @desc Returns right side of camera (ready only)
function camR() {
	return camX() + camW();
}

/// @desc Returns top side of camera, (identical to camY() except that it's readonly)
function camT() {
	return camY();
}

/// @desc Returns bottom side of camera (read only)
function camB() {
	return camY()+camH();
}