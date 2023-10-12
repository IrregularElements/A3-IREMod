#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "ace_main"};
		author = CSTRING(tsar_bimbo);
		url = CSTRING(URL);
		VERSION_CONFIG;
	};
};

class CfgMods {
	class PREFIX {
		dir = "@IRE_mod";
		name = "IRE Mod";
		picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
		hidePicture = "true";
		hideName = "true";
		actionName = "Website";
		action = CSTRING(URL);
		description = "";
	};
};

#include "CfgSettings.hpp"
#include "CfgEventHandlers.hpp"
