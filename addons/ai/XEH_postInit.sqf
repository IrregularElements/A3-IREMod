#include "script_component.hpp"

["itemAdd", [QGVAR(clearCargoActionGroupRefreshLoop), {
	[ACE_player] call FUNC(refreshCargoActionsGroup);
}, 30]] call BIS_fnc_loop;
