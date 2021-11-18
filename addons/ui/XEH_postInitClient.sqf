#include "script_component.hpp"

GVAR(onCBASettingsEH) = ["CBA_settingsInitialized", {
	if(hasInterface) then {
		[] call FUNC(refreshAddonDiaryRecords);
		[{
			if (isNull findDisplay IDD_MAIN_MAP) exitWith {};
			[_this select 1] call CBA_fnc_removePerFrameHandler;
			[] call FUNC(refreshTerrainName);
		},  0, []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;
