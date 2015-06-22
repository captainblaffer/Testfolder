// _cPos is where ai are spawned,
// call with nul = [this, 0.3, 2, 0.3, 500] execVM "LV\spawnAI_building.sqf";
//if (!isserver) exitwith {};

private ["_maxdudes","_bglass","_thenumwip","_thenum","_bcurtemp","_bcur","_tmpwip","_bposwip","_cPos","_pos","_num1","_num2","_skill","_unitlist","_geararray","_tmp","_min","_max","_h","_grp","_ranDir","_xPos"];

_cPos = (_this select 0);
if(_cPos in allMapMarkers)then{
	_pos = getMarkerPos _cPos;
}else{
	if (typeName _cPos == "ARRAY") then{
		_pos = _cPos;
	}else{
		_pos = getPos _cPos;
	};
};

_num1 = (_this select 1);
_num2 = (_this select 2);
_skill = (_this select 3);
_unitlist = []; //list of units created
//_geararray = ["gren","car","rat","ar","gren","car","matg","mmgg","r","m"];
_MenArray = ["O_Soldier_A_F","O_soldier_AR_F","O_medic_F","O_Soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_Soldier_F","O_soldier_LAT_F","O_Soldier_lite_F","O_Soldier_TL_F","O_support_MG_F"];


//find building positions
_range = (_this select 4); 
_height = [.3,33];
_bpos = [];
{
  _bposwip = [];
  for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
    _bposwip set [count _bposwip,_p];
  };
  _bpos pushBack _bposwip;
} foreach (nearestObjects [_pos, ["Building"], _range]);

_tmp = [];
_min = _height select 0;
_max = _height select 1;
{
_tmpwip = [];
{
  _h = _x select 2;
  if (_h >= _min && _h <= _max) then { _tmpwip set [count _tmpwip,_x] };
} foreach _x;
if (count _tmpwip > 0) then {
_tmp pushBack _tmpwip;
};
} foreach _bpos;

//spawn dudes
if (count _tmp > 0) then {
_grp=creategroup east;

_thenumwip = 0;
{
_thenumwip = _thenumwip + (count _x);
}foreach _tmp;

_thenum = ceil(_thenumwip*_num1*(random(0.2)+ 1));
//num1 * tan(atan(sqrt(60 - a1^2) / a1) + pi / 4) + 10 * tan(atan(sqrt(60 - a1^2) / a1) + pi / 4) - 10;
if (_thenum < 4) then {_thenum = 4};
if (_thenum > _thenumwip) then {_thenum = _thenumwip};
if (_thenum > _num2) then {_thenum = _num2;};


_x = 0 ; for "_x" from 1 to (_thenum) do {
	_unitType = _menArray select (floor(random(count _menArray)));
	_unitType CreateUnit [getmarkerpos "nogo1",_grp,"commandstop this",_skill,"private"]; //_pos
	sleep .2; 
};

_grp setVariable ["f_cacheExcl", true];
[_grp]spawn { 
	sleep 30; 
	_this select 0 setVariable ["f_cacheExcl", false];
};

{
_x allowDamage false;
} foreach units _grp;

//put dudes in buildings
_bcur = _tmp call BIS_fnc_selectRandom; 
_bdudes = 0;
_bcurtemp = _bcur;

_maxdudes = count _bcur * (_thenum / _thenumwip + random(0.2)+ 0.2);
if (_maxdudes > count _bcur) then {_maxdudes = count _bcur;};
{
while {_maxdudes <= _bdudes} do {
	if (count _tmp > 1) then {
		_tmp set [_tmp find _bcur,-1];
		_tmp = _tmp - [-1];
		_bcur = _tmp call BIS_fnc_selectRandom;
		_maxdudes = count _bcur * (_thenum / _thenumwip + random(0.2)+ 0.2);
		if (_maxdudes > count _bcur) then {_maxdudes = count _bcur;};
		
		if (count _bcur > 0) then {
			_bglass = nearestObject [(_bcur select 0), "Building"]; 
			[[[_bglass],"c\buildingGlass.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
			//for "_i" from 1 to 20 do {
			//if (random(1)<0.75) then {_bglass sethit [(format ["glass_%1",_i]),random(1)+0.7];};
			//};
		};
	} else { 
		_bcur = [_pos];
		_maxdudes = 9999;
	};
	_bdudes = 0;
	_bcurtemp = _bcur;
};
_bdudes = _bdudes + 1;
_ranDir =  random (360);
_x setformdir _ranDir;
_x setdir _ranDir;
_xPos = _bcurtemp select(floor (random (count _bcurtemp)));
if (_bcur find _pos<0) then {
	_bcurtemp set [_bcurtemp find _xPos,-2];
	_bcurtemp = _bcurtemp - [-2];
};
_x setpos _xPos;
_x allowfleeing 0;
_x setUnitPos "UP";
_x forceSpeed 0;
commandstop _x;
//debugmarkers
//_mname = format ["btestmrk_%1",_x];
//createMarker [_mname,(position _x)];
//_mname setMarkerShape "ICON";
//_mname setMarkerType "mil_dot";

_x addEventHandler ["killed", {_this select 0 execVM "c\intelSpawn.sqf";}];

//_gear = _geararray call BIS_fnc_selectRandom; 
//[_gear,_x] call f_fnc_assignGear;
_x execVM "f\assignGear\f_assignGear_AI.sqf";
_x allowDamage true;
sleep .1; 
} foreach units _grp;
};