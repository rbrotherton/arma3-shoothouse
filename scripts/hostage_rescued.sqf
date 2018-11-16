hostages_rescued = hostages_rescued + 1;
_unit = _this select 0;
_unit_group = group _unit;

// Remove action
_unit removeAction 0;

// Set rescued state
_unit setVariable ["rescued", true, true];

// Update count & HUD
hostages_remaining = hostages_remaining - 1;
[5, hostages_remaining] execVM "scripts\update_hud.sqf";

// Play sound
playSound "hostage_rescued";
playSound "hostage_rescued";

// Run away
_waypoint_pos = getMarkerPos "hostage_waypoint";
_waypoint = _unit_group addWaypoint [_waypoint_pos, 0];
_unit switchMove "";
_unit enableAI "MOVE";
_unit setBehaviour "AWARE";
_waypoint setWaypointType "MOVE";

// Modify score
[score_hostage_rescued, "Hostage Rescued"] execVM "scripts\modify_score.sqf";

// Victory?
if(hostages_rescued == hostages_alive) then {
	sleep 1;
	null = ["Mission success! All surviving hostages rescued"] execVM "scripts\end_round.sqf";	
};