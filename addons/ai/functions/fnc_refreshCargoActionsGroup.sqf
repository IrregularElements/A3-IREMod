#include "script_component.hpp"

params ["_unit"];

if(!(_unit isKindOf "CAManBase")) exitWith { false; };

{
	[_x] call FUNC(clearCargoActions);
	if(GVAR(cargoUnloadActionsEnabled)) then {
		[_x] call FUNC(refreshCargoActions);
	};
} forEach ((units _unit) - [_unit]);
