#include "script_component.hpp"

params ["_unit"];

if(!(_unit isKindOf "CAManBase")) exitWith { false; };

private _excludedUnits = call BIS_fnc_listPlayers;

{
	[_x] call FUNC(clearCargoActions);
	if(GVAR(cargoUnloadActionsEnabled)) then {
		[_x] call FUNC(refreshCargoActions);
	};
} forEach ((units _unit) - _excludedUnits);
