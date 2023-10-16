[
	QGVAR(cargoUnloadActionsEnabled),
	"CHECKBOX",
	[LSTRING(cargoUnloadActionsEnabled_DisplayName), LSTRING(cargoUnloadActionsEnabled_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	CBA_CHECKBOX_ON,
	CBA_SETTING_SERVER,
	{[] call FUNC(refreshCargoActionsGroup);}
] call CBA_fnc_addSetting;
