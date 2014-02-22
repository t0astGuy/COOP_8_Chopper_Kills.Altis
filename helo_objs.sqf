





//Zone Selection and Setup
_zoneCount = 21; //number of zones on the map that we can use
_num=floor(random _zoneCount); //fix random to give us a whole int
_activeZone = "marker_" + str _num; //select the actual zone



//Difficulty Settings
_zoneSize = getMarkerSize _activeZone; //get the size of the zone to scale difficulty
_numSquads = floor(random 4) + 1; //randomize difficulty based on scaling
_squadSize = floor(random 4) + 1; //randomize difficulty based on scaling
_numStaticWeapons = floor(random 1); //randomize difficulty based on scaling
_numGunships = floor(random 1); //randomize difficulty based on scaling





//randomize amount of infantry based on objective size.
if ((_zoneSize select 0 <= 100) or (_zoneSize select 1 <= 100)) then {
	_numSquads = floor(random 2) + 1;
	_squadSize = floor(random 2) + 1;
	_numGunships = 0;
	_numStaticWeapons = 0;
};


if ((_zoneSize select 0 > 100 && _zoneSize select 0 < 200 ) or (_zoneSize select 1 <= 100)) then {
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

//debug mode sets everything easy and shows what zone is active in order to test end of mission scripts.
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

//Call the EOS Scipt to create the zone.
null = [[_activeZone],[0,0],[_numSquads,_squadSize],[0,0],[0,_numStaticWeapons,_numGunships,0],[0,0,3000,EAST]] call EOS_Spawn;




//Hide all the zones that we don't activate.
for [{_i=0},{_i <= _zoneCount},{_i = _i + 1}] do {
	if (_i != _num) then {
		_toDelete = "marker_" + str _i;
		
		//probably don't want to delete the zone as that my jack up the next script call instead set the alpha to 0
		_toDelete setMarkerAlpha 0;
		//null = deleteMarkerLocal _toDelete;
	};
};


//if every zone is green then the mission is complete and end it
while{true} do {
	if (getMarkerColor _activeZone == "colorGreen") then {
		endMission "end2";
	};
	sleep 1;
};

//hide markers
//need extraction point

//add re-inforcements
//multiple ao's would be good.
//need to reset counters somewhere to avoid dupes. -- this may be fixed with the DeleteMarker above.