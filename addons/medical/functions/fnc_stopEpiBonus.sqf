#include "script_component.hpp"

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };
if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

private _lastEpiBonusSaved = _patient getVariable [VAR_ACTIVE_EPI_BONUS_SAVED, nil];
if(isNil "_lastEpiBonusSaved") exitWith { false; };

_lastEpiBonusSaved params ["_wasUnconscious", "_wasInCardiacArrest"];

_patient setVariable [VAR_ACTIVE_EPI_BONUS_TIME, nil, true];
_patient setVariable [VAR_ACTIVE_EPI_BONUS_SAVED, nil, true];
_patient setVariable [VAR_IS_FORCED_CONSCIOUS, false, true];

[_patient] call ace_medical_vitals_fnc_handleUnitVitals;
private _isInCriticalCondition = !([_patient] call ace_medical_status_fnc_hasStableVitals);

if(_wasUnconscious && _isInCriticalCondition) then {
	[_patient, false] call FUNC(forceConscious);

	if(_wasInCardiacArrest) then {
		[_patient, _wasInCardiacArrest] call ace_medical_status_fnc_setCardiacArrestState;
		[_patient, ace_medical_STATE_MACHINE, "Unconscious", "CardiacArrest"] call CBA_statemachine_fnc_manualTransition;
	};
};

private _antiLimpScriptHandle = _patient getVariable [VAR_ANTILIMP_SCRIPT_HND, nil];
if(!(isNil "_antiLimpScriptHandle")) then {
	[_antiLimpScriptHandle] call CBA_fnc_removePerFrameHandler;
};
_patient setVariable [VAR_ANTILIMP_SCRIPT_HND, nil, true];
_patient call ace_medical_engine_fnc_updateDamageEffects;
