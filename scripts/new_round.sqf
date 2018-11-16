// Prevent multiples
if(!new_round_starting) then {

	new_round_starting = true;	

	// Reset player position if needed
	if((_this select 0) == 1) then {[] execVM "scripts\reset_player_position.sqf"};

	// Remove any corpses
	{deleteVehicle _x} forEach allDead;

	// Remove any leftover units
	{if(!isPlayer _x) then {deleteVehicle _x;}} forEach allUnits;

	// Spawn Enemy Soldiers
	_hostile_count = 0;
	{
		// Randomize this position - 70% chance to spawn
		if(floor random 10 >= 3) then 
		{
			// Create Group for unit & set behavior
			_unit_group = createGroup [east, true];
			_unit_group setBehaviour "SAFE";

			// Spawn unit, set rotation, and set standing
			_unit = _unit_group createUnit [hostile_class, getPos _x, [], 0, "CAN_COLLIDE"];
			_unit setDir getDir _x;
			_unit setUnitPos "UP";

			// Remove grenades
			_unit removeMagazines "HandGrenade";
			_unit removeMagazines "MiniGrenade";

			// Count
			_hostile_count = _hostile_count + 1;

			// Add Event Handlers
			_unit addMPEventHandler ["mpkilled", {Null = [_this select 1, _this select 0] execVM "scripts\hostile_killed.sqf";}]; 
			_unit addEventHandler ["HitPart", {[_this select 0] execVM "scripts\hostile_hit_part.sqf";}];
		}

	} forEach nearestObjects [player, [hostile_marker_class], 1000];

	//Update Enemies count HUD
	hostiles_remaining = _hostile_count;
	total_hostiles 	   = _hostile_count;
	[3, hostiles_remaining] execVM "scripts\update_hud.sqf";


	// Spawn Hostages
	_hostage_count = 0;
	{
		// Randomize this position - 70% chance to spawn
		if(floor random 10 >= 3) then 
		{	
			// Create Group for unit & set behavior
			_unit_group = createGroup [civilian, true];
			_unit_group setBehaviour "SAFE";

			// Spawn unit, set rotation, set standing, and disallow moving
			_unit = _unit_group createUnit [hostage_class, getPos _x, [], 0, "CAN_COLLIDE"];
			_unit setDir getDir _x;
			_unit setUnitPos "UP";
			_unit disableAI "MOVE";
			_unit switchMove "AmovPercMstpSsurWnonDnon"; // Put hands up

			// Set rescued state
			_unit setVariable ["rescued", false, true];

			// Count
			_hostage_count = _hostage_count + 1;

			// Add Event Handler
			_unit addMPEventHandler ["mpkilled", {Null = [_this select 1, _this select 0] execVM "scripts\hostage_killed.sqf";}]; 

			// Add Rescue Actions
			_unit addAction ["Rescue", {[_this select 0] execVM "scripts\hostage_rescued.sqf";}, [], 2, true, true, "", "true", 5];
		}

	} forEach nearestObjects [player, [hostage_marker_class], 1000];

	// Track Hostages count HUD
	total_hostages     = _hostage_count;
	hostages_alive     = _hostage_count;
	hostages_remaining = _hostage_count;
	hostages_rescued   = 0;
	[5, total_hostages] execVM "scripts\update_hud.sqf";

	// Reset Score
	[999999] execVM "scripts\modify_score.sqf";

	// Notify Player 
	["", "New round started!"] spawn BIS_fnc_showSubtitle;

	// Play sound
	playSound "new_round";

	// Reset player health
	[] execVM "scripts\reset_player_health.sqf";

	// Reset accuracy in HUD
	[6, 100] execVM "scripts\update_hud.sqf";

	// Reset the timer
	run_start_time = time;
	timer_started = false;
	[4, "00:00"] execVM "scripts\update_hud.sqf";

	// Reset count variables
	headshots_count  	= 0;
	player_shots_fired  = 0;
	hostile_hit_count   = 0;

	// Refresh enemy markers
	if(hostiles_marked) then {
		execVM "scripts\toggle_show_enemies.sqf";
		execVM "scripts\toggle_show_enemies.sqf";
	};

	// Refill Ammo
	execVM "scripts\refill_ammo.sqf";

	// Prevent duplicates
	sleep 1;
	new_round_starting = false;
};