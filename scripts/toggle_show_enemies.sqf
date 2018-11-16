if(hostiles_marked) then {

	{
		deleteVehicle _x;
	} forEach nearestObjects [player, [position_marker_class], 1000];

	hostiles_marked = false;

} else {
	{
		if(typeof _x == hostile_class) then {
			_hostile_position = getPos _x;

			// Get marker position
			_x_coord = _hostile_position select 0;
			_y_coord = _hostile_position select 1;
			_z_coord = (_hostile_position select 2) + 4;
			_elevated_position = [_x_coord, _y_coord, _z_coord];

			// Create and position
			_marker = (position_marker_class createVehicle [0, 0, 0]);
			_marker enableSimulation false;
			_marker setPos _elevated_position;

			// Add event to hostile to remove marker 
			_x addMPEventHandler ["mpkilled", {deleteVehicle _marker;}]; 

		}
	} forEach allUnits;
	hostiles_marked = true;
};
