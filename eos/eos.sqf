EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
/* EOS 1.97 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[0,1],[0,1],[1,2],[2,1,0,0],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES, STATIC VEHICLES,HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,DISTANCE,SIDE]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=true;		// Counts killed units

_zoneCount = 21;
_num=floor(random _zoneCount);
_activeZone = "marker_" + str _num;
_zoneSize = getMarkerSize _activeZone;
_numSquads = floor(random 4) + 1;
_squadSize = floor(random 4) + 1;
_numStaticWeapons = floor(random 1);
_numGunships = floor(random 1);

if ((_zoneSize select 0 <= 100) or (_zoneSize select 1 <= 100)) then {
	_numSquads = floor(random 2) + 1;
	_squadSize = floor(random 2) + 1;
	_numGunships = 0;
	_numStaticWeapons = 0;
};

if ((_zoneSize select 0 >= 200) or (_zoneSize select 1 >= 200)) then {
	_numSquads = floor(random 3) + 2;
	_squadSize = floor(random 3) + 2;
	_numGunships = _numGunShips + 1;
	_numStaticWeapons = _numStaticWeapons + 1;
};

// make sure no attack choppers spawn at the air strip by filtering out the close places.
if (_num==10) then {
	_numGunships = 0;
};

if (f_var_debugMode == 1) then
{
	_num = 20;
	_activeZone = "marker_20";
	_numSquads = 1;
	_squadSize = 1;
	_numGunships = 0;
	_numStaticWeapons = 0;
	hint("DEBUG ON: Active zone is " + _activeZone);
};
null = [[_activeZone],[0,0],[_numSquads,_squadSize],[0,0],[0,_numStaticWeapons,_numGunships,0],[0,0,3000,EAST]] call EOS_Spawn;

for [{_i=0},{_i <= _zoneCount},{_i = _i + 1}] do {
	if (_i != _num) then {
		_toDelete = "marker_" + str _i;
		null = deleteMarkerLocal _toDelete;
	};
};

while{true} do {
	if (getMarkerColor _activeZone == "colorGreen") then {
		endMission "end2";
	};
	sleep 1;
};

//hide markers
//need extraction point
//randomize amount of infantry based on objective size.
//add re-inforcements
//multiple ao's would be good.
//need to reset counters somewhere to avoid dupes. -- this may be fixed with the DeleteMarker above.
