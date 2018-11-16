// Increment difficulty rating
if(diff_rating == max_diff_rating) then {
	diff_rating = 1;
} else {
	diff_rating = diff_rating + 1;	
};

// Get variables
_diff_name = diff_names select (diff_rating - 1);
_diff_multiplier = diff_score_multiplier select (diff_rating - 1);
_damage_taken = (diff_damage_taken select (diff_rating - 1)) * 100;

[format ["Difficulty:  %1 | Damage Taken: %2%3 | Score x%4", _diff_name, _damage_taken, "%", _diff_multiplier]] execVM "scripts\notify_player.sqf";