params ["_patient", ["_conscious", true]];

private _targetState = "";
private _event = "";
if(_conscious) then {
	_targetState = "Injured";
	_event = "ace_medical_wakeUp";
} else {
	_targetState = "Unconscious";
	_event = "ace_medical_knockOut";
};

private _currentState = [_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;

[_patient, ace_medical_STATE_MACHINE, _currentState, _targetState] call CBA_statemachine_fnc_manualTransition;
[_patient, _conscious] call ace_medical_status_fnc_setUnconsciousState;
[_event, _patient] call CBA_fnc_localEvent;
