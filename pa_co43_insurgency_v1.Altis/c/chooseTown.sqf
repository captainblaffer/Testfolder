private ["_curTown,""_nearbyTowns","_nearbyCompounds","_maxAIgroups","_maxDist","_objTown1","_objTown2""_extraTowns","_extraTownNew","_mname","_marker","_startTime","_townsPlusCompounds","_blaCT","_chanse"];
_nearbyTowns = [];
_nearbyCompounds = [];
_maxAIgroups = 45;
_maxDist = 2000;

//debug
//[]spawn{
	//while {true} do {
	//hintsilent format ["%1", count allgroups];
	//sleep 0.1;
	//};
//};

if ((count compoundsArray) < 6 || (count townsArray)<1) exitwith {
_null = [{_null = execVM "c\endMissionW.sqf";},"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
};

//select towns
_objTown1 = townsArray call BIS_fnc_selectRandom;
//_nearbyTowns=_nearbyTowns+[_objTown1];
townsArray = townsArray - [_objTown1];
activeTowns = activeTowns + [_objTown1];
_mname = format ["mt_%1",_objTown1];
_marker = createMarker [_mname, (getmarkerpos _objTown1) ];
//_mname setMarkerText "T";
_mname setMarkerShape "ICON";
_mname setMarkerType "empty";
_mname setMarkerColor "ColorOPFOR";
townMarkers = townMarkers + [_mname];
_chanse = 0.6;
_objTown2 = _objTown1;/*
while {count _nearbyTowns<2} do {
{
	if (getmarkerpos _x distance getmarkerpos _objTown1 < _maxDist && random(10)>_chanse) exitwith {
		_objTown2 = _x;
		_nearbyTowns=_nearbyTowns+[_objTown2];
		townsArray = townsArray - [_objTown2];
		activeTowns = activeTowns + [_objTown2];
		_mname = format ["mt_%1",_x];
		_marker = createMarker [_mname, (getmarkerpos _objTown2) ];
		//_mname setMarkerText "T";
		_mname setMarkerShape "ICON";
		_mname setMarkerType "empty";
		_mname setMarkerColor "ColorOPFOR";
		townMarkers = townMarkers + [_mname];
	};
	_chanse = _chanse - 0.1;
	_maxDist = _maxDist + 250;
} foreach townsArray;
};
_maxDist = 2000;

while {((count _nearbyTowns)*2+(count _nearbyCompounds))<7} do {
{
	if (getmarkerpos _x distance getmarkerpos _objTown1 < _maxDist && random(10)>5) exitwith {
		_nearbyTowns = _nearbyTowns + [_x];
		townsArray = townsArray - [_x];
		activeTowns = activeTowns + [_x];
		//debug
		_mname = format ["mt_%1",_x];
		_marker = createMarker [_mname, (getmarkerpos _x) ];
		//_mname setMarkerText "T";
		_mname setMarkerShape "ICON";
		_mname setMarkerType "empty";
		_mname setMarkerColor "ColorOPFOR";
		//_mname setMarkerSize [0.8,0.8];
		townMarkers = townMarkers + [_mname];
	};
} foreach townsArray;

{
	if (getmarkerpos _x distance getmarkerpos _objTown1 < _maxDist && random(10)>5) exitWith {
		_nearbyCompounds = _nearbyCompounds + [_x];
		compoundsArray = compoundsArray - [_x];
		activeTowns = activeTowns + [_x];
		//debug 
		_mname = format ["mc_%1",_x];
		_marker = createMarker [_mname, (getmarkerpos _x) ];
		//_mname setMarkerText "T";
		_mname setMarkerShape "ICON";
		_mname setMarkerType "o_inf";
		_mname setMarkerColor "ColorOPFOR";
		_mname setMarkerSize [0.6,0.6];
		townMarkers = townMarkers + [_mname];
	};
} foreach compoundsArray;

_maxDist = _maxDist+500;
};*/
{if ("empty" == getMarkerType _x) then {_x setmarkerType "o_installation";};}foreach townMarkers;

_extraTowns = [];
_townsPlusCompounds = townsArray + compoundsArray;
if (count _townsPlusCompounds > 4) then {
_maxDist = 2250;
for "_i" from 1 to 5 do {
//while (count _extraTowns < 8) do {
	_extraTownNew = (_townsPlusCompounds call BIS_fnc_selectRandom);
	
	_tooClose = true;
	_startTime = time;
	while {_tooClose} do {
		{
			_tooClose = false;
			if (((getmarkerpos _x) distance (getmarkerpos _extraTownNew) < 600)||((getmarkerpos _extraTownNew) distance (getmarkerpos _objTown1) > _maxDist) ) then { 
				_tooClose = true;
				_extraTownNew = (_townsPlusCompounds call BIS_fnc_selectRandom);
			};
		}forEach (_extraTowns + [_objTown1] );
		if (time > _startTime + 5) then {_maxDist = _maxDist + 1500;};
	};
	_maxDist = _maxDist + 500;
	_extraTowns pushBack _extraTownNew;
	activeTowns = activeTowns + [_extraTownNew];
	_townsPlusCompounds = _townsPlusCompounds - [_extraTownNew];
	_mname = format ["me_%1",count _extraTowns];
	_marker = createMarker [_mname, (getmarkerpos _extraTownNew) ];
	//_mname setMarkerText "T";
	_mname setMarkerShape "ICON";
	_mname setMarkerType "o_inf";
	_mname setMarkerColor "ColorOPFOR";
	_mname setMarkerSize [0.6,0.6];
	townMarkers = townMarkers + [_mname];
};};
_objTown2 = (_extraTowns call BIS_fnc_selectRandom);
_extraTowns = _extraTowns - [_objTown2];
townsArray = townsArray - [_objTown2];
//hint format ["%1,%2", _nearbyTowns, count _nearbyCompounds]; sleep 3;

if (isServer) then {
	_blaCT = [_objTown1] execVM "c\spawnCACHEA_building.sqf";
	waitUntil { scriptDone _blaCT };
	_blaCT = [_objTown2] execVM "c\spawnCACHEA_building.sqf";
	waitUntil { scriptDone _blaCT };
} else {
	[[[_objTown1],"c\spawnCACHEA_building.sqf"],"BIS_fnc_execVM",false] call BIS_fnc_MP;
	sleep 5;
	[[[_objTown2],"c\spawnCACHEA_building.sqf"],"BIS_fnc_execVM",false] call BIS_fnc_MP;
};

//occupyAO
_blaCT = [activeTowns,3,4,1,3] execVM "c\occupyAO.sqf";
//waitUntil { scriptDone _blaCT };
_blaCT = [_objTown1,0.07,55,nil,0,0,3,5,1,1] execVM "c\occupyTown.sqf";
//waitUntil { scriptDone _blaCT };
_blaCT = [_objTown2,0.06,40,nil,0,0,2,4,0,1] execVM "c\occupyTown.sqf";
//waitUntil { scriptDone _blaCT };

//_nearbyTowns=_nearbyTowns - [_objTown1];
//_nearbyTowns=_nearbyTowns - [_objTown2];

_maxAIgroups = _maxAIgroups - 28;
_maxAIgroups = _maxAIgroups - (count activeTowns);//(count _nearbyTowns + count _nearbyCompounds + count _extraTowns);
//hint format ["maxai 1 %1",_maxAIgroups];

//hint "AI spawn - 1";
//_splitAI = _maxAIgroups / ((count _nearbyTowns)*3 + (count _nearbyCompounds)*2 + count _extraTowns*1.5);

//spawn _nearbyTowns AI
/*_splitAI = _splitAI*3;

{
	//_buildingCount=0;
	//_waypointCount=round (_splitAI*0.05);
	//{
	//	_buildingCount = _buildingCount + 1;
	//} foreach (nearestObjects [getmarkerpos _x, ["Building"], (getmarkersize _x select 0)*100]);
	//if (_splitAI*0.5>_buildingCount) then {
	//not enough buildings
	//rule: _splitAI = _buildingCount*2 + _waypointCount*5*2 
	//	hint format ["not enough buildings\n%1\n%2 - %3\n%4",_splitAI,_buildingCount,_waypointCount,_x];
	//	_waypointCount=_waypointCount+round ((_splitAI*0.5 - _buildingCount)*0.2); //compound: / 10
	//	sleep 1.5;
	//} else {
	//enough buildings
	//	hint format ["enough buildings\n%1\n%2 - %3\n%4",_splitAI,_buildingCount,_waypointCount,_x];
	//	_buildingCount = round(_splitAI*0.5);
	//	sleep 1.5;
	//};
	//67 11
	_availableWPs = round _splitAI - 1;
	_staticAI = 0;
	_AAAI = 0;
	_patrolAI = 0;
	_townAI = 0;
	_vehAI = 0;
	//while {_availableWPs > 7} do {
	//	_staticAI = _staticAI + 1;
	//	_patrolAI = _patrolAI + 3;
	//	_townAI = _townAI + 3;
	//	_vehAI = _vehAI + 1;
	//	_availableWPs = _availableWPs - 8;
	//};
	while {_availableWPs > 0} do { //2 1 8 1
		if (random(14)>12 && (_patrolAI<(round _splitAI)*0.286)) then {_patrolAI=_patrolAI + 1;	_availableWPs=_availableWPs - 1; };
		if (_availableWPs< 1) exitwith{};
		if (random(14)>6 && (_townAI<(ceil _splitAI)*0.8)) then {_townAI=_townAI + 1;		_availableWPs=_availableWPs - 1; };
		if (_availableWPs< 1) exitwith{};
		//if (random(14)>12 && (_staticAI<(ceil _splitAI)*0.286)) then {_staticAI=_staticAI + 1;	_availableWPs=_availableWPs - 1; };
		//if (_availableWPs< 1) exitwith{};
		//if (random(14)>13 && (_AAAI<(ceil _splitAI)*0.143)) then {_AAAI=_AAAI + 1;	_availableWPs=_availableWPs - 1; };
		//if (_availableWPs< 1) exitwith{};
		if (random(14)>13 && (_vehAI<(ceil _splitAI)*0.143)) then {_vehAI=_vehAI + 1; _availableWPs=_availableWPs - 1; };
	};
	//hint format ["%1\n%2\n%3\n%4\n%5\n%6\n%7",_splitAI,_x,_staticAI,_AAAI,_patrolAI,_townAI,_vehAI]; sleep 1;
	_blaCT = [_x,0.06,40,nil,_staticAI,_AAAI,_patrolAI,_townAI,1,_vehAI] execVM "c\occupyTown.sqf";
	//waitUntil { scriptDone _blaCT };
} foreach _nearbyTowns;
//hint "AI spawn - 2";

//spawn _nearbyCompounds AI
_splitAI = _splitAI * (2 / 3);
{
	_availableWPs = round _splitAI - 1;
	_staticAI = 0;
	_AAAI = 0;
	_patrolAI = 0;
	_townAI = 0;
	_vehAI = 0;
	while {_availableWPs > 0} do { //2 1 8 1
		if (random(10)>7.5 && (_patrolAI<(round _splitAI)*0.5)) then {_patrolAI=_patrolAI + 1;	_availableWPs=_availableWPs - 1; };
		if (_availableWPs< 1) exitwith{};
		if (random(14)>6 && (_townAI<(ceil _splitAI)*2)) then {_townAI=_townAI + 1;		_availableWPs=_availableWPs - 1; };
		if (_availableWPs< 1) exitwith{};
		//if (random(14)>12 && (_staticAI<(ceil _splitAI)*0.286)) then {_staticAI=_staticAI + 1;	_availableWPs=_availableWPs - 1; };
		//if (_availableWPs< 1) exitwith{};
		//if (random(14)>13 && (_AAAI<(ceil _splitAI)*0.143)) then {_AAAI=_AAAI + 1;	_availableWPs=_availableWPs - 1; };
		//if (_availableWPs< 1) exitwith{};
		if (random(10)>9.5 && (_vehAI<(ceil _splitAI)*0.2)) then {_vehAI=_vehAI + 1; _availableWPs=_availableWPs - 1; };
	};
	//hint format ["%1\n%2\n%3\n%4\n%5\n%6",_splitAI,_x,_staticAI,_patrolAI,_townAI,_vehAI]; sleep 3;
	_blaCT = [_x,0.06,20,nil,_staticAI,_AAAI,_patrolAI,_townAI,0,_vehAI] execVM "c\occupyTown.sqf";
	//waitUntil { scriptDone _blaCT };
} foreach _nearbyCompounds;*/

//_splitAI = floor (_splitAI * (1.5 / 2) * count _extraTowns);
_splitAI = _maxAIgroups / (count _extraTowns);
_availableWPs = floor (_maxAIgroups - count _extraTowns); 
_ranOccupyArray = [];
{_ranOccupyArray pushBack 1;}forEach _extraTowns;
_maxWPs = round (_splitAI*2);//(_availableWPs / (count _extraTowns))*2;
while{_availableWPs>0} do {
	for "_i" from 0 to (count _ranOccupyArray - 1) do{
		if (_availableWPs>0) then {
		if (random(_maxWPs)>(_ranOccupyArray select _i)) then {
			_ranOccupyArray set [_i,((_ranOccupyArray select _i) + 1)];
			_availableWPs = _availableWPs - 1;
		};
		};
	};
};

{
	//_availableWPs = round _splitAI - 1;
	//hint format ["%1",_availableWPs];
	_curTown = _extraTowns find _x;
	_maxWPs = ceil(_ranOccupyArray select _curTown);
	_staticAI = 0;
	_AAAI = 0;
	_patrolAI = 0;
	_townAI = 0;
	_vehAI = 0;
	//hint format ["%1\n%2",_x,(_ranOccupyArray select _curTown)]; sleep 1;
	while {(_ranOccupyArray select _curTown) > 0} do { //2 1 8 1
		if (random(10)>8.5 && (_patrolAI<_maxWPs*0.5)) then {
			_patrolAI=_patrolAI + 1; 
			_ranOccupyArray set [_curTown,((_ranOccupyArray select _curTown) - 1)];
		};
		if ((_ranOccupyArray select _curTown)< 1) exitwith{};
		if (random(10)>4 && (_townAI<_maxWPs*1)) then {
			_townAI=_townAI + 1; 
			_ranOccupyArray set [_curTown,((_ranOccupyArray select _curTown) - 1)]; 
		};
		if ((_ranOccupyArray select _curTown)< 1) exitwith{};
		//if (random(10)>9 && (_staticAI<_maxWPs*0.35)) then {
		//	_staticAI=_staticAI + 1; 
		//	_ranOccupyArray set [_curTown,((_ranOccupyArray select _curTown) - 1)];};
		//if ((_ranOccupyArray select _curTown)< 1) exitwith{};
		//if (random(10)>9 && (_AAAI<ceil(_ranOccupyArray select _curTown)*1)) then {
		//	_AAAI=_AAAI + 1; 
		//	_availableWPs=_availableWPs - 1; 
		//};
		//if (_availableWPs< 1) exitwith{};
		if (random(10)>9.5 && (_vehAI<_maxWPs*0.25)) then {
			_vehAI=_vehAI + 1; 
			_ranOccupyArray set [_curTown,((_ranOccupyArray select _curTown) - 1)];
		};
	};
	//hint format ["%1\n%2 %3 %4 %5",_x,_staticAI,_patrolAI,_townAI,_vehAI]; sleep 1;
	_blaCT = [_x,0.06,15,nil,_staticAI,_AAAI,_patrolAI,_townAI,0,_vehAI] execVM "c\occupyTown.sqf";
	//waitUntil { scriptDone _blaCT };
}forEach _extraTowns;

//hint "all AI spawned!";