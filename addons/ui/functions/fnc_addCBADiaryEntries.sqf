#include "script_component.hpp"

params [];

{
	private _unit = ACE_player;
	_unit createDiarySubject ["CBA_help_docs", "CBA"];
	private _keys = CBA_help_keys;
	private _addons = allVariables CBA_keybinding_addons;
	_addons sort true;

	{
		(CBA_keybinding_addons getVariable _x) params ["_addon", "_addonActions"];
		private _name = _addon;

		if (isLocalized _name) then {
			_name = localize _name;
		};

		_keys = _keys + format ["%1:<br/>", _name];

		{
			(CBA_keybinding_actions getVariable (_addon + "$" + _x)) params ["_displayName", "", "_keybinds"];

			if (isLocalized _displayName) then {
				_displayName = localize _displayName;
			};

			private _keyName = (_keybinds select {_x select 0 > DIK_ESCAPE} apply {_x call CBA_fnc_localizeKey}) joinString "    ";

			_keys = _keys + format ["    %1: <font color='#c48214'>%2</font><br/>", _displayName, _keyName];
		} forEach _addonActions;

		_keys = _keys + "<br/>";

	} forEach _addons;

	_keys = _keys select [0, count _keys - 10];

	CBA_help_DiaryRecordKeys = _unit createDiaryRecord ["CBA_help_docs", [localize "STR_CBA_Help_Keys", format ["<font size=20>%1</font><br/>%2", localize "STR_CBA_Help_Keys", _keys]], taskNull, "", false];
	CBA_help_DiaryRecordCredits = _unit createDiaryRecord ["CBA_help_docs", [localize "STR_CBA_Credits", format ["<font size=20>%1</font><br/>%2", localize "STR_CBA_Credits", call (uiNamespace getVariable "CBA_help_credits")]], taskNull, "", false];
	CBA_help_DiaryRecordAddons = _unit createDiaryRecord ["CBA_help_docs", [localize "STR_CBA_Addons", format ["<font size=20>%1</font><br/>%2", localize "STR_CBA_Addons", call (uiNamespace getVariable "CBA_help_mods")]], taskNull, "", false];
} call CBA_fnc_execNextFrame;
