player_infinite_ammo = !player_infinite_ammo;

// Notify player of new status
if(player_infinite_ammo) then {
	[] execVM "scripts\refill_ammo.sqf";
	["Infinite Ammo: On"] execVM "scripts\notify_player.sqf";
} else {
	["Infinite Ammo: Off"] execVM "scripts\notify_player.sqf";
};