if !(PVPlayerInPVPzone) then 
{
		if ((getPosATL (vehicle player)) call Player_isInPVPZone) then 
		{
			[] call Player_event_onEnterPVPZone;
		};
		PlayerLastPVPZoneCheckAt = diag_tickTime;
}
else 
{
	if (diag_tickTime - PlayerLastPVPZoneCheckAt >= 15) then
	{
		if !((vehicle player) call Player_isInPVPZone) then 
		{
			[] call Player_event_onLeavePVPZone;
		};
		PlayerLastPVPZoneCheckAt = diag_tickTime;
	};
};