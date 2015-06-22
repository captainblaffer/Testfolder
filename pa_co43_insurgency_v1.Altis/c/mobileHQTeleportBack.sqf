if (mobileHQ getvariable "deployed" == 1) then {
	disableUserInput true;
	cutText ["", "BLACK"];
	sleep 2;
	_this select 1 setpos getpos baseFlag;
	titleCut ["", "BLACK IN", 5];
	disableUserInput false;
	sleep 2;
} else {
	hintsilent "Mobile HQ is not deployed";
};