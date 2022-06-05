private["_PVPposition", "_PVPresult", "_PVPbuffres"];
_PVPposition = _this;
_PVPresult = false;

{
	if (((_x select 0) distance2D _PVPposition) < (_x select 1)) exitWith
	{
		_PVPresult = true;
	};
}
forEach PVPMarkerPositionsAndSize;
_PVPresult