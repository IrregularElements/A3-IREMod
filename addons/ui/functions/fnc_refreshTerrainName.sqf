#include "script_component.hpp"

params [["_showTerrainName", GVAR(showTerrainNameInMap)], ["_terrainName", [] call FUNC(getReadableWorldName)]];

TRACE_2("call",_showTerrainName,_terrainName);

if (!hasInterface) exitWith { false; };

private _mapDisplay = findDisplay IDD_MAIN_MAP;
if(_mapDisplay isEqualTo displayNull) exitWith { false; };

private _terrainNameCtrl = _mapDisplay displayCtrl IRE_MOD_UI_TERRAINNAME;
if(_terrainNameCtrl isEqualTo controlNull) exitWith { false; };

TRACE_2("got to _terrainName check",_mapDisplay,_terrainNameCtrl);

_terrainNameCtrl ctrlSetText "";
TRACE_1("_terrainNameCtrl text",ctrlText _terrainNameCtrl);

if(_showTerrainName) exitWith {
	_terrainNameCtrl ctrlSetText _terrainName;
	TRACE_1("show terrain name",_terrainName);
	TRACE_1("_terrainNameCtrl text",ctrlText _terrainNameCtrl);
	_terrainName;
};

"";
