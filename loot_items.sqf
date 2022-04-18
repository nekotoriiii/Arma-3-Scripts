// grab dropped items 
_crate = createVehicle ["Box_Syndicate_Ammo_F", player getPos [2, getDir player]]; 
_crate allowDamage false; 
clearItemCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
_radius = 4000;
_supplies = ((getPos player) nearSupplies _radius) select {  
    (_x isKindOf "Man" && !(alive _x)) ||   
    {(typeOf _x) in (["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder", "Box_IND_Wps_F"])}  
}; 
 
{  
    _lootContainer = _x;  

    _magazines = magazineCargo _lootContainer;  
    if (count _magazines > 0) then {  
        { 
            _crate addMagazineCargoGlobal [_x, 1];  
              
        } forEach _magazines;  
    };  
  
    _backpacks = backpackCargo _lootContainer;  
    if (count _backpacks > 0) then {  
        {  
            _crate addBackpackCargoGlobal [_x, 1];  
        } forEach _backpacks;  
    };  
  
    _items = itemCargo _lootContainer;  
    if (count _items > 0) then {  
        {  
            _crate addItemCargoGlobal [_x, 1];  
        } forEach _items;  
    };  
  
     _weaponsWithAttachments = weaponsItems _lootContainer;  
    if(count _weaponsWithAttachments > 0) then {  
        {  
            _crate addWeaponWithAttachmentsCargoGlobal [_x, 1];  
        } forEach _weaponsWithAttachments;  
    }; 
     
    if(_lootContainer isKindOf "Man") then {  
        _body = _lootContainer;  
  
        _assignedItems = assignedItems _body;  
        if(count _assignedItems > 0) then {  
            {  
                _crate addItemCargoGlobal [_x,1];  
                _body unassignItem _x;  
                _body removeItem _x;  
            } forEach _assignedItems;  
        };  
  
        _bodyMagazines = magazines _body;  
        if (count _bodyMagazines > 0) then {  
            {  
                _crate addMagazineCargoGlobal [_x, 1];  
                _body removeMagazines _x;  
            } forEach _bodyMagazines;  
        };  
  
        _vest = vest _body;  
        if (_vest != "") then {  
            _crate addItemCargoGlobal [_vest,1];  
            removeVest _body;  
        };  
  
        _headgear = headgear _body;  
        if (_headgear != "") then {  
            _crate addItemCargoGlobal [_headgear,1];  
            removeHeadgear _body;  
        };  
  
        _backpack = backpack _body;  
        if (_backpack != "") then {  
            _crate addBackpackCargoGlobal [_backpack,1];  
            removeBackpackGlobal _body;  
        };  
  
        _bodyWeapons = weapons _body;  
        if(count _bodyWeapons > 0) then {  
            {  
                  
                _crate addWeaponCargoGlobal [_x, 1];  
                _body removeWeaponGlobal _x;  
            } forEach _bodyWeapons;  
        };  
  
        removeAllWeapons _body;  
    }; 
     
    deleteVehicle _x; 
     
} forEach _supplies;

_str = composeText ["Loot Script Run! Radius: ", str(_radius),"m" , 
lineBreak, "ACE Interact to Delete the crate!"];
_str remoteExec ["hint", 0];


_action = ["DeleteCrate", "Delete Crate", "", {deleteVehicle _target;}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
