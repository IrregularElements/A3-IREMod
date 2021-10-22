#include "script_component.hpp"

params ["_hint"];
_hint params ["_medic", "_bodyPart", "_usedItem", "_timeAdded"];

if(_bodyPart == "Body") then {
	_bodyPart = "Torso";
};

private _medicName = [_medic] call ace_common_fnc_getName;
private _bodyPartName = localize (format ["STR_ACE_Medical_GUI_%1", _bodyPart]);
private _treatmentName = getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName");


if(IS_UNCONSCIOUS(ACE_player)) exitWith {
	format [LLSTRING(treatmentHint_Unconscious)];
};

format [LLSTRING(treatmentHint_Administering), _bodyPartName, _medicName, _treatmentName];
