#include "script_component.hpp"

params ["_patient"];

if(!(_patient isKindOf "CAManBase")) exitWith { false; };
if(!(alive _patient)) exitWith { false; };

_veryLargeBloodLoss = (GET_BLOOD_VOLUME(_patient) < BLOOD_VOLUME_CLASS_4_HEMORRHAGE);
_inVeryCriticalCondition = _veryLargeBloodLoss;
_isForcedConscious = _patient getVariable [VAR_IS_FORCED_CONSCIOUS, false];

TRACE_3("stuff", _veryLargeBloodLoss, _inVeryCriticalCondition, _isForcedConscious);

(!_inVeryCriticalCondition) && _isForcedConscious;
