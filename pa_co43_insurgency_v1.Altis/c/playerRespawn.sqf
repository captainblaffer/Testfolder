private ["_newPlayer"];

waitUntil {sleep 0.2; alive player};

_newPlayer = _this select 0;

[_newPlayer getvariable "f_var_assignGear",_newPlayer] call f_fnc_assignGear; 

_newPlayer addRating 100000;

[] execVM "f\radios\radio_init.sqf";

[] execVM "f\medical\medical_init.sqf";

lastSquadTP = time;