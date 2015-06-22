//_null = [this] execVM "noWheelDamage.sqf";

_vehicle = _this select 0;
if (!isServer || {_vehicle isKindOf "CAManBase"}) exitWith {};

_hitPoints  = [];
_selections = [];

_config = configFile >> "cfgVehicles" >> typeOf _vehicle;
_hitPointClasses = [_config >> "HitPoints"];
{
	_hitPointClass = _x;
	for "_i" from 0 to (count _hitPointClass - 1) do {
		_hitPoint  = configName (_hitPointClass select _i);
		_selection = getText (_hitPointClass select _i >> "name");
		if (_selection find "wheel" != -1 || _selection find "motor" != -1) then { //if (_selection find "wheel" != -1) then { //
			_hitPoints  pushBack _hitPoint;
			_selections pushBack _selection;
		};
	};
} forEach _hitPointClasses;

_vehicle setVariable ["selections",_selections];

_vehicle removeAllEventHandlers "handleDamage";
_vehicle addEventHandler [
	"HandleDamage",
	{
		_vehicle = _this select 0;
		_selection = _this select 1;
		_damage = _this select 2;

		_selections = _vehicle getVariable ["selections",[]];

		if (_selection in _selections) then {
			{_vehicle setHit [_x,0]} forEach _selections;
			_damage = 0;
			diag_log _selection;
		};

		//hint format ["%1 | %2",_damage, _selection];
		_damage;
	}
];