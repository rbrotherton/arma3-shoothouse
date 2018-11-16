_current_hour = floor daytime;

if (_current_hour > 20 or _current_hour < 6 ) then {
	setDate [2015, 6, 6, 12, 0]; 
	0 setOvercast 0;
} else {
	setDate [2015, 6, 6, 24, 0]; 
	0 setOvercast 1;
};

