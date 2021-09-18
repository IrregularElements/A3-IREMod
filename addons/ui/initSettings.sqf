[
	QGVAR(cleanupDiaryRecords),
	"CHECKBOX",
	[LSTRING(settingCleanupDiaryRecords_DisplayName), LSTRING(settingCleanupDiaryRecords_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	false,
	false,
	{[] call FUNC(refreshAddonDiaryRecords)}
] call CBA_fnc_addSetting;
