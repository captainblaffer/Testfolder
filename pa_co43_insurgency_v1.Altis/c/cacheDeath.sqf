_cachepos = getposatl (_this select 0);
[_cachepos]spawn {
_cachepos = _this select 0;
"Bo_GBU12_lgb" createVehicle _cachepos;
sleep 0.8;
"Bo_GBU12_lgb" createVehicle [(_cachepos select 0) + random(5) - 10,(_cachepos select 1) + random(5) - 10,(_cachepos select 2)];
sleep 0.4;
"Bo_GBU12_lgb" createVehicle [(_cachepos select 0) + random(5) - 10,(_cachepos select 1) + random(5) - 10,(_cachepos select 2)];
sleep 2;
"Bo_GBU12_lgb" createVehicle [(_cachepos select 0) + random(5) - 10,(_cachepos select 1) + random(5) - 10,(_cachepos select 2)];
};

liveCaches = liveCaches - 1;
_selectedC = allCaches find (_this select 0);
if (!(isnil "chMarkers")) then {
{
	deletemarker _x;
}foreach (chMarkers select _selectedC);
};
//chMarkers = [];

if (liveCaches > 0) then {
["Cache destroyed!\n1 cache remaining","hintSilent",true] call BIS_fnc_MP;
} else {
["Cache destroyed!\n2 new caches in 4 minutes.\nRespawn tickets reset","hintSilent",true] call BIS_fnc_MP;
Wtickets = 100; publicvariable "Wtickets";

uisleep 210;
{
	deletemarker _x;
}foreach townMarkers;
townMarkers = [];

{
	_x setmarkertype "Empty";
} foreach activeTowns;
activeTowns = [];


{
if (count units _x < 1) then {deletegroup _x;} else {
if (side leader _x == east) then {
[_x]spawn{
	_groupD = (_this select 0);
	
	{
		if (vehicle _x != _x) then {
			(vehicle _x) hideObjectGlobal false;
			deletevehicle vehicle _x;
		};
			if (!(isplayer _x)) then {
			_x enableSimulationGlobal true;
			_x hideObjectGlobal false;
			deletevehicle _x;
			};
		sleep 0.1;
	} foreach units _groupD;
	
	deletegroup _groupD;
};
};
};
} foreach allgroups;
//hint "deleted all groups";
uisleep 30;
[["c\headlessCheck.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
};