#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "cba_help", "ace_common"};
		author = ECSTRING(main,tsar_bimbo);
		authors[] = {};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "RscDisplayMainMap.hpp"
