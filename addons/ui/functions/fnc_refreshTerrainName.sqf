#include "script_component.hpp"

params [["_showTerrainName", GVAR(showTerrainNameInMap)], ["_terrainName", [] call FUNC(getReadableWorldName)]];

if (!hasInterface) exitWith { false; };

private _mapDisplay = findDisplay IDD_MAIN_MAP;
if(_mapDisplay isEqualTo displayNull) exitWith { false; };

private _terrainNameCtrl = _mapDisplay displayCtrl IRE_MOD_UI_TERRAINNAME;
if(_terrainNameCtrl isEqualTo controlNull) exitWith { false; };

_terrainNameCtrl ctrlSetText "";

if(_showTerrainName) exitWith {
	_terrainNameCtrl ctrlSetText _terrainName;
	_terrainName;
};

"";
