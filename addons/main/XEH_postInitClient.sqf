#include "script_component.hpp"

GVAR(groupChatGlobalEH) = [QGVAR(groupChatGlobal), {
	params ["_unit", "_l10nCode", "_args"];
	private _chatText = _args call _l10nCode;
	_unit groupChat _chatText;
}] call CBA_fnc_addEventHandler;
