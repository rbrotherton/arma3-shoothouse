while {timer_started} do {

	// Get total elapsed time
	_time_string = call compile preprocessFileLineNumbers "scripts\get_elapsed_time.sqf";
	
	// Update HUD
	[4, _time_string] execVM "scripts\update_hud.sqf";

	// Do this again in 1 second
	sleep 1;
};