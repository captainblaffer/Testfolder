//Written by beta
//Ideas from Sandiford
//Does not allow a player to leave the AO


private ["_sleep", "_pos", "_aoPos", "_player"];

sleep 25;  //wait until mission starts

_pos = [0,0,0];
_aoPos = [(getmarkerpos"mkr_nogo3") select 0, (getmarkerpos"mkr_nogo3") select 1, 0]; 
//_aoPos_wrn = [(getmarkerpos"mkr_nogo3_wrn") select 0, (getmarkerpos"mkr_nogo3_wrn") select 1, 0]; 
_sleep = 10.0;

while {true} do
{
	_player = vehicle player;
	
	
	if (mobileHQ getvariable "deployed" == 1) then
	{
		if ((getPosATL _player) distance (GetposATL mobileHQ) < 75) then
		{
			hintSilent "You are not allowed to get near NATO MHQ";
			_pos = [getPos _player, 5, ([_aoPos,_player] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
			_player setPos _pos;
			_sleep = 0.05;
		}
		else
		{
			_sleep = 10.0;
		};
	};
	
	sleep _sleep;
};
