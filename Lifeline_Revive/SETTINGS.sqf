// waitUntil {time > 0};
Lifeline_Version = "Lifeline Revive AI";
Lifeline_Version_no = "2025-05-24 11:41:00";
diag_log "                                                                                                '"; 
diag_log "                                                                                                '"; 
diag_log "============================================================================================================='"; 
diag_log "============================================================================================================='"; 
diag_log "============================================== SETTINGS.sqf ================================================='"; 
diag_log "============================================================================================================='"; 
diag_log "============================================================================================================='"; 

// =============================================================================================================================================================
// ================= SETTINGS ==================================================================================================================================
// =============================================================================================================================================================

// ===== NOTE !!!!! be very careful not to change the */ or /* symbol pairs along the right edge of the page. Breaks script

// 	'Group' means squad or section.

                           																												    /*
____________________________________________________________________________________________________________________________________________

	Select the scope or which units are affected.

	1 = Group
	2 = Playable Slots (plus player group)
	3 = Side
	4 = Choose with menu (won't work with dedicated server)
																																			*/
	Lifeline_Scope = 4; 																													/*
____________________________________________________________________________________________________________________________________________

	Select protection while reviving (and medic within 20 metres of incap). 

	1 = Invincible during revive for both medic and incap. Even bullets won't affect them.
	2 = Semi-Realism mode. The medic is turned pseudo 'captive' to avoid being targeted. 
		Enemy won't target them - however unintended stray bullets or extra damage can still kill either incap or medic.
	3 = Protection Off. Most Realism. Medic can be targeted and killed while reviving. Depends on the enemy.  								*/

	Lifeline_RevProtect = 2;																												/*																
____________________________________________________________________________________________________________________________________________

	AI Self Heal

	0 = Off 
	1 = Anytime 
	2 = No Enemy <100m (line-of-sight) 

	*Note Self healing cannot happen if unit is suppressed > 0.5
																																			*/
	Lifeline_SelfHeal_Cond = 2; 																											/*

================================================================================================================================================================
                 NON-ACE. Custom Medical Model - ignored when ACE is loaded.														                    NON-ACE	 								
================================================================================================================================================================

	Bandage range.  

	Number of bandages is calculated within this range. Calculated using damage.
	i.e. If you have this set to 8, then maximum damage equals 8 bandages. Half damage will equal 4 bandages.
	*Set this to 1 if you want fastest revive: only 1 "bandage" needed regardless of damage.												*/

	Lifeline_BandageLimit = 4; 			// IGNORED FOR ACE VERSION
																																			/*
__________________________________________________________________________________________________________________________________________ 	

	Incapacitate threshold. 
	The damage level that triggers incapacitated state.   
	The lower the theshold, the easier it is to incapacitate. 
	e.g. If you have 0.6, then you only need 0.6 damage to go unconcious.
	(in Arma, damage is from 0-1, with 1 being lethal)																						*/

	Lifeline_IncapThres = 0.7;			// Between 0.5 - 0.8				// IGNORED FOR ACE VERSION																
																																			/*
____________________________________________________________________________________________________________________________________________

	Bleedout time.
	Select how long an INCAPACITATED unit can survive before bleeding out. In seconds
																																			*/
	Lifeline_BleedOutTime = 300; 				// IGNORED FOR ACE VERSION. 	
																																			/*
____________________________________________________________________________________________________________________________________________ 

	Instant death. 
	0 = Off. Only way to die is to bleed out or be hit again when down. Unit will always go into incapacitaded state before eventual bleedout. 
	1 = Moderate. A bit more casual, instant death still happens, such as sniper headshots and explosions.
	2 = Realism. Instant death happens on a realistic level.
																																			*/	
	Lifeline_InstantDeath = 0;  				// IGNORED FOR ACE VERSION.
																																			/*
____________________________________________________________________________________________________________________________________________ 

	Auto recover. % Chance to regain consciousness. 
	Depends on damage also. If you have cardiac arrest, auto revive cannot happen.															*/

	Lifeline_autoRecover = 30; 			// Percentage		// IGNORED FOR ACE VERSION. 
																																			/*
____________________________________________________________________________________________________________________________________________ 

	Cardiac arrest likelihood if damage high enough.	
	*Ignored if Bandage Range = 1, due to CPR not used.																						*/

	Lifeline_CPR_likelihood = 25; 		// Percentage		// IGNORED FOR ACE VERSION. 	
																																			/*
____________________________________________________________________________________________________________________________________________ 

	Cardiac arrest time. (% of Bleedout time)

	If in cardiac arrest and need CPR, then time left 
	before death is now a percentage of Bleedout time above.	
	If you want to ignore this setting, then put it to 100.
	*Ignored if Bandage Range = 1, due to CPR not used.																						*/

	Lifeline_CPR_less_bleedouttime = 60; 	// Percentage	// IGNORED FOR ACE VERSION. 
																																			/*	

================================================================================================================================================================
                 ACE MEDICAL ONLY  																													   ACE ONLY
================================================================================================================================================================

	Bandage method. 

	1. Default ACE bandaging method
	2. Less Bandages required. 
																																			*/
	Lifeline_ACE_Bandage_Method = 2;																										/*
____________________________________________________________________________________________________________________________________________ 

	Disable the ACE blackout screen effect when unconscious - BETA, experimental
																																			*/
	Lifeline_ACE_Blackout = false;																											/*	
____________________________________________________________________________________________________________________________________________ 

	PVE: Limit Enemy Bleedout Time (ACE only)
	Workshop missions often require certain number of enemies killed to 
	complete a task or trigger a script. If you have ACE loaded and 
	the mission is not designed for ACE, you have to wait sometimes ages 
	for enemies to bleedout before the task is triggered.
	This setting limits bleedout time for enemy with ACE medical.
	Set to zero to disable.
	If the mission is PVP, this is bypassed.
	Bewteen 0 - 120
																																			*/
	Lifeline_ACE_OPFORlimitbleedtime = 90;   																								/*	
____________________________________________________________________________________________________________________________________________ 

	Include Civilians for Bleedout Limit Above
																																			*/
	Lifeline_ACE_CIVILIANlimitbleedtime = false;																							/*

================================================================================================================================================================
                 SMOKE   																															     SMOKE   
================================================================================================================================================================

	Chance of smoke, percentage. 																											*/

	Lifeline_SmokePerc = 30;																													/*
____________________________________________________________________________________________________________________________________________

	Chance of smoke, percentage: when enemies are nearby. This over-rides above setting.													*/

	Lifeline_EnemySmokePerc = 70;																											/*
																																			/*
____________________________________________________________________________________________________________________________________________

	Colour of Smoke: random, white, yellow, red, purple, orange or green. 
	Put in quotes.																															*/

	Lifeline_SmokeColour = "random";																										/*

================================================================================================================================================================
                 SOUND   																															 	 SOUND	
================================================================================================================================================================

	Allow radio status messages																												*/

	Lifeline_radio = true;																													/*
____________________________________________________________________________________________________________________________________________

	AI Medic Comments
	Allow AI medics to talk to incapacitated units during revive.																			*/

	Lifeline_MedicComments = true;																											/*
____________________________________________________________________________________________________________________________________________

	Select voice actor accents.

	1 = Mixed - Both USA & British Empire.
	2 = British Empire: British and Australian.
	3 = American. USA.
																																			*/
	Lifeline_Voices = 2;																													/*

================================================================================================================================================================
                 HUD & MAP																															 HUD & MAP
================================================================================================================================================================																																			

	Show distance of medic in bottom right corner.
																																			*/
	Lifeline_HUD_distance = true;
																																			/*
____________________________________________________________________________________________________________________________________________

	Bottom right corner: show which body part is being bandaged (or CPR or blood etc)
																																			*/
	Lifeline_HUD_medical = true;
																																			/*																																			
____________________________________________________________________________________________________________________________________________

	HUD list of incapped units and medics in realtime - top right corner.

	0. Off
	1. Names
	2. Names, distance & bandage
	3. Names & distance
	4. Names & bandage 

	*note. there is an extra option available in debugging, the revive pair timer called 
	'pair timer for HUD list of units'.
	This is the timeout left before resetting the medic. 

	*if ACE is loaded, number of banadages won't show, only namne and/or distance. Coming in future update.
																																			*/
	Lifeline_HUD_names = 3; 																											
																																			/*

	Name Format for above HUD namelist

	1. Full Name
	2. Last Name
	3. Last Name : Group 
	4. Unit No. : Last Name  
	5. Unit No. : Group
	6. Unit No. : Last Name : Group
	7. Unit No. : Full Name : Group 
																																			*/
	Lifeline_HUD_nameformat = 7; 		
																																			/*

	Size of names in HUD list.

	1. Normal
	2. Small
	3. Smaller	                                                                                                                            */
	Lifeline_HUD_namesize = 2; 																												/*

____________________________________________________________________________________________________________________________________________

	Show markers on map of incapacitated and dead
																																			*/
	Lifeline_Map_mark = false; 		
																																			/*
____________________________________________________________________________________________________________________________________________

	Hint message: e.g "Lifeline Revive 45 of 80 units"
	Added Units to scope: top, top right. normal Arma 3 hint. 

	0 = off 
	1 = only at start of mission
	2 = every time a unit is added, anytime in mission
																																			*/
	Lifeline_added_units = 1; 		
																																			/*

================================================================================================================================================================
                 MEDIC SELECTION   																							 				   MEDIC SELECTION
================================================================================================================================================================

	Vehicle and Role Blacklist.
	Units will not be chosen as medic:																										*/	
	Lifeline_Blacklist_Mounted_Weapons = true;  // Any unit using mounted weapons.	This includes gunners of vehicles
	Lifeline_Blacklist_Drivers = true;          // Any unit designated as a pilot or driver
	Lifeline_Blacklist_Armour = true;           // Any unit in armour like tanks and APCs.
	Lifeline_Blacklist_Air = true;              // Any unit in a plane or helicopter
	Lifeline_Blacklist_Car = false;             // Any unit in a car or truck
																																		    /*

	*Note: blacklist is unblocked when MASCAL (mass casualty) has happened.
____________________________________________________________________________________________________________________________________________

	Distance Range.

	Only units within this range will be selected as a medic. (distance from the incapacitated unit)                 						*/

	Lifeline_LimitDist = 1000;			// in metres																									
	                                                                                                                                        /*
____________________________________________________________________________________________________________________________________________

	Numerical limits

	This is to keep combat effectiveness up.
	Limit maximum number of medics in action at any one time.
	Less medics in action = more firepower.

   -1 = No limits. Any in Scope ('Scope' is set above)
	0 = Any amount from Group. Incapacated will only get medics from their group.
	1 = 1 per Group
	2 = 2 per Group
	3 = 3 per Group
	4 = 1 per group + any not in combat
	5 = 2 per group + any not in combat
	6 = 3 per group + any not in combat             					
																																			*/

	Lifeline_Medic_Limit = 0;																												

	                                                                                                                                        /*
	*Note: these limits and the blacklist above are unblocked when MASCAL (mass casualty) has happened.		
____________________________________________________________________________________________________________________________________________

	Vanilla Medic ALways
	Always force the vanilla Arma 3 medic to be used.    
	*Note If you want only the vanilla Arma 3 medic in action, then set this to 'true' and choose "1" from 'Numerical Limits' above.

	*Note if there is no vanilla Arma 3 medic in the squad, then the trait will be set to last unit in squad.
	            																															*/

	Lifeline_Dedicated_Medic = false;																										/*
____________________________________________________________________________________________________________________________________________

	Medic Hit the Dirt
	1 = When enemy is nearby < 500m
	2 = When enemy is is view & < 500m
	3 = Random of the above two options
	            																															*/

	Lifeline_EnemyCloseByType = 1;																											
	                                                                                                                                        /*

================================================================================================================================================================
                 OPFOR - PVE           * for PVP games these settings are ignored and same settings for both sides are used   					   OPFOR - PVE														
================================================================================================================================================================

	Include OPFOR in Revive
																																			*/
	Lifeline_Include_OPFOR = false;																											/*

____________________________________________________________________________________________________________________________________________

	Instant death for OPFOR (non-ACE)
	0 = Off. Only way to die is to bleed out or be hit again when down. Unit will always go into incapacitaded state before eventual bleedout. 
	1 = Moderate. A bit more casual, instant death still happens, such as sniper headshots and explosions.
	2 = Realism. Instant death happens on a realistic level.
																																			*/	
	Lifeline_InstantDeathOPFOR = 2;  // IGNORED FOR ACE VERSION.																		
																																			/*

____________________________________________________________________________________________________________________________________________

	Idle Crouch. When a unit is standing and idle, it will temporarily go into "crouch" mode.
				                                                                                                                            */
	Lifeline_Idle_CrouchOPFOR = false;
																																		    /*
================================================================================================================================================================
                 BONUS. Not related to reviving, but very useful for workshop missions.  															     BONUS								
================================================================================================================================================================

	Hotwire vehicles.

	In many workshop missions, there are locked vehicles you cannot access. (basically "props")
	Now you can hotwire them if you have a toolkit. 
	However, you need access to the ignition, and for enclosed vehicles, you need to break in first.  
	You might need to smash a window to get in.
	Obviously this does not apply to open-top vehicles or motorbikes.
	If you cannot break in, then its security is too good, and you cannot hotwire.

	Armoured units ignored. 
																																			*/
	Lifeline_Hotwire = true;																												/*
____________________________________________________________________________________________________________________________________________ 

	Make all your squad explosive specialists.
	It is frustrating when you accidently plant a bomb you cannot undo it.  This fixes that.
	This only changes the combat role (or trait), it does not add any gear.
	You still need a toolkit to deactivate bombs and mines.
																																			*/
	Lifeline_ExplSpec = true;																												/*

____________________________________________________________________________________________________________________________________________ 

	Auto Crouch. (aka Tactical Crouch)
	When a unit is standing and idle, it will temporarily go into tactical "crouch" mode.
	This adds to immersion. Units on a mission don't usually stand around upright like sniper fodder.

	A unit will go back to upright when it moves.
	This is not the same as giving a "crouch" order. It's only crouching when idle.

	*This only applies to "aware" behaviour mode and posture set to "auto" - other modes need freedom to do whatever.	
																																			*/
	Lifeline_Idle_Crouch = true;																											
	Lifeline_Idle_Crouch_Speed = 1;  //speed for triggering "crouch". 0 = not moving. 1-5 is 'very slow' to 'slow'
																																			/*
____________________________________________________________________________________________________________________________________________ 

	Only Show ACE Blufor Tracker with GPS.      (ACE only. Under this heading as its a bonus feature)
	The default ACE Blufor tracker shows even without a GPS. Unrealistic.
	This option means ACE Blufor tracking will only show if you have a GPS.
	You still need Blue Force tracking enabled in ACE settings.

	0 = ACE default (show regardless of GPS)
	1 = Only w GPS unit
	2 = Only w GPS minimap on
																																			*/
	Lifeline_ACE_BluFor = 1;																												/*

================================================================================================================================================================
                 ADVANCED   																													      ADVANCED
================================================================================================================================================================

	AI skill level. The skill level of AI in your squad or side. From 0 to 1.  0 means ignore and use mission setting.						*/

	Lifeline_AI_skill = 1;																													/*
 ____________________________________________________________________________________________________________________________________________

	Fatigue. (non ACE)
	0. Mission Settings.
	1. Enabled.
	2. Disabled.
																																			*/
	Lifeline_Fatigue = 2;																													/*

____________________________________________________________________________________________________________________________________________

	Countdown display for bleedout - when it should start. This may differ from actual bleedout time.

	Example: you could have bleedout time set to 300, but countdown display set to 60. 
	This means the countdown display will appear when you have 60 seconds left.

	0 = turn off.																															*/

	Lifeline_cntdwn_disply = 300;																											/*

================================================================================================================================================================
                 DEBUGGING  																														 DEBUGGING
================================================================================================================================================================
																																			*/
	Lifeline_Revive_debug = false; 																											/*

____________________________________________________________________________________________________________________________________________

	Animation method for revive when prone. This has been difficult to find the right animation to work, so two options:

	0: Old: Smoother animation but busier with the weapon always pulled out between bandages, and takes longer to revive.
	1: New method, no weapon pulled out between bandages - but due to arma bugs - there is a animation jump in the loop (frame jump)		*/

	Lifeline_Anim_Method = 1;																												/*

____________________________________________________________________________________________________________________________________________

	Sometime AI in Arma is retarded. This stops them being idle after 6 seconds
																																			*/
	Lifeline_Idle_Medic_Stop = true;																										/*

____________________________________________________________________________________________________________________________________________

	This adds a tiny display of the 30 second timer to the medic in the HUD list of revive pairs. 
	Usually 30 seconds each incap + medic pair.
	Its a safeguard against medics not making it. 
																																			*/
	Lifeline_HUD_names_pairtime = false;																										/*

____________________________________________________________________________________________________________________________________________ 

	Include OPFOR in HUD list of revive pairs.
	When you include OPFOR for revive, you can turn this on to show the OPFOR HUD list.										
																																			*/
	Lifeline_ShowOpfor_HUDlist = false;																										/*

____________________________________________________________________________________________________________________________________________ 
	BETA version of medic journey to incap.
	Still not 100% convinced with my new code for the final 20 metres of medic getting to incap. 

	*NOTE set this to 'true' for dedicated servers. It seems to work better.									
																																			*/
	Lifeline_StartReviveBETA = true; 																										/*	

____________________________________________________________________________________________________________________________________________ 

//=============================================================================================================================================================
//=========================== DO NOT CHANGE BELOW HERE ========================================================================================================
//=============================================================================================================================================================

*/

Lifeline_mod = false;
[] execvm "Lifeline_Revive\scripts\server_or_mission_only.sqf"; 	// this declares variables that a mod version usually does
[] execvm "Lifeline_Revive\scripts\fix_other_revive_systems.sqf"; 	// main startup script
