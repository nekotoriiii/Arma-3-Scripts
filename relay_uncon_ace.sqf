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
        while {true} do 
        {
            uiSleep 1;
            if (lifeState player == "INCAPACITATED") then 
            {
                _text = format ["%1 is unconscious!", name player]; 
                _text remoteExec ["systemChat"]; 
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
                _text remoteExec ["systemChat"]; 
                break;
            };
        };
        // Repeat the cycle anew!
    };
};
