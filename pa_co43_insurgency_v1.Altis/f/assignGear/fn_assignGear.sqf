// F3 - Folk Assign Gear Script (Server-side)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_faction","_typeofUnit","_unit"];
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
// ====================================================================================

// DETECT unit FACTION
// The following code detects what faction the unit's slot belongs to, and stores
// it in the private variable _faction. It can also be passed as an optional parameter.


_typeofUnit = toLower (_this select 0);
_unit = _this select 1;

_faction = toLower (faction _unit);
if(count _this > 2) then
{
  _faction = _this select 2;
};

// ====================================================================================

// INSIGNIA
// This block will give units insignia on their uniforms.
if (isPlayer _unit) then {
[_unit,_typeofUnit] spawn {
	#include "f_assignInsignia.sqf"
};
};
// ====================================================================================

// DECIDE IF THE SCRIPT SHOULD RUN
// Depending on locality the script decides if it should run

if !(local _unit) exitWith {};

// ====================================================================================

// SET A PUBLIC VARIABLE
// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component

_unit setVariable ["f_var_assignGear",_typeofUnit,true];

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS 2

private [
"_glrifle","_glriflemag","_glriflemag_tr","_glmag",
"_glsmokewhite","_glsmokegreen","_glsmokered",
"_glflarewhite","_glflarered","_glflareyellow","_glflaregreen",
"_AR","_ARmag","_ARmag_tr",
"_MMG","_MMGmag","_MMGmag_tr",
"_HMG","_HMGmount",
"_RAT","_RATmag",
"_MAT","_MATmag1","_MATmag2",
"_HAT","_HATmag1","_HATmag2",
"_MTR","_MTRmount",
"_RAA","_RAAmag",
"_SNrifle","_SNriflemag",
"_pistol","_pistolmag",
"_grenade","_smokegrenade","_smokegrenadegreen",
"_rifle","_riflemag","_riflemag_tr",
"_carbine","_carbinemag","_carbinemag_tr",
"_smg","_smgmag","_smgmag_tr",
"_bagsmall","_bagmedium","_baglarge",
"_ATmine","_satchel",
"_medkit","_rifle_attach",
"_carbine_attach","_smg_attach",
"_glrifle_attach","_AR_attach",
"_MMG_attach","_SNrifle_attach"
,"_APmine", "_nvg",
"_chemgreen","_chemred","_chemblue","_chemyellow"
];

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",false,true];

// ====================================================================================

// DEBUG
if (f_var_debugMode == 1) then
{
	_unit sideChat format ["DEBUG (assignGear.sqf): unit faction: %1",_faction];
};

// ====================================================================================

// ====================================================================================

// GEAR: BLUFOR > NATO
// The following block of code executes only if the unit is in a NATO slot; it
// automatically includes a file which contains the appropriate equipment data.

waitUntil{!isNil "c_var_addons"};

if (!(_unit isKindOf "CAManBase")) then {
	if (c_var_addons == 0) then { //no addons
	//if (true) then { //no addons
		#include "f_assignGear_nato.sqf";
	} else { //use addons
		#include "f_assignGear_us_army_rhs.sqf";
	};
} else {

if (_faction == "blu_f") then {
	_loadout1 = 0;
	if ( (vehicleVarName _unit) find "ASL" > 0) then {
	_loadout1 = 0;
	};

	if ( (vehicleVarName _unit) find "BSL" > 0) then {
	_loadout1 = 1;
	};

	if ( (vehicleVarName _unit) find "CSL" > 0) then {
	_loadout1 = 2;
	};

	if ( (vehicleVarName _unit) find "DSL" > 0) then {
	_loadout1 = 3;
	};

	if ( (vehicleVarName _unit) find "CO" > 0) then {
	_loadout1 = 4;
	};

	if (c_var_addons == 0) then { //no addons
	//if (true) then { //no addons
		switch (_loadout1) do
		{
			case 0:
			{
				#include "f_assignGear_nato.sqf"; 
			};
			case 1:
			{
				#include "f_assignGear_nato_uk.sqf"; 
			};
			case 2:
			{
				#include "f_assignGear_nato2.sqf"; 
			};
			case 3:
			{
				#include "f_assignGear_nato_uk2.sqf"; 
			};
			case 4:
			{
				#include "f_assignGear_nato.sqf"; 
			};
		};
	} else { //use addons
		switch (_loadout1) do
		{
			case 0:
			{
				#include "f_assignGear_us_delta_g.sqf"; 
			};
			case 1:
			{
				#include "f_assignGear_us_marine_rhs.sqf"; 
			};
			case 2:
			{
				#include "f_assignGear_us_army_rhs.sqf"; 
			};
			case 3:
			{
				#include "f_assignGear_us_army_rhs.sqf"; 
			};
			case 4:
			{
				#include "f_assignGear_us_army_rhs.sqf"; 
			};
		};
	}; 
};

// ====================================================================================

// GEAR: OPFOR > CSAT
// The following block of code executes only if the unit is in a CSAT slot; it
// automatically includes a file which contains the appropriate equipment data.

//no addons
if (_faction == "opf_f") then {
	if (c_var_addons == 0) then { //no addons
		#include "f_assignGear_csat.sqf"
	} else {
		#include "f_assignGear_insurgent.sqf"
	};
};
// ====================================================================================

// GEAR: INDEPEDENT > AAF
// The following block of code executes only if the unit is in a AAF slot; it
// automatically includes a file which contains the appropriate equipment data.

if(_faction == "ind_f") then {
	#include "f_assignGear_aaf.sqf";
};

// ====================================================================================

// GEAR: FIA
// The following block of code executes only if the unit is in a FIA slot (any faction); it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then {
	#include "f_assignGear_fia.sqf"
};

};


// ====================================================================================

// GEAR: Modded factions
// KEEP COMMENTED OUT IF NOT USING
// DO NOT FORGET TO COPY OVER .SQF FILES
/*
if (_faction == "rhs_faction_vdv") then {
	TF_defaultEastBackpack = "tf_mr3000_rhs";
	#include "f_assignGear_vdv.sqf";
};
*/
// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];


// ====================================================================================
// DEBUG

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

if (isNil "_carbine") then { //_carbine should exist unless no faction has been called
	player globalchat format ["DEBUG (assignGear.sqf): Faction %1 is not defined. unit: %2",_faction,_unit];
} else {
 	if (f_var_debugMode == 1) then	{
		player sideChat format ["DEBUG (assignGear.sqf): Gear for %1: %1 slot selected.",_unit,_faction,_typeofUnit];
	};
};

// ====================================================================================