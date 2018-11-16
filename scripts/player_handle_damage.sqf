_incoming_damage = _this select 2;
_damage_reduction = diff_damage_taken select (diff_rating - 1);
_reduced_damage_taken = _incoming_damage * _damage_reduction;

// Get old and new Player damage
_current_damage = damage player;
_new_damage = _current_damage + _reduced_damage_taken;

// Update player damage
if(_new_damage > _current_damage and _current_damage < 1) then {
	if(_new_damage >= 1) then {

		// Going to die, trigger game over
		player allowDamage false;
		null = ["Mission failed! You were killed"] execVM "scripts\end_round.sqf";

	} else {

		// APply damage
		player setDamage _new_damage;	

		// Update HUD
		_health_remaining = floor ((1 - _new_damage) * 100);
		[2, _health_remaining] execVM "scripts\update_hud.sqf";

	};
};