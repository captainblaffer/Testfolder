if (isserver) then {

private ["_target", "_displacement","_curX","_mHQvehs","_TPthis"];
_target = _this select 0;

_mHQvehs = [mHQveh_1,mHQveh_2,mHQatv_1,mHQatv_2,mHQatv_3,mHQatv_4,mHQatv_5,mHQatv_6,mHQatv_7,mHQatv_8];

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
};