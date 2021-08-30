#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "ire_mod_main", "ace_medical", "ace_medical_engine", "ace_medical_treatment", "ace_medical_status", "ace_medical_vitals", "ace_medical_statemachine"};
		author = ECSTRING(main,tsar_bimbo);
		authors[] = {};
		url = ECSTRING(main,URL);
		VERSION_CONFIG;
	};
};

#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "Statemachine.hpp"
#include "CfgEventHandlers.hpp"
