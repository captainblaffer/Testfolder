private ["_curPlayer","_oldPlayer"];

_curPlayer = _this select 0;
_curPlayer enableSimulationGlobal true;
_curPlayer hideObjectGlobal false;
if (vehicle _curPlayer != _curPlayer) then {(vehicle _curPlayer) hideObjectGlobal false};


if (count _this > 1) then {
_oldPlayer = _this select 1;
[_oldPlayer]spawn {
			private ["_trg","_oldPlayer2","_radius","_findGroup","_theGroup"];
			_oldPlayer2 = _this select 0;
			_theGroup = group _oldPlayer2;
			_radius = 100;
			_findGroup = true;
			_trg = [];
			sleep 2;
			while {_findGroup} do {
				_trg = _oldPlayer2 nearEntities ["Man", _radius];
				_radius = _radius + 500;
				{
					if (side _x == east || side _x == resistance) then {
					if (_x != _oldPlayer2) then {
					if (!(isPlayer _x)) exitWith {
							_findGroup = false;
							_theGroup = group _x; 
					};
					};
					};
				}foreach _trg;
				sleep 0.1;
			};
			[_oldPlayer2] join _theGroup;
};
};