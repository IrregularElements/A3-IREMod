#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "ace_medical_treatment"};
		author = ECSTRING(main,tsar_bimbo);
		authors[] = {};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;
	};
};

#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "CfgEventHandlers.hpp"
