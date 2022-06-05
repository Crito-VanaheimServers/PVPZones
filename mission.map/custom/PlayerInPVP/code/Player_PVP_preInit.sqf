if (hasInterface) then
	{
		ExileClientPVPZoneVehicle = objNull;
		ExileClientPVEZoneVehicle = objNull;
		ExileClientPVPZoneHandleDamage = player addEventHandler ["HandleDamage", {_this call Player_PVE_HandleDamage}];
	};
true