_player = _this select 0;
_player_name = name (_player);
_target = _this select 1;
_distance = round (_player distance _target);

// Remove 'rescue' action
_target removeAction 0;

// Modify score
if(isPlayer _player) then {
	[score_hostage_killed, "Hostage killed"] execVM "scripts\modify_score.sqf";	
	playSound "hostage_killed";
	playSound "hostage_killed";
};

// Track hostages alive
hostages_alive = hostages_alive - 1;

// If I haven't been rescued, decrement 'hostages remaining'
_rescued = _target getVariable "rescued";
if(!_rescued) then {
	hostages_remaining = hostages_remaining - 1;
	[5, hostages_remaining] execVM "scripts\update_hud.sqf";
};

// End game?
if(hostages_alive < 1) then {
	null = ["Mission failed! All hostages killed"] execVM "scripts\end_round.sqf";	
};