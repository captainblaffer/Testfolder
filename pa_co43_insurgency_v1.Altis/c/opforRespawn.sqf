//private ["_newPlayer"];

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

//_newPlayer = _this select 0;
//disableuserinput true;
//hintsilent "User input disabled";
sleep ((getNumber (missionconfigfile >> "RespawnDelay")) + 0.1);
player setVariable ["ACE_CanSwitchUnits", false];		
hintsilent "In 180 seconds, open map and click on AI to control them";
sleep 60;
hintsilent "In 120 seconds, open map and click on AI to control them";
sleep 60;
hintsilent "In 60 seconds, open map and click on AI to control them";
sleep 60;
hint "open map and click on AI to control them";
//disableuserinput false;
player setVariable ["ACE_CanSwitchUnits", true];	