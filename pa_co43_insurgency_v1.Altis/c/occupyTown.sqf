//[_marker,_buildingAI,_staticAI,_staticAAAI,_patrolAI,_patrolTownAI,_suvehAI,_tankAI] execVM "c\occupyTown.sqf";
//[_objTown,30,2,0,4,4,2,0] execVM "c\occupyTown.sqf";
private ["_marker","_markerpos","_buildingAI","_staticAI","_radius","_staticAAAI","_patrolAI","_suvehAI","_tankAI","_patrolTownAI","_blaOT","_buildingAImax","_radiusP"];

_marker = _this select 0;
_markerpos = getmarkerpos _marker;
_buildingAI = _this select 1;
_buildingAImax	= _this select 2;
_radius = _this select 3;
_radius = if (isnil ("_radius")) then { ((getmarkersize _marker) select 0) * 100; }else{_radius;};
_radiusP = 300;
_staticAI 	= _this select 4;
_staticAAAI	= _this select 5;
_patrolAI 	= _this select 6;
_patrolTownAI = _this select 7;
_suvehAI 	= _this select 8;
_tankAI		= _this select 9;

while {!([_markerpos, 1600] call f_fnc_nearBPlayer)} do {
sleep 10; 
if (!(_marker in activeTowns)) exitwith {};
};
while {_markerpos distance getmarkerpos "respawn_west" < _radius + _radiusP + 300} do {
_radiusP = _radiusP - 100; 
};
if (_radiusP < 100) then {_radiusP = 100;};

if (!(_marker in activeTowns)) exitwith {};
//[_markerpos, _radius, _staticAAAI]spawn{
//[_this select 0, _this select 1, 3, _this select 2, "O_Soldier_F", east] call gdsn_fnc_spawnRooftopStaticWeapons;
//};
[_markerpos, _radius, 3, _staticAAAI, "O_Soldier_F", east] call gdsn_fnc_spawnRooftopStaticWeapons;
sleep 5;
if (!(_marker in activeTowns)) exitwith {};
//[_markerpos, _radius, _staticAI]spawn{
//[_this select 0, _this select 1, 1, _this select 2, "O_Soldier_F", east] call gdsn_fnc_spawnRooftopStaticWeapons;
//};
[_markerpos, _radius, 1, _staticAI, "O_Soldier_F", east] call gdsn_fnc_spawnRooftopStaticWeapons;
sleep 5;
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _patrolAI do {
_blaOT = [_markerpos,_radius+_radiusP,[4,3],[0.6,0.6,0.7,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskPatrol.sqf";
waitUntil { scriptDone _blaOT };
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _patrolTownAI do {
_blaOT = [_markerpos,_radius,[3,2],[0.6,0.6,0.7,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskPatrolTown.sqf";
waitUntil { scriptDone _blaOT };
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _suvehAI do {
_blaOT = [_markerpos,_radius+80,nil,2,[0.3,0.1,0.5,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskPatrolV.sqf";
waitUntil { scriptDone _blaOT };
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

for "_x" from 1 to _tankAI do {
_blaOT = [_markerpos,_radius+_radiusP,nil,1,[0.3,0.1,0.5,1,0.9,0.7,1,1,1,0.5],nil,nil,nil] execVM "LV\taskPatrolV.sqf";
waitUntil { scriptDone _blaOT };
if (!(_marker in activeTowns)) exitwith {};
};
if (!(_marker in activeTowns)) exitwith {};

_blaOT = [_markerpos, _buildingAI, _buildingAImax, 0.3, _radius] execVM "LV\spawnAI_buildingAuto.sqf";