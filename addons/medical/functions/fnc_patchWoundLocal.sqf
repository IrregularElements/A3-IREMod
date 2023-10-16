#include "script_component.hpp"
params ["_patient", "_bodyPart", "_classname"];
if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };
[_patient, _bodyPart, "WoundPatching"] call ace_medical_treatment_fnc_bandageLocal;
