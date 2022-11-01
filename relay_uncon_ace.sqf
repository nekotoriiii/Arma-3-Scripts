/* 
    Relays in system chat that a player is unconscious. Primarily should be used for PVE and casual servers.
    Subsequently, also relays in chat when a player becomes awake.
    Should be placed in initPlayerLocal
*/

[] spawn 
{    
    if (!hasInterface) exitWith {}; // Test for da player

    while {true} do {
    
        // Test for Incap
        // Player switches to CIV when INCAP so keeping current one in storage
        _side = side player;
        while {true} do 
        {
            uiSleep 1;
            if (lifeState player == "INCAPACITATED") then 
            {
                _text = format ["%1 is unconscious!", name player];
                _text remoteExec ["systemChat", _side];

                _dynText = parseText format["<t color='#ff0000'>%1</t><br/>%2", name player, "is down!"];
                [_dynText, 0.5, 1, 3, 1, 0] remoteExec ["BIS_fnc_dynamicText", _side];
                break;
            };
        };
        
        // Now wait until we are conscious
        while {true} do 
        {
            uiSleep 1;
            if (lifeState player == "HEALTHY") then 
            {
                _text = format ["%1 is awake!", name player]; 
                _text remoteExec ["systemChat", _side];

                _dynText = parseText format["<t color='#ff0000'>%1</t><br/>%2", name player, "is awake!"];
                [_dynText, 0.5, 1, 3, 1, 0] remoteExec ["BIS_fnc_dynamicText", _side];
                break;
            };
        };
        // Repeat the cycle anew!
    };
};
