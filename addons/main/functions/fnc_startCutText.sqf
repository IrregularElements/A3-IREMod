#include "script_component.hpp"

/* ----------------------------------------------------------------------------
Function: ire_mod_main_fnc_startCutText
Description:
    Where do I start with this?..

	This function and its counterpart stopCutText is sort of like
	Arma's built-in cutText/titleText, except it tries to behave a little bit
	differently.  Key differences are:
	- No explicit message duration:
	    Using cutText, If one wanted to specify message duration, one would use
		the _speed parameter, which is actually the duration of fade-in.  Message
		duration in this case would equal 10 times _speed, which means if one wanted
		to use cutText to display a message lasting e.g. 60 seconds, the fade in
		would take 6 seconds.
		startCutText, instead, just starts displaying the text indefinitely by
		using a refresher PFH.
	- No fade in
		The refresher PFH thing (see above) would've worked with cutText except
		for the part where cutText sort of blinks when redrawn, because it's erased
		before fade-in.  One could probably solve this by using two different layers,
		which this function could be rewritten as.

	This is implemented as an ugly hack.  The only no-fade-in title text type is
	"PLAIN NOFADE".  It is displayed in the center of the screen as opposed to
	bottom; therefore, to make it display at the bottom, we add empty lines before
	the actual message to force the vertical center alignment to budge.  *sigh*
	On my screen (3840x2160) one should add approximately 13 lines plus the number
	of lines in _text (i.e. 6 and a half lines off center) to make "PLAIN NOFADE"
	behave like "PLAIN DOWN".
	This function should be rewritten, and, as such, it probably won't.

Parameters:
	See cutText.  The _type parameter is absent; cutText is invoked with "PLAIN NOFADE",
	and the result looks, give or take, like "PLAIN DOWN".

    _layer
    _text
    _showInMap
    _isStructuredText
---------------------------------------------------------------------------- */

#define VERTICAL_OFFSET 14

params ["_layer", "_text", ["_showInMap", true], ["_isStructuredText", false]];

[_layer, 0] call FUNC(stopCutText);

private _handle = [{
	params ["_args", "_handle"];
	_args params ["_layer", "_text", "_speed", "_showInMap", "_isStructuredText"];
	private _lines = count (_text splitString "\n") + 1;
	for "_i" from 1 to (VERTICAL_OFFSET + _lines) do {
		_text = "\n" + _text;
	};
	_layer cutText [_text, "PLAIN NOFADE", 0, _showInMap, _isStructuredText];
},
5,
_this] call CBA_fnc_addPerFrameHandler;

private _refreshers = uiNamespace getVariable [VAR_CUTTEXTREFRESHHANDLES, createHashMap];
_refreshers set [_layer, _handle];
uiNamespace setVariable [VAR_CUTTEXTREFRESHHANDLES, _refreshers];
