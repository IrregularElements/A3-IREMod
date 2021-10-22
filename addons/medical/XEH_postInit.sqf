#include "script_component.hpp"

[QGVAR(patchWoundLocal), LINKFUNC(patchWoundLocal)] call CBA_fnc_addEventHandler;

GVAR(epinephrineHandler) = [QGVAR(epinephrine), LINKFUNC(handleEpinephrine)] call CBA_fnc_addEventHandler;
TRACE_1(GVAR(epinephrineHandler));

GVAR(treatmentHandler) = ["ace_treatmentSucceded", {
	params ["_medic", "_patient", "_bodyPart", "_classname"];
	[QGVAR(epinephrine), [_medic, _patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
TRACE_1(GVAR(treatmentHandler));
