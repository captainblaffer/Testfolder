private ["_curPlayer","_startPlayer"];
_curPlayer = player;
_startPlayer = player;
if (!isnil "OPFORguy1") then {
if (_curPlayer  == OPFORguy1) then {
_startPlayer = OPFORguy1;
};};
if (!isnil "OPFORguy2") then {
if (_curPlayer  == OPFORguy2) then {
_startPlayer = OPFORguy2;
};};
if (!isnil "OPFORguy3") then {
if (_curPlayer  == OPFORguy3) then {
_startPlayer = OPFORguy3;
};};
/*
[] spawn {
	private ["_Oguy1curAI","_mkr"];
	waituntil {sleep 30; !isnil "OPFORguy1"};
	waituntil {sleep 5; !isnull (OPFORguy1 getvariable "curAI")};
	OPFORguy1 execVM "c\opforMarkers.sqf";
	/*_Oguy1curAI = (OPFORguy1 getvariable "curAI");
	_mkr = createMarkerLocal ["mkr_Oguy1curAI",[(getPos _Oguy1curAI select 0),(getPos _Oguy1curAI select 1)]];
	"mkr_Oguy1curAI" setMarkerShapeLocal "ICON";
	"mkr_Oguy1curAI" setMarkerTypeLocal "o_inf";
	"mkr_Oguy1curAI" setMarkerColorLocal "ColorGreen";
	//"mkr_Oguy1curAI" setMarkerSizeLocal [0.5, 0.5];
	"mkr_Oguy1curAI" setMarkerTextLocal str _Oguy1curAI;
	while {!isnil "OPFORguy1"} do{
		_Oguy1curAI = (OPFORguy1 getvariable "curAI");
		"mkr_Oguy1curAI" setMarkerPosLocal [(getPos _Oguy1curAI select 0),(getPos  _Oguy1curAI select 1)];
		"mkr_Oguy1curAI" setMarkerTextLocal str _Oguy1curAI;
	sleep 10;
	};*/
/*};
[] spawn {
	private ["_Oguy2curAI","_mkr"];
	waituntil {sleep 30; !isnil "OPFORguy2"};
	waituntil {sleep 5; !isnull (OPFORguy2 getvariable "curAI")};
	OPFORguy2 execVM "c\opforMarkers.sqf";
};
[] spawn {
	private ["_Oguy3curAI","_mkr"];
	waituntil {sleep 30; !isnil "OPFORguy3"};
	waituntil {sleep 5; !isnull (OPFORguy3 getvariable "curAI")};
	OPFORguy3 execVM "c\opforMarkers.sqf";
};*/

while {_curPlayer == player} do {
	sleep 5;
};
[player] join grpNull; 
_curPlayer = player;
_startPlayer setvariable ["curAI",_curPlayer,true];
_curPlayer allowdamage false;
[[[_curPlayer],"c\opforTPserver.sqf"],"BIS_fnc_execVM",false] call BIS_fnc_MP;
_curPlayer addEventHandler ["killed",{_this execVM "c\opforRespawn.sqf"}]; 
_curPlayer addEventHandler ["killed", {_this select 0 execVM "c\intelSpawn.sqf";}];
[] execVM "f\radios\radio_init.sqf";
_curPlayer addGoggles "G_Balaclava_blk";
sleep 3;
_curPlayer allowdamage true;

while {true} do {
	sleep 5;
	
	if (_curPlayer != player) then {
		[player] join grpNull; 
		_curPlayer removeAllEventHandlers "killed";
		_curPlayer addEventHandler ["killed", {_this select 0 execVM "c\intelSpawn.sqf";}];
		
		[[[player,_curPlayer],"c\opforTPserver.sqf"],"BIS_fnc_execVM",false] call BIS_fnc_MP;
		//switched
		_curPlayer = player;
		_startPlayer setvariable ["curAI",_curPlayer,true];
		_curPlayer allowdamage false;
		_curPlayer removeAllEventHandlers "killed";
		_curPlayer addEventHandler ["killed",{_this execVM "c\opforRespawn.sqf"}]; 
		_curPlayer addEventHandler ["killed", {_this select 0 execVM "c\intelSpawn.sqf";}];
		[] execVM "f\radios\radio_init.sqf";
		_curPlayer addGoggles "G_Balaclava_blk";
		sleep 3;
		_curPlayer allowdamage true;
	};
};