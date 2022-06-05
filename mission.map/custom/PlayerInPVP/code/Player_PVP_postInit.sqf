private ["_pvpScriptStart"];

if (hasInterface) then
{
	_pvpScriptStart = diag_tickTime;
	[] call PVP_Map_Marker;
	if (!isServer) then 
	{
		waitUntil {(diag_tickTime - _pvpScriptStart >= 30)};
		{
			if (((_x select 0) distance2D (vehicle player)) < (_x select 1)) then
			{
				PVPlayerInPVPzone = false;
			}
			else
			{
				PVPlayerInPVPzone = true;
			};
		}forEach PVPMarkerPositionsAndSize;
		
		{
			if (((_x select 0) distance2D (vehicle player)) < (_x select 1)) then
			{
				PVPlayerInPVPBuff = false;
			}
			else
			{
				PVPlayerInPVPBuff = true;
			};
		}forEach PVPbuffMarkerPositionsAndSize;

			PlayerLastPVPbuffCheckAt = diag_tickTime;
			PlayerLastPVPZoneCheckAt = diag_tickTime;
			[5, Player_PVPZone_Check, [], true] call ExileClient_system_thread_addtask;
			[5, Player_PVPbuff_Check, [], true] call ExileClient_system_thread_addtask;
	};
};
true