#include "script_component.hpp"
#if __has_include("\z\ace\addons\medical_engine\script_component.hpp")
#include "\x\ire_mod\addons\medical\script_macros_ace.hpp"
#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\x\ire_mod\addons\main\script_mod.hpp"
#endif

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "ire_mod_main", "ace_main"};
		author = ECSTRING(main,tsar_bimbo);
		authors[] = {};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;
	};
};

#if __has_include("\z\ace\addons\medical_treatment\ACE_Medical_Treatment.hpp")
#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#endif

#if __has_include("\z\ace\addons\medical_statemachine\Statemachine.hpp")
#include "Statemachine.hpp"
#endif

#include "CfgEventHandlers.hpp"
