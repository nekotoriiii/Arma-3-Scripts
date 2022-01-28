// TP Player to Me
_player = "Kuro"; // Change to player name
_players = call BIS_fnc_listPlayers;

_action = {
    params ["_players", "_player"];
    
    {
        if ((name _x) == _player) then {
            (vehicle _x) setPos (getPos player);
            break;
        };    
    } forEach _players;
};

[_players, _player] call _action;

-----------------

// TP on Map
_action = {
    params ["_object"];
    
    object = _object;
    OpenMap true;
    
    onMapSingleClick { 
        onMapSingleClick {}; 
        (object) setPos _pos;
        openMap false;
    };
};

[player] call _action;

-----------------

// Heal Player
[ player ] call ace_medical_treatment_fnc_fullHealLocal;

-----------------

// Create ACE Arsenal
// IG_supplyCrate_F - Ideal Arsenal Vehicle

_arsenal = createVehicle ["IG_supplyCrate_F", player getPos [10, getDir player]];

[_arsenal, true, true] call ace_arsenal_fnc_initBox;

-----------------

// Add Ace Arsenal to Self Interact -> Equipment 
_statement = {[player, player, true] call ace_arsenal_fnc_openBox};

_condition = {true};

_action = ["Open Arsenal", "Arsenal", "", _statement, _condition] call ace_interact_menu_fnc_createAction;

-----------------

// Remove ACE Arsenal from Self Interact -> Equipment
[(typeOf player),1,["ACE_SelfActions","ACE_Equipment","Open Arsenal"]] call ace_interact_menu_fnc_removeActionFromClass;

-----------------

