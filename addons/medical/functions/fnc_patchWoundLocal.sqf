#include "script_component.hpp"
params ["_patient", "_bodyPart", "_classname"];
[_patient, _bodyPart, "WoundPatching"] call ace_medical_treatment_fnc_bandageLocal;
