#include "script_component.hpp"

params [["_hints", (ACE_player getVariable [VAR_TREATMENT_HINTS, []])]];

if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

if(count _hints == 0) exitWith {
	[TREATMENT_HINTS_LAYER_VAR, 1] call EFUNC(main,stopCutText);
	true;
};

private _formattedHints = _hints apply { [_x] call FUNC(formatTreatmentHint); };
_formattedHints = _formattedHints joinString "\n";

[TREATMENT_HINTS_LAYER_VAR, 0] call EFUNC(main,stopCutText);
[TREATMENT_HINTS_LAYER_VAR, _formattedHints] call EFUNC(main,startCutText);

true;
