#include "script_component.hpp"
#define VAR_CRDC_ARRST        "ace_medical_inCardiacArrest"
#define IN_CRDC_ARRST(unit)         (unit getVariable [VAR_CRDC_ARRST, false])

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };
if(!isClass(configFile >> "CfgPatches" >> "ace_medical")) exitWith { false; };

private _isUnconscious = _patient getVariable ["ACE_isUnconscious", false];
private _isInCardiacArrest = IN_CRDC_ARRST(_patient);

TRACE_2("saveEpiBonusTime",_isUnconscious, _isInCardiacArrest);

private _epiBonusSaved = [_isUnconscious, _isInCardiacArrest];

_patient setVariable [VAR_ACTIVE_EPI_BONUS_TIME, CBA_missionTime, true];
_patient setVariable [VAR_ACTIVE_EPI_BONUS_SAVED, _epiBonusSaved, true];
