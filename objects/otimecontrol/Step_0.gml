/// @description Check if timesource end

if (time_source_get_state(timer) == time_source_state_stopped) {
	instance_destroy();
}








