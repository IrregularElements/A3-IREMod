#include "script_component.hpp"

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

private _veryLargeBloodLoss = (GET_BLOOD_VOLUME(_patient) < BLOOD_VOLUME_CLASS_4_HEMORRHAGE);
private _inVeryCriticalCondition = _veryLargeBloodLoss;
private _isForcedConscious = _patient getVariable [VAR_IS_FORCED_CONSCIOUS, false];

(!_inVeryCriticalCondition) && _isForcedConscious;
