if (isserver) then {
//if (isnil "dMHQactive") then {dMHQactive = false;};
//if (dMHQactive) exitWith {};
//dMHQactive = true;

private ["_pytho","_tpPos","_targetPos","_target", "_displacement","_curX","_direction","_disY","_disX","_mHQvehs","_TPthis","_safePos"];
_target = mobileHQ;

if (isnil "oldMHQpos") then {oldMHQpos = (getmarkerpos "nogo2");};
_mHQvehs = [mHQveh_1,mHQveh_2,mHQatv_1,mHQatv_2,mHQatv_3,mHQatv_4,mHQatv_5,mHQatv_6,mHQatv_7,mHQatv_8];
if (_target getvariable "deployed" == 1) then {
	_target setvariable ["deployed",0,true];
	_target lockDriver false;
	//vehicle TP away
	{
		if (_x distance _target < 100) then {
		_TPthis = true;
		{
			if (alive _x) then {_TPthis = false;};
		} foreach (crew _x);
		if (_TPthis) then {
		_curX = _mHQvehs find _x;
		switch _curX do {
		case 0: {_displacement = [10,-3,0]};
		case 1: {_displacement = [10,-11,0]};
		case 2: {_displacement = [0,4,0]};
		case 3: {_displacement = [0,7,0]};
		case 4: {_displacement = [0,10,0]};
		case 5: {_displacement = [0,13,0]};
		case 6: {_displacement = [-5,4,0]};
		case 7: {_displacement = [-5,7,0]};
		case 8: {_displacement = [-5,10,0]};
		case 9: {_displacement = [-5,13,0]};
		default{_displacement = [0,0,0]};
		};
		_x allowDamage false;
		_displacement = _displacement vectorAdd (getmarkerpos "nogo2");
		_x hideObjectGlobal true;
		_x setpos _displacement;
		};
		};
	} foreach _mHQvehs;
	
	//save pos for vehicle TP
	oldMHQpos = getpos _target;
} else {
	_safePos = if(count _this > 0)then{_this select 0;} else {getpos _target};
	_target setpos _safePos;
	_target setvariable ["deployed",1,true];
	_target lockDriver true;
	if (!(isnull driver _target)) then {
		moveOut driver _target ;
	};
	
	//vehicle TP
	sleep 5;
	_targetPos = getpos _target;
	_direction = getdir _target;
	{
	if (_x distance oldMHQpos < 100 || _x distance (getmarkerpos "nogo2") < 30) then {
	if (alive _x) then {
		_curX = _mHQvehs find _x;
		switch _curX do {
		case 0: {_displacement = [0,-11,0]};
		case 1: {_displacement = [0,-17,0]};
		case 2: {_displacement = [-6,-6,0]};
		case 3: {_displacement = [-6,-3,0]};
		case 4: {_displacement = [-6,0,0]};
		case 5: {_displacement = [-6,3,0]};
		case 6: {_displacement = [-10,-6,0]};
		case 7: {_displacement = [-10,-3,0]};
		case 8: {_displacement = [-10,0,0]};
		case 9: {_displacement = [-10,3,0]};
		default{_displacement = [0,-30,0]};
		};
		_pytho = sqrt (((_displacement select 0)*(_displacement select 0))+((_displacement select 1)*(_displacement select 1)));
		_Vangle = _direction + ((_displacement select 0) atan2 (_displacement select 1));
		_tpPos = _targetPos vectorAdd [(sin _Vangle) * _pytho,(cos _Vangle) * _pytho,0];
		//_disX = [cos(_direction)*(_displacement select 0), -1* sin(_direction)*(_displacement select 0), 0];
		//_disY = [cos(_direction - 90)*(_displacement select 1), -1* sin(_direction - 90)*(_displacement select 1), 0];
		//_targetPos = _targetPos vectorAdd _disX;
		//_targetPos = _targetPos vectorAdd _disY;
		
		//player setpos [(getpos player select 0)+cos(getdir player)*2, (getpos player select 1) - sin(getdir player)*2, getpos player select 2];
		/*for "_i" from 0 to ((count _displacement) - 1) do
		{
			//hint format ["%1",_displacement]; 
			_displacement set [_i, (_targetPos select _i) + (_displacement select _i)];
		};  */
		_x setdamage 0;
		_x hideObjectGlobal false;
		_x setdir _direction - 90;
		_x setpos _tpPos;
		//[_x,_tpPos] spawn {
		//sleep 2;
		//(_this select 0) setpos (_this select 1);
		//};
		_x allowDamage true;
	};
	};
	}foreach _mHQvehs;
};
//dMHQactive = false;
mobileHQ setvariable ["deploying",0,true];
};
if (!isdedicated) then {
if (side player != east) then {
sleep 10;
if (mobileHQ getvariable "deployed" == 1) then {
	"mkr_mobileHQ" setmarkertextlocal "MHQ (Deployed)";
	mobileHQ lockDriver true;
	if (!(isnull driver mobileHQ)) then {
		moveOut driver mobileHQ ;
	};
} else {
	"mkr_mobileHQ" setmarkertextlocal "MHQ (Un-Deployed)";
	mobileHQ lockDriver false;
};
} else {sleep 10; mobileHQ lockDriver true;};
};