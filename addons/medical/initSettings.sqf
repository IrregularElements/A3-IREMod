[
	QGVAR(woundPatchingEnabled),
	"CHECKBOX",
	[LSTRING(settingWoundPatchingEnabled_DisplayName), LSTRING(settingWoundPatchingEnabled_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	false,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(woundPatchingTimeMultiplier),
	"SLIDER",
	[LSTRING(settingWoundPatchingTimeMultiplier_DisplayName), LSTRING(settingWoundPatchingTimeMultiplier_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	[1, 20, 5, 1, false],
	true
] call CBA_fnc_addSetting;
