#include "script_component.hpp"

private _house = lineIntersectsSurfaces [getPosWorld player, getPosWorld player vectorAdd [0,0,50], player, objNull, true, 1, "GEOM", "NONE"];

if (_house isEqualTo []) then {
    _house = [[0,0,GVAR(machine),GVAR(machine)]]
};

GVAR(posType) = "";

if (!(GVAR(posType) isEqualTo "indoors") && {((_house select 0) select 3) isKindOf "house"}) then {
	GVAR(posType) = "indoors";
} else {
	if (!(GVAR(posType) isEqualTo "under_water") && {(getPosASL player select 2 < 0)} && {(getPosASL player select 2 > -3)}) then {
		GVAR(posType) = "under_water";
	} else {
		if (!(GVAR(posType) isEqualTo "deep_sea") && {getPosASL player select 2 < -3}) then {
			GVAR(posType) = "deep_sea";
		} else {
			if (!(GVAR(posType) isEqualTo "player_car") && {(player != vehicle player)} && {(getPosASL player select 2 > 0)}) then {
				GVAR(posType) = "player_car";
			};
		};
	};
};

[GVAR(posType),_house] call FUNC(snowFX);
