private["_vehicle"];

if (PVPlayerInPVPzone) exitWith {false}; 
_vehicle = vehicle player;

if (_vehicle isEqualTo player) then 
{
	if !(isNull ExileClientPVEZoneVehicle) then
	{

		if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
		{
				ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];
				ExileClientPVEZoneVehicleFiredEventHandler = nil;
		};	
		
		if (ExileClientPVEZoneVehicle isKindOf "Air") then
		{
				ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];
				ExileClientPVEZoneVehicleFiredEventHandler = nil;
		};	

		ExileClientPVEZoneVehicle = objNull;
	};
}
else 
{
	if !(_vehicle isEqualTo ExileClientPVEZoneVehicle) then 
	{
		if !(isNull ExileClientPVEZoneVehicle) then 
		{
			if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
			{
					ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];	
					ExileClientPVEZoneVehicleFiredEventHandler = nil;
			};
			
			if (_vehicle isKindOf "Air") then
			{
					ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];	
					ExileClientPVEZoneVehicleFiredEventHandler = nil;
			};
		
			ExileClientPVEZoneVehicle = objNull;
		};
		
		ExileClientPVEZoneVehicle = _vehicle;
	
		if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
		{
			ExileClientPVEZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
		};
		
		if (_vehicle isKindOf "Air") then
		{
			ExileClientPVEZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
		};
	};
};
true
