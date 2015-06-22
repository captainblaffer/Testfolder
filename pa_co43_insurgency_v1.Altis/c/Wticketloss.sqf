if(isnil "Wtickets") then {Wtickets = 100;};
Wtickets = Wtickets - 1;
publicvariable "Wtickets";

if (Wtickets < 1) then {
_null = [{_null = execVM "c\endMissionE.sqf";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
};