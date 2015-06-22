// DEFINE BACKPACK CONTENTS
// The following blocks of code define different backpack loadouts. These are then
// called from the role loadouts.

// BACKPACK: MEDIC
case "m":
{
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 10];
	};
};

// BACKPACK: GRENADIER (CO/DC/SL/FTL/G)
case "g":
{
	// NO BACKPACKi
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 10];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
};

// BACKPACK: AR
case "ar":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];

	};
};

// BACKPACK: AAR
case "aar":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 4];
	};
};

// BACKPACK: RIFLEMAN AT (RAT)
case "rat":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];

	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 10];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 1];
	};
};

// BACKPACK: RIFLEMAN (R)
case "r":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 10];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
};

// BACKPACK: CARABINEER (CAR)
case "car":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
};

// BACKPACK: MMG GUNNER (MMG)
case "mmg":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;

		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
};

// BACKPACK: MMG ASSISTANT GUNNER (MMGAG)
case "mmgag":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 4];
	};
};

// BACKPACK: MAT GUNNER (MATG)
case "matg":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);


		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
		// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag, 1];
	};
};

// BACKPACK: MAT ASSISTANT (MATAG)
case "matag":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag, 3];
	};
};

// BACKPACK: ENGINEER (DEMO)
case "eng":
{
	// NO BACKPACK (STILL ADD SMALL FOR TOOLKIT)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal [_satchel,2];

	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal [_satchel,2];
		(unitBackpack _unit) addItemCargoGlobal ["DemoCharge_Remote_Mag",2];

	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal [_satchel,3];
		(unitBackpack _unit) addItemCargoGlobal ["DemoCharge_Remote_Mag",4];
	};
};

// BACKPACK: ENGINEER (MINES)
case "engm":
{
	// NO BACKPACK (STILL ADD SMALL FOR TOOLKIT)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal ["ATMine_Range_Mag",2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal ["ATMine_Range_Mag",2];
		(unitBackpack _unit) addItemCargoGlobal ["APERSMine_Range_Mag",1];
		(unitBackpack _unit) addItemCargoGlobal ["APERSBoundingMine_Range_Mag",1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addItemCargoGlobal ["ATMine_Range_Mag",3];
		(unitBackpack _unit) addItemCargoGlobal ["APERSMine_Range_Mag",2];
		(unitBackpack _unit) addItemCargoGlobal ["APERSBoundingMine_Range_Mag",2];
	};
};

// BACKPACK: SUBMACHINEGUNNER (SMG)
case "smg":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 5];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);

		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 10];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeorange, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeyellow, 1];
	};
};

// BACKPACK: DIVER (DIV)
case "div":
{
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmediumdiver;
		clearMagazineCargoGlobal (unitBackpack _unit);

	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmediumdiver;
		clearMagazineCargoGlobal (unitBackpack _unit);

	};
};

// BACKPACK: UAV
case "uav":
{
	_unit addBackpack _baguav;
};