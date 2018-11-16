disableSerialization;
player setDamage 0;
_display = uiNameSpace getVariable "CQCHUD";
_control = _display displayCtrl 1002;
_control ctrlSetText (format ["Health: 100%"]);