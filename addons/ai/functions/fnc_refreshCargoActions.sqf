#include "script_component.hpp"

params ["_unit", ["_distance", 50]];

TRACE_2("refresh cargo actions",_unit,_distance);

if(isNull _unit) exitWith {
	TRACE_1("Unit is nil", _unit);
	false;
};

[_unit] call FUNC(clearCargoActions);

private _cargoActions = _unit getVariable [QGVAR(cargoActions), []];

private _checkedVehicles = nearestObjects [_unit, ["LandVehicle", "Helicopter", "Plane"], _distance];

private _newActionCount = 0;

{
	private _vehicle = _x;
	private _cargoItems = _vehicle getVariable ["ACE_cargo_loaded", []];

	{
		private _item = _x;
		private _vehName = [_vehicle] call ire_mod_main_fnc_getDisplayName;
		private _itemName = [_item] call ire_mod_main_fnc_getDisplayName;

		TRACE_2("adding action",_item,_vehicle);

		private _actionId = _unit addAction [
			(format [LLSTRING(cargoActionDoUnload), _itemName, _vehName]),
			FUNC(unloadACECargoAI),
			[_item, _vehicle],
			2,
			false,
			true,
			"",
			"true",
			0
		];

		if(_actionId < 0) then {
			TRACE_1("actionId failed",_actionId);
			continue;
		};

		_newActionCount = _newActionCount + 1;
		_cargoActions = [_cargoActions, [[_actionId, _item, _vehicle]], 0] call BIS_fnc_arrayInsert;
	} forEach _cargoItems;
} forEach _checkedVehicles;

_unit setVariable [QGVAR(cargoActions), _cargoActions, false];

_newActionCount;
