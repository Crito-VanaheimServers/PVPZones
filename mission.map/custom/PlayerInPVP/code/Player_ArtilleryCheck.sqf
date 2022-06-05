private ["_vehicle","_vehclassName","_artyResult"];

_vehicle = _this;
_vehclassName = typeOf _vehicle;
_artyResult = 0;

if (isNumber (configFile >> "CfgVehicles" >> _vehclassName >> "artilleryScanner")) then
{
	_artyResult = getNumber (configFile >> "CfgVehicles" >> _vehclassName >> "artilleryScanner");
};
_artyResult