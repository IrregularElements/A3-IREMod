#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: ire_mod_medical_fnc_startEpiBonus
Description:
    Applies temporary epinephrine bonus to _patient.  This forces the patient
	into conscious state and removes pain and limping.

	The epinephrine bonus must be non-invasive.  This means:
	- All temporary effects of it must be accurately reverted at the end.
	- The patient's medical state values during the bonus should reflect
	  the patient's actual medical state as accurately as possible; the patient
	  should be able to receive damage and get treated.  This means that e.g.
	  "serializing the damage, healing the unit, waiting and deserializing
	  the damage" is not a viable implementation.

Parameters:
    _patient  - the infantry unit to apply the bonus to
Returns:
    Boolean - whether the bonus was successfully applied
---------------------------------------------------------------------------- */

params ["_patient", ["_duration", GVAR(epiBonusDuration)]];

TRACE_1("startEpiBonus", _patient);

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

TRACE_1("startEpiBonus: checks passed", "");

private _isUnconscious = _patient getVariable ["ACE_isUnconscious", false];
private _isInCardiacArrest = IN_CRDC_ARRST(_patient);

TRACE_2(_isUnconscious, _isInCardiacArrest);

private _epiBonusSaved = [_isUnconscious, _isInCardiacArrest];

_patient setVariable [VAR_ACTIVE_EPI_BONUS_TIME, CBA_missionTime, true];
_patient setVariable [VAR_ACTIVE_EPI_BONUS_SAVED, _epiBonusSaved, true];

_patient setVariable [VAR_IS_FORCED_CONSCIOUS, true];

[_patient, false] call ace_medical_status_fnc_setCardiacArrestState;

if(_isUnconscious) then {
	private _currentState = [_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
	TRACE_2("Changing state machine:", _currentState, "Injured");
	[_patient, ace_medical_STATE_MACHINE, _currentState, "Injured"] call CBA_statemachine_fnc_manualTransition;
	[_patient, false] call ace_medical_status_fnc_setUnconsciousState;
	["ace_medical_wakeUp", _patient] call CBA_fnc_localEvent;
};

private _stopTime = CBA_missionTime + _duration;

private _antiLimpScriptHandle = [_patient, _stopTime] spawn {
	params ["_patient", "_stopTime"];

	waitUntil {
		_patient setHitPointDamage ["HitHands", 0];
		_patient setHitPointDamage ["HitLegs", 0];
		sleep 1;
		CBA_missionTime > _stopTime;
	};
};

_patient setVariable [VAR_ANTILIMP_SCRIPT_HND, _antiLimpScriptHandle, true];
