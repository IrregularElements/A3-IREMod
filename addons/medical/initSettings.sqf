[
	QGVAR(treatmentHintsEnabled),
	"CHECKBOX",
	[LSTRING(settingAssistHintsEnabled_DisplayName), LSTRING(settingAssistHintsEnabled_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	false,
	true,
	{
		if(GVAR(treatmentHintsEnabled)) then {
			[] call FUNC(displayTreatmentHints);
		}
		else {
			[] call FUNC(purgeTreatmentHints);
		};
	}
] call CBA_fnc_addSetting;

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

[
	QGVAR(epiBonusEnabled),
	"CHECKBOX",
	[LSTRING(settingEpiBonusEnabled_DisplayName), LSTRING(settingEpiBonusEnabled_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	false,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(epiBonusProbability),
	"SLIDER",
	[LSTRING(settingEpiBonusProbability_DisplayName), LSTRING(settingEpiBonusProbability_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	[0, 1, 1, 2, true],
	true
] call CBA_fnc_addSetting;

[
	QGVAR(epiBonusDuration),
	"TIME",
	LSTRING(settingEpiBonusDuration_DisplayName),
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	[0, 120, 30],
	true
] call CBA_fnc_addSetting;

[
	QGVAR(epiBonusCooldown),
	"TIME",
	[LSTRING(settingEpiBonusCooldown_DisplayName), LSTRING(settingEpiBonusCooldown_Description)],
	[ELSTRING(main,settingsCategory), LSTRING(settingsSubcategory)],
	[0, 600, 120],
	true
] call CBA_fnc_addSetting;
