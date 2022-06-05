private ["_result","_PVPPlayerTerritoryFlags","_playerUID","_buildRights"];

_result = false;

{
	_PVPPlayerTerritoryFlags = (nearestObjects [(_x select 0), ["Exile_Construction_Flag_Static"],(_x select 1)]);
	{
		_playerUID = getPlayerUID player;
		_buildRights = _x getVariable [PVPAllowedStealType, []];
		if ((PVPlayerInPVPzone == true) && (_playerUID in _buildRights) && (getNumber(missionConfigFile >> 'CfgHacking' >> 'enableHacking') isEqualTo 1) && ('Exile_Item_Laptop' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1) && !ExilePlayerInSafezone) then 
		{
			_result = true;
		};
	}forEach _PVPPlayerTerritoryFlags;
}forEach PVPMarkerPositionsAndSize;
_result
