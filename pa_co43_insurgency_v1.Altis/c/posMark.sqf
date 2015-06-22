//nul = this execVM "c\posMark.sqf";

_mname = format ["mrk_%1",_this];
_marker = createMarker [_mname,(position (_this))];
_marker setMarkerShape "ICON";
_mname setMarkerType "mil_dot";

while {alive _this} do {
sleep 5;
_mname setmarkerpos (position (_this));
};
deletemarker _mname;