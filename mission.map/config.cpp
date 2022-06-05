
class CfgExileCustomCode 
{
	//Safe Zone Damage EvenHandler for PVE/PVP
	ExileClient_object_player_event_onLeaveSafezone = "custom\PlayerInPVP\code\ExileClient_object_player_event_onLeaveSafezone.sqf";
};

class CfgGrinding
{
	// Enables code lock grinding on the server
	enableGrinding = 1;
	
	// Time it takes to grind a fresh lock in minutes
	grindDuration = 25;
	
	// Percentage chance the grinding will fail
	failChance = 25;
	
	// Percentage chance that failing will break your grinder (otherwise it will just remove a battery)
	breakChance = 20;
	
	// Notify the entire server if someone is hacking. 1 == notify, 0 == don't notify
	notifyServer = 1;
	
	// The cooldown time, in minutes, before another server side notification is sent out from a territory. This is on a per territory basis. 
	notificationCooldown = 30;
};
class CfgHacking 
{
	// Enables safe hacking on the server
	enableHacking = 1;
	
	// Time it takes to hack in minutes
	hackDuration = 20;
	
	// Percentage chance the hacking will fail
	failChance = 50;
	
	// Percentage chance the laptop will be removed on fail
	removeChance = 5;
	
	// Max attepts to hack a safe during one restart
	maxHackAttempts = 3;
	
	// Notify the entire server if someone is hacking. 1 == notify, 0 == don't notify
	notifyServer = 1;
	
	// The cooldown time, in minutes, before another server side notification is sent out from a territory. This is on a per territory basis. 
	notificationCooldown = 30;
	
	// The minimal amount of players on the server required in order to hack a safe (set to 0 to disable)
	minPlayers = 1;
	
	// How many safe hacks are allowed to be going at one time
	maxHacks = 5;
	
	// Show a map icon where the hacking is taking place
	showMapIcon = 1;
};

class ExileAbstractAction
{
	title = "";
	condition = "true";
	action = "";
	priority = 1.5;
	showWindow = false;
};

/**
 * Sort this by probability of occurence to speed things up a bit
 */
class CfgInteractionMenus
{
	#include "EBM\menus.hpp"
	
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "call HotWire_PVP_Condition";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
		};
	};

	class Tank
	{
		targetType = 2;
		target = "Tank";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "call HotWire_PVP_Condition";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

		};
	};

	class Air
	{
		target = "Air";
		targetType = 2;

		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "call HotWire_PVP_Condition";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
		};
	};

	class Safe
	{
		targetType = 2;
		target = "Exile_Container_Abstract_Safe";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "call HackLock_PVP_Condition";
				action = "['HackLock', _this select 0] call ExileClient_action_execute";
			};
		};
	};

	class Construction
	{
		targetType = 2;
		target = "Exile_Construction_Abstract_Static";

		class Actions 
		{
			class MakeBoom : ExileAbstractAction
			{
				title = "Plant charge";
				condition = "call PlantCharge_PVP_Condition";
				action = "_this call ExileClient_system_breaching_action";
			};
			
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class GrindLock : ExileAbstractAction
			{
				title = "Grind Lock";
				condition = "call GrindLock_PVP_Condition";
				action = "['GrindLock', _this select 0] call ExileClient_action_execute";
			};
		};
	};

	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";

		class Actions
		{
			/*
			class Manage : ExileAbstractAction
			{
				title = "Manage";
				condition = "true";
				action = "_this call ExileClient_gui_baseManagement_event_show";
			};
			*/
						
			class StealFlag: ExileAbstractAction
			{
				title = "Steal Flag";
				condition = "call FlagSteal_PVP_Condition";
				action = "['StealFlag', _this select 0] call ExileClient_action_execute";
			};

			class RestoreFlag: ExileAbstractAction
			{
				title = "Restore Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',0]) isEqualTo 1)";
				action = "['restoreFlagRequest', [netID ExileClientInteractionObject]] call ExileClient_system_network_send";
			};
		};
	};

	class Boat 
	{
		targetType = 2;
		target = "Ship";

		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "call ScanLock_PVP_Condition";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "call HotWire_PVP_Condition";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
		};
	};