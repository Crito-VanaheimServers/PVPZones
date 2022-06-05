private["_vehicle","_ammoArray","_mags","_ammoType","_elementsDelete"];

if (PVPlayerInPVPzone) exitWith { false };

if !(alive player) exitWith { false };
PVPlayerInPVPzone = true;

if !(isNil "ExileClientPVEZoneUpdateThreadHandle") then 
{
	[ExileClientPVEZoneUpdateThreadHandle] call ExileClient_system_thread_removeTask;
	ExileClientPVEZoneUpdateThreadHandle = nil;
};

player allowDamage true;
player removeEventHandler ["HandleDamage", ExileClientPVPZoneHandleDamage];
ExileClientPVPZoneHandleDamage = player addEventHandler ["HandleDamage", {_this call Player_PVE_HandleDamage}];

_vehicle = vehicle player;

if !(_vehicle isEqualTo player) then 
{	
	if (_vehicle isKindOf "AIR") then
	{
		if !(isNull ExileClientPVEZoneVehicle) then
		{
				ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];	
				ExileClientPVEZoneVehicleFiredEventHandler = nil;
				ExileClientPVEZoneVehicle = objNull;
		};
		
		_ammoArray = [];
		
		_mags = magazinesAllTurrets [_vehicle, true];
			{
				_ammoType = _x select 0;
				_ammoArray pushBack _ammoType;
			}forEach _mags;
		_ammoArray = _ammoArray arrayIntersect _ammoArray;
		_elementsDelete = [	
							"Laserbatteries",
							"rhs_LaserMag",
							"rhs_LaserFCSMag",
							"rhs_LaserMag_ai",
							"120Rnd_CMFlare_Chaff_Magazine",
							"240Rnd_CMFlare_Chaff_Magazine",
							"168Rnd_CMFlare_Chaff_Magazine",
							"rhs_BVP3026_CMFlare_Chaff_Magazine_x2",
							"FIR_240rnd_CMFlare_Chaff_Magazine",
							"rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2",
							"rhs_ASO2_CMFlare_Chaff_Magazine_x4",
							"rhsusf_ANALE40_CMFlare_Magazine_x2",
							"FIR_480rnd_CMFlare_Chaff_Magazine",
							"FIR_160rnd_CMFlare_Chaff_Magazine",
							"rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16",
							"rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4",
							"rhs_ASO2_CMFlare_Chaff_Magazine_x6",
							"2000Rnd_65x39_Belt_Tracer_Red",
							"rhs_mag_762x51_M240_200_M80",
							"rhs_mag_M151_19",							//RHS_AH64D_wd		
							"100Rnd_127x99_mag_Tracer_Red",
							"ffaa_762x51_mg3",
							"rhsusf_mag_DIRCM",							//RHS_AH64D_wd
							"rhsusf_M130_CMFlare_Chaff_Magazine_x8",
							"rhs_mag_762x51_m80a1_4000",
							"rhsusf_M130_CMFlare_Chaff_Magazine_x2",
							"rhsusf_mag_LWIRCM",							//RHS_MELB_AH6M
							"rhsusf_ANALE39_CMFlare_Chaff_Magazine_x2",
							"rhs_mag_300rnd_127x99_mag_Tracer_Red",
							"rhsusf_ANALE39_CMFlare_Chaff_Magazine_x4",
							"rhs_mag_762x54mm_100",
							"rhs_UV26_CMFlare_Chaff_Magazine_x4",
							"192Rnd_CMFlare_Chaff_Magazine"
						];
		{
			_ammoArray deleteAt (_ammoArray find _x);
		}forEach _elementsDelete;
		pvpVehicleAmmoArray = _mags;
		
		{
		_vehicle removeMagazines _x;
		}forEach _ammoArray;

		ExileClientPVPZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
	};
	
	if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
	{
		if !(isNull ExileClientPVEZoneVehicle) then
		{
				ExileClientPVEZoneVehicle removeEventHandler ["Fired", ExileClientPVEZoneVehicleFiredEventHandler];	
				ExileClientPVEZoneVehicleFiredEventHandler = nil;
				ExileClientPVEZoneVehicle = objNull;
		};

		ExileClientPVPZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
	};
	
	if !(isNull ExileClientPVEZoneVehicle) then
	{
		ExileClientPVPZoneVehicle = objNull;
	};

	ExileClientPVPZoneVehicle = _vehicle;
};

ExileClientPVPZoneUpdateThreadHandle = [1, Player_thread_PVP_PVE, [], true] call ExileClient_system_thread_addtask;

["PVP MODE ENABLED."] spawn ExileClient_gui_baguette_show;
true

