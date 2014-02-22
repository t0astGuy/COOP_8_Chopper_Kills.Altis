




if(isServer) then {
hint "server code";
//Zone Selection and Setup
_zoneCount = 23; //number of zones on the map that we can use
_num=floor(random _zoneCount); //fix random to give us a whole int
_activeZone = "marker_" + str _num; //select the actual zone

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







//hide the markers on the client
hint "calling marker";
_res =[[[_num,_zoneCount],"hideMarkers.sqf"],"BIS_fnc_execVM",BLUFOR,true] spawn BIS_fnc_MP;

waitUntil {scriptDone _res};


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



//Call the EOS Scipt to create the zone.
null = [[_activeZone],[0,0],[_numSquads,_squadSize],[0,0],[0,_numStaticWeapons,_numGunships,0],[0,2,3000,EAST]] call EOS_Spawn;




//if every zone is green then the mission is complete and end it
 while{true} do 
{
	 if (getMarkerColor _activeZone == "colorGreen") then 
	 {
		endMission "end2";
	};
sleep 5;
};

};






















//hide markers
//need extraction point

//add re-inforcements
//multiple ao's would be good.
//need to reset counters somewhere to avoid dupes. -- this may be fixed with the DeleteMarker above.