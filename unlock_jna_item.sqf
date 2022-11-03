_wep = primaryWeapon player;
_mag = primaryWeaponMagazine player;
_attachments = primaryWeaponItems player;
_toUnlock = [_wep] + _mag + _attachments;
//_toUnlock


{
    _arsenalTab = (_x) call jn_fnc_arsenal_itemType;
    
    [_arsenalTab, _x, -1] call jn_fnc_arsenal_addItem;
} forEach _toUnlock;

// With Vindicta, it's [_object, _arsenalTab, _x, -1]
// With AntiStasi, it's [_arsenalTab, _x, -1]
