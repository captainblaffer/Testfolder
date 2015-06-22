//[[[_this select 0],"c\respawnVehClient.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
 private["_veh","_mHQvehs","_curX","_displacement","_targetPos","_direction","_disX","_disY"];
 //_veh = _this select 0;
 
 _this hideObjectGlobal true;
 
 sleep 3;
 _mHQvehs = [mHQveh_1,mHQveh_2,mHQatv_1,mHQatv_2,mHQatv_3,mHQatv_4,mHQatv_5,mHQatv_6,mHQatv_7,mHQatv_8];
 _curX = _mHQvehs find _this;
 if (_curX < 2) then {
 ["v_car",_this] call f_fnc_assignGear; 
 
	/*_this spawn {
	  private ["_item", "_i"];

	  waitUntil {!isNil "AGM_Logistics_loadedItemsDummy"};

	  // adds 3 spare wheels
	  for "_i" from 0 to 2 do {
		_item = ['AGM_SpareWheel', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
		[_this, _item] call AGM_Logistics_fnc_initLoadedObject;
	  };

	  // adds 2 jerry cans
	  for "_i" from 0 to 1 do {
		_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
		[_this, _item] call AGM_Logistics_fnc_initLoadedObject;
	  };
	};*/
 
 } else {
 ["v_atv",_this] call f_fnc_assignGear; 
 }; 
 
 if (mobileHQ getvariable "deployed" == 1) then {
	
	switch _curX do {
	case 0: {_displacement = [0,-13,0]};
	case 1: {_displacement = [0,-18,0]};
	case 2: {_displacement = [-10,-6,0]};
	case 3: {_displacement = [-10,-3,0]};
	case 4: {_displacement = [-10,0,0]};
	case 5: {_displacement = [-10,3,0]};
	case 6: {_displacement = [-15,-6,0]};
	case 7: {_displacement = [-15,-3,0]};
	case 8: {_displacement = [-15,0,0]};
	case 9: {_displacement = [-15,3,0]};
 default{_displacement = [0,-30,0]};
 };
	_targetPos = getpos mobileHQ;
	_direction = getdir mobileHQ;
	_disX = [cos(_direction)*(_displacement select 0), -1* sin(_direction)*(_displacement select 0), 0];
	_disY = [cos(_direction - 90)*(_displacement select 1), -1* sin(_direction - 90)*(_displacement select 1), 0];
	_targetPos = _targetPos vectorAdd _disX;
	_targetPos = _targetPos vectorAdd _disY;

	_this setdamage 0;
	_this hideObjectGlobal false;
	_this setpos _displacement;
	_this setdir _direction - 90;
	[_this,_targetPos] spawn {
	sleep 2;
	(_this select 0) setpos (_this select 1);
	};
 };