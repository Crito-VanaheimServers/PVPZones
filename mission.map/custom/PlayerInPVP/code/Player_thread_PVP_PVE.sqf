private["_vehicle","_mags","_magazineName","_turretPath","_ammoCount"];

if !(PVPlayerInPVPzone) exitWith {false}; 
_vehicle = vehicle player;
if (_vehicle isEqualTo player) then 
{
	if !(isNull ExileClientPVPZoneVehicle) then
	{
		if (ExileClientPVPZoneVehicle isKindOf "AIR") then
		{
			if !(isNil "pvpVehicleAmmoArray") then
			{
				{
				_magazineName = _x select 0;
				_turretPath = _x select 1;
				_ammoCount = _x select 2;
				ExileClientPVPZoneVehicle addMagazineTurret [_magazineName, _turretPath, _ammoCount];
				}forEach pvpVehicleAmmoArray;
				
				pvpVehicleAmmoArray = nil;
			};
			
				ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];
				ExileClientPVPZoneVehicleFiredEventHandler = nil;
		};

		if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
		{
				ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];
				ExileClientPVPZoneVehicleFiredEventHandler = nil;
		};	

		ExileClientPVPZoneVehicle = objNull;
	};
}
else 
{
	if !(_vehicle isEqualTo ExileClientPVPZoneVehicle) then 
	{
		if !(isNull ExileClientPVPZoneVehicle) then 
		{
			if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
			{
					ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];	
					ExileClientPVPZoneVehicleFiredEventHandler = nil;
			};
			
			if (ExileClientPVPZoneVehicle isKindOf "AIR") then
			{
				if !(isNil "pvpVehicleAmmoArray") then
				{
					{
					_magazineName = _x select 0;
					_turretPath = _x select 1;
					_ammoCount = _x select 2;
					ExileClientPVPZoneVehicle addMagazineTurret [_magazineName, _turretPath, _ammoCount];
					}forEach pvpVehicleAmmoArray;
					
					pvpVehicleAmmoArray = nil;
				};

					ExileClientPVPZoneVehicle removeEventHandler ["Fired", ExileClientPVPZoneVehicleFiredEventHandler];	
					ExileClientPVPZoneVehicleFiredEventHandler = nil;
			};

			ExileClientPVPZoneVehicle = objNull;
		};
		ExileClientPVPZoneVehicle = _vehicle;
		
		if (isNil "pvpVehicleAmmoArray") then
		{

			if (ExileClientPVPZoneVehicle isKindOf "AIR") then
			{
				_ammoArray = [];
				
				_mags = magazinesAllTurrets [ExileClientPVPZoneVehicle, true];
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
				//_ammoArray = _ammoArray - _elementsDelete;
				//_vehicle setVariable ["ammoArray", _mags, true];
				pvpVehicleAmmoArray = _mags;

				{
				ExileClientPVPZoneVehicle removeMagazines _x;
				}forEach _ammoArray;
			};
		};

		if ((((vehicle player) call Player_ArtilleryCheck) > 0) || (typeof _vehicle in blockArtillaryList)) then
		{
				ExileClientPVPZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call Player_event_onFiredZoneVehicle}];
		};
	};
};
true
