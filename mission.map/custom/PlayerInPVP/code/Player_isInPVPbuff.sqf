private["_PVPbuffpos", "_PVPbuffres"];
_PVPbuffpos = _this;
_PVPbuffres = false;
{
	if (((_x select 0) distance2D _PVPbuffpos) < (_x select 1)) exitWith
	{
		_PVPbuffres = true;
	};
}
forEach PVPbuffMarkerPositionsAndSize;
_PVPbuffres