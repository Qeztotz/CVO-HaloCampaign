// CREATING TEMPORARY FUNCTION

if (isNil "CVO_COMMON_FNC_holdAction_TP") then {
    CVO_COMMON_FNC_holdAction_TP = {
        params [
            ["_door", objNull, [objNull]],
            ["_destination", objNull, [objNull]],
            ["_text", "", [""]]
        ];

        if (isNull _door       ) exitWith {diag_log format ['[CVO](debug)(_fnc_holdAction_Teleport) FAILED - object Null -> _door: %1', _door];};
        if (isNull _destination) exitWith {diag_log format ['[CVO](debug)(_fnc_holdAction_Teleport) FAILED - object Null -> _destination: %1', _destination];};

        private _completion = {
            _this#3 params ["_destination"];
            private _tgtPosASL = getPOSASL _destination;
            private _tgtDIR = getDir _destination;

            // elevates the player 10cm above the tgt to avoid falling through the floor
            _tgtPosASL set [2, _tgtPosASL#2 + 0.1];

            ACE_PLAYER setPosASL _tgtPosASL;
            ACE_PLAYER setDir _tgtDIR;
        };
        
        private _holdAction = "a3\ui_f\data\igui\cfg\holdactions\holdaction_loaddevice_ca.paa";

        [
            _door,                                                          // Object the action is attached to
            _text,                                                          // Title of the action
            _holdAction,                                                    // Idle icon shown on screen
            _holdAction,                                                    // Progress icon shown on screen
            "true",                                                         // Condition for the action to be shown
            "true",                                                         // Condition for the action to progress
            {},																// Code executed when action starts
            {},																// Code executed on every progress tick
            _completion,							                        // Code executed on completion
            {},																// Code executed on interrupted
            [_destination],												    // Arguments passed to the scripts as _this select 3
            3,																// Action duration in seconds
            0,																// Priority
            false,															// Remove on completion
            false,															// Show in unconscious state
            true                                                            // show on screen; if false action needs to be selected from action menu to appear on screen
        ] call  BIS_fnc_holdActionAdd;
    };
};

// USING FUNCTION
[TP_Inbound_Door, TP_Inbound_LZ, "Enter the Base"] call CVO_COMMON_FNC_holdAction_TP;
[TP_Outbound_Door, TP_Outbound_LZ, "Leave the Base"] call CVO_COMMON_FNC_holdAction_TP;