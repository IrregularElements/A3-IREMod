#include "script_component.hpp"

params ["_unit", "_caller", "_actionId", "_arguments"];
_arguments params ["_item", "_vehicle", ["_radius", 100], ["_unloadDistance", 10]];

private _distance = _unit distance _vehicle;
private _vehName = [_vehicle] call EFUNC(main,getDisplayName);
private _itemName = [_item] call EFUNC(main,getDisplayName);

if(!([_vehicle] call FUNC(vehicleIsStationary))) exitWith {
	[_unit, (format [LLSTRING(cargoActionVehicleMoving), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);
	false;
};

if(_distance > _radius) exitWith {
	[_unit, (format [LLSTRING(cargoActionTooFarAway), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);
	[_unit] call FUNC(refreshCargoActions);
	false;
};

_unit disableAI "RADIOPROTOCOL";

[_unit, _vehicle, _unloadDistance] call FUNC(navigateTo);

doStop _unit;
_unit disableAI "MOVE";

// Normalize class name
if(typeName _item == "STRING") then {
	_item = configname (configFile >> "CfgVehicles" >> _item);
};

// TODO: Could use the logic from ace_cargo_fnc_startUnload for non-instant unloading
private _unloadResult = [_item, _vehicle] call ace_cargo_fnc_unloadItem;

if(!_unloadResult) then {
	[_unit, (format [LLSTRING(cargoActionUnloadFailed), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);
};

[_unit] call FUNC(refreshCargoActions);

_unit enableAI "MOVE";
_unit enableAI "RADIOPROTOCOL";

[_unit, (format [LLSTRING(cargoActionComplete), _itemName, _vehName])] call EFUNC(main,groupChatGlobal);

_unloadResult;
