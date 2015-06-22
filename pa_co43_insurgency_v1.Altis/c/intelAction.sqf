(_this select 0) removeAction (_this select 2);
if (side (_this select 1) != EAST) then {
//_id = floor((getpos (_this select 0))select 0);

["c\cacheMarkers.sqf","BIS_fnc_execVM",false] call BIS_fnc_MP;
//[0, {[] execVM "c\cacheMarkers.sqf"}] call CBA_fnc_globalExecute;
deletevehicle (_this select 0);

["Cache intel found. Marker added to map","hintSilent",true] call BIS_fnc_MP;
} else {
hint "OPFOR can't interact with intel!";
};