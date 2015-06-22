// F3 - Folk Assign Gear Script - NATO
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
//
// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co			- commander
//		dc 			- deputy commander / squad leader
//		m 			- medic
//		ftl			- fire team leader
//		ar 			- automatic rifleman
//		aar			- assistant automatic rifleman
//		rat			- rifleman (AT)
//		mmgg		- medium mg gunner
//		mmgag		- medium mg assistant
//		matg		- medium AT gunner
//		matag		- medium AT assistant
//		hmgg		- heavy mg gunner (deployable)
//		hmgag		- heavy mg assistant (deployable)
//		hatg		- heavy AT gunner (deployable)
//		hatag		- heavy AT assistant (deployable)
//		mtrg		- mortar gunner (deployable)
//		mtrag		- mortar assistant (deployable)
//		msamg		- medium SAM gunner
//		msamag		- medium SAM assistant gunner
//		hsamg		- heavy SAM gunner (deployable)
//		hsamag		- heavy SAM assistant gunner (deployable)
//		sn			- sniper
//		sp			- spotter (for sniper)
//		vc			- vehicle commander
//		vg			- vehicle gunner
//		vd			- vehicle driver (repair)
//		pp			- air vehicle pilot / co-pilot
//		pcc			- air vehicle co-pilot (repair) / crew chief (repair)
//		pc			- air vehicle crew
//		eng			- engineer (demo)
//		engm		- engineer (mines)
//		uav			- UAV operator
//		div    		- divers
//
//		r 			- rifleman
//		car			- carabineer
//		smg			- submachinegunner
//		gren		- grenadier
//
//		v_car		- car/4x4
//		v_tr		- truck
//		v_ifv		- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// ATTACHMENTS - PRIMARY
_attach1 = "BWA3_acc_LLM01_flash"; 		// Flash
_attach2 = "BWA3_acc_LLM01_irlaser"; 	// Laser

_silencer1 = "BWA3_muzzle_MP7_snds";	// Suppressor

_scope1 = "BWA3_optic_RSAS";			// No zoom
_scope2 = "Optic_ARCO";			// Zoom 1x - 4x BWA3_optic_ZO4x30
_scope3 = "BWA3_optic_20x50";			// Sniper Scope

// Default setup
_attachments = [_attach1,_scope2]; // The default attachment set for most units, overwritten in the individual unitType

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ====================================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "";		// None

_hg_scope1 = "";		// None

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ====================================================================================

// WEAPON SELECTION, unit description for weapons not accurate for Bundeswehr

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "BWA3_G36";
_riflemag = "BWA3_30Rnd_556x45_G36";
_riflemag_tr = "BWA3_30Rnd_556x45_G36_Tracer";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "BWA3_G36K";
_carbinemag = "BWA3_30Rnd_556x45_G36";
_carbinemag_tr = "BWA3_30Rnd_556x45_G36_Tracer";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "BWA3_MP7";
_smgmag = "BWA3_40Rnd_46x30_MP7";
_smgmag_tr = "BWA3_40Rnd_46x30_MP7";	// Has no tracer variant, phase out

// Diver
_diverWep = "arifle_SDAR_F";			// None in mod
_diverMag1 = "30Rnd_556x45_Stanag";		// None in mod
_diverMag2 = "20Rnd_556x45_UW_mag";		// None in mod

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "BWA3_G36_AG";
_glriflemag = "BWA3_30Rnd_556x45_G36";
_glriflemag_tr = "BWA3_30Rnd_556x45_G36_Tracer";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "UGL_FlareWhite_F";
_glflarered = "UGL_FlareRed_F";
_glflareyellow = "UGL_FlareYellow_F";
_glflaregreen = "UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "BWA3_P8";
_pistolmag = "BWA3_15Rnd_9x19_P8";

// Grenades
_grenade = "BWA3_DM51A1";
_Mgrenade = "BWA3_DM51A1";
_smokegrenade = "BWA3_DM25";				// White
_smokegrenadeorange = "BWA3_DM32_Orange";	// Orange
_smokegrenadeyellow = "BWA3_DM32_Yellow";	// Yellow

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Night Vision Goggles (NVGoggles)
_nvg = "ACE_NVG_Wide";

// UAV Terminal
_uavterminal = "B_UavTerminal";	  // BLUFOR

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bagsmall = "B_AssaultPack_rgr";		// carries 120, weighs 20
_bagmedium = "B_Kitbag_rgr";			// carries 240, weighs 30
_baglarge =  "B_Kitbag_rgr"; 			// carries 320, weighs 40
_bagmediumdiver =  "B_AssaultPack_blk";	// used by divers
_baguav = "B_UAV_01_backpack_F";		// used by UAV operator

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "BWA3_MG4";
_ARmag = "BWA3_200Rnd_556x45";
_ARmag_tr = "BWA3_200Rnd_556x45";	// Mod doesn't have this

// Medium MG - Mod doesn't have this
_MMG = "BWA3_MG5";
_MMGmag = "BWA3_1200Rnd_762x51";
_MMGmag_tr = "BWA3_1200Rnd_762x51";	// Mod doesn't have this

// Rifleman AT
_RAT = "BWA3_RGW90";
_RATmag = "BWA3_RGW90_HH";

// Sniper
_SNrifle = "BWA3_G28_Standard";
_SNrifleMag = "BWA3_10Rnd_762x51_G28";

// Mortar
_MTR = "B_Mk6Mortar_Wpn";			// Mod doesn't have this
_MTRmount = "B_Mk6Mortar_Support";

// Medium AT
_MAT = "BWA3_Pzf3";
_MATmag = "BWA3_Pzf3_IT";

// Surface Air
_SAM = "BWA3_Fliegerfaust";
_SAMmag = "BWA3_Fliegerfaust_Mag";

// Engineer items - Mod doesn't have specific items
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ====================================================================================

// CLOTHES AND UNIFORMS

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform

_light = [];
_heavy =  ["eng","engm"];
_diver = ["div"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit
_baseUniform = ["BWA3_Uniform_Fleck","BWA3_Uniform3_Fleck"];
_baseHelmet = ["BWA3_M92_Fleck"];
_baseGlasses = ["BWA3_G_Combat_Clear"];

// Armored vests - Mod doesn't have different size vests, at least not designated as such
_lightRig = ["BWA3_Vest_Fleck"];
_mediumRig = ["BWA3_Vest_Rifleman1_Fleck"]; 	// default for all infantry classes
_heavyRig = ["BWA3_Vest_Rifleman1_Fleck"];

// Diver - Mod doesn't have diver equipment
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];	// Mod has no pilots
_pilotRig = ["V_TacVestIR_blk"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["BWA3_Uniform_Crew_Fleck"];
_crewHelmet = ["BWA3_CrewmanKSK_Fleck_Headset"];
_crewRig = ["BWA3_Vest_Fleck"];
_crewGlasses = ["BWA3_G_Combat_Clear"];

// Ghillie
_ghillieUniform = ["BWA3_Uniform3_Fleck"];
_ghillieHelmet = [];
_ghillieRig = ["BWA3_Vest_Marksman_Fleck"];
_ghillieGlasses = [];

// Spec Op
_sfuniform = ["BWA3_Uniform3_Fleck"];
_sfhelmet = ["BWA3_OpsCore_Fleck_Camera"];
_sfRig = ["BWA3_Vest_Marksman_Fleck"];
_sfGlasses = ["BWA3_G_Combat_Clear"];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

// HANDLE CLOTHES
// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons and backpacks

	removeBackpack _unit;
	removeallweapons _unit;

	// We add general first aid items
	_unit addItem _firstaid;

	// The following code removes any pre-added NVGs

	if("NVGoggles" in (assignedItems _unit)) then
	{
		_unit unassignItem "NVGoggles";
		_unit removeItem "NVGoggles";
	};

	// comment to remove nvgoogles
	_unit linkItem _nvg;					// add universal NVG for this faction

	//removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
	//_unit linkItem "ItemGPS"; 					// add gps to this faction
	//_unit linkItem "ItemMap";
	//_unit linkItem "ItemCompass";
	//_unit linkItem "ItemRadio";
	//_unit linkItem "ItemWatch";

};

// ====================================================================================

// SETUP BACKPACKS
// Include the correct backpack file for the faction

_backpack = {
	_typeofBackPack = _this select 0;
	switch (_typeofBackPack) do
	{
		#include "f_assignGear_bundeswehr_b.sqf";
	};
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "co":
	{
		
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Leader_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};

		_unit addWeapon _rifle;

		_unit addWeapon "BWA3_Vector";
		_unit linkItem "ItemGPS";
		["r"] call _backpack;
	};
	case "co2":
	{
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Leader_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};

		_unit addWeapon _rifle;

		_unit addWeapon "BWA3_Vector";
		_unit linkItem "ItemGPS";
		["r"] call _backpack;
	};
	
// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Leader_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};

		_unit addWeapon _rifle;

		_unit addWeapon "BWA3_Vector";
		_unit linkItem "ItemGPS";
		["r"] call _backpack;
	};

// LOADOUT: MEDIC
	case "m":
	{
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Medic_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToUniform _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		_unit addItemToVest _smokegrenadeorange;

		for "_i" from 1 to 2 do {_unit addItemToVest _carbinemag;};

		_unit addWeapon _carbine;

		["m"] call _backpack;
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Grenadier_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToVest _glriflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _glriflemag;};
		for "_i" from 1 to 6 do {_unit addItemToVest _glmag;};
		for "_i" from 1 to 2 do {_unit addItemToVest _glsmokewhite;};
		_unit addItemToVest "UGL_FlareWhite_F";
		_unit addItemToVest _glsmokered;
		_unit addItemToVest _glsmokegreen;

		_unit addWeapon _glrifle;

		_unit addWeapon "BWA3_Vector";
		_unit linkItem "ItemGPS";
		["g"] call _backpack;
	};


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Autorifleman_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 2 do {_unit addItemToVest _ARmag;};
		
		_unit addItemToVest "BWA3_DM32_Orange";
		_unit addItemToVest "BWA3_DM32_Yellow";

		_unit addWeapon _AR;

		["ar"] call _backpack;
	};

// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};
		_unit addItemToVest _armag;

		_unit addWeapon _rifle;

		_unit addWeapon "BWA3_Vector";
		["aar"] call _backpack;
	};

// LOADOUT: RIFLEMAN (AT)
	case "rat":
	{

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _carbinemag;};

		_unit addWeapon _carbine;

		["rat"] call _backpack;
		(unitBackpack _unit) addMagazineCargoGlobal [_RATmag,1];
		_unit addWeapon _RAT;
	};

// LOADOUT: MEDIUM MG GUNNER
	case "mmgg":
	{
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Autorifleman_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 2 do {_unit addItemToVest _pistolmag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 2 do {_unit addItemToVest _MMGmag;};
		
		_unit addItemToVest _smokegrenadeorange;
		_unit addItemToVest _smokegrenadeyellow;

		_unit addWeapon _MMG;
		_unit addWeapon _pistol;

		["mmg"] call _backpack;
	};

// LOADOUT: MEDIUM MG ASSISTANT GUNNER
	case "mmgag":
	{

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _carbinemag;};
		_unit addItemToVest _MMGmag;

		_unit addWeapon _carbine;

		_unit addWeapon "BWA3_Vector";
		["mmgag"] call _backpack;
	};

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		["matg"] call _backpack;

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _carbinemag;};
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag,2];

		_unit addWeapon _carbine;
		_unit addWeapon _MAT;

	};

// LOADOUT: MEDIUM AT ASSISTANT GUNNER
	case "matag":
	{

		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _carbinemag;};
		//(unitBackpack _unit) addMagazineCargoGlobal [_MATmag,2];

		_unit addWeapon _carbine;
		_unit addWeapon _MAT;

		_unit addWeapon "BWA3_Vector";
		["r"] call _backpack;
	};

// LOADOUT: SNIPER
	case "sn":
	{	
		
		for "_i" from 1 to 6 do {_unit addItemToVest _SNrifleMag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};

		for "_i" from 1 to 8 do {_unit addItemToVest _SNrifleMag;};
		for "_i" from 1 to 2 do {_unit addItemToVest _pistolmag;};
		_unit addItemToVest _smokegrenade;

		_unit addWeapon _SNrifle;
		_unit addWeapon _pistol;
		_attachments = [_scope3];
	};

// LOADOUT: SPOTTER
	case "sp":
	{
		
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest "BWA3_20Rnd_762x51_G28";};
		_unit addItemToUniform _smokegrenade;
		_unit addItemToUniform _glsmokewhite;

		for "_i" from 1 to 4 do {_unit addItemToVest "BWA3_20Rnd_762x51_G28";};
		for "_i" from 1 to 3 do {_unit addItemToVest _glmag;};
		for "_i" from 1 to 2 do {_unit addItemToVest "BWA3_10Rnd_762x51_G28_LR";};
		for "_i" from 1 to 3 do {_unit addItemToVest _SNrifleMag;};

		_unit addWeapon "BWA3_G27_AG";
	};

// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{

	};

// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{

	};

// LOADOUT: VEHICLE COMMANDER
	case "vc":
	{

		
		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: VEHICLE DRIVER
	case "vd":
	{

		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: VEHICLE GUNNER
	case "vg":
	{

		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: AIR VEHICLE PILOTS
	case "pp":
	{

		
		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: AIR VEHICLE CREW CHIEF
	case "pcc":
	{	
		
		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: AIR VEHICLE CREW
	case "pc":
	{

		for "_i" from 1 to 2 do {_unit addItemToVest _smokegrenade;};
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		_unit addItemToUniform _smokegrenadeorange;
		_unit addItemToUniform _smokegrenadeyellow;

		_unit addWeapon _smg;
		_unit linkItem "ItemGPS";
	};

// LOADOUT: ENGINEER (DEMO)
	case "eng":
	{
		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};
		_unit addItemToVest "ClaymoreDirectionalMine_Remote_Mag";
		_unit addItemToVest "MineDetector";
		
		

		_unit addWeapon _carbine;

		_unit addWeapon "BWA3_Vector";
		["eng"] call _backpack;
	};

// LOADOUT: ENGINEER (MINES)
	case "engm":
	{
		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};
		_unit addItemToVest "SLAMDirectionalMine_Wire_Mag";
		_unit addItemToVest "MineDetector";
		
		

		_unit addWeapon _carbine;

		_unit addWeapon "BWA3_Vector";
		["engm"] call _backpack;
	};

// LOADOUT: UAV OPERATOR
	case "uav":
	{	
		
		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _riflemag;};

		_unit addWeapon _rifle;

		_unit addWeapon "BWA3_Vector";
		_unit linkItem _uavterminal;
		["uav"] call _backpack;
	};

// LOADOUT: Diver
	case "div":
	{

		["div"] call _backpack;
	};

// LOADOUT: RIFLEMAN
	case "r":
	{
		for "_i" from 1 to 3 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 6 do {_unit addItemToVest _riflemag;};

		_unit addWeapon _rifle;

		_unit addWeapon "Rangefinder";
		["r"] call _backpack;
	};

// LOADOUT: CARABINEER
	case "car":
	{
		for "_i" from 1 to 3 do {_unit addItemToVest _carbinemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 6 do {_unit addItemToVest _carbinemag;};

		_unit addWeapon _carbine;

		_unit addWeapon "Rangefinder";
		["car"] call _backpack;
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		for "_i" from 1 to 3 do {_unit addItemToVest _smgmag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 6 do {_unit addItemToVest _smgmag;};

		_unit addWeapon _smg;

		_unit addWeapon "Rangefinder";
		["smg"] call _backpack;
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		_vestItems = vestItems _unit;
		removeVest _unit;
		_unit addVest "BWA3_Vest_Grenadier_Fleck";
		{_unit addItemToVest _x} forEach _vestItems;

		for "_i" from 1 to 3 do {_unit addItemToVest _glriflemag;};
		for "_i" from 1 to 2 do {_unit addItemToUniform _grenade;};
		_unit addItemToUniform _smokegrenade;

		for "_i" from 1 to 5 do {_unit addItemToVest _glriflemag;};
		for "_i" from 1 to 6 do {_unit addItemToVest _glmag;};
		for "_i" from 1 to 2 do {_unit addItemToVest _glsmokewhite;};
		_unit addItemToVest "UGL_FlareWhite_F";
		_unit addItemToVest _glsmokered;
		_unit addItemToVest _glsmokegreen;

		_unit addWeapon _glrifle;

		_unit addWeapon "Rangefinder";
		["g"] call _backpack;
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_matmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadeorange, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal [_firstaid,4];
		_unit addItemCargoGlobal [_medkit,2];
		_unit addItemCargoGlobal [_mor,4];
		_unit addItemCargoGlobal [_epi,4];
		_unit addItemCargoGlobal [_blood,2];
	};

// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_matmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addmagazineCargoGlobal [_mgrenade,12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadeorange, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
		_unit addItemCargoGlobal [_firstaid,8];
		_unit addItemCargoGlobal [_medkit,4];
		_unit addItemCargoGlobal [_mor,8];
		_unit addItemCargoGlobal [_epi,8];
		_unit addItemCargoGlobal [_blood,4];
	};

// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_matmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_mgrenade,8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadeorange, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal [_firstaid,6];
		_unit addItemCargoGlobal [_medkit,3];
		_unit addItemCargoGlobal [_mor,6];
		_unit addItemCargoGlobal [_epi,6];
		_unit addItemCargoGlobal [_blood,3];
	};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addmagazines [_riflemag,7];
		_unit addweapon _rifle;

		_unit selectweapon primaryweapon _unit;

		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================

// Handle weapon attachments
#include "f_assignGear_attachments.sqf";

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;