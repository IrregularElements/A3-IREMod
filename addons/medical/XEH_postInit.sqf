#include "script_component.hpp"

[QGVAR(patchWoundLocal), LINKFUNC(patchWoundLocal)] call CBA_fnc_addEventHandler;


GVAR(epinephrineEH) = [QGVAR(epinephrine), LINKFUNC(handleEpinephrine)] call CBA_fnc_addEventHandler;

GVAR(addTreatmentHintEH) = [QGVAR(addTreatmentHint), LINKFUNC(addTreatmentHint)] call CBA_fnc_addEventHandler;

GVAR(removeTreatmentHintEH) = [QGVAR(removeTreatmentHint), LINKFUNC(removeTreatmentHint)] call CBA_fnc_addEventHandler;


TREATMENT_HINTS_LAYER_VAR = [TREATMENT_HINTS_LAYER_NAME] call BIS_fnc_rscLayer;
// This variable is not exposed as a CBA setting because it could only be required
// for debugging.
GVAR(allowTreatmentSelfHints) = false;


GVAR(treatmentStartedEH) = ["ace_treatmentStarted", {
	params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

	[QGVAR(addTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;

	if(GVAR(treatmentHintsEnabled)) then {
		[] call FUNC(displayTreatmentHints);
	};
}] call CBA_fnc_addEventHandler;

GVAR(treatmentFailedEH) = ["ace_treatmentFailed", {
	params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

	[QGVAR(removeTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;

	[] call FUNC(displayTreatmentHints);
}] call CBA_fnc_addEventHandler;

GVAR(treatmentSucceededEH) = ["ace_treatmentSucceded", {
	params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

	[QGVAR(epinephrine), [_medic, _patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;

	[QGVAR(removeTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;

	[] call FUNC(displayTreatmentHints);
}] call CBA_fnc_addEventHandler;
