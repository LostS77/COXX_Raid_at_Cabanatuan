#include "script_component.hpp"

private _version = 0.2;

["Hostage", "Allows the mission maker to easily add hostages to their missions.", "Starfox64, StatusRed &amp; PiZZADOX", _version] call FUNC(RegisterModule);

[QGVAR(ACEActionsEvent), {
    params ["_unit"];
    private _condition = {
        params ["_target", "_player"];
        (!(GETVAR(_target,IsRescued,false))
        && {!(GETVAR(_target,IsUntied,false))}
        && {_target call EFUNC(FW,isAlive)})
    };
    private _statement = {
        params ["_target", "_player"];
        [_target,_player] call FUNC(rescueHostage);
    };
    private _rescueaction = ["RescueHostage", "Untie Hostage","",_statement,_condition] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _rescueaction] call ace_interact_menu_fnc_addActionToObject;
}] call CBA_fnc_addEventHandler;
