#include "script_component.hpp"

["CBA_settingsInitialized", {
	[] call FUNC(refreshAddonDiaryRecords);
}] call CBA_fnc_addEventHandler;
