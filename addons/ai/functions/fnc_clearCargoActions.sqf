#include "script_component.hpp"

params ["_unit"];

if(isNull _unit) exitWith { false; };

TRACE_1("clear actions",_unit);

private _cargoActions = _unit getVariable [QGVAR(cargoActions), []];

{
	_x params ["_actionId", "_item", "_vehicle"];
	_unit removeAction _actionId;
} forEach _cargoActions;

_unit setVariable [QGVAR(cargoActions), [], false];

TRACE_1("clear actions done",_unit);
