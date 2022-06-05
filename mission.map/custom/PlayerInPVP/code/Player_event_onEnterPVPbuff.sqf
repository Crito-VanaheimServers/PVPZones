if (PVPlayerInPVPbuff) exitWith { false };
if !(alive player) exitWith { false };
PVPlayerInPVPbuff = true;

if !(isNil "PlayerPVPbuffESPEventHandler") then 
{
	removeMissionEventHandler ["Draw3D", PlayerPVPbuffESPEventHandler];
	PlayerPVPbuffESPEventHandler = nil;
};
["PVP Buffer Name Tags Disabled"] spawn ExileClient_gui_baguette_show;
true