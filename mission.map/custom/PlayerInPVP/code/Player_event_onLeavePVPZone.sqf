private["_vehicle","_mags","_magazineName","_turretPath","_ammoCount"];

if !(PVPlayerInPVPzone) exitWith { false };
PVPlayerInPVPzone = false;
player allowDamage true;
player removeEventHandler ["HandleDamage", ExileClientPVPZoneHandleDamage];
ExileClientPVPZoneHandleDamage = player addEventHandler ["HandleDamage", {_this call Player_PVE_HandleDamage}];

if !(isNil "ExileClientPVPZoneUpdateThreadHandle") then 
{
	[ExileClientPVPZoneUpdateThreadHandle] call ExileClient_system_thread_removeTask;
	ExileClientPVPZoneUpdateThreadHandle = nil;
};

_vehicle = vehicle player;

if !(_vehicle isEqualTo player) then 
{	
	if (_vehicle isKindOf "AIR") then
	{
		//_mags = _vehicle getVariable "ammoArray";
		
		{
			_magazineName = _x select 0;
			_turretPath = _x select 1;
			_ammoCount = _x select 2;
			_vehicle addMagazineTurret [_magazineName, _turretPath, _ammoCount];
		}forEach pvpVehicleAmmoArray;
			
		pvpVehicleAmmoArray = nil;
		
		if !(isNull ExileClientPVPZoneVehicle) then
		{
				ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];
				ExileClientPVPZoneVehicleFiredEventHandler = nil;
				ExileClientPVPZoneVehicle = objNull;
		};
		ExileClientPVEZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
	};
	
	if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
	{
		if !(isNull ExileClientPVPZoneVehicle) then
		{
				ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];
				ExileClientPVPZoneVehicleFiredEventHandler = nil;
				ExileClientPVPZoneVehicle = objNull;
		};
		ExileClientPVEZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
	};
		
	if !(isNull ExileClientPVPZoneVehicle) then
	{
		ExileClientPVPZoneVehicle = objNull;
	};

	ExileClientPVEZoneVehicle = _vehicle;
};

ExileClientPVEZoneUpdateThreadHandle = [1, Player_thread_PVE_PVP, [], true] call ExileClient_system_thread_addtask;


if (alive player) then 
{
	["PVE MODE ENABLED."] spawn ExileClient_gui_baguette_show;
};
true