// Add Admin Menu
_action = ["Admin", "Admin", ""] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// ----------- 
// Add TP on Map

action1 = {
	params ["_object"];
	
	object = _object;
	OpenMap true;
	
	onMapSingleClick { 
		onMapSingleClick {}; 
		(object) setPos _pos;
		openMap false;
	};
};

_statement = {[(vehicle player)] call action1};

_condition = {true};

_action = ["TP on Map", "TP on Map", "", _statement, _condition] call ace_interact_menu_fnc_createAction;

	[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ----------- 
// Add Arsenal for Self

_statement = {[player, player, true] call ace_arsenal_fnc_openBox};

_condition = {true};

_action = ["Open Arsenal", "Arsenal", "", _statement, _condition] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// -----------
// Heal Only You

_statement = {[player] call ace_medical_treatment_fnc_fullHealLocal;};

_condition = {true};

_action = ["Heal Player", "Heal Player", "", _statement, _condition] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ----------- 
// Rearm Vehicle

_statement = {(vehicle player) setVehicleAmmo 1};

_action = ["Resupply Vehicle", "Resupply Vehicle", "", _statement, {true}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// -----------
// Refuel Vehicle

_statement = {(vehicle player) setFuel 1};

_action = ["Refuel Vehicle", "Refuel Vehicle", "", _statement, {true}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// -----------
// Fix Vehicle

_statement = {(vehicle player) setDamage 0};

_action = ["Fix Vehicle", "Fix Vehicle", "", _statement, {true}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ---
// Create Arsenal

_statement = {
	_arsenal = createVehicle ["IG_supplyCrate_F", player getPos [3, getDir player]];
	
	[_arsenal, true, true] call ace_arsenal_fnc_initBox;
	
};

_action = ["Make ACE Arsenal", "Make ACE Arsenal", "", _statement, {true}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ---
// TP to player

_condition = {
	true
};

_statement = {};

_insertChildren = {
	private _players = allPlayers;
	
	private _actions = [];
	{
		private _childStatement = 
		{
			systemChat str(_this);
			(vehicle player) setPos (getPos (_this select 2));
		};
		private _action = [format ["TP to %1", name (_x)], format ["TP to %1", name (_x)], "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, []];
	} forEach _players;
	
	_actions
};

_action = ["TPToPlayer", "TP to Player", "", _statement,_condition,_insertChildren] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ---
// TP player to me

_condition = {
	true
};

_statement = {
	
};

_insertChildren = {
	private _players = allPlayers;
	
	private _actions = [];
	{
		private _childStatement = 
		{
			systemChat str(_this);
			(vehicle (_this select 2)) setPos (getPos player);
		};
		private _action = [format ["TP %1 to you", name (_x)], format ["TP %1 to you", name (_x)], "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, []];
	} forEach _players;
	
	_actions
};

_action = ["TPToYou", "TP to You", "", _statement,_condition,_insertChildren] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// ---
