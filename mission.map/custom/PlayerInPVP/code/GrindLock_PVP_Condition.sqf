private ["_result","_PVPPlayerTerritoryFlags","_playerUID","_buildRights"];

_result = false;

{
	_PVPPlayerTerritoryFlags = (nearestObjects [(_x select 0), ["Exile_Construction_Flag_Static"],(_x select 1)]);
	{
		_playerUID = getPlayerUID player;
		_buildRights = _x getVariable [PVPAllowedStealType, []];
		if ((PVPlayerInPVPzone == true) && (_playerUID in _buildRights) && (getNumber(missionConfigFile >> 'CfgGrinding' >> 'enableGrinding') isEqualTo 1) && ('Exile_Item_Grinder' in (magazines player)) && ('Exile_Magazine_Battery' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1) && ((ExileClientInteractionObject animationPhase 'DoorRotation') < 0.5)) then 
		{
			_result = true;
		};
	}forEach _PVPPlayerTerritoryFlags;
}forEach PVPMarkerPositionsAndSize;
_result
