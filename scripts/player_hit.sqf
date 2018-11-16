_player = _this select 0;
_object_that_caused_damage = _this select 1;
_damage_caused_by_hit = _this select 2;
_who_shot_me = _this select 3;

// Modify score
[score_player_hit, "Player hit"] execVM "scripts\modify_score.sqf";