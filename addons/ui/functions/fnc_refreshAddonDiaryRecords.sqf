#include "script_component.hpp"

params [["_showEntries", !GVAR(cleanupDiaryRecords)]];

if (!hasInterface) exitWith { false; };

switch(_showEntries) do {
	case false: {
		if(player diarySubjectExists "CBA_help_docs") then {
			player removeDiarySubject "CBA_help_docs";
			CBA_help_DiaryRecordKeys    = diaryRecordNull;
			CBA_help_DiaryRecordCredits = diaryRecordNull;
			CBA_help_DiaryRecordAddons  = diaryRecordNull;
		};

		if(player diarySubjectExists "radio") then {
			player removeDiarySubject "radio";
		};
	};

	case true: {
		[] call FUNC(addCBADiaryEntries);

		if(!isNil "TFAR_fnc_addDiaryRecord") then {
			call TFAR_fnc_addDiaryRecord;
		};
	};
};
