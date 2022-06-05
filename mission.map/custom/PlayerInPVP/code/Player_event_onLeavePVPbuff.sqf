if !(PVPlayerInPVPbuff) exitWith { false };
PVPlayerInPVPbuff = false;
PlayerPVPbuffESPEventHandler = addMissionEventHandler ["Draw3D", {2000 call Player_PVPbuff_ESP}];
if (alive player) then 
{
	["PVE Name Tags Enabled"] spawn ExileClient_gui_baguette_show;
};
true