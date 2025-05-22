diag_log "                                                                                                '"; 
diag_log "                                                                                                '"; 
diag_log "============================================================================================================='"; 
diag_log "============================================================================================================='"; 
diag_log "================================================= init.sqf =================================================='"; 
diag_log "============================================================================================================='"; 
diag_log "============================================================================================================='"; 

// enableTeamSwitch false;
if (isServer) then {
_server = "";
	if (isDedicated) then {
	_server = "DEDICATED SERVER";
	} else {
	_server = "HOSTED SERVER";
	};
	diag_log "                                                                                                '";
	diag_log format ["========================== %1 ========================'", _server];
	diag_log "                                                                                                '";

} else {
	diag_log "mission init.sqf =================== CLIENT ========================='";
};

if (isMultiplayer) then {
	waitUntil {count PlayableUnits > 0 };
	diag_log "mission init.sqf =================== PLAYER ENTERED ========================='";
};

if (hasInterface) then {
	waitUntil { findDisplay 1 != displayNull };
	diag_log "mission init.sqf =================== MISSION BRIEF =========================='";
    [] spawn {
        waitUntil {alive player};
        player setVariable ["loadout",getUnitLoadout player,false];
        player addEventHandler ["Respawn", {
            player setUnitLoadout (player getVariable "loadout");
			player enableFatigue false;
        }];
    };
};

// check for ACE medical
if (isClass (configFile >> "cfgPatches" >> "ace_medical")) then {
	diag_log "mission init.sqf +++++++++++ACE MEDICAL+++++++++++++++'";
	Lifeline_RevMethod_CBA = 3;
	_aceversion = [] call ace_common_fnc_getVersion; //unfortunatley gets a string, so need to parse below
	_aceversionarr = _aceversion splitString ".";
	aceversion = (_aceversionarr select 1) + "." +  (_aceversionarr select 2);
	aceversion = parseNumber aceversion;

	if (aceversion >= 16) then {
		diag_log format ["mission init.sqf =====kkkkkkkkkkkkkkkkkkkkkkk NEW ACE version %1 kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk===='", _aceversion];
		oldACE = false;
		fix_medical_fnc_deserializeState = compile preprocessFile "Lifeline_Revive\scripts\ace\fnc_deserializeState3.16.sqf";
	} else {
		diag_log format ["mission init.sqf =====kkkkkkkkkkkkkkkkkkkkkkk OLD ACE version %1 kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk===='", _aceversion];
		oldACE = true;
		fix_medical_fnc_deserializeState = compile preprocessFile "Lifeline_Revive\scripts\ace\fnc_deserializeState3.15.sqf";
	};
	Lifeline_ACEcheck_ = true;

} else {
	diag_log "mission init.sqf =====kkkkkkkkkkkkkkkkkkkkkkkkkkk NO ACE MEDICAL kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk===='";
	Lifeline_ACEcheck_ = false;
};

//check for SOG AI 
if (isClass (configFile >> "cfgPatches" >> "JBOY_SOGAI_mod")) then {
	diag_log "mission init.sqf +++++++++++SOG AI+++++++++++++++ EXISTS'";
	[] spawn {
		waitUntil {(!isNil "jboy_medicStart")};
		jboy_medicStart = compile preprocessFileLineNumbers ("");
	};
};

[] execvm "Lifeline_Revive\SETTINGS.sqf"; 	
// [] execvm "init_LifelineRevive.sqf"; 	

