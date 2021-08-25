#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_bandage"];

if(!GVAR(woundPatchingEnabled)) exitWith { false; };

private _canBandage = _this call ace_medical_treatment_fnc_canBandage;
if(!_canBandage) exitWith { false; };

private _haveBandages = [_medic, _patient, ["ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"]] call ace_medical_treatment_fnc_hasItem;
if(_haveBandages) exitWith { false; };

true;
