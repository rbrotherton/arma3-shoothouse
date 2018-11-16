_player = _this select 0;
_player_name = name (_player);
_target = _this select 1;
_distance = round (_player distance _target);

// Modify score
[score_hostile_killed, "Tango down"] execVM "scripts\modify_score.sqf";

// Remove EventHandlers to prevent score gaming
_target removeAllEventHandlers "HitPart";

// Update HUD count of enemies
hostiles_remaining = hostiles_remaining - 1;
[3, hostiles_remaining] execVM "scripts\update_hud.sqf";

// Play sound
playSound "hostile_killed";
playSound "hostile_killed";

// Multikill bonus?
_time_since_last_kill = time - last_kill;
if(_time_since_last_kill <= multikill_limit) then {
	[score_multikill, "Multikill"] execVM "scripts\modify_score.sqf";	
};

// Track last kill
last_kill = time;

// End game?
if(hostiles_remaining < 1) then {
	null = ["Mission success! All hostiles eliminated"] execVM "scripts\end_round.sqf";	
};