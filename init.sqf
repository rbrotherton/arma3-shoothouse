// Class variables
hostile_class   	  = "I_C_Soldier_Bandit_8_F";
hostile_marker_class  = "SignAd_SponsorS_Vrana_F";
hostage_class 		  = "C_scientist_F";
hostage_marker_class  = "SignAd_SponsorS_Suatmm_F";
position_marker_class = "VR_3DSelector_01_default_F";

// HUD variables
total_score 	   = 0;
previous_score	   = 0;
total_hostiles 	   = 0;
hostiles_alive	   = 0;
total_hostages     = 0;
hostages_remaining = 0;
hostages_rescued   = 0;
headshots_count    = 0;
player_shots_fired = 0;
hostile_hit_count  = 0;

// Scoring variables
score_player_hit 	  = -10;
score_hostage_killed  = -50;
score_hostage_rescued = 50;
score_hostile_killed  = 20;
score_headshot		  = 10;
score_multikill		  = 10;

// Difficulty variables
max_diff_rating   	  = 5;
diff_rating 	  	  = 3; 
diff_names			  = ["Very Easy", "Easy", "Normal", "Hard", "Realism"];
diff_damage_taken     = [0, .1, .25, .50, 1];
diff_score_multiplier = [1, 1.5, 2, 2.5, 3];

// Control variables
run_start_time 		 = 0;   // Seconds
previous_run_time 	 = 0;   // Seconds
last_hostile_hit 	 = 0;   // Seconds
last_kill 			 = 0;   // Seconds
multikill_limit 	 = 2;   // Max seconds between kills for multikill
hit_count_limit		 = 0.1; // Max time between 'hitpart' event fired to count total hostile hits
new_round_starting 	 = false;
round_ending         = false;
hostiles_marked		 = false;
timer_started 		 = false;
god_mode_enabled     = false;
player_infinite_ammo = false;

// Mod detection
ace_is_loaded = isClass(configFile >> "CfgPatches" >> "ace_main");

// Add Player Actions
player addAction ["[CQC] Start New Round", 	{[1] execVM "scripts\new_round.sqf";}, [], 2, false, true];
player addAction ["[CQC] Toggle Day/Night", {execVM "scripts\toggle_day_night.sqf";}, [], 2, false, true];
player addAction ["[CQC] Show Enemies", 	{execVM "scripts\toggle_show_enemies.sqf";}, [], 2, false, true];
player addAction ["[CQC] Refill Ammo", 		{execVM "scripts\refill_ammo.sqf";}, [], 2, false, true];
player addAction ["[CQC] Infinite Ammo",    {execVM "scripts\toggle_infinite_ammo.sqf";}, [], 2, false, true];

// Remove ACE medical event handlers 
if (ace_is_loaded) then { 
	player removeAllEventHandlers "hit";
	player removeAllEventHandlers "hitpart";
	player removeAllEventHandlers "handledamage";
	player removeAllEventHandlers "killed";
	player removeAllEventHandlers "explosion";
	player removeAllEventHandlers "dammaged";
};

// Disable saving
enableSaving [false, false];

// Give the player an action to toggle difficulty level
player addAction ["[CQC] Toggle Difficulty", {[max_diff_rating, diff_rating, diff_damage_taken] execVM "scripts\toggle_difficulty.sqf";}, [], 2, false, false];

// Support damage scaling with difficulty adjustments
player addEventHandler ["hit",   		{[_this select 0, _this select 1, _this select 2, _this select 3] execVM "scripts\player_hit.sqf";}];
player addEventHandler ["handleDamage", {[_this select 0, _this select 1, _this select 2, _this select 3] execVM "scripts\player_handle_damage.sqf";}];

// Universal player events
player addEventHandler ["killed", {[_this select 0, _this select 1, _this select 2] execVM "scripts\player_killed.sqf";}]; 
player addEventHandler ["fired", {[] execVM "scripts\player_fired.sqf";}]; 

// Load CQCHUD
sleep 1; // Do not remove
1 cutRsc ["CQCHUD","PLAIN"];

// Start a new match
null = [0] execVM "scripts\new_round.sqf";	 

