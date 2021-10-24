#include "script_component.hpp"

params ["_layer", "_speed"];

private _refreshers = uiNamespace getVariable [VAR_CUTTEXTREFRESHHANDLES, createHashMap];

if(_layer in _refreshers) then {
	private _handle = _refreshers get _layer;
	[_handle] call CBA_fnc_removePerFrameHandler;
	_refreshers deleteAt _layer;
};

uiNamespace setVariable [VAR_CUTTEXTREFRESHHANDLES, _refreshers];

_layer cutFadeOut _speed;
