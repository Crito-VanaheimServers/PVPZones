if !(PVPlayerInPVPBuff) then 
{
	if ((getPosATL (vehicle player)) call Player_isInPVPbuff) then 
	{
		[] call Player_event_onEnterPVPbuff;
	};
	PlayerLastPVPbuffCheckAt = diag_tickTime;
}
else 
{
	if (diag_tickTime - PlayerLastPVPbuffCheckAt >= 15) then
	{
		if !((vehicle player) call Player_isInPVPbuff) then 
		{
			[] call Player_event_onLeavePVPbuff;
		};
		PlayerLastPVPbuffCheckAt = diag_tickTime;
	};
};