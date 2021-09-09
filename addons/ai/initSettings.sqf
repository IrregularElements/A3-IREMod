[
	QGVAR(cargoUnloadActionsEnabled),
	"CHECKBOX",
	[LSTRING(cargoUnloadActionsEnabled_DisplayName), LSTRING(cargoUnloadActionsEnabled_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	false,
	true,
	{[ACE_player] call FUNC(refreshCargoActionsGroup);}
] call CBA_fnc_addSetting;
