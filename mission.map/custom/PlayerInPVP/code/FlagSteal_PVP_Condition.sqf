private ["_result","_PVPPlayerTerritoryFlags","_playerUID","_buildRights"];

_result = false;

{
	_PVPPlayerTerritoryFlags = (nearestObjects [(_x select 0), ["Exile_Construction_Flag_Static"],(_x select 1)]);
	{
		_playerUID = getPlayerUID player;
		_buildRights = _x getVariable [PVPAllowedStealType, []];
		if ((PVPlayerInPVPzone == true) && (_playerUID in _buildRights) && ((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0)) then 
		{
			_result = true;
		};
	}forEach _PVPPlayerTerritoryFlags;
}forEach PVPMarkerPositionsAndSize;
_result

