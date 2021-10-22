#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];
TRACE_1("removeTreatmentHint",_this);

if(_patient != ACE_player) exitWith { false; };

private _hints = ACE_player getVariable VAR_TREATMENT_HINTS;
if(isNil { ACE_player getVariable VAR_TREATMENT_HINTS }) exitWith { false; };

_hints deleteAt (_hints findIf {
	_x params ["_m", "_b", "_c"];
	_m == _medic && _b == _bodyPart && _c == _usedItem
});

ACE_player setVariable [VAR_TREATMENT_HINTS, _hints];
