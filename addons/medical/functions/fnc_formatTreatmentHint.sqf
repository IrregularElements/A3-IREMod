#include "script_component.hpp"

params ["_hint"];
_hint params ["_medic", "_bodyPart", "_className", "_usedItem", "_timeAdded"];

if(IS_UNCONSCIOUS(ACE_player)) exitWith {
	format [LLSTRING(treatmentHint_Unconscious)];
};

if(_bodyPart == "Body") then {
	_bodyPart = "Torso";
};

private _medicName = [_medic] call ace_common_fnc_getName;
private _bodyPartName = localize (format ["STR_ACE_Medical_GUI_%1", _bodyPart]);
private _treatmentName = "";

switch(_className) do {
		case "WoundPatching": {
			_treatmentName = LLSTRING(settingWoundPatchingEnabled_DisplayName);
		};

		case "Diagnose";
		case "CheckPulse";
		case "CheckBloodPressure";
		case "CheckResponse": {
			_treatmentName = getText (configFile >> "ace_medical_treatment_actions" >> _className >> "displayName");
		};

		default { _treatmentName = getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName"); };
};

format [LLSTRING(treatmentHint_Administering), _bodyPartName, _medicName, _treatmentName];
