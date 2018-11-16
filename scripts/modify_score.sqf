disableSerialization;
_modify_value = _this select 0;
_message = _this select 1;

if(_modify_value >= 999999) then {
	total_score = 0;
} else {

	// Get difficulty multiplier
	_diff_multiplier = diff_score_multiplier select (diff_rating - 1);

	// Apply multiplier
	_multiplied_value = _modify_value * _diff_multiplier;

	// Update total score
	total_score = total_score + _multiplied_value;

	// Display plus or minus in message?
	if(_modify_value > -1) then {
		sign = "+";
	} else {
		sign = "-";
	};
	_abs = abs _multiplied_value;

	// Notify player
	[format ["%2 %3%4", total_score, _message, sign, _abs]] execVM "scripts\notify_player.sqf";
};

// Update Score HUD
[1, total_score] execVM "scripts\update_hud.sqf";