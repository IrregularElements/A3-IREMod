#include "script_component.hpp"

params ["_unit", "_l10nCode", "_args"];

private _targets = (units _unit) arrayIntersect (call BIS_fnc_listPlayers);

[QGVAR(groupChatGlobal), [_unit, _l10nCode, _args], _targets] call CBA_fnc_targetEvent;
