//Ammobox.sqf
//clothing crate arma 3 
//Author's: =DWT= & Hashsix
// Crates Init : nul = [this] execVM "ammobox.sqf";

if (! isServer) exitWith {};


_crate = _this select 0;




if (isServer) then 
{


clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearbackpackcargoGlobal _crate;

//*Uniforms 
_crate addItemCargoGlobal ["_classname",50];

//*Vests
_crate addItemCargoGlobal ["_classname",10];

//*Helmets
_crate addItemCargoGlobal ["_classname",10];

//*Backpack
_crate addbackpackcargoGlobal ["_classname",20];

//*Items 
_crate addItemCargoGlobal ["_classname", 50];

//*Magazine
_crate addMagazineCargoGlobal ["_classname", 50];

//*Weapon
_crate addWeaponCargoGlobal ["_classname", 50];
};





