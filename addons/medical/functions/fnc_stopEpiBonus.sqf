#include "script_component.hpp"

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

private _lastEpiBonusSaved = _patient getVariable [VAR_ACTIVE_EPI_BONUS_SAVED, nil];
if(isNil "_lastEpiBonusSaved") exitWith { false; };

_lastEpiBonusSaved params ["_wasUnconscious", "_wasInCardiacArrest"];

_patient setVariable [VAR_ACTIVE_EPI_BONUS_TIME, nil, true];
_patient setVariable [VAR_ACTIVE_EPI_BONUS_SAVED, nil, true];
_patient setVariable [VAR_IS_FORCED_CONSCIOUS, false, true];

[_patient] call ace_medical_vitals_fnc_handleUnitVitals;
private _isInCriticalCondition = !([_patient] call ace_medical_status_fnc_hasStableVitals);

if(_wasUnconscious && _isInCriticalCondition) then {
	[_patient, _wasUnconscious] call ace_medical_fnc_setUnconscious;

	private _currentState = [_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
	[_patient, ace_medical_STATE_MACHINE, _currentState, "Unconscious"] call CBA_statemachine_fnc_manualTransition;
	[_patient, true] call ace_medical_status_fnc_setUnconsciousState;
	["ace_medical_knockOut", _patient] call CBA_fnc_localEvent;

	if(_wasInCardiacArrest) then {
		[_patient, _wasInCardiacArrest] call ace_medical_status_fnc_setCardiacArrestState;
		[_patient, ace_medical_STATE_MACHINE, "Unconscious", "CardiacArrest"] call CBA_statemachine_fnc_manualTransition;
	};
};

private _antiLimpScriptHandle = _patient getVariable [VAR_ANTILIMP_SCRIPT_HND, nil];
if(!(scriptDone _antiLimpScriptHandle)) then {
	terminate _antiLimpScriptHandle;
};
_patient setVariable [VAR_ANTILIMP_SCRIPT_HND, nil, true];
_patient call ace_medical_engine_fnc_updateDamageEffects;
