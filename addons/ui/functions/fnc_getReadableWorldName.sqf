#include "script_component.hpp"

params [];

private _worldName = getText (configFile >> "CfgWorlds" >> worldName >> "description");

if(_worldName == "") then {
	_worldName = worldName;
};

_worldName;
