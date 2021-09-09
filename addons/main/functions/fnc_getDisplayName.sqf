params ["_unit"];

if (_unit isKindOf "CAManBase") exitWith {
    [_unit] call ace_common_fnc_getName;
};

private _class = _unit;

if (typeName _unit != "STRING") then {
	_class = typeOf _unit;
};

getText (configFile >> "CfgVehicles" >> _class >> "displayName");
