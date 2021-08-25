params ["_namespace", "_varName", "_value"];

if(isNil (_namespace getVariable _varName)) then {
	_namespace setVariable [_varName, _value, true];
};
