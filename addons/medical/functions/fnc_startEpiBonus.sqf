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

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

_patient setVariable [VAR_IS_FORCED_CONSCIOUS, true];
[_patient, false] call ace_medical_status_fnc_setCardiacArrestState;

private _isUnconscious = _patient getVariable ["ACE_isUnconscious", false];

if(_isUnconscious) then {
	[_patient, true] call FUNC(forceConscious);
};

private _stopTime = CBA_missionTime + _duration;

private _antiLimpScriptHandle = [
	{
		params ["_args", "_handle"];
		_args params ["_patient", "_stopTime"];

		_patient setHitPointDamage ["HitHands", 0];
		_patient setHitPointDamage ["HitLegs", 0];

		if(CBA_missionTime > _stopTime) then {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_patient setVariable [VAR_ANTILIMP_SCRIPT_HND, nil, true];
		};
	},
	0,
	[_patient, _stopTime]
] call CBA_fnc_addPerFrameHandler;

_patient setVariable [VAR_ANTILIMP_SCRIPT_HND, _antiLimpScriptHandle, true];
