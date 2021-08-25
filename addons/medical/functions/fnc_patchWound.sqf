#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname"];

[_patient, "activity", LSTRING(activityPatchedPatient), [[_medic, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;

[QGVAR(patchWoundLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
