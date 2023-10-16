#include "script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname"];

if(!GVAR(epiBonusEnabled) || (GVAR(epiBonusDuration) <= 0)) exitWith { false; };
if((toUpper _classname) != "EPINEPHRINE") exitWith { false; };

if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

private _hasTourniquet = [_patient, _bodyPart] call ace_medical_treatment_fnc_hasTourniquetAppliedTo;
if(_hasTourniquet) exitWith {
	false;
};

private _lastEpiBonus = _patient getVariable VAR_ACTIVE_EPI_BONUS_TIME;

if(!(isNil "_lastEpiBonus")) then {
	if(_lastEpiBonus + GVAR(epiBonusCooldown) > CBA_missionTime) exitWith {
		false;
	};
};

private _percentageRoll = random 1.0;
private _probability = GVAR(epiBonusProbability);
private _cooldownAfterFail = GVAR(cooldownOnFailedEpiBonus);

if(_percentageRoll <= _probability) then {
	// Successful epi bonus roll
	[_patient] call FUNC(saveEpiBonusTime);
	[_patient] call FUNC(startEpiBonus);
	[FUNC(stopEpiBonus), [_patient], GVAR(epiBonusDuration)] call CBA_fnc_waitAndExecute;
}
else {
	// Failed epi bonus roll
	if(_cooldownAfterFail) then {
		[_patient] call FUNC(saveEpiBonusTime);
	};
};
