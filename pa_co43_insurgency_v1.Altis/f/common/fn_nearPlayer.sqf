// F3 - Near Player Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_ent","_distance","_pos","_cPos","_players"];

_cPos = (_this select 0);
if(_cPos in allMapMarkers)then{
	_pos = getMarkerPos _cPos;
}else{
	if (typeName _cPos == "ARRAY") then{
		_pos = _cPos;
	}else{
		_pos = getPosATL _cPos;
	};
};
_distance = _this select 1;

// ====================================================================================

// Create a list of all players
_players = [];

{
   if (isPlayer _x) then {_players = _players + [_x]};
} forEach playableUnits;

// ====================================================================================

// Check whether a player is in the given distance - return true if yes
if (({_x distance _pos < _distance} count _players) > 0) exitWith {true};
false
