_act = _this addAction ["Teleport",TR_fnc_teleport, nil, 1.5, true, true, '', "alive _target && speed _target < 3 and!(isObjectHidden _target)", 20];
_this setUserActionText [_act,"Teleport","<img size='2' image='Media\Teleport.paa'/>"];