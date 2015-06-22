//[_marker,_buildingAI,_staticAI,_staticAAAI,_patrolAI,_patrolTownAI,_vehicleAI,_tankAI] execVM "c\occupyTown.sqf";
//[_objTown,30,2,0,4,4,2,0] execVM "c\occupyTown.sqf";
private ["_marker","_markerpos","_radius","_wpTowns","_patrolAI","_vehicleAI","_tankAI","_truckAI","_blaOT"];

_marker 	= (_this select 0)select 0;
_markerpos 	= getmarkerpos _marker;
_radius 	= 1200;
_wpTowns	= _this select 0;
_wpTowns = _wpTowns + [_marker];
_patrolAI 	= _this select 1;
_vehicleAI 	= _this select 2;
_tankAI		= _this select 3;
_truckAI	= _this select 4;

/*waituntil {sleep 60; 
{
   if 
   ((_x distance _markerpos < 2000)&&
   (alive _x)&&
   (isplayer _x)
   ) exitwith {true};
} forEach playableunits;};*/


while {_markerpos distance getmarkerpos "respawn_west" < _radius+300 } do {
_radius = _radius - 100; 
};
if (_radius < 100) then {_radius = 100;};

for "_x" from 1 to _patrolAI do {
_blaOT = [_markerpos,_radius,[4,3],[0.6,0.6,0.7,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskPatrol.sqf";
waitUntil { scriptDone _blaOT };
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _vehicleAI do {
_blaOT = [_wpTowns,150,nil,0,[0.3,0.1,0.5,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskSetPatrolV.sqf";
waitUntil { scriptDone _blaOT };
sleep 12;
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _tankAI do {
_blaOT = [_wpTowns,150,nil,1,[0.3,0.1,0.5,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskSetPatrolV.sqf";
waitUntil { scriptDone _blaOT };
sleep 12;
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _truckAI do {
_blaOT = [_wpTowns,150,nil,3,[0.6,0.6,0.7,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskSetPatrolV.sqf";
waitUntil { scriptDone _blaOT };
sleep 12;
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};