private ["_result","_PVPPlayerTerritoryFlags","_playerUID","_buildRights"];

_result = false;

{
	_PVPPlayerTerritoryFlags = (nearestObjects [(_x select 0), ["Exile_Construction_Flag_Static"],(_x select 1)]);
	{
		_playerUID = getPlayerUID player;
		_buildRights = _x getVariable [PVPAllowedStealType, []];
		if ((PVPlayerInPVPzone == true) && (_playerUID in _buildRights)) then 
		{
			_result = call ExileClient_system_breaching_condition;
		};
	}forEach _PVPPlayerTerritoryFlags;
}forEach PVPMarkerPositionsAndSize;
_result
