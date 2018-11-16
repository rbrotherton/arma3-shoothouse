player_shots_fired = player_shots_fired + 1;

// Infinite ammo support
if(player_infinite_ammo) then {
	[] execVM "scripts\refill_ammo.sqf";
};

// Set accuracy
sleep 0.1;
_player_accuracy = floor ((hostile_hit_count / player_shots_fired) * 100);
[6, _player_accuracy] execVM "scripts\update_hud.sqf";