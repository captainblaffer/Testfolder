[]spawn{
waituntil {!isnil "Wtickets";};
[["c\Wticketloss.sqf"],"BIS_fnc_execVM",false] call BIS_fnc_MP;
sleep ((getNumber (missionconfigfile >> "RespawnDelay")) + 1);
waitUntil {sleep 0.2; alive player};
hintsilent format ["Tickets remaining: %1\n\nYour radio channel is reset\n\nUse base flag teleport to get back into action",Wtickets];

[player getvariable "f_var_assignGear",player] call f_fnc_assignGear; 

player addRating 100000;

[] execVM "f\radios\radio_init.sqf";

[] execVM "f\medical\medical_init.sqf";

lastSquadTP = time;
};

_deadplayer = (_this select 0);

{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_deadplayer unlinkItem _x}; } foreach items _deadplayer;
{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_deadplayer unlinkItem _x}; } foreach assignedItems _deadplayer;

_hasLR = call TFAR_fnc_haveLRRadio;
if (_hasLR) then {
    _backpackItems = backpackItems _deadplayer;
    removeBackpack _deadplayer;
    _deadplayer addBackpack "B_AssaultPack_mcamo";
   {(backpackContainer _deadplayer) addItemCargoGlobal [_x,1]} forEach _backpackItems;
};