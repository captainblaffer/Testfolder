sleep 5;
if (!hasInterface or isServer) then {

if (isnil "HCAvailable") then {HCAvailable = false;};

if (!hasInterface && !isDedicated) then {
	waitUntil{!isNil "c_var_hc"};
	if (c_var_hc==0) then {
		HCAvailable = false; 
	} else {
		HCAvailable = true; 
	};
	publicVariable "HCAvailable";
};

if (isServer) then {
		_enemyHQ = createCenter east; // Create the AI's HQ, this assumes the AI is going to be OPFOR
		_enemyHQ2 = createCenter resistance; 
		east setFriend [resistance, 1];
		resistance setFriend [east, 1];
		east setFriend [west, 0];
		west setFriend [east, 0];
		resistance setFriend [west, 0];
		west setFriend [resistance, 0];
	sleep 15;
};

if (!HCAvailable && isServer) then { // If the headless client is not available and this is the server
        //hint "Headless not available!";
		
		if (isnil "compoundsArray") then {compoundsArray = ["c_200_1","c_200_2","c_200_3","c_200_4","c_200_5","c_200_6","c_200_7","c_200_8","c_200_9","c_200_10","c_200_11","c_200_12","c_200_13","c_200_14","c_200_15","c_200_16","c_200_17","c_200_18","c_200_19","c_200_20","c_200_21","c_200_22","c_200_23","c_200_24","c_200_25","c_200_26","c_200_27","c_200_28","c_200_29","c_200_30","c_200_31","c_200_32","c_200_33","c_200_34","c_200_35","c_200_36","c_200_37","c_200_38","c_200_39","c_200_40","c_200_41","c_200_42","c_200_43","c_200_44","c_200_45","c_200_46","c_200_47","c_200_48","c_200_49","c_200_50","c_200_51","c_200_52","c_200_53","c_200_54","c_200_55","c_200_56","c_200_57","c_200_58","c_200_59","c_200_60","c_200_61","c_200_62","c_200_63","c_200_64","c_200_65","c_200_66","c_200_67","c_200_68","c_200_69","c_200_70","c_200_71","c_200_72","c_200_73","c_200_74","c_300_1","c_300_2","c_300_3"];};
		if (isnil "townsArray") then {townsArray = ["t_300_1","t_300_2","t_300_3","t_300_4","t_300_5","t_300_6","t_300_7","t_300_8","t_400_1","t_400_2","t_400_3","t_400_4","t_400_5","t_400_6","t_400_7","t_400_8","t_400_9","t_400_10","t_400_11"];};
		if (isnil "activeTowns") then {activeTowns = [];};
		if (isnil "townMarkers") then {townMarkers = [];};
		
		waitUntil{!isNil "c_var_addons"};
		[] execVM "c\chooseTown.sqf";
		ainotspawned = false;
		publicvariable "ainotspawned";
		
		_debugMarker = createMarker ["Servermarker", [0,100,0]];
		_debugMarker setMarkerText "SERVER AI";
		_debugMarker setMarkerShape "ICON";
		_debugMarker setMarkerType "mil_dot";
		_debugMarker setMarkerColor "ColorRed";
			
} else {

        if (!hasInterface && !isDedicated && HCAvailable) then { // If this player is the headless client
        //hint "Headless available!";
		if (isnil "compoundsArray") then {compoundsArray = ["c_200_1","c_200_2","c_200_3","c_200_4","c_200_5","c_200_6","c_200_7","c_200_8","c_200_9","c_200_10","c_200_11","c_200_12","c_200_13","c_200_14","c_200_15","c_200_16","c_200_17","c_200_18","c_200_19","c_200_20","c_200_21","c_200_22","c_200_23","c_200_24","c_200_25","c_200_26","c_200_27","c_200_28","c_200_29","c_200_30","c_200_31","c_200_32","c_200_33","c_200_34","c_200_35","c_200_36","c_200_37","c_200_38","c_200_39","c_200_40","c_200_41","c_200_42","c_200_43","c_200_44","c_200_45","c_200_46","c_200_47","c_200_48","c_200_49","c_200_50","c_200_51","c_200_52","c_200_53","c_200_54","c_200_55","c_200_56","c_200_57","c_200_58","c_200_59","c_200_60","c_200_61","c_200_62","c_200_63","c_200_64","c_200_65","c_200_66","c_200_67","c_200_68","c_200_69","c_200_70","c_200_71","c_200_72","c_200_73","c_200_74","c_300_1","c_300_2","c_300_3"];};
		if (isnil "townsArray") then {townsArray = ["t_300_1","t_300_2","t_300_3","t_300_4","t_300_5","t_300_6","t_300_7","t_300_8","t_400_1","t_400_2","t_400_3","t_400_4","t_400_5","t_400_6","t_400_7","t_400_8","t_400_9","t_400_10","t_400_11"];};
		if (isnil "activeTowns") then {activeTowns = [];};
		if (isnil "townMarkers") then {townMarkers = [];};
		
		waitUntil{!isNil "c_var_addons"};
		[] execVM "c\chooseTown.sqf";
		ainotspawned = false;
		publicvariable "ainotspawned";
		
		_debugMarker1 = createMarker ["Headlessmarker", [0,100,0]];
		_debugMarker1 setMarkerText "HEADLESS AI";
		_debugMarker1 setMarkerShape "ICON";
		_debugMarker1 setMarkerType "mil_dot";
		_debugMarker1 setMarkerColor "ColorRed";
};
};

};