player addAction ["Virtual Arsenal", {["Open", [true]] spawn BIS_fnc_arsenal}];

player enableFatigue false;
player enableStamina false;
player setCustomAimCoef 0;

private["_keyDown"];
[] spawn {
	private["_i", "_keyDown"];
   	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 22) then {['Open', true] call BIS_fnc_arsenal;}"];
};

// https://community.bistudio.com/wiki/DIK_KeyCodes
