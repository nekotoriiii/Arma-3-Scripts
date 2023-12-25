// SOFT CODE VERSION
giveZeus = {
    params ["_unit"];
    _owner = _unit;
    _owner = getPlayerUID _unit;
    
    _group = createGroup sideLogic;
    _zeus = _group createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
    
    missionNamespace setVariable [format ["zeus_%1", _owner], _zeus];
    _zeus setVariable ["owner", _owner, true];
    _zeus setVariable ["Addons", 3, true];
    _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
    _zeus setCuratorCoef ["Place", 0];
    _zeus setCuratorCoef ["Delete", 0];
    _group deleteGroupWhenEmpty true;
};

// Has to be 2 for a server exec only!
[player, giveZeus] remoteExec ["call", 2];
