#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

if(_patient != ACE_player) exitWith { false; };

private _allowSelfHints = currentNamespace getVariable [QGVAR(allowTreatmentSelfHints), false];
if(_medic == _patient && !_allowSelfHints) exitWith { false; };

private _hints = ACE_player getVariable [VAR_TREATMENT_HINTS, []];
_hints pushBack [_medic, _bodyPart, _className, _usedItem, CBA_missionTime];
ACE_player setVariable [VAR_TREATMENT_HINTS, _hints];
