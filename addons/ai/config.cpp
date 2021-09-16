#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "ire_mod_main", "ace_cargo"};
		author = ECSTRING(main,tsar_bimbo);
		authors[] = {};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
