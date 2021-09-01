#include "script_component.hpp"

params ["_unit", "_caller", "_actionId", "_arguments"];
_arguments params ["_item", "_vehicle", ["_radius", 100], ["_unloadDistance", 10]];
/*params ["_target", "_caller", "_actionId", "_arguments"];*/
/*_arguments params ["_item", "_vehicle", ["_radius", 100]];*/

//params ["_unit", "_caller", "_item", "_vehicle", ["_radius", 100], ["_unloadDistance", 5]];

private _distance = _unit distance _vehicle;
private _vehName = [_vehicle] call ire_mod_main_fnc_getDisplayName;
private _itemName = [_item] call ire_mod_main_fnc_getDisplayName;

if(_distance > _radius) exitWith {
	TRACE_2("Too far away from vehicle",_distance,_radius);
	[_unit, (format [LLSTRING(cargoActionTooFarAway), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);
	[_unit] call FUNC(refreshCargoActions);
	false;
};

TRACE_1("Disabling RADIOPROTOCOL",_unit);
_unit disableAI "RADIOPROTOCOL";
TRACE_2("DoMove to position",_unit,(position _vehicle));
_unit doMove position _vehicle;

private _distanceNow = _unit distance _vehicle;

waitUntil {
	sleep 0.5;
	_distanceNow = _unit distance _vehicle;
	_distanceNow < _unloadDistance;
};

doStop _unit;
TRACE_1("stopped moving at distance",(_unit distance _vehicle));

_unit disableAI "MOVE";

TRACE_1("_item before normalization",_item);
// Normalize class name
if(typeName _item == "STRING") then {
	_item = configname (configFile >> "CfgVehicles" >> _item);
};
TRACE_1("_item after normalization",_item);

// TODO: Could use the logic from ace_cargo_fnc_startUnload for non-instant unloading
private _unloadResult = [_item, _vehicle] call ace_cargo_fnc_unloadItem;

TRACE_1("_unloadResult",_unloadResult);

if(!_unloadResult) then {
	TRACE_3("Unload failed",_unit,_item,_vehicle);
	[_unit, (format [LLSTRING(cargoActionUnloadFailed), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);
};

[_unit] call FUNC(refreshCargoActions);

TRACE_1("enabling MOVE and RADIOPROTOCOL",_unit);
_unit enableAI "MOVE";
_unit enableAI "RADIOPROTOCOL";

[_unit, (format [LLSTRING(cargoActionComplete), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);

_unloadResult;
