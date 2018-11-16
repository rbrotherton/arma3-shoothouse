_elapsed_time = time - run_start_time;
_minutes = floor (_elapsed_time / 60);
_seconds = floor (_elapsed_time mod 60);

// Add leading zero when necessary 
if(_seconds < 10) then {
	_seconds = format ["%1%2", "0", _seconds];
};

// Add leading zero when necessary 
if(_minutes < 10) then {
	_minutes = format ["%1%2", "0", _minutes];
};

// Return formatted time string
format ["%1:%2", _minutes, _seconds];