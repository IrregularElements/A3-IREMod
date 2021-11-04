#include "script_component.hpp"
#include "\x\ire_mod\addons\main\script_macros_id.hpp"

["CBA_settingsInitialized", {
	if(hasInterface) then {
		[] call FUNC(refreshAddonDiaryRecords);
	};
}] call CBA_fnc_addEventHandler;
