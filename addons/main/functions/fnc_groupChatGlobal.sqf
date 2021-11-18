#include "script_component.hpp"

params ["_unit", "_l10nCode", "_args"];

private _targets = units _unit;

[QGVAR(groupChatGlobal), [_unit, _l10nCode, _args], _targets] call CBA_fnc_targetEvent;
