if ((random 10)>8.8) then {
_didIntel = _this getvariable "didIntel";
_this setvariable ["didIntel", true]; 
if (isnil "_didIntel") then {
_this setvariable ["didIntel", true]; 

_intel = createVehicle ["Land_Suitcase_F", [0,0,0], [], 0, "NONE"]; 
_intel setposatl (getposatl _this);
[[[_intel],"c\intelAddAction.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
//[-2, {
//(_this) addaction ["Pick up intel", "c\intelAction.sqf"];
//},_intel] call CBA_fnc_globalExecute;

[_intel] spawn {
sleep 900;
deleteVehicle (_this select 0);
};
};
};