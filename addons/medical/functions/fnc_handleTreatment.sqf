#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname"];

TRACE_4("handleTreatment", _medic, _patient, _bodyPart, _className);

if(!GVAR(epiBonusEnabled) || (GVAR(epiBonusDuration) <= 0)) exitWith { false; };
if((toUpper _classname) != "EPINEPHRINE") exitWith { false; };

private _hasTourniquet = [_patient, _bodyPart] call ace_medical_treatment_fnc_hasTourniquetAppliedTo;
if(_hasTourniquet) exitWith {
	TRACE_1("Unit has tourniquets on body part", _bodyPart);
	false;
};

private _lastEpiBonus = _patient getVariable VAR_ACTIVE_EPI_BONUS_TIME;

if(!(isNil "_lastEpiBonus")) then {
	if(_lastEpiBonus + GVAR(epiBonusCooldown) > CBA_missionTime) exitWith {
		TRACE_1("Epinephrine injected while bonus in cooldown", _lastEpiBonus);
		false;
	};
};

[_patient] call FUNC(startEpiBonus);
[FUNC(stopEpiBonus), [_patient], GVAR(epiBonusDuration)] call CBA_fnc_waitAndExecute;
