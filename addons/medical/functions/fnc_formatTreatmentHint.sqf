#include "script_component.hpp"
#define VAR_UNCON             "ACE_isUnconscious"
#define IS_UNCONSCIOUS(unit)        (unit getVariable [VAR_UNCON, false])

params ["_hint"];
_hint params ["_medic", "_bodyPart", "_className", "_usedItem", ""];

if(IS_UNCONSCIOUS(ACE_player)) exitWith {
	format [LLSTRING(treatmentHint_Unconscious)];
};

if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

if(_bodyPart == "Body") then {
	_bodyPart = "Torso";
};

private _medicName = [_medic] call ace_common_fnc_getName;
private _bodyPartName = localize (format ["STR_ACE_Medical_GUI_%1", _bodyPart]);
private _treatmentHintString = "";

switch(_className) do {
		case "Diagnose": {
			private _fmtString = LLSTRING(treatmentHint_Diagnosing);
			_treatmentHintString = format [_fmtString, _medicName];
		};

		case "CheckResponse": {
			private _fmtString = LLSTRING(treatmentHint_CheckingResponse);
			_treatmentHintString = format [_fmtString, _medicName];
		};

		case "CheckPulse": {
			private _fmtString = LLSTRING(treatmentHint_CheckingPulse);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		case "CheckBloodPressure": {
			private _fmtString = LLSTRING(treatmentHint_CheckingBloodPressure);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		case "WoundPatching": {
			private _fmtString = LLSTRING(treatmentHint_Patching);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		case "ApplyTourniquet": {
			private _fmtString = LLSTRING(treatmentHint_ApplyingTourniquet);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		case "RemoveTourniquet": {
			private _fmtString = LLSTRING(treatmentHint_RemovingTourniquet);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		case "Splint": {
			private _fmtString = LLSTRING(treatmentHint_ApplyingSplint);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName];
		};

		default {
			private _treatmentName = getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName");
			private _fmtString = LLSTRING(treatmentHint_Administering);
			_treatmentHintString = format [_fmtString, _bodyPartName, _medicName, _treatmentName];
		};
};

_treatmentHintString;
