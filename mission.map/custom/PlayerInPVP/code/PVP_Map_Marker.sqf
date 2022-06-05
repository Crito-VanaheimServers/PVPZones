PVPMarkerPositions = [];
PVPMarkerPositionsAndSize = [];
PVPbuffMarkerPositions = [];
PVPbuffMarkerPositionsAndSize = [];
{
	switch (getMarkerType _x) do 
	{
		case "PVPZone":
		{
			PVPMarkerPositions pushBack (getMarkerPos _x);
			PVPMarkerPositionsAndSize pushBack 
			[
				getMarkerPos _x, 
				(getMarkerSize _x) select 0
			];
		};
		case "PVPbuff": 
		{
			PVPbuffMarkerPositions pushBack (getMarkerPos _x);
			PVPbuffMarkerPositionsAndSize pushBack 
			[
				getMarkerPos _x, 
				(getMarkerSize _x) select 0
			];
		};
	};
}
forEach allMapMarkers;