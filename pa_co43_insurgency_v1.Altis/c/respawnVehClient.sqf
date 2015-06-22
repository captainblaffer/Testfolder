//[[[_this select 0],"c\respawnVehClient.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;

private["_veh"];
_veh = _this select 0;

_veh disableTIEquipment true; 
if (isserver) then {
	if (_veh iskindof "B_Quadbike_01_F") then {
		["v_atv",_veh] call f_fnc_assignGear; 
	} else {
	/*_veh spawn {
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
	};
};

if (_veh iskindof "I_MRAP_03_hmg_F" || _veh iskindof "I_MRAP_03_gmg_F" || _veh iskindof "I_MRAP_03_F" ) then {
_veh setObjectTexture [0, "\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa"];  
_veh setObjectTexture [1, "\a3\data_f\vehicles\turret_co.paa"];   
if (isserver) then {
	_veh setVariable ["TF_RadioType", "tf_rt1523g", true];
	_veh setVariable ["tf_side", west, true];
	["v_car",_veh] call f_fnc_assignGear; 
};
};

//if (!(_veh iskindof "B_APC_Wheeled_01_cannon_F")) then {};

if (_veh iskindof "B_APC_Wheeled_01_cannon_F") then {
if (isserver) then {
	["v_ifv",_veh] call f_fnc_assignGear; 	
};
};

if (_veh iskindof "I_APC_Wheeled_03_cannon_F") then {
_veh setObjectTexture [0,  "#(rgb,8,8,3)color(0.569,0.548,0.481,0.29)"];
if (isserver) then {
	_veh setVariable ["TF_RadioType", "tf_rt1523g", true];
	_veh setVariable ["tf_side", west, true];
	["v_ifv",_veh] call f_fnc_assignGear; 
	/*_veh spawn {
	  private ["_item", "_i"];

	  waitUntil {!isNil "AGM_Logistics_loadedItemsDummy"};

	  // adds spare wheels
	  for "_i" from 0 to 1 do {
		_item = ['AGM_SpareWheel', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
		[_this, _item] call AGM_Logistics_fnc_initLoadedObject;
	  };

	  // adds 6 jerry cans
	  //for "_i" from 0 to 5 do {
		//_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
		//[_this, _item] call AGM_Logistics_fnc_initLoadedObject;
	  //};
	};*/
};
};

waitUntil {sleep 0.1; !isnil "mobileHQ"};
if (_veh == mobileHQ) then {
if (isserver) then {
		mobileHQ setvariable ["deployed",0,true];
		mobileHQ setvariable ["deploying",0,true];
		mobileHQ lockDriver false;
		mobileHQ addMPEventHandler ["mpkilled", {_this execVM "c\mobileHQKilled2.sqf"}];
		};
	if (!isdedicated) then {
	if (side player != east) then {
		mobileHQ addAction ["Deploy/Undeploy MHQ", "c\mobileHQDeploy.sqf"];
		mobileHQ addAction ["Teleport to Base", "c\mobileHQTeleportBack.sqf"];
		if (time > 15) then {hintsilent "MHQ Respawned";};
	};
	};
};