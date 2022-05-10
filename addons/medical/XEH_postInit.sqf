#include "script_component.hpp"

private _displayNewTreatmentHintCode = {
	if(GVAR(treatmentHintsEnabled)) then {
		[] call FUNC(displayTreatmentHints);
	};
};


[QGVAR(patchWoundLocal), LINKFUNC(patchWoundLocal)] call CBA_fnc_addEventHandler;

GVAR(epinephrineEH) = [QGVAR(epinephrine), LINKFUNC(handleEpinephrine)] call CBA_fnc_addEventHandler;

GVAR(addTreatmentHintEH) = [QGVAR(addTreatmentHint), LINKFUNC(addTreatmentHint)] call CBA_fnc_addEventHandler;
GVAR(removeTreatmentHintEH) = [QGVAR(removeTreatmentHint), LINKFUNC(removeTreatmentHint)] call CBA_fnc_addEventHandler;
GVAR(displayNewTreatmentHintsEH) = [QGVAR(displayNewTreatmentHint), _displayNewTreatmentHintCode] call CBA_fnc_addEventHandler;
GVAR(displayTreatmentHintsEH) = [QGVAR(displayTreatmentHints), LINKFUNC(displayTreatmentHints)] call CBA_fnc_addEventHandler;


TREATMENT_HINTS_LAYER_VAR = [TREATMENT_HINTS_LAYER_NAME] call BIS_fnc_rscLayer;

// Not exposed as a CBA setting: ire_mod_medical_allowTreatmentSelfHints
// (boolean, default: false)
// Shows treatment hints to the player when they are treating themselves.
GVAR(allowTreatmentSelfHints) = false;
// Not exposed as a CBA setting: ire_mod_medical_cooldownOnFailedEpiBonus
// (boolean, default: false)
// Starts the epinephrine cooldown if epinephrine bonus was not applied
// due to a failed probability check.
GVAR(cooldownOnFailedEpiBonus) = false;


GVAR(treatmentStartedEH) = ["ace_treatmentStarted", {
	params ["", "_patient", "", "", "", ""];

	[QGVAR(addTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;
	[QGVAR(displayNewTreatmentHint), [], _patient] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

GVAR(treatmentFailedEH) = ["ace_treatmentFailed", {
	params ["", "_patient", "", "", "", ""];

	[QGVAR(removeTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;
	[QGVAR(displayTreatmentHints), [], _patient] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

GVAR(treatmentSucceededEH) = ["ace_treatmentSucceded", {
	params ["_medic", "_patient", "_bodyPart", "_classname", "", ""];

	[QGVAR(epinephrine), [_medic, _patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
	[QGVAR(removeTreatmentHint), _this, _patient] call CBA_fnc_targetEvent;
	[QGVAR(displayTreatmentHints), [], _patient] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
