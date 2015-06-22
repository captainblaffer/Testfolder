private["_checkAbandonded","_isAbandonded","_abandondedSince"];

_checkAbandonded = {
	private["_distance","_vehicle","_nearEntities","_cleanThis","_nocleanPos"];
	_vehicle = _this;
		
	_cleanThis = true;
	
	{
		_distance = pvpfw_cleanUp_dontCleanUpAroundDistance;
		if(_x in allMapMarkers)then{
			_nocleanPos = getMarkerPos _x;
			if (_x == "respawn_west") then {_distance = 300;};
		}else{
			if (typeName _x == "ARRAY") then{
				_nocleanPos = _x;
			}else{
				_nocleanPos = getPos _x;
			};
		};		
		if (_vehicle distance _nocleanPos <= _distance) exitWith{
			_cleanThis = false;
		};
	}forEach pvpfw_cleanUp_dontCleanUpAround;
	
	if (_cleanThis) then{
		/*_nearEntities = (position _vehicle) nearEntities [["LandVehicle","Air","Ship"], pvpfw_cleanUp_abandonRadius];
		if (({(count crew _x) != 0} count _nearEntities) != 0) then{
			{
				hint format ["%1",_x];
				if (alive _x) then {_cleanThis = false; hint format ["%1",_cleanThis]; };
			}forEach crew _x;
		};*/
		_nearEntities = (position _vehicle) nearEntities [["LandVehicle","Air","Ship","CAManBase"], pvpfw_cleanUp_abandonRadius];
		{
		if ((count crew _x) != 0) then {
		{
		if (alive _x) then {_cleanThis = false;};
		}forEach crew _x;
		};
		}forEach _nearEntities
	};
	
	_cleanThis
};

while{true}do{
	{
		if (!isNull _x && {alive _x} && {(faction _x) in pvpfw_cleanup_abandonedFromFaction})then{ 
			_isAbandonded = (_x call _checkAbandonded);
			if (_isAbandonded) then{
				_abandondedSince = _x getVariable ["pvpfw_respawn_abandondedSince",0];
				if (_abandondedSince == 0) then{
					_x setVariable ["pvpfw_respawn_abandondedSince",diag_tickTime,false];
				}else{
					if (diag_tickTime > (_abandondedSince + pvpfw_cleanup_abandondTimer)) then{
						if (_x == mobileHQ) then {
							if (_x getvariable "deployed" == 0) then {
								//deleteVehicle _x;
								_x setdamage 1;
								diag_log format["#PVPFW module_cleanup: cleaned up abandonded vehicle %1",typeOf _x];
							};
						} else {
							//deleteVehicle _x;
							_x setdamage 1;
							diag_log format["#PVPFW module_cleanup: cleaned up abandonded vehicle %1",typeOf _x];
						};
					};
				};
			}else{
				_x setVariable ["pvpfw_respawn_abandondedSince",0,false];
			};
		};
		sleep 0.1;
	}forEach vehicles;
	sleep 1;
};