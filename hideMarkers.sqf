_picked = _this select 0;
_zones = _this select 1;
_t =0;

if(true) then
{

hint "now in hide marker";

_s = format["PickedZone:%1",_picked];
player globalChat _s;
_s = format["ZoneNumber:%1",_zones];
//hint _s;


	for "_t" from 0 to _zones step 1 do 
	{
		if ( _t == _picked ) then
		{
		player globalChat "skipped";
		_s = format["SkippedZone:%1",_t];
		hint _s;
		_toDelete = "marker_" + str _t;
		_obj=_toDelete;
		_toDelete setMarkerAlpha 1;
		_t = _t+1;
		};
	_toDelete = "marker_" + str _t;
	//probably don't want to delete the zone as that my jack up the next script call instead set the alpha to 0
	_toDelete setMarkerAlpha 0;

	};
	
// currentTaska = player createSimpleTask ["Clear Town"];
// currentTaska setSimpleTaskDestination (_mPos = markerPos _obj);
// currentTaska setSimpleTaskDescription ["Clear Town","Clear Town","Clear"];
// currentTaska setTaskState "Assigned";
};