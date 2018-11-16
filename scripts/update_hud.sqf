disableSerialization;

_element   = _this select 0;
_new_value = _this select 1;

waitUntil {!isNull (uiNameSpace getVariable "CQCHUD")};
_display = uiNameSpace getVariable "CQCHUD";

switch (_element) do { 
	case 1: {  // Score display
		_control = _display displayCtrl 1001;

		if(previous_score == 0) then {
			_control ctrlSetText format ["Score: %1", total_score];
		} else {
			_control ctrlSetText format ["Score: %1 (prev: %2)", total_score, previous_score];
		};

	}; 
	case 2: {  // Health display
		_control = _display displayCtrl 1002;
		_control ctrlSetText (format ["Health: %1%2", _new_value, "%"]);
	}; 
	case 3: {  // Enemies count/alive display
		_control = _display displayCtrl 1003;
		_control ctrlSetText (format ["Enemies: %1", _new_value]);
	}; 
	case 4: {  // Time display
		_control = _display displayCtrl 1004;
		_control ctrlSetText (format ["Time: %1", _new_value]);
	}; 
	case 5: {  // Hostages display
		_control = _display displayCtrl 1005;
		_control ctrlSetText (format ["Hostages: %1", _new_value]);
	}; 
	case 6: {  // Accuracy display
		_control = _display displayCtrl 1006;
		_control ctrlSetText (format ["Accuracy: %1%2", _new_value, "%"]);
	}; 
	default {}; 
};