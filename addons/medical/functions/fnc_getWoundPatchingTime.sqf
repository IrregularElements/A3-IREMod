#include "script_component.hpp"

params ["_medic", "_patient", "_bodypart", "_bandage"];

if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

private _bandageTime = _this call ace_medical_treatment_fnc_getBandageTime;
private _patchingCoefficient = GVAR(woundPatchingTimeMultiplier);

_bandageTime * _patchingCoefficient;
