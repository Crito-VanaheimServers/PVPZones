private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	['Player_PVP_preInit', 'custom\PlayerInPVP\code\Player_PVP_preInit.sqf', true],
	['Player_PVP_postInit', 'custom\PlayerInPVP\code\Player_PVP_postInit.sqf', false],
	['PVP_Map_Marker', 'custom\PlayerInPVP\code\PVP_Map_Marker.sqf', false],
	['Player_PVPZone_Check', 'custom\PlayerInPVP\code\Player_PVPZone_Check.sqf', false],
	['Player_event_onEnterPVPZone', 'custom\PlayerInPVP\code\Player_event_onEnterPVPZone.sqf', false],
	['Player_isInPVPZone', 'custom\PlayerInPVP\code\Player_isInPVPZone.sqf', false],
	['Player_event_onLeavePVPZone', 'custom\PlayerInPVP\code\Player_event_onLeavePVPZone.sqf', false],
	['Player_event_onEnterPVPbuff', 'custom\PlayerInPVP\code\Player_event_onEnterPVPbuff.sqf', false],
	['Player_isInPVPbuff', 'custom\PlayerInPVP\code\Player_isInPVPbuff.sqf', false],
	['Player_event_onLeavePVPbuff', 'custom\PlayerInPVP\code\Player_event_onLeavePVPbuff.sqf', false],
	['Player_PVPbuff_ESP', 'custom\PlayerInPVP\code\Player_PVPbuff_ESP.sqf', false],
	['Player_PVPbuff_Check', 'custom\PlayerInPVP\code\Player_PVPbuff_Check.sqf', false],
	['Player_event_onFiredZoneVehicle', 'custom\PlayerInPVP\code\Player_event_onFiredZoneVehicle.sqf', false],
	['Player_thread_PVE_PVP', 'custom\PlayerInPVP\code\Player_thread_PVE_PVP.sqf', false],
	['Player_PVE_HandleDamage', 'custom\PlayerInPVP\code\Player_PVE_HandleDamage.sqf', false],
	['FlagSteal_PVP_Condition', 'custom\PlayerInPVP\code\FlagSteal_PVP_Condition.sqf', false],
	['ScanLock_PVP_Condition', 'custom\PlayerInPVP\code\ScanLock_PVP_Condition.sqf', false],
	['HotWire_PVP_Condition', 'custom\PlayerInPVP\code\HotWire_PVP_Condition.sqf', false],
	['HackLock_PVP_Condition', 'custom\PlayerInPVP\code\HackLock_PVP_Condition.sqf', false],
	['GrindLock_PVP_Condition', 'custom\PlayerInPVP\code\GrindLock_PVP_Condition.sqf', false],
	['PlantCharge_PVP_Condition', 'custom\PlayerInPVP\code\PlantCharge_PVP_Condition.sqf', false],
	['Player_thread_PVP_PVE', 'custom\PlayerInPVP\code\Player_thread_PVP_PVE.sqf', false],
	['Player_ArtilleryCheck', 'custom\PlayerInPVP\code\Player_ArtilleryCheck.sqf', false]

];

call Player_PVP_preInit;

true