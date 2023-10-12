#include "script_component.hpp"

#define BLOOD_VOLUME_CLASS_4_HEMORRHAGE 3.600
#define DEFAULT_BLOOD_VOLUME 6.0
#define VAR_BLOOD_VOL         "ace_medical_bloodVolume"
#define GET_BLOOD_VOLUME(unit)      (unit getVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME])

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

private _veryLargeBloodLoss = (GET_BLOOD_VOLUME(_patient) < BLOOD_VOLUME_CLASS_4_HEMORRHAGE);
private _inVeryCriticalCondition = _veryLargeBloodLoss;
private _isForcedConscious = _patient getVariable [VAR_IS_FORCED_CONSCIOUS, false];

(!_inVeryCriticalCondition) && _isForcedConscious;
