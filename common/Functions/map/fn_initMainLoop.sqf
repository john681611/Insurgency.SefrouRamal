private _loopCount = 1;
listeners = [];
publicVariable "listeners";
while {{captive (_x select 0)} count hostages > 0 or {alive (_x select 0)} count ammoCaches > 0} do {
	listeners = listeners select {alive (_x select 0)  && {!(isObjectHidden (_x select 0))}};
	publicVariable "listeners";
	if(_loopCount == 1) then {
		call TR_fnc_activeAreaPass;
	};
	[] spawn TR_fnc_liseningPass;
	[] spawn TR_fnc_combatPass;
	if(_loopCount == 3) then {
		_loopCount = 0;
	};
	_loopCount = _loopCount + 1;
	sleep 3;
};

if(savedhostagesCount > 3) exitWith {
	["TK1","Succeeded"] call BIS_fnc_taskSetState;
	profilenamespace setVariable [(format["InsurgencySave%1",worldName]), nil];
	"END1" call BIS_fnc_endMissionServer;
};
["TK1","Failed"] call BIS_fnc_taskSetState;
profilenamespace setVariable [(format["InsurgencySave%1",worldName]), nil];
"endLose" call BIS_fnc_endMissionServer;


