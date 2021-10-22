#include "script_component.hpp"

params [["_hints", (ACE_player getVariable [VAR_TREATMENT_HINTS, []])]];

if(count _hints == 0) exitWith {
	TREATMENT_HINTS_LAYER_VAR cutFadeOut 1;
	true;
};

private _formattedHints = _hints apply { [_x] call FUNC(formatTreatmentHint); };
_formattedHints = _formattedHints joinString "\n";

TREATMENT_HINTS_LAYER_VAR cutFadeOut 0;
TREATMENT_HINTS_LAYER_VAR cutText [_formattedHints, "PLAIN DOWN"];

true;
