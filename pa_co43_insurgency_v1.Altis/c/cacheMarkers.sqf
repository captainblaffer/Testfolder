if (isnil "chMarkers") then {chMarkers = [[]];};
waituntil {sleep 5; (count allCaches > 0)};
private ["_radius","_mpos","_mname","_marker","_selectedC"];

if (count chMarkers < count allCaches) then {chMarkers pushBack [];};
_radius = 400;
_selectedC = (allCaches call BIS_fnc_selectRandom);

while {!alive _selectedC} do {
sleep 5;
_selectedC = (allCaches call BIS_fnc_selectRandom);
};
_mpos = getPos _selectedC;
_selectedC = allCaches find _selectedC;
if (count (chMarkers select _selectedC) > 0) then {_radius = _radius - 100};
if (count (chMarkers select _selectedC) > 1) then {_radius = _radius - 100};
if (count (chMarkers select _selectedC) > 2) then {_radius = _radius - 100};
if (count (chMarkers select _selectedC) > 3) then {_radius = _radius - 50};
if (count (chMarkers select _selectedC) > 4) then {_radius = _radius - 50};

_randomX = ((_radius*0.2) + (random (_radius*0.8))) * (sin (random 360));
_randomY = ((_radius*0.2) + (random (_radius*0.8))) * (cos (random 360));
_mpos = [((_mpos select 0) + _randomX),((_mpos select 1) + _randomY), (_mpos select 2)];

_mname = format ["mkr_c_%1-%2",_selectedC,(count (chMarkers select _selectedC))];
_marker = createMarker [_mname,_mpos];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_Dot";
_marker setMarkerColor "ColorRed";
_marker setMarkerText format ["%1m",_radius];

(chMarkers select _selectedC) pushBack _marker;