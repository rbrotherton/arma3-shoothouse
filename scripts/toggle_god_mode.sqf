if(god_mode_enabled) then {
	player allowDamage true;
	god_mode_enabled = false;
} else {
	player allowDamage false;
	god_mode_enabled = true;
};

[format ["God mode: %1", str god_mode_enabled]] execVM "scripts\notify_player.sqf";