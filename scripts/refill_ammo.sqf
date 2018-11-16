// Refill Ammo in Primary/sidearm
player setAmmo [handgunWeapon player, 1000];
player setAmmo [primaryWeapon player, 1000];

// If we're not using infinite ammo, refill all magazines too
if(!player_infinite_ammo) then {

	// Get Magazine Types
	_primary_magazine = (primaryWeaponMagazine player) select 0;
	_handgun_magazine = (handgunMagazine player) select 0;

	// Refill each magazine type
	{
		// How many of this type of mag do I have?
		_count = 0;
		_current_mag = _x;
		{
			if(_x == _current_mag) then {
				_count = _count + 1;
			};
		} forEach magazines player;

		// Refill this type to 3
		player addMagazines [_current_mag, (3 - _count)];

	}	forEach [_primary_magazine, _handgun_magazine];

}