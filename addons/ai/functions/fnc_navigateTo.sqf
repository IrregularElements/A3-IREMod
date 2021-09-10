#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: ire_mod_ai_fnc_navigateTo
Description:
	Attempts to navigate _unit as close to _destination as possible.  This
	function is blocking.

Parameters:
    _unit         - the infantry (vehicles not supported a.t.m.) unit to move
    _destination  - the unit or position to move to
    _acceptRadius - the radius from _destination, in meters, within which it's
	                okay to stop (default: 2)
Returns:
    Nothing
---------------------------------------------------------------------------- */

params ["_unit", "_destination", ["_acceptRadius", 2], ["_timeout", 15]];

private _pos = _destination call CBA_fnc_getPos;

private _startTime = CBA_missionTime;

private _lastMoveOrder = CBA_missionTime;
_unit doMove _pos;

waitUntil {
	_pos = _destination call CBA_fnc_getPos;

	if(_lastMoveOrder + 1 <= CBA_missionTime) then {
		private _newX = ((_pos select 0) + (getPos _unit select 0)) / 2;
		private _newY = ((_pos select 1) + (getPos _unit select 1)) / 2;
		_unit doMove [_newX, _newY];
		_lastMoveOrder = CBA_missionTime;
	};

	private _distance = _unit distance _pos;

	_distance <= _acceptRadius || _startTime + _timeout <= CBA_missionTime;
};
