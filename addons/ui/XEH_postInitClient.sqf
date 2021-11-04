#include "script_component.hpp"

["CBA_settingsInitialized", {
	if(hasInterface) then {
		[] call FUNC(refreshAddonDiaryRecords);
	};
}] call CBA_fnc_addEventHandler;
