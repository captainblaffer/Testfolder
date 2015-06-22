private ["_disX","_disY","_targetPos"];

if (mobileHQ getvariable "deployed" == 1) then {
if (mobileHQ emptyPositions "cargo" == 0) then {
	disableUserInput true;
	cutText ["", "BLACK"];
	sleep 2;
		_targetPos = getpos mobileHQ;
		//_disX = [cos(_direction)*(_displacement select 0), -1* sin(_direction)*(_displacement select 0), 0];
		_disY = [cos(getdir mobileHQ - 90)*-6, -1* sin(getdir mobileHQ - 90)*-6, 0];
		//_targetPos = _targetPos vectorAdd _disX;
		_targetPos = getpos mobileHQ vectorAdd _disY;
		_this select 1 setpos _targetPos;
	titleCut ["", "BLACK IN", 5];
	disableUserInput false;
} else {
	disableUserInput true;
	cutText ["", "BLACK FADED"];
	_this select 1 moveincargo (vehicle mobileHQ);
	sleep 0.5;
	titleCut ["", "BLACK IN", 5];
	disableUserInput false;
	sleep 2;
	moveOut (_this select 1);
};
} else {
	hintsilent "Mobile HQ is not deployed";
};