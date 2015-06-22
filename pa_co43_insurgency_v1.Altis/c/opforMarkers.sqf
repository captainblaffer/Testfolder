private ["_OGuy","_OguyCurAI","_mname","_mkr"];
_OGuy = _this;
_OguyCurAI = (_OGuy getvariable "curAI");
_mname = format ["mkr_%1",_OGuy];
_mkr = createMarkerLocal [_mname,[(getPos _OguyCurAI select 0),(getPos _OguyCurAI select 1)]];
_mname setMarkerShapeLocal "ICON";
_mname setMarkerTypeLocal "o_inf";
_mname setMarkerColorLocal "ColorGreen";
//_mname setMarkerSizeLocal [0.5, 0.5];
_mname setMarkerTextLocal str _OguyCurAI;
while {!isnil "_OGuy"} do{
	_OguyCurAI = (_OGuy getvariable "curAI");
	_mname setMarkerPosLocal [(getPos _OguyCurAI select 0),(getPos  _OguyCurAI select 1)];
	_mname setMarkerTextLocal str _OguyCurAI;
sleep 10;
};

waituntil {sleep 30; !isnil "_OGuy"};
waituntil {sleep 5; !isnull (_OGuy getvariable "curAI")};
_OGuy execVM "c\opforMarkers.sqf";