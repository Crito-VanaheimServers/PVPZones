private["_unit","_ammo","_projectile"];
_unit = _this select 0;
_ammo = _this select 4;
_projectile = _this select 6;

	[_projectile] execVM "custom\PlayerInPVP\code\DeleteProjectile.sqf";
