private ["_projectile","_vehicle"];

_projectile = _this select 0;
_vehicle = vehicle player;

	while {!(isNull _projectile)} do
	{
		{
			if (((_x select 0) distance2D _projectile) < (_x select 1)) then
			{
						deleteVehicle _projectile;
			};
		}forEach PVPMarkerPositionsAndSize;
		sleep .5;
	};