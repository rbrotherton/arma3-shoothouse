_part_array = _this select 0;

// Array of strings containing body parts hit
_sections_hit = _part_array select 5;

// The object that was damaged
_enemy   = _part_array select 0;
_shooter = _part_array select 1;

// Count this hit in total hits?
// Has it been at least 'hit_count_limit' seconds since the last time we logged a hit?
if((time - last_hostile_hit) > hit_count_limit) then  {
	
	// Was it the player?
	if(isPlayer _shooter) then {
		hostile_hit_count = hostile_hit_count + 1;
		last_hostile_hit = time;
	};
};

// Hit damage
_hit_detail = _part_array select 6;
_hit_value = _hit_detail select 0;
_indirect_hit_value = _hit_detail select 0;
// systemChat format ["Hit value: %1 | Indirect: %2", _hit_value, _indirect_hit_value];

// Did the EH pass us body parts that were hit?
if(typeName _sections_hit == "ARRAY" && (count _sections_hit) > 0) then {

	// Get this body part
	 _hit_part = _sections_hit select 0;

	// Was it a direct hit? Or splash damage
	_direct   = _part_array select 10;

	// Direct headshot?  Award bonus points
	if(typeName _hit_part == "STRING") then {
		if(_hit_part == "head" && _direct) then {
			headshots_count = headshots_count + 1;
			Null = [score_headshot, "Headshot"] execVM "scripts\modify_score.sqf";
		};
	};
};