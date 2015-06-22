// _pos is where ai are spawned, _area is where ai are headed _num1 is min num and _num2 is max num
// call with _instance = [town1, attackarea, 1, 3] execVM "retaliate.sqf";
//if (!isserver) exitwith {};

private ["_thecache","_pos,""_tmp","_min","_max","_h","_cachebuilding","_marker","_selectedC"];

//hint format["32 o:%1 p:%2 pl:%3", (_o),(count _poslist), _poslist];sleep 4;
_pos = _this select 0;
//_chamount = _this select 1;
//cachelist = []; //list of units created

if (isnil "allCaches") then {allCaches = [];};
if (isnil "liveCaches") then {liveCaches = 0;};

liveCaches = liveCaches + 1;
_thecache = createVehicle ["Box_FIA_Support_F", getMarkerPos _pos, [], 0, "NONE"];
_thecache allowdamage false;
_thecache addEventHandler ["killed", {_this execVM "c\cacheDeath.sqf"}];
_thecache addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
allCaches pushBack _thecache;

//put guys in buildings randomly
_range = (getmarkersize _pos select 0)*100;
_height = [.3,2];
_bpos = [];
{
  if (!alive _x) exitwith {};
  for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
    _bpos set [count _bpos,_p];
  };
} foreach (nearestObjects [getMarkerPos _pos, ["Building"], _range]);

_tmp = [];
_min = _height select 0;
_max = _height select 1;
{
  _h = _x select 2;
  if (_h >= _min && _h <= _max) then { _tmp set [count _tmp,_x] };
} foreach _bpos;

if (count _tmp > 0) then {
_mpos = (floor random count _tmp);
_thecache setVectorUp [0,0,1];
_thecache setPos [(_tmp select (_mpos)) select 0,(_tmp select (_mpos)) select 1,((_tmp select (_mpos)) select 2)+0.5];
_thecache setVectorUp [0,0,1];
_cachebuilding = nearestObject [getpos _thecache, "Building"];
//debugmarker
_mname = format ["Marker%1",(allCaches find _thecache)];
_marker = createMarker [_mname, (_tmp select (_mpos)) ];
//_marker setMarkerType "mil_Warning";
_marker setMarkerType "empty";
 //foreach cachelist;
};

//debug, marks all spawns
/*_u = 0; for "_u" from 0 to ((count _bpos)-1) do {
_mname2 = format ["bmrk%1%2",_o,_u];
_marker2 = createMarker [_mname2, (_bpos select (_u)) ];
_mname2 setMarkerType "Dot";
};*/

//spawn AI
//_nul = [_posarray select (_poslist select _o), "aicache_", 6, 6, 0.7, _range] execVM "scripts\spawnAI_building.sqf";
[_cachebuilding,_marker,_thecache]spawn {
private ["_cachebuilding"];
_cachebuilding = _this select 0;
_thecache = _this select 2;
	while {alive _thecache} do {
		sleep 10;
		if (!alive _cachebuilding) then {
			_thecache setdamage 1;
		};
	};
	_this select 1 setMarkerType "mil_Flag";
	_this select 1 setMarkerColor "ColorBLUFOR";
};

sleep 2;
_thecache allowdamage true;
//thecache setdamage 1;