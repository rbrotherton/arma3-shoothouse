disableSerialization;

if(!round_ending) then {
	
	// Prevent duplicate events
	round_ending = true;

	// Get message from parameters
	_message = _this select 0;

	// Heal player & make immortal
	player setDamage 0;

	// Teleport player to start
	null = [] execVM "scripts\reset_player_position.sqf";

	// Get details for scoreboard
	_run_time = call compile preprocessFileLineNumbers "scripts\get_elapsed_time.sqf";
	_terrorists_killed = total_hostiles - hostiles_remaining;
	_headshots_pct = 0;

	if(headshots_count > 0) then {
		_headshots_pct = floor ((headshots_count / _terrorists_killed) * 100);	
	};

	// Display end game scoreboard
	_sb = createDialog "Scoreboard";
	waitUntil {!isNull (uiNameSpace getVariable "Scoreboard")};
	_display = uiNameSpace getVariable "Scoreboard";
	_control = _display displayCtrl 1100;
	_template_string = "\n%1\n\nScore: %2\nTime: %3\n\nTerrorists Killed: %4\nHeadshots: %5 (%6%7 of kills)\nHostages Rescued: %8/%9";
	_control ctrlSetText (
		format [
			_template_string, 
			_message, 
			total_score, 
			_run_time, 
			_terrorists_killed, 
			headshots_count, 
			_headshots_pct,
			"%", 
			hostages_rescued,
			total_hostages
		]
	);

	// Play Music
	playSound "round_end";

	// Wait until player closes scoreboard
	waitUntil { !dialog };

	// Start new round
	null = [0] execVM "scripts\new_round.sqf";

	// Death condition makes player immortal, make them mortal again if needed
	player allowDamage !god_mode_enabled;

	// Prevent duplicate events
	round_ending = false;
};