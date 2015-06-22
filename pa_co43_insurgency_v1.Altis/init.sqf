// ====================================================================================
/*
if (isnil "f_param_backpacks") then {f_param_backpacks = 1;};
if (isnil "f_var_debugMode") then {f_var_debugMode = 0;};
if (isnil "f_var_radios") then {f_var_radios = 2;};
if (isnil "f_var_medical") then {f_var_medical = 2;};
if (isnil "f_var_ace3") then {f_var_ace3 = 1;};
if (isnil "f_param_caching") then {f_param_caching = 1500;};
if (isnil "c_var_addons") then {c_var_addons = 1;};
if (isnil "c_var_hc") then {c_var_hc = 0;};
*/

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSentences false;

// ====================================================================================

// F3 - MapClick Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_var_mapClickTeleport_Uses = 0;					// How often the teleport action can be used. 0 = infinite usage.
// f_var_mapClickTeleport_TimeLimit = 0; 			// If higher than 0 the action will be removed after the given time.
// f_var_mapClickTeleport_GroupTeleport = false; 	// False: everyone can teleport. True: Only group leaders can teleport and will move their entire group.
// f_var_mapClickTeleport_Units = [];				// Restrict map click teleport to these units
// f_var_mapClickTeleport_Height = 0;				// If > 0 map click teleport will act as a HALO drop and automatically assign parachutes to units
// [] execVM "f\mapClickTeleport\f_mapClickTeleportAction.sqf";

// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_briefing = [] execVM "briefing.sqf";

// ====================================================================================

// F3 - F3 Folk ARPS Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================

// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setTeamColours = [] execVM "f\setTeamColours\f_setTeamColours.sqf";

// ====================================================================================

// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] spawn f_fnc_SetLocalFTMemberMarkers;

// ====================================================================================

// F3 - F3 Folk ARPS Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupMarkers = [] execVM "f\groupMarkers\f_setLocalGroupMarkers.sqf";

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT
if(isServer) then {
	f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";
};

// ====================================================================================

// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_var_removeBodyDelay = 180;
// f_var_removeBodyDistance = 500;
// f_var_doNotRemoveBodies = [];
// [] execVM "f\removeBody\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F3 - Dynamic View Distance
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_var_viewDistance_default = 1250;
// f_var_viewDistance_tank = 2000;
// f_var_viewDistance_car = 2000;
// f_var_viewDistance_rotaryWing = 2500;
// f_var_viewDistance_fixedWing = 5000;
// f_var_viewDistance_crewOnly = true;
// [] execVM "f\dynamicViewDistance\f_setViewDistanceLoop.sqf";

// ====================================================================================

// F3 - Authorised Crew Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2],false] call f_fnc_authorisedCrewCheck}];
// VehicleName addEventhandler ["GetIn", {[_this,["UnitClass1","UnitClass2"],false] call f_fnc_authorisedCrewCheck}];

// ====================================================================================

// F3 - Casualties Cap
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [[GroupName or SIDE],100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
// [[GroupName or SIDE],100,{code}] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// BLUFOR > NATO
// [BLUFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// OPFOR > CSAT
// [OPFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// INDEPENDENT > AAF
// [INDEPENDENT,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// ====================================================================================

// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [] execVM "f\setAISKill\f_setAISkill.sqf";
// f_var_civAI = independent; // Optional: The civilian AI will use this side's settings

// ====================================================================================

// F3 - Name Tags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_showGroup_Nametags = true;				// Display unit's group (uses GroupID)
// f_showDistance_Nametags = true;			// Show distance to player
// f_showVehicle_Nametags = true;			// Show vehicle player is in
// [20] execVM "f\nametag\f_nametags.sqf";

// ====================================================================================

// F3 - Group E&E Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [side,ObjectName or "MarkerName",100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
// [["Grp1","Grp2"],ObjectName or "MarkerName",100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";

// ====================================================================================

// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\briefing\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\briefing\f_loadoutNotes.sqf";

// ====================================================================================

// F3 - Join Group Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

//[false] execVM "f\groupJoin\f_groupJoinAction.sqf";

// ====================================================================================

// F3 - Mission Timer/Safe Start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

//[] execVM "f\safeStart\f_safeStart.sqf";

// F3 - ACE Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\ace3\ACE3_clientInit.sqf";

// ====================================================================================

// F3 - JIP setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_var_JIP_FirstMenu = false;		// Do players connecting for the first time get the JIP menu? - This only works in missions with respawn.
f_var_JIP_RemoveCorpse = false;		// Remove the old corpse of respawning players?
f_var_JIP_GearMenu = false;			// Can JIP/respawned players select their own gear? False will use gear assigned by F3 Gear Component if possible

// ====================================================================================



if (isnil "ainotspawned") then {ainotspawned = true;};
if (ainotspawned) then {
[] execVM "c\headlessCheck.sqf"; // HEADLESS CLIENT - This needs to be ran on all clients, as well as the server
};

if(!isServer && hasInterface) then 
{
  waitUntil {!isNull player};
};

// F3 - AI Unit Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[0] spawn f_fnc_cInit;

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:
// 1 - cache only non-leaders and non-drivers
// 2 - cache all non-moving units, always exclude vehicle drivers
// 3 - cache all units, incl. group leaders and vehicle drivers
f_var_cachingAggressiveness = 3;

// ====================================================================================

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\radios\radio_init.sqf";

// ====================================================================================

// F3 - Medical Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
f_wound_extraFAK = 2;

[] execVM "f\medical\medical_init.sqf";

// ====================================================================================

//[] execVM "LV\LV_functions\LV_fnc_removeDead.sqf";

[] execVM "module_performance\init.sqf";

execVM "gvs\gvs_init.sqf";

if(isServer) then 
{
  []spawn {
	 sleep 10;
	  mobileHQ setvariable ["deployed",0,true];
	  mobileHQ setvariable ["deploying",0,true];
	  mobileHQ addMPEventHandler ["mpkilled", {_this execVM "c\mobileHQKilled2.sqf"}];
	  //mobileHQ addeventhandler ["killed",{execVM "c\mobileHQKilled.sqf"}];
	  //mobileHQ setpos getmarkerpos "mHQstart";
	  //[]execVM "c\mobileHQDeployServer.sqf";
	  VehNATO_AH1 execVM "c\respawnChopper.sqf";
	  VehNATO_TH3 execVM "c\respawnChopper.sqf";
	  VehNATO_TH4 execVM "c\respawnChopper.sqf";
  };
  if(isnil "Wtickets") then {Wtickets = 100; publicvariable "Wtickets";};
};

if (!isdedicated) then {
	if (side player == west) then {
	player addRating 100000;
	lastSquadTP = 0;
	baseFlag addAction ["Teleport to Squad", "c\jipTeleport.sqf"];
	baseFlag addAction ["Teleport to Mobile HQ", "c\mobileHQTeleport.sqf"];
	//mobileHQ addAction ["Deploy/Undeploy MHQ", "c\mobileHQDeploy.sqf"];
	//mobileHQ addAction ["Teleport to Base", "c\mobileHQTeleportBack.sqf"];
	[]spawn {
		waitUntil {mobileHQ getvariable ["deployed",-1] != -1};
		sleep 20;
		if (mobileHQ getvariable "deployed" == 1) then {
			"mkr_mobileHQ" setmarkertextlocal "MHQ (Deployed)";
		} else {
			"mkr_mobileHQ" setmarkertextlocal "MHQ (Un-Deployed)";
		};
	};
	basebox1 addAction ["Reset gear", "c\resetGear.sqf"];
	player addeventhandler ["Killed",{_this execVM "c\playerKilled.sqf"}]; 
	//player addeventhandler ["Respawn",{_this execVM "c\playerRespawn.sqf"}]; 
	[]spawn{
		waituntil {!isnil "Wtickets";};
		hintsilent format ["Tickets remaining: %1\n\nUse base flag teleport to get to your squad",Wtickets];
	};
	
	//debug
	//onMapSingleClick "vehicle player setpos _pos";
	//player allowdamage false;
	};
	if (side player == east) then {
	_marker3 = createMarkerLocal ["mkr_nogo3",getmarkerpos "respawn_west"];
	"mkr_nogo3" setMarkerShapeLocal "ELLIPSE";
	"mkr_nogo3" setMarkerColorLocal "ColorRed";
	"mkr_nogo3" setMarkerBrushLocal "DiagGrid"; 
	"mkr_nogo3" setMarkerSizeLocal [1200,1200]; 
	"mkr_nogo3" setMarkerDirLocal -107; 
	"mkr_nogo3" setMarkerAlphaLocal 0.5;
	_marker4 = createMarkerLocal ["mkr_nogo3_txt",[getmarkerpos "respawn_west" select 0,(getmarkerpos "respawn_west" select 1)+100]];
	"mkr_nogo3_txt" setMarkerShapeLocal "ICON";
	"mkr_nogo3_txt" setMarkerTypelocal "mil_Dot";
	"mkr_nogo3_txt" setMarkerTextlocal "NO-GO ZONE";
	"mkr_nogo3_txt" setMarkerColorLocal "ColorRed";
	
	deleteMarkerlocal "RadioA";
	deleteMarkerlocal "RadioB";
	deleteMarkerlocal "RadioC";
	deleteMarkerlocal "RadioD";
	deleteMarkerlocal "RadioAIR";
	deleteMarkerlocal "RadioS";
	deleteMarkerlocal "RadioLR";
	deleteMarkerlocal "RadioAIR2";
	deleteMarkerlocal "mkr_supply";
	"mkr_baseFlag" setmarkeralphalocal 0;
	"gvs_veh_0" setmarkeralphalocal 0;
	"gvs_hel_0" setmarkeralphalocal 0;
	
	[] execVM "c\outOfBoundsBase.sqf";
	[] execVM "c\outOfBoundsMHQ.sqf";
	
	//player setVariable ["ACE_CanSwitchUnits", true];	
	
	[]spawn{
		sleep .1;
		sleep 1;
		player setVariable ["ACE_CanSwitchUnits", false];	
		//disableuserinput true;
		sleep 1;
		hintsilent "In 180 seconds, open map and click on AI to control them";
		sleep 58;
		hintsilent "In 120 seconds, open map and click on AI to control them";
		sleep 60;
		hintsilent "In 60 seconds, open map and click on AI to control them";
		sleep 60;
		hint "Open map and click on AI to control them";
		//disableuserinput false;
		player setVariable ["ACE_CanSwitchUnits", true];	
	};
	player addeventhandler ["Killed",{_this execVM "c\opforRespawn.sqf"}]; 
	execVM "c\opforTPloop.sqf";
	};
};