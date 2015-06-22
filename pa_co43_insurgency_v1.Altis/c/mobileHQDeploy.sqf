private ["_pos1","_pos"];

_target = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

if (_caller == leader _caller && count units group _caller > 0) then { // more than one in group
//if (true) then { //debug
	if (_target getvariable "deploying" == 0) then { 	
	if (_target getvariable "deployed" == 1) then { 
		_target setvariable ["deploying",1,true];
		hintsilent "Un-Deployed Mobile HQ";
		"mkr_mobileHQ" setmarkertextlocal "MHQ (Un-Deployed)";
		[[[],"c\mobileHQDeployServer.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
	} else {
		_pos = getposATL mobileHQ;
		//_pos1 = [_pos,0,40,18,0,2,0] call BIS_fnc_findSafePos;
		//_pos1 = [_pos1 select 0, _pos1 select 1, 0];

		//if (_pos1 distance _pos > 50) then {
		//	hintsilent ""; sleep 0.2;
		//	hintSilent "Area not clear, try again";
		//} else {
		
		_safePos = true;
		{
		if (side _x == east) then {
			if ((getposATL _x) distance _pos < 75) exitWith {
				_safePos = false;
			};
		};
		}foreach allunits;
		if (_safePos) then {
			_target setvariable ["deploying",1,true];
			hintsilent "Deployed Mobile HQ\n\nSTAND CLEAR";
			"mkr_mobileHQ" setmarkertextlocal "MHQ (Deployed)";
			[[[_pos],"c\mobileHQDeployServer.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP; //_pos1
		} else {
			hintsilent "Enemies nearby, can not deploy";
		};
		//};
	};
	} else {
	hintsilent "MHQ is already deploying";
	};
} else {
	hintsilent "You must be Squad Leader to deploy MHQ"
};