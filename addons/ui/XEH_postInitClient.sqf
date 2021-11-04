#include "script_component.hpp"
#include "\x\ire_mod\addons\main\script_macros_id.hpp"

["CBA_settingsInitialized", {
	if(hasInterface) then {
		[] call FUNC(refreshAddonDiaryRecords);
		[{
			if (isNull findDisplay IDD_MAIN_MAP) exitWith {};
			[_this select 1] call CBA_fnc_removePerFrameHandler;
			[] call FUNC(refreshTerrainName);
		},  0, []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;
